[dsData]
SELECT DISTINCT
 ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1)    AS sort_order,
 ch.decl_mode,
 CASE ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) 
   WHEN  9 THEN REPLACE( 'Ñâåäåíèÿ ïî ÄÒ, îôîðìëåííûì â òàìîæåííîé ïðîöåäóðå «mode» ' , 'mode', 
                          ch.mode_name)||'('||ch.decl_mode||')'
   WHEN 19 THEN REPLACE( 'Èòîãî, ïî âèäàì ïëàòåæà, ïî ÄÒ, îôîðìëåííûì â òàìîæåííîé ïðîöåäóðå «mode» ' , 'mode', 
                         ch.mode_name)||'('||ch.decl_mode||')'
   WHEN 29 THEN 'ÈÒÎÃÎ, ÏÎ ÂÈÄÀÌ ÏËÀÒÅÆÀ, ÏÎ ÄÒ, ÎÔÎÐÌËÅÍÍÛÌ ÂÎ ÂÑÅÕ ÒÀÌÎÆÅÍÍÛÕ ÏÐÎÖÅÄÓÐÀÕ'
 ELSE '   '||ch.pay_type END AS pay_type,  
 CASE WHEN ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) IN (9,19,29) THEN
   NULL ELSE ch.decl_no END decl_no,  
 CASE WHEN ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) IN (9,19,29) THEN
   NULL ELSE SUM(ch.summa) END AS ch_sum
FROM fdc_rep_KTC_charge_lst ch
WHERE ch.is_ts = decode(:TS, 0, ch.is_ts, 1, 'Y', -1, 'N')
  AND ch.summa > 0
  AND(
      (0 = :RTYPE AND ch.ch_date BETWEEN :DATE_FROM AND :DATE_TO)
      OR
      (1 = :RTYPE AND ch.ch_date < :DATE_FROM 
        AND EXISTS ( SELECT 0 
                      FROM fdc_payment_deduction pd, fdc_document_lst d, fdc_dict pt
                     WHERE pd.id = d.ID
                       AND pd.decl_id = ch.decl_id
                       --AND d.TypeSysName = 'DeclPayment'
                       AND pt.id = pd.pay_type_id
                       AND pt.code = ch.pay_type
                       AND pd.summa > 0
                       AND d.is_active = 'Y'
                       AND d.activation_date between :DATE_FROM AND :DATE_TO )
      )
     ) 
GROUP BY ROLLUP( ch.decl_mode,ch.mode_name, ch.decl_no), ROLLUP(ch.pay_type)
HAVING GROUPING(ch.mode_name) = GROUPING(ch.decl_mode)
ORDER BY ch.decl_mode NULLS LAST, sort_order, pay_type

