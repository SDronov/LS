[dsHeader]
 select 
    to_char( :DATE_REP, 'DD.MM.YYYY' ) date_report
    ,c.FULL_NAME||'. ' as CustomsName
    ,c.customs_code_8 as CustomsCode
 from fdc_customs_lst c 
 where c.id = p_params.UserCustomsId
 
[dsLong]
select row_number() over(order by s.inn, s.kpp) as nNUM
       ,s.inn as INN 
       ,s.kpp as KPP 
       ,os.name as FullName
       ,f_asbc_getacclastoperdate(s.id, :DATE_REP) as LastOperDate
       ,nvl(i.sumrest,0) as SumRestAll
       ,nvl(i.quantpayments,0) as QuantPayments
       ,nvl(i.sumrest,0)-nvl(p.sumreserved,0) as SumRestAvail
       ,nvl(p.sumreservedexc,0) as SumReservedExc
       ,nvl(p.sumreserved3y,0) as SumReservedOver
       ,nvl(p.sumreservedhb,0) as SumReservedHandBlock
       ,nvl(d.sumreservedretadvance,0) as SumReservedForReturn
       ,nvl(p.sumrestneg,0) as SumRestNegative
       ,nvl(tr.sumresttr,0) as SumReservedTR
  from fdc_personal_account a
      ,fdc_subject s
      ,fdc_object os
      ,(select h.subject_id, sum(u.summa) sumresttr 
          from fdc_doc_charge h, fdc_tr f, fdc_payment_deduction u
         where h.id = f.id 
           and f.id = u.decl_id
           and u.payment_date <= :DATE_REP      
         group by h.subject_id  
       ) tr   
      ,(select subject_id, sum(summa) sumreservedretadvance 
          from fdc_dec_payback_advance_lst 
         where doc_date <= :DATE_REP   
         group by subject_id) d
      ,(select o.payer_id, sum(p_payment_order.GetRestMoney (o.id, :DATE_REP)) sumrest,
               count(distinct o.id) quantpayments        
           from fdc_payment_order o
          where p_payment_order.GetRestMoney (o.id, :DATE_REP) >0 
          group by o.payer_id
       ) i
      ,(select o.payer_id
               ,sum(r.summa) sumreserved
               ,sum(r.summa*case r.reason_code when 'L' then 1 else 0 end) sumreservedexc
               ,sum(r.summa*case r.reason_code when 'X' then 1 else 0 end) sumreserved3y               
               ,sum(r.summa*case r.reason_code when 'D' then 1 else 0 end) sumreservedhb               
               ,sum(case sign(r.summa) when -1 then abs(r.summa) else 0 end) sumrestneg               
           from fdc_payment_order o, fdc_reserved_payment r 
          where r.payment_id = o.id            
            and p_payment_order.GetRestMoney (o.id, :DATE_REP) >0   
            and :DATE_REP between r.bdate and nvl(r.edate, sysdate + 30000)
          group by o.payer_id
       ) p
 where a.subject_id = s.id
   and s.id = os.id
   and f_asbc_getacclastoperdate(s.id, :DATE_REP) is not null
   and a.subject_id = p.payer_id(+)
   and a.subject_id = i.payer_id(+)
   and a.subject_id = d.subject_id(+)
   and a.subject_id = tr.subject_id(+) 
   and i.sumrest > 0
   and (s.inn = :INN or :INN is null)
   and (s.kpp = :KPP or :KPP is null)
 order by s.inn, s.kpp
 
[dsTotals]
--=aTotals_SumReservedForReturn
--=aTotals_SumReservedTR
select  sum(nvl(i.sumrest,0)) as SumRestAll
       ,sum(nvl(i.quantpayments,0)) as QuantPayments
       ,sum(nvl(i.sumrest,0)-nvl(p.sumreserved,0)) as SumRestAvail
       ,sum(nvl(p.sumreservedexc,0)) as SumReservedExc
       ,sum(nvl(p.sumreserved3y,0)) as SumReservedOver
       ,sum(nvl(p.sumreservedhb,0)) as SumReservedHandBlock
       ,sum(nvl(d.sumreservedretadvance,0)) as SumReservedForReturn
       ,sum(nvl(p.sumrestneg,0)) as SumRestNegative
       ,sum(nvl(tr.sumresttr,0)) as SumReservedTR
  from fdc_personal_account a
      ,fdc_subject s
      ,(select h.subject_id, sum(u.summa) sumresttr 
          from fdc_doc_charge h, fdc_tr f, fdc_payment_deduction u
         where h.id = f.id 
           and f.id = u.decl_id
           and u.payment_date <= :DATE_REP      
         group by h.subject_id  
       ) tr   
      ,(select subject_id, sum(summa) sumreservedretadvance 
          from fdc_dec_payback_advance_lst 
         where doc_date <= :DATE_REP   
         group by subject_id) d
      ,(select o.payer_id, sum(g.reg_sum) sumrest , count(distinct o.id) quantpayments        
           from fdc_rest_date_reg g, fdc_payment_order o
          where g.payment_id = o.id
            and p_payment_order.GetRestMoney (o.id, :DATE_REP) >0   
            and g.reg_date <= :DATE_REP
          group by o.payer_id
       ) i
      ,(select o.payer_id
               ,sum(r.summa) sumreserved
               ,sum(r.summa*case r.reason_code when 'L' then 1 else 0 end) sumreservedexc
               ,sum(r.summa*case r.reason_code when 'X' then 1 else 0 end) sumreserved3y               
               ,sum(r.summa*case r.reason_code when 'D' then 1 else 0 end) sumreservedhb               
               ,sum(case sign(r.summa) when -1 then abs(r.summa) else 0 end) sumrestneg               
           from fdc_payment_order o, fdc_reserved_payment r 
           where r.payment_id = o.id            
            and p_payment_order.GetRestMoney (o.id, :DATE_REP) >0   
            and :DATE_REP between r.bdate and nvl(r.edate, sysdate + 30000)
          group by o.payer_id
       ) p
 where a.subject_id = s.id
   and f_asbc_getacclastoperdate(s.id, :DATE_REP) is not null
   and a.subject_id = p.payer_id(+)
   and a.subject_id = i.payer_id(+)
   and a.subject_id = d.subject_id(+)
   and a.subject_id = tr.subject_id(+)   
   and (s.inn = :INN or :INN is null)
   and (s.kpp = :KPP or :KPP is null)