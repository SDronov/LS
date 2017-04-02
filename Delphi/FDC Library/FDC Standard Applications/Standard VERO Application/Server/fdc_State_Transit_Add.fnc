create or replace function fdc_State_Transit_Add
-- Создает новое правило перехода состояний объекта и возвращает его идентификатор
	(
	  pObject_Type_SysName varchar2,   -- системное имя объектного типа
	  pName	varchar2,                  -- название
	  pSysName varchar2,               -- системное имя перехода
	  pState_Scheme_ID number,         -- идентификатор схемы состояний
	  pSrc_State_ID number,            -- идентификатор исходного состояния объекта (до перехода)
	  pDst_State_ID number,            -- идентификатор целевого состояния объекта (после перехода)
	  pBefore_Procedure_ID number,     -- идентификатор процедуры, которая вызывается перед переходом
	  pAfter_Procedure_ID	number,      -- идентификатор процедуры, которая вызывается после перехода
    pShortName varchar2 := null,     -- короткое название
	  pDescript varchar2 := null       -- описание
	)
    return number
is
  pNewID number(15);
  pSch1 number(15) := null;
  pSch2 number(15) := null;
begin
  -- Проверяем, что или исходное, или целевое состояние задано
  if (pSrc_State_ID is null) and (pDst_State_ID is null) then
	   fdc_util.abort('Должно быть задано либо исходное либо целевое состояние');
  end if;

  -- Проверяем, что начальное и целевое состояния не совпадают
  if (pSrc_State_ID = pDst_State_ID) then
	   fdc_util.abort('Исходное и целевое состояния не должны совпадать');
  end if;

  -- Если задано исходное состояние, то проверяем его
  if (pSrc_State_ID is not null) then
     begin
       -- ищем его схему состояний
	     select	State_Scheme_ID
	       into	pSch1
	       from	fdc_State
	      where	ID = pSrc_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('Не найдено исходное состояние перехода по ID = ' || pSrc_State_ID);
  	   when others then fdc_util.abort('Ошибка получения исходного состояния перехода по ID = ' || pSrc_State_ID, 1);
     end;
     
     -- проверяем
     if (pSch1 <> pState_Scheme_ID) then
        fdc_util.abort('Исходное состояние перехода и сам переход принадлежат разным схемам! Ошибка вызова!'); 
     end if;   
  end if;

  -- Если задано целевое состояние, то проверяем его
  if (pDst_State_ID is not null) then
     begin
       -- ищем его схему состояний
	     select	State_Scheme_ID
	       into	pSch2
	       from	fdc_State
	      where	ID = pDst_State_ID;
     exception
	     when NO_DATA_FOUND then fdc_util.abort('Не найдено целевое состояние перехода по ID = ' || pDst_State_ID);
  	   when others then fdc_util.abort('Ошибка получения целевого состояния перехода по ID = ' || pDst_State_ID, 1);
     end;   
     
     -- проверяем
     if (pSch2 <> pState_Scheme_ID) then
        fdc_util.abort('Целевое состояние перехода и сам переход принадлежат разным схемам! Ошибка вызова!'); 
     end if;
  end if;

  -- Проверка, что pObject_Type_SysName - потомок 'StateTransit'
  fdc_Object_Type_Is(pObject_Type_SysName,'StateTransit');

  -- Создаем объект перехода
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, pState_Scheme_ID, pSysName, pShortName, pDescript);

  -- Заносим запись в таблицу fdc_State_Transit
  insert into fdc_State_Transit(ID, State_Scheme_ID, Src_State_ID, Dst_State_ID, Before_Procedure_ID, After_Procedure_ID)
       values(pNewID, pState_Scheme_ID, pSrc_State_ID, pDst_State_ID, pBefore_Procedure_ID, pAfter_Procedure_ID);

  -- Возвращаем идентификатор перехода     
  return pNewID;
end fdc_State_Transit_Add;
/
