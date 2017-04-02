[dsHeader]
select
  'c ' || to_char(:begin_date,'dd.mm.yyyy') || ' ïî ' || to_char(:end_date,'dd.mm.yyyy') as period
from dual

[dsBody]
select cl.name custom_name
      ,summ_fact_not_in
      ,count_trans_period
      ,summa_trans_period
      ,summ_fact_in
      ,summ_fact_in_before_period
      ,summ_fact_in_period
      ,summ_fact_not_in_period
from (
      select custom_code
            ,sum(case when (doc_date < :begin_date and pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended')) then doc_summa else 0 end) summ_fact_not_in
            ,sum(case when (doc_date >= :begin_date and pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended','State.PackPayments.Confirmed')) then 1 else 0 end) count_trans_period
            ,sum(case when (doc_date >= :begin_date and pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended','State.PackPayments.Confirmed')) then doc_summa else 0 end) summa_trans_period
            ,sum(case when ((nvl(recieve_date,:begin_date) between :begin_date and :end_date) and pack_state_sysname in ('State.PackPayments.Confirmed')) then doc_summa else 0 end) summ_fact_in
            ,sum(case when (doc_date < :begin_date and (nvl(recieve_date,:begin_date) between :begin_date and :end_date) and pack_state_sysname in ('State.PackPayments.Confirmed')) then doc_summa else 0 end) summ_fact_in_before_period
            ,sum(case when (doc_date >= :begin_date and (nvl(recieve_date,:begin_date) between :begin_date and :end_date) and pack_state_sysname in ('State.PackPayments.Confirmed')) then doc_summa else 0 end) summ_fact_in_period
            ,sum(case when (doc_date >= :begin_date and pack_state_sysname in ('State.PackPayments.Formed','State.PackPayments.Sended')) then doc_summa else 0 end) summ_fact_not_in_period
      from fdc_rep_paymk_rtu_lst a
      where ( (instr(upper(note),'ÊÀÐÒ',1) > 0) and (instr(note,'N 964310',1) > 0) ) 
        and doc_date <= :end_date
      group by custom_code
     ) sm
    ,fdc_customs_lst cl
where sm.custom_code = cl.customs_code_8
union all
select custom_name
      ,sum(case when (doc_date < :begin_date and state_sysname in ('PaymentOrderNew')) then doc_summa else 0 end) summ_fact_not_in
      ,sum(case when (doc_date >= :begin_date and (nvl(income_date,:begin_date) between :begin_date and :end_date) and state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then 1 else 0 end) count_trans_period
      ,sum(case when (doc_date >= :begin_date and state_sysname in ('PaymentOrderNew','PaymentOrderConfirm')) then doc_summa else 0 end) summa_trans_period
      ,sum(case when ((nvl(income_date,:begin_date) between :begin_date and :end_date) and state_sysname in ('PaymentOrderConfirm')) then doc_summa else 0 end) summ_fact_in
      ,sum(case when (doc_date < :begin_date and (nvl(income_date,:begin_date) between :begin_date and :end_date) and state_sysname in ('PaymentOrderConfirm')) then doc_summa else 0 end) summ_fact_in_before_period
      ,sum(case when (doc_date >= :begin_date and (nvl(income_date,:begin_date) between :begin_date and :end_date) and state_sysname in ('PaymentOrderConfirm')) then doc_summa else 0 end) summ_fact_in_period
      ,sum(case when (doc_date >= :begin_date and state_sysname in ('PaymentOrderNew')) then doc_summa else 0 end) summ_fact_not_in_period
from (select custom.name    custom_name,
       dl.doc_date    doc_date,
       po.doc_summa   doc_summa,
       po.income_date income_date,
       poc.cardnum    cardnum,
       st.sysname     state_sysname
  from fdc_payment_order_cheque poc,
       fdc_payment_order po,
       fdc_document dl,
       fdc_object do,
       fdc_object st,
       (select name from fdc_customs_lst where id = p_params.customsid) custom
 where p_params.customlevel = 2
   and dl.id = do.id
   and poc.id = po.id
   and poc.id = dl.id
   and do.state_id = st.id
   and substr(poc.cardnum, 1, 6) = '964310'
   and dl.doc_date <= :end_date)
group by custom_name
order by 1
