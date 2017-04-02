create or replace view fdc_Subscr_Event_Type_Lst as
select	SE.Subscription_ID,
	ET.*
from	fdc_Subscr_Event_Type SE,
	fdc_Event_Type_Lst ET
where	ET.ID = SE.Event_Type_ID;

