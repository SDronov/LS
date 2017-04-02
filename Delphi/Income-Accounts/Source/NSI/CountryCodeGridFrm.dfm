inherited CountryCodeGridForm: TCountryCodeGridForm
  Left = 400
  Top = 291
  Width = 869
  Caption = #1050#1086#1076#1099' '#1089#1090#1088#1072#1085
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 861
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
      Width = 556
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 556
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 556
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 556
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 769
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 861
  end
  inherited pnlWorkspace: TPanel
    Width = 861
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 4
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        object edtCode: TcxTextEdit [2]
          Left = 9
          Top = 63
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 181
        end
        object edtCode2: TcxTextEdit [3]
          Left = 9
          Top = 102
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 181
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 3
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciCode: TdxLayoutItem [1]
            Caption = #1050#1086#1076
            CaptionOptions.Layout = clTop
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1081' '#1082#1086#1076
            CaptionOptions.Layout = clTop
            Control = edtCode2
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 656
      inherited grdData: TcxGrid
        Width = 656
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewFULLCODE: TcxGridDBBandedColumn
            Hidden = True
          end
          inherited grdDataDBBandedTableViewSDATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewEDATE: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          object grdDataDBBandedTableViewCODE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODE2'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actImport: TAction
      Caption = 'actImport'
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
            Item = biDate
            UserDefine = [udWidth]
            UserWidth = 124
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnImport
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
    object btnImport: TdxBarButton
      Action = actImport
      Caption = #1048#1084#1087#1086#1088#1090
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarToolbarsListItem1: TdxBarToolbarsListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_country_code_lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      ' and (:Code is null or upper(Code) like upper(:Code))'
      ' and (:Code2 is null or upper(Code2) like upper(:Code2))'
      
        ' and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date' +
        '('#39'31123000'#39', '#39'ddmmyyyy'#39'))')
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
        DataType = ftString
        Name = 'Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Code2'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dat'
        ParamType = ptUnknown
      end>
    inherited dsDataCODE2: TStringField
      DisplayLabel = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1081' '#1082#1086#1076
    end
  end
end
