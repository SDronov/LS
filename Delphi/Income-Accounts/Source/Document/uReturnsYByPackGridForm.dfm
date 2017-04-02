inherited fReturnsYByPackGridForm: TfReturnsYByPackGridForm
  Left = 321
  Top = 285
  Width = 758
  Height = 457
  Caption = 'fReturnsYByPackGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 398
    Width = 750
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Top = 2
      Width = 444
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 444
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 444
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 444
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 657
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 395
    Width = 750
  end
  inherited pnlWorkspace: TPanel
    Width = 750
    Height = 367
    inherited splSearchCriteria: TSplitter
      Height = 367
    end
    inherited pnlSearchCriteria: TPanel
      Height = 367
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 347
        inherited btnSearch: TcxButton
          Top = 316
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 287
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 545
      Height = 367
      inherited grdData: TcxGrid
        Width = 545
        Height = 367
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1091#1089
            DataBinding.FieldName = 'STATE_NAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_SYSNAME'
            Visible = False
            Hidden = True
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1079#1072#1103#1074#1082#1080
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1082#1080
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
            DataBinding.FieldName = 'CURR_CODE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'PO_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'PO_INN'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'PO_KPP'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_DOC_NO: TcxGridDBBandedColumn
            Caption = #8470' '#1088#1077#1096#1077#1085#1080#1103
            DataBinding.FieldName = 'DECISION_DOC_NO'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_DOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
            DataBinding.FieldName = 'DECISION_DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_BIC: TcxGridDBBandedColumn
            Caption = #1041#1048#1050
            DataBinding.FieldName = 'DECISION_BIC'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_BANK_NAME: TcxGridDBBandedColumn
            Caption = #1041#1072#1085#1082
            DataBinding.FieldName = 'DECISION_BANK_NAME'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_CORR_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1050#1086#1088#1088'. '#1089#1095#1105#1090
            DataBinding.FieldName = 'DECISION_CORR_ACCOUNT'
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1041#1077#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1105#1090
            DataBinding.FieldName = 'DECISION_ACCOUNT'
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_PERSONAL_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1105#1090
            DataBinding.FieldName = 'DECISION_PERSONAL_ACCOUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_DATE_LAST_DOC: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DECISION_DATE_LAST_DOC'
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_RET_DOC_NO: TcxGridDBBandedColumn
            Caption = #8470' '#1088#1077#1077#1089#1090#1088#1072
            DataBinding.FieldName = 'REG_RET_DOC_NO'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_RET_DOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
            DataBinding.FieldName = 'REG_RET_DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_RET_DOC_SEND: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1077#1089#1090#1088#1072
            DataBinding.FieldName = 'REG_RET_DOC_SEND'
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn
            Caption = #1058#1054
            DataBinding.FieldName = 'CUSTOMSFULLNAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBKCODE'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCNFRM_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CNFRM_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCNFRM_ACTTIVATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'CNFRM_ACTTIVATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCNFRM_IS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'CNFRM_IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCNFRM_DOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'CNFRM_DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCNFRM_DOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'CNFRM_DOC_NUMBER'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEC_PAY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_PAY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    object aDoForm: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      OnExecute = aDoFormExecute
      OnUpdate = aDoFormUpdate
    end
    object actDecisionOpen: TAction
      Category = 'Object'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1088#1077#1096#1077#1085#1080#1077'...'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
      OnExecute = actDecisionOpenExecute
      OnUpdate = actDecisionOpenUpdate
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
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            Item = btnDoForm
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      28
      0)
    object btnDoForm: TdxBarButton
      Action = aDoForm
      Category = 0
    end
    object barBtnDecisionOpen: TdxBarButton
      Action = actDecisionOpen
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT pb.*'
      '      ,dp.id              AS cnfrm_id'
      '      ,dp.activation_date AS cnfrm_acttivation_date'
      '      ,dp.is_active       AS cnfrm_is_active'
      '      ,dp.doc_date        AS cnfrm_doc_date'
      '      ,dp.doc_number      AS cnfrm_doc_number'
      '      ,s.name             AS state_name'
      '      ,s.sysname          AS state_sysname'
      '      ,dp.is_ts'
      '  FROM fdc_po_payback_y_lst          dp'
      '      ,fdc_rel_pack_docs_lst         r'
      '      ,fdc_payment_order_payback_lst pb'
      '      ,fdc_object_lst                s'
      '  WHERE r.object_id = :id'
      '    AND dp.id       = r.rel_object_id'
      '    AND pb.id       = dp.confirmed_doc_id'
      '    AND s.id        = pb.state_id')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataOPERATE_DATE: TDateTimeField
      FieldName = 'OPERATE_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
    end
    object dsDataEXEC_DATE: TDateTimeField
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCASHDESK_ID: TFloatField
      FieldName = 'CASHDESK_ID'
    end
    object dsDataCARDNUM: TStringField
      FieldName = 'CARDNUM'
      Size = 0
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataAGREEMENT_ID: TFloatField
      FieldName = 'AGREEMENT_ID'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 0
    end
    object dsDataINCOME_DATE: TDateTimeField
      FieldName = 'INCOME_DATE'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Size = 25
    end
    object dsDataACCOUNT_K: TStringField
      FieldName = 'ACCOUNT_K'
    end
    object dsDataBIC_K: TStringField
      FieldName = 'BIC_K'
      Size = 9
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
    end
    object dsDataPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataCASHDESK_NAME: TStringField
      FieldName = 'CASHDESK_NAME'
      Size = 0
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataREST_SUMMA: TFloatField
      FieldName = 'REST_SUMMA'
    end
    object dsDataLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
    end
    object dsDataCOMING_DATE: TDateTimeField
      FieldName = 'COMING_DATE'
    end
    object dsDataASSURE_DATE: TDateTimeField
      FieldName = 'ASSURE_DATE'
    end
    object dsDataDESCRIPT2: TStringField
      FieldName = 'DESCRIPT2'
      Size = 0
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 1500
    end
    object dsDataPO_INN: TStringField
      FieldName = 'PO_INN'
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      FieldName = 'PO_KPP'
      Size = 10
    end
    object dsDataS_NAME: TStringField
      FieldName = 'S_NAME'
      Size = 1500
    end
    object dsDataS_INN: TStringField
      FieldName = 'S_INN'
      Size = 12
    end
    object dsDataS_KPP: TStringField
      FieldName = 'S_KPP'
      Size = 10
    end
    object dsDataDEC_PAY_ID: TFloatField
      FieldName = 'DEC_PAY_ID'
    end
    object dsDataDECISION_DOC_NO: TStringField
      FieldName = 'DECISION_DOC_NO'
      Size = 100
    end
    object dsDataDECISION_DOC_DATE: TDateTimeField
      FieldName = 'DECISION_DOC_DATE'
    end
    object dsDataDECISION_BIC: TStringField
      FieldName = 'DECISION_BIC'
      Size = 10
    end
    object dsDataDECISION_BANK_NAME: TStringField
      FieldName = 'DECISION_BANK_NAME'
      Size = 4000
    end
    object dsDataDECISION_CORR_ACCOUNT: TStringField
      FieldName = 'DECISION_CORR_ACCOUNT'
    end
    object dsDataDECISION_ACCOUNT: TStringField
      FieldName = 'DECISION_ACCOUNT'
    end
    object dsDataDECISION_PERSONAL_ACCOUNT: TStringField
      FieldName = 'DECISION_PERSONAL_ACCOUNT'
    end
    object dsDataDECISION_DATE_LAST_DOC: TDateTimeField
      FieldName = 'DECISION_DATE_LAST_DOC'
    end
    object dsDataREG_RET_ID: TFloatField
      FieldName = 'REG_RET_ID'
    end
    object dsDataREG_RET_DOC_NO: TStringField
      FieldName = 'REG_RET_DOC_NO'
      Size = 100
    end
    object dsDataREG_RET_DOC_DATE: TDateTimeField
      FieldName = 'REG_RET_DOC_DATE'
    end
    object dsDataREG_RET_DOC_SEND: TDateTimeField
      FieldName = 'REG_RET_DOC_SEND'
    end
    object dsDataACTIVATION_DATE_Y: TDateTimeField
      FieldName = 'ACTIVATION_DATE_Y'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataSEQ_PAYMENT: TStringField
      FieldName = 'SEQ_PAYMENT'
      Size = 1
    end
    object dsDataKIND_PAYMENT: TStringField
      FieldName = 'KIND_PAYMENT'
      Size = 1
    end
    object dsDataRECIPIENT_ID: TFloatField
      FieldName = 'RECIPIENT_ID'
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      FieldName = 'DESTCUSTOMSCODE'
      Size = 10
    end
    object dsDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsDataKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDataCUSTOMSFULLNAME: TStringField
      FieldName = 'CUSTOMSFULLNAME'
      Size = 4000
    end
    object dsDataCNFRM_ID: TFloatField
      FieldName = 'CNFRM_ID'
    end
    object dsDataCNFRM_ACTTIVATION_DATE: TDateTimeField
      FieldName = 'CNFRM_ACTTIVATION_DATE'
    end
    object dsDataCNFRM_IS_ACTIVE: TStringField
      FieldName = 'CNFRM_IS_ACTIVE'
      Size = 1
    end
    object dsDataCNFRM_DOC_DATE: TDateTimeField
      FieldName = 'CNFRM_DOC_DATE'
    end
    object dsDataCNFRM_DOC_NUMBER: TStringField
      FieldName = 'CNFRM_DOC_NUMBER'
      Size = 100
    end
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  inherited pmnGridDataDBBandedTableView: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = barBtnDecisionOpen
        Visible = True
      end
      item
        Item = btnSearchOk
        Visible = True
      end
      item
        Item = btnSearchCancel
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnAdd
        Visible = True
      end
      item
        Item = btnOpen
        Visible = True
      end
      item
        Item = btnRefresh
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnView
        Visible = True
      end
      item
        Item = btnFilter
        Visible = True
      end
      item
        Item = btnSwitchSearchCriteria
        Visible = True
      end
      item
        Item = btnCopySelection
        Visible = True
      end
      item
        Item = btnCopyAll
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnDelete
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnSaveToFile
        Visible = True
      end>
  end
  object pkgDocPackReturnsY: TOraclePackage
    Session = MainData.Session
    PackageName = 'p_DocPack_ReturnsY'
    Cursor = crSQLWait
    Left = 104
    Top = 174
  end
  object dsDocPackState: TOracleDataSet
    SQL.Strings = (
      'SELECT 0 AS f'
      '  FROM fdc_doc_pack_returns_y_lst y'
      '      ,fdc_state_lst              s'
      '  WHERE y.id = :id'
      '    AND y.state_id = s.id'
      '    AND s.SysName  = '#39'State.PackReturnsY.Form'#39)
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 221
    Top = 162
  end
end
