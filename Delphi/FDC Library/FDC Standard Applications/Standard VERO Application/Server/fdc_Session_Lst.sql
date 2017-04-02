create or replace view fdc_Session_Lst as
select   o.name,
         o.object_type_id,
         o.state_id,
         o.accesslevel,
         o.sysname,
         o.descript,
         o.typename,
         o.typesysname,
         o.owner_object_id,
         s.*,
         St.Sysname State_SysName,
         St.Name State_Name,
         isess.Name as INITIAL_SESSION_NAME,
         esess.Name as END_SESSION_NAME
    from fdc_Session s,
         fdc_object_Lst O,
         fdc_State_Lst St,
         fdc_Object isess,
         fdc_Object esess
   where S.ID = O.ID
     and St.ID (+) = O.State_Id
     and isess.id (+) = s.initial_session_id
     and esess.id (+) = s.end_session_id;

