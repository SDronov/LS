create or replace procedure fdc_Server_Component_Del
-- Удаление системной компоненты
	(
	  pID number,           -- идентификатор компоненты
    pDoLog number := 1    -- Логировать ли событие удаления объекта 
                          -- (создавать ли Event?)
                          -- по умолчанию логировать (значение 1)
                          -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Server_Component
  delete from fdc_Server_Component
     where ID = pID;

  -- вызов базовой процедуры удаления системной компоненты       
  fdc_SysComponent_Del(pID, pDoLog);
end fdc_Server_Component_Del;
/
