[dsPayerList]
select doc_no, doc_date, :sdate sdate, :edate edate from fdc_bp_agreement_lst where id = :id

[dsMain]
SELECT q.CustomsCode, 
       c.Name AS CustomsName ,
       cd.g0131_code AS DeclType,
       cd.Name AS DeclFullNumber, 
       SUM(q.SumSbor) AS SumSbor, 
       SUM(q.SumPlus) AS SumPlus, 
       SUM(q.SumMinus) AS SumMinus
FROM  (  
				SELECT 
					 dp.EXT_SOURCE AS CustomsCode,
					 pd.decl_id,
					 CASE WHEN pt.code = '100' THEN pd.summa ELSE 0 END AS SumSbor,
					 CASE WHEN pt.code <> '100' AND pd.summa > 0 THEN pd.summa ELSE 0 END AS SumPlus,  
					 CASE WHEN pt.code <> '100' AND pd.summa < 0 THEN pd.summa ELSE 0 END AS SumMinus
				FROM fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r, fdc_payment_deduction_all_lst pd, fdc_dict_lst pt  
				WHERE dp.DOC_DATE BETWEEN :SDATE AND :EDATE
					AND dp.AGREEMENT_ID = :AGMT_ID
					AND r.Object_ID = dp.ID
					AND r.Rel_Object_ID = pd.ID
					AND pt.id(+) = pd.pay_type_id
          AND pd.typesysname <> 'DeclRePayment'
          AND pd.is_active <> 'A'
     ) q, fdc_custom_decl_lst cd, fdc_customs_lst c
WHERE cd.id = q.decl_id     
  AND c.customs_code_8 = q.CustomsCode
GROUP BY q.CustomsCode, 
       c.Name, 
       cd.g0131_code,
       cd.Name,
       cd.reg_date, 
       cd.decl_no
ORDER BY q.CustomsCode, cd.reg_date, cd.decl_no
