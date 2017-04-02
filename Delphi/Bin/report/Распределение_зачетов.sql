[dsAppendix]
SELECT d.code2 AS reason, replace(translate(t.typename, 'ё', 'е'), 'Решение о зачете', 'Зачет') typename, t.inn, t.kpp, t.subj_name, t.doc_number, 
CASE WHEN grouping(d.code2) = 1 THEN 'ИТОГО' 
        WHEN Grouping(t.doc_number) = 1 AND nvl(Sum(t.summa ), 0)>0 THEN 'Итого по '||d.code2
   ELSE to_char(t.doc_date, 'DD.MM.YYYY') END doc_date, 
   nvl(Sum(t.summa ), 0) as summa
FROM fdc_nsi_dict_lst d
LEFT OUTER JOIN fdc_rep_dec_payment_lst t ON t.sign_date BETWEEN :DATE_FROM AND :DATE_TO AND t.reason_code = d.CODE2
WHERE d.TypeSYSNAME  = 'AssetsReason'
  AND d.EDATE IS NULL
GROUP BY  ROLLUP (d.code2, (t.doc_date, t.typename, t.inn, t.kpp, t.subj_name, t.doc_number))
HAVING t.doc_number IS NOT NULL OR Grouping(t.doc_number) = 1
