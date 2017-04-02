create or replace procedure fdc_Subscription_Del
-- Удаление подписки
	(
  pID number,                -- Идентификатор подписки               
  pDoLog number := 1         -- Логировать ли событие удаления объекта 
                             -- (создавать ли Event?)
                             -- по умолчанию логировать (значение 1)
                             -- при значении 0 логировать не надо
	)
is
begin
  -- Проверка типа 
  if (fdc_Object_Is(pID, 'Subscription') = 0) then
    Fdc_Util.Abort('Объект (ID='||pID||') не является подпиской');
  end if;

  -- Удаление записей о подписке и типах событий в подписке
  delete from Fdc_Subscr_Event_Type
  where subscription_id = pID;
  delete Fdc_Subscription
  where ID = pID;
  -- При этом, если есть уведомления по этой подписке,
  -- то ссылочная целостность не даст удалить
  

  -- вызов базовой процедуры удаления объекта    
  fdc_Object_Del(pID, pDoLog);      

end fdc_Subscription_Del;
/
