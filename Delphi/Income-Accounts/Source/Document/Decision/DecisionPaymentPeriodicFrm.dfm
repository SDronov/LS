inherited DecisionPaymentPeriodicForm: TDecisionPaymentPeriodicForm
  Left = 264
  Top = 121
  Height = 758
  Caption = 'DecisionPaymentPeriodicForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 731
    ClientRectBottom = 707
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 678
        inherited edtName: TcxDBTextEdit
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Height = 223
        end
        inherited edtExcisePay: TcxDBCheckBox
          Width = 121
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Width = 767
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Width = 767
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 880
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 511
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 767
        end
        inherited edtAppNumber: TcxDBTextEdit
          Width = 120
        end
        inherited edtSignBy: TcxDBTextEdit
          Width = 767
        end
        inherited edtSignDate: TcxDBDateEdit
          Width = 767
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 767
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Width = 767
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 739
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 767
        end
        inherited cbDocBasement: TcxComboBox
          Width = 121
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 375
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Width = 1111
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Width = 767
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Width = 767
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 150
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 678
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 704
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 678
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 707
        ClientRectBottom = 683
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 336
        FloatTop = 252
        FloatClientWidth = 104
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = btGetDebts
            Visible = True
          end
          item
            Item = btnCreateActCorrOB
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '  ,CASE '
      '     WHEN d.decl_inn IS NOT NULL THEN '
      '       '#39#1048#1053#1053' '#39' || d.decl_inn'
      '     ELSE '#39#39
      '   END AS INN'
      '  ,CASE'
      
        '     WHEN (s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subje' +
        'ct'#39') AND d.decl_kpp IS NOT NULL THEN'
      '       '#39'/'#1050#1055#1055' '#39' || d.decl_kpp'
      '     ELSE '#39#39
      '   END AS KPP'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '     ,Trunc(d.summa) AS rub'
      
        '  ,TRIM(TO_CHAR(TRUNC ((d.summa - Trunc(d.summa))*100), '#39'00'#39')) A' +
        'S kopp'
      '      , i.kbkcode_id'
      '      , k.code as kbkcode'
      '      ,fdc_valuestring_sys_get( '#39'CustomsName'#39' ) AS CustomsName'
      '      ,fdc_valuestring_sys_get( '#39'BossName'#39' )    AS BossName'
      '  ,fdc_valuestring_sys_get( '#39'BossRank'#39' )    AS BossRank'
      '  ,CASE '
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN d.decl_address '
      '   END AS address'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN '
      '        (SELECT '#39#1087#1072#1089#1087#1086#1088#1090' '#39' || p.ser_no || '#39' '#39' || p.doc_no'
      '           FROM fdc_person_lst p'
      '           WHERE p.id = s.ID '
      '             AND p.ser_no IS NOT NULL'
      '             AND p.doc_no IS NOT NULL)'
      '   END AS passport'
      '  from fdc_dec_payment_periodic_lst d'
      '       , ( SELECT p.kbkcode_id'
      '           FROM fdc_value_lst v'
      '               ,fdc_reserved_payment p'
      '           WHERE v.owner_object_id = :ID'
      '             AND v.ref_object_id   = p.id ) i'
      '        , fdc_kbk_dict_lst k'
      '        , fdc_subject_lst s'
      ' where d.ID = :ID'
      '   AND i.kbkcode_id = k.id'
      '   AND d.subject_id = s.ID'
      '')
    object dsDataADVICE_ID: TFloatField [30]
      FieldName = 'ADVICE_ID'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_dec_payment_periodic_add('
      '      pDocType        => :TYPESYSNAME'
      '     ,pDecisionNumber => :DOC_NUMBER'
      '     ,pDecisionDate   => :DOC_DATE'
      '     ,pSubjectId      => :SUBJECT_ID'
      '     ,pAppNumber      => :APP_NUMBER'
      '     ,pAppDate        => :APP_DATE'
      '     ,pAppDateIncome  => :APP_DATE_INCOME'
      '     ,pReasonId       => :REASON_ID'
      '     ,pAdviceId     => :ADVICE_ID'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      ');'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADVICE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_dec_payment_periodic_upd('
      '      pId               => :ID'
      '     ,pDecisionNumber   => :DOC_NUMBER'
      '     ,pDecisionDate     => :DOC_DATE'
      '     ,pAppNumber        => :APP_NUMBER'
      '     ,pAppDate          => :APP_DATE'
      '     ,pAppDateIncome    => :APP_DATE_INCOME'
      '     ,pReasonId         => :REASON_ID'
      '     ,pSignedBy         => :SIGNED_BY'
      '     ,pSignedByChief    => :SIGNED_BY_CHIEF'
      '     ,pSignedByChiefUDF => :SIGNED_BY_CHIEF_UDF'
      '     ,pSignDate         => :SIGN_DATE'
      '     ,pdoccode          => :doc_code'
      '     ,pdocosncode       => :doc_osn_code'
      '     ,psudreasonid      => :sud_reason_id'
      '     ,pdebtssumma       => :debts_summa'
      '     ,pexcisepay        => :excise_pay'
      '     ,pdecisioncourt    => :decision_court'
      '     ,pdatecourt        => :date_court'
      '     ,pcourtactattrs    => :court_act_attrs'
      '     ,pcustomsdecattrs  => :customs_dec_attrs'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF_UDF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_osn_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sud_reason_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'debts_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'excise_pay'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decision_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date_court'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'court_act_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'customs_dec_attrs'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited qryGetNameTO: TfdcQuery
    SQL.Strings = (
      'SELECT t.StringValue AS name_to'
      
        '      ,'#39#1048#1079#1083#1080#1096#1085#1077' '#1091#1087#1083#1072#1095#1077#1085#1085#1099#1093' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1086#1096#1083#1080#1085', '#1085#1072#1083#1086#1075#1086#1074#39' AS CASH_A' +
        'SSETS_NAME'
      '  FROM fdc_value_lst t'
      '  WHERE SysName  = '#39'CustomsName'#39
      '  and (:customs_code is null or :customs_code = :customs_code)')
    ParamData = <
      item
        DataType = ftString
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'customs_code'
        ParamType = ptUnknown
      end>
  end
end
