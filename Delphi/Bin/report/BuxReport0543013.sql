[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
 ,'ÂÅÄÎÌÎÑÒÜ ¹ '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number 
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]
with acc as (select id from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
    select k.code KBKCode,
           null Debet,
           null Kredet,
           sum(t.reg_sum) RegSum
      from fdc_acc_reg_kbk t,
           fdc_dict k,
           acc c
    where t.kbk_id = k.id
      and t.account_id = c.id
      and t.currency_id = :CurrId
      and (t.reg_date between :DateFrom and :DateTo)
      and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')
   group by k.code

[dsCheckRate]
select 
  fdc_nsicurrency_GetRate(:CurrId)
from 
  dual

[dsFooter]  
select sum(t.reg_sum) RegSum
  from fdc_acc_reg_kbk t,
       fdc_dict k,
       fdc_acc_light_lst c
where t.kbk_id = k.id
  and t.currency_id = :CurrId
  and (t.reg_date between :DateFrom and :DateTo)
  and t.account_id = c.id 
  and t.reg_date between c.sdate and c.edate
  and c.code in (

--GetAccounts--
  )
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
'03.05.01.חאב', '03.05.04.חאב' /* Á */
,'03.05.02.חאב'                /* Â */   

[RTUAccounts]
'03.05.01.חאב', '03.05.04.חאב' /* Á */
,'03.05.02.חאב'                /* Â */   

[CustomAccounts]
'03.05.01.חאב', '03.05.04.חאב' /* Á */
,'03.05.02.חאב'                /* Â */   
