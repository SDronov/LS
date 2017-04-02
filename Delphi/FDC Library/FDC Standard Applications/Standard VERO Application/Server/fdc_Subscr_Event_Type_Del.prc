create or replace procedure fdc_Subscr_Event_Type_Del
-- Удаление типа события для подписки
	(
	pSubscription_ID number,      -- Идентификатор подписки
	pEvent_Type_ID	 number       -- Идентификатор типа события
	)
is
begin
  -- Удаление записи в fdc_Subscr_Event_Type
  delete from fdc_Subscr_Event_Type
  where   Subscription_ID = pSubscription_ID and
  	      Event_Type_ID = pEvent_Type_ID;

end fdc_Subscr_Event_Type_Del;
/
