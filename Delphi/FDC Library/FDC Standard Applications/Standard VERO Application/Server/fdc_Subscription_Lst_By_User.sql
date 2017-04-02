create or replace view fdc_Subscription_Lst_By_User as
select	S.*
from	fdc_Subscription_Lst S
where	S.Addressee_ID = fdc_User_Get
union
select	distinct
	S.*
from	fdc_Subscription_Lst S,
	fdc_User_In_Group UIG
where	UIG.User_ID = fdc_User_Get and
	S.Addressee_ID = UIG.User_Group_ID;

