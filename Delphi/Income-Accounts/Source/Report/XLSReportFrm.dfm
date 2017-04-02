inherited XLSReportForm: TXLSReportForm
  Left = 555
  Top = 241
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 306
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 425
    Height = 306
    inherited btnCancel: TcxButton
      Left = 341
      Top = 274
    end
    inherited btnOk: TcxButton
      Left = 260
      Top = 274
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
  object dsHeader: TfdcQuery
    DataSource = srcParam
    ReadOnly = False
    Left = 32
    Top = 144
  end
  object dsData: TfdcQuery
    DataSource = srcParam
    ReadOnly = False
    Left = 80
    Top = 144
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    DataSources = <>
    Preview = False
    Params = <>
    Left = 136
    Top = 144
  end
  object dsParam: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterOpen = dsParamAfterOpen
    Left = 344
    Top = 16
    object dsParamCUSTOMS_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      FieldName = 'CUSTOMS_NAME'
      Size = 100
    end
    object dsParamCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsParamSYSDATE: TDateField
      DisplayLabel = #1057#1080#1089#1090#1077#1084#1085#1072#1103' '#1076#1072#1090#1072' '#1089#1077#1088#1074#1077#1088#1072
      FieldName = 'SYSDATE'
    end
  end
  object srcParam: TDataSource
    DataSet = dsParam
    Left = 344
    Top = 64
  end
end
