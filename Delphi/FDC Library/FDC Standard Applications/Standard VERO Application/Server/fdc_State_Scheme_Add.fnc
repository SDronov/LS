create or replace function fdc_State_Scheme_Add
-- Создает новую схему состояний и возвращает ее идентификатор
	(
	  pObject_Type_SysName varchar2,  -- системное имя объектного типа схемы
	  pName	varchar2,                 -- название
    pShortName varchar2 := null,    -- короткое название
	  pDescript varchar2 := null      -- описание
	)
    return number
is
  pNewID number(15);
  pEvent_ID number(15);
begin
  -- Проверка, что pObject_Type_SysName - потомок 'StateScheme'
  fdc_Object_Type_Is(pObject_Type_SysName,'StateScheme');

  -- Создаем объект схемы состояний
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 1, null, null, pShortName, pDescript);

  -- Заносим запись в таблицу fdc_State_Scheme
  insert into fdc_State_Scheme(ID)
       values(pNewID);

  -- Возвращаем идентификатор схемы     
  return pNewID;
end fdc_State_Scheme_Add;
/
