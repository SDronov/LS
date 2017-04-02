create or replace view fdc_State_Scheme_Lst as
select O.*
  from fdc_State_Scheme S,
	     fdc_Object_Lst O
 where O.ID = S.ID;

