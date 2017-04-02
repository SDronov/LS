create or replace procedure fdc_SysComponent_Del
-- Удаление системной компоненты
	(
	  pID number,             -- идентификатор компоненты
    pDoLog number := 1      -- Логировать ли событие удаления объекта 
                            -- (создавать ли Event?)
                            -- по умолчанию логировать (значение 1)
                            -- при значении 0 логировать не надо
	)
is
begin
  -- удаление записи из таблицы fdc_SysComponent
  delete from fdc_SysComponent
      where ID = pID;

  -- вызов базовой процедуры удаления объекта     
  fdc_Object_Del(pID, pDoLog);
end fdc_SysComponent_Del;
/
