create or replace view fdc_Object_Lst_All as
select	O.ID,
	      O.Name,
        O.ShortName,
	      O.Object_Type_ID,
	      O.State_ID,
	      round(O.AccessLevel) AccessLevel,
	      O.SysName,
	      O.Descript,
	      O.Owner_Object_ID,
	      T.Name as TypeName,
	      T.SysName as TypeSysName
  from	fdc_Object O, fdc_Object_Type T
 where  T.ID = O.Object_Type_ID;

