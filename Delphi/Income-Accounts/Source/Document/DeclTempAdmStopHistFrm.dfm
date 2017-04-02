inherited DeclTempAdmStopHistForm: TDeclTempAdmStopHistForm
  Left = 296
  Top = 220
  Width = 857
  Height = 509
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 459
    Width = 849
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 543
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 543
      end
      inherited pnlProgress: TPanel
        Width = 543
        inherited lblProgress: TcxLabel
          Width = 543
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 756
      Width = 77
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 456
    Width = 849
    Height = 3
  end
  inherited pnlWorkspace: TPanel
    Width = 849
    Height = 428
    inherited splSearchCriteria: TSplitter
      Height = 428
    end
    inherited pnlSearchCriteria: TPanel
      Height = 428
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 408
        inherited btnSearch: TcxButton
          Top = 376
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 644
      Height = 428
      inherited grdData: TcxGrid
        Width = 644
        Height = 275
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object colDateStop: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_SET'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colReasonStop: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_SET'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object colDateProlong: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_CANCEL'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object colReasonProlong: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_CANCEL'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
      end
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 280
        Width = 644
        Height = 148
        Align = alBottom
        TabOrder = 1
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebLookAndFeel
        object cxButton1: TcxButton
          Left = 571
          Top = 115
          Width = 64
          Height = 24
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Default = True
          TabOrder = 2
          OnClick = cxButton1Click
        end
        object cxDBMemo1: TcxDBMemo
          Left = 146
          Top = 9
          DataBinding.DataField = 'REASON_SET'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Height = 45
          Width = 489
        end
        object cxDBMemo2: TcxDBMemo
          Left = 146
          Top = 61
          DataBinding.DataField = 'REASON_CANCEL'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Height = 46
          Width = 489
        end
        object dxLayoutControl1Group_Root: TdxLayoutGroup
          AutoAligns = []
          AlignHorz = ahClient
          AlignVert = avClient
          ShowCaption = False
          ShowBorder = False
          object dxLayoutControl1Item1: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
            Control = cxDBMemo1
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item2: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
            Control = cxDBMemo2
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item3: TdxLayoutItem
            AutoAligns = []
            AlignHorz = ahRight
            AlignVert = avBottom
            Caption = 'cxButton1'
            LookAndFeel = LayoutWebLookAndFeel
            ShowCaption = False
            Control = cxButton1
            ControlOptions.ShowBorder = False
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 275
        Width = 644
        Height = 5
        AlignSplitter = salBottom
        Control = dxLayoutControl1
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
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
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      'from fdc_obj_kind_lst'
      'where object_id = :id'
      '    and kind_sysname = '#39'decl.stoptempadm'#39
      'order by date_set asc')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataDATE_SET: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'DATE_SET'
    end
    object dsDataDATE_CANCEL: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
      FieldName = 'DATE_CANCEL'
    end
    object dsDataREASON_SET: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
      DisplayWidth = 50
      FieldName = 'REASON_SET'
      Size = 1000
    end
    object dsDataREASON_CANCEL: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
      DisplayWidth = 50
      FieldName = 'REASON_CANCEL'
      Size = 1000
    end
  end
end
