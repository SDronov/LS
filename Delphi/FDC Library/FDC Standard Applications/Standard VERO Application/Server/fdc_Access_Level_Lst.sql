create or replace view fdc_Access_Level_Lst as
select 0                            ID, 
       fdc_Access_Level_GetName (0) NAME, 
       fdc_Access_Level_GetDescr(0) DESCRIPT 
  from dual
union
select 1                            ID, 
       fdc_Access_Level_GetName (1) NAME, 
       fdc_Access_Level_GetDescr(1) DESCRIPT 
  from dual
union
select 2                            ID, 
       fdc_Access_Level_GetName (2) NAME, 
       fdc_Access_Level_GetDescr(2) DESCRIPT 
  from dual
union
select 3                            ID, 
       fdc_Access_Level_GetName (3) NAME, 
       fdc_Access_Level_GetDescr(3) DESCRIPT 
  from dual
order by ID;

