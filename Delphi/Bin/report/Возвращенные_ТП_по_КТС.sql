[dsData]
SELECT DISTINCT
 ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) AS sort_order, s.sysName,
 ch.decl_mode,
 CASE ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) 
   WHEN  9 THEN REPLACE( 'Сведения по ДТ, оформленным в таможенной процедуре «mode» ' , 'mode', 
                          ch.mode_name)||'('||ch.decl_mode||')'
   WHEN 19 THEN REPLACE( 'Итого, по видам платежа, по ДТ, оформленным в таможенной процедуре «mode» ' , 'mode', 
                         ch.mode_name)||'('||ch.decl_mode||')'
   WHEN 29 THEN 'ИТОГО, ПО ВИДАМ ПЛАТЕЖА, ПО ДТ, ОФОРМЛЕННЫМ ВО ВСЕХ ТАМОЖЕННЫХ ПРОЦЕДУРАХ'
 ELSE ch.pay_type END AS pay_type,  
 CASE WHEN ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) IN (9,19,29) THEN
   NULL ELSE ch.decl_no END decl_no,  
 CASE WHEN ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) IN (9,19,29) THEN
   NULL ELSE SUM(ABS(ch.summa)) END AS ch_sum,
 CASE ((GROUPING(ch.decl_mode)+ GROUPING(ch.decl_no)+1)*10)+(GROUPING(ch.pay_type)*-1) 
   WHEN 10 THEN decode(s.SYSNAME, 'DecisionPaybackCancel', SUM(ch.summa), ABS(SUM(ch.summa)))
   WHEN 20 THEN ABS(SUM(decode(s.SYSNAME, 'DecisionPaybackCancel', 0, ch.summa))) -- В итогах не учитываем отказы
   WHEN 30 THEN ABS(SUM(decode(s.SYSNAME, 'DecisionPaybackCancel', 0, ch.summa)))-- В итогах не учитываем отказы
   ELSE --(9,19,29) 
     NULL 
   END AS ded_sum
FROM fdc_rep_KTC_charge_lst ch, fdc_object_relation_lst r, fdc_decision_lst d, fdc_state_lst s
WHERE r.object_id     = ch.advice_id
  AND r.rel_object_id = d.id
  AND s.ID = d.state_id
  AND s.SysName IN ('State.DecisionPayment.Signed', 'DecisionPaybackSigned', 'DecisionPaybackCancel')
  AND d.sign_date BETWEEN :DATE_FROM AND :DATE_TO
  AND ch.is_ts = decode(:TS, 0, ch.is_ts, 1, 'Y', -1, 'N')
  AND ch.summa < 0
  AND(
      (0 = :RTYPE AND ch.ch_date BETWEEN :DATE_FROM AND :DATE_TO)
      OR
      (1 = :RTYPE AND ch.ch_date < :DATE_FROM 
        AND EXISTS ( SELECT 0 
                      FROM fdc_advice_deduction_lst ad, fdc_dict pt
                     WHERE ad.advice_id = ch.advice_id
                       AND pt.id = ad.pay_type_id
                       AND pt.code = ch.pay_type
                       AND ad.summa < 0
                       AND ad.decl_id = ch.decl_id)
      )
     ) 
GROUP BY  ROLLUP( ch.decl_mode,ch.mode_name, ch.decl_no), ROLLUP(ch.pay_type), s.SYSNAME
HAVING GROUPING(ch.mode_name) = GROUPING(ch.decl_mode)
ORDER BY  ch.decl_mode NULLS LAST, sort_order, pay_type
