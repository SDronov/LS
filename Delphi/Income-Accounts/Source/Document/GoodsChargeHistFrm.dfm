inherited GoodsChargeHistForm: TGoodsChargeHistForm
  Width = 736
  Height = 461
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 402
    Width = 728
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 422
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 422
      end
      inherited pnlProgress: TPanel
        Width = 422
        inherited lblProgress: TcxLabel
          Width = 422
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 635
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 399
    Width = 728
  end
  inherited pnlWorkspace: TPanel
    Width = 728
    Height = 371
    inherited splSearchCriteria: TSplitter
      Height = 371
    end
    inherited pnlSearchCriteria: TPanel
      Height = 371
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 351
        inherited btnSearch: TcxButton
          Top = 319
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 523
      Height = 371
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 274
        Width = 523
        Height = 5
        Cursor = crVSplit
        Align = alBottom
      end
      inherited grdData: TcxGrid
        Width = 523
        Height = 274
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsSelection.CellSelect = False
          object colDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHANGE_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colSumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object colCurrencyCode: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object colDesc: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHANGE_DESC'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMODE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODE_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMODE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODE_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_BEGIN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_BEGIN'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_END: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_END'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_CODE'
            Options.Editing = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_NAME'
            Options.Editing = False
            Width = 250
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 279
        Width = 523
        Height = 92
        Align = alBottom
        TabOrder = 1
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebLookAndFeel
        object cxButton1: TcxButton
          Left = 439
          Top = 60
          Width = 75
          Height = 23
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Default = True
          TabOrder = 1
          OnClick = cxButton1Click
        end
        object cxDBMemo1: TcxDBMemo
          Left = 9
          Top = 9
          DataBinding.DataField = 'CHANGE_DESC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Height = 50
          Width = 319
        end
        object dxLayoutControl1Group_Root: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutControl1Item1: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            LookAndFeel = LayoutWebLookAndFeel
            ShowCaption = False
            Control = cxDBMemo1
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item2: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            Caption = 'cxButton1'
            LookAndFeel = LayoutWebLookAndFeel
            ShowCaption = False
            Control = cxButton1
            ControlOptions.ShowBorder = False
          end
        end
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
      'from fdc_goods_charge_hist_lst'
      'where'
      '  decl_goods_id = :id'
      '  and pay_type_id = :pay_type_id'
      '  and pay_mode_id = :pay_mode_id'
      '  and currency_id = :currency_id'
      'order by change_date asc nulls first')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pay_mode_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'currency_id'
        ParamType = ptUnknown
      end>
    object dsDataCHANGE_DESC: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      DisplayWidth = 100
      FieldName = 'CHANGE_DESC'
      Size = 2000
    end
    object dsDataCHANGE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 11
      FieldName = 'CHANGE_DATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 7
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataMODE_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
      FieldName = 'MODE_CODE'
      Size = 1500
    end
    object dsDataMODE_NAME: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1077#1085#1085#1072#1103' '#1087#1088#1086#1094#1077#1076#1091#1088#1072
      FieldName = 'MODE_NAME'
      Size = 1500
    end
    object dsDataDATE_BEGIN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATE_BEGIN'
    end
    object dsDataDATE_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1082#1086#1085#1094#1072
      FieldName = 'DATE_END'
    end
    object dsDataREASON_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1087#1088#1080#1095#1080#1085#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      DisplayWidth = 100
      FieldName = 'REASON_CODE'
      Size = 1500
    end
    object dsDataREASON_NAME: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      DisplayWidth = 250
      FieldName = 'REASON_NAME'
      Size = 1500
    end
  end
end
