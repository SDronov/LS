[dsReport]
WITH kc AS (
SELECT c.customs_code_8, c.name, k.id, k.fmt_code as code
  FROM fdc_kbk_dict_lst k
      ,( SELECT cc.customs_code_8, cc.name
           FROM fdc_customs_lst cc
           WHERE (substr( cc.customs_code_8, 6, 3 ) = '000' or cc.customs_code_8 = p_params.ELSCustomCode)
             AND substr( cc.customs_code_8, 1, 1 ) = '1'
             AND substr( cc.customs_code_8, 2, 1 ) = '0'
             AND cc.customs_code_8 <> '10007000'
             AND cc.customs_code_8 <> '10008000'
             AND nvl( cc.dt_start, :DateTo ) <= :DateTo
             AND nvl( cc.dt_end, :DateFrom ) >= :DateFrom
             AND (   cc.customs_code_8 = p_Params.CustomCode
                  OR p_Params.CustomLevel = 1 AND substr( cc.customs_code_8, 1, 3 ) = substr( p_Params.CustomCode, 1, 3 )
                  OR p_Params.CustomLevel = 0 AND ( cc.customs_code_8 = p_params.ELSCustomCode or
												    substr( cc.customs_code_8, 4, 5 ) = '00000' OR (substr( cc.customs_code_8, 1, 3 ) = '100' 
                                                                                                   and
                                                                                                   substr( cc.customs_code_8, 6, 3 ) = '000'
                                                                                                   and
                                                                                                   (substr( cc.customs_code_8, 4, 1 ) = '0' or substr( cc.customs_code_8, 4, 1 ) = '1')
                                                                                                  )))
         UNION ALL
         SELECT '00000000' AS customs_code_8, ' <Неидентифицированные>' AS name
           FROM dual
        )  c
  WHERE (   k.sdate                   BETWEEN :DateFrom AND :DateTo
         OR nvl( k.edate, :DateFrom ) BETWEEN :DateFrom AND :DateTo )
    AND k.is_for_report = 'Y'
  ORDER BY c.name, k.code
),
ret as (
         SELECT CASE
                  WHEN cpo.TypeSYSNAME = 'PaymentOrderNonIDDest' THEN
                    '00000000'
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
               ,SUM ( cpo.summa ) AS pays
         from fdc_po_credit_lst_all     cpo
         WHERE cpo.exec_date BETWEEN :DateFrom AND :DateTo
           AND cpo.currency_id = :currency_id
           AND cpo.TypeSysName <> 'PaymentOrderRestCustoms'
           AND cpo.IS_ACTIVE   <> 'A'
           AND NOT EXISTS ( SELECT 0
                              FROM fdc_po_nonid_dest n
                              WHERE n.payment_order_id = cpo.id )
         GROUP BY CASE
                    WHEN cpo.TypeSYSNAME = 'PaymentOrderNonIDDest' THEN
                      '00000000'
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
)
SELECT
       CASE
         WHEN grouping( kc.code  ) = 0 THEN
           CASE
             WHEN row_number() over ( PARTITION BY kc.name ORDER BY  kc.name, kc.code ) > 1 THEN
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
       NVL( SUM( ret.pays ),    0 ) AS pays
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
       NVL( SUM( ret.pays ),    0 ) AS pays
  FROM kc,
       ret
WHERE kc.id             = ret.kbkcode_id(+)
  AND kc.customs_code_8 = ret.customs_code(+)
GROUP BY ROLLUP(kc.code)


