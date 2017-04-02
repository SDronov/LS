[dsHeader]
select 'c ' || to_char(:begin_date,'dd.mm.yyyy') || ' ïî ' || to_char(:end_date,'dd.mm.yyyy') as period      
from dual
	   
[dsBody]
select sm.pack_state_sysname,
       cl.name custom_name
      ,summ_fact_not_in
      ,count_trans_period
      ,summa_trans_period
      ,summ_fact_in
      ,summ_fact_in_before_period
      ,summ_fact_in_period
      ,summ_fact_not_in_period
from (
      select r.pack_state_sysname,
             custom_code
            ,sum(case when (r.doc_date < :begin_date and r.pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended')) then r.doc_summa else 0 end) summ_fact_not_in
            ,sum(case when (r.doc_date >= :begin_date and r.pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended','State.PackPayments.Confirmed')) then 1 else 0 end) count_trans_period
            ,sum(case when (r.doc_date >= :begin_date and r.pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended','State.PackPayments.Confirmed')) then r.doc_summa else 0 end) summa_trans_period
            ,sum(case when ((nvl(r.recieve_date,:begin_date) between :begin_date and :end_date) and r.pack_state_sysname in ('State.PackPayments.Confirmed')) then r.doc_summa else 0 end) summ_fact_in
            ,sum(case when (r.doc_date < :begin_date and (nvl(r.recieve_date,:begin_date) between :begin_date and :end_date) and r.pack_state_sysname in ('State.PackPayments.Confirmed')) then doc_summa else 0 end) summ_fact_in_before_period
            ,sum(case when (r.doc_date >= :begin_date and (nvl(r.recieve_date,:begin_date) between :begin_date and :end_date) and r.pack_state_sysname in ('State.PackPayments.Confirmed')) then doc_summa else 0 end) summ_fact_in_period
            ,sum(case when (r.doc_date >= :begin_date and r.pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended')) then r.doc_summa else 0 end) summ_fact_not_in_period
      from  (
             select substr(po.destcustomscode, 1, 5) || '000' custom_code
                   ,to_date(substr(po.note,instr(NOTE,' ÇÀ ')+4,9),'dd.mm.yy')        doc_date
                   ,po.doc_summa       doc_summa
                   ,po.note            note
                   ,dppl.recieve_date  recieve_date
                   ,st.sysname         pack_state_sysname
             from fdc_payment_order         po
                 ,fdc_object_relation       orl
                 ,fdc_doc_pack_payments_lst dppl
                 ,fdc_object                st
             where p_params.customlevel in (p_consts.CustomLevel_RTU, p_consts.CustomLevel_FTS)
               and po.note like '%×ÅÊ N%'
               and po.id = orl.rel_object_id
               and orl.object_id = dppl.id
               and dppl.ext_source = p_params.softcustomscode
               and dppl.state_id = st.id
               and length(po.inn_p) = 12
            ) r
      where ((instr(upper(r.note),'ÊÀÐÒ', 1) > 0 and instr(upper(r.note),'×ÅÊ N', 1) > 0 and instr(r.note, 'N 964310', 1) > 0) or 
             (instr(upper(r.note),'ÊÀÐÒ', 1) > 0 and instr(upper(r.note),'×ÅÊ N', 1) > 0 and instr(r.note, 'N 964301', 1) > 0) or
             (instr(upper(r.note),'ÊÀÐÒ', 1) > 0 and instr(upper(r.note),'×ÅÊ N', 1) > 0 and (instr(r.note,'N 603714', 1) > 0 or instr(r.note,'N 639575', 1) > 0)) 
	    )
      and r.doc_date <= :end_date
      group by pack_state_sysname, custom_code
     ) sm
    ,fdc_customs_lst cl
where sm.custom_code = cl.customs_code_8
union all
select lt.pack_state_sysname,
       lt.custom_name
      ,sum(case when (lt.doc_date < :begin_date and lt.state_sysname in ('PaymentOrderNew')) then lt.doc_summa else 0 end) summ_fact_not_in
      ,sum(case when (lt.doc_date >= :begin_date and (nvl(lt.income_date,:begin_date) between :begin_date and :end_date) and lt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) count_trans_period
      ,sum(case when (lt.doc_date >= :begin_date and lt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then lt.doc_summa else 0 end) summa_trans_period
      ,sum(case when ((nvl(lt.income_date,:begin_date) between :begin_date and :end_date) and lt.state_sysname in ('PaymentOrderConfirm')) then lt.doc_summa else 0 end) summ_fact_in
      ,sum(case when (lt.doc_date < :begin_date and (nvl(lt.income_date,:begin_date) between :begin_date and :end_date) and lt.state_sysname in ('PaymentOrderConfirm')) then lt.doc_summa else 0 end) summ_fact_in_before_period
      ,sum(case when (lt.doc_date >= :begin_date and (nvl(lt.income_date,:begin_date) between :begin_date and :end_date) and lt.state_sysname in ('PaymentOrderConfirm')) then lt.doc_summa else 0 end) summ_fact_in_period
      ,sum(case when (lt.doc_date >= :begin_date and lt.state_sysname in ('PaymentOrderNew')) then lt.doc_summa else 0 end) summ_fact_not_in_period
from (     
      select poc.paysysname as pack_state_sysname
	     ,custom.name    custom_name
             ,dl.doc_date    doc_date
             ,po.doc_summa   doc_summa
             ,po.income_date income_date
             ,poc.cardnum    cardnum
             ,st.sysname     state_sysname
             ,poc.flag_proc  term
       from fdc_payment_order_cheque poc
           ,fdc_payment_order        po
           ,fdc_document_lst         dl
           ,fdc_object               st
           ,(select name from fdc_customs_lst where id = p_params.customsid) custom
       where p_params.customlevel = 2
         and poc.id = po.id
         and poc.id = dl.id
         and dl.state_id = st.id 
         and length(po.inn_p) = 12      
      ) lt
where substr(lt.cardnum,1,6) in ('964310', '964301', '603714', '639575')
  and lt.doc_date <= :end_date
group by pack_state_sysname, custom_name
--having sum(case when (lt.doc_date >= :begin_date and (nvl(lt.income_date,:begin_date) between :begin_date and :end_date) and lt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) <> 0
order by 1  

[dsCellar0]
select tt.pack_state_sysname,
       tt.custom_name
      ,sum(case when (tt.doc_date < :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) count_trans_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then tt.doc_summa else 0 end) summa_trans_period
      ,sum(case when ((nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in
      ,sum(case when (tt.doc_date < :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_before_period
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in_period
from (     
      select poc.paysysname as pack_state_sysname
	     ,custom.name    custom_name
             ,dl.doc_date    doc_date
             ,po.doc_summa   doc_summa
             ,po.income_date income_date
             ,poc.cardnum    cardnum
             ,st.sysname     state_sysname
             ,poc.flag_proc  term
       from fdc_payment_order_cheque poc
           ,fdc_payment_order        po
           ,fdc_document_lst         dl
           ,fdc_object               st
           ,(select name from fdc_customs_lst where id = p_params.customsid) custom
       where p_params.customlevel = 2
         and poc.id = po.id
         and poc.id = dl.id
         and dl.state_id = st.id 
         and length(po.inn_p) = 12 
         and poc.flag_proc = 0     
      ) tt
where substr(tt.cardnum,1,6) in ('964310', '964301', '603714', '639575')
  and tt.doc_date <= :end_date
group by pack_state_sysname, custom_name
order by 1 

[dsCellar1]
select tt.pack_state_sysname,
       tt.custom_name
      ,sum(case when (tt.doc_date < :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) count_trans_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then tt.doc_summa else 0 end) summa_trans_period
      ,sum(case when ((nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in
      ,sum(case when (tt.doc_date < :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_before_period
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in_period
from (     
      select poc.paysysname as pack_state_sysname
	     ,custom.name    custom_name
             ,dl.doc_date    doc_date
             ,po.doc_summa   doc_summa
             ,po.income_date income_date
             ,poc.cardnum    cardnum
             ,st.sysname     state_sysname
             ,poc.flag_proc  term
       from fdc_payment_order_cheque poc
           ,fdc_payment_order        po
           ,fdc_document_lst         dl
           ,fdc_object               st
           ,(select name from fdc_customs_lst where id = p_params.customsid) custom
       where p_params.customlevel = 2
         and poc.id = po.id
         and poc.id = dl.id
         and dl.state_id = st.id 
         and length(po.inn_p) = 12 
         and poc.flag_proc = 1     
      ) tt
where substr(tt.cardnum,1,6) in ('964310', '964301', '603714', '639575')
  and tt.doc_date <= :end_date
group by pack_state_sysname, custom_name
order by 1 

[dsCellar2]
select tt.pack_state_sysname,
       tt.custom_name
      ,sum(case when (tt.doc_date < :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) count_trans_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then tt.doc_summa else 0 end) summa_trans_period
      ,sum(case when ((nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in
      ,sum(case when (tt.doc_date < :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_before_period
      ,sum(case when (tt.doc_date >= :begin_date and (nvl(tt.income_date,:begin_date) between :begin_date and :end_date) and tt.state_sysname in ('PaymentOrderConfirm')) then tt.doc_summa else 0 end) summ_fact_in_period
      ,sum(case when (tt.doc_date >= :begin_date and tt.state_sysname in ('PaymentOrderNew')) then tt.doc_summa else 0 end) summ_fact_not_in_period
from (     
      select poc.paysysname as pack_state_sysname
	     ,custom.name    custom_name
             ,dl.doc_date    doc_date
             ,po.doc_summa   doc_summa
             ,po.income_date income_date
             ,poc.cardnum    cardnum
             ,st.sysname     state_sysname
             ,poc.flag_proc  term
       from fdc_payment_order_cheque poc
           ,fdc_payment_order        po
           ,fdc_document_lst         dl
           ,fdc_object               st
           ,(select name from fdc_customs_lst where id = p_params.customsid) custom
       where p_params.customlevel = 2
         and poc.id = po.id
         and poc.id = dl.id
         and dl.state_id = st.id 
         and length(po.inn_p) = 12 
         and poc.flag_proc is NULL
      ) tt
where substr(tt.cardnum,1,6) in ('964310', '964301', '603714', '639575')
  and tt.doc_date <= :end_date
group by pack_state_sysname, custom_name
order by 1 
