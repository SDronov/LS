create or replace view fdc_State_Lst_By_Object as
select S.ID,
	     case	when T.State_Scheme_ID is not null and S.ID is null 
                         then 'Формируется' else SO.Name end as Name,
	     case	when T.State_Scheme_ID is not null and S.ID is null 
                         then 'Не имеет состояния в даный момент' else SO.Descript end as Descript,
	     SO.SysName,
	     T.State_Scheme_ID,
	     O.ID as Object_ID,
	     fdc_Object_Is_Updatable(O.ID) as IsUpdatable
  from fdc_Object O,
	     fdc_Object_Type T,
	     fdc_State S,
	     fdc_Object SO
 where T.ID = O.Object_Type_ID and
	     S.ID (+) = O.State_ID and
	     SO.ID (+) = S.ID;

