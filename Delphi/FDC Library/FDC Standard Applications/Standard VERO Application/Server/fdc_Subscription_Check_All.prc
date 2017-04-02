create or replace procedure fdc_Subscription_Check_All
-- Проход по всем подпискам и установка флага активности
-- Эта процедура запускается и работает под управлением диспетчера
  (
  pSession_ID number                 -- Идентификатор процесса обработки данных
  )
is
begin
  -- Старт процесса генерации уведомлений по подпискам
  fdc_Dispatch.Session_Start(pSession_ID);
  begin
    -- Цикл по всем подпискам
    for rec in (select ID from fdc_Subscription) loop
      FDC_SUBSCRIPTION_SET_ACTIVE (rec.ID);
    end loop;
    -- Завершение процесса
    fdc_Dispatch.Session_Finalize(pSession_ID);
  exception
    when others then
      rollback;
      fdc_Dispatch.Session_Finalize(pSession_ID, fdc_Dispatch.Session_State_Error, sqlerrm);  
  end;

end FDC_SUBSCRIPTION_CHECK_ALL;
/
