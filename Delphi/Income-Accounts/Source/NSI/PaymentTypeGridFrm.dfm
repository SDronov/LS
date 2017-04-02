inherited PaymentTypeGridForm: TPaymentTypeGridForm
  HelpContext = 32
  Caption = #1042#1080#1076#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
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
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 2
        end
        object edtCode: TcxTextEdit [3]
          Left = 9
          Top = 63
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 98
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1050#1086#1076
            CaptionOptions.Layout = clTop
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewFULLCODE: TcxGridDBBandedColumn
            Hidden = True
          end
        end
      end
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList [3]
  end
  inherited dsData: TfdcQuery [4]
    SQL.Strings = (
      'select *'
      '  from  FDC_Payment_Type_lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))'
      ' and (:code is null or :code = t.code)')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dat'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end>
  end
  inherited srcData: TDataSource [5]
  end
  inherited imglAction: TImageList [6]
  end
  inherited OfficeEditStyleController: TcxEditStyleController [7]
    Style.IsFontAssigned = True
  end
  inherited imglLarge: TImageList [8]
  end
  inherited BarManager: TdxBarManager [9]
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
            Item = biDate
            UserDefine = [udWidth]
            UserWidth = 116
            Visible = True
          end
          item
            Item = dxBarButton1
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
      Action = acImport
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder [10]
  end
  inherited ActionList: TActionList [11]
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    object acImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090
      Hint = #1048#1084#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' TAMPLAT.DBF'
      ImageIndex = 8
      OnExecute = acImportExecute
    end
  end
  inherited WebEditStyleController: TcxEditStyleController [12]
    Style.IsFontAssigned = True
  end
  inherited LookAndFeelController: TcxLookAndFeelController [13]
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController [14]
    Style.IsFontAssigned = True
  end
end
