[dsHeader]
 select 
    to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO,   'DD.MM.YYYY' ) date_to
    ,fdc_valuestring_sys_get( 'CustomsName' )||'. ' AS CustomsName
    ,fdc_valuestring_sys_get( 'CustomsCode' ) as CustomsCode
 from dual
 
[dsData]
select distinct -- возвраты (ВАв, ВИз, ВДз, ВПр) 
       dpb.customs_code,
       dpb.CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dpb.doc_number,
       dpb.doc_date,
       pby.DOC_DATE as date_confirmed,
       CASE dpb.TypeSysName 
         when 'DecPaybackDeposit'  then 'ВДз'    -- Возврат денежного залога
         when 'DecPaybackPay'      then 'ВИзУпл' -- Возврат излишне уплаченных средств
         when 'DecPaybackLevy'     then 'ВИзВз'  -- Возврат излишне взысканных средств
         when 'DecPaybackTimeOut'  then 'ВПр'    -- Возврат процентов за за нарушение сроков возврата 
         when 'DecPaybackAdvance'  then 'ВАв'    -- Возврат авансовых платежей
         when 'DecPaybackPeriodic' then 'ВИзПер' -- Возврат излишней уплаты при период. временном декларировании      
       ELSE '' END as doc_code,
       'возврат' as doc_type,
       db.code_name as doc_base,
       dpb.decision_court as doc_base_code,
       dpb.reason_name,
       dic.code as reason_code,
       dsr.name as sud_reason_name,
       dsr.code as sud_reason_code,
       (select sum(t.DOC_SUMMA) from fdc_po_payback_lst t where t.DEC_PAY_ID=dpb.id group by dpb.id) as summa 
from fdc_po_payback_y_lst pby -- подтверждение возврата из ОрФК
    ,fdc_po_payback_lst pb -- заявки на возврат в ОрФК
    ,fdc_subject_lst s -- плательщики
    ,fdc_dict_lst dic
    ,fdc_decision_payback_lst dpb --решения о возврате
    ,oi_doc_base_lst db -- справочник документа-основания
    ,fdc_dict_sud_reason_lst dsr --справочник причин  
where  
  pby.doc_date between :DATE_FROM and :DATE_TO  -- диапазон сбора отчета (задаваемые параметры)
  --pby.DOC_DATE between to_date('01.01.2014') and to_date('31.12.2014')
  and pby.confirmed_doc_id = pb.id -- подтверждение связано с заявкой
  and dpb.reason_id = dic.id(+)
  and pb.STATE_ID = (select id from fdc_state_lst where sysname = 'State.PayBack.Confirm')-- подтверждено
  and pby.IS_CONFIRM = 'Y'-- подтверждено из ОрФК
--  and (pb.ext_source = p_params.softcustomscode) -- по коду таможни (задаваемый параметр)
--  and pb.EXT_SOURCE='10117000' -- Ярославская
  and pb.recipient_id = s.id(+) -- связь с данными плательщика
  and pb.dec_pay_id = dpb.id -- связь решения с заявкой
  and dpb.sud_reason_id=dsr.id(+) -- связь решения со справочником причин
  and dpb.decision_court=db.doc_code -- связь с кодом документа-основания

union all -- объединяем с зачетами (ЗДз, ЗИз, ЗИзПер)
select dpl.customs_code,
       NVL( c.FULL_NAME, c.NAME) as CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dpl.doc_number,
       dpl.doc_date,
       dpl.sign_date as date_confirmed,
       CASE dpl.typesysname 
         when 'DecisionPayment'        then 'ЗИз'      -- Зачет в счет будущих таможенных платежей
         when 'DecisionPaymentDeposit' then 'ЗДз'      -- Зачет денежного залога в счет там. платежей 
         when 'DecisionPaymentPeriodic'then 'ЗИзПер'   -- Зачет излишней уплаты при период. платежах      
       ELSE '' END as doc_code,
       'зачет' as doc_type,
       db.code_name as doc_base,
       dpl.decision_court as doc_base_code,
       dic.name as reason_name,
       dic.code as reason_code,
       dsr.name as sud_reason_name,
       dsr.code as sud_reason_code,
       dpl.summa 
