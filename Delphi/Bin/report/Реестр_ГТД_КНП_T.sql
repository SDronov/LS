[dsHeader]
with
AD as (SELECT nvl(SUM(CASE WHEN q1.typesysname <> 'TPO' THEN 1 ELSE 0 END),0) AS TotalDecl
              ,nvl(SUM(CASE WHEN q1.typesysname = 'CustomDeclTime' THEN 1 ELSE 0 END),0) AS TimeDecl
              ,nvl(SUM(CASE WHEN q1.typesysname = 'CustomDeclFull' THEN 1 ELSE 0 END),0) AS FullDecl
              ,nvl(SUM(CASE WHEN q1.typesysname = 'TPO' THEN 1 ELSE 0 END),0) AS TPO
              ,nvl(SUM(q1.Is_Closed), 0) AS Closed
          FROM (SELECT DISTINCT cd1.id
                               ,cd1.TypeSysName
                               ,CASE WHEN nvl(instr(cd1.OBJECTKINDLIST,'decl.close'),0) = 0 THEN 0 ELSE 1 END AS is_closed
                  FROM fdc_doc_charge_lst       cd1
                      ,fdc_doc_pack_gtd_knp_lst pg1
                      ,fdc_object_relation    r1
                      ,fdc_doc_pack_gtd_knp_lst dp1
                 WHERE dp1.ID = :id
                   AND pg1.licence_id = dp1.licence_id
                   AND pg1.id = r1.Object_ID
                   AND pg1.DOC_DATE <= dp1.DOC_DATE
                   AND r1.Rel_Object_ID = cd1.id) q1),
D as (SELECT nvl(SUM(q2.Decl), 0) AS TotalDecl
              ,nvl(SUM(q2.TPO), 0) AS TPO
              ,nvl(SUM(q2.TimeDecl), 0) AS TimeDecl
              ,nvl(SUM(q2.FullDecl), 0) AS FullDecl
              ,nvl(SUM(q2.Is_Closed), 0) AS Closed
          FROM (SELECT cd2.id
                      ,CASE WHEN cd2.typesysname <> 'TPO' THEN 1 ELSE 0 END AS Decl
                      ,CASE WHEN cd2.typesysname = 'TPO' THEN 1 ELSE 0 END AS TPO
                      ,CASE WHEN cd2.typesysname = 'CustomDeclTime' THEN 1 ELSE 0 END AS TimeDecl
                      ,CASE WHEN cd2.typesysname = 'CustomDeclFull' THEN 1 ELSE 0 END AS FullDecl
                      ,CASE WHEN nvl(instr(cd2.OBJECTKINDLIST, 'decl.close'), 0) = 0 THEN 0 ELSE 1 END AS is_closed
                  FROM fdc_doc_charge_lst cd2, fdc_object_relation r2
                 WHERE r2.Object_ID = :id
                   AND r2.Rel_Object_ID = cd2.id) q2)
SELECT 'Реестр ДТ ' ||' от ' || to_char(dp.DOC_DATE, 'dd.mm.yyyy') || ' № '||  dp.DOC_NUMBER || chr(10) 
       || '(по соглашению от ' || to_char(lic.agrmt_date, 'dd.mm.yyyy') || ' № ' || lic.agrmt_no || ')' || chr(10) ||
       'в таможне ' || p_nsi_customs.GetCustomsFullNameByCode8(dp.EXT_SOURCE) || chr(10) ||
       'по предприятию ' || s.NAME || ' ' || s.inn || ' ' || s.Okpo || ' (наименование, ИНН, ОКПО)' || chr(10)
       || '(таможенный представитель ' || dp.Broker_Name || ' ' || dp.Broker_INN || ' (наименование, ИНН))' AS descript
      ,'В реестр вошли ' || lpad(d.TotalDecl, 5) || ' ДТ (из них ' ||
       lpad(d.FullDecl, 5) || ' ПДТ,' || lpad(d.TimeDecl, 5) || ' ВДТ,' ||
       lpad(d.TimeDecl - d.Closed, 5) || ' незакрытых ВДТ,' ||
       lpad(d.Closed, 5) || ' закрытых ВДТ.)' || CASE
         WHEN d.tpo > 0 THEN
          ', ' || lpad(d.TPO, 5) || ' ТПО.'
       END AS Summary_text
      ,'Всего ДТ       ' || lpad(ad.TotalDecl, 5) || ' (из них ' ||
       lpad(ad.FullDecl, 5) || ' ПДТ,' || lpad(ad.TimeDecl, 5) || ' ВДТ,' ||
       lpad(ad.TimeDecl - ad.Closed, 5) || ' незакрытых ВДТ,' ||
       lpad(ad.Closed, 5) || ' закрытых ВДТ.)' || CASE
         WHEN ad.tpo > 0 THEN
          ', ' || lpad(ad.TPO, 5) || ' ТПО.'
       END AS all_summary_text
      ,(SELECT vs.stringvalue
          FROM fdc_value_lst_sys vs
         WHERE vs.sysname = 'BossName') fio
      ,(SELECT vs.stringvalue
          FROM fdc_value_lst_sys vs
         WHERE vs.sysname = 'PayBossName') pay_fio
  FROM fdc_doc_pack_gtd_knp_lst dp
      ,fdc_bp_licence_lst lic
      ,fdc_subject_lst s
      ,AD
      ,D
 WHERE dp.id = :ID
   AND lic.id = dp.licence_id
   AND s.ID = lic.subject_id

