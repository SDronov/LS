inherited DeclChargeHistForm: TDeclChargeHistForm
  Left = 278
  Top = 281
  Width = 768
  Height = 427
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 375
    Width = 760
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
      Width = 455
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 455
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 455
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 455
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 668
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 372
    Width = 760
  end
  inherited pnlWorkspace: TPanel
    Width = 760
    Height = 346
    inherited splSearchCriteria: TSplitter
      Height = 346
    end
    inherited pnlSearchCriteria: TPanel
      Height = 346
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 326
        inherited btnSearch: TcxButton
          Top = 294
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 555
      Height = 346
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 255
        Width = 555
        Height = 5
        Cursor = crVSplit
        Align = alBottom
      end
      inherited grdData: TcxGrid
        Width = 555
        Height = 255
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewDECL_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Hidden = True
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Hidden = True
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Visible = False
            Hidden = True
            Width = 12004
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUR_CODE'
            Width = 73
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE_REASON: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1087#1088#1080#1095#1080#1085#1099
            DataBinding.FieldName = 'CODE_REASON'
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHANGE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHANGE_DATE'
            Width = 148
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHANGE_DESC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHANGE_DESC'
            Visible = False
            Hidden = True
            Width = 16004
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
      end
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 260
        Width = 555
        Height = 86
        Align = alBottom
        TabOrder = 1
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebLookAndFeel
        object cxButton1: TcxButton
          Left = 471
          Top = 54
          Width = 75
          Height = 23
          Hint = #1048#1089#1082#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1074#1074#1077#1076#1077#1085#1085#1099#1084' '#1082#1088#1080#1090#1077#1088#1080#1103#1084
          Caption = #1047#1072#1082#1088#1099#1090#1100
          Default = True
          ModalResult = 1
          TabOrder = 1
          OnClick = cxButton1Click
        end
        object cxDBMemo1: TcxDBMemo
          Left = 9
          Top = 9
          DataBinding.DataField = 'CHANGE_DESC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Height = 68
          Width = 142
        end
        object dxLayoutControl1Group_Root: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutControl1Item2: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = 'cxDBMemo1'
            CaptionOptions.Layout = clTop
            LookAndFeel = LayoutWebLookAndFeel
            ShowCaption = False
            Control = cxDBMemo1
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item1: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
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
    Style.Font.Height = -8
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select *'
      '  from fdc_decl_charge_hist_lst t'
      ' where t.DECL_ID = :DECL_ID'
      '   and t.pay_type_id = :pay_type_id'
      '   and t.currency_id = :currency_id'
      
        '  and nvl(t.charge_month, to_date(1000000,'#39'J'#39')) = nvl(:Charge_Mo' +
        'nth, to_date(1000000,'#39'J'#39'))'
      ' order by t.change_date asc nulls first')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Charge_Month'
        ParamType = ptUnknown
      end>
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataCUR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CUR_CODE'
      Size = 3
    end
    object dsDataCODE_REASON: TStringField
      DisplayLabel = #1050#1086#1076' '#1087#1088#1080#1095#1080#1085#1099' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'CODE_REASON'
      Size = 1500
    end
    object dsDataREASON_NAME: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'REASON_NAME'
      Size = 1500
    end
    object dsDataCHANGE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'CHANGE_DATE'
    end
    object dsDataCHANGE_DESC: TStringField
      FieldName = 'CHANGE_DESC'
      Size = 2000
    end
    object dsDataACC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACC_DATE'
    end
    object dsDataCHARGE_MONTH: TDateTimeField
      FieldName = 'CHARGE_MONTH'
    end
  end
end
