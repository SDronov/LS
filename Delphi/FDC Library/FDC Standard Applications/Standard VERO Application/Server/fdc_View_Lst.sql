create or replace view fdc_View_Lst as
select S.*
  from fdc_View V,
	     fdc_Server_Component_Lst S
 where S.ID = V.ID;

