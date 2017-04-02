[dsHeader]
select s.name, 
       s.inn, 
       decode (:IS_GEN_REP_INN, 0, s.KPP, null) as kpp,
       c.name as currname,
       s.id as subj_id, 
       c.ID as curr_id,
       :IS_GEN_REP_INN as is_gen_rep_inn,
       :FROM_DATE as from_date,
       :TO_DATE as to_date
  from fdc_subject_lst s      
      ,fdc_nsi_currency_lst c
 where s.id = :SUBJ_ID 
   and c.id = :CURR_ID


[dsSaldo]
WITH
  ss AS (
          SELECT :SUBJ_ID AS id
            FROM dual
           WHERE 0 = :IS_GEN_REP_INN
          UNION
          SELECT id
            FROM fdc_subject_lst
           WHERE 1 = :IS_GEN_REP_INN
             AND inn = :INN
    )
select sum(nvl(fdc_payment_order_getrestsumma( id, :from_date - 1 ),0)) AS saldo
from fdc_po_credit_lst
where payer_id in (select id from ss)
  and doc_date < :from_date
  and currency_id = :curr_id
  and typesysname <> 'PaymentOrderConfirm'


[dsOper]
WITH
  ss AS (
          SELECT :SUBJ_ID AS id
            FROM dual
           WHERE 0 = :IS_GEN_REP_INN
          UNION
          SELECT id
            FROM fdc_subject_lst
           WHERE 1 = :IS_GEN_REP_INN
             AND inn = :INN
    )

SELECT nvl(po.income_date,po.income_date) AS "DATE"
      ,po.name AS plat_name
      ,to_char( NULL ) AS name
      --
      ,to_number(null)         AS nomer
      ,po.payer_id AS subject_id
      ,nvl(po.summa,po.doc_summa) AS credit
      ,0 AS debit
      ,to_char( NULL ) AS debt
      --
      ,to_char( NULL ) AS code
from fdc_po_credit_lst po
where po.payer_id in (select id from ss)
  and (po.doc_date between :from_date and :to_date)
  and po.currency_id = :curr_id
  and po.typesysname <> 'PaymentOrderConfirm'
union all
SELECT nvl(pd.payment_date,po.income_date) AS "DATE"
      ,po.name            AS plat_name
      ,nvl(dcl.dec_name,dl.name) AS name
      --
      ,to_number(null)         AS nomer
      ,po.payer_id AS subject_id
      ,(case sign(pd.summa) when -1 then abs(pd.summa) else 0 end) AS credit
      ,(case sign(pd.summa) when 1 then abs(pd.summa) else 0 end) AS debit
      ,to_char( NULL ) AS debt
      --
      ,dict.code AS code
from fdc_po_credit_lst po
    ,(
      select *
      from fdc_payment_deduction_all_lst
      where (payment_date between :from_date and :to_date)
     ) pd
    ,fdc_document_lst dl
    ,(
      select vl.ref_object_id, dec.name dec_name, dec.typesysname
      from fdc_value_lst vl
          ,fdc_rel_advice_dec_lst rel
          ,fdc_decision_lst dec
      where vl.owner_object_id = rel.object_id
        and rel.rel_object_id = dec.id
     ) dcl
    ,fdc_dict dict
where po.payer_id in (select id from ss)
  and (
       (
        po.doc_date < :from_date
        and
        po.id in (
                  select payment_id
                  from fdc_payment_deduction
                  where (payment_date between :from_date and :to_date)
                 )
       )
       or
       (po.doc_date between :from_date and :to_date)
      )
  and po.currency_id = :curr_id
  and po.typesysname <> 'PaymentOrderConfirm'
  and po.id = pd.payment_id(+)
  and pd.decl_id = dl.id(+)
  and pd.id = dcl.ref_object_id(+)
  and pd.pay_type_id = dict.id(+)
ORDER BY 1 ASC ,2, 3 NULLS FIRST

[dsSaldo2]
WITH
  ss AS (
          SELECT :SUBJ_ID AS id
            FROM dual
           WHERE 0 = :IS_GEN_REP_INN
          UNION
          SELECT id
            FROM fdc_subject_lst
           WHERE 1 = :IS_GEN_REP_INN
             AND inn = :INN
    )
