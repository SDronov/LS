[dsAppendix]
SELECT d.code2 AS reason, replace(t.typename, 'Решение о возврате', 'Возврат') typename, t.inn, t.kpp, t.subj_name, t.doc_number, 
   CASE WHEN grouping(d.code2) = 1 THEN 'ИТОГО' 
        WHEN Grouping(t.doc_number) = 1 AND nvl(Sum(t.summa ), 0)>0 THEN 'Итого по '||d.code2
   ELSE to_char(t.doc_date, 'DD.MM.YYYY') END doc_date, 
   nvl(Sum(r.summa ), 0) as summa
FROM fdc_nsi_dict_lst d
INNER JOIN fdc_rep_payback_lst  t   ON t.reason_code = d.CODE2
INNER JOIN fdc_po_payback_lst   r   ON r.DEC_PAY_ID = t.id
INNER JOIN fdc_po_payback_y_lst r_y ON r_y.CONFIRMED_DOC_ID = r.id and r_y.IS_CONFIRM = 'Y' and r_y.DOC_DATE BETWEEN :DATE_FROM AND :DATE_TO
WHERE d.TypeSYSNAME = 'AssetsReason'
-- AND d.EDATE IS NULL
GROUP BY  ROLLUP (d.code2, (t.doc_date, t.typename, t.inn, t.kpp, t.subj_name, t.doc_number))
HAVING t.doc_number IS NOT NULL OR Grouping(t.doc_number) = 1
