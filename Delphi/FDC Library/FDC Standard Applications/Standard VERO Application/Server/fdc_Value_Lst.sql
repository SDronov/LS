create or replace view fdc_value_lst as
select	O.*,
        V.StringValue,
	      V.NumValue,
	      V.DateTimeValue,
	      V.Ref_Object_ID,
        V.IsSystem,
	      W.Name as OwnerName,
	      W.TypeName	as OwnerTypeName,
	      W.TypeSysName	as OwnerTypeSysName,
	      R.Name	as RefName,
	      R.TypeName as RefTypeName,
	      R.TypeSysName	as RefTypeSysName,
	      F.SourceName as FileSourceName
   from	fdc_Value V, fdc_Object_Lst O, fdc_Object_Lst W,
        fdc_Object_Lst R, fdc_File F
  where O.ID = V.ID and
        W.ID (+)= O.Owner_Object_ID and    -- ¬ладелец
        R.ID (+)= V.Ref_Object_ID and      -- —сылка
        F.ID (+)= V.Ref_Object_ID          -- —сылка на файл

