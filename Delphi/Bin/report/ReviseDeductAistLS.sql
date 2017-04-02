[dsHeader]
 select 
     to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO, 'DD.MM.YYYY' ) date_to
	,:INN as inn
	,:KPP as kpp
 from dual
 
[dsLong]
select row_number() over(order by q.inn, q.kpp) as nNUM, 
       q.DeclNumber as NumDecl,
	     q.inn as INNDecl,
       q.kpp as KPPDecl,
       q.name as DeclName,
	   (case when q.PayCodeDWH is not null then q.PayCodeDWH else q.PayCodeLS end)  as sPayCode,
       (case when q.PayDocNumberDWH is not null then q.PayDocNumberDWH else q.PayDocNumberLS end) as DocumentNumber,
       (case when q.PayDocDateDWH is not null then q.PayDocDateDWH else q.PayDocDateLS end) as DocumentDate,
       (case when q.PayDocSumDWH != 0 then q.PayDocSumDWH else q.PayDocSumLS end) as DocumentSum,
       q.PayCodeDWH as sPayCodeDWH,
       q.PayDocNumberDWH as DocumentNumberDWH,
       q.PayDocDateDWH as DocumentDateDWH,
       q.PayDocSumDWH as DocumentSumDWH,
       q.SummaDWH as SummaDWH,
       q.PayCodeLS as sPayCodeLS,
       q.PayDocNumberLS as DocumentNumberLS,
       q.PayDocDateLS as DocumentDateLS,
       q.PayDocSumLS as DocumentSumLS,
       q.SummaLS as SummaLS,
       q.SummaDWH - q.SummaLS as nPaySumDelta
from (
select /*DRIVING_SITE(v)*/
       v.nd DeclNumber
      ,v.g141 INN
      ,v.g147 KPP
      ,v.g142 Name
      ,v.gb1 PayCodeDWH
      ,v.numpdok PayDocNumberDWH
      ,v.datpdok PayDocDateDWH
      ,v.sum_all PayDocSumDWH
      ,sum(v.sumpdok) SummaDWH 
      ,v.gb1 PayCodeLS
      ,v.numpdok PayDocNumberLS
      ,v.datpdok PayDocDateLS
      ,v.sum_all PayDocSumLS
      ,nvl(sum(f_asbc_deduct_sum(v.nd,v.gb1,v.sum_all,v.numpdok,v.datpdok)),0) SummaLS
from v_asbc_b4_sumpp v
where (v.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_declopers where nd = v.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
      )
  --and substr(v.g071,1,5)||'000' = p_params.UserCustomCode
  and (v.g141 = :INN or :INN is null)
  and (v.g147 = :KPP or :KPP is null)
  and (v.gb1 = :PAYTYPECODE or :PAYTYPECODE is null)
   and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.g141 in (select inn from fdc_nsi_declarant_els)
      or p_params.ELSCustomCode != p_params.UserCustomCode 
        and v.g141 not in (select inn from fdc_nsi_declarant_els) 
      )
      group by v.nd 
              ,v.g141 
              ,v.g147 
              ,v.g142 
              ,v.gb1 
              ,v.numpdok 
              ,v.datpdok 
              ,v.sum_all 
 having sum(v.sumpdok) != nvl(sum(f_asbc_deduct_sum(v.nd,v.gb1,v.sum_all,v.numpdok,v.datpdok)),0)
