[dsHeader]
select dt.*
      ,(case when (payback_summa = 0) then 0 else (payback_summa_147_sud_Levy/payback_summa) end)  payback_summa_147_sud_Levy_prc
      ,(case when (payback_cn = 0) then 0 else (payback_cn_147_sud_Levy/payback_cn) end)  payback_cn_147_sud_Levy_prc
      ,(case when (dec_summa = 0) then 0 else (dec_summa_147_sud_Levy/dec_summa) end) dec_summa_147_sud_Levy_prc
      ,(case when (dec_cn = 0) then 0 else (dec_cn_147_sud_Levy/dec_cn) end)  dec_cn_147_sud_Levy_prc
from (
select  '—водные данные по возвратам/зачетам '||
        (
         case when ( :DATE_FROM
                     =
                     :DATE_TO )
              then 'на '||to_char( :DATE_FROM ,'dd.mm.yyyy')||' г.' 
              else 'с '||to_char( :DATE_FROM ,'dd.mm.yyyy' )||' г. по '||to_char( :DATE_TO ,'dd.mm.yyyy' )||' г.' 
         end
        ) period
       , :DATE_FROM date_from
       , :DATE_TO date_to
       ,sum(payback_cn) payback_cn
       ,sum(payback_summa) payback_summa
       ,sum(payback_cn_150000) payback_cn_150000
       ,sum(payback_summa_150000) payback_summa_150000
       ,sum(payback_cn_fz) payback_cn_fz
       ,sum(payback_summa_fz) payback_summa_fz
       ,sum(payback_cn_ul) payback_cn_ul
       ,sum(payback_summa_ul) payback_summa_ul
       ,sum(payback_cn_122) payback_cn_122
       ,sum(payback_summa_122) payback_summa_122
       ,sum(payback_cn_149) payback_cn_149
       ,sum(payback_summa_149) payback_summa_149
       ,sum(payback_cn_122_akc) payback_cn_122_akc
       ,sum(payback_summa_122_akc) payback_summa_122_akc
       ,sum(payback_cn_147) payback_cn_147
       ,sum(payback_summa_147) payback_summa_147
       ,sum(payback_cn_147_3) payback_cn_147_3
       ,sum(payback_summa_147_3) payback_summa_147_3
       ,sum(payback_cn_147_5) payback_cn_147_5
       ,sum(payback_summa_147_5) payback_summa_147_5
       ,sum(payback_cn_147_6) payback_cn_147_6
       ,sum(payback_summa_147_6) payback_summa_147_6
       ,sum(payback_cn_TimeOut) payback_cn_TimeOut
       ,sum(payback_summa_TimeOut) payback_summa_TimeOut
       ,sum(payback_cn_147_sud_Pay) payback_cn_147_sud_Pay
       ,sum(payback_summa_147_sud_Pay) payback_summa_147_sud_Pay
       ,sum(payback_cn_147_1_sud_Pay) payback_cn_147_1_sud_Pay
       ,sum(payback_summa_147_1_sud_Pay) payback_summa_147_1_sud_Pay
       ,sum(payback_cn_147_2_sud_Pay) payback_cn_147_2_sud_Pay
       ,sum(payback_summa_147_2_sud_Pay) payback_summa_147_2_sud_Pay
       ,sum(payback_cn_147_sud_Levy) payback_cn_147_sud_Levy
       ,sum(payback_summa_147_sud_Levy) payback_summa_147_sud_Levy
       ,sum(payback_cn_147_1_sud_Levy) payback_cn_147_1_sud_Levy
       ,sum(payback_summa_147_1_sud_Levy) payback_summa_147_1_sud_Levy
       ,sum(payback_cn_147_2_sud_Levy) payback_cn_147_2_sud_Levy
       ,sum(payback_summa_147_2_sud_Levy) payback_summa_147_2_sud_Levy
       ,sum(payback_cn_adminto) payback_cn_adminto
       ,sum(payback_summa_adminto) payback_summa_adminto
       ,sum(payback_cn_148) payback_cn_148
       ,sum(payback_summa_148) payback_summa_148
       ,sum(payback_cn_148_1) payback_cn_148_1
       ,sum(payback_summa_148_1) payback_summa_148_1
       ,sum(payback_cn_148_2) payback_cn_148_2
       ,sum(payback_summa_148_2) payback_summa_148_2
       ,sum(payback_cn_148_3) payback_cn_148_3
       ,sum(payback_summa_148_3) payback_summa_148_3
       ,sum(payback_cn_148_4) payback_cn_148_4
       ,sum(payback_summa_148_4) payback_summa_148_4
       ,sum(payback_cn_148_5) payback_cn_148_5
       ,sum(payback_summa_148_5) payback_summa_148_5
       ,sum(payback_cn_148_6) payback_cn_148_6
       ,sum(payback_summa_148_6) payback_summa_148_6
       ,sum(dec_cn) dec_cn
       ,sum(dec_summa) dec_summa
       ,sum(dec_cn_150000) dec_cn_150000
       ,sum(dec_summa_150000) dec_summa_150000
       ,sum(dec_cn_fz) dec_cn_fz
       ,sum(dec_summa_fz) dec_summa_fz
       ,sum(dec_cn_ul) dec_cn_ul
       ,sum(dec_summa_ul) dec_summa_ul
       ,sum(dec_cn_122) dec_cn_122
       ,sum(dec_summa_122) dec_summa_122
       ,sum(dec_cn_149) dec_cn_149
       ,sum(dec_summa_149) dec_summa_149
       ,sum(dec_cn_122_akc) dec_cn_122_akc
       ,sum(dec_summa_122_akc) dec_summa_122_akc
       ,sum(dec_cn_147) dec_cn_147
       ,sum(dec_summa_147) dec_summa_147
       ,sum(dec_cn_147_3) dec_cn_147_3
       ,sum(dec_summa_147_3) dec_summa_147_3
       ,sum(dec_cn_147_5) dec_cn_147_5
       ,sum(dec_summa_147_5) dec_summa_147_5
       ,sum(dec_cn_147_6) dec_cn_147_6
       ,sum(dec_summa_147_6) dec_summa_147_6
       ,sum(dec_cn_TimeOutl) dec_cn_TimeOutl
       ,sum(dec_summa_TimeOut) dec_summa_TimeOut
       ,sum(dec_cn_147_sud_Pay) dec_cn_147_sud_Pay
       ,sum(dec_summa_147_sud_Pay) dec_summa_147_sud_Pay
       ,sum(dec_cn_147_1_sud_Pay) dec_cn_147_1_sud_Pay
       ,sum(dec_summa_147_1_sud_Pay) dec_summa_147_1_sud_Pay
       ,sum(dec_cn_147_2_sud_Pay) dec_cn_147_2_sud_Pay
       ,sum(dec_summa_147_2_sud_Pay) dec_summa_147_2_sud_Pay
       ,sum(dec_cn_147_sud_Levy) dec_cn_147_sud_Levy
       ,sum(dec_summa_147_sud_Levy) dec_summa_147_sud_Levy
       ,sum(dec_cn_147_1_sud_Levy) dec_cn_147_1_sud_Levy
       ,sum(dec_summa_147_1_sud_Levy) dec_summa_147_1_sud_Levy
       ,sum(dec_cn_147_2_sud_Levy) dec_cn_147_2_sud_Levy
       ,sum(dec_summa_147_2_sud_Levy) dec_summa_147_2_sud_Levy
       ,sum(dec_cn_adminto) dec_cn_adminto
       ,sum(dec_summa_adminto) dec_summa_adminto
       ,sum(dec_cn_148) dec_cn_148
       ,sum(dec_summa_148) dec_summa_148
       ,sum(dec_cn_148_1) dec_cn_148_1
       ,sum(dec_summa_148_1) dec_summa_148_1
       ,sum(dec_cn_148_2) dec_cn_148_2
       ,sum(dec_summa_148_2) dec_summa_148_2
       ,sum(dec_cn_148_3) dec_cn_148_3
       ,sum(dec_summa_148_3) dec_summa_148_3
       ,sum(dec_cn_148_4) dec_cn_148_4
       ,sum(dec_summa_148_4) dec_summa_148_4
       ,sum(dec_cn_148_5) dec_cn_148_5
       ,sum(dec_summa_148_5) dec_summa_148_5
       ,sum(dec_cn_148_6) dec_cn_148_6
       ,sum(dec_summa_148_6) dec_summa_148_6
       --
       ,sum(reuse_cn) reuse_cn
       ,sum(reuse_summa) reuse_summa
       --
       ,sum(po_cn) po_cn
       ,sum(po_summa) po_summa
from (
select  count(1) payback_cn
       ,sum(pb.summa) payback_summa
       ,sum(case when (pb.summa > 150000) then 1 else 0 end) payback_cn_150000
       ,sum(case when (pb.summa > 150000) then pb.summa else 0 end) payback_summa_150000
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then 1 else 0 end) payback_cn_fz
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then pb.summa else 0 end) payback_summa_fz
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then 1 else 0 end) payback_cn_ul
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then pb.summa else 0 end) payback_summa_ul
       ,sum(case when (nvl(dpb.reason_code,' ') = '122') then 1 else 0 end) payback_cn_122
       ,sum(case when (nvl(dpb.reason_code,' ') = '122') then pb.summa else 0 end) payback_summa_122
       ,sum(case when (nvl(dpb.reason_code,' ') like '149.%') then 1 else 0 end) payback_cn_149
       ,sum(case when (nvl(dpb.reason_code,' ') like '149.%') then pb.summa else 0 end) payback_summa_149
       ,sum(case when (nvl(dpb.reason_code,' ') = '122' and dpb.excise_pay = 'Y') then 1 else 0 end) payback_cn_122_akc
       ,sum(case when (nvl(dpb.reason_code,' ') = '122' and dpb.excise_pay = 'Y') then pb.summa else 0 end) payback_summa_122_akc
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.%') then 1 else 0 end) payback_cn_147
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.%') then pb.summa else 0 end) payback_summa_147
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.3') then 1 else 0 end) payback_cn_147_3
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.3') then pb.summa else 0 end) payback_summa_147_3
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.5') then 1 else 0 end) payback_cn_147_5
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.5') then pb.summa else 0 end) payback_summa_147_5
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.6') then 1 else 0 end) payback_cn_147_6
       ,sum(case when (nvl(dpb.reason_code,' ') like '147.6') then pb.summa else 0 end) payback_summa_147_6
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackTimeOut') then 1 else 0 end) payback_cn_TimeOut
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackTimeOut') then pb.summa else 0 end) payback_summa_TimeOut
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.%' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.%' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.1' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_1_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.1' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_1_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.2' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_2_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackPay' and nvl(dpb.reason_code,' ') like '147.2' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_2_sud_Pay
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.%' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_sud_Levy
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.%' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_sud_Levy
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.1' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_1_sud_Levy
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.1' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_1_sud_Levy
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.2' and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_147_2_sud_Levy
       ,sum(case when (nvl(dpb.typesysname,' ') = 'DecPaybackLevy' and nvl(dpb.reason_code,' ') like '147.2' and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_147_2_sud_Levy
       ,sum(case when ((nvl(dpb.reason_code,' ') like '99' or nvl(dpb.reason_code,' ') like '148.%' or nvl(dpb.reason_code,' ') like '191.%') and dpb.decision_court = 'Y') then 1 else 0 end) payback_cn_adminto
       ,sum(case when ((nvl(dpb.reason_code,' ') like '99' or nvl(dpb.reason_code,' ') like '148.%' or nvl(dpb.reason_code,' ') like '191.%') and dpb.decision_court = 'Y') then pb.summa else 0 end) payback_summa_adminto
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.%') then 1 else 0 end) payback_cn_148
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.%') then pb.summa else 0 end) payback_summa_148
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.1') then 1 else 0 end) payback_cn_148_1
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.1') then pb.summa else 0 end) payback_summa_148_1
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.2') then 1 else 0 end) payback_cn_148_2
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.2') then pb.summa else 0 end) payback_summa_148_2
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.3') then 1 else 0 end) payback_cn_148_3
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.3') then pb.summa else 0 end) payback_summa_148_3
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.4%') then 1 else 0 end) payback_cn_148_4
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.4%') then pb.summa else 0 end) payback_summa_148_4
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.5') then 1 else 0 end) payback_cn_148_5
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.5') then pb.summa else 0 end) payback_summa_148_5
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.6') then 1 else 0 end) payback_cn_148_6
       ,sum(case when (nvl(dpb.reason_code,' ') like '148.6') then pb.summa else 0 end) payback_summa_148_6
       --
       ,0 dec_cn
       ,0 dec_summa
       ,0 dec_cn_150000
       ,0 dec_summa_150000
       ,0 dec_cn_fz
       ,0 dec_summa_fz
       ,0 dec_cn_ul
       ,0 dec_summa_ul
       ,0 dec_cn_122
       ,0 dec_summa_122
       ,0 dec_cn_149
       ,0 dec_summa_149
       ,0 dec_cn_122_akc
       ,0 dec_summa_122_akc
       ,0 dec_cn_147
       ,0 dec_summa_147
       ,0 dec_cn_147_3
       ,0 dec_summa_147_3
       ,0 dec_cn_147_5
       ,0 dec_summa_147_5
       ,0 dec_cn_147_6
       ,0 dec_summa_147_6
       ,null dec_cn_TimeOutl
       ,null dec_summa_TimeOut
       ,0 dec_cn_147_sud_Pay
       ,0 dec_summa_147_sud_Pay
       ,0 dec_cn_147_1_sud_Pay
       ,0 dec_summa_147_1_sud_Pay
       ,0 dec_cn_147_2_sud_Pay
       ,0 dec_summa_147_2_sud_Pay
       ,0 dec_cn_147_sud_Levy
       ,0 dec_summa_147_sud_Levy
       ,0 dec_cn_147_1_sud_Levy
       ,0 dec_summa_147_1_sud_Levy
       ,0 dec_cn_147_2_sud_Levy
       ,0 dec_summa_147_2_sud_Levy
       ,0 dec_cn_adminto
       ,0 dec_summa_adminto
       ,0 dec_cn_148
       ,0 dec_summa_148
       ,0 dec_cn_148_1
       ,0 dec_summa_148_1
       ,0 dec_cn_148_2
       ,0 dec_summa_148_2
       ,0 dec_cn_148_3
       ,0 dec_summa_148_3
       ,0 dec_cn_148_4
       ,0 dec_summa_148_4
       ,0 dec_cn_148_5
       ,0 dec_summa_148_5
       ,0 dec_cn_148_6
       ,0 dec_summa_148_6
       --
       ,0 reuse_cn
       ,0 reuse_summa
       --
       ,0 po_cn
       ,0 po_summa
from fdc_po_payback_y_lst pby
    ,fdc_po_payback_lst pb
    ,fdc_subject_lst s
    ,fdc_decision_payback_lst dpb
where ( pby.doc_date between :DATE_FROM and :DATE_TO )
  and pby.confirmed_doc_id = pb.id
  and pb.STATE_ID = (select id from fdc_state_lst where sysname = 'State.PayBack.Confirm')
  and pby.IS_CONFIRM = 'Y'
  and (pb.ext_source = p_params.softcustomscode)
  and pb.recipient_id = s.id(+)
  and pb.dec_pay_id = dpb.id
union all
select  0 payback_cn
       ,0 payback_summa
       ,0 payback_cn_150000
       ,0 payback_summa_150000
       ,0 payback_cn_fz
       ,0 payback_summa_fz
       ,0 payback_cn_ul
       ,0 payback_summa_ul
       ,0 payback_cn_122
       ,0 payback_summa_122
       ,0 payback_cn_149
       ,0 payback_summa_149
       ,0 payback_cn_122_akc
       ,0 payback_summa_122_akc
       ,0 payback_cn_147
       ,0 payback_summa_147
       ,0 payback_cn_147_3
       ,0 payback_summa_147_3
       ,0 payback_cn_147_5
       ,0 payback_summa_147_5
       ,0 payback_cn_147_6
       ,0 payback_summa_147_6
       ,0 payback_cn_TimeOut
       ,0 payback_summa_TimeOut
       ,0 payback_cn_147_sud_Pay
       ,0 payback_summa_147_sud_Pay
       ,0 payback_cn_147_1_sud_Pay
       ,0 payback_summa_147_1_sud_Pay
       ,0 payback_cn_147_2_sud_Pay
       ,0 payback_summa_147_2_sud_Pay
       ,0 payback_cn_147_sud_Levy
       ,0 payback_summa_147_sud_Levy
       ,0 payback_cn_147_1_sud_Levy
       ,0 payback_summa_147_1_sud_Levy
       ,0 payback_cn_147_2_sud_Levy
       ,0 payback_summa_147_2_sud_Levy
       ,0 payback_cn_adminto
       ,0 payback_summa_adminto
       ,0 payback_cn_148
       ,0 payback_summa_148
       ,0 payback_cn_148_1
       ,0 payback_summa_148_1
       ,0 payback_cn_148_2
       ,0 payback_summa_148_2
       ,0 payback_cn_148_3
       ,0 payback_summa_148_3
       ,0 payback_cn_148_4
       ,0 payback_summa_148_4
       ,0 payback_cn_148_5
       ,0 payback_summa_148_5
       ,0 payback_cn_148_6
       ,0 payback_summa_148_6
       --
       ,count(1) decpay_cn
       ,sum(dpl.summa) dec_summa
       ,sum(case when (dpl.summa > 150000) then 1 else 0 end) dec_cn_150000
       ,sum(case when (dpl.summa > 150000) then dpl.summa else 0 end) dec_summa_150000
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then 1 else 0 end) dec_cn_fz
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then dpl.summa else 0 end) dec_summa_fz
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then 1 else 0 end) dec_cn_ul
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then dpl.summa else 0 end) dec_summa_ul
       ,sum(case when (nvl(dic.code2,' ') = '122') then 1 else 0 end) dec_cn_122
       ,sum(case when (nvl(dic.code2,' ') = '122') then dpl.summa else 0 end) dec_summa_122
       ,sum(case when (nvl(dic.code2,' ') like '149.%') then 1 else 0 end) dec_cn_149
       ,sum(case when (nvl(dic.code2,' ') like '149.%') then dpl.summa else 0 end) dec_summa_149
       ,sum(case when (nvl(dic.code2,' ') = '122' and dpl.excise_pay = 'Y') then 1 else 0 end) dec_cn_122_akc
       ,sum(case when (nvl(dic.code2,' ') = '122' and dpl.excise_pay = 'Y') then dpl.summa else 0 end) dec_summa_122_akc
       ,sum(case when (nvl(dic.code2,' ') like '147.%') then 1 else 0 end) dec_cn_147
       ,sum(case when (nvl(dic.code2,' ') like '147.%') then dpl.summa else 0 end) dec_summa_147
       ,sum(case when (nvl(dic.code2,' ') like '147.3') then 1 else 0 end) dec_cn_147_3
       ,sum(case when (nvl(dic.code2,' ') like '147.3') then dpl.summa else 0 end) dec_summa_147_3
       ,sum(case when (nvl(dic.code2,' ') like '147.5') then 1 else 0 end) dec_cn_147_5
       ,sum(case when (nvl(dic.code2,' ') like '147.5') then dpl.summa else 0 end) dec_summa_147_5
       ,sum(case when (nvl(dic.code2,' ') like '147.6') then 1 else 0 end) dec_cn_147_6
       ,sum(case when (nvl(dic.code2,' ') like '147.6') then dpl.summa else 0 end) dec_summa_147_6
       ,null dec_cn_TimeOutl
       ,null dec_summa_TimeOut
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.%' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.%' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.1' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_1_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.1' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_1_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.2' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_2_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') != 'AdviceLevy' and nvl(dic.code2,' ') like '147.2' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_2_sud_Pay
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.%' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_sud_Levy
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.%' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_sud_Levy
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.1' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_1_sud_Levy
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.1' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_1_sud_Levy
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.2' and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_147_2_sud_Levy
       ,sum(case when (nvl(rel.objtypesysname,' ') = 'AdviceLevy' and nvl(dic.code2,' ') like '147.2' and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_147_2_sud_Levy
       ,sum(case when ((nvl(dic.code2,' ') like '99' or nvl(dic.code2,' ') like '148.%' or nvl(dic.code2,' ') like '191.%') and dpl.decision_court = 'Y') then 1 else 0 end) dec_cn_adminto
       ,sum(case when ((nvl(dic.code2,' ') like '99' or nvl(dic.code2,' ') like '148.%' or nvl(dic.code2,' ') like '191.%') and dpl.decision_court = 'Y') then dpl.summa else 0 end) dec_summa_adminto
       ,sum(case when (nvl(dic.code2,' ') like '148.%') then 1 else 0 end) dec_cn_148
       ,sum(case when (nvl(dic.code2,' ') like '148.%') then dpl.summa else 0 end) dec_summa_148
       ,sum(case when (nvl(dic.code2,' ') like '148.1') then 1 else 0 end) dec_cn_148_1
       ,sum(case when (nvl(dic.code2,' ') like '148.1') then dpl.summa else 0 end) dec_summa_148_1
       ,sum(case when (nvl(dic.code2,' ') like '148.2') then 1 else 0 end) dec_cn_148_2
       ,sum(case when (nvl(dic.code2,' ') like '148.2') then dpl.summa else 0 end) dec_summa_148_2
       ,sum(case when (nvl(dic.code2,' ') like '148.3') then 1 else 0 end) dec_cn_148_3
       ,sum(case when (nvl(dic.code2,' ') like '148.3') then dpl.summa else 0 end) dec_summa_148_3
       ,sum(case when (nvl(dic.code2,' ') like '148.4%') then 1 else 0 end) dec_cn_148_4
       ,sum(case when (nvl(dic.code2,' ') like '148.4%') then dpl.summa else 0 end) dec_summa_148_4
       ,sum(case when (nvl(dic.code2,' ') like '148.5') then 1 else 0 end) dec_cn_148_5
       ,sum(case when (nvl(dic.code2,' ') like '148.5') then dpl.summa else 0 end) payback_summa_148_5
       ,sum(case when (nvl(dic.code2,' ') like '148.6') then 1 else 0 end) dec_cn_148_6
       ,sum(case when (nvl(dic.code2,' ') like '148.6') then dpl.summa else 0 end) dec_summa_148_6
       --
       ,0 reuse_cn
       ,0 reuse_summa
       --
       ,0 po_cn
       ,0 po_summa
from fdc_decision_payment_lst dpl
    ,fdc_subject_lst s
    ,fdc_dict dic
    ,(
      select rel_object_id, objtypesysname
      from fdc_rel_advice_dec_lst
      group by rel_object_id, objtypesysname
      ) rel
where ( dpl.sign_date between :DATE_FROM and :DATE_TO )
  and dpl.subject_id = s.id(+)
  and dpl.reason_id = dic.id(+)
  and dpl.id = rel.rel_object_id(+)
union all
select  0 payback_cn
       ,0 payback_summa
       ,0 payback_cn_150000
       ,0 payback_summa_150000
       ,0 payback_cn_fz
       ,0 payback_summa_fz
       ,0 payback_cn_ul
       ,0 payback_summa_ul
       ,0 payback_cn_122
       ,0 payback_summa_122
       ,0 payback_cn_149
       ,0 payback_summa_149
       ,0 payback_cn_122_akc
       ,0 payback_summa_122_akc
       ,0 payback_cn_147
       ,0 payback_summa_147
       ,0 payback_cn_147_3
       ,0 payback_summa_147_3
       ,0 payback_cn_147_5
       ,0 payback_summa_147_5
       ,0 payback_cn_147_6
       ,0 payback_summa_147_6
       ,0 payback_cn_TimeOut
       ,0 payback_summa_TimeOut
       ,0 payback_cn_147_sud_Pay
       ,0 payback_summa_147_sud_Pay
       ,0 payback_cn_147_1_sud_Pay
       ,0 payback_summa_147_1_sud_Pay
       ,0 payback_cn_147_2_sud_Pay
       ,0 payback_summa_147_2_sud_Pay
       ,0 payback_cn_147_sud_Levy
       ,0 payback_summa_147_sud_Levy
       ,0 payback_cn_147_1_sud_Levy
       ,0 payback_summa_147_1_sud_Levy
       ,0 payback_cn_147_2_sud_Levy
       ,0 payback_summa_147_2_sud_Levy
       ,0 payback_cn_adminto
       ,0 payback_summa_adminto
       ,0 payback_cn_148
       ,0 payback_summa_148
       ,0 payback_cn_148_1
       ,0 payback_summa_148_1
       ,0 payback_cn_148_2
       ,0 payback_summa_148_2
       ,0 payback_cn_148_3
       ,0 payback_summa_148_3
       ,0 payback_cn_148_4
       ,0 payback_summa_148_4
       ,0 payback_cn_148_5
       ,0 payback_summa_148_5
       ,0 payback_cn_148_6
       ,0 payback_summa_148_6
       --
       ,count(1) decpay_cn
       ,sum(dr.amount) dec_summa
       ,sum(case when (dr.amount > 150000) then 1 else 0 end) dec_cn_150000
       ,sum(case when (dr.amount > 150000) then dr.amount else 0 end) dec_summa_150000
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then 1 else 0 end) dec_cn_fz
       ,sum(case when (nvl(s.typesysname,' ') = 'Person') then dr.amount else 0 end) dec_summa_fz
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then 1 else 0 end) dec_cn_ul
       ,sum(case when (nvl(s.typesysname,' ') != 'Person') then dr.amount else 0 end) dec_summa_ul
       ,0 dec_cn_122
       ,0 dec_summa_122
       ,0 dec_cn_149
       ,0 dec_summa_149
       ,0 dec_cn_122_akc
       ,0 dec_summa_122_akc
       ,0 dec_cn_147
       ,0 dec_summa_147
       ,0 dec_cn_147_3
       ,0 dec_summa_147_3
       ,0 dec_cn_147_5
       ,0 dec_summa_147_5
       ,0 dec_cn_147_6
       ,0 dec_summa_147_6
       ,null dec_cn_TimeOutl
       ,null dec_summa_TimeOut
       ,0 dec_cn_147_sud_Pay
       ,0 dec_summa_147_sud_Pay
       ,0 dec_cn_147_1_sud_Pay
       ,0 dec_summa_147_1_sud_Pay
       ,0 dec_cn_147_2_sud_Pay
       ,0 dec_summa_147_2_sud_Pay
       ,0 dec_cn_147_sud_Levy
       ,0 dec_summa_147_sud_Levy
       ,0 dec_cn_147_1_sud_Levy
       ,0 dec_summa_147_1_sud_Levy
       ,0 dec_cn_147_2_sud_Levy
       ,0 dec_summa_147_2_sud_Levy
       ,0 dec_cn_adminto
       ,0 dec_summa_adminto
       ,0 dec_cn_148
       ,0 dec_summa_148
       ,0 dec_cn_148_1
       ,0 dec_summa_148_1
       ,0 dec_cn_148_2
       ,0 dec_summa_148_2
       ,0 dec_cn_148_3
       ,0 dec_summa_148_3
       ,0 dec_cn_148_4
       ,0 dec_summa_148_4
       ,0 dec_cn_148_5
       ,0 dec_summa_148_5
       ,0 dec_cn_148_6
       ,0 dec_summa_148_6
       --
       ,count(1) reuse_cn
       ,sum(dr.amount) reuse_summa
       --
       ,0 po_cn
       ,0 po_summa
