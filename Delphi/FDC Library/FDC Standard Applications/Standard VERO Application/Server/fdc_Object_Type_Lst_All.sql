create or replace view fdc_Object_Type_Lst_All as
select	/*+first_rows*/
  T.ID, 
	O.Object_Type_ID, 
  O.State_ID, 
  O.AccessLevel,
  O.Descript,
  O.Owner_Object_ID, 
  O.TypeName,
  O.TypeSysName,
  T.Name, 
	T.ShortName,
  T.SysName,
 	T.TableName,
	T.Icon,
	T.State_Scheme_ID,
	T.Parent_Object_Type_ID,
	T.Del_Procedure_ID,
  T.ObjectTableInstance,
	PT.Name as ParentTypeName,
	PT.SysName as ParentTypeSysName,
	SS.Name as State_SchemeName
from fdc_Object_Type T,
	   fdc_Object_Lst_All O,
     fdc_Object_Type PT,
	   fdc_Object SS
where	O.ID = T.ID 
  and PT.ID (+)= T.Parent_Object_Type_ID 
  and SS.ID (+)= T.State_Scheme_ID;

