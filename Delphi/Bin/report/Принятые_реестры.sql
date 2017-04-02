[dsHeader]
SELECT :DATE_FROM AS DATE_FROM,
       :DATE_TO AS DATE_TO,
       'Дата c ' || to_char(:DATE_FROM,'dd.mm.yyyy') || ' по ' || to_char(:DATE_TO,'dd.mm.yyyy') AS Period,
       (select stringvalue from fdc_value_lst_sys where sysname = 'CustomsName') toname
FROM dual

[dsMaster]
-- Принятые реестры, поле ID - обязательно, для Master-Detail
SELECT distinct dp.OBJECT_TYPE_ID AS id, dp.TypeName
FROM fdc_doc_pack_transfer_in_lst tro, fdc_doc_pack_lst dp, fdc_object_relation_lst r
WHERE r.Object_ID = tro.id 
  AND dp.id = r.Rel_Object_ID
  AND tro.load_date BETWEEN :DATE_FROM AND :DATE_TO
ORDER BY dp.TYPENAME  

[dsDetail]
SELECT ROWNUM, cc.*
 FROM (
    SELECT dp.DOC_NUMBER
         ,trunc(dp.DOC_DATE)   AS DOC_DATE
         ,tro.customs_out_code AS Customs_Code
         ,trunc(tro.load_date) AS RECIEVE_DATE
         ,tro.DOC_NUMBER       AS Trans_number
         ,tro.DOC_DATE         AS Trans_Date
         ,tro.file_name
         ,
      CASE 
        WHEN dp.TYPESYSNAME = 'DocPackPayments'     THEN fdc_Doc_Pack_Payments_Summa(dp.id) 
        WHEN dp.TYPESYSNAME LIKE '%SpecifyKindPay%' THEN fdc_skindpay_get_total_summa(dp.id)
        WHEN dp.TYPESYSNAME = 'DocPackReturns'      THEN fdc_docpackreturns_sum(dp.id)
        WHEN dp.TYPESYSNAME = 'DocPackReuse'        THEN fdc_DocPack_Reuse_sum(dp.id)
        WHEN dp.TYPESYSNAME = 'DocPackReturnsY' THEN fdc_docpackreturnsy_sum( dp.id ) 
      ELSE
        0
      END  AS Sum_Pack,
      case when dp.is_ts = 'N' then 'Нет' else 'Да' end is_ts
    FROM fdc_doc_pack_transfer_in_lst tro, fdc_doc_pack_lst dp, fdc_object_relation_lst r
    WHERE r.Object_ID = tro.id 
      AND dp.id = r.Rel_Object_ID
      AND trunc(tro.load_date) BETWEEN :DATE_FROM AND :DATE_TO
      AND dp.OBJECT_TYPE_ID = :ID
    ORDER BY dp.DOC_DATE  ) cc
