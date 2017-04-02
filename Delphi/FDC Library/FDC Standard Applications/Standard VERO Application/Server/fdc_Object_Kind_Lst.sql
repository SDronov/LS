create or replace view fdc_Object_Kind_Lst as
select O.*,
	     PK.Kind_ID,
	     PK.Evidence_ID,
       P.ID as Object_ID,
	     P.Name as ObjectName,
       P.TypeName as ObjectTypeName,
	     P.TypeSysName as ObjectTypeSysName,
       K.Name as KindName,
	     K.SysName as KindSysName,
	     K.Icon as Icon,
	     K.Rate as Rate,
	     E.Name as EvidenceName,
	     E.TypeName as EvidenceTypeName,
	     E.TypeSysName as EvidenceTypeSysName,
	     E.Descript as EvidenceDescript,
       nvl(ST.Active, 1) as StatusActive
  from fdc_Object_Kind PK,
	     fdc_Object_Lst O,
	     fdc_Object_Lst P,
	     fdc_Kind_Lst K,
	     fdc_Object_Lst E,
       fdc_State ST
 where O.ID = PK.ID and
	     P.ID = O.Owner_Object_ID and
	     K.ID = PK.Kind_ID and
	     E.ID (+)= PK.Evidence_ID and
       ST.ID (+)= O.State_ID;

