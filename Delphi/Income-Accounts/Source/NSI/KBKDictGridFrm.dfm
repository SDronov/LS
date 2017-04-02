inherited KBKDictGridForm: TKBKDictGridForm
  Width = 693
  HelpContext = 32
  Caption = #1050#1086#1076#1099' '#1041#1102#1076#1078#1077#1090#1085#1086#1081' '#1050#1083#1072#1089#1089#1080#1092#1080#1082#1072#1094#1080#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 685
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
      Width = 380
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 380
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 380
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 380
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 593
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 685
  end
  inherited pnlWorkspace: TPanel
    Width = 685
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Left = 64
          Top = 9
          Width = 184
        end
        object edtCode: TcxTextEdit [2]
          Left = 64
          Top = 33
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 181
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 2
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            CaptionOptions.Layout = clLeft
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1050#1086#1076
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 480
      inherited grdData: TcxGrid
        Width = 480
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 337
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            Width = 122
          end
          inherited grdDataDBBandedTableViewFULLCODE: TcxGridDBBandedColumn
            Hidden = True
          end
          inherited grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          object grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODE2'
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_FOR_REPORT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_FOR_REPORT'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 115
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited imglLarge: TImageList [3]
  end
  inherited BarManager: TdxBarManager [4]
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
      Caption = #1048#1084#1087#1086#1088#1090
      Category = 0
      Hint = #1048#1084#1087#1086#1088#1090' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' TAMPLAT.DBF'
      Visible = ivAlways
      ImageIndex = 8
    end
  end
  inherited ParamsHolder: TfdcParamsHolder [5]
  end
  inherited OfficeEditStyleController: TcxEditStyleController [6]
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController [7]
    Style.IsFontAssigned = True
  end
  inherited LookAndFeelController: TcxLookAndFeelController [8]
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController [9]
    Style.IsFontAssigned = True
  end
  inherited ActionList: TActionList [10]
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList [11]
  end
  inherited dsData: TfdcQuery [12]
    SQL.Strings = (
      'select *'
      '  from  fdc_KBK_Dict_Lst  t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))'
      'and code like NVL(:code, '#39'%'#39')')
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
      end>
    inherited dsDataCODE2: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
    end
    object dsDataIS_PREPAYMENTKBK: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' "'#1072#1074#1072#1085#1089#1072'"'
      FieldName = 'IS_PREPAYMENTKBK'
      Size = 1
    end
    object dsDataIS_FOR_REPORT: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1088#1072#1078#1077#1085#1080#1103' '#1074' '#1086#1090#1095#1077#1090#1077
      FieldName = 'IS_FOR_REPORT'
      Size = 1
    end
  end
  inherited srcData: TDataSource [13]
  end
  inherited imglAction: TImageList [14]
  end
end
