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

SELECT decode (Mlt.Rn, 0, decode(Dat.OperNum, 1, '1. Подлежит уточнению с КДБ', 2, '2. Подлежит уточнению на КДБ', null), decode(Dept_Header, 'Итого', null, Dept_Header)) OperNum
     , decode (Mlt.Rn, 0, decode(Dat.OperNum, 1, '01', 2, '02', null), decode(Dept_Header, 'Итого', null, Dept_Header)) OperCode
     , decode (Mlt.Rn, 0, NULL, Dat.KbkCode) KbkCode
     , CASE 
         WHEN Mlt.Rn = 0
           OR Dat.KbkCode IS NULL THEN
           NULL
         WHEN Dat.OperNum = 1 THEN
           '130305830'
         ELSE
           '130404' || substr( Dat.KbkCode, -3 )
       END AS Debet
     , CASE 
         WHEN Mlt.Rn = 0
           OR Dat.KbkCode IS NULL THEN
           NULL
         WHEN Dat.OperNum = 1 THEN
           '130404' || substr( Dat.KbkCode, -3 )
         ELSE
           '130305730'
       END AS Kredit
     , to_number( decode (Mlt.Rn, 0, NULL, decode(KbkCode, null, null, Dat.Sal)) ) RegSum
  FROM (SELECT CASE
                 WHEN grouping (OperNum) = 1 THEN
                   'Итого'
                 WHEN grouping (KbkCode) = 1 THEN
                   'Итого'
                 ELSE
                   --to_Char (OperNum)
                   null
               END Dept_Header
             , OperNum
             , KbkCode
             , sum ( reg_sum ) Sal
             , lag (OperNum, 1, -999) OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Prev_Dept
             , row_number () OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Order_Num
          FROM (select 1 as opernum
          ,CASE
           WHEN p_nsi_kbk.iskbkts( s.kbk_code_t)='Y' or p_nsi_kbk.iskbkts( s.kbk_code_s)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
   ,CASE      
    WHEN s.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                           ,'NoticeSpecifyKindPayCorrSumm' ) THEN
      s.kbk_code_t
    ELSE
      s.kbk_code_s
  END                       AS KBKCode
 , - r.operation_sum        AS reg_sum
  FROM fdc_acc_transaction         r
      ,fdc_doc_confirm_lst         c
      ,fdc_bud_specify_kindpay_lst s
      ,acc
  WHERE r.account_id = acc.id
    AND ( r.operation_date < to_date('01.01.2011','dd.mm.yyyy'))
    AND r.is_debit='N'
    AND acc.code in ('Р12.20.01', 'Р12.20.02', 'Р12.20.03')
    AND r.currency_id = :CurrId
    AND (r.operation_date between :DateFrom and :DateTo)
    AND r.doc_id = c.id
    AND c.confirmed_doc_id = s.id
    AND (p_params.CustomLevel = p_consts.customlevel_rtu)    
    union all    
    select 2 as opernum
    ,CASE
           WHEN p_nsi_kbk.iskbkts(nkl.kbk_code_s)='Y' or p_nsi_kbk.iskbkts( nkl.kbk_code_t)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
   ,CASE
    WHEN nkl.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                           ,'NoticeSpecifyKindPayCorrSumm' ) THEN
      nkl.kbk_code_s
    ELSE
      nkl.kbk_code_t
  END                       AS KBKCode
 ,act.operation_sum          AS reg_sum
  FROM fdc_acc_transaction act
  join acc
  on (act.account_id = acc.id)
  AND (act.operation_date < to_date('01.01.2011','dd.mm.yyyy'))
  AND act.is_debit='Y'
  AND acc.code in ('Р12.20.01', 'Р12.20.02', 'Р12.20.03')
  AND act.currency_id = :CurrId
  AND (act.operation_date between :DateFrom and :DateTo)
  join  fdc_bud_specify_kindpay_lst   nkl
  on ( act.doc_id=nkl.id)
  where  (p_params.CustomLevel = p_consts.customlevel_rtu)  
  union all  
