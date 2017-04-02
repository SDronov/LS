[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
 ,'¹ '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number 
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]
with acc as (select id, code, (case WHEN p_Params.CustomLevel = 2 AND code = '06.01.03' or p_Params.CustomLevel = 1 AND code = 'Ð06.20.02' or p_Params.CustomLevel = 0 AND code = 'Ô06.20.02' then '01' else '02' end) opercode from fdc_acc_light_lst a where a.code in (

--GetAccounts--
)
and ((    p_params.CustomLevel = 0
          and (   a.code in ('Ô06.20.02', 'Ô12.20.01', 'Ô12.20.02', 'Ô12.20.03') AND nvl( a.edate, to_date( '31.12.2139', 'dd.mm.yyyy' ) ) < to_date( '01.01.2011', 'dd.mm.yyyy' )
               OR a.code IN ('Ô06.20.02', 'Ô12.10.01', 'Ô12.10.02', 'Ô12.10.03') AND a.sdate >= to_date( '01.01.2011', 'dd.mm.yyyy' ) ) )
       or
         (    p_params.CustomLevel = 1
          and (   a.code in ('Ð06.20.02', 'Ð12.20.01', 'Ð12.20.02', 'Ð12.20.03') AND nvl( a.edate, to_date( '31.12.2139', 'dd.mm.yyyy' ) ) < to_date( '01.01.2011', 'dd.mm.yyyy' )
               OR a.code IN ('Ð06.20.02', 'Ð12.10.01', 'Ð12.10.02', 'Ð12.10.03') AND a.sdate >= to_date( '01.01.2011', 'dd.mm.yyyy' ) ) ))
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
SELECT CASE
         WHEN rn = 1 THEN
           tt.customs_name
         ELSE
           NULL
       END AS NAME
      ,CASE
         WHEN rn = 1 THEN
           tt.customs_code_8
         ELSE
           NULL
       END AS customs_code_8
      ,CASE
         WHEN rn_o = 1 THEN
           tt.opercode
         ELSE
           NULL
       END AS opercode
      ,KBKCode
      ,Debet
      ,Kredit
      ,RegSum
  FROM (SELECT row_number() OVER (PARTITION BY nvl(cust.shortname, cust.name), cust.customs_code_8 ORDER BY nvl(cust.shortname, cust.name), cust.customs_code_8, c.opercode, k.code) AS rn
              ,row_number() OVER (PARTITION BY nvl(cust.shortname, cust.name), cust.customs_code_8, c.opercode ORDER BY nvl(cust.shortname, cust.name), cust.customs_code_8, c.opercode, k.code) AS rn_o
              ,k.code KBKCode
              ,CASE c.opercode
                 WHEN '01' THEN
                   '130404' || substr( k.code, -3 )
                 ELSE
                   '130305830'
               END AS Debet
              ,CASE c.opercode
                 WHEN '01' THEN
                   '130305730'
                 ELSE
                   '130404' || substr( k.code, -3 )
               END AS Kredit
              ,SUM(CASE WHEN c.opercode = '01' THEN -1 ELSE 1 END
                -- * CASE WHEN d.TypeSysName IN ( 'NoticeSpecifyKindPay',     'NoticeSpecifyKindPaySumm'     ) THEN +1 ELSE -1 END
                -- * CASE WHEN d.TypeSysName IN ( 'NoticeSpecifyKindPayCorr', 'NoticeSpecifyKindPayCorrSumm' ) THEN -1 ELSE +1 END
                 * r.operation_sum ) RegSum
              ,c.opercode
              ,cust.customs_code_8
              ,nvl(cust.shortname, cust.name) AS customs_name
          FROM fdc_acc_transaction r
              ,fdc_dict    k
              ,acc                 c
              ,fdc_document_lst    d
              ,fdc_customs_lst     cust
              ,fdc_bud_specify_kindpay_lst   nkl
         WHERE r.kbk_id = k.id
           AND r.account_id = c.id
           AND r.currency_id = :CurrId
--           AND r.operation_date = :DateFrom
           AND (r.operation_date between :DateFrom and :DateTo)
           AND d.id = r.doc_id
           AND r.subject_id <> p_params.CustomsId
           AND (   c.opercode = '01' AND r.is_debit = 'N' AND d.TypeSysName IN ( 'NoticeSpecifyKindPay', 'NoticeSpecifyKindPaySumm', 'NoticeSpecifyKindPayCorr', 'NoticeSpecifyKindPayCorrSumm' )
                OR c.opercode = '02' AND r.is_debit = 'Y' )
           AND cust.id = r.subject_id
           --AND cust.id = p_Params.CustomsId
           AND nkl.id=r.doc_id
           and ((case nvl(:ists,'N') when 'N' then 'Y' else 
            (CASE
           WHEN p_nsi_kbk.iskbkts(nkl.kbk_code_s)='Y' or p_nsi_kbk.iskbkts( nkl.kbk_code_t)='Y'
           THEN 'Y' ELSE 'N' END)  end) = 'Y')
         GROUP BY nvl(cust.shortname, cust.name), cust.customs_code_8, c.opercode, k.code
         ORDER BY nvl(cust.shortname, cust.name), cust.customs_code_8, c.opercode, k.code) tt
 WHERE tt.RegSum <> 0
 
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
  and t.reg_date between c.sdate and nvl(c.edate,t.reg_date)
  and c.code in (

--GetAccounts--
  )
  and ((    p_params.CustomLevel = 0
          and (   c.code in ('Ô12.20.01', 'Ô12.20.02', 'Ô12.20.03') AND nvl( c.edate, to_date( '31.12.2139', 'dd.mm.yyyy' ) ) < to_date( '01.01.2011', 'dd.mm.yyyy' )
		          OR c.code IN ( 'Ô12.10.01', 'Ô12.10.02', 'Ô12.10.03') AND c.sdate >= to_date( '01.01.2011', 'dd.mm.yyyy' ) )   AND t.is_debit='Y')
       or
         (    p_params.CustomLevel = 1
          and (   c.code in ( 'Ð12.20.01', 'Ð12.20.02', 'Ð12.20.03') AND nvl( c.edate, to_date( '31.12.2139', 'dd.mm.yyyy' ) ) < to_date( '01.01.2011', 'dd.mm.yyyy' )
               OR c.code IN ( 'Ð12.10.01', 'Ð12.10.02', 'Ð12.10.03') AND c.sdate >= to_date( '01.01.2011', 'dd.mm.yyyy' ) )  AND t.is_debit='Y' ))
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
'Ô06.20.02', 'Ô12.20.01', 'Ô12.20.02', 'Ô12.20.03', 'Ô12.10.01', 'Ô12.10.02', 'Ô12.10.03'

[RTUAccounts]
'Ð06.20.02', 'Ð12.20.01', 'Ð12.20.02', 'Ð12.20.03', 'Ð12.10.01', 'Ð12.10.02', 'Ð12.10.03'

[CustomAccounts]
' '
