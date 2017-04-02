create or replace view fdc_Reg_Document_Lst as
select	O.*,
	R.DocDate,
  R.Stopdate,
	R.DocNumber,
	R.DocSerial,
	R.Grantee,
  P.NAME Owner_Name
from	fdc_Reg_Document R,
	fdc_Object_Lst O,
  Fdc_Person_Lst p
where	O.ID = R.ID and
	P.ID (+) = O.Owner_Object_Id;