[dsReport]
SELECT DISTINCT 
       cd.id AS decl_id, cd.TypeSysName, 
       case WHEN cd.TypeSysName = 'CustomDeclTime' then null
            else cd.name end AS decl_no, 
      CASE WHEN  cd.TypeSysName = 'TPO' then
         ( SELECT tpo.regim || ' ' || CASE tpo.regim WHEN 'ЭК' THEN '10' WHEN 'ИМ' THEN '40' ELSE '' END
             FROM fdc_tpo_lst tpo
             WHERE tpo.id = cd.id )
       ELSE ( SELECT cdt.g011||' '|| cd.custom_mode_code||' '|| ddd.code 
               FROM fdc_custom_decl cdt, fdc_dict ddd WHERE cdt.id = cd.id AND ddd.id (+) = cdt.g0131 )END AS Decl_Type, 
       case WHEN cd.TypeSysName = 'TPO' THEN 'O'
         when cd.TypeSysName = 'CustomDeclFull' then 
          ( SELECT decode( nvl(Max( gt.is_closed), 0), 0, 'O', 'Z')
               FROM dbf_dclpredd dpr, fdc_custom_decl_lst gt
               WHERE gt.customs_code = dpr.g40_1
                 and gt.reg_date     = dpr.g40_2
                 and gt.decl_no      = dpr.g40_3
                 and dpr.g071        = cd.customs_code
                 and dpr.g072        = cd.reg_date
                 and dpr.g073        = cd.decl_no) 
            ELSE decode(nvl(instr(cd.ObjectKindList, 'decl.close'), 0), 0, 'O', 'Z') end as Closed, 
       lic.doc_no AS lic_no, lic.doc_date AS lic_date,
       CASE 
          WHEN cd.TypeSysName = 'TPO' then 'T'
          -- если ДТ отозвана, то 3 
          WHEN nvl(s.SysName, '-') = 'State.CustomDecl.NotLetOut' THEN '3'  
          WHEN cd.TypeSysName = 'CustomDeclFull' AND -- полная ДТ
                NOT EXISTS ( SELECT 1  -- Не было корректировок
                             FROM fdc_decl_charge ch, fdc_dict_lst fd, fdc_rel_pack_docs_lst rr1
                             WHERE ch.decl_id = cd.ID
                               AND rr1.Rel_Object_ID = ch.id
                               AND rr1.Object_ID = dp.id 
                               AND fd.id = ch.change_reason_id
                               AND nvl(fd.code2, '0') <> '0'
                           ) AND
                EXISTS ( SELECT 1    -- в видах транспорта есть трубопровод
                           FROM dbf_dcltrans d
                           WHERE d.g071 = cd.customs_code
                             AND d.g072 = cd.reg_date
                             AND d.g073 = cd.decl_no
                             AND d.vidtrans = '70'
                        ) AND
                   -- сумма списаний (исключая 100 вид) положительная
               (SELECT nvl(SUM( CASE WHEN dd.typesysname = 'PaymentDeductionKNPRePayment' THEN  0
                                   ELSE dd.summa END ), 0) 
                  FROM fdc_payment_deduction_all_lst dd, fdc_dict_lst ptc, fdc_rel_pack_docs_lst rr2
                  
                  WHERE dd.decl_id IN
                         (select cd.ID from dual
						  union all
						  SELECT tm.ID  
                                   FROM dbf_dclpredd pr, fdc_custom_decl_lst tm, fdc_rel_pack_docs_lst rpd
                                   WHERE pr.g071 = cd.customs_code
                                     and pr.g072 = cd.reg_date
                                     and pr.g073 = cd.decl_no
                                     and tm.customs_code = pr.g40_1
                                     and tm.reg_date     = pr.g40_2
                                     and tm.decl_no      = pr.g40_3
                                     and rpd.Object_ID = dp.ID 
                                     and rpd.Rel_Object_ID = tm.ID
                         )
                    AND rr2.Object_ID = dp.ID
                    and rr2.Rel_Object_ID = dd.id   
                    and ptc.id = dd.pay_type_id
                    AND ptc.code NOT IN ('10', '100')) > 0
          THEN 'U'
       WHEN	(cd.TypeSysName = 'CustomDeclTime') AND -- для временных
			       EXISTS ( SELECT 1    -- в видах транспорта есть трубопровод
                           FROM dbf_dcltrans d
                           WHERE d.g071 = cd.customs_code
                             AND d.g072 = cd.reg_date
                             AND d.g073 = cd.decl_no
                             AND d.vidtrans = '70'
                        ) AND
						(trunc(dp.DOC_DATE) > to_date('20'||to_char(Add_Months(cd.REG_DATE, 1), 'MMYY'), 'DDMMYY')) -- срок уплаты наступил (20 число следующего месяца) и нет полной ДТ
						THEN	'Q'					
       ELSE (SELECT nvl(max( fd.code2), '0')
               FROM fdc_decl_charge ch, fdc_rel_pack_docs_lst rr3, fdc_dict_lst fd
               WHERE ch.decl_id = cd.ID
                 AND rr3.Object_ID = dp.id
                 AND rr3.Rel_Object_ID = ch.id    
                 AND fd.id (+) = ch.change_reason_id
             ) END AS KTC,
      CASE WHEN cd.TypeSysName = 'CustomDeclFull' then 
     (  SELECT dc.g40_1||'/'||to_char(dc.g40_2, 'DDMMYY')||'/'||dc.g40_3
       FROM dbf_dclpredd dc
       WHERE dc.g071 = cd.customs_code
         and dc.g072 = cd.reg_date
         and dc.g073 = cd.decl_no
       AND ROWNUM = 1 ) 
      WHEN cd.TypeSysName = 'CustomDeclTime' THEN cd.name 
      ELSE '' end AS TIME_DECL_NO
