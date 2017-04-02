create or replace view fdc_Followup_Lst as
select	O.*,
	F.Object_ID,
	F.MomentPlan,
	F.MomentFact,
	F.Resp_User_ID,
	F.Doer_User_ID,
	F.Result,
	RO.Name		as RefObjectName,
	RO.TypeName	as RefObjectTypeName,
	RO.TypeSysName	as RefObjectTypeSysName,
	RU.Name		as RespUserName,
	DU.Name		as DoerUserName,
	nvl(S.Active,0)	as StateActive,
	SO.Name		as StateName
from	fdc_FollowUp F,
      fdc_Object_Lst O,
      fdc_Object_Lst RO,
      fdc_Object RU,
      fdc_Object DU,
      fdc_State S,
      fdc_Object SO
where F.ID = O.ID and  
      RO.ID (+) = F.Object_Id and    
      RU.ID = F.Resp_User_Id and      
      DU.ID (+) = F.Doer_User_Id and
      S.ID (+) = O.State_Id and
      SO.ID (+) = S.ID;

