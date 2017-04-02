create or replace package FDC_UTIL as
-- Общие сервисные функции и процедуры,
-- используемые в коде серверных процедур и функций
-- По возможности в тексте пакета не следует сылаться на процедуры, функции и представления
-- чтобы избежать циклических ссылок

--------------------------------------------------------------------------------------------------------------
-- Abort
-- Стандартное возбуждение сообщения об ошибке
-- применяется при инициализации ошибок и в обработчиках ошибок
procedure Abort (
	pMessage 	varchar2,       -- pMessage - прикладное сообщение об ошибке
	pAddSQLErrM	number := 0,  -- pAddSQLErrM - включать ли в сообщение текущую ошибку от сервера БД
  pCode number := null      -- pCode - код сообщения об ошибке, по умолчанию -20001 либо код оракловой ошибки
  );
  
--------------------------------------------------------------------------------------------------------------
-- Schema
-- Владелец схемы данных системы
function Schema return varchar2;

--------------------------------------------------------------------------------------------------------------
-- Exec
-- Динамическое исполнение команды или SQL-выражения, или блока
procedure Exec
	(
	pSQL varchar2             -- Выражение для динамического исполнения
	);
  
end FDC_UTIL;
/
create or replace package body fdc_Util as

--------------------------------------------------------------------------------------------------------------
-- Foreign_Key_Message 
-- Выдача сообщения по внешнему ключу () "в логике"
-- Вытаскивает из БД логические имена таблиц, связанных внешним ключем
-- Возвращает соответствующее сообщение
function Foreign_Key_Message (	
  pConstraintName varchar2, -- Наименование внешнего ключа в БД
	pDelete number := 1       -- Требуется ли сообщение по поводу удаления родительской записи
  )      
  return varchar2 is 
Result varchar2(4000);

pName	varchar2(4000);
pRName	varchar2(4000);
begin
  pName  := '?';
  pRName := '?';
  begin
    select case when PT.Name is null then C.Table_Name else PT.Name end as Name,
    	     case when RT.Name is null then CC.Table_Name else RT.Name end as RName
    into	pName,pRName
    from 	All_Constraints C,
    	    All_Constraints CC,
    	    fdc_Table PT,
          fdc_Table RT
    where	C.Owner = Schema and
    	    C.Constraint_Type = 'R' and
          C.Constraint_Name = pConstraintName and
          CC.Constraint_Name = C.R_Constraint_Name and
          CC.Owner = Schema and
          upper(PT.TableName(+)) = C.Table_Name and
    	    upper(RT.TableName(+)) = CC.Table_Name;
  exception when others then null;
  end;
  Result := '"'||pName||'" ссылается на  "'||pRName||'".';
  if pDelete = 1 then
  	Result := 'Нельзя удалить запись "'||pRName||'" т.к. существует запись "'||pName||'", которая на нее ссылается.';
  end if;
  return Result;
end Foreign_Key_Message;

--------------------------------------------------------------------------------------------------------------
-- ConstraintNameBySQLErrm 
-- Получение имени внешнего ключа из сообщения об ошибке ссылочной целостности ORA-02292
function ConstraintNameBySQLErrm 
  (
  pSqlerrm  varchar2                          -- Сообщение об ошибке ORA-02292
  )
return varchar2 is
  pSubstr varchar2(1500);
  pStartPos number;
  pStopPos number;
  Result varchar2(4000) := null;
begin
  -- Реализация основывается на том, что в сторке сообщения об ошибке ссылочной целостности
  -- присутствует подстрока типа '(VERO.DICT_ID)', где 
  -- VERO - имя схемы приложения,
  -- DICT_ID - наименование ключа
  pSubstr := '('||Schema||'.';
  -- Получение позиции начала имени ключа в строке сообщения об ошибке
  pStartPos := instr(pSqlerrm,pSubstr);
  -- Если нет подстроки типа '(<схема>.' - значит в сообщении нет и имени ключа, 
  -- возвращаем null
  if pStartPos = 0 then 
    return null;
  end if;
  -- Позиция окончания имени ключа в строке сообщения об ошибке
  -- (это позиция закрывающей скобки)
  pStopPos := instr(pSqlerrm,')',pStartPos+length(pSubstr));
  -- Вычленяем подстроку, содержащую имя ключа
  Result := substr(pSqlerrm,pStartPos+length(pSubstr),pStopPos - (pStartPos+length(pSubstr)));
  return Result;
end; 
  
  
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- Abort
-- Стандартное возбуждение сообщения об ошибке
-- применяется при инициализации ошибок и в обработчиках ошибок
procedure Abort (
	pMessage 	varchar2,       -- pMessage - прикладное сообщение об ошибке
	pAddSQLErrM	number := 0,  -- pAddSQLErrM - включать ли в сообщение текущую ошибку от сервера БД
                            -- 1 - включать,
                            -- 0 - не включать
  pCode number := null      -- pCode - код сообщения об ошибке, по умолчанию -20001 либо код оракловой ошибки
  ) is
pMess	varchar2(4000);
pResCode	number := null;
pPref	varchar2(1500);
pConsName varchar2(1500);
begin
  pMess := pMessage;
  if sqlcode <> 0 then
    if pAddSQLErrM = 1 then
    	pMess := pMess ||chr(10)||sqlerrm;
      -- Обработка нарушения ссылочной целостности
      if sqlcode = -2292 then
      	pMess :=  pMess||chr(10)||Foreign_Key_Message(ConstraintNameBySQLErrm(sqlerrm),1);
      end if;
    end if;
  end if; -- sqlcode <> 0 
  pResCode := nvl(pCode, -20201);
  Raise_application_error(pResCode,pMess);
end Abort;

--------------------------------------------------------------------------------------------------------------
-- Schema
-- Владелец схемы данных системы
function Schema return varchar2 is
begin
  return sys_context('USERENV', 'CURRENT_USER');
end;

--------------------------------------------------------------------------------------------------------------
-- Exec
-- Динамическое исполнение команды или SQL-выражения, или блока
procedure Exec
	(
	pSQL varchar2             -- Выражение для динамического исполнения
	)
is
begin
  execute immediate pSQL;
exception 
  when others then 
    Abort('Ошибка динамического исполнения выражения'||chr(10)||pSQL||chr(10), 1);
end;

end FDC_UTIL;
/
