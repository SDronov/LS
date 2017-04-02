create or replace procedure fdc_Object_Kind_Del
-- Удаление пометки объекта
	(
	  pID number,            -- идентификатор пометки объекта
    pDoLog number := 1     -- Логировать ли событие удаления объекта 
                           -- (создавать ли Event?)
                           -- по умолчанию логировать (значение 1)
                           -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Task
  delete from fdc_Object_Kind
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);
end fdc_Object_Kind_Del;
/
