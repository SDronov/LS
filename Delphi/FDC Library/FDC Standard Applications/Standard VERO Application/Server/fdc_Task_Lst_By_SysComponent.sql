create or replace view fdc_Task_Lst_By_SysComponent as
select T.*,
	     TS.SysComponent_ID
  from fdc_Task_SysComponent TS,
	     fdc_Task_Lst T
 where TS.Task_ID = T.ID;

