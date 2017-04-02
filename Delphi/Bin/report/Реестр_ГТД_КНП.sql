[dsHeader]
WITH cAllGTD AS ( 
  SELECT  COUNT(q.id) AS TotalDecl, 
          SUM(q.TPO) AS TPO,
          SUM(q.TimeDecl) AS TimeDecl, 
          SUM(q.FullDecl) AS FullDecl,
          SUM(q.Closed) AS Closed 
  FROM 
    (  SELECT DISTINCT cd.id, 
              CASE WHEN cd.ext_typesysname = 'TPO' THEN 1
                 ELSE 0 END AS TPO,
              CASE WHEN cd.ext_typesysname = 'CustomDeclTime' THEN 1
                 ELSE 0 END AS TimeDecl,
              CASE WHEN cd.ext_typesysname = 'CustomDeclFull' THEN 1
                ELSE 0 END AS FullDecl,
              decode(cd.closed_date, NULL, 0, 1) AS Closed
          FROM fdc_tmp_gtd cd, fdc_tmp_deduction pd,fdc_doc_pack_gtd_knp_lst pg
              ,(SELECT p.agreement_id AS id, p.DOC_DATE AS to_date
                 FROM fdc_doc_pack_gtd_knp_lst p
                 WHERE p.id = :ID) Agr
       WHERE pg.agreement_id = Agr.id
         AND pg.DOC_DATE <= Agr.To_Date    
         AND pd.pack_id = pg.id
         AND pd.decl_id = cd.id    
    )  q
    ),
 cGTD AS ( SELECT COUNT(q.id) AS TotalDecl,
              SUM(q.TPO) AS TPO,     
              SUM(q.TimeDecl) AS TimeDecl, 
              SUM(q.FullDecl) AS FullDecl,
              SUM(q.Closed) AS Closed 
           FROM 
            (  SELECT DISTINCT cd.id, 
                      CASE WHEN cd.ext_typesysname = 'TPO' THEN 1
                        ELSE 0 END AS TPO,
                      CASE WHEN cd.ext_typesysname = 'CustomDeclTime' THEN 1
                        ELSE 0 END AS TimeDecl,
                      CASE WHEN cd.ext_typesysname = 'CustomDeclFull' THEN 1
                        ELSE 0 END AS FullDecl,
                      decode(cd.closed_date, NULL, 0, 1) AS Closed
                  FROM fdc_tmp_gtd cd, fdc_tmp_deduction d
               WHERE d.pack_id = :id 
                 AND cd.id = d.decl_id
             )  q
         )

SELECT 
 'Реестр ДТ N ' || dp.DOC_NUMBER || ' от ' ||
       to_char(dp.DOC_DATE, 'dd.mm.yyyy') || chr(10) ||
       'оформленных в соответствии с приказом ГТК России N 303 от 26.03.2001' ||
       chr(10) || '(по соглашению N ' || lic.agrmt_no || ' от ' ||
       to_char(lic.agrmt_date, 'dd.mm.yyyy') || ')' || chr(10) ||
       'в таможне ' ||
       p_nsi_customs.GetCustomsFullNameByCode8(dp.EXT_SOURCE) || chr(10) ||
       'по предприятию ' || s.NAME || ' ИНН: ' || s.inn || ' ОКПО: ' ||
       s.Okpo || chr(10) || '(таможенный брокер ' || dp.Broker_Name ||
       ' ИНН: ' || dp.Broker_INN || ')' AS descript
       , 'В реестр вошли ' || lpad(d.TotalDecl, 5) || ' ДТ (из них ' ||
                    lpad(d.FullDecl, 5) || ' ПДТ,' || lpad(d.TimeDecl, 5) || ' ВДТ,' ||
                    lpad(d.TimeDecl - d.Closed, 5) || ' незакрытых ВДТ,' ||
                    lpad(d.Closed, 5) || ' закрытых ВДТ.)'|| 
                    CASE WHEN d.tpo > 0 THEN ', '||lpad(d.TPO, 5)||' ТПО.' END AS Summary_text
     ,  'Всего ДТ       ' ||lpad(ad.TotalDecl, 5) || ' (из них ' ||
                    lpad(ad.FullDecl, 5) || ' ПДТ,' || lpad(ad.TimeDecl, 5) ||
                    ' ВДТ,' || lpad(ad.TimeDecl - ad.Closed, 5) ||
                    ' незакрытых ВДТ,' || lpad(ad.Closed, 5) ||
                    ' закрытых ВДТ.)'|| 
                    CASE WHEN ad.tpo > 0 THEN ', '||lpad(ad.TPO, 5)||' ТПО.' END AS all_summary_text
      ,(SELECT vs.stringvalue
          FROM fdc_value_lst_sys vs
         WHERE vs.sysname = 'BossName') fio
      ,(SELECT vs.stringvalue
          FROM fdc_value_lst_sys vs
         WHERE vs.sysname = 'PayBossName') pay_fio
  FROM fdc_doc_pack_gtd_knp_lst dp, fdc_bp_licence_lst lic, fdc_subject_lst s , cAllGTD ad, cGTD d
 WHERE dp.id = :ID
   AND lic.id = dp.licence_id
   AND s.ID = lic.subject_id

