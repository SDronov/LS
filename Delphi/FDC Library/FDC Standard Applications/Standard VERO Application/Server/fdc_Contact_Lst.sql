create or replace view fdc_Contact_Lst as
select O.*,
       W.Name as OwnerName
  from fdc_Object_lst O, 
       fdc_Object_Lst W
 where (fdc_Object_Is(O.ID, 'Contact') <> 0) and
        W.ID (+) = O.OWNER_OBJECT_ID;

