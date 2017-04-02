CREATE OR REPLACE VIEW fdc_dict_lst AS
SELECT d.id
      ,o.name
      ,o.shortname
      ,o.object_type_id
      ,o.state_id
      ,o.accesslevel
      ,o.sysname
      ,o.descript
      ,o.owner_object_id
      ,o.typename
      ,o.typesysname
      ,o.objectkindlist
      ,o.ext_source
      ,o.ext_typesysname
      ,o.ext_id
      ,d.code
      ,d.code2
      ,d.docum
      ,fdc_dict_get_fullcode( d.id ) AS FullCode
      ,ow.name AS OwnerName
      ,ow.sysname AS OwnerSysName
      ,owt.name AS OwnerTypeName
      ,owt.sysname AS OwnerTypeSysName
  FROM fdc_dict d
      ,fdc_object_lst o
      ,fdc_object ow
      ,fdc_object_type owt
 WHERE o.id = d.id
       AND ow.id(+) = o.owner_object_id
       AND owt.id(+) = ow.object_type_id
/