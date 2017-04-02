create or replace view fdc_SysComponent_Lst as
select	/*+ordered*/
	     O.*,
	     S.Base_Type_ID,
     	 T.Name as BaseTypeName
  from fdc_SysComponent S,
	     fdc_Object_Lst O,
	     fdc_Object_Type T
 where O.ID = S.ID and
	     T.ID = S.Base_Type_ID;