from fdc_decision_payment_lst dpl -- решения по зачету
    ,fdc_customs_lst c
    ,fdc_subject_lst s
    ,fdc_dict_lst dic
    ,oi_doc_base_lst db -- справочник документа-основания
    ,fdc_dict_sud_reason_lst dsr --справочник причин  
    ,(select rel_object_id, objtypesysname
      from fdc_rel_advice_dec_lst
      group by rel_object_id, objtypesysname
      ) rel -- Уведомления
where  
  dpl.sign_date between :DATE_FROM and :DATE_TO 
  --dpl.sign_date between to_date('01.01.2014') and to_date('31.12.2014')
  and dpl.subject_id = s.id(+)
  and dpl.reason_id = dic.id(+)
  and dpl.STATE_ID = (select id from fdc_state_lst where sysname = 'State.DecisionPayment.Signed')-- подписано
  and dpl.decision_court=db.doc_code -- связь с кодом документа-основания
  and dpl.sud_reason_id=dsr.id(+) -- связь решения со справочником причин
  and dpl.id = rel.rel_object_id(+)--связь Решение - Уведомление
  and c.customs_code_8=dpl.ext_source
  

union all -- объединяем с зачетами в другом ТО (ТВа)
select dr.customs_code,
       NVL( c.FULL_NAME, c.NAME) as CustomsFullName,
       s.INN,
       s.KPP,
       s.Name,
       s.TypeName,
       dr.doc_number,
       dr.doc_date,
       dr.activation_date as date_confirmed,
       dr.doc_code,
       'зачет' as doc_type,
       '' as doc_base,
       'N' as doc_base_code,
       dr.REASON as reason_name,
       rc.code as reason_code,
       '' as sud_reason_name,
       '' as sud_reason_code,
       dr.AMOUNT as summa 

from fdc_doc_reuse_customs_lst dr
    ,fdc_customs_lst c
    ,oi_reuse_customs_rc_lst rc
    ,fdc_subject_lst s
where dr.state_id in (select id from fdc_state_lst where sysname in ('State.Reuse.Confirm'))
  and exists
        (select 1 from fdc_doc_reuse_customs_Y_lst t 
           where dr.ID=t.CONFIRMED_DOC_ID
                 and t.doc_date between :DATE_FROM and :DATE_TO )
                 --and t.DOC_DATE between to_date('01.01.2014') and to_date('31.12.2014'))
  and dr.REASON=rc.reason-- связь с кодом документа-основания
  and dr.subject_id = s.id(+)
  and c.customs_code_8=dr.customs_code

union all -- уплаты за период
select '"' customs_code,
       '"' CustomsFullName,
       '"' INN,
       '"' KPP,
       '"' Name,
       '"' TypeName,
       '"' doc_number,
       to_date(null) doc_date,
       to_date(null) date_confirmed,
       '"' as doc_code,
       'поступление' as doc_type,
       '"' as doc_base,
       'N' as doc_base_code,
       '"' as reason_name,
       '"' as reason_code,
       '"' as sud_reason_name,
       '"' as sud_reason_code,
       sum(po.summa) summa
 
from FDC_PO_LST po
    ,fdc_customs_lst c
    ,fdc_subject_lst s
    
where  
  po.activation_date between :DATE_FROM and :DATE_TO 
 -- po.activation_date between to_date('01.01.2014') and to_date('31.12.2014')
  and po.state_id in(select sl.ID from FDC_STATE_LST sl where sl.sysname ='PaymentOrderConfirm')
  and po.typesysname not in ('CustomCheque' )-- не считаем неподтвержденные чеки
  and po.payer_id = s.id(+)
  and c.customs_code_8=po.destcustomscode
