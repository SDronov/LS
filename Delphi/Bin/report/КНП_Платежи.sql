[dsMain3]
WITH cst AS 
   (-- Все таможни для отчета по КНП
      SELECT c.id, c.customs_code_8, c.NAME
        FROM fdc_customs_lst c
        WHERE (c.customs_code_8 IN ('10005000', '10006000', '10009000', '10012000') OR
               c.customs_code_8 LIKE '10_00000')                  
              AND c.customs_code_8 <> p_params.CustomCode 
      ORDER BY c.customs_code_8
         ),
    deduct AS
     (
      SELECT nvl(SUM(d.summa), 0) AS Summa,
           CASE WHEN dp.ext_source LIKE '100%' THEN
             dp.EXT_SOURCE
           ELSE 
             substr(dp.EXT_SOURCE, 1, 3)||'00000' END AS CustomsCode
        FROM fdc_doc_pack_gtd_knp_lst dp, fdc_payment_deduction_all_lst d, fdc_rel_pack_docs_lst r
        WHERE r.Object_ID = dp.ID
          AND r.Rel_Object_ID = d.id
          AND trunc(dp.DOC_DATE) BETWEEN :fdate AND :edate
        GROUP BY CASE WHEN dp.ext_source LIKE '100%' THEN dp.EXT_SOURCE
                      ELSE substr(dp.EXT_SOURCE, 1, 3)||'00000' END  
     ),
    deductTotal AS
     (
      SELECT nvl(SUM(d.summa), 0) AS Summa,
           CASE WHEN dp.ext_source LIKE '100%' THEN
             dp.EXT_SOURCE
           ELSE 
             substr(dp.EXT_SOURCE, 1, 3)||'00000' END AS CustomsCode
        FROM fdc_doc_pack_gtd_knp_lst dp, fdc_payment_deduction_all_lst d, fdc_rel_pack_docs_lst r
        WHERE r.Object_ID = dp.ID
          AND r.Rel_Object_ID = d.id
          AND trunc(dp.DOC_DATE) BETWEEN :FYEARSTART AND :edate
        GROUP BY CASE WHEN dp.ext_source LIKE '100%' THEN dp.EXT_SOURCE
                      ELSE substr(dp.EXT_SOURCE, 1, 3)||'00000' END  

     )      
 SELECT ct.customs_code_8 AS CustCode, ct.Name, nvl(dd.Summa, 0) AS Summa, nvl(dt.Summa, 0) AS Total,
       ABS(nvl(dd.Summa, 0) + nvl(dt.Summa, 0)) AS a0, 
       :fdate fdate,
       :edate edate
   FROM cst ct, deduct dd, deductTotal dt
   WHERE dd.CustomsCode(+) = ct.customs_code_8 
     AND dt.CustomsCode(+) = ct.customs_code_8
ORDER BY ct.customs_code_8
[dsData3]
WITH  kbk AS
   ( SELECT max(k.id), k.fmt_code  
       FROM fdc_kbk_dict_lst k
       WHERE :fdate BETWEEN k.sdate AND nvl(k.edate, :fdate) AND
             :edate BETWEEN k.sdate AND nvl(k.edate, :edate)
         AND k.is_for_report = 'Y'
       GROUP BY k.fmt_code),
    deduct AS
     (SELECT q.*
       FROM (
							SELECT kl.fmt_code, nvl( Sum(d.summa),0) AS Summa,
									 CASE WHEN dp.ext_source LIKE '100%' THEN
										 dp.EXT_SOURCE
									 ELSE 
										 substr(dp.EXT_SOURCE, 1, 3)||'00000' END AS CustomsCode
								FROM fdc_doc_pack_gtd_knp_lst dp, fdc_payment_deduction_all_lst d, fdc_rel_pack_docs_lst r, fdc_kbk_dict_lst kl
								WHERE r.Object_ID = dp.ID
									AND r.Rel_Object_ID = d.id
									AND kl.id = d.kbkcode_id
                  AND kl.is_for_report = 'Y'
									AND trunc(dp.DOC_DATE) BETWEEN :fdate AND :edate
                  GROUP BY kl.fmt_code, CASE WHEN dp.ext_source LIKE '100%' THEN dp.EXT_SOURCE
                      ELSE substr(dp.EXT_SOURCE, 1, 3)||'00000' END
           ) q 
       WHERE q.CustomsCode = :CustCode           
     ),
    deductTotal AS
     (SELECT q.*
       FROM (
							SELECT kl.fmt_code, nvl( Sum(d.summa),0) AS Summa,
									 CASE WHEN dp.ext_source LIKE '100%' THEN
										 dp.EXT_SOURCE
									 ELSE 
										 substr(dp.EXT_SOURCE, 1, 3)||'00000' END AS CustomsCode
								FROM fdc_doc_pack_gtd_knp_lst dp, fdc_payment_deduction_all_lst d, fdc_rel_pack_docs_lst r, fdc_kbk_dict_lst kl
								WHERE r.Object_ID = dp.ID
									AND r.Rel_Object_ID = d.id
									AND kl.id = d.kbkcode_id
                  AND kl.is_for_report = 'Y'
									AND trunc(dp.DOC_DATE) BETWEEN :FYEARSTART AND :edate
                  GROUP BY kl.fmt_code, CASE WHEN dp.ext_source LIKE '100%' THEN dp.EXT_SOURCE
                      ELSE substr(dp.EXT_SOURCE, 1, 3)||'00000' END
             ) q 
       WHERE q.CustomsCode = :CustCode
     )      
 SELECT kk.fmt_code AS NAME, 
    nvl(dd.Summa, 0) AS Summa, 
    nvl(dt.Summa, 0) AS Total, 
    ABS(nvl(dd.Summa, 0) + nvl(dt.Summa, 0)) AS a0
   FROM kbk kk, deduct dd, deductTotal dt
   WHERE dd.fmt_code(+) = kk.fmt_code 
     AND dt.fmt_code(+) = kk.fmt_code
ORDER BY kk.fmt_code
