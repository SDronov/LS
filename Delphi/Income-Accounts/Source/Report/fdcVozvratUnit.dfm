inherited fdcVozvratForm: TfdcVozvratForm
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 245
  ClientWidth = 490
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 490
    Height = 245
    inherited btnCancel: TcxButton
      Left = 406
      Top = 213
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 325
      Top = 213
      TabOrder = 5
    end
    object edtDate_From: TcxDBDateEdit [2]
      Left = 94
      Top = 9
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 273
    end
    object edtDate_To: TcxDBDateEdit [3]
      Left = 94
      Top = 36
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 273
    end
    object chBIsActive: TcxDBCheckBox [4]
      Left = 9
      Top = 63
      Caption = #1058#1086#1083#1100#1082#1086' '#1058#1057
      DataBinding.DataField = 'Is_TS'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 405
    end
    object chbAll_KBK: TcxCheckBox [5]
      Left = 9
      Top = 90
      Caption = #1042#1089#1077' '#1050#1041#1050
      ParentColor = False
      ParentFont = False
      Properties.ImmediatePost = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object rgReportType: TcxRadioGroup [6]
      Left = 9
      Top = 117
      Caption = ' '#1058#1080#1087' '#1086#1090#1095#1105#1090#1072' '
      ParentColor = False
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1055#1086' '#1076#1072#1090#1077' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1080#1079' '#1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1093' '#1058#1054
          Value = '0'
        end
        item
          Caption = #1055#1086' '#1076#1072#1090#1077' '#1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1074' '#1088#1077#1077#1089#1090#1088' '#1076#1083#1103' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1074' '#1059#1060#1050'/'#1074#1099#1096#1077#1089#1090#1086#1103#1097#1080#1081' '#1058#1054
          Value = '1'
        end>
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      TabOrder = 4
      Height = 76
      Width = 406
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1053#1072#1095#1072#1083#1072' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDate_From
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDate_To
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        ShowCaption = False
        Control = chBIsActive
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = 'cxCheckBox1'
        ShowCaption = False
        Control = chbAll_KBK
        ControlOptions.ShowBorder = False
      end
      object lciReportType: TdxLayoutItem [4]
        Caption = 'cxRadioGroup1'
        ShowCaption = False
        Control = rgReportType
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 167
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 167
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 167
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  object xlrVozvrat: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroRefreshParams]
    XLSTemplate = 'ReestPayback.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsBody
        Alias = 'aBody'
        Range = 'rngBody'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 200
    Top = 54
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'param = :begin_date'
      'param = :end_date'
      'param = :report_type'
      'param = :is_ts')
    Left = 32
    Top = 54
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'report_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end>
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 54
    object dxMemDataCustomsName: TStringField
      DisplayWidth = 400
      FieldName = 'CustomsName'
      Size = 1500
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
      OnChange = dxMemDataDate_FromChange
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataPeriod: TStringField
      DisplayWidth = 300
      FieldName = 'Period'
      Size = 1500
    end
    object dxMemDataIs_TS: TStringField
      FieldName = 'Is_TS'
      Size = 1
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 32
    Top = 118
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'param = :begin_date'
      'param = :end_date'
      'param = :is_ts'
      'param = :report_type'
      '     ')
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'is_ts'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'report_type'
        ParamType = ptUnknown
      end>
  end
end
