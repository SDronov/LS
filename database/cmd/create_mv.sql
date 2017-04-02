prompt
prompt MATERIALIZED VIEW FDC_SUBJECTBYLS_LST
prompt ============================
prompt
CREATE MATERIALIZED VIEW FDC_SUBJECTBYLS_LST
REFRESH FORCE ON DEMAND
AS
SELECT pa.subject_id as id
      ,CASE
         WHEN level = 1 THEN pa.subject_id
         ELSE to_number( SUBSTR( ( LTRIM( SYS_CONNECT_BY_PATH( pa.subject_id, '.' ), '.' ) || '.' )
                        ,1
                        ,INSTR( ( LTRIM( SYS_CONNECT_BY_PATH( pa.subject_id, '.' ), '.' ) || '.' )
                               , '.'
                              ) - 1
                       ) )
       END AS parent_id
  FROM fdc_personal_account pa
 START WITH pa.edate IS NULL
            AND pa.subject_id IS NOT NULL
CONNECT BY PRIOR pa.id = pa.parent_id
UNION --all
select id, id parent_id from fdc_person
where private_owner = 'N'
union --all
select id, id parent_id from fdc_declarant
where resident = 'N'
UNION --ALL
SELECT id, id parent_id FROM fdc_bank;

comment on column FDC_SUBJECTBYLS_LST.ID is 'ID';
comment on column FDC_SUBJECTBYLS_LST.PARENT_ID is 'PARENT_ID';

