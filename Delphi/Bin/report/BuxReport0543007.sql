[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
  ,(SELECT NAME FROM fdc_customs_lst WHERE customs_code_8 = p_Params.ParentCustomsCode) as ParentCustoms
 ,'¹ '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number 
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]
with acc as (select id, code from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
    select k.code KBKCode,
           '130404' || substr( k.code, -3 ) Debet,
           '130305730' Kredet,
           sum(t.operation_sum) RegSum
      from  fdc_acc_transaction t
  ,acc
  ,fdc_dict    k
  ,fdc_document_lst d
WHERE  t.account_id = acc.id
  AND ((p_params.CustomLevel = 2 and ((acc.code in ('01.01.01', '01.01.02', '01.01.06') and t.is_debit = 'Y') or (acc.code in ('01.01.07') and t.is_debit = 'N'))) or
       (p_params.CustomLevel = 1 and (
        (  t.operation_date < to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.01') and t.is_debit='Y') or
        (  t.operation_date < to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.02') and t.is_debit='N' and d.TypeSysName in ('DocReuseY','DocumentConfirmation.Reuse') ) or
       (  t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.01') and t.is_debit='Y') or
       (  t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.04') and t.is_debit='N')
       )))      
      and (t.operation_date between :DateFrom and :DateTo)
      and t.currency_id = :CurrId
      AND t.kbk_id = k.id
	  AND t.doc_id=d.id
      and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')
    group by k.code
    order by k.code

	
[dsCheckRate]
select 
  fdc_nsicurrency_GetRate(:CurrId)
from 
  dual

[dsFooter]  
select sum(t.operation_sum) RegSum
      from  fdc_acc_transaction t
  ,(select id, code from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )) acc
  ,fdc_dict    k
  ,fdc_document_lst d
WHERE  t.account_id = acc.id
  AND ((p_params.CustomLevel = 2 and acc.code in ('01.01.01', '01.01.02', '01.01.06', '01.01.07')) or
       (p_params.CustomLevel = 1 and (
        (  t.operation_date < to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.01') and t.is_debit='Y') or
       (  t.operation_date < to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.02') and t.is_debit='N' and d.TypeSysName in ('DocReuseY','DocumentConfirmation.Reuse') ) or
       (  t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.01') and t.is_debit='Y') or
       (  t.operation_date >= to_date('01.01.2011','dd.mm.yyyy')
       and acc.code in ('Ð01.10.04') and t.is_debit='N')
       )))      
      and (t.operation_date between :DateFrom and :DateTo)
      and t.currency_id = :CurrId
      AND t.kbk_id = k.id
      AND t.doc_id=d.id
      and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
''

[RTUAccounts]
'Ð01.10.01', 'Ð01.10.02', 'Ð01.10.04'

[CustomAccounts]
'01.01.01', '01.01.02', '01.01.06', '01.01.07'
