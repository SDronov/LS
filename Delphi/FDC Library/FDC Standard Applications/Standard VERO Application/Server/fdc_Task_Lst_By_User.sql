create or replace view fdc_Task_Lst_By_User as
select T.*,
	     UG.User_ID,
	     G.Name as UserGroupName
  from fdc_Task_Lst_By_Group T,
       fdc_User_In_Group UG,
	     fdc_Object G
 where UG.User_Group_ID = T.User_Group_ID and
	     G.ID = UG.User_Group_ID;

