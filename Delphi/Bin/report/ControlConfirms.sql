[dsHeader]
 select 
    to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
   ,to_char( :DATE_TO,   'DD.MM.YYYY' ) date_to
   	,:INN as inn
	,:KPP as kpp
   ,c.customs_code_8 as CustomsCode
 from fdc_customs_lst c 
 where c.id = p_params.UserCustomsId
 
[dsLong]
select row_number() over(order by q.inn, q.kpp, q.paydocdate) as nNUM,
       q.DocumentNumber as numDecl,
	   q.INN as InnDecl,
	   q.KPP as KPPDecl,
	   q.FullName as DeclName,
	   q.PayDocNumber as DocumentNumber,
	   q.PayDocDate as DocumentDate,
	   q.PayDocSumma as DocumentSum,
	   q.KBKFrom,
	   q.KBKTo,
	   q.SumDeduction as CustPaysSum,
	   q.DateDeduction AS DateRestoreCustPays
 from (
     select a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no as DocumentNumber
           ,s.inn as INN 
           ,s.kpp as KPP 
           ,os.name as FullName
           ,d.doc_number as PayDocNumber
           ,d.doc_date as PayDocDate
           ,o.summa as PayDocSumma
           ,bfrom.code as KBKFrom
           ,bto.code as KBKTo 
           ,u.summa as SumDeduction
           ,u.payment_date as DateDeduction
       from fdc_custom_decl f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict bfrom
           ,fdc_dict bto
           ,fdc_payment_deduction u
           ,fdc_payment_order o
           ,fdc_document d
      where f.id = a.id
        and a.id = u.decl_id
        and a.subject_id = s.id
        and s.id = os.id
        and u.payment_id = d.id
        and u.payment_id = o.id 
        and u.kbkcode_id = bto.id(+)
        and u.kbkcode1_id = bfrom.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment)
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
     union all    
     select a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no DocumentNumber
           ,s.inn as INN 
           ,s.kpp as KPP 
           ,os.name as FullName
           ,d.doc_number PayDocNumber
           ,d.doc_date PayDocDate
           ,o.summa PayDocSumma
           ,bfrom.code as KBKFrom
           ,bto.code as KBKTo 
           ,u.summa as SumDeduction
           ,u.payment_date as DateDeduction
       from fdc_tpo f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict bfrom
           ,fdc_dict bto
           ,fdc_payment_deduction u 
           ,fdc_payment_order o
           ,fdc_document d
      where f.id = a.id
        and a.id = u.decl_id
        and a.subject_id = s.id
        and s.id = os.id
        and u.payment_id = d.id
        and u.payment_id = o.id 
        and u.kbkcode_id = bto.id(+)
        and u.kbkcode1_id = bfrom.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment) 
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
) q  
  order by q.inn, q.kpp, q.paydocdate

[dsTotals1]
select sum(q.sumdeduction) as CustPaysSumDeduction,
	   sum(q.SumCorrection) as CustPaysSumCorrection
    from (
     select abs(case sign(u.summa) when 1 then u.summa else 0 end) as SumDeduction,
			abs(case sign(u.summa) when -1 then u.summa else 0 end) as SumCorrection
       from fdc_custom_decl f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_payment_deduction u
           ,fdc_payment_order o 
           ,fdc_ded_correct r
      where f.id = a.id
        and a.id = u.decl_id
        and u.payment_id = o.id
        and a.subject_id = s.id
        and u.id = r.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment)
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
     union all    
     select abs(case sign(u.summa) when 1 then u.summa else 0 end) as SumDeduction,
			abs(case sign(u.summa) when -1 then u.summa else 0 end) as SumCorrection
       from fdc_tpo f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_payment_deduction u
           ,fdc_ded_correct r
           ,fdc_payment_order o
      where f.id = a.id
        and a.id = u.decl_id
        and u.payment_id = o.id
        and a.subject_id = s.id
        and u.id = r.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment)
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
) q  

[dsTotals2]
select sum(SumCorrection) as CustPaysSum
    from (
     select abs(case sign(u.summa) when -1 then u.summa else 0 end) as SumCorrection
       from fdc_custom_decl f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_payment_deduction u
           ,fdc_ded_correct r
           ,fdc_payment_order o
      where f.id = a.id
        and a.id = u.decl_id
        and u.payment_id = o.id
        and a.subject_id = s.id
        and u.id = r.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment)
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
     union all    
     select abs(case sign(u.summa) when -1 then u.summa else 0 end) as SumCorrection
       from fdc_tpo f
           ,fdc_doc_charge a         
           ,fdc_subject s
           ,fdc_payment_deduction u
           ,fdc_ded_correct r
           ,fdc_payment_order o 
      where f.id = a.id
        and a.id = u.decl_id
        and u.payment_id = o.id
        and a.subject_id = s.id
        and u.id = r.id(+)
        and u.payment_date between :DATE_FROM and :DATE_TO      
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
		and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
        and u.id not in (select n.rel_object_id from fdc_reestr_specify_kindpay y, fdc_object_relation n where y.id = n.object_id)  
        and u.id not in (select id from fdc_ded_declrepayment)
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
) q  