select nvl( sum( charge.summa - pd.summa_datefrom ), 0 ) as saldo
from (
      select min(dc.id) id
            ,dc.decl_id
            ,pt.code as payment_code
            ,dc.currency_id
            ,nvl(kbk.code,'-') as kbkcode
            ,sum(dc.summa) summa
      from fdc_decl_charge dc
          ,fdc_dict pt
          ,fdc_dict kbk
      where (dc.decl_id in (select id from fdc_doc_charge_lst where subject_id in (select id from ss)))
        and dc.pay_type_id = pt.id(+)
        and dc.kbkcode_id = kbk.id(+)
      group by dc.decl_id, pt.code, dc.currency_id, nvl(kbk.code,'-')
     ) charge
    ,(
      select min(dp.id) id
            ,dp.decl_id
            ,dpt.code as payment_code
            ,nvl(dp.charge_curr_id,po.currency_id) currency_id
            ,nvl(dkb.code, '-') as kbkcode
            ,sum(dp.summa) summa
            ,sum((case when (d.doc_date < trunc(:from_date)) then dp.summa else 0 end)) summa_datefrom
            ,sum((case when (trunc(d.doc_date) between :from_date and :to_date) then dp.summa else 0 end)) summa_betweendate
      from fdc_payment_deduction dp
          ,fdc_dict dpt
          ,fdc_dict dkb
          ,fdc_payment_order po
          ,fdc_document_lst d
          ,fdc_document_lst pol
      where (dp.decl_id in (select id from fdc_doc_charge_lst where subject_id in (select id from ss)))
        and dp.payment_id = dp.id
        and dp.id = d.id
        and dp.pay_type_id = dpt.id(+)
        and dp.kbkcode_id = dkb.id(+)
        and dp.payment_id = po.id
        and not d.typesysname in ('DedPaybackDeposit','PaymentBack')
        and not exists(
                       select 0
                       from fdc_payment_deduct_cnfrm pdc
                       where pdc.id = dp.id
                      )
        and po.id = pol.id
        and pol.typesysname <> 'PaymentOrderConfirm'
      group by dp.decl_id, dpt.code, nvl(dp.charge_curr_id,po.currency_id), nvl(dkb.code, '-')
     ) pd
where charge.decl_id = pd.decl_id(+)
  and charge.payment_code = pd.payment_code(+)
  and charge.kbkcode = pd.kbkcode(+)
  and charge.currency_id = pd.currency_id(+)
  and (pd.summa_datefrom is null or charge.summa > pd.summa_datefrom)
  
[dsOper2]
WITH
  ss AS (
          SELECT :SUBJ_ID AS id
            FROM dual
           WHERE 0 = :IS_GEN_REP_INN
          UNION
          SELECT id
            FROM fdc_subject_lst
           WHERE 1 = :IS_GEN_REP_INN
             AND inn = :INN
    )
  select nvl(dc.change_date,dl.doc_date) as "date"
        ,dcl.name as name
        ,to_char( null ) as plat_name
        ,to_char( null ) as code
        ,dc.id as nomer
        ,dcl.subject_id
        ,dc.summa as credit
        ,0 as debit
        ,to_char( null ) as debt
        ,pt.code as payment_type
  from fdc_decl_charge dc
      ,fdc_document_lst dl
      ,fdc_doc_charge_lst dcl
      ,fdc_dict pt
  where dc.decl_id = dcl.id
    and (dcl.subject_id in (select id from ss))
    and dc.id = dl.id
    and (dl.doc_date between :from_date and :to_date)
    and dc.pay_type_id = pt.id(+)
  union all     
  select dl.doc_date as "date"
        ,dcl.name as name
        ,pol.name as plat_name
        ,to_char( null ) as code
        ,dp.id as nomer
        ,dcl.subject_id
        ,0 as credit
        ,dp.summa as debit
        ,to_char( null ) as debt
        ,pt.code as payment_type
  from fdc_payment_deduction dp
      ,fdc_doc_charge_lst dcl
      ,fdc_dict pt
      ,fdc_payment_order po
      ,fdc_document_lst dl
      ,fdc_document_lst pol
  where dp.decl_id = dcl.id
    and (dcl.subject_id in (select id from ss))
    and dp.id = dl.id
    and (dl.doc_date between :from_date and :to_date)
    and dp.pay_type_id = pt.id(+)
    and dp.payment_id = po.id
    and po.id = pol.id
    and pol.typesysname <> 'PaymentOrderConfirm'
  order by 1,2 asc, 10, 8 nulls first