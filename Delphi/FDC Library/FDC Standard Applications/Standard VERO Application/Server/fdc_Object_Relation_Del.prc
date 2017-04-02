create or replace procedure fdc_Object_Relation_Del
-- Удаляет отношение между объектами
	(
	  pID number,                -- идентификатор отношения
    pDoLog number := 1         -- Логировать ли событие удаления объекта 
                               -- (создавать ли Event?)
                               -- по умолчанию логировать (значение 1)
                               -- при значении 0 логировать не надоpID number
	)
is
begin
  -- удаление записи из таблицы Fdc_Object_Relation
  delete from Fdc_Object_Relation
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);

end fdc_Object_Relation_Del;
/
