create or replace view fdc_Subscription_Lst as
select	O.*,
	S.Addressee_ID,
	S.Object_ID,
	S.StartDate,
  S.Active,
	S.StopDate,
	A.Name as AddresseeName,
	RefObj.Name as RefObjectName,
	RefObj.TypeName as RefObjectTypeName,
	RefObj.TypeSysName as RefObjectTypeSysName
from	fdc_Subscription S,
      fdc_Object_Lst O,
      fdc_Object A,
      fdc_Object_Lst RefObj
where
  S.ID = O.ID and
  S.ADDRESSEE_ID = A.ID(+) and
  S.Object_Id = RefObj.Id(+);

