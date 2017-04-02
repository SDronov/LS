[dsHeader]
select 
      (select stringvalue from fdc_value_lst_sys where sysname = 'CustomsName') customname
     ,(select stringvalue from fdc_value_lst_sys where sysname = 'PayBossName') nach_otp
     ,(select name from fdc_user_current_lst) fio_isp
     ,(select doc_number from fdc_document_lst where id = :reestr_id) reestr_number
     ,(select to_char(doc_date,'dd.mm.yyyy') from fdc_document_lst where id = :reestr_id) date_reestr
     ,(select to_char(doc_date,'dd month yyyy','NLS_DATE_LANGUAGE=RUSSIAN')||' ã.' from fdc_document_lst where id = :reestr_id) date_reestr1
     ,fdc_docpackreturns_sum(:reestr_id) itogo_summa
from dual

[dsBody]
SELECT 
       pb.doc_number     pb_number
      ,pb.doc_number_ufk pb_number_ufk
      ,pb.doc_date_ufk   pb_date_ufk
      ,pb.summa pb_summa
      ,pb.kbk
      ,pb.po_inn recipient_inn
      ,pb.po_name recipient_name
      ,(dp.bic || ', ' || dp.decl_bank_dest || ', ' || dp.ACCOUNT) bic
      ,nd.code2 as reason_code
      ,dp.app_number
      ,dp.app_date
      ,dp.DOC_NUMBER resh_number
      ,dp.DOC_DATE resh_date
      ,pb.note naznach
FROM fdc_rel_pack_docs_lst rel
    ,fdc_payment_order_payback_lst pb
    ,fdc_decision_payback_lst dp
    ,fdc_nsi_dict_lst nd
WHERE rel.Object_ID = :reestr_id
  AND rel.Rel_Object_ID = pb.id
  AND pb.dec_pay_id = dp.ID
  and dp.reason_id = nd.id(+)
ORDER BY pb.summa, pb.doc_date, pb.doc_number
