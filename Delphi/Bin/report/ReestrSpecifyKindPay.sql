[dsHeader]
select
  (case :reestr_type
    when 'ReestrNoticeSpecifyKindPayCorr' then 'об уточнении вида и принадлежности платежа при излишней уплате'
    when 'ReestrConfirmSpecifyKindPay' then 'использования платежа'
    else 'об уточнении вида и принадлежности платежа' --'ReestrNoticeSpecifyKindPay'
  end) reestr_name
 ,'РЕЕСТР ' ||
 (case :reestr_type
    when 'ReestrConfirmSpecifyKindPay' then 'ПОДТВЕРЖДЕНИЙ'
    else 'УВЕДОМЛЕНИЙ' --'ReestrNoticeSpecifyKindPay','ReestrNoticeSpecifyKindPayCorr'
  end) ||
  ' № '|| :reestr_number reestr_number
 ,'"' || to_char(:begin_date,'dd') || '" ' || to_char(:begin_date,'monthyyyy','NLS_DATE_LANGUAGE=RUSSIAN') || ' г.' as date_from
 ,(select name from fdc_customs_lst where customs_code_8 = :custom_code and rownum = 1) as custom_name
from dual

[dsBody]
select bskl.doc_number
      ,bskl.doc_date
      ,bskl.kbk_code_s
      ,bskl.summa      summa_s
      ,bskl.kbk_code_t
      ,bskl.summa      summa_t
from fdc_reestr_specify_kindpay_lst rskl
    ,fdc_rel_reestr_skindpay_lst    rel
    ,fdc_bud_specify_kindpay_lst    bskl
where rskl.id = :reestr_id
  and rskl.id = rel.object_id
  and rel.rel_object_id = bskl.id
order by 1