from fdc_doc_reuse_customs_y_lst dry
    ,fdc_doc_reuse_customs_lst dr
    ,fdc_subject_lst s
where ( dry.doc_date between :DATE_FROM and :DATE_TO )
  and dry.CONFIRMED_DOC_ID = dr.id
  and dr.state_id in (select id from fdc_state_lst where sysname in ('State.Reuse.Sended','State.Reuse.Confirm'))
  and dr.subject_id = s.id(+)
union all
select  0 payback_cn
       ,0 payback_summa
       ,0 payback_cn_150000
       ,0 payback_summa_150000
       ,0 payback_cn_fz
       ,0 payback_summa_fz
       ,0 payback_cn_ul
       ,0 payback_summa_ul
       ,0 payback_cn_122
       ,0 payback_summa_122
       ,0 payback_cn_149
       ,0 payback_summa_149
       ,0 payback_cn_122_akc
       ,0 payback_summa_122_akc
       ,0 payback_cn_147
       ,0 payback_summa_147
       ,0 payback_cn_147_3
       ,0 payback_summa_147_3
       ,0 payback_cn_147_5
       ,0 payback_summa_147_5
       ,0 payback_cn_147_6
       ,0 payback_summa_147_6
       ,0 payback_cn_TimeOut
       ,0 payback_summa_TimeOut
       ,0 payback_cn_147_sud_Pay
       ,0 payback_summa_147_sud_Pay
       ,0 payback_cn_147_1_sud_Pay
       ,0 payback_summa_147_1_sud_Pay
       ,0 payback_cn_147_2_sud_Pay
       ,0 payback_summa_147_2_sud_Pay
       ,0 payback_cn_147_sud_Levy
       ,0 payback_summa_147_sud_Levy
       ,0 payback_cn_147_1_sud_Levy
       ,0 payback_summa_147_1_sud_Levy
       ,0 payback_cn_147_2_sud_Levy
       ,0 payback_summa_147_2_sud_Levy
       ,0 payback_cn_adminto
       ,0 payback_summa_adminto
       ,0 payback_cn_148
       ,0 payback_summa_148
       ,0 payback_cn_148_1
       ,0 payback_summa_148_1
       ,0 payback_cn_148_2
       ,0 payback_summa_148_2
       ,0 payback_cn_148_3
       ,0 payback_summa_148_3
       ,0 payback_cn_148_4
       ,0 payback_summa_148_4
       ,0 payback_cn_148_5
       ,0 payback_summa_148_5
       ,0 payback_cn_148_6
       ,0 payback_summa_148_6
       --
       ,0 dec_cn
       ,0 dec_summa
       ,0 dec_cn_150000
       ,0 dec_summa_150000
       ,0 dec_cn_fz
       ,0 dec_summa_fz
       ,0 dec_cn_ul
       ,0 dec_summa_ul
       ,0 dec_cn_122
       ,0 dec_summa_122
       ,0 dec_cn_149
       ,0 dec_summa_149
       ,0 dec_cn_122_akc
       ,0 dec_summa_122_akc
       ,0 dec_cn_147
       ,0 dec_summa_147
       ,0 dec_cn_147_3
       ,0 dec_summa_147_3
       ,0 dec_cn_147_5
       ,0 dec_summa_147_5
       ,0 dec_cn_147_6
       ,0 dec_summa_147_6
       ,null dec_cn_TimeOutl
       ,null dec_summa_TimeOut
       ,0 dec_cn_147_sud_Pay
       ,0 dec_summa_147_sud_Pay
       ,0 dec_cn_147_1_sud_Pay
       ,0 dec_summa_147_1_sud_Pay
       ,0 dec_cn_147_2_sud_Pay
       ,0 dec_summa_147_2_sud_Pay
       ,0 dec_cn_147_sud_Levy
       ,0 dec_summa_147_sud_Levy
       ,0 dec_cn_147_1_sud_Levy
       ,0 dec_summa_147_1_sud_Levy
       ,0 dec_cn_147_2_sud_Levy
       ,0 dec_summa_147_2_sud_Levy
       ,0 dec_cn_adminto
       ,0 dec_summa_adminto
       ,0 dec_cn_148
       ,0 dec_summa_148
       ,0 dec_cn_148_1
       ,0 dec_summa_148_1
       ,0 dec_cn_148_2
       ,0 dec_summa_148_2
       ,0 dec_cn_148_3
       ,0 dec_summa_148_3
       ,0 dec_cn_148_4
       ,0 dec_summa_148_4
       ,0 dec_cn_148_5
       ,0 dec_summa_148_5
       ,0 dec_cn_148_6
       ,0 dec_summa_148_6
       --
       ,0 reuse_cn
       ,0 reuse_summa
       --
       ,count(1) po_cn
       ,sum(nvl(po.summa,po.doc_summa)) po_summa
from fdc_po_lst po 
where ( po.activation_date between :DATE_FROM and :DATE_TO )
  and po.state_id in (select id from fdc_state_lst where sysname in ('PaymentOrderNew','PaymentOrderConfirm'))
)
) dt
