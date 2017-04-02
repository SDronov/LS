[dsHeader]
select
  'Дата c ' || to_char(:begin_date,'dd.mm.yyyy') || ' по ' || to_char(:end_date,'dd.mm.yyyy') as period
from dual

[dsBody]
SELECT 
       case lag(doc_number||doc_date||typename, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename then ''
        else doc_number end doc_number,
       case lag(doc_number||doc_date||typename, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename then ''
        else to_char(doc_date,'dd.mm.yyyy') end doc_date,
       case lag(doc_number||doc_date||typename, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename then ''
        else typename end typename,
       case lag(doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r then ''
        else doc_number_r end doc_number_r,
       case lag(doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r then ''
        else to_char(doc_date_r,'dd.mm.yyyy') end doc_date_r,
       case lag(doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r, 1) over (order by doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r)
        when doc_number||doc_date||typename||doc_number_r||doc_date_r||typename_r then ''
        else typename_r end typename_r,
       customs_out_code,
       kbk_code_s,
       kbk_code_t,
       summa,
       is_ts
FROM (
SELECT 
       r_rtu.doc_date doc_date,
       r_rtu.doc_number,
       r_rtu.typename,
       r.doc_date doc_date_r,
       r.doc_number doc_number_r,
       r.typename typename_r,
       dptl.customs_out_code,
       b.kbk_code_s,
       b.kbk_code_t,
       sum(b.summa) summa,
       case when r_rtu.is_ts = 'N' then 'Нет' else 'Да' end is_ts
FROM fdc_reestr_specify_kindpay_lst r_rtu,
     fdc_rel_reestr_reestr_lst      rr,
     fdc_reestr_specify_kindpay_lst r,
     fdc_rel_reestr_skindpay_lst    rs,
     fdc_bud_specify_kindpay_lst    b
    ,fdc_rel_pack_docs_lst          rpdl
    ,fdc_doc_pack_transfer_lst      dptl
WHERE r_rtu.id = rr.object_id
  AND rr.rel_object_id = r.id 
  AND r.id = rs.object_id
  AND rs.rel_object_id = b.id
  AND (r_rtu.doc_date between :begin_date and :end_date)
  and r.id = rpdl.rel_object_id
  and rpdl.object_id = dptl.id
GROUP BY 
         r_rtu.doc_date,
         r_rtu.doc_number,
         r_rtu.typename,
         r.doc_date,
         r.doc_number,
         r.typename,
         dptl.customs_out_code,
         b.kbk_code_s,
         b.kbk_code_t,
         r_rtu.is_ts
ORDER BY r_rtu.doc_date,r_rtu.doc_number,r.doc_date,r.doc_number)
