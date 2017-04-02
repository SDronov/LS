create or replace view fdc_Object_Lst_By_Type as
select /*+RULE*/	
       O.*,
	     CT.Object_Type_ID as Root_Type_ID,
	     T.SysName as Root_SysName
  from fdc_Child_Object_Type CT,
	     fdc_Object_Type T,
	     fdc_Object_Lst O
 where O.Object_Type_ID = CT.Child_Object_Type_ID and
	     T.ID = CT.Object_Type_ID;

