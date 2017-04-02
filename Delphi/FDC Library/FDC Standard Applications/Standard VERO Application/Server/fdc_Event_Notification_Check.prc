create or replace procedure fdc_Event_Notification_Check
-- Отметка о прочтении уведомления о событии
  (
  pID number                       -- Идентификатор уведомления 
  )
is
  pNotification fdc_Event_Notification%rowtype;
begin
  -- Получение записи уведомления из БД
  begin
    select *
    into pNotification
    from fdc_Event_Notification 
    where ID = pID;
  exception
	  when NO_DATA_FOUND then fdc_util.Abort('Не найдено уведомление ID = '||pID);
  	when others then fdc_util.Abort('Ошибка проверки родительского типа события для подписки', 1);
  end;  

  -- Проверка, не было ли прочитано ранее
  if pNotification.Checked = 1 then
    fdc_util.Abort('Уведомление уже было отмечено как проcмотренное');
  end if;

  -- Простановка отметки и даты просмотра
  update fdc_Event_Notification E
  set E.Checked = 1,
      E.Check_Date = sysdate
  where ID = pID;    
    
end  fdc_Event_Notification_Check;
/
