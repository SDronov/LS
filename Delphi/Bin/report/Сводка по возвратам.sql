[dsHeader]
select
      case when :ptypereport = 0 then
      'Период формирования по Дате заявки на возврат c '||to_char(:pDateBegin,'dd.mm.yyyy')||' по '||to_char(:pDateEnd,'dd.mm.yyyy') 
      else
      'Период формирования: по Дате загрузки заявки на возврат в базу данных с '||to_char(:pDateBegin,'dd.mm.yyyy')||' по '||to_char(:pDateEnd,'dd.mm.yyyy')
      end as period,
      'Признак подтверждения: '||
      case when :ptypepayback = 2 then 
           'Не подтвержденные'
      else case when :ptypepayback = 3 then
                'Подтвержденные'
           else
                'Все'
           end
      end
      as typepayback
from dual

[dsReport]
select p.KBKCode,
       p.ext_source,
       p.doc_number,
       to_char(p.doc_date,'dd.mm.yyyy') as doc_date,
       p.summa,
       to_char(c.doc_date,'dd.mm.yyyy') as date_confirm,
       to_char(e.Moment,'dd.mm.yyyy')   as date_add
from fdc_event_lst e,
     fdc_payment_order_payback_lst p
left outer join fdc_doc_confirm_lst c on c.confirmed_doc_id = p.id
where e.Object_ID = p.ID
  and e.typesysname = 'EventAdd'
--_for_replace_0*/   and trunc(p.doc_date) between :pDateBegin and :pDateEnd
--_for_replace_1*/   and trunc(e.Moment)   between :pdatebegin and :pdateend
--_for_replace_2*/   and c.id is null
--_for_replace_3*/   and c.id is not null
order by p.ext_source,e.Moment
