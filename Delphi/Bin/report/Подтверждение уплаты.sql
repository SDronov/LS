[dsHeader]
SELECT s.name AS SubjectName
      ,s.inn  AS SubjectINN
      ,s.kpp  AS SubjectKPP
      ,s.address AS SubjectAddress
      ,'ИНН/КПП: ' || s.inn || '/' || s.kpp || '  ' || s.address AS SubjectAttrs
      ,trunc( SYSDATE - 1 ) AS Report_Date
      ,trunc( SYSDATE )     AS Current_Date
      ,:date_from           AS PeriodFrom
      ,:date_to             AS PeriodTo
      ,fdc_valuestring_sys_get( 'CustomsName' ) AS CustomsName
      ,fdc_valuestring_sys_get( 'BossName' )    AS BossName
FROM
  fdc_subject_lst s
WHERE
  s.id = :subject_id

[dsData]
SELECT ROW_NUMBER() OVER(ORDER BY DC_DOC_DATE, DC_DOC_NUMBER, KBK, PP_DATE, PP_NUMBER, F, ID) AS PP,
       DOCNUMBER,
       KBK,
       SUMMA,
       PP_NUMBER,
       PP_DATE,
       BROKER
  FROM (
        -- Списания
        SELECT DC.DOC_DATE AS DC_DOC_DATE,
                DC.DOC_NUMBER AS DC_DOC_NUMBER,
                DC.NAME AS DOCNUMBER,
                PD.KBKCODE AS KBK,
                SUM(PD.SUMMA) AS SUMMA,
                PO.DOC_NUMBER AS PP_NUMBER,
                PO.DOC_DATE AS PP_DATE,
                PO.ID,
                CASE
                  WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                       p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) 
                  THEN
                   PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' || PO.PAYER_NAME
                  ELSE
                   NULL
                END AS BROKER,
                0 AS F
          FROM FDC_PAYMENT_DEDUCTION_LST PD,
                FDC_OBLIGATION_DOC_LST    DC,
                FDC_PO_CREDIT_LST         PO
         WHERE PD.DECL_ID = DC.ID
           AND PD.PAYMENT_ID = PO.ID
           AND (DC.SUBJECT_ID = :SUBJECT_ID OR PO.PAYER_ID = :SUBJECT_ID)
           AND PD.ACTIVATION_DATE BETWEEN :DATE_FROM AND :DATE_TO
           AND (DC.TYPESYSNAME LIKE 'CustomDecl%' OR DC.TYPESYSNAME = 'TPO')
           AND PD.SUMMA > 0
         GROUP BY DC.DOC_DATE,
                   DC.DOC_NUMBER,
                   DC.NAME,
                   PD.KBKCODE,
                   PO.DOC_NUMBER,
                   PO.DOC_DATE,
                   PO.ID,
                   CASE
                     WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                          p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) 
                     THEN
                      PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' ||
                      PO.PAYER_NAME
                     ELSE
                      NULL
                   END
        UNION ALL
        -- Излишняя уплата
        SELECT DC.DOC_DATE AS DC_DOC_DATE,
               DC.DOC_NUMBER AS DC_DOC_NUMBER,
               DC.NAME || ' (излишняя уплата)' AS DOCNUMBER,
               K.CODE AS KBK,
               SUM(PD.SUMMA) AS SUMMA,
               PO.DOC_NUMBER AS PP_NUMBER,
               PO.DOC_DATE AS PP_DATE,
               PO.ID,
               CASE
                 WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                      p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID )
                 THEN
                  PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' || PO.PAYER_NAME
                 ELSE
                  NULL
               END AS BROKER,
               1 AS F
          FROM FDC_ADVICE_DEDUCTION_LST PD,
               FDC_OBLIGATION_DOC_LST   DC,
               FDC_PO_CREDIT_LST        PO,
               FDC_DICT_LST             K
         WHERE PD.DECL_ID = DC.ID
           AND PD.PAYMENT_ID = PO.ID
           AND PD.KBKCODE_ID = K.ID(+)
           AND (DC.SUBJECT_ID = :SUBJECT_ID OR PO.PAYER_ID = :SUBJECT_ID)
           AND PD.ADVICE_ACTIVATION_DATE BETWEEN :DATE_FROM AND :DATE_TO
           AND (DC.TYPESYSNAME LIKE 'CustomDecl%' OR DC.TYPESYSNAME = 'TPO')
         GROUP BY DC.DOC_DATE,
                  DC.DOC_NUMBER,
                  DC.NAME || ' (излишняя уплата)',
                  K.CODE,
                  PO.DOC_NUMBER,
                  PO.DOC_DATE,
                  PO.ID,
                  CASE
                    WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                         p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) 
                    THEN
                     PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' ||
                     PO.PAYER_NAME
                    ELSE
                     NULL
                  END
        UNION ALL
        -- Аннулирование, отмена списаний
        SELECT DC.DOC_DATE AS DC_DOC_DATE,
               DC.DOC_NUMBER AS DC_DOC_NUMBER,
               DC.NAME || ' (излишняя уплата)' AS DOCNUMBER,
               K.CODE AS KBK,
               SUM(PD.SUMMA) AS SUMMA,
               PO.DOC_NUMBER AS PP_NUMBER,
               PO.DOC_DATE AS PP_DATE,
               PO.ID,
               CASE
                 WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                      p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID )
                 THEN
                  PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' || PO.PAYER_NAME
                 ELSE
                  NULL
               END AS BROKER,
               1 AS F
          FROM FDC_PAYMENT_DEDUCTION_ALL_LST PD,
               FDC_VALUE_LST V,
               (SELECT OD.ID,
                       OD.SUBJECT_ID,
                       OD.DOC_DATE,
                       OD.DOC_NUMBER,
                       OD.NAME,
                       A.ID AS REF_ID
                  FROM FDC_OBLIGATION_DOC_LST OD, FDC_ANNULMENT_LST A
                 WHERE OD.ID = A.DOCUMENT_ID
                   AND OD.SUBJECT_ID = :SUBJECT_ID
                   AND A.ACTIVATION_DATE BETWEEN :DATE_FROM AND :DATE_TO
                   AND (OD.TYPESYSNAME LIKE 'CustomDecl%' OR OD.TYPESYSNAME = 'TPO')
                UNION ALL
                SELECT OD.ID,
                       OD.SUBJECT_ID,
                       OD.DOC_DATE,
                       OD.DOC_NUMBER,
                       OD.NAME,
                       A.ID AS REF_ID
                  FROM FDC_OBLIGATION_DOC_LST         OD,
                       FDC_CORRECTION_GTD_CCHARGE_LST A
                 WHERE OD.ID = A.DOC_ID
                   AND OD.SUBJECT_ID = :SUBJECT_ID
                   AND A.ACTIVATION_DATE BETWEEN :DATE_FROM AND :DATE_TO
                   AND (OD.TYPESYSNAME LIKE 'CustomDecl%' OR OD.TYPESYSNAME = 'TPO')
                UNION ALL
                SELECT OD.ID,
                       OD.SUBJECT_ID,
                       OD.DOC_DATE,
                       OD.DOC_NUMBER,
                       OD.NAME,
                       A.ID AS REF_ID
                  FROM FDC_OBLIGATION_DOC_LST         OD,
                       FDC_CORRECTION_TPO_CCHARGE_LST A
                 WHERE OD.ID = A.DOC_ID
                   AND OD.SUBJECT_ID = :SUBJECT_ID
                   AND A.ACTIVATION_DATE BETWEEN :DATE_FROM AND :DATE_TO
                   AND (OD.TYPESYSNAME LIKE 'CustomDecl%' OR OD.TYPESYSNAME = 'TPO')) DC,
               FDC_PO_CREDIT_LST PO,
               FDC_DICT_LST K
         WHERE V.OWNER_OBJECT_ID = DC.REF_ID
           AND V.REF_OBJECT_ID = PD.ID
           AND PD.DECL_ID = DC.ID
           AND PD.PAYMENT_ID = PO.ID
           AND PD.KBKCODE_ID = K.ID(+)
         GROUP BY DC.DOC_DATE,
                  DC.DOC_NUMBER,
                  DC.NAME || ' (излишняя уплата)',
                  K.CODE,
                  PO.DOC_NUMBER,
                  PO.DOC_DATE,
                  PO.ID,
                  CASE
                    WHEN p_personal_account.GetParentLsIDBySubjectId( DC.SUBJECT_ID ) <> 
                         p_personal_account.GetParentLsIDBySubjectId( PO.PAYER_ID ) 
                    THEN
                     PO.PAYER_INN || '/' || PO.PAYER_KPP || '  ' ||
                     PO.PAYER_NAME
                    ELSE
                     NULL
                  END)
 ORDER BY DC_DOC_DATE, DC_DOC_NUMBER, KBK, PP_DATE, PP_NUMBER, F