FROM fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r, 
     fdc_doc_charge_lst cd, fdc_state_lst s,
     fdc_bp_licence_lst lic
WHERE dp.ID = :ID
  AND r.Object_ID = dp.ID
  AND r.Rel_Object_ID = cd.ID 
  AND s.id(+) = cd.state_id
  AND lic.ID = dp.licence_id
  and not exists ( SELECT 1
                      FROM dbf_dclpredd t, fdc_rel_pack_docs_lst rr, fdc_custom_decl_lst cdl
                      where t.g40_1 = cd.customs_code
                        and t.g40_2 = cd.reg_date
                        and t.g40_3 = cd.decl_no    
                        and t.g071 = cdl.customs_code
                        and t.g072 = cdl.reg_date
                        and t.g073 = cdl.decl_no
                        AND cdl.TypeSysName = 'CustomDeclFull'
                        and cdl.id = rr.Rel_Object_ID
                        and rr.Object_ID = dp.id
                  )

 ORDER BY CASE
            WHEN cd.TypeSysName = 'TPO'            THEN 4
            WHEN cd.TypeSysName = 'CustomDeclFull' THEN 3
            WHEN cd.TypeSysName = 'CustomDeclTime' THEN 2
            ELSE                                        1
          END
[dsTotal]
SELECT ff.Pay_Type as PayTypeCode, nvl(pp.PackSumma, 0) AS PackSumma,  nvl(ff.FullSumma, 0) AS FullSumma
FROM (SELECT d.code AS Pay_Type, nvl(SUM((CASE WHEN pd.typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END)), 0) AS FullSumma
FROM fdc_payment_deduction_lst pd
,fdc_doc_pack_gtd_knp_lst dpg
,fdc_doc_pack_gtd_knp_lst dp
,fdc_rel_pack_docs_lst r
,fdc_dict_lst d
WHERE dpg.id=:id
and dp.licence_id=dpg.licence_id
AND dp.DOC_DATE <=dpg.DOC_DATE
AND dp.id=r.Object_ID
AND r.Rel_Object_ID=pd.id
AND d.id(+)=pd.pay_type_id
GROUP BY d.code
) ff, (
SELECT d.code AS Pay_Type, nvl(Sum((CASE WHEN pd.typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END)), 0) AS PackSumma
FROM fdc_payment_deduction_lst pd, fdc_rel_pack_docs_lst r, fdc_dict_lst d
WHERE pd.id=r.Rel_Object_ID
AND r.Object_ID=:ID
AND d.id (+)=pd.pay_type_id
GROUP BY d.code
) pp
WHERE pp.Pay_Type(+)=ff.Pay_Type

