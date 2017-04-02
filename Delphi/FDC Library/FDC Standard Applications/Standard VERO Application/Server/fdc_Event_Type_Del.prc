create or replace procedure fdc_Event_Type_Del
-- Удаление типа события
	(
	pID number,                     -- Идентификатор типа события
	pDoLog number := 1              -- Логировать ли событие удаления объекта 
                                  -- (создавать ли Event?)
                                  -- по умолчанию логировать (значение 1)
                                  -- при значении 0 логировать не надо
	)
is
begin
  -- Удаление записи типа события в fdc_Event_Type
  delete from fdc_Event_Type
  where ID = pID;
  
  -- Вызов общей процедуры удаления объектного типа
  fdc_Object_Type_Del(pID, pDoLog);
  
end fdc_Event_Type_Del;
/
