[dsSysValues]
SELECT
  Name, SysName, StringValue
FROM
  fdc_value_lst_sys 
WHERE
  SysName = 'CustomsName'
  or SysName = 'BossName'


[dsDebet]
SELECT k.code AS KBK
      ,c.code AS CurrCode
      ,CASE WHEN c.code = '643' THEN 1 ELSE fdc_nsicurrency_getrate(c.id, :date_from) END AS CurrRate
      ,SUM( t.operation_sum ) AS CurrSuum
      ,SUM( t.operation_sum * CASE WHEN c.code = '643' THEN 1 ELSE fdc_nsicurrency_getrate(c.id, :date_from) END ) AS RubSuum
  FROM fdc_acc_transaction  t
      ,fdc_nsi_currency_lst c
      ,fdc_kbk_dict_lst     k
  WHERE t.account_id IN ( SELECT a.id FROM fdc_acc_light_lst a START WITH a.code IN ( '03.00.00', '12.01.00' ) CONNECT BY PRIOR a.id = a.parent_id )
    AND t.operation_date <= :date_from
    AND c.id(+) = t.currency_id
    AND k.id(+) = t.kbk_id
  GROUP BY k.code, c.code, c.id
  HAVING SUM( t.operation_sum ) <> 0


[dsCredit]
select
  CurrCode
  ,CurrRate
  ,sum(CurrSuum) as CurrSuum
  ,sum(RubSuum) as RubSuum
from
(
select
  c.code as CurrCode
  ,fdc_nsicurrency_getrate(c.id, :Date_From) as CurrRate
  ,-l.osaldo as CurrSuum  
  ,-l.osaldo * fdc_nsicurrency_getrate(c.id, :Date_From) as RubSuum
from 
  fdc_account_saldo_by_params l
  ,fdc_nsi_currency_lst c
where
  fdc_SetSaldoParams('100', null, :Date_From, :Date_From, 'CT') = 1
  and c.id = l.a0
  and l.a1 is null
union all
select
  c.code as CurrCode
  ,fdc_nsicurrency_getrate(c.id, :Date_From) as CurrRate
  ,-l.osaldo as CurrSuum  
  ,-l.osaldo * fdc_nsicurrency_getrate(c.id, :Date_From) as RubSuum 
from 
  fdc_account_saldo_by_params l
  ,fdc_nsi_currency_lst c
where
  fdc_SetSaldoParams('134', null, :Date_From, :Date_From, 'CT') = 1
  and c.id = l.a0
union all
select
  c.code as CurrCode
  ,fdc_nsicurrency_getrate(c.id, :Date_From) as CurrRate
  ,-l.osaldo as CurrSuum  
  ,-l.osaldo * fdc_nsicurrency_getrate(c.id, :Date_From) as RubSuum 
from 
  fdc_account_saldo_by_params l
  ,fdc_nsi_currency_lst c
where
  fdc_SetSaldoParams('144', null, :Date_From, :Date_From, 'CT') = 1
  and c.id = l.a0
union all
select
  c.code as CurrCode
  ,fdc_nsicurrency_getrate(c.id, :Date_From) as CurrRate
  ,-l.osaldo as CurrSuum  
  ,-l.osaldo * fdc_nsicurrency_getrate(c.id, :Date_From) as RubSuum 
from 
  fdc_account_saldo_by_params l
  ,fdc_nsi_currency_lst c
where
  fdc_SetSaldoParams('173Ï', null, :Date_From, :Date_From, 'CT') = 1
  and c.id = l.a0
)
group by
  CurrRate
  ,CurrCode


[dsDebetTotal]
select
  sum(RubSuumTotal) RubSuumTotal
from
(
select
  sum(abs(l.osaldo) * fdc_nsicurrency_getrate(l.a0, :Date_From)) as RubSuumTotal 
from 
  fdc_account_saldo_by_params l
where
  fdc_SetSaldoParams('178', null, :Date_From, :Date_From, 'C') = 1
union all
select
  sum(abs(l.osaldo) * fdc_nsicurrency_getrate(l.a0, :Date_From)) as RubSuumTotal 
from 
  fdc_account_saldo_by_params l
where
  fdc_SetSaldoParams('173Ï', null, :Date_From, :Date_From, 'C') = 1
)
