[dsDetail]
select p_nsi_kbk.GetCodeById(q.kbk_id) AS KBK, nvl(sum(q.summa), 0) AS summa
FROM 
(SELECT ab.kbk_id, nvl(case nvl(:ists,'N') when 'Y' then ab.balance_sum_rur_ts else ab.balance_sum_rur end, 0) summa
          from fdc_acc_balance_kbk ab
          where (ab.account_id in (select a.id
                               from fdc_acc_light_lst a
                               where ((:account_code != 'Ô06.00.00') or (:account_code = 'Ô06.00.00' and a.code = 'Ô06.10.00'))
                                  and ((:account_code != 'Ð06.00.00') or (:account_code = 'Ð06.00.00' and a.code = 'Ð06.10.00'))
                               START WITH a.id = :account_id
                               CONNECT BY PRIOR a.id = a.parent_id )
                )
            and (ab.balance_date <= :pDate)
            and (ab.is_current = 1 or :summarn = 'Y')
          union all
          select ar.kbk_id, nvl(case nvl(:ists,'N') when 'Y' then ar.reg_sum_rur_ts else ar.reg_sum_rur END, 0) summa
          from fdc_acc_reg_kbk ar
          where (ar.reg_date between last_day( add_months(:pDate, -1)) + 1 and :pDate - 1)
            and (ar.account_id in ( select a.id
                               from fdc_acc_light_lst a
                               where ((:account_code != 'Ô06.00.00') or (:account_code = 'Ô06.00.00' and code = 'Ô06.10.00'))
                                 and ((:account_code != 'Ð06.00.00') or (:account_code = 'Ð06.00.00' and code = 'Ð06.10.00'))
                               START WITH a.id = :account_id
                               CONNECT BY PRIOR a.id = a.parent_id )
                )
            and (ar.is_current = 1 or :summarn = 'Y')
) q
GROUP BY p_nsi_kbk.GetCodeById(q.kbk_id)
having nvl(sum(q.summa), 0) <> 0
