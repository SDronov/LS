[dsHeader]
select 
  name as Subj_Name
  ,Inn as Subj_Inn
from 
  fdc_Subject_lst 
where Id = :Subj_Id


[dsValue]
SELECT Name, SysName, StringValue
  FROM fdc_value_lst_sys 
  WHERE SysName = 'CustomsName' or SysName = 'BossName'


[dsCurrency]
select code, name
  from fdc_nsi_currency_lst
  where Id = :Curr_Id


[dsSaldoIn]
WITH
  act AS ( SELECT id FROM fdc_acc_light_lst START WITH code = '06.00.00' CONNECT BY PRIOR id = parent_id )
SELECT NVL( SUM( s ), 0 ) AS saldo
  FROM (
      SELECT SUM( bs.balance_sum ) AS s
        FROM fdc_acc_balance_subject bs
       WHERE bs.subject_id = :subj_id
         AND bs.account_id IN ( SELECT id FROM act )
         AND bs.currency_id = :CURR_ID
         AND bs.balance_date <= to_date( '01' || to_char( :date_from, 'MMYYYY' ), 'DDMMYYYY' )
      UNION ALL
      SELECT SUM( rs.reg_sum ) AS s
        FROM fdc_acc_reg_subject rs
       WHERE rs.subject_id = :subj_id
         AND rs.account_id IN ( SELECT id FROM act )
         AND rs.currency_id = :CURR_ID
         AND rs.reg_date >= to_date( '01' || to_char( :date_from, 'MMYYYY' ), 'DDMMYYYY' )
         AND rs.reg_date < :date_from
    )


[dsSaldoOut]
WITH
  act AS ( SELECT id FROM fdc_acc_light_lst START WITH code = '06.00.00' CONNECT BY PRIOR id = parent_id )
SELECT NVL( SUM( s ), 0 ) AS saldo
  FROM (
      SELECT SUM( bs.balance_sum ) AS s
        FROM fdc_acc_balance_subject bs
       WHERE bs.subject_id = :subj_id
         AND bs.account_id IN ( SELECT id FROM act )
         AND bs.currency_id = :CURR_ID
         AND bs.balance_date <= to_date( '01' || to_char( :date_to, 'MMYYYY' ), 'DDMMYYYY' )
      UNION ALL
      SELECT SUM( rs.reg_sum ) AS s
        FROM fdc_acc_reg_subject rs
       WHERE rs.subject_id = :subj_id
         AND rs.account_id IN ( SELECT id FROM act )
         AND rs.currency_id = :CURR_ID
         AND rs.reg_date >= to_date( '01' || to_char( :date_to, 'MMYYYY' ), 'DDMMYYYY' )
         AND rs.reg_date < :date_to
    )


[dsReport]
WITH acc AS (
  SELECT a.id
    FROM fdc_acc a
    START WITH a.id IN ( SELECT id FROM fdc_acc_lst WHERE code = '06.00.00' AND rownum = 1 )
    CONNECT BY PRIOR a.id = a.parent_id
)
select decode(po.id, lag(po.id, 1) over(order by po.id), null, po.name) as doc_no
      ,decode(po.id, lag(po.id, 1) over(order by po.id), to_number(null), nvl(at.operation_sum, 0)) as po_summa
      ,d.name
      ,pt.code as payment_type
      ,decode(po.id, lag(po.id, 1) over(order by po.id), to_number(null), po.id) as pay_order_id
      ,-deduct.operation_sum as summa
  from (select t.payment_order_id AS po_id
                ,t.decl_id        AS doc_id
                ,t.payment_type_id
                ,SUM( t.operation_sum ) AS operation_sum
          from fdc_rep_pay_deduction_all t
          WHERE t.currency_id = :curr_id
            AND t.subject_id  = :subj_id
            AND t.operation_date between :date_from and :date_to
         group by t.payment_order_id, t.decl_id, t.payment_type_id
       ) deduct -- список списаний с учетом валюты, субъекта, периода и счетов 
      ,(select at.doc_id
              ,at.operation_sum
          from fdc_acc_transaction at
              ,acc
         where at.operation_date between :date_from and :date_to
           AND acc.id = at.account_id
       ) at 
      ,(select p.id
              ,p.name
          from fdc_payment_order_lst p
         where p.payer_id    = :subj_id
           and p.currency_id = :curr_id  
           and p.typesysname not in ('Payment_Order_PayBack')
         union
        select pf.id
              ,pf.po_name as name
          from fdc_payment_for_hist_lst pf -- переводные платежки
         where pf.subject_id  = :subj_id
           and pf.currency_id = :curr_id  
       ) po -- список платежек с учетом валюты и субъекта
      ,fdc_document_lst d
      ,fdc_payment_type_lst pt
 where po.id                  = at.doc_id
   and po.id                  = deduct.po_id(+) 
   and deduct.doc_id          = d.id(+)
   and deduct.payment_type_id = pt.id(+)


[dsOnlyPays]
select
  :Subj_Id
  ,:Curr_Id
  ,:Date_From
  ,:Date_To
from dual
where 1=2
/* %0:s */
