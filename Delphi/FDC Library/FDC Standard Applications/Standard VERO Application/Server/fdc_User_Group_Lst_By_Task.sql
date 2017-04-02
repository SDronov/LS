create or replace view fdc_User_Group_Lst_By_Task as
select /*ordered*/
       UG.*,
	     UGT.Task_ID
  from fdc_User_Group_Task UGT,
	     fdc_User_Group_Lst UG
 where UG.ID = UGT.USER_GROUP_ID;

