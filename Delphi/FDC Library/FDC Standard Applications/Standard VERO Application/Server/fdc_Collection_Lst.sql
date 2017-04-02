create or replace view fdc_Collection_Lst as
select	O.*,
	C.ColDate,
	C.User_ID,
	C.DefCollection,
	case when C.DefCollection = 1 and C.User_ID = fdc_User_Get then 1 else 0 end as Cur_User_DefCollection,
	UO.Name as UserName,
	U.Login,
	S.Name as StateName
from	fdc_Collection C,
	fdc_Object_Lst O,
	fdc_User U,
	fdc_Object UO,
	fdc_Object S
where	O.ID = C.ID and
	U.ID = C.User_ID and
	UO.ID = C.User_ID and
	S.ID (+) = O.State_ID;

