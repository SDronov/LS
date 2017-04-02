create or replace procedure fdc_Event_Del_EventState
-- Удаление события перехода состояния
	(
	pID number                 -- Идентификатор удаляемого события
	)
is
begin
  -- Удаление записи из таблицы fdc_Event_State
  delete from fdc_Event_State
  where ID = pID;
  
  -- Вызов базовой процедуры удаления события
  fdc_Event_Del(pID);
  
end fdc_Event_Del_EventState;
/
