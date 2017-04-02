create or replace view fdc_Event_Type_Lst as
select T.*
from	 fdc_Event_Type ET,
	     fdc_Object_Type_Lst T
where	 T.ID = ET.ID;

