create or replace view fdc_State_Lst as
select O.*,
	     S.State_Scheme_ID,
	     S.AllowUpdates,
	     S.AllowDelete,
	     S.Active,  
       S.Color,
	     SS.Name as State_SchemeName,
       SS.SysName as State_SchemeSysName
  from fdc_State S,
	     fdc_Object_Lst O,
	     fdc_Object SS
 where O.ID = S.ID and
	     SS.ID = S.State_Scheme_ID;

