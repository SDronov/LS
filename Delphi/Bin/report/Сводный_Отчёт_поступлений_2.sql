[dsReport]
WITH kc AS (
SELECT c.customs_code_8, c.name, k.id, k.fmt_code as code
  FROM fdc_kbk_dict_lst k
      ,fdc_customs_lst  c
  WHERE (   k.sdate                   BETWEEN :DateFrom AND :DateTo
         OR nvl( k.edate, :DateFrom ) BETWEEN :DateFrom AND :DateTo )
    AND k.is_for_report = 'Y'
    AND (substr( c.customs_code_8, 6, 3 ) = '000' or c.customs_code_8 = p_params.ELSCustomCode)
    AND substr( c.customs_code_8, 1, 1 ) = '1'
    AND substr( c.customs_code_8, 2, 1 ) = '0'
    AND c.customs_code_8 <> '10007000'
    AND c.customs_code_8 <> '10008000'
    AND nvl( c.dt_start, :DateTo ) <= :DateTo
    AND nvl( c.dt_end, :DateFrom ) >= :DateFrom
    AND (   c.customs_code_8 = p_Params.CustomCode
         OR p_Params.CustomLevel = 1 AND substr( c.customs_code_8, 1, 3 ) = substr( p_Params.CustomCode, 1, 3 )
         OR p_Params.CustomLevel = 0 AND ( c.customs_code_8 = p_params.ELSCustomCode or
										   substr( c.customs_code_8, 4, 5 ) = '00000' OR (substr( c.customs_code_8, 1, 3 ) = '100' 
                                                                                          and
                                                                                          substr( c.customs_code_8, 6, 3 ) = '000'
                                                                                          and
                                                                                          (substr( c.customs_code_8, 4, 1 ) = '0' OR substr( c.customs_code_8, 4, 1 ) = '1')
                                                                                         )))
  ORDER BY c.name, k.code
),
ret as ( -- Платежи
         SELECT CASE
                  WHEN cpo.DestCustomsCode in (p_params.customcode, p_params.ELSCustomCode) THEN
                    cpo.DestCustomsCode
                  WHEN substr(cpo.DestCustomsCode, 1, 4) = '1000' OR substr(cpo.DestCustomsCode, 1, 4) = '1001' THEN
                    substr( cpo.DestCustomsCode, 1, 5 ) || '000'
                  WHEN p_Params.CustomLevel = 1 THEN
                    substr( cpo.DestCustomsCode, 1, 5 ) || '000'
                  ELSE
                    substr( cpo.DestCustomsCode, 1, 3 ) || '00000'
                END AS customs_code
               ,cpo.kbkcode_id
               ,SUM( cpo.summa ) AS pays
               ,0                AS "REUSE"
         FROM fdc_po_credit_lst_all     cpo
         WHERE cpo.is_active = 'Y'
           AND cpo.activation_date BETWEEN :DateFrom AND :DateTo
           AND cpo.currency_id = :currency_id
           AND cpo.TypeSysName <> 'PaymentOrderNonIDDest'
         GROUP BY CASE
                    WHEN cpo.DestCustomsCode in (p_params.customcode, p_params.ELSCustomCode) THEN
                      cpo.DestCustomsCode
                    WHEN substr(cpo.DestCustomsCode, 1, 4) = '1000' OR substr(cpo.DestCustomsCode, 1, 4) = '1001' THEN
                      substr( cpo.DestCustomsCode, 1, 5 ) || '000'
                    WHEN p_Params.CustomLevel = 1 THEN
                      substr( cpo.DestCustomsCode, 1, 5 ) || '000'
                    ELSE
                      substr( cpo.DestCustomsCode, 1, 3 ) || '00000'
                  END
                 ,cpo.kbkcode_id
         UNION ALL
         -- Перезачёты
           -- с
         SELECT CASE
                  WHEN r.CUSTOMS_CODE_OLD in (p_params.customcode, p_params.ELSCustomCode) THEN
                    r.CUSTOMS_CODE_OLD
                  WHEN substr(r.CUSTOMS_CODE_OLD, 1, 4) = '1000' OR substr(r.CUSTOMS_CODE_OLD, 1, 4) = '1001' THEN
                    substr( r.CUSTOMS_CODE_OLD, 1, 5 ) || '000'
                  ELSE
                    substr(r.CUSTOMS_CODE_OLD, 1, 3) || '00000'
                END AS customs_code
               ,d.kbkcode_id
               ,0              AS pays
               ,SUM( d.summa ) AS "REUSE"
           FROM fdc_doc_reuse_customs_lst   r
               ,fdc_deduction_reuse_lst     d
               ,fdc_doc_reuse_customs_y_lst ry
           WHERE r.ID = ry.CONFIRMED_DOC_ID
             AND ry.IS_CONFIRM = 'Y'
             AND ry.activation_date BETWEEN :DateFrom AND :DateTo
             AND d.decl_id = r.ID
             AND d.summa   < 0
         GROUP BY CASE
                    WHEN r.CUSTOMS_CODE_OLD in (p_params.customcode, p_params.ELSCustomCode) THEN
                      r.CUSTOMS_CODE_OLD
                    WHEN substr(r.CUSTOMS_CODE_OLD, 1, 4) = '1000' OR substr(r.CUSTOMS_CODE_OLD, 1, 4) = '1001' THEN
                      substr( r.CUSTOMS_CODE_OLD, 1, 5 ) || '000'
                    ELSE
                      substr(r.CUSTOMS_CODE_OLD, 1, 3) || '00000'
                  END
                 ,d.kbkcode_id
         UNION ALL
           -- на
         SELECT CASE
                  WHEN r.CUSTOMS_CODE_NEW in (p_params.customcode, p_params.ELSCustomCode) THEN
                    r.CUSTOMS_CODE_NEW
                  WHEN substr(r.CUSTOMS_CODE_NEW, 1, 4) = '1000' OR substr(r.CUSTOMS_CODE_NEW, 1, 4) = '1001' THEN
                    substr( r.CUSTOMS_CODE_NEW, 1, 5 ) || '000'
                  ELSE
                    substr(r.CUSTOMS_CODE_NEW, 1, 3) || '00000'
                END            AS customs_code
               ,d.kbkcode_id
               ,0              AS pays
               ,SUM( d.summa ) AS "REUSE"
           FROM fdc_doc_reuse_customs_lst r
               ,fdc_deduction_reuse_lst   d
               ,fdc_doc_reuse_customs_y_lst ry
           WHERE r.ID = ry.CONFIRMED_DOC_ID
             AND r.currency_id = :currency_id
             AND ry.IS_CONFIRM = 'Y'
             AND ry.activation_date BETWEEN :DateFrom AND :DateTo
             AND d.decl_id = r.ID
             AND d.summa   > 0
         GROUP BY CASE
                    WHEN r.CUSTOMS_CODE_NEW in (p_params.customcode, p_params.ELSCustomCode) THEN
                      r.CUSTOMS_CODE_NEW
                    WHEN substr(r.CUSTOMS_CODE_NEW, 1, 4) = '1000' OR substr(r.CUSTOMS_CODE_NEW, 1, 4) = '1001' THEN
                      substr( r.CUSTOMS_CODE_NEW, 1, 5 ) || '000'
                    ELSE
                      substr(r.CUSTOMS_CODE_NEW, 1, 3) || '00000'
                  END
                 ,d.kbkcode_id
)
SELECT
       CASE
         WHEN grouping( kc.code  ) = 0 THEN
           CASE
             WHEN row_number() over ( PARTITION BY kc.name ORDER BY kc.NAME, kc.code ) > 1 THEN
               to_char( NULL )
             ELSE
               CASE
                 WHEN grouping( kc.NAME ) = 0 THEN
                   kc.name
                 ELSE
                   'ИТОГО:'
               END
           END
         ELSE 
           to_char( NULL )
       END                AS name,
       CASE
         WHEN grouping( kc.code  ) = 0 THEN
           kc.code
         ELSE
           'Итого:'
       END            AS kbk,
       NVL( SUM( ret.pays ),     0 ) AS pays,
       NVL( SUM( ret."REUSE" ),  0 ) AS "REUSE"
  FROM kc,
       ret
WHERE kc.id             = ret.kbkcode_id(+)
  AND kc.customs_code_8 = ret.customs_code(+)
GROUP BY ROLLUP(kc.NAME, kc.code)
HAVING not ( grouping( kc.NAME ) = 1 and grouping( kc.code  ) = 1 )
union all
SELECT
       CASE
         WHEN row_number() over ( ORDER BY kc.code ) > 1 THEN
           to_char( NULL )
         ELSE
               'ИТОГО:'
       END            AS name,
       CASE
         WHEN grouping( kc.code  ) = 0 THEN
           kc.code
         ELSE
           'Итого:'
       END            AS kbk,
       NVL( SUM( ret.pays ),     0 ) AS pays,
       NVL( SUM( ret."REUSE" ),  0 ) AS "REUSE"
  FROM kc,
       ret
WHERE kc.id             = ret.kbkcode_id(+)
  AND kc.customs_code_8 = ret.customs_code(+)
GROUP BY ROLLUP(kc.code)


