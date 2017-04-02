[dsHeader]
 select 
     to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO, 'DD.MM.YYYY' ) date_to
	,:INN as inn
	,:KPP as kpp
 from dual
 
[dsLong]
select row_number() over(order by q.inn, q.kpp) as nNUM, 
       q.TPONumber as NumDecl,
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
       v.tpo_number TPONumber
      ,v.inn INN
      ,v.kpp KPP
      ,v.name Name
      ,v.vidnac PayCodeDWH
      ,v.num_doc PayDocNumberDWH
      ,v.date_doc PayDocDateDWH
      ,v.summa PayDocSumDWH
      ,sum(v.sum_tpo) SummaDWH
      ,v.vidnac PayCodeLS
      ,v.num_doc PayDocNumberLS
      ,v.date_doc PayDocDateLS
      ,v.summa PayDocSumLS 
      ,nvl(sum(f_asbc_deduct_sum(v.tpo_number,v.vidnac,v.summa,v.tpo_number,v.dat_tpo)),0) SummaLS
from v_asbc_b4_details_pltgs v
where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
      )
  and substr(v.code,1,5)||'000' = p_params.UserCustomCode
  and (v.inn = :INN or :INN is null)
  and (v.kpp = :KPP or :KPP is null)
  and (v.vidnac = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and v.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and v.inn not in (select inn from fdc_nsi_declarant_els) 
      )  
      group by
       v.tpo_number 
      ,v.inn 
      ,v.kpp 
      ,v.name 
      ,v.vidnac 
      ,v.num_doc 
      ,v.date_doc 
      ,v.summa 
having sum(v.sum_tpo) != nvl(sum(f_asbc_deduct_sum(v.tpo_number,v.vidnac,v.summa,v.tpo_number,v.dat_tpo)),0)
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
    ,fdc_payment_deduction pd
    ,fdc_document dd
    ,fdc_dict i
    ,fdc_tpo p
    ,fdc_payment_order r        
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = p.id
  and s.id = os.id
  and c.id = pd.decl_id
  and pd.pay_type_id = i.id
  and r.id = pd.payment_id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_details_pltgs b where (b.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = b.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )
                                                                      and substr(b.code,1,5)||'000' = p_params.UserCustomCode
                                                                      and b.vidnac = i.code
                                                                      and r.summa = b.summa
                                                                      and r.doc_no2 = b.num_doc
                                                                      and r.doc_date2 = b.date_doc              
                                                                      and b.tpo_number = o.name
                 ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      ) 
      group by 
       o.name 
      ,s.inn 
      ,s.kpp 
      ,os.name 
      ,i.code 
      ,r.doc_no2
      ,r.doc_date2
      ,r.summa        
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
    ,fdc_payment_deduction pd
    ,fdc_document dd
    ,fdc_dict i
    ,fdc_tr p
    ,fdc_payment_order r        
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = p.id
  and s.id = os.id
  and c.id = pd.decl_id
  and pd.pay_type_id = i.id
  and r.id = pd.payment_id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_details_pltgs b where (b.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = b.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )
                                                                      and substr(b.code,1,5)||'000' = p_params.UserCustomCode
                                                                      and b.vidnac = i.code
                                                                      and r.summa = b.summa
                                                                      and r.doc_no2 = b.num_doc
                                                                      and r.doc_date2 = b.date_doc              
                                                                      and b.tpo_number = o.name
                 ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      ) 
      group by 
       o.name 
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
       v.tpo_number TPONumber
      ,v.inn INN
      ,v.kpp KPP
      ,v.name Name
      ,v.vidnac PayCodeDWH
      ,v.num_doc PayDocNumberDWH
      ,v.date_doc PayDocDateDWH
      ,v.summa PayDocSumDWH
      ,sum(v.sum_tpo) SummaDWH
      ,v.vidnac PayCodeLS
      ,v.num_doc PayDocNumberLS
      ,v.date_doc PayDocDateLS
      ,v.summa PayDocSumLS 
      ,nvl(sum(f_asbc_deduct_sum(v.tpo_number,v.vidnac,v.summa,v.tpo_number,v.dat_tpo)),0) SummaLS
from v_asbc_b4_details_pltgs v
where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
      )
  and substr(v.code,1,5)||'000' = p_params.UserCustomCode
  and (v.inn = :INN or :INN is null)
  and (v.kpp = :KPP or :KPP is null)
  and (v.vidnac = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and v.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and v.inn not in (select inn from fdc_nsi_declarant_els) 
      )  
      group by
       v.tpo_number 
      ,v.inn 
      ,v.kpp 
      ,v.name 
      ,v.vidnac 
      ,v.num_doc 
      ,v.date_doc 
      ,v.summa 
having sum(v.sum_tpo) != nvl(sum(f_asbc_deduct_sum(v.tpo_number,v.vidnac,v.summa,v.tpo_number,v.dat_tpo)),0)
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
    ,fdc_payment_deduction pd
    ,fdc_document dd
    ,fdc_dict i
    ,fdc_tpo p
    ,fdc_payment_order r        
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = p.id
  and s.id = os.id
  and c.id = pd.decl_id
  and pd.pay_type_id = i.id
  and r.id = pd.payment_id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_details_pltgs b where (b.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = b.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )
                                                                      and substr(b.code,1,5)||'000' = p_params.UserCustomCode
                                                                      and b.vidnac = i.code
                                                                      and r.summa = b.summa
                                                                      and r.doc_no2 = b.num_doc
                                                                      and r.doc_date2 = b.date_doc              
                                                                      and b.tpo_number = o.name
                 ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      ) 
      group by 
       o.name 
      ,s.inn 
      ,s.kpp 
      ,os.name 
      ,i.code 
      ,r.doc_no2
      ,r.doc_date2
      ,r.summa
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
    ,fdc_payment_deduction pd
    ,fdc_document dd
    ,fdc_dict i
    ,fdc_tr p
    ,fdc_payment_order r        
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)      
       )
  and c.subject_id = s.id 
  and c.id = o.id
  and c.id = p.id
  and s.id = os.id
  and c.id = pd.decl_id
  and pd.pay_type_id = i.id
  and r.id = pd.payment_id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_details_pltgs b where (b.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                           or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = b.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                          )
                                                                      and substr(b.code,1,5)||'000' = p_params.UserCustomCode
                                                                      and b.vidnac = i.code
                                                                      and r.summa = b.summa
                                                                      and r.doc_no2 = b.num_doc
                                                                      and r.doc_date2 = b.date_doc              
                                                                      and b.tpo_number = o.name
                 ) 
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      ) 
      group by 
       o.name 
      ,s.inn 
      ,s.kpp 
      ,os.name 
      ,i.code 
      ,r.doc_no2
      ,r.doc_date2
      ,r.summa                
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 order by q.inn, q.kpp