select 1 as opernum
,CASE
           WHEN p_nsi_kbk.iskbkts(i.kbk_code_t)='Y' or p_nsi_kbk.iskbkts(i.kbk_code_s)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
  ,CASE
    WHEN i.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                           ,'NoticeSpecifyKindPayCorrSumm' ) THEN
      i.kbk_code_t
    ELSE
      i.kbk_code_s
  END                       AS KBKCode 
  , (case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then -i.operation_sum_act else i.operation_sum_act end) /*act.operation_sum */         AS reg_sum
FROM
 ( select distinct act.doc_id from fdc_acc_transaction act
  join  acc
  on (act.account_id = acc.id)
  AND ( act.operation_date >= to_date('01.01.2011','dd.mm.yyyy'))
  AND act.is_debit='Y'
  AND acc.code in  ('Р12.30.01', 'Р12.30.02', 'Р12.30.03')
  AND act.currency_id =  :CurrId
  AND (act.operation_date between :DateFrom and :DateTo)
    ) act1
join  
(select rnl.object_id as doc_id_act
, nkl.kbk_source_id
,   nkl.kbk_target_id  as kbk_id_act
,   nkl.typesysname
,   nkl.kbk_code_s
,   nkl.kbk_code_t
, sum(nkl.summa) as operation_sum_act
 from fdc_rel_reestr_skindpay_lst rnl
join  fdc_bud_specify_kindpay_lst   nkl
on ( rnl.rel_object_id=nkl.id)
group by rnl.object_id, nkl.kbk_source_id, nkl.kbk_target_id, nkl.typesysname, nkl.kbk_code_s, nkl.kbk_code_t
) i
on (act1.doc_id=i.doc_id_act)  
--AND act.kbk_id=(case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then i.kbk_source_id else i.kbk_id_act end)
--AND act.operation_sum=(case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then -i.operation_sum_act else i.operation_sum_act end)
where (p_params.CustomLevel = p_consts.customlevel_rtu)
union all
select 2 as opernum
,CASE
           WHEN p_nsi_kbk.iskbkts(i.kbk_code_t)='Y' or p_nsi_kbk.iskbkts(i.kbk_code_s)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
  ,CASE
    WHEN i.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                           ,'NoticeSpecifyKindPayCorrSumm' ) THEN
      i.kbk_code_s
    ELSE
      i.kbk_code_t
  END                       AS KBKCode
  , (case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then -i.operation_sum_act else i.operation_sum_act end) /*act.operation_sum */         AS reg_sum
 FROM 
 ( select distinct act.doc_id from fdc_acc_transaction act
  join  acc
  on (act.account_id = acc.id)
  AND ( act.operation_date >= to_date('01.01.2011','dd.mm.yyyy'))
  AND act.is_debit='Y'
  AND acc.code in  ('Р12.30.01', 'Р12.30.02', 'Р12.30.03')
  AND act.currency_id =  :CurrId
  AND (act.operation_date between :DateFrom and :DateTo)
    ) act1
