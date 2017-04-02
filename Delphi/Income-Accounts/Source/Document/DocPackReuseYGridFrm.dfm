inherited DocPackReuseYGridForm: TDocPackReuseYGridForm
  Left = 446
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1093' '#1079#1072#1095#1105#1090#1086#1074' '#1084#1077#1078#1076#1091' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084#1080' '#1086#1088#1075#1072#1085#1072#1084#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 501
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 501
      end
      inherited pnlProgress: TPanel
        Width = 501
        inherited lblProgress: TcxLabel
          Width = 501
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 711
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtFromDate: TcxDateEdit
          Width = 109
        end
        inherited edtToDate: TcxDateEdit
          Width = 109
        end
        inherited edtNomer: TcxTextEdit
          Width = 109
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewIS_RECIEVED: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewRECIEVE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Visible = True
            Position.ColIndex = 15
          end
          object grdDataDBBandedTableViewDestination: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTINATION'
            Width = 93
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumnCUSTOMS_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIncomeDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_INCOMING'
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    object actCreateConfirmPacks: TAction
      Category = 'Object'
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1077#1089#1090#1088#1099' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1093' '#1087#1077#1088#1077#1079#1072#1095#1077#1090#1086#1074
      OnExecute = actCreateConfirmPacksExecute
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
            Item = btnCreatePacks
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxbcTO
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
    object btnCreatePacks: TdxBarButton
      Action = actCreateConfirmPacks
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.name AS state_name'
      
        '      ,p_nsi_customs.GetCustomsFullNameByCode8( t.destination ) ' +
        'AS customs_name'
      '  from fdc_doc_pack_reuse_y_lst t'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = t.state_id'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.destination = :customs_c' +
        'ode)'
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)')
    SourceServerObject = 'FDC_DOC_PACK_REUSE_Y_LST'
    object dsDataDATE_INCOMING: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'DATE_INCOMING'
    end
    object dsDataDESTINATION: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 30
      FieldName = 'DESTINATION'
      Size = 8
    end
    object dsDataCUSTOMS_NAME: TStringField
      DisplayLabel = #1058#1054' - '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
  end
  object pkgCommon: TOraclePackage
    Session = MainData.Session
    Cursor = crSQLWait
    Left = 56
    Top = 174
  end
end
