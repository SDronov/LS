create or replace function fdc_Dispatch_Job_IsActive
-- Проверка состояния сервисного процесса (job) диспетчера
-- (иначе - супердемона, вызывающего процедуру fdc_Dispatch.Main)
-- Если включен, возвращает 1,
-- если нет (broken) - 0
-- если job отсутствует - -1
return number 
is
  lJob user_jobs%rowtype;
  lRetVal number;
begin
  -- Запрос к представлению user_jobs
  begin
    select *
    into lJob
    from user_jobs
    where upper(what) = 'FDC_DISPATCH.MAIN;';
    if lJob.Broken = 'Y' then
      lRetVal := 0;
    else
      lRetVal := 1;
    end if;
  exception
	  when NO_DATA_FOUND then 
      lRetVal := -1;
  	when others then 
      fdc_util.Abort('Ошибка получения информации о процессе (job) диспетчера', 1);
  end;
  return lRetVal;
end;
/
