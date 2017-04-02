create or replace view fdc_Object_Lst_ID as
select obj.ID,
       obj.OWNER_OBJECT_ID,
       obj.OBJECT_TYPE_ID
  from fdc_Object obj
 where obj.AccessLevel > 0 or 
       fdc_User_ReadAccess(obj.ID) = 1;

