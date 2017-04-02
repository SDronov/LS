inherited CustomModeGridForm: TCustomModeGridForm
  Width = 759
  Caption = #1050#1086#1076#1099' '#1058#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1088#1086#1094#1077#1076#1091#1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 751
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 445
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 445
      end
      inherited pnlProgress: TPanel
        Width = 445
        inherited lblProgress: TcxLabel
          Width = 445
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 658
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 751
  end
  inherited pnlWorkspace: TPanel
    Width = 751
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 148
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 546
      inherited grdData: TcxGrid
        Width = 546
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
      28
      0)
    object dxBarButton1: TdxBarButton
      Action = actImport
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Custom_Mode_Lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))')
  end
end
