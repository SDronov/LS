CREATE OR REPLACE VIEW fdc_nsi_dict_lst AS
SELECT nd.ID
      ,d.NAME
      ,d.SHORTNAME
      ,d.OBJECT_TYPE_ID
      ,d.STATE_ID
      ,d.ACCESSLEVEL
      ,d.SYSNAME
      ,d.DESCRIPT
      ,d.OWNER_OBJECT_ID
      ,d.TypeNAME
      ,d.TypeSYSNAME
      ,d.ObjectKindList
      ,d.EXT_SOURCE
      ,d.EXT_TYPESYSNAME
      ,d.EXT_ID
      ,d.CODE
      ,d.CODE2
      ,d.FullCode
      ,d.OwnerName
      ,d.OwnerSysName
      ,d.OwnerTypeName
      ,d.OwnerTypeSysName
      ,nd.SDATE
      ,nd.EDATE
      ,nd.DATBEGDOC
      ,nd.NUMBEGDOC
      ,nd.DATENDDOC
      ,nd.NUMENDDOC
      ,d.docum
  FROM FDC_NSI_DICT nd
      ,FDC_DICT_LST d
 WHERE nd.id = d.id
/