[dsTotalKBK]
SELECT ff.Pay_Type AS PayTypeCode
      ,ff.KBKCode
      ,nvl(pp.PackSumma, 0) AS PackSumma
      ,nvl(ff.FullSumma, 0) AS FullSumma
  FROM (SELECT d.code AS Pay_Type
              ,pd.KBKCode
              ,nvl(SUM((CASE WHEN pd.typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END)), 0) AS FullSumma
          FROM fdc_payment_deduction_lst pd
              ,fdc_doc_pack_gtd_knp_lst  dpg
              ,fdc_doc_pack_gtd_knp_lst  dp
              ,fdc_rel_pack_docs_lst     r
              ,fdc_dict_lst              d
         WHERE dpg.id = :id
           AND dp.licence_id = dpg.licence_id
           AND dp.DOC_DATE <= dpg.Doc_Date
           AND dp.id = r.Object_ID
           AND r.Rel_Object_ID = pd.id
           AND d.id(+) = pd.pay_type_id
         GROUP BY d.code, pd.KBKCode) ff
      ,(SELECT d.code AS Pay_Type
              ,pd.KBKCode
              ,nvl(SUM((CASE WHEN pd.typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END)), 0) AS PackSumma
          FROM fdc_payment_deduction_lst pd
              ,fdc_rel_pack_docs_lst     r
              ,fdc_dict_lst              d
         WHERE pd.id = r.Rel_Object_ID
           AND r.Object_ID = :ID
           AND d.id(+) = pd.pay_type_id
         GROUP BY d.code, pd.KBKCode) pp
 WHERE pp.Pay_Type(+) = ff.Pay_Type
   AND pp.KBKCode(+) = ff.KBKCode
[dsCharges]
-- Запрос должен вернуть все сгруппированные по ДТ, виду платежа и КБК списания по реестру (т.к. оплачиваются строго все начисления, будем считаем, что списания=начислениям)
-- поля с наименованием DECL_ID, Pay_Type, KBKCode, Summa строго обязательны в запросе
SELECT q.decl_id, q.Pay_Type, q.KBKCode, nvl(SUM(q.summa), 0) AS Summa
  FROM (SELECT nvl((SELECT DISTINCT cdf.id
                     FROM dbf_dclpredd          t
                         ,fdc_doc_charge_lst   cdf
                         ,fdc_object_relation   rr
                    WHERE t.g40_1 = cd.customs_code
                      AND t.g40_2 = cd.reg_date
                      AND t.g40_3 = cd.decl_no
                      AND cdf.TypeSysName = 'CustomDeclFull'
                      AND cdf.customs_code = t.g071
                      AND cdf.reg_date = t.g072
                      AND cdf.decl_no = t.g073
                      AND rr.Rel_Object_ID = cdf.ID
                      AND rr.Object_ID = :ID
                      AND (cdf.decl_no, cdf.REG_DATE, cdf.CUSTOMS_CODE) in
                          (SELECT MAX(mcd.decl_no), MAX(mcd.reg_date), MAX(mcd.customs_code)
                             FROM dbf_dclpredd          mt
                                 ,fdc_doc_charge        mcd
                                 ,fdc_object_relation   mr
                            WHERE mt.g40_1 = t.g40_1
                              AND mt.g40_2 = t.g40_2
                              AND mt.g40_3 = t.g40_3
                              AND mcd.customs_code = mt.g071
                              AND mcd.reg_date = mt.g072
                              AND mcd.decl_no = mt.g073
                              AND mr.Rel_Object_ID = mcd.ID
                              AND mr.Object_ID = :ID))
                  ,pd.decl_id) AS decl_id
              ,d.code AS Pay_Type
              ,pd.KBKCode AS KBKCode
              ,
               --pd.summa
               CASE
                 WHEN pd.typesysname = 'PaymentDeductionKNPRePayment' THEN
                  0
                 ELSE
                  pd.summa
               END AS summa
          FROM fdc_payment_deduction_lst  pd
              ,fdc_doc_charge            cd
              ,fdc_object_relation       r
              ,fdc_dict_lst              d
         WHERE r.Object_ID = :ID
           AND r.Rel_Object_ID = pd.id
           AND cd.ID = pd.decl_id
           AND d.id(+) = pd.pay_type_id) q
 GROUP BY q.decl_id, q.Pay_Type, q.KBKCode

[dsKBK]
-- Запрос должен вернуть все пары Тип платежа - КБК, которые встречаются в списаниях по реестру  
-- поля с наименованием Pay_Type и KBKCode строго обязательны в запросе 
SELECT d.code AS Pay_Type, pd.KBKCode  
FROM fdc_payment_deduction_lst pd, fdc_rel_pack_docs_lst r, fdc_dict_lst d
WHERE pd.id = r.Rel_Object_ID
  AND r.Object_ID = :ID
  AND d.id (+) = pd.pay_type_id 
GROUP BY d.code, pd.KBKCode
ORDER BY d.code, pd.KBKCode

