[dsHeader]
SELECT  
  fdc_valuestring_sys_get( 'CustomsName' )||'. ' AS CustomsName
 ,fdc_valuestring_sys_get( 'CustomsCode' ) as CCODE
 ,fdc_valuestring_sys_get( 'BossName' )    AS BossName
 ,(select name from fdc_user_current_lst) as fio_isp
 ,to_char(SYSDATE,'dd.mm.yyyy') as report_date
 , case D.QUART_FLAG
     when 1 then
      Decode( to_char(D.d1,'Q')
       ,'2', 'за  II квартал ' || to_char(D.D1,'YYYY') || ' года.'
       ,'3', 'за  III квартал '|| to_char(D.D1,'YYYY') || ' года.'
       ,'4', 'за  IV квартал ' || to_char(D.D1,'YYYY') || ' года.'
       ,'за  I квартал '  || to_char(D.D1,'YYYY') || ' года.' )
     else
       ' За период с ' || to_char( D.D1, 'DD.MM.YYYY' ) || ' по ' || to_char(D.D2, 'DD.MM.YYYY' )
     end as quarter
FROM
 dual,
 (select to_date(:DATE_FROM, 'DD.MM.YYYY') d1, to_date(:DATE_TO, 'DD.MM.YYYY') d2, cast(:QUART_FLAG as INTEGER) QUART_FLAG from dual ) D