[dsReport]
SELECT DISTINCT cd.id AS decl_id, cd.ext_TypeSysName, 
       case WHEN cd.ext_TypeSysName = 'CustomDeclTime' then null
            else cd.name end AS decl_no, 
       CASE  WHEN  cd.ext_TypeSysName = 'TPO' then cd.g011||' '|| cd.custom_mode_code    
       ELSE cd.g011||' '|| cd.custom_mode_code||' '|| cd.g0131 END AS Decl_Type, 
       case WHEN cd.ext_TypeSysName = 'TPO' THEN 'O'
            WHEN cd.ext_TypeSysName = 'CustomDeclFull' then 
          ( SELECT decode( Max(g.closed_date), NULL, 'O', 'Z')
               FROM fdc_tmp_time_gtd dc, fdc_tmp_gtd g
               WHERE dc.decl_id = cd.id
               and g.ext_source = dc.ext_source
               and g.ext_typesysname = dc.ext_typesysname
               and g.ext_id = dc.ext_id ) 
            WHEN cd.ext_TypeSysName = 'CustomDeclTime' THEN
               decode( cd.closed_date, NULL, 'O', 'Z')
            else 'O' end as Closed, 
       lic.doc_no AS lic_no, lic.doc_date AS lic_date,
       CASE WHEN cd.ext_TypeSysName = 'TPO' then 'T'
            WHEN cd.ext_TypeSysName = 'CustomDeclFull' AND -- полная ДТ
                NOT EXISTS ( SELECT 1  -- Не было корректировок
                             FROM fdc_tmp_charge ch
                             WHERE ch.decl_id = cd.id
                             AND ch.pack_id = dp.id 
                             AND nvl( ch.change_reason_code, '0') <> '0'
                           ) AND
               (cd.pipeline = 'Y') AND  -- в видах транспорта есть трубопровод
                (SELECT nvl(SUM( CASE WHEN dd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN  0
                                   ELSE dd.summa END ), 0) -- сумма списаний (исключая 100 вид) положительная
                  FROM fdc_tmp_deduction dd
                  WHERE (dd.decl_id = cd.ID OR dd.decl_id IN (SELECT cdf.id 
                                   FROM fdc_tmp_time_gtd ttg, 
                                        fdc_tmp_gtd cdf 
                                   WHERE ttg.pack_id = dp.ID AND ttg.decl_id = cd.id 
                                     AND cdf.ext_source = ttg.ext_source
                                     AND cdf.ext_typesysname = ttg.ext_typesysname
                                     AND cdf.ext_id = ttg.ext_id )
                         )
                    AND dd.pack_id = dp.id    
                    AND dd.pay_type_code NOT IN ('10', '100')) > 0
          THEN 'U'
          WHEN (cd.ext_TypeSysName = 'CustomDeclTime') AND -- для временных
			         (cd.pipeline = 'Y') AND -- в видах транспорта есть трубопровод
						   (trunc(dp.DOC_DATE) > to_date('20'||to_char(Add_Months(cd.REG_DATE, 1), 'MMYY'), 'DDMMYY')) -- срок уплаты наступил (20 число следующего месяца) и нет полной ДТ
						THEN	'Q'										
       ELSE ( SELECT nvl( MAX(nvl(ch.change_reason_code, 0)), 0) 
                FROM fdc_tmp_charge ch
                WHERE  ch.decl_id = cd.id
                   AND ch.pack_id = dp.id
             ) END AS KTC,       
      CASE WHEN cd.ext_TypeSysName = 'CustomDeclFull' then 
     (  SELECT dc.customs_code || '/' || to_char( dc.reg_date ,'DDMMYY' ) || '/' || dc.decl_no
       FROM fdc_tmp_time_gtd dc
       WHERE dc.decl_id = cd.id
       AND ROWNUM = 1 ) 
      WHEN cd.ext_TypeSysName = 'CustomDeclTime' THEN cd.name 
      ELSE '' end AS TIME_DECL_NO
  FROM fdc_tmp_gtd cd, fdc_tmp_deduction d, fdc_doc_pack_gtd_knp_lst dp, fdc_bp_licence_lst lic
 WHERE dp.id = :id
   AND d.pack_id = dp.id  
   AND cd.id = d.decl_id
   AND lic.id = dp.licence_id
   and not exists ( SELECT 1
                      FROM fdc_tmp_time_gtd t
                      where t.ext_source  = cd.ext_source
                        and t.ext_typesysname = cd.ext_typesysname
                        and t.ext_id = cd.ext_id    
                        AND t.pack_id = dp.id  )
 ORDER BY CASE
            WHEN cd.ext_TypeSysName = 'TPO'            THEN 4
            WHEN cd.ext_TypeSysName = 'CustomDeclFull' THEN 3
            WHEN cd.ext_TypeSysName = 'CustomDeclTime' THEN 2
            ELSE                                            1
          END

