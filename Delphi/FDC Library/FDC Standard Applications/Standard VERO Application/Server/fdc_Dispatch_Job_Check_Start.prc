create or replace procedure fdc_Dispatch_Job_Check_Start
-- Проверка состояния сервисного процесса (job) диспетчера
-- если не запущен - запускается job
is
  jn number;
begin
  -- В зависимости от состояния job предпринимаем различные действия
  case fdc_Dispatch_Job_IsActive
    when 1 then 
      -- все вроде и так хорошо
      null; 
    when 0 then       
      -- есть job, но он в состоянии broken
      begin
        select job
        into jn
        from user_jobs
        where upper(what) = 'FDC_DISPATCH.MAIN;';
      end;
      dbms_job.broken(job => jn, broken => false, next_date => sysdate + 1/2880);
      commit;
    when -1 then      
      -- нет job-а, создаем его
      dbms_job.submit(jn, 'FDC_DISPATCH.MAIN;', sysdate + 1/2880, 'sysdate + 1/1440');
      commit;
    else
      raise_application_error(-20201, 'Неверное значение статуса сервисного процесса диспетчера: '||fdc_Dispatch_Job_IsActive);
  end case;
end;
/
