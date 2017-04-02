[dsHeader]
select 
  name
  ,name ||', ÈÍÍ '||inn as NameInn  
from 
  fdc_subject_lst 
where 
  id = :Subj_Id

[dsReport]
select
  s.inn
  ,to_char(null) as doc_no_date
  ,to_date(null) as coming_date
  ,c.code
  ,sum(ae.summa) as summa
from
  fdc_subject_lst s
  ,fdc_nsi_currency_lst c
  ,fdc_account_entry_lst ae
  ,fdc_account_lst a
where
  s.id = :Subj_Id
  and a.SUBJECT_ID = s.ID
  and a.id = ae.credit_id
  and (a.hier_name = '100' or a.hier_name = '100Ï')
  and a.CURRENCY_ID = c.id
  and a.payment_type = '  '
  and ae.item_date >= trunc(:date_from)
  and ae.item_date < trunc(1+:date_to)
group by
  s.INN
  ,c.code


[dsReportTotal]
select
  c.code
  ,sum(ae.summa) as summa
from
  fdc_nsi_currency_lst c
  ,fdc_account_entry_lst ae
  ,fdc_account_lst a
where
  a.subject_id = :Subj_Id
  and a.id = ae.credit_id
  and (a.hier_name = '100' or a.hier_name = '100Ï')
  and a.CURRENCY_ID = c.id
  and a.payment_type = '  '
  and ae.item_date >= trunc(:date_from)
  and ae.item_date < trunc(1+:date_to)
group by
  c.code
