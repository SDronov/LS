create or replace view fdc_Object_Relation_Lst as
select /*+FIRST_ROWS*/ 
       O.*, 
       Pr.Object_ID, 
       Pr.Rel_Object_ID, 
       Pr.Role, 
       Pr.BackwardRole,
       -- Объект 
       Omain.Name as ObjName, 
       Omain.Object_Type_Id as Obj_Type_ID,
       Omain.TypeName as ObjTypeName,
       Omain.TypeSysName as ObjTypeSysName,
       -- Связанный объект
       Orel.Name as RObjName,
       Orel.Object_Type_Id as RObj_Type_ID,
       Orel.TypeName as RObjTypeName,
       Orel.TypeSysName as RObjTypeSysName
  from Fdc_Object_Relation Pr,
       Fdc_Object_Lst O,
       fdc_Object_Lst Omain,
       fdc_Object_Lst Orel
 where O.ID = Pr.ID
   and Omain.ID = Pr.Object_ID
   and Orel.ID = Pr.Rel_Object_ID;

