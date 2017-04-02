inherited DebtReasonGridForm: TDebtReasonGridForm
  Left = 314
  Top = 277
  Width = 758
  Caption = #1055#1088#1080#1095#1080#1085#1099' '#1074#1086#1079#1085#1080#1082#1085#1086#1074#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 750
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 445
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 445
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 445
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 445
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 658
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 750
  end
  inherited pnlWorkspace: TPanel
    Width = 750
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 545
      inherited grdData: TcxGrid
        Width = 545
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
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
      '  from fdc_debt_reason_Lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))')
  end
end
