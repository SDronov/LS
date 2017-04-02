create or replace view fdc_State_Transit_Lst as
select O.*,
	     T.State_Scheme_ID,
	     T.Src_State_ID,
	     T.Dst_State_ID,
	     T.Before_Procedure_ID,
	     T.After_Procedure_ID,
	     SS.Name as State_SchemeName,
       SS.SysName as State_SchemeSysName,
	     SRC.Name as Src_StateName,
       SRC.SysName as Src_StateSysName,
	     DST.Name as Dst_StateName,
       DST.SysName as Dst_StateSysName,
	     BO.Name as Before_ProcedureName,
       BO.SysName as Before_ProcedureSysName,
	     AO.Name as After_ProcedureName,
       AO.SysName as After_ProcedureSysName
  from fdc_State_Transit T,
	     fdc_Object_Lst O,
	     fdc_Object SS,
	     fdc_Object SRC,
	     fdc_Object DST,
	     fdc_Object BO,
	     fdc_Object AO
 where O.ID = T.ID and
	     SS.ID = T.State_Scheme_ID and
	     SRC.ID (+)= T.Src_State_ID and
	     DST.ID (+)= T.Dst_State_ID and
	     BO.ID (+)= T.Before_Procedure_ID and
	     AO.ID (+)= T.After_Procedure_ID;

