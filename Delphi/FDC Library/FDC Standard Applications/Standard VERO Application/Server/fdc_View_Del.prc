create or replace procedure fdc_View_Del
-- Удаление представления
	(
	  pID number,            -- идентификатор представления
    pDoLog number := 1     -- Логировать ли событие удаления объекта 
                           -- (создавать ли Event?)
                           -- по умолчанию логировать (значение 1)
                           -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_View
  delete from fdc_View
      where ID = pID;

  -- вызов базовой процедуры удаления серверной компоненты      
  fdc_Server_Component_Del(pID, pDoLog);
end fdc_View_Del;
/
