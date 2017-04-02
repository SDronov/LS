inherited qCustomReportForm: TqCustomReportForm
  Left = 549
  Top = 364
  Caption = 'qCustomReportForm'
  ClientHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 150
    inherited btnCancel: TcxButton
      Top = 118
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Top = 118
      ModalResult = 0
      TabOrder = 4
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 50
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
      Left = 50
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
    object chbxXML: TcxCheckBox [4]
      Left = 9
      Top = 118
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' XML'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Width = 121
    end
    object edtDateTo: TcxDBDateEdit [5]
      Left = 50
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
        Caption = #1044#1072#1090#1072' '
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [1]
        Caption = #1055#1086
        Visible = False
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object lciCurrency: TdxLayoutItem [2]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurrency
        ControlOptions.ShowBorder = False
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        object lcichbxXML: TdxLayoutItem [0]
          Caption = 'cxCheckBox1'
          ShowCaption = False
          Control = chbxXML
          ControlOptions.ShowBorder = False
        end
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
  object dsMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 24
    Top = 56
    object dsMemDataDateFrom: TDateField
      FieldName = 'DateFrom'
      OnChange = dsMemDataDateFromChange
    end
    object dsMemDataDateTo: TDateField
      FieldName = 'DateTo'
    end
    object dsMemDataCurrId: TFloatField
      FieldName = 'CurrId'
    end
    object dsMemDataCurrName: TStringField
      FieldName = 'CurrName'
      Size = 400
    end
  end
  object srcMemData: TDataSource
    DataSet = dsMemData
    Left = 56
    Top = 56
  end
  object xlrReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    DataSources = <>
    Preview = False
    Params = <>
    Left = 240
    Top = 24
  end
  object dsValueSys: TOracleDataSet
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_value_lst_sys')
    Left = 200
    Top = 24
  end
  object dsReportParam: TOracleDataSet
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_nsi_report_lst'
      'where'
      '  :datefrom between sdate and nvl(edate,:datefrom+1)'
      '  and sysname = :SysName')
    Variables.Data = {
      0300000002000000090000003A4441544546524F4D0C00000000000000000000
      00080000003A5359534E414D45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C49535401000000000004000000434F4445010000000000050000
      00434F444532010000000000090000004F574E45524E414D450100000000000C
      0000004F574E45525359534E414D450100000000000D0000004F574E45525459
      50454E414D45010000000000100000004F574E4552545950455359534E414D45
      0100000000000500000053444154450100000000000500000045444154450100
      0000000009000000444154424547444F43010000000000090000004E554D4245
      47444F4301000000000009000000444154454E44444F43010000000000090000
      004E554D454E44444F430100000000000D00000054454D504C4154455F4E414D
      45010000000000}
    Left = 200
    Top = 56
    object dsReportParamTEMPLATE_NAME: TStringField
      FieldName = 'TEMPLATE_NAME'
      Size = 400
    end
  end
  object qryCheckReport: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_nsi_report_check(:DateFrom);'
      'end;')
    Variables.Data = {
      0300000001000000090000003A4441544546524F4D0C00000000000000000000
      00}
    Left = 240
    Top = 56
  end
  object dsHeader: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 296
    Top = 24
  end
  object dsReport: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 296
    Top = 56
  end
  object dsXML: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_nsi_report_budget_lst_xml'
      'where'
      '  nvl(currency_id, :CurrId) = :CurrID'
      
        '  and (nvl(balance_date, :DateFrom) between :DateFrom and :DateT' +
        'o)'
      'order by'
      '  sort_order')
    Left = 344
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CurrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CurrID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptUnknown
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
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CurrId'
        ParamType = ptUnknown
      end>
  end
end
