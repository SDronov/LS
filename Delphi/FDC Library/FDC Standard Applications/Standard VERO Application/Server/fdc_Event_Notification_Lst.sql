create or replace view fdc_Event_Notification_Lst as
select  
	E.*,
	EN.Checked,
  EN.Check_Date
from	fdc_Event_Notification EN,
	fdc_Event_Lst E
where	E.ID = EN.Event_ID and
      EN.USER_ID = fdc_User_Get;

