[dsHeader]
SELECT a.doc_no, a.doc_date, a.subj_name, a.subj_inn, a.subj_kpp, :SDATE as SDATE, :EDATE as EDATE,
  ( SELECT nvl(SUM(p.Summa), 0)
     FROM fdc_po_lst p 
     WHERE p.ACTIVATION_DATE < :SDATE
       AND p.PAYER_ID = a.subject_id ) AS InTotal,
  ( SELECT nvl(SUM(pd.summa), 0)
      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r
      WHERE dp.AGREEMENT_ID = a.ID
        AND pd.ACTIVATION_DATE < :SDATE      
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = pd.id
  )  +  
 ( SELECT nvl(SUM(ad.summa), 0)
      FROM fdc_advice_deduction_lst ad, fdc_advice_lst av, fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r
      WHERE dp.AGREEMENT_ID = a.ID
        AND av.ACTIVATION_DATE < :SDATE      
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = ad.id
        AND av.id = ad.advice_id) AS OutTotal
     
FROM fdc_bp_agreement_lst a
WHERE 
    a.ID = :AGMT_ID 

[dsData]
SELECT
  q.OperDate, nvl(SUM(q.InSum), 0) AS InSum, nvl(SUM(q.OutSum), 0) AS OutSum
FROM 
  (
   SELECT p.ACTIVATION_DATE AS OperDate, p.Summa AS InSum, 0 AS OutSum 
     FROM fdc_po_lst p 
     WHERE p.ACTIVATION_DATE BETWEEN :SDATE AND :EDATE
       AND EXISTS ( SELECT 1
                      FROM fdc_value_lst v
                      WHERE v.OWNER_OBJECT_ID = :AGMT_ID
                        AND v.Ref_Object_ID = p.ID)
   UNION ALL              
   SELECT pd.activation_date AS OperDate, 0 AS InSum, pd.summa AS OutSum
      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r
      WHERE dp.Agreement_Id = :AGMT_ID
        AND pd.ACTIVATION_DATE BETWEEN :SDATE AND :EDATE     
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = pd.id
   UNION ALL
   SELECT av.ACTIVATION_DATE AS OperDate, 0 AS InSum, ad.summa AS OutSum
      FROM fdc_advice_deduction_lst ad, fdc_advice_lst av, fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r
      WHERE dp.AGREEMENT_ID = :AGMT_ID
        AND av.ACTIVATION_DATE BETWEEN :SDATE AND :EDATE      
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = ad.id
        AND av.id = ad.advice_id     
   ) q  
GROUP BY q.OperDate
ORDER BY q.OperDate

[dsDetail]
SELECT q.KBK, SUM(q.KBKSum) AS KBKSum
FROM (
 SELECT d.fmt_code AS KBK, 
        pd.summa AS KBKSum
      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_knp_lst dp, 
           fdc_rel_pack_docs_lst r, fdc_kbk_dict_lst d
      WHERE dp.Agreement_Id = :AGMT_ID
        AND pd.ACTIVATION_DATE = :OPERDATE
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = pd.id
        AND d.id = pd.kbkcode_id
 UNION ALL
  SELECT d.fmt_code AS KBK, 
         ad.summa AS KBKSum
      FROM fdc_advice_deduction_lst ad, fdc_advice_lst av, fdc_doc_pack_gtd_knp_lst dp, 
           fdc_rel_pack_docs_lst r,  fdc_kbk_dict_lst d
      WHERE dp.AGREEMENT_ID = :AGMT_ID
        AND av.ACTIVATION_DATE = :OPERDATE    
        AND r.Object_ID = dp.id
        AND r.Rel_Object_ID = ad.id
        AND av.id = ad.advice_id  
        AND d.id = ad.kbkcode_id) q       
GROUP BY q.KBK
ORDER BY q.KBK
