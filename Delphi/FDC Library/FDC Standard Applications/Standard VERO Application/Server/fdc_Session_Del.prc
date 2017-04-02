create or replace procedure fdc_Session_Del
-- Удаление процесса обработки данных
	(
	pID number,                -- Идентификатор процесса обработки данных  
  pDoLog number := 1         -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа удаляемого объекта
  if (fdc_Object_Is(pID, 'Session') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является процессом обработки данных');
  end if;

  -- удаление записи из таблицы fdc_Session
  delete from fdc_Session
  where ID = pID;

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Session_Del;
/
