create or replace procedure fdc_Procedure_Del
-- Удаление процедуры
	(
	  pID number,             -- идентификатор процедуры
    pDoLog number := 1      -- Логировать ли событие удаления объекта 
                            -- (создавать ли Event?)
                            -- по умолчанию логировать (значение 1)
                            -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_Procedure
  delete from fdc_Procedure
      where ID = pID;

  -- вызов базовой процедуры удаления серверной компоненты    
  fdc_Server_Component_Del(pID, pDoLog);
end fdc_Procedure_Del;
/
