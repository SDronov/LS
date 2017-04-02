create or replace function fdc_Object_Add
-- Создание нового объекта
-- Возвращает его идентификатор
	(
	  pObject_Type_SysName  varchar2, -- системное имя объектного типа
	  pName  varchar2 := null,        -- название
	  pAccessLevel number := 2,       -- уровень общего доступа (0 - нет доступа, 1 - только чтение, 2 - изменение, 3 - изменение прав доступа) 
    pOwner_Object_ID number := null,-- идентификатор объекта-владельца        
	  pSysName		varchar2 := null,   -- системное имя объекта
    pShortName   varchar2 := null,  -- короткое название
	  pDescript		varchar2 := null    -- описание
	)
  return number
is
  pNewID number(15);
  pObjectTypeID number(15);
  pCnt number(15);
begin
  -- проверяем относится ли объект к заданному типу
  -- если нет, то исключение
  fdc_Object_Type_Is(pObject_Type_SysName,'Object');

  -- получение идентификатора типа по его системному имени  
  pObjectTypeID := fdc_Object_Type_Get_BySysName(pObject_Type_SysName);

  -- получение нового значения идентификатора
  pNewID := fdc_Object_Get_NewKey;
  
  -- добавляем запись в таблицу
  insert into fdc_Object(ID, Object_Type_ID, Name, ShortName, AccessLevel, SysName, Descript, Owner_Object_Id)
     values(pNewID, pObjectTypeID, trim(pName), trim(pShortName), pAccessLevel, trim(pSysName), trim(pDescript), pOwner_Object_ID);

  return pNewID;
exception
  when others then
    Fdc_Util.Abort('Не прошло добавление объекта '||pName||':', 1);      
end fdc_Object_Add;
/
