create or replace view fdc_SysComponent_Lst_To_Grant as
select distinct U.Login, C.SysName
  from fdc_User U,
	     fdc_User_In_Group UG,
	     fdc_User_Group_Task GT,
	     fdc_Task_SysComponent TSC,
	     fdc_SysComponent_Lst C
 where UG.User_ID = U.ID and
	     GT.User_Group_ID = UG.User_Group_ID and
	     TSC.Task_ID = GT.Task_ID and
	     C.ID = TSC.SysComponent_ID and
	     C.TypeSysName in ('Procedure','View');

