create or replace view fdc_Person_Lst_BySearchBuf as
select B.ID,
       B.SESS,
       B.TXT
from fdc_Person P,
     fdc_Buffer B
where P.ID = B.ID;

