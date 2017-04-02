[dsHeader]
-- dsHeader
SELECT i.name
      ,i.INN
      ,decode(:InnReport, 0, i.KPP, null) as KPP
      ,i.Address
      ,i.OKPO
      ,trunc( SYSDATE - 1 ) AS date_report
  FROM (SELECT t.name
              ,t.INN
              ,decode(:InnReport, 0, t.KPP, null) as KPP
              ,t.Address
              ,t.OKPO
              ,trunc( SYSDATE - 1 ) AS date_report
          FROM fdc_subject_lst t
         WHERE t.id = :Subj_id
        UNION
        SELECT t.name
              ,t.INN
              ,decode(:InnReport, 0, t.KPP, null) as KPP
              ,t.Address
              ,t.OKPO
              ,trunc( SYSDATE - 1 ) AS date_report
          FROM fdc_broker_lst t
         WHERE t.id = :Subj_id ) i


[dsSysValues]
SELECT
-- dsfdcSysValues
  Name, SysName, StringValue
FROM
  fdc_value_lst_sys 
WHERE
  SysName = 'CustomsName' or SysName = 'BossName'


[dsLong]
with ss as (select :Subj_id as id from dual
where 0 = :InnReport
 UNION ALL
select s1.id from 
        fdc_subject_lst s1       
          where s1.id in (
select b1.subject_id from 
         fdc_broker_lst b1
        where b1.id= :Subj_id
         AND  0 = :InnReport )        
 UNION ALL
select s1.id from 
        fdc_subject_lst s1
        ,fdc_subject_lst s2
          where 1 = :InnReport
           and s1.inn = s2.inn
           and s2.id = :Subj_id
 UNION ALL
select s1.id from 
        fdc_subject_lst s1       
          where s1.id in (
select b1.subject_id from 
         fdc_broker_lst b1
          ,fdc_broker_lst b2
             where 1 = :InnReport
             and b1.inn = b2.inn
             and b2.id = :Subj_id
             ) ),
