[dsData]
SELECT po.id, po.DOC_NUMBER, po.DOC_DATE, po.EXEC_DATE, po.payer_name, po.payer_inn, po.payer_kpp, nvl(po.SUMMA, po.DOC_SUMMA) summa, 
    CASE WHEN po.TypeSYSNAME = 'PaymentOrderNonIDKBK' THEN '' ELSE po.kbk END AS kbk, 
    CASE WHEN po.TypeSYSNAME = 'PaymentOrderNonIDDest' THEN '' ELSE po.DestCustomsCode END AS DestCustomsCode, 
    po.NOTE,
 CASE WHEN substr( po.DestCustomsCode, 1, 3) = '100' THEN substr(po.DestCustomsCode, 1, 5)||'000' 
      ELSE substr(po.DestCustomsCode, 1, 3)||'00000' END AS DEST
FROM fdc_po_credit_lst_all po
WHERE po.EXEC_DATE BETWEEN :DATE_FROM AND :DATE_TO
   AND ('Все' = :INN OR po.payer_inn = :INN )
   AND ('Все' = :FILTER_TO OR decode( substr(:FILTER_TO, 1, 3), '100', 
                                      substr(po.DestCustomsCode,1,5)||'000',  
                                      substr(po.DestCustomsCode,1,3)||'00000') = :FILTER_TO
       )                                             
   AND NOT EXISTS ( SELECT 0
                      FROM fdc_payment_order_non_id n
                     WHERE po.ID = n.ID
                       AND n.payment_order_id IS NOT NULL )
ORDER BY po.exec_date