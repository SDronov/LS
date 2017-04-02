create or replace view fdc_Object_Type_Lst as
select	/*+first_rows*/
  T.*
from fdc_Object_Type_Lst_All T
where	((T.AccessLevel > 0) or (fdc_User_ReadAccess(T.ID) = 1));

