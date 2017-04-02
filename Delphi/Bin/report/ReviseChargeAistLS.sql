[dsHeader]
 select 
    to_char( :DATE_FROM, 'DD.MM.YYYY' ) date_from
    ,to_char( :DATE_TO, 'DD.MM.YYYY' ) date_to
	,:INN as inn
	,:KPP as kpp
 from dual
 
[dsLong]
select row_number() over(order by q.inn, q.kpp ) as nNUM,
       q.DeclNumber as numDecl,
       q.INN as InnDecl,
       q.KPP as KPPDecl,
       q.Name as DeclName,
       (case when q.PayCodeDWH is not null then q.PayCodeDWH else q.PayCodeLS end) as sPaytype,
	   q.PayCodeDWH as sPaytypeDWH,
       q.SummaDWH as nPaySumDWH,
       q.PayCodeLS as sPaytypeLS,
       q.SummaLS as nPaySumLS,
       q.SummaDWH-q.SummaLS as nPaySumDelta
from (
select /*DRIVING_SITE(v)*/
       v.nd DeclNumber
      ,v.g141 INN
      ,v.g147 KPP
      ,v.g142 Name
      ,v.g471 PayCodeDWH
      ,sum(v.g474rub) SummaDWH
      ,v.g471 PayCodeLS
      ,sum(f_asbc_charge_sum(v.nd,v.g471)) SummaLS
from v_asbc_b4_g47 v
where (v.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_declopers where nd = v.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType)
 -- and substr(v.g071,1,5)||'000' = p_params.UserCustomCode 
  and (v.g141 = :INN or :INN is null)
  and (v.g147 = :KPP or :KPP is null)
  and (v.g471 = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and v.g141 in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and v.g141 not in (select inn from fdc_nsi_declarant_els) 
      )  
 group by  v.nd
          ,v.g141 
          ,v.g147 
          ,v.g142 
          ,v.g471
 having sum(v.g474rub) != sum(f_asbc_charge_sum(v.nd,v.g471))
union all
select o.name DeclNumber
      ,s.inn INN
      ,s.kpp KPP
      ,os.name Name
      ,null PayCodeDWH
      ,0 SummaDWH
      ,i.code PayCodeLS
      ,sum(h.summa) SummaLS
from fdc_doc_charge c
    ,fdc_subject s
    ,fdc_object o
    ,fdc_object os
    ,fdc_decl_charge h
    ,fdc_dict i
    ,fdc_custom_decl l    
    ,fdc_document dd   
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = l.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_g47 b where (b.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                         or exists (select '1' from v_asbc_b4_declopers where nd = b.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                        )                   
  --                                                  and substr(b.g071,1,5)||'000' = p_params.UserCustomCode 
                                                    and b.g471 = i.code 
                                                    and b.nd = o.name
                    ) 
    and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      )
 group by  o.name
          ,s.inn 
          ,s.kpp 
          ,os.name 
          ,i.code
	having sum(h.summa) != 0	  
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 
order by q.inn, q.kpp 
  
[dsTotals1]
select sum(q.SummaDWH-q.SummaLS) as nPaySumDelta
from (
select /*DRIVING_SITE(v)*/
       v.nd DeclNumber
      ,v.g141 INN
      ,v.g147 KPP
      ,v.g142 Name
      ,v.g471 PayCodeDWH
      ,sum(v.g474rub) SummaDWH
      ,v.g471 PayCodeLS
      ,sum(f_asbc_charge_sum(v.nd,v.g471)) SummaLS
from v_asbc_b4_g47 v
where (v.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
       or exists (select '1' from v_asbc_b4_declopers where nd = v.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType)
 -- and substr(v.g071,1,5)||'000' = p_params.UserCustomCode 
  and (v.g141 = :INN or :INN is null)
  and (v.g147 = :KPP or :KPP is null)
  and (v.g471 = :PAYTYPECODE or :PAYTYPECODE is null)
  and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and v.g141 in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and v.g141 not in (select inn from fdc_nsi_declarant_els) 
      )  
 group by  v.nd
          ,v.g141 
          ,v.g147 
          ,v.g142 
          ,v.g471
 having sum(v.g474rub) != sum(f_asbc_charge_sum(v.nd,v.g471))
union all
select o.name DeclNumber
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
    ,fdc_custom_decl l    
    ,fdc_document dd   
where (dd.doc_date between :DATE_FROM and :DATE_TO
       or
       exists (select '1' from fdc_correction_doc f, fdc_document u where f.doc_id = dd.id and f.id = u.id and u.doc_date between :DATE_FROM and :DATE_TO and 1 = :ReportType)
      )
  and c.subject_id = s.id 
  and c.id = o.id
  and s.id = os.id
  and c.id = h.decl_id
  and h.decl_id = l.id
  and h.pay_type_id = i.id
  and c.id = dd.id
  and (s.inn = :INN or :INN is null)
  and (s.kpp = :KPP or :KPP is null)
  and (i.code = :PAYTYPECODE or :PAYTYPECODE is null)
  and not exists (select '1' from v_asbc_b4_g47 b where (b.g072 between :DATE_FROM and :DATE_TO and 0 = :ReportType 
                                                         or exists (select '1' from v_asbc_b4_declopers where nd = b.nd and operdate between :DATE_FROM and :DATE_TO) and 1 = :ReportType  
                                                        )                   
     --                                               and substr(b.g071,1,5)||'000' = p_params.UserCustomCode 
                                                    and b.g471 = i.code 
                                                    and b.nd = o.name
                    ) 
    and (p_params.ELSCustomCode = p_params.UserCustomCode 
          and s.inn in (select inn from fdc_nsi_declarant_els)
       or p_params.ELSCustomCode != p_params.UserCustomCode 
          and s.inn not in (select inn from fdc_nsi_declarant_els) 
      )
 group by  o.name
          ,s.inn 
          ,s.kpp 
          ,os.name 
          ,i.code
		  having nvl(sum(h.summa),0) !=0
) q where f_check_dates_range(:DATE_FROM,:DATE_TO)=1 
order by q.inn, q.kpp 