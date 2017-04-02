[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
 ,'є '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number 
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]
with acc as (select id from fdc_acc_light_lst a where a.code in (
-- Ёто зарезервированна€ строка дл€ подстановки списка счетов
--GetAccounts--
)
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
SELECT CASE WHEN row_number() over (PARTITION BY nvl(cust.ShortName, cust.name) ORDER BY nvl(cust.ShortName, cust.name), tt.KBKCode) = 1 THEN nvl(cust.ShortName, cust.name) ELSE NULL END AS name
      ,CASE WHEN row_number() over (PARTITION BY nvl(cust.ShortName, cust.name) ORDER BY nvl(cust.ShortName, cust.name), tt.KBKCode) = 1 THEN cust.CUSTOMS_CODE_8            ELSE NULL END AS CUSTOMS_CODE_8
      ,tt.KBKCode
      ,tt.Debet
      ,tt.Kredet
      ,tt.RegSum
  FROM (SELECT k.code KBKCode
              ,'130305830' Debet
              ,'130404' || substr( k.code, -3 ) Kredet
              ,SUM(r.operation_sum) RegSum
              ,CASE WHEN p_Params.CustomLevel = 2 THEN p_Params.CustomsId ELSE r.subject_id END subject_id
          FROM fdc_acc_transaction r
              ,fdc_dict    k
              ,acc                 c
              ,fdc_document_lst    d
         WHERE r.kbk_id = k.id
           AND d.id = r.doc_id
           AND (   r.is_debit = 'Y'
                OR r.is_debit = 'N' AND d.TypeSysName in ('DocReuse','DocReuseY','Document', 'DocumentConfirmation.DPReuseY'))
           AND r.account_id = c.id
           AND r.currency_id = :CurrId
           AND (r.operation_date between :DateFrom and :DateTo)
           AND d.TypeSysName <> 'NoticeSpecifyKindPayCorr'
           AND d.TypeSysName <> 'NoticeSpecifyKindPayCorrSumm'
           and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')
         GROUP BY k.code, CASE WHEN p_Params.CustomLevel = 2 THEN p_Params.CustomsId ELSE r.subject_id END) tt
      ,fdc_customs_lst cust
 WHERE tt.subject_id = cust.ID
 ORDER BY nvl(cust.ShortName, cust.name), tt.KBKCode

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
-- Ёто зарезервированна€ строка дл€ подстановки списка счетов
--GetAccounts--
  )
  and t.account_id = c.id 
  and r.kbk_id = t.kbk_id
  and r.account_id = t.account_id
  and r.currency_id = t.currency_id
  and r.operation_date = t.reg_date
  and r.is_debit = t.is_debit
  and t.reg_date between c.sdate and c.edate
  and r.subject_id = cust.ID
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
'‘06.20.02'

[RTUAccounts]
'–06.20.02'

[CustomAccounts]
'06.01.01'

