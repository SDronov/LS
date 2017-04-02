inherited qMasterDetailByPeriodForm: TqMasterDetailByPeriodForm
  Left = 440
  Top = 378
  Caption = #1054#1090#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 139
  ClientWidth = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 379
    Height = 139
    inherited btnCancel: TcxButton
      Left = 295
      Top = 107
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 214
      Top = 107
      ModalResult = 0
      TabOrder = 2
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 34
      Top = 9
      DataBinding.DataField = 'DATE_FROM'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 336
    end
    object edtDateTo: TcxDBDateEdit [3]
      Left = 34
      Top = 37
      DataBinding.DataField = 'DATE_TO'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 336
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1057' : '
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1055#1086' : '
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 200
    Top = 7
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 228
    Top = 7
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 312
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 340
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 256
    Top = 7
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 284
    Top = 7
  end
  object dsMaster: TOracleDataSet
    SQL.Strings = (
      'SELECT rownum AS ID'
      'FROM dual'
      'WHERE sysdate BETWEEN :DATE_FROM AND :DATE_TO')
    Variables.Data = {
      03000000020000000A0000003A444154455F46524F4D0C000000000000000000
      0000080000003A444154455F544F0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000500000053554D4D41010000000000050000004544415445
      01000000000006000000444F435F4E4F0100000000000A0000005041594D454E
      545F4944010000000000020000005353010000000000060000004453554D4D41
      0100000000000C0000005041594D454E545F49445F3101000000000003000000
      4B424B01000000000005000000534441544501000000000008000000504F5F53
      554D4D41010000000000}
    BeforeQuery = dsHeaderBeforeQuery
    Session = MainData.Session
    Left = 80
    Top = 88
  end
  object dsDetail: TOracleDataSet
    SQL.Strings = (
      ' SELECT sysdate'
      '      FROM dual'
      '      WHERE sysdate BETWEEN :DATE_FROM AND :DATE_TO'
      '        AND rownum = :ID'
      '')
    Variables.Data = {
      03000000030000000A0000003A444154455F46524F4D0C000000000000000000
      0000080000003A444154455F544F0C0000000000000000000000030000003A49
      44040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D450100000000000500000053554D4D4101
      000000000005000000544F54414C010000000000020000004130010000000000}
    Master = dsMaster
    MasterFields = 'ID'
    BeforeQuery = dsHeaderBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 88
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'dsHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsMaster
        Alias = 'dsMaster'
        Range = 'rngMaster'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsDetail
        Alias = 'dsDetail'
        Range = 'rngDetail'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsMaster'
      end>
    Preview = False
    Params = <>
    Left = 176
    Top = 96
  end
  object dsParam: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterOpen = dsParamAfterOpen
    Left = 256
    Top = 56
    object dsParamDATE_FROM: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATE_FROM'
      Required = True
      OnChange = dsParamDATE_FROMChange
    end
    object dsParamDATE_TO: TDateField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATE_TO'
      Required = True
    end
  end
  object srcParam: TDataSource
    DataSet = dsParam
    Left = 304
    Top = 56
  end
  object dsHeader: TOracleDataSet
    SQL.Strings = (
      'SELECT :DATE_FROM AS DATE_FROM,'
      '       :DATE_TO AS DATE_TO,'
      
        '       '#39#1044#1072#1090#1072' c '#39' || to_char(:DATE_FROM,'#39'dd.mm.yyyy'#39') || '#39' '#1087#1086' '#39' |' +
        '| to_char(:DATE_TO,'#39'dd.mm.yyyy'#39') AS Period'
      'FROM dual'
      '')
    Variables.Data = {
      03000000020000000A0000003A444154455F46524F4D0C000000000000000000
      0000080000003A444154455F544F0C0000000000000000000000}
    BeforeQuery = dsHeaderBeforeQuery
    Left = 32
    Top = 88
  end
end
