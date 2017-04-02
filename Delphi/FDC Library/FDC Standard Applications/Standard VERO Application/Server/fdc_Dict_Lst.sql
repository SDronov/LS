create or replace view fdc_Dict_Lst as
select /*+first_rows*/	
  O.*,
	D.Code,
  D.Code2,
  fdc_Dict_Get_FullCode(D.ID) as FullCode,
	OW.Name		as OwnerName,
  OW.Sysname as OwnerSysName,
	OW.TypeName	as OwnerTypeName,
	OW.TypeSysName	as OwnerTypeSysName
from	fdc_Dict D,
      fdc_Object_Lst O,
      fdc_Object_Lst OW
where D.ID = O.ID and
      O.Owner_Object_Id = OW.ID (+);

