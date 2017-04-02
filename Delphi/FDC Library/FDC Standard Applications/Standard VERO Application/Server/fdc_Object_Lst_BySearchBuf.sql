create or replace view fdc_Object_Lst_BySearchBuf as
select O.*,
       B.SESS,
       B.TXT
from fdc_Object_Lst O,
     fdc_Buffer B
where O.ID = B.ID;

