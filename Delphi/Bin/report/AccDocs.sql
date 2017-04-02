[dsHeader]
 select 
     to_char( :DATE_REP, 'DD.MM.YYYY' ) DATE_REPORT
    ,c.FULL_NAME||'. ' as CustomsName
    ,c.customs_code_8 as CustCode
	,:INN as inn
	,:kpp as kpp
 from fdc_subject s, fdc_customs_lst c 
 where s.INN = :INN 
  and nvl(s.KPP,'#') = nvl(:KPP,'#')
  and c.id = p_params.UserCustomsId
  union 
  select 
     to_char( :DATE_REP, 'DD.MM.YYYY' ) DATE_REPORT
    ,c.FULL_NAME||'. ' as CustomsName
    ,c.customs_code_8 as CustCode
    ,:INN as inn
    ,:kpp as kpp
  from fdc_customs_lst c 
  where :INN is null AND :KPP is null
  and c.id = p_params.UserCustomsId  
 
[dsLong]
select row_number() over(order by d.doc_date) as nNUM
	   ,s.inn as INN 
       ,s.kpp as KPP
	   ,os.name as FullName
	   ,d.doc_number as DocumentNumber
       ,d.doc_date as DocumentDate
       ,o.doc_summa as DocumentSumma
       ,f_asbc_getpolastoperdate(o.id, 1, :DATE_REP) as LastOperDateSubj
       ,f_asbc_getpolastoperdate(o.id, 2, :DATE_REP) as LastOperDateCust
       ,p_payment_order.GetRestMoney (o.id, :DATE_REP) as SumRestAll
       ,p_payment_order.GetRestMoney (o.id, :DATE_REP) - nvl(p.sumreserved, 0) as SumRestAvail	   
       ,nvl(p.sumreservedexc, 0) as SumReservedExc
       ,nvl(p.sumreserved3y, 0) as SumReservedOver
       ,nvl(p.sumreservedhb, 0) as SumReservedHandBlock
       ,nvl(q.sumreservedretadvance,0) as SumReservedForReturn
       ,nvl(tr.sumresttr,0) as SumReservedTR
  from  fdc_subject s
       ,fdc_object os
       ,fdc_payment_order o       
       ,fdc_document d       
      ,(select u.payment_id, sum(u.summa) sumresttr 
          from fdc_doc_charge h, fdc_tr f, fdc_payment_deduction u
         where h.id = f.id 
           and f.id = u.decl_id
           and u.payment_date <= :DATE_REP      
         group by u.payment_id  
       ) tr 
      ,(select e.payment_id, sum(summa) sumreservedretadvance 
          from fdc_payback_reserve_lst e, fdc_dec_payback_advance v
         where :DATE_REP between e.bdate and nvl(e.edate, sysdate + 30000)
           and e.decision_id = v.id
         group by e.payment_id) q
       ,(select m.id 
              ,sum(r.summa) sumreserved
               ,sum(r.summa*case r.reason_code when 'L' then 1 else 0 end) sumreservedexc
               ,sum(r.summa*case r.reason_code when 'X' then 1 else 0 end) sumreserved3y               
               ,sum(r.summa*case r.reason_code when 'D' then 1 else 0 end) sumreservedhb               
           from fdc_payment_order m, fdc_reserved_payment r 
          where r.payment_id(+) = m.id            
            and :DATE_REP between r.bdate and nvl(r.edate, sysdate + 30000)
          group by m.id
       ) p
 where s.id = o.payer_id
   and o.id = d.id
   and s.id = os.id
   and o.id = p.id(+)
   and o.id = q.payment_id(+) 
   and o.id = tr.payment_id(+)
   and not(p_payment_order.GetRestMoney (o.id, :DATE_REP) = 0 and
       p_payment_order.GetRestMoney (o.id, :DATE_REP) - nvl(p.sumreserved, 0) = 0 and 
       nvl(p.sumreservedexc, 0) = 0 and nvl(p.sumreserved3y, 0) = 0 and
       nvl(p.sumreservedhb, 0) = 0 and nvl(q.sumreservedretadvance, 0) = 0 and 
       nvl(tr.sumresttr, 0) = 0)
    and (s.inn = :INN or :INN is null)
    and (s.kpp = :KPP or :KPP is null)
	and f_asbc_check_INN_KPP(:INN,:KPP)=1
  and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
  and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
--	and o.destcustomscode = p_params.UserCustomCode
 order by d.doc_date
 
[dsTotals]
select  sum(p_payment_order.GetRestMoney (o.id, :DATE_REP)) as SumRestAll
       ,sum(p_payment_order.GetRestMoney (o.id, :DATE_REP) - nvl(p.sumreserved, 0)) as SumRestAvail
       ,sum(nvl(p.sumreservedexc, 0)) as SumReservedExc
       ,sum(nvl(p.sumreserved3y, 0)) as SumReservedOver
       ,sum(nvl(p.sumreservedhb, 0)) as SumReservedHandBlock
       ,sum(nvl(q.sumreservedretadvance,0)) as SumReservedForReturn
       ,sum(nvl(tr.sumresttr,0)) as SumReservedTR
  from  fdc_subject s
       ,fdc_payment_order o       
       ,fdc_document d       
      ,(select u.payment_id, sum(u.summa) sumresttr 
          from fdc_doc_charge h, fdc_tr f, fdc_payment_deduction u
         where h.id = f.id 
           and f.id = u.decl_id
           and u.payment_date <= :DATE_REP      
         group by u.payment_id  
       ) tr 
      ,(select e.payment_id, sum(summa) sumreservedretadvance 
          from fdc_payback_reserve_lst e, fdc_dec_payback_advance v
         where :DATE_REP between e.bdate and nvl(e.edate, sysdate + 30000)
           and e.decision_id = v.id
         group by e.payment_id) q
       ,(select m.id 
              ,sum(r.summa) sumreserved
               ,sum(r.summa*case r.reason_code when 'L' then 1 else 0 end) sumreservedexc
               ,sum(r.summa*case r.reason_code when 'X' then 1 else 0 end) sumreserved3y               
               ,sum(r.summa*case r.reason_code when 'D' then 1 else 0 end) sumreservedhb               
           from fdc_payment_order m, fdc_reserved_payment r 
          where r.payment_id(+) = m.id            
            and :DATE_REP between r.bdate and nvl(r.edate, sysdate + 30000)
          group by m.id
       ) p
 where s.id = o.payer_id
   and o.id = d.id
   and o.id = p.id(+)
   and o.id = q.payment_id(+) 
   and o.id = tr.payment_id(+)
   and not(p_payment_order.GetRestMoney (o.id, :DATE_REP) = 0 and
       p_payment_order.GetRestMoney (o.id, :DATE_REP) - nvl(p.sumreserved, 0) = 0 and 
       nvl(p.sumreservedexc, 0) = 0 and nvl(p.sumreserved3y, 0) = 0 and
       nvl(p.sumreservedhb, 0) = 0 and nvl(q.sumreservedretadvance, 0) = 0 and 
       nvl(tr.sumresttr, 0) = 0)
    and (s.inn = :INN or :INN is null)
    and (s.kpp = :KPP or :KPP is null)
    and not exists (select '1' from fdc_payment_order_bigpayer where id = o.id)
    and not exists (select '1' from fdc_payment_order_cnfrm where id = o.id)
	--and o.destcustomscode = p_params.UserCustomCode