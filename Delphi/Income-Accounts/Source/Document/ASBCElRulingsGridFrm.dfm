inherited ASBCElRulingsGridForm: TASBCElRulingsGridForm
  Left = 242
  Top = 388
  Width = 1076
  Height = 551
  HelpContext = 432
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1095#1080#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074'-'#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 491
    Width = 1060
    Height = 22
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 20
      inherited lblRecordCount: TcxLabel
        Height = 20
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 20
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 757
      Height = 20
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 757
        Height = 20
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 20
        end
      end
      inherited pnlProgress: TPanel
        Width = 757
        Height = 20
        inherited lblProgress: TcxLabel
          Height = 20
          Width = 757
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 967
      Height = 20
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 488
    Width = 1060
  end
  inherited pnlWorkspace: TPanel
    Width = 1060
    Height = 460
    inherited splSearchCriteria: TSplitter
      Height = 460
    end
    inherited pnlSearchCriteria: TPanel
      Height = 460
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 440
        inherited btnSearch: TcxButton
          Top = 409
          TabOrder = 12
        end
        inherited edtName: TcxTextEdit
          Top = 218
          TabOrder = 6
          Width = 183
        end
        inherited edtINN: TcxTextEdit
          Top = 236
          TabOrder = 7
          Width = 111
        end
        inherited edtKPP: TcxTextEdit
          Top = 254
          TabOrder = 8
          Width = 111
        end
        inherited edtCustomsCode: TcxTextEdit
          Width = 111
        end
        inherited edtFrom: TcxDateEdit
          Top = 114
          TabOrder = 3
          Width = 111
        end
        inherited edtTo: TcxDateEdit
          Top = 132
          TabOrder = 4
          Width = 111
        end
        inherited edtNo: TcxTextEdit
          Top = 96
          TabOrder = 2
          Width = 111
        end
        inherited edtGoodsCode: TcxMaskEdit
          Top = 322
          TabOrder = 9
          Width = 102
        end
        inherited edtGoodsPref: TcxTextEdit
          Top = 340
          TabOrder = 10
          Width = 102
        end
        inherited edtDocType: TcxMaskEdit
          Width = 76
        end
        inherited btnSearchClear: TcxButton
          Top = 380
          TabOrder = 11
        end
        object edtUIN: TcxTextEdit [12]
          Left = 81
          Top = 150
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 99
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            inherited lcSearchCriteriaItem10: TdxLayoutItem
              Visible = False
            end
            inherited lcSearchCriteriaItem3: TdxLayoutItem
              Visible = False
            end
            inherited lcSearchCriteriaItem6: TdxLayoutItem [2]
            end
            inherited lcSearchCriteriaItem4: TdxLayoutItem [3]
            end
            inherited lcSearchCriteriaItem5: TdxLayoutItem [4]
            end
            object lcSearchCriteriaItem11: TdxLayoutItem
              Caption = #1059#1048#1053
              Control = edtUIN
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgSubject: TdxLayoutGroup
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
          end
          inherited lcgGoods: TdxLayoutGroup
            Visible = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 855
      Height = 460
      inherited grdData: TcxGrid
        Width = 855
        Height = 460
        inherited grdDataDBTableView: TcxGridDBTableView
          object grdDataDBTableViewID1: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
          end
          object grdDataDBTableViewNAME1: TcxGridDBColumn
            DataBinding.FieldName = 'NAME'
          end
          object grdDataDBTableViewSHORTNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SHORTNAME'
          end
          object grdDataDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
          end
          object grdDataDBTableViewSTATE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'STATE_ID'
          end
          object grdDataDBTableViewACCESSLEVEL: TcxGridDBColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
          end
          object grdDataDBTableViewSYSNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SYSNAME'
          end
          object grdDataDBTableViewDESCRIPT1: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPT'
          end
          object grdDataDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
          end
          object grdDataDBTableViewTYPENAME1: TcxGridDBColumn
            DataBinding.FieldName = 'TYPENAME'
          end
          object grdDataDBTableViewTYPESYSNAME1: TcxGridDBColumn
            DataBinding.FieldName = 'TYPESYSNAME'
          end
          object grdDataDBTableViewMODIFY_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'MODIFY_DATE'
          end
          object grdDataDBTableViewG011: TcxGridDBColumn
            DataBinding.FieldName = 'G011'
          end
          object grdDataDBTableViewCUSTOM_MODE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'CUSTOM_MODE_ID'
          end
          object grdDataDBTableViewOKPO: TcxGridDBColumn
            DataBinding.FieldName = 'OKPO'
          end
          object grdDataDBTableViewINN: TcxGridDBColumn
            DataBinding.FieldName = 'INN'
          end
          object grdDataDBTableViewG12: TcxGridDBColumn
            DataBinding.FieldName = 'G12'
          end
          object grdDataDBTableViewCURRENCY_ID: TcxGridDBColumn
            DataBinding.FieldName = 'CURRENCY_ID'
          end
          object grdDataDBTableViewG444A: TcxGridDBColumn
            DataBinding.FieldName = 'G444A'
          end
          object grdDataDBTableViewG444B: TcxGridDBColumn
            DataBinding.FieldName = 'G444B'
          end
          object grdDataDBTableViewG447A: TcxGridDBColumn
            DataBinding.FieldName = 'G447A'
          end
          object grdDataDBTableViewG447B: TcxGridDBColumn
            DataBinding.FieldName = 'G447B'
          end
          object grdDataDBTableViewK115: TcxGridDBColumn
            DataBinding.FieldName = 'K115'
          end
          object grdDataDBTableViewG40: TcxGridDBColumn
            DataBinding.FieldName = 'G40'
          end
          object grdDataDBTableViewSUBJECT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SUBJECT_ID'
          end
          object grdDataDBTableViewG221: TcxGridDBColumn
            DataBinding.FieldName = 'G221'
          end
          object grdDataDBTableViewCUSTOMS_CODE: TcxGridDBColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
          end
          object grdDataDBTableViewREG_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'REG_DATE'
          end
          object grdDataDBTableViewDECL_NO: TcxGridDBColumn
            DataBinding.FieldName = 'DECL_NO'
          end
          object grdDataDBTableViewACT_NO: TcxGridDBColumn
            DataBinding.FieldName = 'ACT_NO'
          end
          object grdDataDBTableViewGD1: TcxGridDBColumn
            DataBinding.FieldName = 'GD1'
          end
          object grdDataDBTableViewEXPORT_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'EXPORT_DATE'
          end
          object grdDataDBTableViewTAX_EXEMPTION: TcxGridDBColumn
            DataBinding.FieldName = 'TAX_EXEMPTION'
          end
          object grdDataDBTableViewPAYED_MONTHS: TcxGridDBColumn
            DataBinding.FieldName = 'PAYED_MONTHS'
          end
          object grdDataDBTableViewNEXT_PAY_MONTH: TcxGridDBColumn
            DataBinding.FieldName = 'NEXT_PAY_MONTH'
          end
        end
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUM_RUB
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewCHARGED
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAYED
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOCNUMB'
            Width = 120
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.Nullable = True
            Visible = False
          end
          object grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn [6]
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'CHARGED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 109
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn [7]
            Caption = #1059#1087#1083#1072#1095#1077#1085#1086
            DataBinding.FieldName = 'PAYED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 105
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
            Visible = False
            Width = 108
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            Visible = False
            Width = 178
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
            Visible = False
            Width = 119
          end
          inherited grdDataDBBandedTableViewNUM_MPO: TcxGridDBBandedColumn
            DataBinding.ValueType = ''
            DataBinding.FieldName = ''
          end
          inherited grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOCDATE'
            Visible = True
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 29
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'DATE_CREATED'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object colIN_WAIT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IN_WAIT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object colCarrier_Name: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'CARRIER_NAME'
            Visible = False
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object colCarrier_INN: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1048#1053#1053
            DataBinding.FieldName = 'CARRIER_INN'
            Visible = False
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object colCarrier_KPP: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1050#1055#1055
            DataBinding.FieldName = 'CARRIER_KPP'
            Visible = False
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object columnIsActive: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object columnActivationDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object colAnnulReason: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ANNUL_REASON'
            Visible = False
            Width = 88
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERR_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewsJURPERSON: TcxGridDBBandedColumn
            Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
            DataBinding.FieldName = 'sJURPERSON'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.DisplayGrayed = 'False'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewsPERSON_NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            DataBinding.FieldName = 'DECL_NAME'
            Width = 82
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnINN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'inn'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnKPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'kpp'
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnsPASSPORT: TcxGridDBBandedColumn
            Caption = #1088#1077#1082#1074#1080#1079#1080#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'sPASSPORT'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 38
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnsKBK: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'sKBK'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnnDECL_SUM: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'nDECL_SUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 40
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumnsPAYMENT: TcxGridDBBandedColumn
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1087'/'#1087
            DataBinding.FieldName = 'sPAYMENT'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 41
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnsVALDOC: TcxGridDBBandedColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086' '#1087#1088#1077#1082#1088#1072#1097#1077#1085#1080#1080
            DataBinding.FieldName = 'sVALDOC'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 42
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnEXPIRYDATE: TcxGridDBBandedColumn
            Caption = #1057#1088#1086#1082' '#1076#1086#1073#1088#1086#1074#1086#1083#1100#1085#1086#1081' '#1091#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'EXPIRYDATE'
            Position.BandIndex = 0
            Position.ColIndex = 43
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewColumnsstatus: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SSTATUS'
            Position.BandIndex = 0
            Position.ColIndex = 44
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
            DataBinding.FieldName = 'REG_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 45
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
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
            BeginGroup = True
            Item = FinesForm10004
            Visible = True
          end
          item
            Item = cmbxCustCode
            Visible = True
          end
          item
            Item = btnCorrect
            Visible = True
          end
          item
            Item = dxViewType
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 90
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
    inherited cmbxCustCode: TdxBarCombo
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1058#1055#1054' '#1090#1086#1083#1100#1082#1086' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1082#1086#1076#1086#1084' '#1090#1072#1084#1086#1078#1085#1080
    end
    inherited cmbxViewMode: TdxBarCombo
      Hint = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      Items.Strings = (
        #1042#1089#1077
        #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
        #1054#1087#1083#1072#1095#1077#1085#1085#1099#1077
        #1047#1072#1082#1088#1099#1090#1099#1077)
    end
    object dxViewType: TdxBarCombo
      Caption = #1058#1080#1087
      Category = 2
      Hint = #1058#1080#1087
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = dxViewTypeChange
      ShowCaption = True
      Width = 130
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077
        #1064#1090#1088#1072#1092#1099
        #1042#1086#1079#1084#1077#1097#1077#1085#1080#1077
        #1048#1084#1091#1097#1077#1089#1090#1074#1086)
      ItemIndex = 0
    end
    object FinesForm10004: TdxBarButton
      Caption = #1054#1090#1095#1077#1090' '#1076#1083#1103' '#1040#1055#1057' "'#1064#1090#1088#1072#1092#1099'"'
      Category = 0
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090' '#1076#1083#1103' '#1040#1055#1057' "'#1064#1090#1088#1072#1092#1099'"'
      Visible = ivAlways
      OnClick = FinesForm10004Click
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 152
    Top = 147
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select /*+ FIRST_ROWS(500)*/ a.*'
      'from ('
      '      select  t.*'
      '---------------- '#1044#1083#1103' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1072#1085#1094#1077#1089#1090#1086#1088#1072'-------------------'
      '          , 0 NUM_MPO'
      '           ,0 SUM_RUB'
      '           ,'#39#39' REGIM'
      '          ,'#39#39' METH_MOVE'
      
        '----------------------------------------------------------------' +
        '--------------------'
      '         ,p_doc_charge.GetDocChargeSum( t.id ) charged'
      '         ,p_doc_charge.GetDocDeductionSum( t.id ) payed'
      
        '           ,trim(t.valdoc_numb||nvl2(t.valdoc_date,'#39' '#1086#1090' '#39'||to_ch' +
        'ar(t.valdoc_date,'#39'dd.mm.yyyy'#39'),'#39#39')) svaldoc'
      
        '          ,decode (t.status,0,'#39#1044#1077#1081#1089#1090#1074#1091#1077#1090#39',1,'#39#1055#1088#1077#1082#1088#1072#1097#1077#1085#1086#39') sstatu' +
        's'
      
        '          ,decode(t.rulingtype,0,decode(t.VALDOC_TYPE,0,'#39#1040#1082#1090' '#1086' '#1087 +
        #1088#1077#1082#1088#1072#1097#1077#1085#1080#1080' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103#39',1,'#39#1040#1082#1090' '#1086' '#1089#1087#1080#1089#1072#1085#1080#1080' '#1079#1072#1076#1086#1083#1078#1077#1085#1085 +
        #1086#1089#1090#1080#39'), null) svaldoc_type'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39','#39#1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#39',decode(t.' +
        'StateSysName,'#39'PayOff'#39','#39#1055#1086#1075#1072#1096#1077#1085#39',decode(t.payoff_date,null,null,'#39 +
        #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086#39'))) annul_name'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39',t.ann_date,t.payoff_dat' +
        'e) annul_date'
      
        '          ,nvl((select 1 from dual where t.err_count=0 and t.err' +
        'pay_count=1 and t.debt_count=0),0) in_wait'
      
        '         ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_a' +
        'rchive'
      '        from asbc_elrulings_lst t'
      '       where t.Customs_Code > '#39' '#39
      '/*$ p#cust_code#*/ and t.Customs_Code like NVL(:cust_code, '#39'%'#39')'
      '/*$p#decl_no#*/    and t.Decl_No like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      '/*$p#uin#*/        and trim(upper(t.uin)) like trim(upper(:UIN))'
      
        '    and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID' +
        ')'
      
        '    and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088 +
        #1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      
        '--        order by t.Customs_Code desc, t.Reg_Date desc, t.Decl_' +
        'No desc'
      '    and rownum <= :MaxRecordCount'
      ') a'
      'where 1=1 '
      '--$s#viewmode#0*/ and 1=1'
      '--$s#viewmode#1*/ and a.charged != a.payed'
      '--$s#viewmode#2*/ and a.charged = a.payed'
      
        '--$s#viewmode#3*/ and a.rulingtype = 0 and a.valdoc_date is not ' +
        'null'
      'and (:NA = 0 or '
      #9'   :NA = 1 and a.rulingtype = 0 OR'
      #9'   :NA = 2 and a.rulingtype = 1 or'
      '     :NA = 3 and a.rulingtype in (2,3,4)'
      '     )'
      '')
    ParamData = <
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end>
    inherited dsDataOPERATION_DATE: TDateTimeField [13]
    end
    inherited dsDataDECL_NAME: TStringField [14]
    end
    inherited dsDataDECL_KPP: TStringField [15]
    end
    inherited dsDataERR_COUNT: TFloatField [16]
    end
    inherited dsDataCUSTOMS_CODE: TStringField [17]
    end
    inherited dsDataREG_DATE: TDateTimeField [18]
    end
    inherited dsDataDECL_NO: TStringField [19]
    end
    inherited dsDataDEBT_COUNT: TFloatField [20]
    end
    inherited dsDataOBJKINDLABEL: TStringField [21]
    end
    inherited dsDataNUM_MPO: TStringField
      Visible = False
    end
    inherited dsDataDOC_TYPE: TStringField
      DisplayWidth = 8
      Size = 20
    end
    object dsDataANNUL_NAME: TStringField
      FieldName = 'ANNUL_NAME'
      Size = 16
    end
    object dsDataANNUL_DATE: TDateTimeField
      FieldName = 'ANNUL_DATE'
    end
    object dsDataDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsDataIN_WAIT: TIntegerField
      FieldName = 'IN_WAIT'
    end
    object dsDataAS_BIG_PAYER: TIntegerField
      FieldName = 'AS_BIG_PAYER'
    end
    object dsDataCARRIER_NAME: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'CARRIER_NAME'
      Size = 1500
    end
    object dsDataCARRIER_INN: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1048#1053#1053
      FieldName = 'CARRIER_INN'
      Size = 12
    end
    object dsDataCARRIER_KPP: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1050#1055#1055
      FieldName = 'CARRIER_KPP'
      Size = 10
    end
    object dsDataCARRIER_ID: TFloatField
      FieldName = 'CARRIER_ID'
    end
    object dsDataCHARGED: TFloatField
      FieldName = 'CHARGED'
    end
    object dsDataPAYED: TFloatField
      FieldName = 'PAYED'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataANNUL_REASON: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1080#1103
      FieldName = 'ANNUL_REASON'
      Size = 4000
    end
    object dsDataIS_ARCHIVE: TStringField
      DisplayLabel = #1040#1088#1093#1080#1074#1085#1099#1081
      DisplayWidth = 20
      FieldName = 'IS_ARCHIVE'
    end
    object dsDataSSTATUS: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      FieldName = 'SSTATUS'
    end
    object dsDataVALDOC_NUMB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VALDOC_NUMB'
      Size = 10
    end
    object dsDataVALDOC_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VALDOC_DATE'
    end
    object dsDatasJURPERSON: TStringField
      FieldName = 'sJURPERSON'
    end
    object dsDatasPERSON_NAME: TStringField
      FieldName = 'sPERSON_NAME'
    end
    object dsDatainn: TStringField
      FieldName = 'inn'
    end
    object dsDatakpp: TStringField
      FieldName = 'kpp'
    end
    object dsDatasPASSPORT: TStringField
      FieldName = 'sPASSPORT'
    end
    object dsDatasKBK: TStringField
      FieldName = 'sKBK'
    end
    object dsDatanDECL_SUM: TFloatField
      FieldName = 'nDECL_SUM'
    end
    object dsDatasPAYMENT: TStringField
      FieldName = 'sPAYMENT'
    end
    object dsDatasVALDOC: TStringField
      FieldName = 'sVALDOC'
    end
    object dsDataEXPIRYDATE: TDateTimeField
      FieldName = 'EXPIRYDATE'
    end
    object dsDataDOCNUMB: TStringField
      FieldName = 'DOCNUMB'
    end
    object dsDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
  end
  object dsFinesForm10004: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  pkg_asbc_fine.form_10004;'
      'end;')
    Left = 112
    Top = 96
  end
end
