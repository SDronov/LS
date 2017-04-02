[dsHeader]
select 
   (select name from fdc_subject_lst where id = :subj_id) subj_name
  ,(select inn from fdc_subject_lst where id = :subj_id) subj_inn
  ,to_char(:date_to,'dd') rep_day
  ,to_char(:date_to,'month','NLS_DATE_LANGUAGE=RUSSIAN') rep_month
  ,to_char(:date_to,'yyyy') rep_year
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'CustomsName') customname
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'CustomINN') custominn
  ,' с ' || to_char(:date_from,'dd.mm.yyyy') || ' по ' || to_char(:date_to,'dd.mm.yyyy') period
  ,(select name from fdc_nsi_currency_lst where id = :curr_id) curr_name
  ,(select stringvalue from fdc_value_lst_sys where sysname = 'BossName') bossname
from dual 

[dsCurrency]
select code, name
from fdc_nsi_currency_lst
where Id = :Curr_Id

[dsReport]
SELECT (CASE when (res.sort_num IS NOT NULL) THEN res.sort_num ELSE null_line.sort_num END) AS sort_num
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.num      ELSE null_line.num      END) AS num
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.kbk      ELSE null_line.kbk      END) AS kbk
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.summa    ELSE null_line.summa    END) AS summa
  FROM fdc_rep_act_compare_empty null_line
  LEFT OUTER JOIN (
    SELECT (CASE grouping_id(q.kbk) WHEN 1 THEN 0 ELSE 0.1 END)                          AS sort_num
          ,to_char(NULL)                                                                 AS num
          ,(CASE grouping_id(q.kbk) WHEN 1 THEN 'Входящее сальдо, всего' ELSE q.kbk END) AS kbk
          ,nvl(sum( q.summa ), 0)                                                        AS summa
      FROM ( SELECT po.kbk
                   ,nvl( fdc_payment_order_getrestsumma( po.id , :date_from - 1 ) , 0 ) AS summa
               FROM fdc_po_credit_lst po
               WHERE income_date < :date_from
                 AND payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND currency_id = :curr_id
                 AND typesysname <> 'PaymentOrderConfirm'
             UNION ALL
             SELECT r.kbkcode AS kbk
                   ,- r.summa
               FROM fdc_reserved_payment_lst r
                   ,fdc_po_credit_lst        po
               WHERE r.payment_id = po.id
                 AND r.bdate < :date_from
                 AND (   r.edate IS NULL
                      OR r.edate > :date_from)
                 AND po.payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND po.currency_id = :curr_id
                 AND po.typesysname <> 'PaymentOrderConfirm'
                 AND ( EXISTS ( SELECT 0
                                FROM fdc_decision_payment_lst dp
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = dp.id
                                  AND dp.state_id != fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' ) ) OR
					  EXISTS ( SELECT 0
                                FROM fdc_advice_lst adv
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = adv.id
                                  AND adv.state_id !=  fdc_object_get_bysysname( 'State', 'Advice.Decision' ) )
					  )	
           ) q
      GROUP BY ROLLUP(q.kbk)
    UNION ALL
    SELECT (CASE grouping_id(kbk) WHEN 1 THEN 1                                               ELSE 1.1           END) AS sort_num
          ,(CASE grouping_id(kbk) WHEN 1 THEN '1.'                                            ELSE to_char(NULL) END) AS num
          ,(CASE grouping_id(kbk) WHEN 1 THEN 'Поступило авансовых платежей за период, всего' ELSE kbk           END) AS kbk
          ,SUM(nvl(nvl(summa , doc_summa),0))                                                                         AS summa
      FROM fdc_po_credit_lst po
      WHERE income_date BETWEEN :date_from AND :date_to
        AND payer_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND currency_id = :curr_id
        AND typesysname <> 'PaymentOrderConfirm'
        AND is_active   <> 'A'
      GROUP BY ROLLUP(kbk)
    UNION ALL
    SELECT CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN 2
             WHEN 2 THEN 2.01
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 2.1
                 ELSE        2.2
               END
             ELSE
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 2.11
                 ELSE        2.21
               END
           END AS sort_num
          ,CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN '2.'
             WHEN 2 THEN to_char( NULL )
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN '2.1.'
                 ELSE        '2.2.'
               END
             ELSE
               to_char( NULL )
           END AS num
          ,CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN 'Зачтено в авансовые платежи за период, всего'
             WHEN 2 THEN po.kbk
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 'в том числе денежного залога, всего'
                 ELSE        'в том числе излишне уплаченных/взысканных таможенных платежей, всего'
               END
             ELSE po.kbk
           END AS kbk
          ,SUM( r.summa ) summa
      FROM fdc_decision_payment_lst pd
          ,fdc_po_credit_lst        po
          ,fdc_value_lst            v
          ,fdc_reserved_payment_lst r
      WHERE pd.doc_date BETWEEN :date_from AND :date_to
        AND pd.is_active <> 'A'
        AND pd.state_id = fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' )
        AND pd.subject_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND po.currency_id    = :curr_id
        AND v.owner_object_id = pd.id
        AND v.ref_object_id   = r.id
        AND r.payment_id      = po.id
      GROUP BY CUBE((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
    UNION ALL
    SELECT CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN 3
             WHEN 2 THEN 3.01
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 3.1
                 ELSE        3.2
               END
             ELSE
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 3.11
                 ELSE        3.21
               END
           END AS sort_num
          ,CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN '3.'
             WHEN 2 THEN to_char( NULL )
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN '3.1.'
                 ELSE        '3.2.'
               END
             ELSE
               to_char( NULL )
           END AS num
          ,CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN 'Израсходовано авансовых платежей за период, всего'
             WHEN 2 THEN d_kbk.code
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 'в том числе на уплату таможенных и иных платежей, всего'
                 ELSE        'в том числе на внесение денежного залога, всего'
               END
             ELSE d_kbk.code
           END AS kbk
          ,SUM( pd.summa ) summa
      FROM fdc_payment_deduction_all_lst pd
          ,fdc_po_credit_lst             po
          ,fdc_document_lst              doc_nach
          ,fdc_dict_lst                  d_kbk
      WHERE pd.payment_date BETWEEN :date_from AND :date_to
        AND pd.is_active <> 'A'
        AND pd.payment_id = po.id
        AND po.payer_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND po.currency_id = :curr_id
        AND po.typesysname <> 'PaymentOrderConfirm'
        AND pd.decl_id = doc_nach.id
        AND pd.typesysname <> 'PaymentDeduction.Correct'
        AND (   EXISTS ( SELECT 0
                           FROM fdc_doc_params_function f
                           WHERE f.doc_class_id = pd.object_type_id )
             OR pd.typesysname = 'PaymentDeduction.Tr'
            )
        AND pd.kbkcode_id = d_kbk.id(+)
      GROUP BY CUBE((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
    UNION ALL
    SELECT CASE grouping_id( pb.kbk ) WHEN 1 THEN 4    ELSE 4.1             END AS sort_num
          ,CASE grouping_id( pb.kbk ) WHEN 1 THEN '4.' ELSE to_char( NULL ) END AS num
          ,CASE grouping_id( pb.kbk )
             WHEN 1 THEN
               'Возвращено авансовых платежей за период, всего'
             ELSE
               pb.kbk
           END AS kbk
          ,SUM( pb.summa ) summa
      FROM fdc_payment_order_payback_lst pb
          ,fdc_doc_confirm_lst           c
          ,fdc_decision_payback_lst      d
		  ,FDC_PAYMENT_ORDER_PAYBACK_Y   popy
      WHERE pb.id = c.confirmed_doc_id
        AND c.doc_date BETWEEN :date_from AND :date_to
        AND pb.is_active <> 'A'
        AND pb.currency_id = :curr_id
        AND d.id           = pb.dec_pay_id
        AND d.TypeSysName  <> 'DecPaybackTimeOut'
        AND d.subject_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
		AND popy.id = c.id
		AND popy.IS_CONFIRM = 'Y'
      GROUP BY ROLLUP( pb.kbk )
    UNION ALL
    SELECT (CASE grouping_id(q.kbk) WHEN 1 THEN 5 ELSE 5.1 END)                           AS sort_num
          ,to_char(NULL)                                                                  AS num
          ,(CASE grouping_id(q.kbk) WHEN 1 THEN 'Исходящее сальдо, всего' ELSE q.kbk END) AS kbk
          ,nvl(sum( q.summa ), 0)                                                         AS summa
      FROM ( SELECT po.kbk
                   ,nvl( fdc_payment_order_getrestsumma( po.id , :date_to ) , 0 ) AS summa
               FROM fdc_po_credit_lst po
               WHERE payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND currency_id = :curr_id
                 AND typesysname <> 'PaymentOrderConfirm'
				 /* AND po.income_date BETWEEN :date_from AND :date_to */
				 AND po.income_date <= :date_to
             UNION ALL
             SELECT r.kbkcode AS kbk
                   ,- r.summa
               FROM fdc_reserved_payment_lst r
                   ,fdc_po_credit_lst        po
               WHERE r.payment_id = po.id
                 AND (
				     (
				       r.bdate < :date_from
                       AND (   r.edate IS NULL
                       OR r.edate > :date_to )    --Те из блокировок, которые были подсчитаны в входящем сальдо и не были разблокированы в период отчета
					 ) OR
					 ( r.bdate BETWEEN :date_from AND :date_to 
					   AND (   r.edate IS NULL
                       OR r.edate > :date_to )    --Блокировки, аналогичные предыдущим, возникшие в период формирования отчета 
					 )
					 )
                 AND po.payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND po.currency_id = :curr_id
                 AND po.typesysname <> 'PaymentOrderConfirm'
                 AND ( EXISTS ( SELECT 0
                                FROM fdc_decision_payment_lst dp
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = dp.id
                                  AND dp.state_id != fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' ) ) OR
					  EXISTS ( SELECT 0
                                FROM fdc_advice_lst adv
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = adv.id
                                  AND adv.state_id !=  fdc_object_get_bysysname( 'State', 'Advice.Decision' ) )
					  )	
           ) q
      GROUP BY ROLLUP(q.kbk)
    ) res ON res.sort_num = null_line.sort_num
  WHERE CASE WHEN res.sort_num IS NOT NULL THEN res.kbk ELSE null_line.kbk END <> '<КБК>'
  ORDER BY CASE WHEN res.sort_num IS NOT NULL THEN res.sort_num ELSE null_line.sort_num END
          ,CASE WHEN res.sort_num IS NOT NULL THEN res.kbk      ELSE null_line.kbk      END

[dsReport_activation_date]
SELECT (CASE when (res.sort_num IS NOT NULL) THEN res.sort_num ELSE null_line.sort_num END) AS sort_num
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.num      ELSE null_line.num      END) AS num
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.kbk      ELSE null_line.kbk      END) AS kbk
      ,(CASE WHEN (res.sort_num IS NOT NULL) THEN res.summa    ELSE null_line.summa    END) AS summa
  FROM fdc_rep_act_compare_empty null_line
  LEFT OUTER JOIN (
    SELECT (CASE grouping_id(q.kbk) WHEN 1 THEN 0 ELSE 0.1 END)                          AS sort_num
          ,to_char(NULL)                                                                 AS num
          ,(CASE grouping_id(q.kbk) WHEN 1 THEN 'Входящее сальдо, всего' ELSE q.kbk END) AS kbk
          ,nvl(sum( q.summa ), 0)                                                        AS summa
      FROM ( SELECT po.kbk
                   ,nvl( fdc_payment_order_getrestsumma( po.id , :date_from - 1 ) , 0 ) AS summa
               FROM fdc_po_credit_lst po
               WHERE activation_date < :date_from
                 AND payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND currency_id = :curr_id
                 AND typesysname <> 'PaymentOrderConfirm'
             UNION ALL
             SELECT r.kbkcode AS kbk
                   ,- r.summa
               FROM fdc_reserved_payment_lst r
                   ,fdc_po_credit_lst        po
               WHERE r.payment_id = po.id
                 AND r.bdate < :date_from
                 AND (   r.edate IS NULL
                      OR r.edate > :date_from)
                 AND po.payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND po.currency_id = :curr_id
                 AND po.typesysname <> 'PaymentOrderConfirm'
                 AND ( EXISTS ( SELECT 0
                                FROM fdc_decision_payment_lst dp
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = dp.id
                                  AND dp.state_id != fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' ) ) OR
					  EXISTS ( SELECT 0
                                FROM fdc_advice_lst adv
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = adv.id
                                  AND adv.state_id !=  fdc_object_get_bysysname( 'State', 'Advice.Decision' ) )
					  )	
           ) q
      GROUP BY ROLLUP(q.kbk)
    UNION ALL
    SELECT (CASE grouping_id(kbk) WHEN 1 THEN 1                                               ELSE 1.1           END) AS sort_num
          ,(CASE grouping_id(kbk) WHEN 1 THEN '1.'                                            ELSE to_char(NULL) END) AS num
          ,(CASE grouping_id(kbk) WHEN 1 THEN 'Поступило авансовых платежей за период, всего' ELSE kbk           END) AS kbk
          ,SUM(nvl(nvl(summa , doc_summa),0))                                                                         AS summa
      FROM fdc_po_credit_lst po
      WHERE activation_date BETWEEN :date_from AND :date_to
        AND payer_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND currency_id = :curr_id
        AND typesysname <> 'PaymentOrderConfirm'
        AND is_active   <> 'A'
      GROUP BY ROLLUP(kbk)
    UNION ALL
    SELECT CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN 2
             WHEN 2 THEN 2.01
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 2.1
                 ELSE        2.2
               END
             ELSE
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 2.11
                 ELSE        2.21
               END
           END AS sort_num
          ,CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN '2.'
             WHEN 2 THEN to_char( NULL )
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN '2.1.'
                 ELSE        '2.2.'
               END
             ELSE
               to_char( NULL )
           END AS num
          ,CASE grouping_id((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
             WHEN 3 THEN 'Зачтено в авансовые платежи за период, всего'
             WHEN 2 THEN po.kbk
             WHEN 1 THEN
               CASE (CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END)
                 WHEN 1 THEN 'в том числе денежного залога, всего'
                 ELSE        'в том числе излишне уплаченных/взысканных таможенных платежей, всего'
               END
             ELSE po.kbk
           END AS kbk
          ,SUM( r.summa ) summa
      FROM fdc_decision_payment_lst pd
          ,fdc_po_credit_lst        po
          ,fdc_value_lst            v
          ,fdc_reserved_payment_lst r
      WHERE pd.activation_date BETWEEN :date_from AND :date_to
        AND pd.is_active <> 'A'
        AND pd.state_id = fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' )
        AND pd.subject_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND po.currency_id    = :curr_id
        AND v.owner_object_id = pd.id
        AND v.ref_object_id   = r.id
        AND r.payment_id      = po.id
      GROUP BY CUBE((CASE pd.typesysname WHEN 'DecisionPaymentDeposit' THEN 1 ELSE 2 END), po.kbk)
    UNION ALL
    SELECT CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN 3
             WHEN 2 THEN 3.01
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 3.1
                 ELSE        3.2
               END
             ELSE
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 3.11
                 ELSE        3.21
               END
           END AS sort_num
          ,CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN '3.'
             WHEN 2 THEN to_char( NULL )
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN '3.1.'
                 ELSE        '3.2.'
               END
             ELSE
               to_char( NULL )
           END AS num
          ,CASE grouping_id((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
             WHEN 3 THEN 'Израсходовано авансовых платежей за период, всего'
             WHEN 2 THEN d_kbk.code
             WHEN 1 THEN
               CASE (CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END)
                 WHEN 1 THEN 'в том числе на уплату таможенных и иных платежей, всего'
                 ELSE        'в том числе на внесение денежного залога, всего'
               END
             ELSE d_kbk.code
           END AS kbk
          ,SUM( pd.summa ) summa
      FROM fdc_payment_deduction_all_lst pd
          ,fdc_po_credit_lst             po
          ,fdc_document_lst              doc_nach
          ,fdc_dict_lst                  d_kbk
      WHERE pd.activation_date BETWEEN :date_from AND :date_to
        AND pd.is_active <> 'A'
        AND pd.payment_id = po.id
        AND po.payer_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
        AND po.currency_id = :curr_id
        AND po.typesysname <> 'PaymentOrderConfirm'
        AND pd.decl_id = doc_nach.id
        AND pd.typesysname <> 'PaymentDeduction.Correct'
        AND (   EXISTS ( SELECT 0
                           FROM fdc_doc_params_function f
                           WHERE f.doc_class_id = pd.object_type_id )
             OR pd.typesysname = 'PaymentDeduction.Tr'
            )
        AND pd.kbkcode_id = d_kbk.id(+)
      GROUP BY CUBE((CASE doc_nach.typesysname WHEN 'TR' THEN 2 ELSE 1 END), d_kbk.code)
    UNION ALL
    SELECT CASE grouping_id( pb.kbk ) WHEN 1 THEN 4    ELSE 4.1             END AS sort_num
          ,CASE grouping_id( pb.kbk ) WHEN 1 THEN '4.' ELSE to_char( NULL ) END AS num
          ,CASE grouping_id( pb.kbk )
             WHEN 1 THEN
               'Возвращено авансовых платежей за период, всего'
             ELSE
               pb.kbk
           END AS kbk
          ,SUM( pb.summa ) summa
      FROM fdc_payment_order_payback_lst pb
          ,fdc_doc_confirm_lst           c
          ,fdc_decision_payback_lst      d
		  ,FDC_PAYMENT_ORDER_PAYBACK_Y   popy
      WHERE pb.id = c.confirmed_doc_id
        AND c.activation_date BETWEEN :date_from AND :date_to
        AND pb.is_active <> 'A'
        AND pb.currency_id = :curr_id
        AND d.id           = pb.dec_pay_id
        AND d.TypeSysName  <> 'DecPaybackTimeOut'
        AND d.subject_id IN (
            SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
            UNION ALL
            SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
          )
		AND popy.id = c.id
		AND popy.IS_CONFIRM = 'Y'
      GROUP BY ROLLUP( pb.kbk )
    UNION ALL
    SELECT (CASE grouping_id(q.kbk) WHEN 1 THEN 5 ELSE 5.1 END)                           AS sort_num
          ,to_char(NULL)                                                                  AS num
          ,(CASE grouping_id(q.kbk) WHEN 1 THEN 'Исходящее сальдо, всего' ELSE q.kbk END) AS kbk
          ,nvl(sum( q.summa ), 0)                                                         AS summa
      FROM ( SELECT po.kbk
                   ,nvl( fdc_payment_order_getrestsumma( po.id , :date_to ) , 0 ) AS summa
               FROM fdc_po_credit_lst po
               WHERE payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND currency_id = :curr_id
                 AND typesysname <> 'PaymentOrderConfirm'
				 AND po.ACTIVATION_DATE <= :date_to
             UNION ALL
             SELECT r.kbkcode AS kbk
                   ,- r.summa
               FROM fdc_reserved_payment_lst r
                   ,fdc_po_credit_lst        po
               WHERE r.payment_id = po.id
                 AND (
				     (
				       r.bdate < :date_from
                       AND (   r.edate IS NULL
                       OR r.edate > :date_to )    --Те из блокировок, которые были подсчитаны в входящем сальдо и не были разблокированы в период отчета
					 ) OR
					 ( r.bdate BETWEEN :date_from AND :date_to 
					   AND (   r.edate IS NULL
                       OR r.edate > :date_to )    --Блокировки, аналогичные предыдущим, возникшие в период формирования отчета 
					 )
					 )
                 AND po.payer_id IN (
                     SELECT CAST(:subj_id AS NUMBER) AS id FROM dual WHERE 0 = :isgenreport
                     UNION ALL
                     SELECT id FROM fdc_subject_lst WHERE 1 = :isgenreport AND inn = :subj_inn
                   )
                 AND po.currency_id = :curr_id
                 AND po.typesysname <> 'PaymentOrderConfirm'
                 AND ( EXISTS ( SELECT 0
                                FROM fdc_decision_payment_lst dp
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = dp.id
                                  AND dp.state_id != fdc_object_get_bysysname( 'State', 'State.DecisionPayment.Signed' ) ) OR
					  EXISTS ( SELECT 0
                                FROM fdc_advice_lst adv
                                    ,fdc_value_lst            v
                                WHERE v.ref_object_id   = r.id
                                  AND v.owner_object_id = adv.id
                                  AND adv.state_id !=  fdc_object_get_bysysname( 'State', 'Advice.Decision' ) )
					  )	
           ) q
      GROUP BY ROLLUP(q.kbk)
    ) res ON res.sort_num = null_line.sort_num
  WHERE CASE WHEN res.sort_num IS NOT NULL THEN res.kbk ELSE null_line.kbk END <> '<КБК>'
  ORDER BY CASE WHEN res.sort_num IS NOT NULL THEN res.sort_num ELSE null_line.sort_num END
          ,CASE WHEN res.sort_num IS NOT NULL THEN res.kbk      ELSE null_line.kbk      END
