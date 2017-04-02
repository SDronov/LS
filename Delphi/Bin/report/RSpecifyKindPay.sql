[dsHeader]
select
  :reestr_type_name reestr_type_name
 ,'"' || to_char(:begin_date,'dd') || '" ' || to_char(:begin_date,'monthyyyy','NLS_DATE_LANGUAGE=RUSSIAN') || ' г.' as date_from
 ,'"' || to_char(:end_date,'dd') || '" ' || to_char(:end_date,'monthyyyy','NLS_DATE_LANGUAGE=RUSSIAN') || ' г.' as date_to
 ,'"' || to_char(sysdate,'dd') || '" ' || to_char(sysdate,'monthyyyy','NLS_DATE_LANGUAGE=RUSSIAN') || ' г.' as date_now
 ,(select name from fdc_customs_lst where id = p_params.customsid) as custom_name
 ,:classreestr as classreestr
 ,(case :ists when 'Y' then 'Да' when 'N' then 'Нет' else 'Все' end) ts
from dual

[dsBody]
select rskl.doc_number reestr_number
      ,rskl.doc_date   reestr_date
      ,bskl.doc_number
      ,bskl.doc_date
      ,bskl.kbk_code_s
      ,bskl.summa      summa_s
      ,bskl.kbk_code_t
      ,bskl.summa      summa_t
from fdc_reestr_specify_kindpay_lst rskl
    ,fdc_rel_reestr_skindpay_lst    rel
    ,fdc_bud_specify_kindpay_lst    bskl
where (rskl.doc_date >= trunc(:begin_date) and rskl.doc_date < trunc(:end_date + 1))
  and (rskl.typesysname = (case :reestr_type
                             when 0 then 'ReestrNoticeSpecifyKindPayCorr'
                             when 1 then 'ReestrNoticeSpecifyKindPay'
                             else 'ReestrConfirmSpecifyKindPay'
                           end))
  and rskl.currency_id = :currid
  and (rskl.is_ts = nvl(:ists,rskl.is_ts))
  and (
       (NVL(:show,0) = 0)
       or
       (rskl.state_id in (
                      select id
                      from fdc_state_lst
                      where (:show = 1 and sysname = 'State.PackSpecifyKindPay.Accepted')  -- Принят
                         or (:show = 2 and sysname IN ( 'State.PackSpecifyKindPay.Send', 'State.PackSpecifyKindPay.Conducted' )) -- Отправлен
                         or (:show = 3 and sysname = 'State.PackSpecifyKindPay.Generated') -- Сформирован
                     )
       )
      )
  and rskl.id = rel.object_id
  and rel.rel_object_id = bskl.id
order by 2,1,3

[dsItogo]
select (case rownum when 1 then 'Итого по КБК:' else null end) name
       ,kbk_code_s
       ,summa_s
       ,kbk_code_t
       ,summa_t
from (
select bskl.kbk_code_s
      ,sum(bskl.summa)      summa_s
      ,bskl.kbk_code_t
      ,sum(bskl.summa)      summa_t
from fdc_reestr_specify_kindpay_lst rskl
    ,fdc_rel_reestr_skindpay_lst    rel
    ,fdc_bud_specify_kindpay_lst    bskl
where (rskl.doc_date >= trunc(:begin_date) and rskl.doc_date < trunc(:end_date + 1))
  and (rskl.typesysname = (case :reestr_type
                             when 0 then 'ReestrNoticeSpecifyKindPayCorr'
                             when 1 then 'ReestrNoticeSpecifyKindPay'
                             else 'ReestrConfirmSpecifyKindPay'
                           end))
  and rskl.currency_id = :currid
  and (rskl.is_ts = nvl(:ists,rskl.is_ts))
  and (
       (NVL(:show,0) = 0)
       or
       (rskl.state_id in (
                      select id
                      from fdc_state_lst
                      where (:show = 1 and sysname = 'State.PackSpecifyKindPay.Accepted')  -- Принят
                         or (:show = 2 and sysname IN ( 'State.PackSpecifyKindPay.Send', 'State.PackSpecifyKindPay.Conducted' )) -- Отправлен
                         or (:show = 3 and sysname = 'State.PackSpecifyKindPay.Generated') -- Сформирован
                     )
       )
      )
  and rskl.id = rel.object_id
  and rel.rel_object_id = bskl.id
group by bskl.kbk_code_s
        ,bskl.kbk_code_t
)

