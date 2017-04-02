create or replace procedure fdc_State_Del
-- Удаление состояния
	(
	  pID number,           -- идентификатор состояния
    pDoLog number := 1    -- Логировать ли событие удаления объекта 
                          -- (создавать ли Event?)
                          -- по умолчанию логировать (значение 1)
                          -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_State
  delete from fdc_State
     where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);
end fdc_State_Del;
/
