create or replace view fdc_Collection_Object_Lst as
select  
  CO.ID Collection_Object_ID,
  CO.Collection_ID,
	CO.Object_ID,
	CO.RoleName,
	CO.Descript as CODescript,
	O.*,
	F.SourceName as FileSourceName
from	fdc_Object_Lst O,
	fdc_Collection_Object CO,
	fdc_File F
where	CO.Object_ID = O.ID and
	F.ID (+) = O.ID;

