create or replace view fdc_Event_Lst as
select /*FIRST_ROWS*/
  -- Дополнительные поля добавлены для совместимости с fdc_Object
  E.id, 
  E.name, 
  '' shortname,
  E.Event_Type_ID object_type_id, 
  to_number(null) state_id,
  1 accesslevel, 
  to_char(null) sysname, 
  E.descript, 
  to_number(null) owner_object_id, 
  OT.Name typename, 
  OT.SysName typesysname,
	E.Object_ID,
	E.Moment,
	E.Login,
	E.Program,
	E.Machine,
 	U.ID as User_ID,
  decode (U.ID, null, E.Login, U.Name) UserName, 
	EO.Name as ObjectName,
	EO.Object_Type_ID as ObjectTypeID,
	EOT.Name as RefTypeName,
	EOT.SysName as RefTypeSysName
from	fdc_Event E,
      fdc_Object_Type OT,
      Fdc_User_Lst U,
      fdc_Object_Lst EO,
      fdc_Object_Type EOT
where
     E.Event_Type_Id = OT.ID and
     U.Login (+) = E.Login and
     EO.Id (+) = E.Object_Id and
     EOT.Id (+) = EO.Object_Type_Id;

