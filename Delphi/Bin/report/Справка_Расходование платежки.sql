[dsHeader]
select
  name
  ,inn
  ,name ||', »ÕÕ '||inn as NameInn  
from 
  fdc_subject_lst where id = :Subj_Id

[dsGTD]
select
  pod.cdecl_id
   ,cd.typename ||' '||cd.name as name
  ,:PayOrder_Id as PayOrder_ID
from 
  fdc_pay_order_deduction_lst  pod
  ,fdc_custom_decl_lst cd
where 
  pod.payment_id = :PayOrder_Id
  and pod.cdecl_id = cd.id
group by 
  pod.cdecl_id
  ,cd.name
  ,cd.typename

[dsReport]
select 
  dp.PAYMENT_CODE
  ,dp.payment_name
  ,sum(dp.SUMMA) summa
  ,c.code
from
  fdc_decl_payment_lst dp   
  ,fdc_nsi_currency_lst c
where 
  dp.decl_id = :cdecl_Id
  and dp.CURRENCY_ID = c.id 
  and dp.payment_id = :PayOrder_ID
group by
  dp.payment_code
  ,c.code
  ,dp.payment_name

[dsGTDExp]
select
  name
  ,sum(summa)  as summa
from 
  fdc_decl_payment_lst 
where
  payment_id = :PayOrder_Id 
group by
  name

[dsPayment]
select 
  po.*
  ,c.acode
from 
  fdc_payment_order_lst po
  ,fdc_nsi_currency_lst c
where 
  po.id = :PayOrder_Id
  and c.code = po.curr_code

