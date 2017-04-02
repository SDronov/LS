create or replace procedure fdc_Event_Notification_Del
-- Удаление уведомления о событии
  (
  pID number                       -- Идентификатор уведомления 
  )
is
begin
  -- Удаление информации о подписке, по которой пришло уведомление
  delete fdc_subscr_notification SN
  where SN.NOTIFICATION_ID = pID;
  
  -- Удаление уведомления
  delete fdc_Event_Notification
  where ID = pID;
end fdc_Event_Notification_Del;
/
