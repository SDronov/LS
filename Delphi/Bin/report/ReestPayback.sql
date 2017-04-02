[dsHeader]
SELECT
    fdc_valuestring_sys_get( 'CustomsName', 0 ) AS CustomsName
   ,:begin_date                                 AS Date_From
   ,nvl( :end_date, SYSDATE )                   AS Date_To
   ,:report_type                                AS report_type
   ,:is_ts                                      AS is_ts
  FROM dual

[dsBody]
WITH kc AS (
SELECT DISTINCT c.customs_code_8, nvl(c.ShortName, c.name) as name, k.code AS id, k.fmt_code as code
  FROM fdc_kbk_dict_lst k
      ,fdc_customs_lst  c
  WHERE (:begin_date between k.sdate and nvl( k.edate, :begin_date )
         or
         :end_date between k.sdate and nvl( k.edate, :end_date )
        )
    AND k.is_for_report = 'Y'
    AND (substr( c.customs_code_8, 6, 3 ) = '000' or c.customs_code_8 = p_Params.ELSCustomCode)
    AND substr( c.customs_code_8, 1, 2 ) = '10'
    AND c.customs_code_8 <> '10007000'
    AND c.customs_code_8 <> '10008000'
    AND nvl( c.dt_end, :begin_date ) >= :begin_date
    AND (   c.customs_code_8 = p_Params.CustomCode
         OR p_Params.CustomLevel = 1 AND substr( c.customs_code_8, 1, 3 ) = substr( p_Params.CustomCode, 1, 3 )
         OR p_Params.CustomLevel = 0 AND ( substr( c.customs_code_8, 4, 5 ) = '00000' OR (substr( c.customs_code_8, 1, 3 ) = '100' 
                                                                                          and
                                                                                          substr( c.customs_code_8, 6, 3 ) = '000'
                                                                                          and
                                                                                          (substr( c.customs_code_8, 4, 1 ) = '0' OR substr( c.customs_code_8, 4, 1 ) = '1')
                                                                                         )))
  ORDER BY nvl(c.ShortName, c.name), k.code
),
ret AS ( SELECT rp.customs_code 
               ,rp.KBKCode_id
               ,sum(rp.podt_po) AS podt_po
               ,sum(rp.vozvrat) AS vozvrat
           FROM table(oi_report_reest_payback(:begin_date,
                             :end_date,
                             :is_ts,
                             :report_type)) rp
           GROUP BY rp.customs_code 
                   ,rp.KBKCode_id
)
SELECT
       CASE
         WHEN grouping( kc.NAME ) = 0
          AND grouping( kc.code  ) = 0 THEN
           CASE
             WHEN row_number() over ( PARTITION BY kc.name ORDER BY kc.NAME, kc.code ) > 1 THEN
               to_char( NULL )
             ELSE
               kc.name
           END
         ELSE 
           to_char( NULL )
       END                AS name,
       CASE
         WHEN grouping( kc.NAME ) = 0
          AND grouping( kc.code  ) = 0 THEN
           kc.code
         ELSE
           '»ÚÓ„Ó:'
       END            AS kbk, 
       NVL( SUM( ret.podt_po ), 0 ) AS podt_po,
       NVL( SUM( ret.vozvrat ), 0 ) AS vozvrat
  FROM kc,
       ret
WHERE kc.id             = ret.kbkcode_id /*for_all_kbk*/
  AND kc.customs_code_8 = ret.customs_code /*for_all_kbk*/
GROUP BY ROLLUP(kc.NAME, kc.code)
HAVING NOT ( grouping( kc.NAME ) = 1 AND grouping( kc.code ) = 1 )
UNION ALL
SELECT
       CASE
         WHEN row_number() over ( ORDER BY kc.code ) > 1 THEN
           to_char( NULL )
         ELSE
           '»“Œ√Œ:'
       END                AS name,
       CASE
         WHEN grouping( kc.code  ) = 0 THEN
           kc.code
         ELSE
           '»ÚÓ„Ó:'
       END                AS kbk, 
       NVL( SUM( ret.podt_po ), 0 ) AS podt_po,
       NVL( SUM( ret.vozvrat ), 0 ) AS vozvrat
  FROM kc,
       ret
WHERE p_Params.CustomLevel < 2
  AND kc.id             = ret.kbkcode_id /*for_all_kbk*/
  AND kc.customs_code_8 = ret.customs_code /*for_all_kbk*/
GROUP BY ROLLUP(kc.code)