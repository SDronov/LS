[dsHeader]
select
  c.code OKB
  ,decode(c.code, '643', '383', null) OKEI
  ,c.name CurrName
  ,decode(c.code, '643', null, fdc_nsicurrency_GetRate(c.id))  CurrRate,
  to_char(:DateFrom, 'dd') DateFromDay,
  :DateFrom DateFromMonth,
  to_char(:DateFrom, 'yy') DateFromYear
 ,'Ведомость № '||(select rep_number from fdc_report_budget_lst where id = :reportid) rep_number
from
  fdc_nsi_currency_lst c
where
  c.id = :CurrId

[dsReport]

select Dept_Header, KbkCode, Sal  from (

select '1. Начислено' Dept_Header, 1 opernum, null kbkcode, null sal, 10000 order_num from dual
  UNION        
  
select '2. Зачтено' Dept_Header, 2 opernum, null kbkcode, null sal,  20000 order_num from dual
  UNION
  
select Dept_Header, OperNum, KbkCode, to_Number(Sal) ,  Order_Num
from   
( 
with acc as (
 select id, (case when code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01') then 1 else 2 end) OperNum, code from fdc_acc_light_lst a where a.code in (
--GetAccounts--
-- Это зарезервированная строка для подстановки списка счетов
 )
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)
SELECT 
       CASE when 1=grouping(OperNum) then '' when 1=grouping(KbkCode) then 'Итого по разделу '||OperNum ELSE null end Dept_Header,
       OperNum, KbkCode,  
       decode (grouping(OperNum), 1, '', sum(decode( opernum, 1,  reg_sum, -reg_sum )))  Sal,
       lag(OperNum, 1, -999) OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Prev_Dept,
       10000*OperNum + row_number() OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Order_Num
      FROM (
        select c.OperNum, k.code KBKCode, case when c.code IN ( '05.01.01') then -1 else 1 end * t.operation_sum as reg_sum
        from fdc_acc_transaction t join fdc_kbk_dict_lst k on(t.kbk_id=k.id) join acc c on (t.account_id = c.id)
        where 1=1
          and t.currency_id = :CurrId
          and (t.operation_date between :DateFrom and :DateTo)
          and 1 = case when (c.code in( '05.01.01') and t.is_debit = 'N' OR substr( c.code, 1, 5 ) = '12.01' AND t.is_debit = 'N') then 0 else 1 end 
          and t.is_current = 1
        union all
        select 2 OperNum, k.code KBKCode, -n.summa as reg_sum
        from fdc_payment_deduction n,
             fdc_dict k,
             fdc_object_relation r,
             FDC_REESTR_SPECIFY_KINDPAY s,
             fdc_document_lst do 
        where n.kbkcode_id = k.id
          and r.object_id = s.id
          and n.id = do.id
          and r.rel_object_id = n.id
          and not exists (select 1 from fdc_tr a where a.id = n.decl_id and rownum = 1)
          and do.activation_date <= to_date('31/12/16', 'dd/mm/yy')
          and s.date_send >= to_date('01/01/17', 'dd/mm/yy')
          and (to_date('01/01/17', 'dd/mm/yy') between :DateFrom and :DateTo) 
          and exists (select 1 from fdc_deduction_budget b where b.id = n.id)
		  and do.object_type_id not in (fdc_object_type_get_bysysname('PaymentDeduction.Correct'))
        union all
		select 2 OperNum, k.code KBKCode, -n.summa as reg_sum
        from fdc_payment_deduction n,
             fdc_dict k,
             fdc_object_relation r,
             FDC_REESTR_SPECIFY_KINDPAY s,
             fdc_document_lst do,
             fdc_advice_deduction_lst ad 
        where n.kbkcode_id = k.id
          and r.object_id = s.id
          and n.id = do.id
          and r.rel_object_id = n.id
          and ad.id = n.id
          and not exists (select 1 from fdc_tr a where a.id = n.decl_id and rownum = 1)
          and ad.advice_activation_date <= to_date('31/12/16', 'dd/mm/yy')
          and s.date_send >= to_date('01/01/17', 'dd/mm/yy')
          and (to_date('01/01/17', 'dd/mm/yy') between :DateFrom and :DateTo) 
          and exists (select 1 from fdc_deduction_budget b where b.id = n.id)
          and do.object_type_id in (fdc_object_type_get_bysysname('PaymentDeduction.Correct'))
		  ) t
      where  ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(kbkcode) end) = 'Y')
      GROUP BY ROLLUP ( OperNum, KbkCode )
)      

UNION

select  '3. Списано на забалансовый счет 34 задолженность, в отношении которой не производится принудительное взыскание, и пени по ней' as Dept_Header,
         3 as OperNum, null as KbkCode, null Sal,  30000 Order_Num  from dual
  union 
