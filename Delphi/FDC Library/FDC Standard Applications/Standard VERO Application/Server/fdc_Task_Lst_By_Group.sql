create or replace view fdc_Task_Lst_By_Group as
select /*ordered*/
       T.*,
	     UGT.User_Group_ID
  from fdc_User_Group_Task UGT,
	     fdc_Task_Lst T
 where T.ID = UGT.Task_ID;

