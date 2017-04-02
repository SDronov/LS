create or replace procedure fdc_Session_Upd_Job
-- Присвоение системного номера Job процессу обработки данных
	(
  pID                  number,           -- Идентификатор процесса обработки данных
  pJob_ID              number            -- Системный номер job-а, исполняющего процесс (в соответствии с all_jobs)
  ) 
is
  pSession fdc_Session_Lst%rowtype;  
begin
  -- Проверка типа и состояния процесса
  begin
    select *
    into pSession
    from fdc_Session_Lst 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найден процесс, ID='||pID);
  	when others then fdc_util.Abort('Ошибка получения процесса, ID='||pID, 1);
  end;  
  if pSession.State_SysName <> 'SessionStateCreated' then
    fdc_Util.Abort('Неверное состояние процесса для назначения JOB! (ID='|| pID ||')');
  end if;
  
  -- Установка системного номера job-а, исполняющего процесс
  update fdc_Session
  set job_ID = pJob_ID
  where ID = pID;    

end;
/