select '' as Dept_Header, 3 as OperNum, null KbkCode, null Sal, 30000+2 Order_Num  from dual

union 

select '4. Списана безнадежная задолженность' as Dept_Header, 4 as OperNum, null as KbkCode, null Sal,  40000 Order_Num from dual
  union  select '' as Dept_Header, 3 as OperNum, null KbkCode, null Sal, 40000+4 Order_Num  from dual

union (
select '5.Выплата процентов за несвоевременный возврат' as Dept_Header, 5 as OperNum, null KbkCode  , null as Sal,  50000  Order_Num from dual
 union
select
  decode( grouping (KbkCode), 1, 'Итого по разделу 5', '' ) as Dept_Header,
  OperNum,  KbkCode, sum(RegSum)  Sal, 
  50000 + 1 + row_number () OVER ( order by OperNum,  grouping(kbkCode), kbkCODE, grouping ( operNum ) ) Order_Num
from ( select
         5 as OperNum, dp.KbkCode as KbkCode, dp.summa as RegSum
       from
         fdc_decision_payback_lst dp join fdc_Object o1 on o1.id = dp.state_id and o1.sysName = 'DecisionPaybackSigned'
       where 1=1  
        and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(kbkcode) end) = 'Y')
        and dp.currency_id = :CurrId
        and dp.doc_date between :DateFrom and :DateTo
        and dp.kbkcode_id in ( select kbk.id from  FDC_KBK_DICT_LST kbk  where '5' = substr( kbk.code, 14, 1 ) )
		and dp.ext_source = p_params.SoftCustomsCode
     )
group by opernum, rollup (  kbkcode) )

order by Order_Num )


[ds___Report]

with acc as (
 select id, (case when code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01') then 1 else 2 end) OperNum, code from fdc_acc_light_lst a where a.code in (
--GetAccounts--
-- Это зарезервированная строка для подстановки списка счетов
 )
and (
     (:DateFrom between a.sdate and NVL( a.edate, :DateFrom ))
     or
     (:DateTo between a.sdate and NVL( a.edate, :DateTo ))
    )
)

SELECT decode (Mlt.Rn, 0, decode(Dat.OperNum, 1, '1. Начислено', 2, '2. Зачтено', null), decode(Dept_Header, 'Итого', null, Dept_Header)) OperNum
     , decode (Mlt.Rn, 0, NULL, Dat.KbkCode) KbkCode
     , to_Number(decode (Mlt.Rn, 0, NULL, decode(Dept_Header, 'Итого', null, Dat.Sal))) RegSum
     ,Order_Num
FROM (SELECT CASE
                 WHEN grouping (OperNum) = 1 THEN
                   'Итого'
                 WHEN grouping (KbkCode) = 1 THEN
                   'Итого по разделу ' || OperNum
                 ELSE
                   --to_Char (OperNum)
                   null
               END Dept_Header
             , OperNum
             , KbkCode
             , sum (reg_sum) Sal
             , lag (OperNum, 1, -999) OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Prev_Dept
             , row_number () OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Order_Num
      FROM (select c.OperNum,
                   k.code KBKCode,
                   case when c.code IN ( '05.01.01', '08.01.01' ) then -1 else 1 end * t.operation_sum as reg_sum
            from fdc_acc_transaction t,
                 fdc_kbk_dict_lst k,
                 acc c
            where t.kbk_id = k.id
              and t.account_id = c.id
              and t.currency_id = :CurrId
              and (t.operation_date between :DateFrom and :DateTo)
              and case when c.code in ( '05.01.01' ) and t.is_debit = 'N' OR substr( c.code, 1, 5 ) = '12.01' AND t.is_debit = 'N' then 0 else 1 end = 1
			  and t.is_current = 1
        union all
        select 2 OperNum, k.code KBKCode, n.summa as reg_sum
        from fdc_payment_deduction n,
             fdc_dict k,
             fdc_object_relation r,
             FDC_REESTR_SPECIFY_KINDPAY s,
             fdc_document_lst do 
        where n.kbkcode_id = k.id
          and r.object_id = s.id
          and n.id = do.id
          and r.rel_object_id = n.id
          and not exists (select 1 from fdc_tr a where a.id = n.decl_id and rownum = 1)
          and do.activation_date <= to_date('31/12/16', 'dd/mm/yy')
          and s.date_send >= to_date('01/01/17', 'dd/mm/yy')
          and (to_date('01/01/17', 'dd/mm/yy') between :DateFrom and :DateTo) 
          and exists (select 1 from fdc_deduction_budget b where b.id = n.id)
		  and do.object_type_id not in (fdc_object_type_get_bysysname('PaymentDeduction.Correct'))
        union all
		select 2 OperNum, k.code KBKCode, n.summa as reg_sum
        from fdc_payment_deduction n,
             fdc_dict k,
             fdc_object_relation r,
             FDC_REESTR_SPECIFY_KINDPAY s,
             fdc_document_lst do,
             fdc_advice_deduction_lst ad 
        where n.kbkcode_id = k.id
          and r.object_id = s.id
          and n.id = do.id
          and r.rel_object_id = n.id
          and ad.id = n.id
          and not exists (select 1 from fdc_tr a where a.id = n.decl_id and rownum = 1)
          and ad.advice_activation_date <= to_date('31/12/16', 'dd/mm/yy')
          and s.date_send >= to_date('01/01/17', 'dd/mm/yy')
          and (to_date('01/01/17', 'dd/mm/yy') between :DateFrom and :DateTo) 
          and exists (select 1 from fdc_deduction_budget b where b.id = n.id)
          and do.object_type_id in (fdc_object_type_get_bysysname('PaymentDeduction.Correct'))
			  ) t
      where  ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(kbkcode) end) = 'Y')
      GROUP BY ROLLUP (OperNum, KbkCode)
     ) Dat
    ,(
      SELECT 0 Rn FROM Dual
      UNION ALL
      SELECT 1 Rn From Dual
     ) Mlt
