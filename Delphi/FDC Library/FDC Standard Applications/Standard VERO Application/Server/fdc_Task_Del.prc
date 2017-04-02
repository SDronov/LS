create or replace procedure fdc_Task_Del
-- Удаление задачи
	(
	  pID number,                -- идентификатор задачи
    pDoLog number := 1         -- Логировать ли событие удаления объекта 
                               -- (создавать ли Event?)
                               -- по умолчанию логировать (значение 1)
                               -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Task
  delete from fdc_Task
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);
end fdc_Task_Del;
/
