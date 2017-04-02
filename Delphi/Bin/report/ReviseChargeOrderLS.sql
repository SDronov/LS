[dsHeader]
 select 
     to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO, 'DD.MM.YYYY' ) date_to
	,:INN as inn
	,:KPP as kpp
 from dual
 
[dsLong]
select row_number() over(order by q.inn, q.kpp ) as nNUM,
       q.TPONumber as numDecl,
       q.INN as InnDecl,
       q.KPP as KPPDecl,
       q.Name as DeclName,
	   (case when q.PayCodeDWH is not null then q.PayCodeDWH else q.PayCodeLS end) as sPaytype,
       q.PayCodeDWH as sPaytypeDWH,
       q.SummaDWH as nPaySumDWH,
       q.PayCodeLS as sPaytypeLS,
       q.SummaLS as nPaySumLS,
       q.SummaDWH-q.SummaLS as nPaySumDelta
from  (
select /*DRIVING_SITE(v)*/
       v.tpo_number TPONumber
      ,v.inn INN
      ,v.kpp KPP
      ,v.name Name
      ,v.codclsf PayCodeDWH
      ,sum(v.sum_rub) SummaDWH
      ,v.codclsf PayCodeLS
      ,sum(f_asbc_charge_sum(v.tpo_number,v.codclsf)) SummaLS
from v_asbc_b4_tpo_itps v
where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType)
  and substr(v.code,1,5)||'000' = p_params.UserCustomCode
  and (v.inn = :INN or :INN is null)
  and (v.kpp = :KPP or :KPP is null)
  and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.inn in (select inn from fdc_nsi_declarant_els)
      or p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.inn not in (select inn from fdc_nsi_declarant_els) 
      )
group by
       v.tpo_number
      ,v.inn 
      ,v.kpp 
      ,v.name 
      ,v.codclsf
having sum(v.sum_rub) != nvl(sum(f_asbc_charge_sum(v.tpo_number,v.codclsf)),0)
union all
select o.name TPONumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,0 SummaDWH      
      ,i.code PayCodeLS
      ,nvl(sum(h.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_decl_charge h
    ,fdc_dict i
    ,fdc_tpo p    
    ,fdc_document dd  
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = p.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select tpo_number from v_asbc_b4_tpo_itps v where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                  or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
                 )
                                                                and substr(v.code,1,5)||'000' = p_params.UserCustomCode
                                                                and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
                                                                and v.tpo_number = o.name
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
	having nvl(sum(h.summa),0) != 0
union all
select o.name TPONumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,0 SummaDWH      
      ,i.code PayCodeLS
      ,nvl(sum(h.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_decl_charge h
    ,fdc_dict i
    ,fdc_tr p    
    ,fdc_document dd  
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = p.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select tpo_number from v_asbc_b4_tpo_itps v where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                  or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
                 )
                                                                and substr(v.code,1,5)||'000' = p_params.UserCustomCode
                                                                and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
                                                                and v.tpo_number = o.name
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
  having nvl(sum(h.summa),0) != 0
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 
order by inn, kpp
  
[dsTotals1]
select sum(q.SummaDWH-q.SummaLS) as nPaySumDelta
from  (
select /*DRIVING_SITE(v)*/
       v.tpo_number TPONumber
      ,v.inn INN
      ,v.kpp KPP
      ,v.name Name
      ,v.codclsf PayCodeDWH
      ,sum(v.sum_rub) SummaDWH
      ,v.codclsf PayCodeLS
      ,sum(f_asbc_charge_sum(v.tpo_number,v.codclsf)) SummaLS
from v_asbc_b4_tpo_itps v
where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType)
  and substr(v.code,1,5)||'000' = p_params.UserCustomCode
  and (v.inn = :INN or :INN is null)
  and (v.kpp = :KPP or :KPP is null)
  and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.inn in (select inn from fdc_nsi_declarant_els)
      or p_params.ELSCustomCode = p_params.UserCustomCode 
        and v.inn not in (select inn from fdc_nsi_declarant_els) 
      )
group by
       v.tpo_number
      ,v.inn 
      ,v.kpp 
      ,v.name 
      ,v.codclsf
having sum(v.sum_rub) != nvl(sum(f_asbc_charge_sum(v.tpo_number,v.codclsf)),0)
union all
select o.name TPONumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,0 SummaDWH      
      ,i.code PayCodeLS
      ,nvl(sum(h.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_decl_charge h
    ,fdc_dict i
    ,fdc_tpo p    
    ,fdc_document dd  
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = p.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select tpo_number from v_asbc_b4_tpo_itps v where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                  or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
                 )
                                                                and substr(v.code,1,5)||'000' = p_params.UserCustomCode
                                                                and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
                                                                and v.tpo_number = o.name
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
union all
select o.name TPONumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,0 SummaDWH      
      ,i.code PayCodeLS
      ,nvl(sum(h.summa),0) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_decl_charge h
    ,fdc_dict i
    ,fdc_tr p    
    ,fdc_document dd  
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = p.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select tpo_number from v_asbc_b4_tpo_itps v where (v.dat_tpo between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                  or exists (select '1' from v_asbc_b4_tpoopers where tpo_number = v.tpo_number and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType
                 )
                                                                and substr(v.code,1,5)||'000' = p_params.UserCustomCode
                                                                and (v.codclsf = :PAYTYPECODE or :PAYTYPECODE is null)
                                                                and v.tpo_number = o.name
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
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 order by inn, kpp