union all
select o.name DeclNumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,null PayDocNumberDWH
      ,null PayDocDateDWH
      ,0 PayDocSumDWH
      ,0 SummaDWH 
      ,i.code PayCodeLS
      ,r.doc_no2 PayDocNumberLS
      ,r.doc_date2 PayDocDateLS
      ,r.summa PayDocSumLS
      ,nvl(sum(pd.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_dict i
    ,fdc_payment_deduction pd
    ,fdc_custom_decl l
    ,fdc_payment_order r
    ,fdc_document dd
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = l.id
  and s.id = os.id
  and pd.pay_type_id = i.id
  and pd.decl_id = c.id
  and pd.payment_id = r.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_sumpp b where (b.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_declopers where nd = b.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )                   
                                            --        and substr(b.g071,1,5)||'000' = p_params.UserCustomCode 
                                                    and b.gb1 = i.code
                                                    and r.summa = b.sum_all
                                                    and r.doc_no2 = b.numpdok
                                                    and r.doc_date2 = b.datpdok              
                                                    and b.nd = o.name
                    ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
        and s.inn not in (select inn from fdc_nsi_declarant_els) 
      )
      group by o.name 
              ,s.inn 
              ,s.kpp 
              ,os.name 
              ,i.code 
              ,r.doc_no2
              ,r.doc_date2
              ,r.summa        
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 order by q.inn, q.kpp
  
[dsTotals1]
select sum(q.SummaDWH) as SummaDWH,
       sum(q.SummaLS) as SummaLS,
       sum(q.SummaDWH - q.SummaLS) as nPaySumDelta
from (
select /*DRIVING_SITE(v)*/
       v.nd DeclNumber
      ,v.g141 INN
      ,v.g147 KPP
      ,v.g142 Name
      ,v.gb1 PayCodeDWH
      ,v.numpdok PayDocNumberDWH
      ,v.datpdok PayDocDateDWH
      ,v.sum_all PayDocSumDWH
      ,sum(v.sumpdok) SummaDWH 
      ,v.gb1 PayCodeLS
      ,v.numpdok PayDocNumberLS
      ,v.datpdok PayDocDateLS
      ,v.sum_all PayDocSumLS
      ,nvl(sum(f_asbc_deduct_sum(v.nd,v.gb1,v.sum_all,v.numpdok,v.datpdok)),0) SummaLS
from v_asbc_b4_sumpp v
where (v.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_declopers where nd = v.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
      )
 -- and substr(v.g071,1,5)||'000' = p_params.UserCustomCode
  and (v.g141 = :INN or :INN is null)
  and (v.g147 = :KPP or :KPP is null)
  and (v.gb1 = :PAYTYPECODE or :PAYTYPECODE is null)
   and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.g141 in (select inn from fdc_nsi_declarant_els)
      or p_params.ELSCustomCode != p_params.UserCustomCode 
        and v.g141 not in (select inn from fdc_nsi_declarant_els) 
      )
      group by v.nd 
              ,v.g141 
              ,v.g147 
              ,v.g142 
              ,v.gb1 
              ,v.numpdok 
              ,v.datpdok 
              ,v.sum_all 
 having sum(v.sumpdok) != nvl(sum(f_asbc_deduct_sum(v.nd,v.gb1,v.sum_all,v.numpdok,v.datpdok)),0)
union all
select o.name DeclNumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,null PayDocNumberDWH
      ,null PayDocDateDWH
      ,0 PayDocSumDWH
      ,0 SummaDWH 
      ,i.code PayCodeLS
      ,r.doc_no2 PayDocNumberLS
      ,r.doc_date2 PayDocDateLS
      ,r.summa PayDocSumLS
      ,nvl(sum(pd.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_dict i
    ,fdc_payment_deduction pd
    ,fdc_custom_decl l
    ,fdc_payment_order r
    ,fdc_document dd
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = l.id
  and s.id = os.id
  and pd.pay_type_id = i.id
  and pd.decl_id = c.id
  and pd.payment_id = r.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_sumpp b where (b.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_declopers where nd = b.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )                   
                                              --      and substr(b.g071,1,5)||'000' = p_params.UserCustomCode 
                                                    and b.gb1 = i.code
                                                    and r.summa = b.sum_all
                                                    and r.doc_no2 = b.numpdok
                                                    and r.doc_date2 = b.datpdok              
                                                    and b.nd = o.name
                    ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
        and s.inn not in (select inn from fdc_nsi_declarant_els) 
      )
      group by o.name 
              ,s.inn 
              ,s.kpp 
              ,os.name 
              ,i.code 
              ,r.doc_no2
              ,r.doc_date2
              ,r.summa        
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 order by q.inn, q.kpp