CREATE OR REPLACE VIEW FDC_DICT_SUD_REASON_LST AS
SELECT sr.id
      ,d.name
      ,d.shortname
      ,d.object_type_id
      ,d.state_id
      ,d.accesslevel
      ,d.sysname
      ,d.descript
      ,d.owner_object_id
      ,d.typename
      ,d.typesysname
      ,d.objectkindlist
      ,d.ext_source
      ,d.ext_typesysname
      ,d.ext_id
      ,d.code
      ,d.code2
      ,d.fullcode
      ,d.ownername
      ,d.ownersysname
      ,d.ownertypename
      ,d.ownertypesysname
      ,nd.SDATE
      ,nd.EDATE
      ,nd.numbegdoc
      ,nd.datbegdoc
      ,nd.numenddoc
      ,nd.datenddoc
  FROM fdc_dict_lst        d
      ,fdc_nsi_dict_lst    nd
      ,fdc_dict_sud_reason sr
  WHERE d.id = sr.id
    AND nd.ID (+) = d.id
;
