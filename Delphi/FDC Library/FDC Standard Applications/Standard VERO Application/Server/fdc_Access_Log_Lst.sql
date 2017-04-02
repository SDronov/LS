create or replace view fdc_Access_Log_Lst as
select  A.ID as Access_Log_ID,
	A.Object_ID,
	A.Action_Dict_ID,
	A.Login,
	A.Moment,
	O.*,
  D.NAME Action_Name,
  D.Sysname Action_SysName,
  decode (U.ID, null, A.Login, U.Name) User_Name
from	fdc_Access_Log A,
	fdc_Object_Lst O,
  fdc_Object D,
  fdc_User_Lst U
where	O.ID (+) = A.Object_ID and
      D.ID (+) = A.ACTION_DICT_ID and
      U.Login (+) = A.Login;