WHERE Mlt.Rn         = 1
   OR Prev_Dept != OperNum

UNION

select OperNum, KbkCode, RegSum, Order_Num from (
(
select  '3. Списано на забалансовый счет 34 задолженность, в отношении которой не производится принудительное взыскание, и пени по ней' as OperNum,
        null as KbkCode, null as RegSum, 10000+1 Order_Num  from dual
--  union all  select 'Итого по разделу 3' OperNum, null KbkCode, 0.0 RegSum, 10000+2 Order_Num  from dual
)
union all
(
select '4. Списана безнадежная задолженность' as OperNum, null as KbkCode, null as RegSum, 10000+3 Order_Num from dual
--  union all select 'Итого по разделу 4' OperNum, null KbkCode, 0.0 RegSum, 10000+4 Order_Num  from dual
) )

union (
select '5.Выплата процентов за несвоевременный возврат' OperNum, null KbkCode  , null RegSum, 20000 Order_Num from dual
 union
select
  decode( grouping (KbkCode), 1, 'Итого по разделу 5', '' ) as OperNum
  ,KbkCode
  ,sum(RegSum) RegSum
  ,20001+row_number () OVER ( order by OperNum,  grouping(kbkCode), kbkCODE, grouping ( operNum ) ) Order_Num
from ( select
         5 as OperNum, dp.KbkCode as KbkCode, dp.summa as RegSum
       from
         fdc_decision_payback_lst dp join fdc_Object o1 on o1.id = dp.state_id and o1.sysName = 'DecisionPaybackSigned'
       where 1=1
        and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(kbkcode) end) = 'Y')
        and dp.currency_id = :currID
        and dp.doc_date between :dateFrom and :dateTO
        and dp.kbkcode_id in ( select kbk.id from  FDC_KBK_DICT_LST kbk  where '5' = substr( kbk.code, 14, 1 ) )
		and dp.ext_source = p_params.SoftCustomsCode
     )
group by opernum, rollup (  kbkcode) )

order by Order_Num


[dsCheckRate]
select
  fdc_nsicurrency_GetRate(:CurrId)
from
  dual

[dsFooter]
select sum(case when c.code IN ( '05.01.01', '08.01.01' ) then -1 else 1 end * t.reg_sum) RegSum
  from fdc_acc_reg_kbk t,
       fdc_kbk_dict_lst k,
       fdc_acc_light_lst c
where t.kbk_id = k.id
  and t.currency_id = :CurrId
  and (t.reg_date between :DateFrom and :DateTo)
  and t.account_id = c.id
  and t.reg_date between c.sdate and nvl(c.edate,t.reg_date)
  and c.code in (
-- Это зарезервированная строка для подстановки списка счетов
--GetAccounts--
  )
  and case when c.code in ( '05.01.01' ) and t.is_debit = 'N' OR substr( c.code, 1, 5 ) = '12.01' AND t.is_debit = 'N' then 0 else 1 end = 1
  and ((case nvl(:ists,'N') when 'N' then 'Y' else p_nsi_kbk.iskbkts(k.code) end) = 'Y')


[FTSAccounts]
'10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01', '10.01.02', '10.01.03', '10.01.05', '11.01.04', '11.01.05', '11.01.10', '08.01.01'

[RTUAccounts]
'10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01', '10.01.02', '10.01.03', '10.01.05', '11.01.04', '11.01.05', '11.01.10', '08.01.01'

[CustomAccounts]
'10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01', '10.01.02', '10.01.03', '10.01.05', '11.01.04', '11.01.05', '11.01.10', '08.01.01'
