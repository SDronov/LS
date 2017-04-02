inherited qReportFrom_TO_Date_CurrForm: TqReportFrom_TO_Date_CurrForm
  Left = 392
  Top = 340
  Caption = 
    #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1072#1089#1095#1077#1090#1072#1084' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1080' '#1080#1085#1099#1084' '#1087#1083#1072#1090#1077#1078#1072#1084' '#1086#1090' '#1091#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069 +
    #1044' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 124
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 124
    inherited btnCancel: TcxButton
      Top = 92
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Top = 92
      ModalResult = 0
      TabOrder = 3
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 52
      Top = 9
      DataBinding.DataField = 'DateFrom'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 121
    end
    object cmbxCurrency: TfdcObjectLookupEdit [3]
      Left = 52
      Top = 63
      DataBinding.DataField = 'CurrId'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Code'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 145
    end
    object edtDateTo: TcxDBDateEdit [4]
      Left = 52
      Top = 36
      DataBinding.DataField = 'DateTo'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 381
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciDateFrom: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1087#1086
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object lciCurrency: TdxLayoutItem [2]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurrency
        ControlOptions.ShowBorder = False
      end
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
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 16
    Top = 72
    object dxMemDataDateFrom: TDateField
      FieldName = 'DateFrom'
      OnChange = dxMemDataDateFromChange
    end
    object dxMemDataDateTo: TDateField
      FieldName = 'DateTo'
    end
    object dxMemDataCurrId: TFloatField
      FieldName = 'CurrId'
    end
    object dxMemDataCurrName: TStringField
      FieldName = 'CurrName'
      Size = 400
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 255
    end
  end
  object srcMemData: TDataSource
    DataSet = dxMemData
    Left = 56
    Top = 56
  end
  object xlrReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
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
    Left = 280
    Top = 16
  end
  object dsHeader: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 344
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CurrId'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CurrName'
        ParamType = ptInput
      end>
  end
  object dsBody: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 336
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptInput
      end>
  end
  object dlgSave: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML|*.xml|*.*|*.*'
    Left = 88
    Top = 56
  end
  object dsCheckRate: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    SQL.Strings = (
      'select fdc_nsicurrency_GetRate(:CurrId)'
      'from dual')
    Left = 200
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CurrId'
        ParamType = ptUnknown
      end>
  end
end
