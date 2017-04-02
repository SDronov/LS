create or replace view fdc_File_Lst as
select O.*,
	     F.SourceName
  from fdc_Object_Lst O,
	     fdc_File F
 where O.ID = F.ID;

