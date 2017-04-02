[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
 ,'№ '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number 
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]
with acc as (select a.id, a.code from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
/*
    select k.code KBKCode,
           '130305830' Debet,
           '130404' || substr( k.code, -3 ) Kredet,
           sum(- t.reg_sum) RegSum
      from fdc_acc_reg_kbk t,
           fdc_dict k,
           acc c
    where t.kbk_id = k.id
      and t.account_id = c.id
      and t.currency_id = :CurrId
      and (t.reg_date between :DateFrom and :DateTo)
      and t.is_debit = 'N'
    group by k.code
*/
     select k.code KBKCode,
           '130305830' Debet,
           '130404' || substr( k.code, -3 ) Kredet,
           sum(- t.operation_sum) RegSum
    from fdc_acc_transaction t,
           fdc_dict k,
           acc c,
           fdc_document_lst d
    WHERE t.kbk_id = k.id
  AND t.account_id = c.id
  AND t.doc_id = d.id
  AND ((p_params.CustomLevel = 2 and c.code in ('01.00.00.заб')) or
       (p_params.CustomLevel = 1 and ((c.code in ('Р01.10.02') and t.operation_date < to_date('01.01.2011','dd.mm.yyyy'))
                                       or
                                      (c.code in ('Р01.00.00.заб') and t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')))
                                     and d.typesysname = 'Payment_Order_PayBackY') or
       (p_params.CustomLevel = 0 and c.code in ('Ф01.10.02') and d.typesysname = 'Payment_Order_PayBackY'))
AND t.is_debit = 'N'
and t.currency_id = :CurrId
and (t.operation_date between :DateFrom and :DateTo)
and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')
    group by k.code

[dsCheckRate]
select 
  fdc_nsicurrency_GetRate(:CurrId)
from 
  dual

[dsFooter]  
select sum(- t.operation_sum) RegSum
FROM
  fdc_acc_transaction t
 ,fdc_dict    k
 ,fdc_acc_light_lst   a
 ,fdc_document_lst d
WHERE t.kbk_id = k.id
  AND t.account_id = a.id
  AND (a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
  ))
  AND t.doc_id = d.id
  AND ((p_params.CustomLevel = 2 and a.code in ('01.00.00.заб')) or
       (p_params.CustomLevel = 1 and ((a.code in ('Р01.10.02') and t.operation_date < to_date('01.01.2011','dd.mm.yyyy'))
                                       or
                                      (a.code in ('Р01.00.00.заб') and t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')))
                                     and d.typesysname = 'Payment_Order_PayBackY') or
       (p_params.CustomLevel = 0 and a.code in ('Ф01.10.02') and d.typesysname = 'Payment_Order_PayBackY'))
AND t.is_debit = 'N'
and t.currency_id = :CurrId
and (t.operation_date between :DateFrom and :DateTo)
and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

  
[FTSAccounts]
'Ф01.10.02'

[RTUAccounts]
'Р01.10.02','Р01.00.00.заб'

[CustomAccounts]
'01.00.00.заб'
