select n3, n4, n5, n6, n7, n8, n6+n8-n7 n10
from (
select
'Расчеты по полученным авансам' n3,
null n4,
null n5,
(
select sum(summa) from
(
select nvl(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0) summa
  from fdc_account_entry t
 ,(select a.*
          from fdc_account a             
          where a.payment_type = '  ' 
        connect by a.parent_id = prior id
         start with a.hier_name = '100'
                and a.parent_id is null) a
where t.item_date < trunc(:FROM_DATE)  and t.credit_id = a.id  
union all
select -nvl(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0) summa
  from fdc_account_entry t
 ,(select a.*
          from fdc_account a             
          where a.payment_type = '  ' 
        connect by a.parent_id = prior id
         start with a.hier_name = '100'
                and a.parent_id is null) a
where t.item_date < trunc(:FROM_DATE)  and t.debet_id = a.id  
)
) n6,
(
select NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0)
  from fdc_account_entry t
 ,(select a.*
          from fdc_account a             
          where a.payment_type = '  ' 
        connect by a.parent_id = prior id
         start with a.hier_name = '100'
                and a.parent_id is null) a
where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(:TO_DATE +1) and t.debet_id = a.id  
) n7,
(
select NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0)
  from fdc_account_entry t
 ,(select a.*
          from fdc_account a             
          where a.payment_type = '  ' 
        connect by a.parent_id = prior id
         start with a.hier_name = '100'
                and a.parent_id is null) a
where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(:TO_DATE +1)  and t.credit_id = a.id  
) n8
from dual
)
union all
select '    Зачет полученного аванса' n3, nvl(kbk.code,a.payment_type) n4, null n5, null n6, NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0) n7, null n8, null n10
  from fdc_account_entry t
  ,fdc_kbk_dict_lst kbk
 ,(select a.*
          from fdc_account a             
          where a.hier_name = '152'
--        connect by a.parent_id = prior id
--         start with a.hier_name = '152'
--                and a.parent_id is null
                ) a
where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(:TO_DATE +1) and t.debet_id = a.id and kbk.code2(+) = a.payment_type
group by nvl(kbk.code,a.payment_type)
union all
select '    Возврат полученного аванса' n3, null n4, null n5, null n6, NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0) n7, null n8, null n10
  from fdc_account_entry t
 ,(select a.*
          from fdc_account a             
          where a.hier_name = '102'
                ) a
where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(:TO_DATE +1) and t.credit_id = a.id  
group by null

union all
select 'Начисление таможенного дохода' n3, nvl(kbk.code,a.payment_type) n4, null n5, null n6,null n7, NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_id),1)),0) n8, null n10
  from fdc_account_entry t
  ,fdc_kbk_dict_lst kbk
 ,(select a.*
          from fdc_account a             
          where a.hier_name = '152'                                         
--        connect by a.parent_id = prior id
--         start with a.hier_name = '152'
--                and a.parent_id is null
    ) a
where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(:TO_DATE +1) and t.credit_id = a.id and kbk.code2(+) = a.payment_type
group by nvl(kbk.code,a.payment_type)