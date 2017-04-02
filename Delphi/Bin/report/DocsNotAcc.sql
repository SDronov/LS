[dsLong]
select row_number() over(order by d.doc_number,d.doc_date) as nNUM,
     t.name as DocumentType
      ,d.id as DocumentID
      ,case t.sysname when 'PaymentDeduction.Correct' then 
        (select j.name from fdc_payment_deduction e, fdc_object j where o.ext_id = e.id and e.decl_id = j.id)
       else o.name end as DocumentNumber
      ,d.doc_date as DocumentDate
      ,s.inn as INN
      ,s.kpp as KPP
      ,os.name as FullName
from fdc_document d
     ,fdc_object o
     ,fdc_personal_account a
     ,fdc_subject s
	 ,fdc_object os
     ,fdc_object_type t
where d.id = o.id
  and d.personal_account_id = a.id 
  and a.subject_id = s.id
  and s.id = os.id
  and d.is_active = 'N'
  and d.doc_date between add_months(sysdate, -36) and sysdate
  and o.object_type_id = t.id
  and t.sysname in (select sysname from asbc_doctypes_notactive) 
  and (t.sysname != 'PaymentDeduction.Correct' or
  (select i.code from fdc_payment_deduction e, fdc_dict i where o.ext_id = e.id and e.pay_type_id = i.id) = '2010')
order by d.doc_number,d.doc_date