[dsTotal]
select
  sum(summa) as summa
  ,curr_code
from
  fdc_payment_order_lst
where
  (Payer_Id = :Subj_Id or :Subj_Id is null)
  and ( (coming_date >= trunc(:DateFrom) and coming_date < trunc(:DateTo)+1) or :DateFrom is null and :DateTo is null)
  and (currency_Id = :Curr_Id or :Curr_Id is null)
  and (pay_type_id = :PayTypeId or :PayTypeId is null)
group by
  curr_code

[dsReport]
select
  trunc(coming_date) coming_date
  ,doc_no
  ,doc_date
  ,exec_date
  ,summa
  ,curr_Code
  ,payer_name
  ,payer_inn
  ,payer_kpp
  ,descript
  ,pay_type_code
from
  fdc_payment_order_lst
where
  (Payer_Id = :Subj_Id or :Subj_Id is null)
  and ( (coming_date >= trunc(:DateFrom) and coming_date < trunc(:DateTo)+1) or :DateFrom is null and :DateTo is null)
  and (currency_Id = :Curr_Id or :Curr_Id is null)
  and (pay_type_id = :PayTypeId or :PayTypeId is null)
order by trunc(coming_date) desc, exec_date desc, doc_no asc

[dsCurrency]
select code from fdc_nsi_currency_lst where id = :Curr_Id

[dsInnKpp]
select Inn||'\'||Kpp as InnKpp from fdc_Subject_Lst where Id = :Subj_Id
