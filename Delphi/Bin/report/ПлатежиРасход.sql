[dsInnKpp]
select INN||' / '||KPP as InnKpp from fdc_subject_lst where id = :Subj_Id

[dsCurrency]
select code from fdc_nsi_currency_lst where id = :Curr_Id

[dsReport]
select 
       pay_order_id
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), null, doc_number) as doc_no
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), null, doc_date) as doc_date
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), null, income_date) as coming_date
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), null, bank_date) as bank_date
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), to_number(null), po_summa) as po_summa
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), to_number(null), po_summa_fact) as Coming_Summa
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), to_number(null), nvl( fdc_payment_order_GetRestSumma( pay_order_id, nvl( :DateFrom, SYSDATE ) ) , 0 )) AS po_rest_summa_begin
      ,decode(pay_order_id, lag(pay_order_id, 1) over(order by doc_date,pay_order_id), to_number(null), nvl( fdc_payment_order_GetRestSumma( pay_order_id, nvl( :DateTo, SYSDATE ) ) , 0 )) AS po_rest_summa_end
      ,nach_doc_name
      ,(case 
          when (nach_doc_typesysname is null) then ''
          when (fdc_object_type_is_subtype(nach_doc_typesysname,'CustomDecl',0) = 1) then 'ÄÒ'
          when (fdc_object_type_is_subtype(nach_doc_typesysname,'TPO',0) = 1) then 'ÒÏÎ'
          when (fdc_object_type_is_subtype(nach_doc_typesysname,'TR',0) = 1) then 'ÒÐ'
          else 'Èíûå'
        end) doc_nash_type
     ,payment_type
     ,summa as summa
     ,pd_date
     ,date_send
from (
      select
             po.id pay_order_id
            ,po.doc_date
            ,po.doc_number
            ,po.income_date
            ,po.doc_date2 bank_date
            ,nvl(po.summa, 0) po_summa
            ,nvl(po.doc_summa, 0) po_summa_fact
            ,po.name doc_no
            ,pd.pd_date
            ,pd.nach_doc_typesysname
            ,pd.nach_doc_typename
            ,pd.nach_doc_name
            ,pd.payment_type
            ,pd.date_send
            ,sum(pd.summa) summa
      from fdc_po_credit_lst po
          ,(
            select pdl.payment_id
                  ,pdl.payment_date pd_date
                  ,nach_doc.id nach_doc_id
                  ,nach_doc.typesysname nach_doc_typesysname
                  ,nach_doc.typename nach_doc_typename
                  ,nach_doc.name nach_doc_name
                  ,d_pay_type.code payment_type
                  ,trunc(rscl.date_send) date_send
                  ,sum(pdl.summa) summa
            from fdc_payment_deduction_all_lst  pdl
                ,fdc_document_lst               nach_doc
                ,fdc_dict                       d_pay_type
                ,fdc_state_lst                  st
                ,fdc_rel_skindpay_deduct_lst rel
                ,fdc_reestr_specify_kindpay_lst rscl
            where (pdl.payment_date between :DateFrom and :DateTO)
              and pdl.is_active in ('N','Y')
              and pdl.decl_id = nach_doc.id(+)
              and (pdl.typesysname in (
                                      select sysname
                                      from fdc_object_type_lst
                                      where id in (select doc_class_id from fdc_doc_params_function)
                                      connect by prior id = parent_object_type_id
                                      start with sysname = 'PaymentDeduction'
                                     )
                  or
                  (nvl(nach_doc.typesysname,' ') = 'TR' and pdl.typesysname = 'PaymentDeduction.Tr')
                  )
              and pdl.pay_type_id = d_pay_type.id(+)
              and nach_doc.state_id = st.id(+)
              and (
                   (nvl(nach_doc.typesysname,' ') not in ('DecisionPayback','DocReuse'))
                   or
                   (nvl(nach_doc.typesysname,' ') in ('DecisionPayback') and nvl(st.sysname,' ') in ('DecisionPaybackSigned'))
                   or
                   (nvl(nach_doc.typesysname,' ') in ('DocReuse') and nvl(st.sysname,' ') in ('State.Reuse.Confirm','State.Reuse.Reused'))
                  )
              and pdl.id = rel.rel_object_id(+)
              and rel.object_id = rscl.id(+)
            group by 
                     pdl.payment_id
                    ,pdl.payment_date
                    ,nach_doc.id
                    ,nach_doc.typesysname
                    ,nach_doc.typename
                    ,nach_doc.name
                    ,d_pay_type.code
                    ,trunc(rscl.date_send)
            having (sum(pdl.summa) > 0)
           ) pd
      where po.id = pd.payment_id(+)
        and (
             (po.doc_date between :DateFrom and :DateTO)
             or
             po.id in (
                       select pd1.payment_id 
                       from fdc_payment_deduction_all_lst pd1
                           ,fdc_document_lst nach_doc1                       
                       where (pd1.payment_date between :DateFrom and :DateTO)
                         and pd1.is_active in ('N','Y')
                         and pd1.decl_id = nach_doc1.id(+)
                         and (pd1.typesysname in (
                                             select sysname
                                             from fdc_object_type_lst
                                             where id in (select doc_class_id from fdc_doc_params_function)
                                             connect by prior id = parent_object_type_id
                                             start with sysname = 'PaymentDeduction'
                                            )
                             or
                             (nvl(nach_doc1.typesysname,' ') = 'TR' and pd1.typesysname = 'PaymentDeduction.Tr')
                             )
                      )
            )
        and po.currency_id = :Curr_Id
        and po.payer_id in (:subj_id)
        and po.typesysname not in ('Payment_Order_PayBack','PaymentOrderConfirm')
      group by po.doc_date
              ,po.id
              ,po.doc_number
              ,po.income_date
              ,po.doc_date2
              ,nvl(po.summa, 0)
              ,nvl(po.doc_summa, 0)
              ,po.name
              ,pd.nach_doc_typesysname
              ,pd.nach_doc_typename
              ,pd.nach_doc_name
              ,pd.pd_date
              ,pd.payment_type
              ,pd.date_send
      order by po.doc_date, po.doc_number, pd.nach_doc_typesysname, pd.pd_date, pd.nach_doc_name, pd.payment_type
     ) res

[dsOnlyPays]
SELECT 
  :DateFrom
  ,:Subj_Id
  ,:Curr_Id
  ,:DateTo
  FROM
  dual
where 1=2
/*  %s */
