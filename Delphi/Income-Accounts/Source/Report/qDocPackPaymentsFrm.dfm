inherited qDocPackPaymentsForm: TqDocPackPaymentsForm
  Left = 297
  Top = 237
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 116
  ClientWidth = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 385
    Height = 116
    inherited btnCancel: TcxButton
      Left = 301
      Top = 84
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 220
      Top = 84
      ModalResult = 0
      TabOrder = 3
    end
    object edtDateTo: TcxDBDateEdit [2]
      Left = 64
      Top = 33
      DataBinding.DataField = 'DateTo'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 302
    end
    object edtDateFrom: TcxDBDateEdit [3]
      Left = 64
      Top = 9
      DataBinding.DataField = 'DateFrom'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 411
    end
    object chBIsActive: TcxDBCheckBox [4]
      Left = 9
      Top = 57
      Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      DataBinding.DataField = 'Is_TS'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 404
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item4: TdxLayoutItem [0]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089': '
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1087#1086': '
        CaptionOptions.AlignHorz = taRightJustify
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [2]
        ShowCaption = False
        Control = chBIsActive
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 264
    Top = 65535
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 292
    Top = 65535
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 376
    Top = 65535
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 404
    Top = 65535
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 320
    Top = 65535
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 348
    Top = 65535
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 70
    Top = 65534
    object dxMemDataDateFrom: TDateField
      FieldName = 'DateFrom'
    end
    object dxMemDataDateTo: TDateField
      FieldName = 'DateTo'
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 200
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 150
    end
    object dxMemDataIs_TS: TStringField
      FieldName = 'Is_TS'
      Size = 1
    end
  end
  object xlrDocPackPayments: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 
      'd:\Projects\LSSVN\Delphi\Bin\report\'#1056#1077#1077#1089#1090#1088'_'#1087#1083#1072#1090#1077#1078#1085#1099#1093'_'#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074'.' +
      'xls'
    DataSources = <
      item
        DataSet = dxMemData
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSummary
        Alias = 'aSummary'
        Range = 'rngSummary'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsFooter
        Alias = 'aFooter'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 178
    Top = 6
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 132
    Top = 6
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT 1'
      'FROM dual')
    Left = 70
    Top = 46
  end
  object dsFooter: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT 1'
      'FROM dual')
    Left = 142
    Top = 54
  end
  object dsSummary: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT 1'
      'FROM dual')
    Left = 206
    Top = 54
  end
  object fdcHeader: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT 1'
      'FROM dual')
    Left = 270
    Top = 54
  end
end