join  
(select rnl.object_id as doc_id_act
, nkl.kbk_source_id
,   nkl.kbk_target_id  as kbk_id_act
,   nkl.typesysname
,   nkl.kbk_code_s
,   nkl.kbk_code_t
, sum(nkl.summa) as operation_sum_act
 from fdc_rel_reestr_skindpay_lst rnl
join  fdc_bud_specify_kindpay_lst   nkl
on ( rnl.rel_object_id=nkl.id)
group by rnl.object_id, nkl.kbk_source_id, nkl.kbk_target_id, nkl.typesysname, nkl.kbk_code_s, nkl.kbk_code_t
) i
on (act1.doc_id=i.doc_id_act)  
--AND act.kbk_id=(case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then i.kbk_source_id else i.kbk_id_act end)
--AND act.operation_sum=(case when i.typesysname='NoticeSpecifyKindPayCorrSumm' then -i.operation_sum_act else i.operation_sum_act end)
where (p_params.CustomLevel = p_consts.customlevel_rtu)
union all
select 1 as OperNum
,CASE
           WHEN p_nsi_kbk.iskbkts(s.kbk_code_t)='Y' or p_nsi_kbk.iskbkts( s.kbk_code_s)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
    ,CASE
                          WHEN s.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                                                 ,'NoticeSpecifyKindPayCorrSumm' ) THEN
                            s.kbk_code_t
                          ELSE
                            s.kbk_code_s
                        END                       AS KBKCode
                       , - r.operation_sum        AS reg_sum
                   FROM fdc_acc_transaction         r
                       ,fdc_doc_confirm_lst         c
                       ,fdc_bud_specify_kindpay_lst s
                       , acc
                   WHERE r.account_id = acc.id
                     AND r.is_debit='N'
                     AND acc.code in ('12.02.01', '12.02.02', '12.02.03')
                     AND r.currency_id =:CurrId
                     AND (r.operation_date between :DateFrom and :DateTo)
                     AND r.doc_id = c.id
                     AND c.confirmed_doc_id = s.id 
                     AND p_params.CustomLevel = p_consts.customlevel_t                     
                     union all                     
                     select 2 as OperNum
                     ,CASE
           WHEN p_nsi_kbk.iskbkts(s.kbk_code_t)='Y' or p_nsi_kbk.iskbkts( s.kbk_code_s)='Y'
           THEN 'Y' ELSE 'N' END AS IS_TS
    ,CASE
                          WHEN s.typesysname IN ( 'NoticeSpecifyKindPayCorr'
                                                 ,'NoticeSpecifyKindPayCorrSumm' ) THEN
                            s.kbk_code_s
                          ELSE
                            s.kbk_code_t
                        END                       AS KBKCode
                       , - r.operation_sum        AS reg_sum
                   FROM fdc_acc_transaction         r
                       ,fdc_doc_confirm_lst         c
                       ,fdc_bud_specify_kindpay_lst s
                       , acc
                     WHERE r.account_id = acc.id
                      AND  r.is_debit='N'
                      AND acc.code in ('12.02.01', '12.02.02', '12.02.03')
                     AND r.currency_id = :CurrId
                     AND (r.operation_date between :DateFrom and :DateTo)
                     AND r.doc_id = c.id
                     AND c.confirmed_doc_id = s.id           
                     AND p_params.CustomLevel = p_consts.customlevel_t 
               ) q
         where  ((case nvl(:ists,'N') when 'N' then 'Y' else q.is_ts end) = 'Y')
         GROUP BY ROLLUP (OperNum, KbkCode)
       ) Dat
     , (SELECT 0 Rn FROM Dual
         UNION ALL
        SELECT 1 Rn From Dual
       ) Mlt
WHERE Mlt.Rn         = 1
   OR Dat.Prev_Dept != Dat.OperNum 
ORDER BY Dat.Order_Num, Mlt.Rn

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
  and t.reg_date between c.sdate and nvl(c.edate, t.reg_date)
  and c.code in (

--GetAccounts--
  )
  and ((p_params.CustomLevel = 1 and t.is_debit='Y'
         AND (  (c.code IN ('Р12.20.01', 'Р12.20.02', 'Р12.20.03') and t.reg_date < to_date('01.01.2011','dd.mm.yyyy'))
              or 
                (c.code IN ('Р12.30.01', 'Р12.30.02', 'Р12.30.03') and t.reg_date >= to_date('01.01.2011','dd.mm.yyyy'))))
        or
        p_params.CustomLevel != 1 and t.is_debit='N'
       )                     
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')

[FTSAccounts]
'01.01.01', '01.01.07'

[RTUAccounts]
'Р12.20.01', 'Р12.20.02', 'Р12.20.03', 'Р12.30.01', 'Р12.30.02', 'Р12.30.03'

[CustomAccounts]
'12.02.01',  '12.02.02',  '12.02.03'
