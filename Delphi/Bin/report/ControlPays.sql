[dsHeader]
 select 
     c.FULL_NAME||'. ' as CustomsName
    ,c.customs_code_8 as CustomsCode
    ,to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO, 'DD.MM.YYYY' ) date_to
	,:INN as inn
	,:KPP as kpp
 from fdc_customs_lst c 
 where c.id = p_params.UserCustomsId

[dsLong]
select row_number() over(order by q.inn, q.kpp, q.reg_date) as nNUM,
      q.DocumentNumber as numDecl,
      q.Inn as InnDecl,  q.KPP as KPPDecl, q.FullName as DeclName, 
      q.PayType as sPayType,
      q.SumCharge as nSUM1 , 
      q.SumDeduction as nSUM2,
      q.SumDelta as nSUM3
  from (
       select a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no DocumentNumber
           ,s.inn as Inn
           ,s.kpp as KPP 
           ,os.name as FullName
           ,a.reg_date
           ,b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_custom_decl f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a        
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,fdc_document m
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id) h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u
           group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and a.id = m.id
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType or 0 = :ReportType
            )     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
        and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
     having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0   
     union all
    select a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no DocumentNumber
           ,s.inn as INN 
           ,s.kpp as KPP 
           ,os.name as FullName
           ,a.reg_date
           ,b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_tpo f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a
           ,fdc_document m         
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id)  h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u          
             group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and m.id = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType
          or  0 = :ReportType)     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
    and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
      having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0   
) q  
  order by q.inn, q.kpp, q.reg_date
  
[dsTotals1]
  select case when rownum = 1 then 'Итого по видам платежа' else '' end as sROW,
         v.sPaytype,v.nSUM1,v.nSUM2,v.nSUM3 
  from (
  select
         q.paytype as sPaytype, 
         sum(q.sumcharge) as nSUM1, 
         sum(sumdeduction) as nSUM2, 
         sum(sumdelta) as nSUM3
    from (
    select  b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_custom_decl f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a        
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,fdc_document m
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id) h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u
           group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and a.id = m.id
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType or 0 = :ReportType
            )     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
        and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
     having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0   
     union all
    select b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_tpo f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a
           ,fdc_document m         
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id)  h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u          
              where u.activation_date  between :DATE_FROM and :DATE_TO and 0 = :ReportType or 1 = :ReportType
           group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and m.id = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType
          or  0 = :ReportType)     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
    and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
      having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0
      ) q  
  group by q.paytype
   ) v

[dsTotals2]
  select sum(q.sumcharge) as nSUM1, 
         sum(sumdeduction) as nSUM2, 
         sum(sumdelta) as nSUM3
    from (
    select  b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_custom_decl f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a        
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,fdc_document m
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id) h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u
           group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and a.id = m.id
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType or 0 = :ReportType
            )     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
        and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
     having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0   
     union all
    select b.code as PayType 
           ,nvl(sum(h.summa),0) as SumCharge
           ,nvl(sum(d.summa),0) as SumDeduction
           ,nvl(sum(h.summa),0) - nvl(sum(d.summa),0) as SumDelta
       from fdc_tpo f
           ,(select distinct v.*
             from (
              select aa.* from fdc_doc_charge aa where 1 = :ReportType
              union 
              select ab.* 
                from fdc_doc_charge ab, fdc_decl_charge c1, fdc_document_lst c1d
               where 0 = :ReportType
               and c1.decl_id = ab.id
               and c1.id = c1d.id
               and c1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO
              union 
              select ac.* 
                from fdc_doc_charge ac, fdc_payment_deduction d1, fdc_document_lst d1d
               where 0 = :ReportType
               and d1.decl_id = ac.id
               and d1.id = d1d.id
               and d1d.ACTIVATION_DATE between :DATE_FROM and :DATE_TO               
             ) 
             v) a
           ,fdc_document m         
           ,fdc_subject s
           ,fdc_object os
           ,fdc_dict b
           ,(select g.decl_id, g.pay_type_id, sum(g.summa) summa
               from fdc_decl_charge_lst g          
           group by g.decl_id, g.pay_type_id) h
           ,(select u.decl_id, u.pay_type_id, sum(u.summa) summa
               from fdc_payment_deduction_lst u          
           group by u.decl_id, u.pay_type_id) d
      where f.id = a.id
        and a.id = h.decl_id(+)
        and s.id = os.id
        and a.subject_id = s.id
        and d.decl_id(+) = a.id
        and m.id = a.id
        and h.pay_type_id = d.pay_type_id
        and d.pay_type_id = b.id(+)
        and (a.reg_date between :DATE_FROM and :DATE_TO and 1 = :ReportType
          or  0 = :ReportType)     
        and (s.inn = :INN or :INN is null)
        and (s.kpp = :KPP or :KPP is null)
    and substr(a.customs_code,1,5)||'000' = p_params.UserCustomCode
      group by a.id, a.customs_code||'/'||to_char(a.reg_date, 'ddmmyy')||'/'||a.decl_no,
               s.inn, s.kpp, os.name, a.reg_date, b.code 
      having nvl(sum(h.summa),0) - nvl(sum(d.summa),0) <> 0
      ) q
