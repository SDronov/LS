[dsHeader]
select
  'ĞÅÅÑÒĞÛ ' ||
  (case :reestr_type
    when 2 then 'ÏÎÄÒÂÅĞÆÄÅÍÈÉ'
    else 'ÓÂÅÄÎÌËÅÍÈÉ'
  end) reestr_type
 ,(case :reestr_type
    when 1 then 'îá óòî÷íåíèè âèäà è ïğèíàäëåæíîñòè ïëàòåæà ïğè èçëèøíåé óïëàòå'
    when 2 then 'èñïîëüçîâàíèÿ ïëàòåæà'
    else 'îá óòî÷íåíèè âèäà è ïğèíàäëåæíîñòè ïëàòåæà'
  end) reestr_name
 ,'"' || to_char(:begin_date,'dd') || '" ' || to_char(:begin_date,'monthyyyy','NLS_DATE_LANGUAGE=RUSSIAN') || ' ã.' as date_from
 ,(select name from fdc_customs_lst where customs_code_8 = :custom_code and rownum = 1) as custom_name
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
where (rskl.recieve_date >= trunc(:begin_date) and rskl.recieve_date < trunc(:begin_date + 1))
  and (rskl.ext_source != p_params.softcustomscode)
  and (rskl.typesysname = (case :reestr_type
                             when 1 then 'ReestrNoticeSpecifyKindPayCorr'
                             when 2 then 'ReestrConfirmSpecifyKindPay'
                             else 'ReestrNoticeSpecifyKindPay'
                           end))
  and (exists(
              select 1
              from fdc_rel_pack_docs_lst rpdl
                  ,fdc_doc_pack_transfer_lst dptl
              where rpdl.rel_object_id = rskl.id
               and rpdl.object_id = dptl.id
               and dptl.customs_out_code = :custom_code
             )
      )
  and rskl.id = rel.object_id
  and rel.rel_object_id = bskl.id
order by 2,1,3
