create or replace procedure fdc_File_Del
-- Удаление файла
	(
	  pID number,                -- идентификатор пометки
    pDoLog number := 1         -- Логировать ли событие удаления объекта 
                               -- (создавать ли Event?)
                               -- по умолчанию логировать (значение 1)
                               -- при значении 0 логировать не надоpID number
	)
is
begin
  -- удаление записи из таблицы fdc_File
  delete from fdc_File
     where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);         

end fdc_File_Del;
/
