create or replace view fdc_User_Lst as
select O.*,
	     U.Login,
	     U.LastName,
	     U.FirstName,
	     U.MiddleName,
       U.AllowGrantOption
  from fdc_User U,
       fdc_Object_Lst O
 where O.ID = U.ID;

