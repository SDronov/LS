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
  nvl(nsi_kbk.code, dp.payment_code) as KBK
  ,nvl(nsi_kbk.name, dp.payment_name ) as kbk_name
  ,sum(dp.SUMMA) summa
  ,c.code
from
  fdc_decl_payment_lst dp   
  ,fdc_nsi_currency_lst c
  ,(select max(code) as code, code2, name from fdc_kbk_dict_lst group by code2, name) nsi_kbk
where 
  dp.decl_id = :cdecl_Id
  and dp.CURRENCY_ID = c.id 
  and dp.payment_id = :PayOrder_ID
  and nsi_kbk.code2(+) = dp.payment_code
group by
  nvl(nsi_kbk.code, dp.payment_code)
  ,c.code
  ,nvl(nsi_kbk.name, dp.payment_name )

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
