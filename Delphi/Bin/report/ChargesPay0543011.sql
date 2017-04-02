[dsHeader]
select
   :CurrName CurrName
  ,:begin_date DateFrom
  ,:end_date dateto
  ,'c ' || to_char(:begin_date,'dd.mm.yyyy') || ' по ' || to_char(:end_date,'dd.mm.yyyy') as period
  ,(select code from fdc_nsi_currency_lst where id = :CurrId) curr_code
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'BossName') bossname
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'CustomsName') customname
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'CustomINN') custominn
  ,(case when (p_params.customlevel in (p_consts.customlevel_rtu, p_consts.customlevel_knp_rtu)) then 'СФТД'
         when (p_params.customlevel in (p_consts.customlevel_t)) then 'ОТП'
         when (p_params.customlevel in (p_consts.customlevel_fts)) then 'ГУФТДиТР'
         else null end) Department
from dual

[dsBody]
with acc as (select id, (case when code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01') then 1 else 2 end) OperNum, code from fdc_acc_light_lst a 
             where ( 
                    (p_params.customlevel in (p_consts.customlevel_fts, p_consts.customlevel_knp_fts) and a.code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01'))
                    or
                    (p_params.customlevel in (p_consts.customlevel_rtu, p_consts.customlevel_knp_rtu) and a.code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01'))
                    or
                    (p_params.customlevel in (p_consts.customlevel_t) and a.code in ('10.01.01', '10.01.04', '11.01.01', '11.01.02', '05.01.01')
                   )
               and :begin_date between a.sdate and NVL( a.edate, :DateFrom )))

SELECT decode (Mlt.Rn, 0, decode(Dat.OperNum, 1, '1. Начислено', 2, '2. Зачтено', null), decode(Dept_Header, 'Итого', null, Dept_Header)) OperNum
     , decode (Mlt.Rn, 0, NULL, Dat.KbkCode) KbkCode
     , to_Number(decode (Mlt.Rn, 0, NULL, decode(Dept_Header, 'Итого', null, decode(Dat.OperNum, 1, Dat.Sal, - Dat.Sal )))) RegSum
FROM (SELECT CASE
                 WHEN grouping (OperNum) = 1 THEN
                   'Итого'
                 WHEN grouping (KbkCode) = 1 THEN
                   'Итого по разделу ' || OperNum
                 ELSE
                   null
               END Dept_Header
             , OperNum
             , KbkCode
             , sum (reg_sum) Sal
             , lag (OperNum, 1, -999) OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Prev_Dept
             , row_number () OVER (ORDER BY OperNum, grouping (KbkCode), KbkCode, grouping (OperNum)) Order_Num
      FROM (select c.OperNum,
                   k.code KBKCode,
                   (case when c.OperNum = 2 then -1 else 1 end) *(case when c.code IN ( '05.01.01') then -1 else 1 end) * t.reg_sum as reg_sum
            from fdc_acc_reg_kbk t,
                 fdc_kbk_dict_lst k,
                 acc c
            where t.kbk_id = k.id
              and t.account_id = c.id
              and t.currency_id = :CurrId
              and (t.reg_date between :begin_date and :end_date)
              and case when c.code = '05.01.01' and t.is_debit = 'N' then 0 else 1 end = 1
			union all
			select 2 OperNum, k.code KBKCode, n.summa as reg_sum
			from fdc_payment_deduction n, 
				 fdc_dict k  
			where n.kbkcode_id = k.id
			  and (n.payment_date between :DateFrom and :DateTo) 
			  and exists (select 1 from fdc_deduction_budget b where b.id = n.id)
			union all
			 select 2 OperNum, k.code KBKCode, n.summa as reg_sum
			from fdc_payment_deduction n,
				 fdc_dict k,
				 fdc_object_relation r,
				 FDC_REESTR_SPECIFY_KINDPAY s
			where n.kbkcode_id = k.id
			  and r.object_id = s.id
			  and r.rel_object_id = n.id
			  and n.payment_date <= to_date('31/12/16', 'dd/mm/yy')
			  and s.date_send >= to_date('01/01/17', 'dd/mm/yy')
			  and (to_date('01/01/17', 'dd/mm/yy') between :DateFrom and :DateTo) 
			  and exists (select 1 from fdc_deduction_budget b where b.id = n.id)           
		   ) t
      GROUP BY ROLLUP (OperNum, KbkCode)
     ) Dat
    ,(
      SELECT 0 Rn FROM Dual
      UNION ALL
      SELECT 1 Rn From Dual
     ) Mlt
WHERE Mlt.Rn         = 1
   OR Dat.Prev_Dept != Dat.OperNum 
ORDER BY Dat.Order_Num, Mlt.Rn



