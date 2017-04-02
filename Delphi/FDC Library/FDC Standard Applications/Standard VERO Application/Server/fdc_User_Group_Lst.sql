create or replace view fdc_User_Group_Lst as
select O.*
  from fdc_Object_Lst O,
	     fdc_User_Group G
 where O.ID = G.ID;

