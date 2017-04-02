create or replace procedure fdc_Value_Del
-- Удаление дополнительного атрибута
	(
	  pID number,           -- идентификатор атрибута
    pDoLog number := 1    -- Логировать ли событие удаления объекта 
                          -- (создавать ли Event?)
                          -- по умолчанию логировать (значение 1)
                          -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Value
  delete from fdc_Value
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);
end fdc_Value_Del;
/
