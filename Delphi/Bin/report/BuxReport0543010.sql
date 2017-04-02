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
with acc as (select id, code from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
SELECT CASE
         WHEN rn = 1 THEN
          NAME
         ELSE
          NULL
       END AS NAME
      ,CASE
         WHEN rn = 1 THEN
          customs_code_8
         ELSE
          NULL
       END AS customs_code_8
      ,t.KBKCode
      ,t.Debet
      ,t.Kredet
      ,t.RegSum
      ,t.subject_id
  FROM (SELECT row_number() OVER(PARTITION BY cust.NAME, cust.customs_code_8 ORDER BY cust.NAME, cust.customs_code_8) AS rn
              ,nvl(cust.ShortName, cust.NAME) AS NAME
              ,cust.customs_code_8
              ,tt.*
          FROM (SELECT k.code KBKCode
                      ,'130404' || substr(k.code, -3) Debet
                      ,'130305730' Kredet
                      ,-SUM(r.operation_sum) RegSum
                      ,r.subject_id
                  FROM fdc_acc_transaction r
                  JOIN acc c ON (r.account_id = c.id)
                            AND ((p_params.CustomLevel != 1) OR
                                (p_params.CustomLevel = 1 AND
                                r.operation_date >=
                                to_date('01.01.2011', 'fxdd.mm.yyyy') AND
                                c.code = 'Р09.00.00.заб') OR
                                (p_params.CustomLevel = 1 AND
                                r.operation_date <
                                to_date('01.01.2011', 'fxdd.mm.yyyy') AND
                                c.code = 'Р09.00.00'))
                            AND r.is_debit = 'N'
                            AND r.currency_id = :CurrId
                            AND (r.operation_date BETWEEN :DateFrom AND
                                :DateTo)
                            AND r.subject_id <> p_params.CustomsId
                  JOIN fdc_dict k ON (r.kbk_id = k.id)
                                         AND ((CASE nvl(:ists, 'N') WHEN 'N' THEN 'Y' ELSE
                                              p_nsi_kbk.iskbkts(k.code) END) = 'Y')
                 GROUP BY k.code, r.subject_id) tt
              ,fdc_customs_lst cust
         WHERE CASE WHEN p_Params.CustomLevel = 2 THEN p_Params.CustomsId ELSE tt.subject_id END = cust.ID) t
[dsCheckRate]
select 
  fdc_nsicurrency_GetRate(:CurrId)
from 
  dual

[dsFooter]  
select sum(t.reg_sum) RegSum
  from fdc_acc_reg_kbk t,
       fdc_dict k,
       fdc_acc_light_lst c,
       fdc_acc_transaction r,
       fdc_customs_lst cust
where t.kbk_id = k.id
  and t.currency_id = :CurrId
  and (t.reg_date between :DateFrom and :DateTo)
  and c.code in (

--GetAccounts--
  )
  and ((p_params.CustomLevel = 1 and c.code = 'Р09.00.00' and r.operation_date < to_date('01.01.2011','dd.mm.yyyy')) 
         or
       (p_params.CustomLevel = 1 and c.code = 'Р09.00.00.заб' and r.operation_date >= to_date('01.01.2011','dd.mm.yyyy'))
         or
       (p_params.CustomLevel != 1)   
       ) 
  and t.account_id = c.id 
  and r.kbk_id = t.kbk_id
  and r.account_id = t.account_id
  and r.currency_id = t.currency_id
  and r.operation_date = t.reg_date
  and r.is_debit = t.is_debit
  and t.reg_date between c.sdate and NVL(c.edate, t.reg_date)
  and t.is_debit='N'
  and r.subject_id = cust.ID
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
'Ф09.00.00'

[RTUAccounts]
'Р09.00.00', 'Р09.00.00.заб'

[CustomAccounts]
'09.01.01', '09.01.02', '09.01.03', '09.01.04'
