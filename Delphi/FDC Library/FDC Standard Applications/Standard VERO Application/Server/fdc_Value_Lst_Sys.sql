create or replace view fdc_Value_Lst_Sys as
select val.*
  from fdc_Value_Lst val
 where val.IsSystem = 1;