po AS (
 SELECT p.id
        ,p.doc_number AS po_doc_no
        ,p.doc_date   AS po_doc_date
        ,CASE
           WHEN p.income_date BETWEEN :Date_From AND :Date_To THEN p.summa
           ELSE                                                     0
         END
         + p_po_reuse.GetIncomeSumma( p.id, :Date_From, :Date_To )
                      AS po_summa
        ,p_payment_order.getreusesumma( p.id, :Date_From, :Date_To )
                      AS po_reuse
    FROM fdc_po_credit_lst p
   WHERE p.payer_id IN ( SELECT ss.id FROM ss )
      AND (   p.income_date BETWEEN :Date_From AND :Date_To
           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd WHERE pd.payment_id = p.id AND pd.is_active = 'Y' AND pd.activation_date BETWEEN :Date_From AND :Date_To )
           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_doc_reuse_customs_lst r WHERE pd.payment_id = p.id AND pd.decl_id = r.id AND r.is_active = 'Y' AND r.activation_date BETWEEN :Date_From AND :Date_To )
           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_po_payback_lst pb WHERE pd.payment_id = p.id AND pd.decl_id = pb.dec_pay_id AND pb.exec_date BETWEEN :Date_From AND :Date_To
               AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = 'State.PayBack.Confirm' ) )
           OR EXISTS ( SELECT 0 FROM fdc_payment_deduction_lst pd, fdc_tr_lst tr WHERE pd.payment_id = p.id AND pd.decl_id = tr.id AND tr.activation_date BETWEEN :Date_From AND :Date_To )
           OR EXISTS ( SELECT 0
                        FROM fdc_annulment_lst a
                            ,fdc_tr_lst tr
                            ,fdc_payment_deduction_lst pd
                        WHERE pd.payment_id = p.id                 
                              AND tr.id = a.document_id
                              AND pd.decl_id = tr.id
                              AND trunc ( pd.payment_date ) = a.doc_date
                              AND pd.summa < 0
                              AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = 'PaymentDeduction.Correct' )
                              AND a.doc_date between NVL ( :Date_From, a.doc_date ) and NVL ( :Date_To, a.doc_date ) 
                          )
          OR EXISTS ( SELECT 0
                       FROM fdc_annulment_lst a
                           ,fdc_tpo_lst tpo
                           ,fdc_payment_deduction_lst pd
                      WHERE pd.payment_id = p.id                         
                            AND tpo.id = a.document_id 
                            AND pd.decl_id = tpo.id 
                            AND trunc ( pd.payment_date ) = a.doc_date
                            AND pd.summa < 0
                            AND pd.object_type_id = ( SELECT ot.id FROM fdc_object_type_lst ot WHERE ot.sysname = 'PaymentDeduction.Correct' )
                            AND a.doc_date between NVL ( :Date_From, a.doc_date ) and NVL ( :Date_To , a.doc_date ) 
                        )           
          )
),
pd AS (
SELECT  ipd.id
         ,ipd.payment_id
         ,ipd.decl_id
         ,ipd.pay_type_id
         ,ipd.summa
         ,ipd.TypeSysName
         ,CASE
         WHEN d.TypeSysName = 'TPO'                     THEN 'ТПО '
         WHEN d.TypeSysName = 'TR'                      THEN 'ТР '
         WHEN d.TypeSysName = 'SubjectFeeFine'          THEN 'Штраф '
         WHEN d.TypeSysName = 'SubjectFeeDebt'          THEN 'Долг '
         WHEN d.TypeSysName IN ('DecPaybackAdvance','DecPaybackDeposit','DecPaybackLevy','DecPaybackPay','DecPaybackPeriodic','DecPaybackTimeOut','DecPayback356' ) THEN ( SELECT 'Возврат по заявлению ' || dpi.app_number || ' от ' || to_date( dpi.app_date, 'dd.mm.yyyy' ) || ' ' FROM fdc_decision_payback_lst dpi WHERE dpi.id = d.id )
         WHEN d.TypeSysName IN ('CustomDecl','CustomDeclFull','CustomDeclTempAdm','CustomDeclTime' ) THEN 'ДТ ' 
         ELSE NULL
         END 
           ||d.name||( SELECT '(трeбование ' || m.doc_number || ' от ' || TO_CHAR( m.doc_date, 'dd.mm.yyyy' ) ||')'
                         FROM fdc_debts_measures_lst m
                        WHERE m.ID = ( SELECT MIN( m1.id )
                                         FROM fdc_debts_measures_lst m1
                                             ,fdc_ded_paydept_lst dpd
                                        WHERE dpd.id = ipd.id
                                              AND m.owner_object_id = dpd.notice_id 
                                              AND m.measures_type IN ('B20','B27') ) )
           AS decl_name
          FROM fdc_payment_deduction_lst ipd
              ,fdc_object_lst d
          WHERE ipd.payment_id IN ( SELECT po.id FROM po )
            AND ipd.is_active IN ('N','Y')
            AND ipd.summa > 0
            AND (   ipd.activation_date BETWEEN :Date_From AND :Date_To
                 OR EXISTS ( SELECT 0 FROM fdc_doc_reuse_customs_lst r WHERE ipd.decl_id = r.id AND r.is_active = 'Y' AND r.activation_date BETWEEN :Date_From AND :Date_To )
                 OR EXISTS ( SELECT 0 FROM fdc_po_payback_lst pb WHERE ipd.decl_id = pb.dec_pay_id AND pb.exec_date BETWEEN :Date_From AND :Date_To
                    AND pb.state_id = ( SELECT st.id FROM fdc_state_lst st WHERE st.sysname = 'State.PayBack.Confirm' ) )
                 OR EXISTS ( SELECT 0 FROM fdc_tr_lst tr WHERE ipd.decl_id = tr.id AND tr.activation_date BETWEEN :Date_From AND :Date_To )
                )
            AND d.id(+) = ipd.decl_id    
)
SELECT /*+FIRST_ROWS(50)*/pp
      ,CASE group_pp
         WHEN 1 THEN po_doc_no
         ELSE        to_char( NULL )
       END AS doc_no
      ,CASE group_pp
         WHEN 1 THEN po_doc_date
         ELSE        to_date( NULL )
       END AS doc_date
      ,CASE group_pp
         WHEN 1 THEN po_summa
         ELSE        to_number( NULL )
       END AS po_summa
      ,CASE group_pp
         WHEN 1 THEN po_reuse
         ELSE        to_number( NULL )
       END AS po_reuse
      ,NAME
      ,payment_type
      ,summa
  FROM (
SELECT row_number() over ( ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name ) AS pp
      ,row_number() over ( PARTITION BY po.id,po.po_doc_no, po.po_doc_date ORDER BY ( pd.decl_name ) ) AS group_pp
      ,po.id
      ,po.po_doc_no
      ,po.po_doc_date
      ,po.po_summa
      ,po.po_reuse
      ,pd.decl_name AS NAME
      ,pt.code AS payment_type
      ,SUM( pd.summa ) AS summa
  FROM po
      ,pd
      ,fdc_dict                  pt
  WHERE po.id        = pd.payment_id(+)
    AND pt.id(+)     = pd.pay_type_id
  GROUP BY po.id
          ,po.po_doc_no
          ,po.po_doc_date
          ,po.po_summa
          ,po.po_reuse
          ,pd.decl_name
          ,pt.code
  ORDER BY po.id,po.po_doc_date, po.po_doc_no, pd.decl_name
 )

