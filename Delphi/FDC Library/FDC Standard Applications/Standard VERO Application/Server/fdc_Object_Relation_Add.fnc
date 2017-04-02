create or replace function fdc_Object_Relation_Add
-- Добавляет новое отношение между объектами
	(
	  pObject_Type_SysName varchar2,  -- системное имя объектного типа
    pName varchar2,                 -- название
	  pObject_ID number,              -- идентификатор объекта 
    pRel_Object_Id number,          -- идентификатор объекта, с которым устанавливается отношение
    pRole varchar2,                 -- роль
    pBackwardRole varchar2,         -- обратная роль
    pShortName varchar2 := null,    -- короткое название
	  pDescript	varchar2 := null      -- описание
  )
    return number
is
  pNewID number;
begin
  -- Проверка, что pObject_Type_SysName - потомок 'ObjectRelation'
  fdc_Object_Type_Is(pObject_Type_SysName,'ObjectRelation');

  -- Создаем новый объект атрибута
  pNewID := fdc_Object_Add(pObject_Type_SysName, pName, 2,
                     null, null, pShortName, pDescript);

  -- Заносим запись в таблицу Fdc_Object_Relation                    
  insert into Fdc_Object_Relation(Id, Object_Id, Rel_Object_Id, Role, Backwardrole)
       values (pNewId, pObject_Id, pRel_Object_Id, pRole, pBackwardrole);

  -- Возвращаем идентификатор  
  return pNewId;
end;
/
