create or replace procedure fdc_Event_Notification_Reglam
  (
  pSession_ID number               -- Идентификатор процесса обработки данных
  )
is
-- Генерация уведомлений по активным подпискам
-- Проверяются все новые события в fdc_event
-- на предмет соответствия подпискам
-- если есть соответствие - генерится уведомление
-- Эта процедура запускается и работает под управлением диспетчера
  pActive number := null;
  pEventTypeGenNotificationsID number;
  pAnyEvents number := 0;
  pNewID number;
begin
  -- Старт процесса генерации уведомлений по подпискам
  fdc_Dispatch.Session_Start(pSession_ID);
  begin
    -- Проверка, есть ли активные подписки
    begin
      select Active
      into pActive
      from Fdc_Subscription S
      where S.Active = 1 and
            rownum <= 1;
    exception
  	  when NO_DATA_FOUND then null;
    	when others then fdc_util.abort('Ошибка проверки активных подписок', 1);
    end;
  
    -- Если есть активные подписки - проверяем дальше
    if pActive is not null then 
      -- Получение идентификатора типа события генерации уведомлений
      pEventTypeGenNotificationsID := Fdc_Object_Type_Get_Bysysname('EventGenNotifications');
      
      -- Проход всех событий вплоть до события EventGenNotifications
      for rec in (select ID, Event_Type_ID from fdc_Event order by ID desc) loop
        -- Если это тип события EventGenNotifications, то заканчиваем сканирование
        if rec.event_type_id = pEventTypeGenNotificationsID then
          exit;
        end if;
        
        -- Если это первое обрабатываемое событие, устанавливаем флаг, 
        -- что какое-то количество событий обработано
        if pAnyEvents = 0 then
          pAnyEvents := 1;
        end if;  
        
        -- Вызов процедуры проверки подписок и генерации уведомлений
        -- по выбранному событию
        fdc_Event_Check_Subscription (rec.ID);
        
      end loop; -- окончание прохода по событиям
    end if; -- pActive is not null (есть активные подписки) 
      
    -- Если все проведено успешно - генерим событие EventGenNotifications
    if pAnyEvents = 1 then
      pNewID := Fdc_Event_Add(Pevent_Type_Sysname => 'EventGenNotifications', 
                              Pname => 'Генерация уведомлений проведена',
                              Pobject_Id => null);
      commit;                        
    end if; 
    
    -- Завершение процесса
    fdc_Dispatch.Session_Finalize(pSession_ID);
  exception
    when others then
      rollback;
      fdc_Dispatch.Session_Finalize(pSession_ID, fdc_Dispatch.Session_State_Error, sqlerrm);  
  end;
end fdc_Event_Notification_Reglam;
/
