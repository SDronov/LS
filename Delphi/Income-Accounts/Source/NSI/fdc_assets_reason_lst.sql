create or replace view fdc_assets_reason_lst as
select
  d."ID",d."NAME",d."SHORTNAME",d."OBJECT_TYPE_ID",d."STATE_ID",d."ACCESSLEVEL",d."SYSNAME",d."DESCRIPT",d."OWNER_OBJECT_ID",d."TYPENAME",d."TYPESYSNAME",d."OBJECTKINDLIST",d."CODE",d."CODE2",d."FULLCODE",d."OWNERNAME",d."OWNERSYSNAME",d."OWNERTYPENAME",d."OWNERTYPESYSNAME",d."SDATE",d."EDATE",d."DATBEGDOC",d."NUMBEGDOC",d."DATENDDOC",d."NUMENDDOC", "DOCUM"
from
  fdc_nsi_dict_lst d
where
  d.object_Type_id = fdc_object_type_get_bysysname('AssetsReason')
/