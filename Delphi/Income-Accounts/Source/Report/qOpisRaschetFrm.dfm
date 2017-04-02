inherited qOpisRaschetForm: TqOpisRaschetForm
  Left = 527
  Top = 457
  HelpContext = 4126
  Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1086#1085#1085#1072#1103' '#1086#1087#1080#1089#1100' (0541005)'
  ClientHeight = 84
  ClientWidth = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 332
    Height = 84
    inherited btnCancel: TcxButton
      Left = 248
      Top = 52
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 167
      Top = 52
      ModalResult = 0
      TabOrder = 1
    end
    object edtDate: TcxDBDateEdit [2]
      Left = 193
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
      StyleDisabled.StyleController = OfficeEditStyleController
      StyleFocused.StyleController = OfficeEditStyleController
      StyleHot.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 138
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciDate: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'  '
        Control = edtDate
        ControlOptions.ShowBorder = False
      end
    end
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 24
    Top = 72
    object dxMemDataBossName: TStringField
      FieldName = 'BossName'
      Size = 400
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 400
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
  end
  object xlrOpisRaschet: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1087#1088#1080#1083'5_'#1086#1087#1080#1089#1100'.xls'
    DataSources = <
      item
        DataSet = dxMemData
        Alias = 'aValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsDebet
        Alias = 'aDebet'
        Range = 'rngDebet'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsCredit
        Alias = 'aCredit'
        Range = 'rngCredit'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsdebetTotal
        Alias = 'aDebetTotal'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 64
    Top = 112
  end
  object dsSysValues: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  Name, SysName, StringValue'
      'FROM'
      '  fdc_value_lst_sys '
      'WHERE'
      '  SysName = '#39'CustomsName'#39
      '  or SysName = '#39'BossName'#39)
    Left = 64
    Top = 72
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 24
    Top = 112
  end
  object dsCredit: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  nvl(nsi_kbk.code, asl.payment_type) as kbk'
      '  ,c.code as CurrCode'
      '  ,p_nsi_currency.GetRate(c.Id, :Date_From) as CurrRate'
      '  ,NVL(sum(abs(asl.saldo)), 0) as CurrSuum'
      
        '  ,NVL(sum(abs(asl.saldo)), 0) * p_nsi_currency.GetRate(c.Id, :D' +
        'ate_From) as RubSuum'
      'FROM'
      '  fdc_account_saldo_lst asl'
      
        '  ,(select max(code) as code, code2 from fdc_kbk_dict_lst group ' +
        'by code2) nsi_kbk'
      '  ,fdc_nsi_currency_lst c'
      '  WHERE'
      
        '  ((asl.hier_name = '#39'100'#39' and asl.payment_type = '#39'  '#39') or asl.hi' +
        'er_name = '#39'134'#39' or asl.hier_name = '#39'144'#39')'
      '  and c.id = asl.currency_id'
      '--  and asl.from_date(+) = t.from_date'
      '  and nsi_kbk.code2(+) = asl.payment_type'
      '  and asl.saldo <> 0'
      '  and asl.from_date = (SELECT MAX(l.from_date) from_date'
      '    FROM  fdc_account_saldo_lst l'
      
        '    WHERE l.from_date <= :Date_From and l.account_id = asl.accou' +
        'nt_id)  '
      'GROUP BY'
      '  c.code'
      '  ,c.id'
      '  ,nvl(nsi_kbk.code, asl.payment_type)')
    Left = 144
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end>
  end
  object dsDebet: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  nvl(nsi_kbk.code, asl.payment_type) as KBK'
      '  ,c.code as CurrCode'
      '  ,p_nsi_currency.GetRate(c.Id, :Date_From) as CurrRate'
      '  ,NVL(sum(abs(asl.saldo)),0) as CurrSuum'
      
        '  ,NVL(sum(abs(asl.saldo)) * p_nsi_currency.GetRate(c.Id, :Date_' +
        'From),0) as RubSuum'
      'FROM'
      '  fdc_account_saldo_lst asl'
      '  ,fdc_nsi_currency_lst c'
      
        '  ,(select max(code) as code, code2 from fdc_kbk_dict_lst group ' +
        'by code2) nsi_kbk'
      '  ,(SELECT MAX(l.from_date) from_date'
      '           ,nvl(x.code, l.payment_type)'
      '          ,l.currency_id'
      '          ,l.account_id'
      '    FROM  fdc_account_saldo_lst l'
      
        '             ,(select max(code) as code, code2 from fdc_kbk_dict' +
        '_lst group by code2) x'
      '    WHERE l.from_date <= :Date_From'
      '          and (l.hier_name = '#39'178'#39' or l.hier_name = '#39'173'#1055#39')'
      #9#9'  and x.code2(+) = l.payment_type '
      '    GROUP BY nvl(x.code, l.payment_type)'
      '                     ,l.currency_id, l.account_id'
      #9') t'
      'WHERE'
      '  (asl.hier_name = '#39'178'#39' or asl.hier_name = '#39'173'#1055#39')'
      '  and c.id = asl.currency_id'
      '  and nsi_kbk.code2(+) = asl.payment_type'
      '  and asl.account_id(+) = t.account_id'
      '  and asl.From_Date(+) = t.From_Date'
      '  and asl.saldo <> 0'
      'GROUP BY'
      '   nvl(nsi_kbk.code, asl.payment_type)'
      '  ,c.code'
      '  ,c.id')
    Left = 112
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end>
  end
  object dsdebetTotal: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      
        '  NVL(sum(abs(asl.saldo)) * p_nsi_currency.GetRate(c.Id, :Date_F' +
        'rom),0) as RubSuumTotal'
      '--  ,nvl(nsi_kbk.code, asl.payment_type) as kbk'
      'FROM'
      '  fdc_account_saldo_lst asl'
      '  ,fdc_nsi_currency_lst c'
      
        ' ,(select max(code) as code, code2 from fdc_kbk_dict_lst group b' +
        'y code2) nsi_kbk'
      '--  ,fdc_kbk_dict_lst nsi_kbk'
      '  ,(SELECT MAX(l.from_date) from_date'
      '           ,nvl(x.code, l.payment_type)'
      '          ,l.currency_id'
      '    FROM  fdc_account_saldo_lst l'
      '          ,fdc_kbk_dict_lst x'#9
      '    WHERE l.from_date <= :Date_From'
      '          and (l.hier_name = '#39'178'#39' or l.hier_name = '#39'173'#1055#39')'
      #9#9'  and x.code2(+) = l.payment_type '
      '    GROUP BY nvl(x.code, l.payment_type)'
      '                     ,l.currency_id'
      #9') t'
      'WHERE'
      '  (asl.hier_name = '#39'178'#39' or asl.hier_name = '#39'173'#1055#39')'
      '  and c.id = asl.currency_id'
      '  and nsi_kbk.code2(+) = asl.payment_type'
      '  and asl.From_Date(+) = t.From_Date'
      '  and asl.saldo <> 0'
      'GROUP BY'
      '  c.id'
      '--  ,nvl(nsi_kbk.code, asl.payment_type)')
    Left = 190
    Top = 70
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end>
  end
end
