create or replace view fdc_Kind_Lst as
select O.*,
	     K.Rate,
	     K.Icon
  from fdc_Kind K,
	     fdc_Object_Lst O
 where O.ID = K.ID;

