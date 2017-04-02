inherited DecisionPaymentDepositForm: TDecisionPaymentDepositForm
  Left = 535
  Top = 252
  Width = 1300
  Height = 834
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1079#1072#1083#1086#1075#1072' '#1074' '#1089#1095#1105#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1284
    Height = 796
    ClientRectBottom = 772
    ClientRectRight = 1284
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1278
        Height = 741
        inherited edtName: TcxDBTextEdit
          Top = -237
        end
        inherited edtDescript: TcxDBMemo
          Top = 739
          Width = 1192
        end
        inherited edtDecisionCourt: TcxDBCheckBox
          Top = 169
        end
        inherited edtExcisePay: TcxDBCheckBox
          Top = 277
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Top = 223
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Top = 250
        end
        inherited edtReasonAticle: TcxTextEdit
          Left = 1168
          Top = 142
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Top = 337
          Properties.ReadOnly = True
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Top = -54
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 1013
          Top = -54
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Top = -27
        end
        inherited edtAppDate: TcxDBDateEdit
          Top = 44
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Top = 44
        end
        inherited edtAppNumber: TcxDBTextEdit
          Top = 71
        end
        inherited cbBeforeAfter: TcxComboBox
          Left = 1119
          Top = 169
        end
        inherited cbDocBasement: TcxComboBox
          Top = 169
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 672
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 699
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 618
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 645
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Top = 142
          Width = 813
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Top = -179
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Top = -152
        end
        inherited edtDocCode: TcxDBTextEdit
          Top = -152
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Top = -125
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Top = 71
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Top = 196
          Width = 724
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 395
          Properties.ReadOnly = True
          Properties.OnChange = nil
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 480
          Properties.OnChange = nil
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 507
          Properties.OnChange = nil
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 534
          Properties.OnChange = nil
          Width = 1219
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 422
        end
        inherited edtDocNumber: TcxDBTextEdit
          Top = -152
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1119
          Top = -152
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = -125
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = -125
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = -125
          Style.IsFontAssigned = True
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1284
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 741
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 769
        Width = 1284
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1281
        Height = 741
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1058#1056
      object grdTR: TcxGrid
        Left = 0
        Top = 0
        Width = 1284
        Height = 772
        Align = alClient
        TabOrder = 0
        object grdTRDBTableView: TcxGridDBTableView
          OnDblClick = grdTRDBTableViewDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTR
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grdTRDBTableViewNAME: TcxGridDBColumn
            Caption = #1058#1056
            DataBinding.FieldName = 'NAME'
            Width = 150
          end
          object grdTRDBTableViewDOC_NUMBER: TcxGridDBColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 110
          end
          object grdTRDBTableViewDOC_DATE: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
          end
          object grdTRDBTableViewIS_ACTIVE: TcxGridDBColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
          end
          object grdTRDBTableViewACTIVATION_DATE: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
          end
          object grdTRDBTableViewDECL_NAME: TcxGridDBColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'DECL_NAME'
            Width = 150
          end
          object grdTRDBTableViewDECL_INN: TcxGridDBColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'DECL_INN'
          end
          object grdTRDBTableViewDECL_KPP: TcxGridDBColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'DECL_KPP'
          end
        end
        object grdTRLevel: TcxGridLevel
          GridView = grdTRDBTableView
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1284
        Height = 772
        ClientRectBottom = 748
        ClientRectRight = 1284
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
        FloatLeft = 310
        FloatTop = 307
        FloatClientWidth = 103
        FloatClientHeight = 50
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
      'select '
      '/*'
      '        (SELECT SUM(summa)'
      '          FROM fdc_payment_deduction_lst'
      '         WHERE decl_id = ('
      '            select tr.id'
      '            from fdc_rel_tr_dec_lst rel, fdc_tr tr'
      '            where rel.rel_object_id = :ID'
      '              and rel.object_id = tr.id)'
      '          ) as SUMMA,'
      '*/'
      'd.*'
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
      
        '  ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa AS d' +
        'ebts_summa_s'
      '  ,Trunc(d.summa) AS rub'
      
        '  ,TRIM(TO_CHAR(TRUNC ((d.summa - Trunc(d.summa))*100), '#39'00'#39')) A' +
        'S kopp'
      '  , i.kbkcode_id'
      '  , i.summa_base'
      '  , k.code as kbkcode'
      
        '  ,UPPER(fdc_valuestring_sys_get( '#39'CustomsName'#39' )) AS CustomsNam' +
        'e'
      '  ,fdc_valuestring_sys_get( '#39'BossName'#39' )    AS BossName'
      '  ,fdc_valuestring_sys_get( '#39'BossRank'#39' )    AS BossRank'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN d.decl_address'
      '   END AS address'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN'
      '        (SELECT '#39#1087#1072#1089#1087#1086#1088#1090' '#39' || p.ser_no || '#39' '#39' || p.doc_no'
      '           FROM fdc_person_lst p'
      '           WHERE p.id = s.ID'
      '             AND p.ser_no IS NOT NULL'
      '             AND p.doc_no IS NOT NULL)'
      '   END AS passport'
      ''
      'FROM fdc_dec_payment_deposit_Lst d'
      '       , ( SELECT p.kbkcode_id, p.summa_base'
      '           FROM fdc_value_lst v'
      '               ,fdc_reserved_payment p'
      '           WHERE v.owner_object_id = :ID'
      '             AND v.ref_object_id   = p.id ) i'
      '        , fdc_kbk_dict_lst k'
      '        ,fdc_subject_lst s'
      'WHERE d.ID = :ID'
      '  AND i.kbkcode_id = k.id'
      '  AND d.subject_id = s.ID')
    SourceServerObject = 'FDC_DEC_PAYMENT_DEPOSIT_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    inherited dsDataDECISION_COURT: TStringField [47]
    end
    inherited dsDataDECL_ADDRESS: TStringField [48]
    end
    inherited dsDataDATE_COURT: TDateTimeField [49]
    end
    inherited dsDataEXCISE_PAY: TStringField [50]
    end
    object dsDataSUMMA_BASE: TFloatField
      FieldName = 'SUMMA_BASE'
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    Left = 390
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_payment_upd('
      '      pid               => :ID'
      '     ,pdecisionnumber   => :DOC_NUMBER'
      '     ,pdecisiondate     => :DOC_DATE'
      '     ,pappnumber        => :APP_NUMBER'
      '     ,pappdate          => :APP_DATE'
      '     ,pappdateincome    => :APP_DATE_INCOME'
      '     ,preasonid         => :REASON_ID'
      '     ,psignedby         => :SIGNED_BY'
      '     ,psignedbychief    => :SIGNED_BY_CHIEF'
      '     ,psignedbychiefudf => :SIGNED_BY_CHIEF_UDF'
      '     ,psigndate         => :SIGN_DATE'
      '     ,pdoccode          => :DOC_CODE'
      '     ,pdocosncode       => :DOC_OSN_CODE'
      '     ,psudreasonid      => :SUD_REASON_ID'
      '     ,pdebtssumma       => :DEBTS_SUMMA'
      '     ,pexcisepay        => :EXCISE_PAY'
      '     ,pdecisioncourt    => :DECISION_COURT'
      '     ,pdatecourt        => :DATE_COURT'
      '     ,pcourtactattrs    => :COURT_ACT_ATTRS'
      '     ,pcustomsdecattrs  => :CUSTOMS_DEC_ATTRS'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;')
    SourceServerObject = 'FDC_DECISION_PAYMENT_UPD'
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
        DataType = ftUnknown
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
        Name = 'DOC_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUD_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXCISE_PAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DECISION_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COURT_ACT_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_DEC_ATTRS'
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
  inherited qlDecision: TQueryList
    object sqlOpGetRefObj: TsqlOp
      SQL.Strings = (
        'begin'
        '  SELECT dp.summa'
        '    INTO :result'
        '    FROM fdc_decision_payment_lst dp'
        '    WHERE dp.id = :ID;'
        'end;')
    end
  end
  inherited qryDetail: TfdcQuery
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY dc.doc_date, po.doc_date, po.' +
        'doc_number) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END           AS po_type'
      '      ,po.doc_number AS po_num'
      '      ,po.doc_date   AS po_date'
      '      ,po.doc_summa  AS po_sum'
      '      ,dc.name       AS od_num'
      '      ,to_char(NULL) AS od_pt'
      '      ,dc.sum_rub    AS od_cor'
      '      ,r.summa       AS reuse_sum'
      '  FROM fdc_value_lst            v'
      '      ,fdc_reserved_payment_lst r'
      '      ,fdc_po_credit_lst        po'
      '      ,fdc_tr_lst               dc'
      '  WHERE v.owner_object_id = :ID'
      '    AND v.ref_object_id   = r.id'
      '    AND r.doc_id          = dc.id'
      '    AND r.payment_id      = po.id'
      '  ORDER BY dc.doc_date, po.doc_date, po.doc_number')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited qryDeclList: TfdcQuery
    SQL.Strings = (
      'SELECT DISTINCT t.name as decl_name'
      '  FROM fdc_value_lst              v'
      '      ,fdc_reserved_for_reuse_lst r'
      '      ,fdc_tr_lst                 t'
      '  WHERE v.owner_object_id = :ID'
      '    AND v.ref_object_id   = r.id'
      '    AND r.doc_id          = t.id')
  end
  object dsetTR: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT t.*'
      '  FROM fdc_value_lst              v'
      '      ,fdc_reserved_for_reuse_lst r'
      '      ,fdc_tr_lst                 t'
      '  WHERE v.owner_object_id = :ID'
      '    AND v.ref_object_id   = r.id'
      '    AND r.doc_id          = t.id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002F000000040000004E414D450100000000000900000053484F52544E
      414D450100000000000E0000004F424A4543545F545950455F49440100000000
      000800000053544154455F49440100000000000B0000004143434553534C4556
      454C010000000000070000005359534E414D4501000000000008000000444553
      43524950540100000000000F0000004F574E45525F4F424A4543545F49440100
      0000000008000000545950454E414D450100000000000B000000545950455359
      534E414D450100000000000E0000004F424A4543544B494E444C495354010000
      0000000200000049440100000000000B0000004D4F444946595F444154450100
      000000000E000000435553544F4D5F4D4F44455F49440100000000000B000000
      43555252454E43595F49440100000000000A0000005355424A4543545F494401
      00000000000C000000435553544F4D535F434F44450100000000000800000052
      45475F44415445010000000000070000004445434C5F4E4F0100000000000D00
      00004445434953494F4E5F434F44450100000000000A000000444F435F4E554D
      42455201000000000008000000444F435F444154450100000000000900000049
      535F4143544956450100000000000F00000041435449564154494F4E5F444154
      45010000000000090000004445434C5F4E414D45010000000000080000004445
      434C5F494E4E010000000000080000004445434C5F4B50500100000000000C00
      0000434152524945525F4E414D450100000000000B000000434152524945525F
      494E4E0100000000000B000000434152524945525F4B50500100000000000700
      00004E554D5F4D504F01000000000005000000524547494D0100000000000900
      00004D4554485F4D4F56450100000000000A0000004F524445525F5459504501
      00000000000700000053554D5F5255420100000000000A000000434152524945
      525F4944010000000000090000004552525F434F554E540100000000000C0000
      004552525041595F434F554E540100000000000A000000444542545F434F554E
      5401000000000008000000414E4E5F444154450100000000000B000000504159
      4F46465F444154450100000000000C000000444154455F435245415445440100
      000000000C00000053544154455359534E414D45010000000000100000005041
      5954494D455F46494E49534845440100000000000E0000004F5045524154494F
      4E5F444154450100000000000C000000414E4E554C5F524541534F4E01000000
      000009000000444154455F45584543010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetTRBeforeQuery
    Session = MainData.Session
    Left = 96
    Top = 352
    object dsetTRNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetTRSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsetTROBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
      Required = True
    end
    object dsetTRSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsetTRACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsetTRSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsetTRDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsetTROWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsetTRTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Required = True
      Size = 1500
    end
    object dsetTRTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Required = True
      Size = 1500
    end
    object dsetTROBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object dsetTRID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetTRMODIFY_DATE: TDateTimeField
      FieldName = 'MODIFY_DATE'
      Required = True
    end
    object dsetTRCUSTOM_MODE_ID: TFloatField
      FieldName = 'CUSTOM_MODE_ID'
    end
    object dsetTRCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsetTRSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsetTRCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsetTRREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsetTRDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsetTRDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
    end
    object dsetTRDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetTRDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetTRIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Required = True
      Size = 1
    end
    object dsetTRACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsetTRDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsetTRDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsetTRDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsetTRCARRIER_NAME: TStringField
      FieldName = 'CARRIER_NAME'
      Size = 1500
    end
    object dsetTRCARRIER_INN: TStringField
      FieldName = 'CARRIER_INN'
      Size = 12
    end
    object dsetTRCARRIER_KPP: TStringField
      FieldName = 'CARRIER_KPP'
      Size = 10
    end
    object dsetTRNUM_MPO: TStringField
      FieldName = 'NUM_MPO'
      Size = 12
    end
    object dsetTRREGIM: TStringField
      FieldName = 'REGIM'
      Size = 2
    end
    object dsetTRMETH_MOVE: TStringField
      FieldName = 'METH_MOVE'
      Size = 3
    end
    object dsetTRORDER_TYPE: TStringField
      FieldName = 'ORDER_TYPE'
      Size = 1
    end
    object dsetTRSUM_RUB: TFloatField
      FieldName = 'SUM_RUB'
    end
    object dsetTRCARRIER_ID: TFloatField
      FieldName = 'CARRIER_ID'
    end
    object dsetTRERR_COUNT: TFloatField
      FieldName = 'ERR_COUNT'
    end
    object dsetTRERRPAY_COUNT: TFloatField
      FieldName = 'ERRPAY_COUNT'
    end
    object dsetTRDEBT_COUNT: TFloatField
      FieldName = 'DEBT_COUNT'
    end
    object dsetTRANN_DATE: TDateTimeField
      FieldName = 'ANN_DATE'
    end
    object dsetTRPAYOFF_DATE: TDateTimeField
      FieldName = 'PAYOFF_DATE'
    end
    object dsetTRDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsetTRSTATESYSNAME: TStringField
      FieldName = 'STATESYSNAME'
      Size = 1500
    end
    object dsetTRPAYTIME_FINISHED: TFloatField
      FieldName = 'PAYTIME_FINISHED'
    end
    object dsetTROPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
  end
  object dsTR: TDataSource
    AutoEdit = False
    DataSet = dsetTR
    Left = 144
    Top = 352
  end
end
