create or replace procedure fdc_Object_Relation_Upd
-- Изменяет отношение между объектами
	(
    pID number,                     -- идентификатор отношения 
    pName varchar2,                 -- название
	  pObject_ID number,              -- идентификатор объекта 
    pRel_Object_Id number,          -- идентификатор объекта, с которым устанавливается отношение
    pRole varchar2,                 -- роль
    pBackwardRole varchar2,         -- обратная роль
    pShortName varchar2,            -- короткое название
	  pDescript	varchar2              -- описание
  )  
is
  pNewID number;
begin
  -- вызов базовой процедуры изменения объекта
  fdc_Object_Upd(pID, pName, pShortName, pDescript);

  -- Изменяем Fdc_Object_Relation  
  update Fdc_Object_Relation
     set Object_ID = pObject_ID,
         Rel_Object_ID = pRel_Object_ID,
         Role = pRole,
         BackwardRole = pBackwardRole
   where ID = pID;  
  
end fdc_Object_Relation_Upd;
/
