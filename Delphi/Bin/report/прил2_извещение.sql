[dsSysValues]
SELECT
  Name, SysName, StringValue
FROM
  fdc_value_lst_sys 
WHERE
  SysName = 'CustomsName'
  or SysName = 'BossName'
  or SysName = 'CustomINN'
  or SysName = 'CustomKPP'
  or SysName = 'CustomsIA'
  or SysName = 'PayBossName'
  or SysName = 'CustomsCode'

[dsMaster]
SELECT
  c.Id as CurrId
  ,concat('Единица измерения : ', c.name) as CurrCode
  ,Code as CurrACode
  ,fdc_nsicurrency_GetRate(Id, :Date_To) as CurrRate
  ,:Date_From as Date_From
  ,:Date_To as Date_To
 ,:CustomsCode as CustomsCode
 ,:Period as Period
FROM
  fdc_nsi_currency_lst c
WHERE
  c.id = :Curr_Id

[dsSlave]
Select
  sum(inRubSuum) as inRubSuum
  ,sum(inCurrSuum) as inCurrSuum
  ,sum(outRubSuum) as outRubSuum
  ,sum(outCurrSuum) as outCurrSuum
  ,sum(inRubSuum) + sum(outRubSuum) as TotalRubSuum
  ,sum(inCurrSuum) + sum(outCurrSuum) as TotalCurrSuum
from
(
select
  nvl(l.DTURNOVER, 0) * fdc_nsicurrency_getRate(:Curr_Id, :Date_To) as inRubSuum
  ,nvl(l.DTurnOver, 0) as inCurrSuum
  ,0 as outRubSuum
  ,0 as outCurrSuum  
from 
  fdc_account_saldo_by_params l
Where
  fdc_SetSaldoParams('112', :Curr_Id, :Date_From, :Date_To, 'CT') = 1
  and a1 is null
union all
select
  0 as inRubSuum
  ,0 as inCurrSuum
  ,nvl(l.CTURNOVER, 0) * fdc_nsicurrency_getRate(:Curr_Id, :Date_To) as outRubSuum
  ,nvl(l.CTurnOver, 0) as outCurrSuum  
from 
  fdc_account_saldo_by_params l
Where
  fdc_SetSaldoParams('102', :Curr_Id, :Date_From, :Date_To, 'CT') = 1
) 
