create or replace view fdc_Server_Component_Lst as
select C.*
  from fdc_Server_Component S,
	     fdc_SysComponent_Lst C
 where C.ID = S.ID;