[dsData] 
select rownum, glob.*  from (
with D as 
 ( select to_date(:DATE_FROM, 'dd.mm.yyyy') as d1, to_date(:DATE_TO, 'dd.mm.yyyy') as d2  from dual )
SELECT DISTINCT i.s1_inn || '/' || i.s1_kpp || ', ' || i.s1_name as Broker, --"Представитель" -- кто платил
                
                (select 'свид. № ' || bl.license_no || ' от ' ||
                        to_char(bl.beg_date, 'DD.MM.YYYY')
                   from fdc_broker bl
                  where bl.subject_id = nvl(i.s1_parent_id, i.s1_id) -- выводить лицензию головного брокера, если платил филиал
                    and bl.id =
                        (select max(bl1.id)
                           from fdc_broker bl1
                          where bl1.subject_id = bl.subject_id
                            and i.pd_doc_date >= bl1.beg_date 
                            and (i.pd_doc_date <= bl1.end_date or bl1.end_date is null or
                                 i.pd_typesysname in('PayDebt','DeclRePayment')))-- Нет ограничения на действие лицензии брокера в периоде выборки для оплат задолженности и перезачета
                 ) as Credential, -- "Свидетельство",
                decode(i.s2_typesysname,
                       'Person',
                       nvl (i.s2_inn, ' ') || ', ' || nvl(i.pers_NAME, ' ') || ' ' || nvl(i.pers_ser_no, ' ') || ' ' ||
                       nvl(i.pers_doc_no, ' '),
                       nvl(i.s2_inn, ' ') || '/' || nvl(i.s2_kpp, ' ') || ', ' ||
                       nvl(i.s2_name, ' ')) as Declarant, -- "Декларант" -- из ДТ или ТПО      
                
                (select 'договор №' || bc.contract_no || ' от ' ||
                        to_char(bc.contract_date, 'dd.mm.yyyy') || ' до ' || -- из договора
                        to_char(bc.end_date, 'dd.mm.yyyy')
                   from fdc_broker_contract bc
                  where bc.subject_id = i.s2_id
                    and bc.broker_id =  i.s1_id
                    and bc.id =
                        (select max(bc1.id)
                           from fdc_broker_contract bc1
                          where bc1.subject_id = bc.subject_id
                            and bc1.broker_id = bc.broker_id
                            and bc.is_authorize='Y' -- договор с возможностью оплаты
                            and i.pd_doc_date >= bc1.begin_date 
                            and (i.pd_doc_date <= bc1.end_date or bc1.end_date is null or
                                 i.pd_typesysname in('PayDebt','DeclRePayment')))-- Нет ограничения на действие договора брокера в периоде выборки для оплат задолженности и перезачета
                 ) as Contract, -- "Договор",
                i.dc_name as Decl_Order_Num,   -- "Номер ДТ/ТПО" -- номер ДТ или ТПО
                i.dc_typename as Doc_Type,   --"Тип документа",
                i.pd_TypeName as Deduction_Type, --"Тип списания",
                i.po_doc_number as Doc_Number,--"Номер ПД" -- номер ПД, с которого осуществлено списание
                to_char(i.po_doc_date, 'DD.MM.YYYY') as Doc_Date, --"Дата ПД" -- дата ПД
                i.pd_kbkcode KBK, --"КБК",
                i.po_typename Pay_Method,--"Способ" -- способ платежа
       sum(i.pd_summa) OVER(PARTITION BY i.s1_inn || '/' || i.s1_kpp || ', ' || i.s1_name, i.pd_kbkcode,i.dc_name, i.po_id ) Broker_KBK_Payment ,--"Упл_предст_по_КБК" -- сумма уплаты представителем по КБК
       nvl((select sum(pd1.summa)
              from fdc_payment_deduction_lst pd1,
                   fdc_doc_charge_lst        dc1,
                   fdc_payment_order_lst     po1
              where 
                  nvl(pd1.activation_date,pd1.payment_date) between-- по дате проводки, иначе по дате уплаты 
                        (select d1 from D) and (select d2 from D)
                    and pd1.payment_id = po1.ID
                    and pd1.decl_id = dc1.id
                    and pd1.decl_id = i.dc_id
                    and dc1.subject_id = po1.payer_id
                    and po1.payer_id = i.s2_id
                    and pd1.KBKCode = i.pd_kbkcode ),0) -- сумма оплат декларантом за данный период по данному КБК
                + sum(i.pd_summa) OVER(PARTITION BY i.s1_inn || '/' || i.s1_kpp || ', ' || i.s1_name, i.pd_kbkcode,i.dc_name ) Decl_KBK_Payment, --"Упл_по_декларации_КБК" -- сумма, уплаченная всеми, по данному КБК  
                
                sum(i.pd_summa) OVER(PARTITION BY i.s1_inn || '/' || i.s1_kpp || ', ' || i.s1_name, i.dc_name ) Broker_Decl_Payment, --"Упл_предст_по_декларации" -- сумма, уплаченная представителем по всей декларации
                
                nvl((select sum(pd1.summa)
                   from fdc_payment_deduction_lst pd1,
                        fdc_doc_charge_lst        dc1,
                        fdc_payment_order_lst     po1
                  where
                  nvl(pd1.activation_date,pd1.payment_date) between-- по дате проводки, иначе по дате уплаты 
                      (select d1 from D) and (select d2 from D)                  
                  and pd1.payment_id = po1.ID
                  and pd1.decl_id = dc1.id
                  and dc1.subject_id = po1.payer_id
                  and po1.payer_id = i.s2_id
                  and pd1.decl_id =  i.dc_id),0) -- сумма оплат декларантом за данный период по данной ДТ или ТПО
                + sum(i.pd_summa) OVER(PARTITION BY i.s1_inn || '/' || i.s1_kpp || ', ' || i.s1_name, i.dc_name ) Payment_Summary --"Упл_по_декларации_всего" -- сумма, уплаченная всеми по декларации, всего     
      
 FROM( select     pd.id          as pd_id
                , pd.doc_date    as pd_doc_date
                , pd.summa       as pd_summa
                , pd.typesysname as pd_typesysname
                , pd.TypeName    as pd_TypeName
                , pd.kbkcode     as pd_kbkcode
                , dc.id          as dc_id
                , dc.name        as dc_name
                , dc.typename    as dc_typename
                , s1.id          as s1_id
                , s1.parent_id   as s1_parent_id
                , s1.inn         as s1_inn
                , s1.kpp         as s1_kpp
                , s1.name        as s1_name
                , s2.id          as s2_id
                , s2.INN         as s2_inn
                , s2.kpp         as s2_kpp
                , s2.name        as s2_name
                , s2.parent_id   as s2_parent_id
                , s2.TypeSysName as s2_typesysname
                , pers.NAME      as pers_name
                , pers.ser_no    as pers_ser_no
                , pers.doc_no    as pers_doc_no               
                , po.id          as po_id
                , po.doc_number  as po_doc_number
                , po.doc_date    as po_doc_date
                , po.typename    as po_typename              
  from fdc_payment_deduction_lst pd,
       fdc_object                o,
       fdc_payment_for           pf,
       fdc_doc_charge_lst        dc,
       fdc_payment_order_lst     po,
       fdc_subject_lst           s1,
       fdc_subject_lst           s2,
       fdc_person_lst            pers
 where 
   -- по дате проводки, иначе по дате уплаты  
   nvl(pd.activation_date,pd.payment_date) between 
      (select d1 from D) and (select d2 from D)
   and o.id = pf.id
   and o.owner_object_id = pd.id
   and dc.id = pd.decl_id
   and po.id = pd.payment_id
   and po.payer_id = s1.id
   and ( s1.TypeSysName ='Subject' OR  ( s1.TypeSysName = 'Declarant'AND EXISTS ( select 1 from fdc_broker b
                                                                                    where b.subject_id = nvl(s1.parent_id, s1.id ) ) ) ) -- брокер или перевели брокера в Декларанты
   and (exists
        (select 1
           FROM dbf_pp_plt_lst t
          where t.g071 = dc.customs_code
            and t.g072 = dc.reg_date
            and t.g073 = dc.decl_no
            and dc.typesysname like '%CustomDecl%'
            and p_cdecl_loader_ex.CheckBroker(dc.id,
                                              po.payer_id,
                                              t.n_sv,
                                              t.d_sv,
                                              t.n_cntr,
                                              t.d_cntr) = 1) OR
        (p_nsi_broker.CheckBrokerByDecl(dc.id, po.payer_id) = 1 AND
        (dc.typesysname = 'TPO' or dc.typesysname like '%CustomDecl%'))) -- плативший переводом с ПП на ДТ прошел проверки брокера
   and dc.subject_id = s2.id
   and nvl(s1.parent_id, 0) != s2.id -- плательщик не является филиалом головной организации
   and pers.id(+) = s2.id -- связь для получения данных о декларанте, если он ФЛ   
UNION 
select            pd.id          as pd_id
                , pd.doc_date    as pd_doc_date
                , pd.summa       as pd_summa
                , pd.typesysname as pd_typesysname
                , pd.TypeName    as pd_TypeName
                , pd.kbkcode     as pd_kbkcode
                , dc.id          as dc_id
                , dc.name        as dc_name
                , dc.typename    as dc_typename
                , s1.id          as s1_id
                , s1.parent_id   as s1_parent_id
                , s1.inn         as s1_inn
                , s1.kpp         as s1_kpp
                , s1.name        as s1_name
                , s2.id          as s2_id
                , s2.INN         as s2_inn
                , s2.kpp         as s2_kpp
                , s2.name        as s2_name
                , s2.parent_id   as s2_parent_id
                , s2.TypeSysName as s2_typesysname
                , pers.NAME      as pers_name
                , pers.ser_no    as pers_ser_no
                , pers.doc_no    as pers_doc_no               
                , po.id          as po_id
                , po.doc_number  as po_doc_number
                , po.doc_date    as po_doc_date
                , po.typename    as po_typename
  from fdc_payment_deduction_lst pd, 
       fdc_ded_paydept           pdd,      
       fdc_doc_charge_lst        dc,
       fdc_payment_order_lst     po,
       fdc_subject_lst           s1,
       fdc_subject_lst           s2,
       fdc_person_lst            pers
 where
   nvl(pd.activation_date,pd.payment_date) between-- по дате проводки, иначе по дате уплаты 
       (select d1 from D) and (select d2 from D)
   and not exists ( select 1 from fdc_payment_for pf, fdc_object o
                      where o.id = pf.id
                      and   o.owner_object_id = pd.id ) -- Оплата задолженности по Решению без создания перевода
   and dc.id = pd.decl_id
   and po.id = pd.payment_id
   and po.payer_id = s1.id
   and s1.TypeSysName IN ('Subject', 'Declarant') AND EXISTS ( select 1 from fdc_broker b    
                                                                 where b.subject_id = nvl(s1.parent_id, s1.id ) ) -- плательщик являлся брокером
   and pd.typesysname = 'PayDebt' 
   and pd.id = pdd.id
   and pdd.decision_id is not null 
   and dc.subject_id = s2.id
   and s1.id != s2.id
   and nvl(s1.parent_id, 0) != s2.id -- плательщик не является филиалом головной организации
   and pers.id(+) = s2.id -- связь для получения данных о декларанте, если он ФЛ   
UNION 
select            pd.id          as pd_id
                , pd.doc_date    as pd_doc_date
                , pd.summa       as pd_summa
                , pd.typesysname as pd_typesysname
                , pd.TypeName    as pd_TypeName
                , pd.kbkcode     as pd_kbkcode
                , dc.id          as dc_id
                , dc.name        as dc_name
                , dc.typename    as dc_typename
                , s1.id          as s1_id
                , s1.parent_id   as s1_parent_id
                , s1.inn         as s1_inn
                , s1.kpp         as s1_kpp
                , s1.name        as s1_name
                , s2.id          as s2_id
                , s2.INN         as s2_inn
                , s2.kpp         as s2_kpp
                , s2.name        as s2_name
                , s2.parent_id   as s2_parent_id
                , s2.TypeSysName as s2_typesysname
                , pers.NAME      as pers_name
                , pers.ser_no    as pers_ser_no
                , pers.doc_no    as pers_doc_no               
                , po.id          as po_id
                , po.doc_number  as po_doc_number
                , po.doc_date    as po_doc_date
                , po.typename    as po_typename
  from fdc_payment_deduction_lst pd,             
       fdc_doc_charge_lst        dc,
       fdc_payment_order_lst     po,
       fdc_subject_lst           s1,
       fdc_subject_lst           s2,
       fdc_person_lst            pers
 where 
/*отчет за период по дате оплаты  для перезачетов и корректирующих списаний если они не проведены, либо по дате проводки для корректирующих списаний*/         
       nvl(pd.activation_date,pd.payment_date) between
         (select d1 from D) and (select d2 from D)
   and dc.id = pd.decl_id
   and po.id = pd.payment_id
   and po.payer_id = s1.id
   and s1.TypeSysName IN ('Subject', 'Declarant') AND EXISTS ( select 1 from fdc_broker b    
                                                                 where b.subject_id = nvl(s1.parent_id, s1.id ) ) -- плательщик являлся брокером
   and pd.typesysname in ( 'DeclRePayment', 'PaymentDeduction.Correct' )
   and ( ( exists
        (select 1
           FROM dbf_pp_plt_lst t
          where t.g071 = dc.customs_code
            and t.g072 = dc.reg_date
            and t.g073 = dc.decl_no
            and dc.typesysname like '%CustomDecl%'
            and p_cdecl_loader_ex.CheckBroker(dc.id,
                                              po.payer_id,
                                              t.n_sv,
                                              t.d_sv,
                                              t.n_cntr,
                                              t.d_cntr) = 1)
         and pd.summa > 0
         and pd.typesysname = 'DeclRePayment'
         and  exists ( select 1 from fdc_payment_for pf, fdc_object o -- Создание перезачета на ПД с переводом
                              where o.id = pf.id
                              and   o.owner_object_id = pd.id )  ) OR -- плативший переводом с ПП на ДТ прошел проверки брокера при перезачете с + на полную ДТ
         ( pd.summa < 0          -- при перезачете с - на ВД данной проверки нет
           and pd.typesysname = 'DeclRePayment'
           and not exists ( select 1 from fdc_payment_for pf, fdc_object o
                              where o.id = pf.id
                              and   o.owner_object_id = pd.id ) ) OR -- Создание перезачета на ВД без перевода
          ( pd.summa < 0          -- корректировка в - по ДТ с переводом (есть перевод ), отмена оплат ДТ, ТПО, аннул ТПО ( нет перевода )
            and pd.typesysname = 'PaymentDeduction.Correct'
              )     
        ) 
   and dc.subject_id = s2.id
   and s1.id != s2.id
   and nvl(s1.parent_id, 0) != s2.id -- плательщик не является филиалом головной организации
   and pers.id(+) = s2.id -- связь для получения данных о декларанте, если он ФЛ   
   ) i
   
order by 
  BROKER, DECLARANT, DECL_ORDER_NUM, DECL_KBK_PAYMENT, PAYMENT_SUMMARY
     
) glob

