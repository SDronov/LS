[dsHeader]
select
      (select Name from fdc_customs_lst c where c.customs_code_8  = :pCustomsCode) customsname
     ,(select to_char(:pDateBegin,'dd.mm.yyyy') from dual ) date_begin
     ,(select to_char(:pDateEnd,'dd.mm.yyyy') from dual ) date_end
from dual

[dsReport]
SELECT DISTINCT
      pb.doc_no 
     ,to_char(pb.doc_date,'dd.mm.yyyy') as doc_date 
     ,pb.summa
     ,to_char( fdc_object_getaddmoment( dpr.id ), 'dd.mm.yyyy' ) AS date_post
     ,pb.ext_source||' '||p_nsi_customs.GetCustomsFullNameByCode8(pb.ext_source) as payer_name
     ,pb.KBKCode
     ,trim(pb.po_inn||' '||pb.po_name)                      as recipient_name
     ,(select code2 from fdc_dict where id = dp.reason_id ) as reason_code
     ,dp.DOC_NUMBER                                         as DEC_NUMBER
     ,to_char(dp.DOC_DATE,'dd.mm.yyyy')                     as DEC_DATE
     ,Trim(dp.APP_NUMBER_INCOME||' '||to_char(dp.APP_DATE_INCOME,'dd.mm.yyyy')) as APP_DOC
     ,to_char(dp.date_last_doc,'dd.mm.yyyy')                as date_last_doc
     ,to_char(pby.doc_date,'dd.mm.yyyy')                    as date_confirm
     ,trunc(nvl(pby.doc_date, pb.doc_date))-greatest(nvl(dp.date_court, to_date('01.01.1400','dd.mm.yyyy')), nvl(dp.date_last_doc,nvl(dp.APP_DATE_INCOME,dp.DOC_DATE)))-30  as days
     ,pb.ext_source
     ,dp.id
     ,pb.doc_date AS doc_date2
     ,pb.doc_number
FROM fdc_rel_pack_docs_lst rel
    ,fdc_payment_order_payback_lst pb
    ,fdc_decision_payback_lst dp
    ,fdc_doc_pack_returns_lst dpr
    ,fdc_doc_confirm_lst pby
WHERE rel.Rel_Object_ID(+) = pb.id
  AND pb.dec_pay_id = dp.ID
  AND pb.state_id <> fdc_object_get_bysysname( 'State', 'State.PayBack.Denial' )
  AND dpr.id(+) = rel.Object_ID
  AND pby.confirmed_doc_id(+) = pb.id 
  AND pb.doc_date between :pDateBegin and nvl(:pDateEnd,sysdate)
  AND (    (pb.ext_source like substr(:pCustomsCode,0,3)||'%'
            and :pCustomsCode like '10_00000')
        or (pb.ext_source like substr(:pCustomsCode,0,5)||'%'
            and not :pCustomsCode like '10_00000')
        or :pCustomsCode = '10000000')
  AND trunc(nvl(pby.doc_date, pb.doc_date))-greatest(nvl(dp.date_court, to_date('01.01.1400','dd.mm.yyyy')), nvl(dp.date_last_doc,nvl(dp.APP_DATE_INCOME,dp.DOC_DATE)))-30 > 0
  --AND dpr.ext_source <> p_params.SoftCustomsCode
ORDER BY pb.doc_date desc,pb.doc_number
