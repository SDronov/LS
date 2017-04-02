[dsDetail]
SELECT s.name, s.inn, s.KPP, nvl(sum(q.summa), 0) AS summa
FROM(
select case :summarn when 'N' then ab.subject_id else decode(ab.is_current, 1, p_params.CustomsId, ab.subject_id) end AS subject_id,
  nvl( case nvl(:ists,'N') when 'Y' then ab.balance_sum_rur_ts else ab.balance_sum_rur end , 0) summa
from fdc_acc_balance_subject ab
where (ab.account_id in (
                         select a.id
                       from fdc_acc_light_lst a
                     WHERE ((:account_code != 'Ô06.00.00') or (:account_code = 'Ô06.00.00' and a.code = 'Ô06.10.00'))
                       and ((:account_code != 'Ð06.00.00') or (:account_code = 'Ð06.00.00' and a.code = 'Ð06.10.00'))
                     START WITH a.id IN(:account_id, :add_account_id)
                     CONNECT BY PRIOR a.id = a.parent_id )
      )
  and (ab.balance_date <= :pDate)
  and (ab.is_current = 1 or :summarn = 'Y')
  union all
  select case :summarn when 'N' then ar.subject_id else decode(ar.is_current, 1, p_params.CustomsId, ar.subject_id) end AS subject_id,
   nvl(case nvl(:ists,'N') when 'Y' then ar.reg_sum_rur_ts else ar.reg_sum_rur END, 0) summa
  from fdc_acc_reg_subject ar
  where (ar.reg_date between last_day( add_months(:pDate, -1)) + 1 and :pDate - 1)
    and (ar.account_id in (
                           select a.id
                           from fdc_acc_light_lst a
                           WHERE((:account_code != 'Ô06.00.00') or (:account_code = 'Ô06.00.00' and a.code = 'Ô06.10.00'))
                            and ((:account_code != 'Ð06.00.00') or (:account_code = 'Ð06.00.00' and a.code = 'Ð06.10.00')) 
                           START WITH a.id IN(:account_id, :add_account_id)
                           CONNECT BY PRIOR a.id = a.parent_id 
                          )
        )
    and (ar.is_current = 1 or :summarn = 'Y')
    ) q, fdc_subject_lst s
WHERE s.ID(+) = q.subject_id    
GROUP BY s.name, s.inn, s.KPP
having nvl(sum(q.summa), 0) <> 0
