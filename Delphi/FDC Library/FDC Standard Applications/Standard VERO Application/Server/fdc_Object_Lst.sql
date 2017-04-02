create or replace view fdc_Object_Lst as
select	O.*
  from	fdc_Object_Lst_All O 
 where  ((O.AccessLevel > 0) or (fdc_User_ReadAccess(O.ID) = 1));

