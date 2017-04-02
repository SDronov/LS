[dsHeader]
select
  'за период c ' || to_char(:begin_date,'dd.mm.yyyy') || ' по ' || to_char(:end_date,'dd.mm.yyyy') as period,
  fdc_valuestring_sys_get('PayBossName') AS PayBossName,
  fdc_valuestring_sys_get('CustomsName') AS CustomsName
from dual

[dsBody]
SELECT rownum, cc.*
 FROM (SELECT p.PaySysName, p.CardNum, p.payer_name, p.payer_inn, cd.NAME AS Decl_No, p.DOC_NUMBER, p.curr_code, SUM(d.summa) AS Summa
        FROM fdc_po_cheque_lst p, fdc_payment_deduction_lst d, fdc_doc_charge_lst cd
        WHERE d.payment_id = p.ID
          AND cd.ID = d.decl_id
          AND d.payment_date BETWEEN :begin_date AND :end_date
        GROUP BY  p.PaySysName, p.CardNum, p.payer_name, p.payer_inn, cd.name, p.DOC_NUMBER,  p.curr_code
        HAVING SUM(d.summa) > 0
        ORDER BY p.CardNum, p.doc_number) cc
