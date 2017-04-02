create or replace view fdc_Task_SysComponent_Lst as
select S.*,
	     TS.Task_ID
  from fdc_Task_SysComponent TS,
	     fdc_SysComponent_Lst S
 where S.ID = TS.SysComponent_ID;