[dsTotal]
WITH FullDed AS 
(SELECT pd.PAY_TYPE_CODE AS Pay_Type, nvl(SUM(CASE WHEN pd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END), 0) AS FullSumma
  FROM fdc_tmp_deduction pd
      ,fdc_doc_pack_gtd_knp_lst dp
      ,(SELECT p.AGREEMENT_ID AS id , p.DOC_DATE AS To_Date, p.EXT_SOURCE AS Customs
          FROM fdc_doc_pack_gtd_knp_lst p
         WHERE p.id = :ID) Agr
 WHERE dp.AGREEMENT_ID = agr.id
   AND dp.DOC_DATE <= Agr.To_Date
   AND pd.pack_id = dp.id
   AND pd.ext_source = Agr.Customs
 GROUP BY pd.PAY_TYPE_CODE
),
  PackDed AS 
(
SELECT pd.PAY_TYPE_CODE AS Pay_Type, nvl(Sum(CASE WHEN pd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END), 0) AS PackSumma 
FROM fdc_tmp_deduction pd
WHERE pd.pack_id = :ID
GROUP BY pd.PAY_TYPE_CODE
)
  SELECT ff.Pay_Type as PayTypeCode, nvl(pp.PackSumma, 0) AS PackSumma,  nvl(ff.FullSumma, 0) AS FullSumma 
  FROM FullDed ff, PackDed pp
  WHERE pp.Pay_Type(+) = ff.Pay_Type
  ORDER BY ff.Pay_Type

