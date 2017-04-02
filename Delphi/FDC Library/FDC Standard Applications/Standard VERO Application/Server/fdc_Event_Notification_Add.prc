create or replace procedure fdc_Event_Notification_Add
-- Создание уведомления о событии
  (
  pEvent_ID number,             -- Идентификатор события 
  pUser_ID  number,             -- Идентификатор пользователя - адресата уведомления
  pSubscription_ID number       -- Идентификатор подписки
  )
is
  pNewID number(15);
  pChk number;
begin
  -- Проверка, может, уведомление уже есть?
  begin
    select ID
    into pNewID
    from fdc_Event_Notification EN
    where EN.USER_ID = pUser_ID and
          EN.EVENT_ID = pEvent_ID;
  exception
    when no_data_found then null;
    when others then fdc_util.abort('Ошибка проверки уведомления:', 1);     
  end;  

  -- Если уведомления нету, создаем
  if pNewID is null then
    -- Получение идентификатора нового уведомления
    pNewID := fdc_Object_Get_NewKey;
    
    -- Создание записи в fdc_event_notification
    insert into fdc_event_notification
      (id, user_id, event_id, checked, check_date)
    values
      (pNewID, pUser_ID, pEvent_ID, 0, null);
  end if;    
    
  -- При необходимости - создание записи в fdc_subscr_notification
  if pSubscription_ID is not null then
    begin
      select Notification_ID
      into pChk
      from fdc_subscr_notification SN
      where SN.NOTIFICATION_ID = pNewID and
            SN.SUBSCRIPTION_ID = pSubscription_ID;
    exception
      when no_data_found then null;
      when others then fdc_util.abort('Ошибка проверки уведомления:', 1);     
    end;  
    if pChk is null then
      insert into fdc_subscr_notification
        (subscription_id, notification_id)
      values
        (pSubscription_ID, pNewID);
    end if;    
  end if;
    
end  fdc_Event_Notification_Add;
/
