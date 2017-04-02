create or replace procedure fdc_Kind_Del
-- Удаление пометки
	(
	  pID number,                -- идентификатор пометки
    pDoLog number := 1         -- Логировать ли событие удаления объекта 
                               -- (создавать ли Event?)
                               -- по умолчанию логировать (значение 1)
                               -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Kind
  delete from fdc_Kind
      where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      
end fdc_Kind_Del;
/
