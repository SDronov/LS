inherited AssetsReasonGridForm: TAssetsReasonGridForm
  Width = 895
  Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1103' '#1076#1083#1103' '#1074#1086#1079#1074#1088#1072#1090#1086#1074'\'#1079#1072#1095#1077#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 887
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 582
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 582
      end
      inherited pnlProgress: TPanel
        Width = 582
        inherited lblProgress: TcxLabel
          Width = 582
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 795
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 887
  end
  inherited pnlWorkspace: TPanel
    Width = 887
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 682
      inherited grdData: TcxGrid
        Width = 682
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn [6]
            Caption = #1057#1090#1072#1090#1100#1103' '#1058#1050
            DataBinding.FieldName = 'CODE2'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOCUM: TcxGridDBBandedColumn [7]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'DOCUM'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actImport: TAction
      Category = 'Data'
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093' '#1080#1079' DBF-'#1092#1072#1081#1083#1072
      ImageIndex = 8
      OnExecute = actImportExecute
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
            Item = dxBarButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = biDate
            UserDefine = [udWidth]
            UserWidth = 124
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
      26
      0)
    object dxBarButton1: TdxBarButton
      Action = actImport
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_assets_reason_lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))')
    object dsDataDOCUM: TStringField [14]
      FieldName = 'DOCUM'
    end
  end
end
