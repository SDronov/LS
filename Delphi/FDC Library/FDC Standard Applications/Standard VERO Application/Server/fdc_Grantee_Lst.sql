create or replace view fdc_Grantee_Lst as
select O.*,
       1 TYPE_ORDER
  from fdc_User U,
       fdc_Object_Lst O
 where U.ID = O.ID
union
select O.*,
       0 TYPE_ORDER
  from fdc_User_Group UG,
       fdc_Object_Lst O
 where UG.ID = O.ID;       

