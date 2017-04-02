inherited qNoticeForm: TqNoticeForm
  Left = 391
  Top = 387
  HelpContext = 4126
  Caption = #1048#1079#1074#1077#1097#1077#1085#1080#1077
  ClientHeight = 161
  PixelsPerInch = 115
  TextHeight = 16
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 161
    inherited btnCancel: TcxButton
      Top = 121
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Top = 121
      ModalResult = 0
      TabOrder = 3
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 111
      Top = 12
      Width = 317
      Height = 22
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
    end
    object cmbxCurr: TfdcObjectLookupEdit [3]
      Left = 111
      Top = 70
      Width = 317
      Height = 22
      DataBinding.DataField = 'Curr_Id'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcCurrency
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      StyleDisabled.StyleController = OfficeEditStyleController
      StyleFocused.StyleController = OfficeEditStyleController
      StyleHot.StyleController = OfficeEditStyleController
      TabOrder = 2
    end
    object edtDateTo: TcxDBDateEdit [4]
      Left = 111
      Top = 41
      Width = 317
      Height = 22
      DataBinding.DataField = 'Date_To'
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
      TabOrder = 1
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciDate: TdxLayoutItem [0]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [2]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurr
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 123
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 123
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -12
    Top = 123
  end
  inherited WebEditStyleController: TcxEditStyleController
    Top = 123
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 123
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Top = 123
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
      '  or SysName = '#39'BossName'#39
      '  or SysName = '#39'CustomINN'#39
      '  or SysName = '#39'CustomKPP'#39
      '  or SysName = '#39'CustomsIA'#39
      '  or SysName = '#39'PayBossName'#39
      '  or SysName = '#39'CustomsCode'#39)
    Left = 64
    Top = 172
  end
  object xlrNotice: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1087#1088#1080#1083'2_'#1080#1079#1074#1077#1097#1077#1085#1080#1077'.xls'
    DataSources = <
      item
        DataSet = dxMemData
        Alias = 'aValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsMaster
        Alias = 'aMaster'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSlave
        Alias = 'aSlave'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 64
    Top = 204
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 24
    Top = 172
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
      OnChange = dxMemDataDate_FromChange
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataCustomInn: TStringField
      FieldName = 'CustomInn'
      Size = 400
    end
    object dxMemDataCustomKPP: TStringField
      FieldName = 'CustomKPP'
      Size = 400
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 400
    end
    object dxMemDataBossName: TStringField
      FieldName = 'BossName'
      Size = 400
    end
    object dxMemDataPayBossName: TStringField
      FieldName = 'PayBossName'
      Size = 400
    end
    object dxMemDataCustomsIA: TStringField
      FieldName = 'CustomsIA'
      Size = 200
    end
    object dxMemDataCurr_Id: TFloatField
      FieldName = 'Curr_Id'
    end
    object dxMemDataCustomsCode: TStringField
      FieldName = 'CustomsCode'
      Size = 200
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 300
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 24
    Top = 204
  end
  object dsMaster: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  c.Id as CurrId'
      '  ,concat('#39#1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' : '#39', c.name) as CurrCode'
      '  ,Code as CurrACode'
      '  ,p_nsi_currency.GetRate(Id, :Date_To) as CurrRate'
      '  ,:Date_From as Date_From'
      '  ,:Date_To as Date_To'
      ' ,:CustomsCode as CustomsCode'
      ' ,:Period as Period'
      'FROM'
      '  fdc_nsi_currency_lst c'
      'WHERE'
      '  c.id = :Curr_Id')
    Left = 112
    Top = 172
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomsCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object srcMaster: TDataSource
    DataSet = dsMaster
    Left = 112
    Top = 204
  end
  object dsSlave: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select inRubSuum,'
      '       inCurrSuum,'
      '       outRubSuum,'
      '       outCurrSuum,'
      '       inRubSuum + outRubSuum TotalRubSuum,'
      '       inCurrSuum + outCurrSuum TotalCurrSuum'
      '--  from (select NVL(sum(asl1.day_credit_turnover) *'
      '  from (select NVL(sum(asl1.day_debet_turnover) *'
      '                   p_nsi_currency.getRate(:Curr_Id, :Date_To),'
      '                   0) as inRubSuum,'
      
        '--               NVL(sum(asl1.day_credit_turnover), 0) as inCurr' +
        'Suum'
      
        '               NVL(sum(asl1.day_debet_turnover), 0) as inCurrSuu' +
        'm'
      '          from fdc_account_saldo_lst asl1'
      '--         where asl1.hier_name = '#39'100'#39
      '         where (asl1.hier_name = '#39'112'#39' or asl1.hier_name='#39'112'#1055#39')'
      '           and asl1.payment_type = '#39'  '#39
      '           and asl1.currency_id = :Curr_Id'
      
        '           and asl1.From_Date between Trunc(:Date_From) and Trun' +
        'c(:Date_To)),'
      '       (select NVL(sum(asl0.day_credit_turnover) *'
      '                   p_nsi_currency.GetRate(:Curr_Id, :Date_To),'
      '                   0) as outRubSuum,'
      
        '               NVL(sum(asl0.day_credit_turnover), 0) as outCurrS' +
        'uum'
      '          from fdc_account_saldo_lst asl0'
      '         where asl0.hier_name = '#39'102'#39
      '           and asl0.currency_id = :Curr_Id'
      
        '          and asl0.From_Date between Trunc(:Date_From) and Trunc' +
        '(:Date_To) )')
    Left = 152
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
end
