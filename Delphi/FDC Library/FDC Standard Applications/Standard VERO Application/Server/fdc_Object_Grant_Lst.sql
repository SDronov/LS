create or replace view fdc_Object_Grant_Lst as
select O.*,
       1 TYPE_ORDER,
	     UG.Object_ID,
	     UG.AccessLevel as SpecialAccessLevel,
       fdc_Access_Level_GetName(UG.ACCESSLEVEL) as SpecialAccessName
  from fdc_User_Grant UG,
	     fdc_Object_Lst O,
       fdc_Access_Level_Lst AL
 where O.ID = UG.User_ID
union
select O.*,
       0 TYPE_ORDER,
	     UG.Object_ID,
	     UG.AccessLevel as SpecialAccessLevel,
       fdc_Access_Level_GetName(UG.ACCESSLEVEL) as SpecialAccessName
  from fdc_User_Group_Grant UG,
	     fdc_Object_Lst O,
       fdc_Access_Level_Lst AL
 where O.ID = UG.User_Group_ID;