[dsTotalKBK]
WITH FullDed AS 
(SELECT pd.PAY_TYPE_CODE AS Pay_Type, pd.kbk AS KBKCode, nvl(SUM(CASE WHEN pd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END), 0) AS FullSumma
  FROM fdc_tmp_deduction pd
      ,fdc_doc_pack_gtd_knp_lst dp
      ,(SELECT p.AGREEMENT_ID AS id , p.DOC_DATE AS To_Date, p.EXT_SOURCE AS Customs
          FROM fdc_doc_pack_gtd_knp_lst p
         WHERE p.id = :ID) Agr
 WHERE dp.AGREEMENT_ID = agr.id
   AND dp.DOC_DATE <= Agr.To_Date
   AND pd.pack_id = dp.id
   AND pd.ext_source = Agr.Customs
 GROUP BY pd.PAY_TYPE_CODE, pd.kbk
),
  PackDed AS 
(
SELECT pd.PAY_TYPE_CODE AS Pay_Type, pd.kbk AS KBKCode, nvl(Sum(CASE WHEN pd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN 0 ELSE pd.summa END), 0) AS PackSumma 
FROM fdc_tmp_deduction pd
WHERE pd.pack_id = :ID
GROUP BY pd.PAY_TYPE_CODE, pd.KBK
)
SELECT ff.Pay_Type AS PayTypeCode, ff.KBKCode, nvl(pp.PackSumma, 0) AS PackSumma,  nvl(ff.FullSumma, 0) AS FullSumma 
  FROM FullDed ff
  LEFT OUTER JOIN PackDed pp ON pp.Pay_Type = ff.Pay_Type AND  pp.KBKCode = ff.KBKCode
  ORDER BY ff.Pay_Type

[dsCharges]
-- Запрос должен вернуть все сгруппированные по ДТ, виду платежа и КБК списания по реестру (т.к. оплачиваются строго все начисления, будем считаем, что списания = начислениям)
-- поля с наименованием DECL_ID, Pay_Type, KBKCode, Summa строго обязательны в запросе
select q.decl_id, q.Pay_Type, q.KBKCode, nvl(Sum(q.summa), 0) AS Summa 
from
     (SELECT  nvl(( SELECT t.decl_id
                      FROM fdc_tmp_time_gtd t
                           ,fdc_tmp_gtd tg
                      WHERE t.pack_id = :ID 
                        AND t.ext_source  = cd.ext_source
                        and t.ext_typesysname = cd.ext_typesysname
                        and t.ext_id = cd.ext_id
                        and tg.id = t.decl_id
                        and (tg.doc_number, tg.reg_date, tg.customs_code) in 
                                            ( select max(tg1.doc_number), max(tg1.reg_date), max(tg1.customs_code) 
                                                from fdc_tmp_time_gtd t1
                                                    ,fdc_tmp_gtd tg1
                                               where t1.pack_id         = :ID 
                                                 AND t1.ext_source      = t.ext_source
                                                 and t1.ext_typesysname = t.ext_typesysname
                                                 and t1.ext_id          = t.ext_id
                                                 and tg1.id             = t1.decl_id )
                  ),  pd.decl_id) as decl_id, 
                 pd.pay_type_code AS Pay_Type, 
                 pd.kbk AS KBKCode, 
                 --pd.summa 
                 cd.ext_source,
                 cd.ext_typesysname,
                 cd.ext_id,
               CASE WHEN pd.ext_typesysname = 'PaymentDeductionKNPRePayment' THEN  0
                 ELSE pd.summa END AS summa
          FROM fdc_tmp_deduction pd, fdc_tmp_gtd cd
          WHERE pd.pack_id = :ID
            AND cd.id = pd.decl_id) q
GROUP BY q.decl_id,
         q.Pay_Type, 
         q.KBKCode
[dsKBK]
-- Запрос должен вернуть все пары Тип платежа - КБК, которые встречаются в списаниях по реестру  
-- поля с наименованием Pay_Type и KBKCode строго обязательны в запросе
SELECT pd.pay_type_code AS Pay_Type, pd.kbk AS KBKCode 
FROM fdc_tmp_deduction pd
WHERE pd.pack_id = :ID
GROUP BY pd.pay_type_code, pd.KBK
ORDER BY pd.pay_type_code, pd.KBK
