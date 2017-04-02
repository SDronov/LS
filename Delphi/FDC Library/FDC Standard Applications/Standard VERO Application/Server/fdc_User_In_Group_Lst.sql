create or replace view fdc_User_In_Group_Lst as
select UG.*,
	     U.Name as UserName,
	     G.Name as GroupName
  from fdc_User_In_Group UG,
	     fdc_User_Lst U,
	     fdc_User_Group_Lst G
 where U.ID = UG.User_ID and
	     G.ID = UG.User_Group_ID;

