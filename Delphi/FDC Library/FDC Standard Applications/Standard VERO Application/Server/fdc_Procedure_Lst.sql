create or replace view fdc_Procedure_Lst as
select S.*
  from fdc_Procedure P,
	     fdc_Server_Component_Lst S
 where S.ID = P.ID;

