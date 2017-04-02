create or replace view fdc_Task_Lst as
select	/*+ordered*/
	     O.*
  from fdc_Task T,
	     fdc_Object_Lst O
 where O.ID = T.ID;

