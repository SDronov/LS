[dsHeader]
select 
      (select stringvalue from fdc_value_lst_sys where sysname = 'CustomsName') customname
     ,(select stringvalue from fdc_value_lst_sys where sysname = 'PayBossName') nach_otp
     ,(select name from fdc_user_current_lst) fio_isp
     ,(select name from fdc_customs_lst where id = p_params.ParentCustomsId) parentcustomname
     ,(select doc_number from fdc_document_lst where id = :reestr_id) reestr_number
     ,(select to_char(doc_date,'dd.mm.yyyy')||' г.' from fdc_document_lst where id = :reestr_id) reestr_date
     ,(
       select 
             sum(nvl(rc.amount,0))
       from fdc_rel_pack_docs_lst rel_rr
           ,fdc_doc_reuse_customs_lst rc
       where rel_rr.object_id = :reestr_id
         and rel_rr.rel_object_id = rc.id
      ) itogo_summa
from dual

[dsBody]
select 
       row_number() over(order by po.doc_number) nn
      ,rc.doc_number || ' от ' || to_char(rc.doc_date,'dd.mm.yyyy') reuse_name
      ,rc.customs_code_new customs_code_new
      ,c_old.name customs_name_old
      ,c_new.name customs_name_new
      ,abs(drl.summa) summa
      ,po.doc_number pp_number
      ,k_dict.code kbk
from fdc_rel_pack_docs_lst rel_rr
    ,fdc_doc_reuse_customs_lst rc
    ,fdc_customs_lst c_old
    ,fdc_customs_lst c_new
    ,fdc_deduction_reuse_lst drl
    ,fdc_payment_order_lst po
    ,fdc_dict k_dict
where rel_rr.object_id = :reestr_id
  and rel_rr.rel_object_id = rc.id
  and rc.customs_code_old = c_old.customs_code_8(+)
  and rc.customs_new_id = c_new.id(+)
  and rc.id = drl.decl_id
  and drl.payment_id = po.id
  and (decode(p_params.CustomLevel, 2, 1, drl.summa) > 0 OR rc.customs_code_new = p_params.CustomCode)
  and po.kbkcode_id = k_dict.id(+)

