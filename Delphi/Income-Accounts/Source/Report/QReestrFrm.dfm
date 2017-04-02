inherited QReestrForm: TQReestrForm
  Left = 477
  Top = 433
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081' '#1080' '#1074#1099#1073#1099#1090#1080#1081' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 137
  ClientWidth = 315
  PixelsPerInch = 115
  TextHeight = 16
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 315
    Height = 137
    inherited btnCancel: TcxButton
      Left = 211
      Top = 97
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 111
      Top = 97
      ModalResult = 0
      TabOrder = 2
    end
    object cmbxedtCurrID: TfdcObjectLookupEdit [2]
      Left = 59
      Top = 12
      Width = 392
      Height = 26
      DataBinding.DataField = 'CURR_ID'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
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
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      StyleDisabled.StyleController = OfficeEditStyleController
      StyleFocused.StyleController = OfficeEditStyleController
      StyleHot.StyleController = OfficeEditStyleController
      TabOrder = 0
    end
    object edtFrom: TcxDBDateEdit [3]
      Left = 59
      Top = 45
      Width = 301
      Height = 26
      DataBinding.DataField = 'Make_Date'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      StyleDisabled.StyleController = OfficeEditStyleController
      StyleFocused.StyleController = OfficeEditStyleController
      StyleHot.StyleController = OfficeEditStyleController
      TabOrder = 1
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxedtCurrID
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072
        Control = edtFrom
        ControlOptions.ShowBorder = False
      end
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData1
    Left = 24
    Top = 88
  end
  object xlrDeclarant: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1056#1077#1077#1089#1090#1088'.XLS'
    DataSources = <
      item
        DataSet = dsDeclMain
        Alias = 'dsIncome'
        Range = 'income'
        Options = [xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = fdcQuery2
        Alias = 'dsDeduct'
        Range = 'deduct'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = fdcQuery1
        Alias = 'dsMain'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dxMemData1
        Alias = 'aValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = True
    Params = <>
    Left = 140
    Top = 104
  end
  object dsDeclMain: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      
        'select o.name, e.item_date, e.summa, null payment_type, a.curren' +
        'cy_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      
        'where a.hier_name = '#39'112'#39' and a.payment_type = '#39'  '#39' and e.debet_' +
        'id = a.id'
      
        'and e.item_date >= trunc(:MAKE_DATE) and e.item_date < trunc(:MA' +
        'KE_DATE + 1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id')
    Left = 104
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
  object fdcQuery2: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select o.name, e.item_date, e.summa, '
      'nvl(t.code, a.payment_type) as payment_type, '
      'a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o'
      
        ',(select kbk.code2, max(kbk.code) as code from fdc_kbk_dict_lst ' +
        'kbk group by kbk.code2) t'
      'where a.hier_name = '#39'173'#39' and e.credit_id = a.id'
      
        'and e.item_date >= trunc(:MAKE_DATE) and e.item_date < trunc(:MA' +
        'KE_DATE + 1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      'and t.code2(+) = a.payment_type'
      'union all'
      'select o.name, e.item_date, e.summa, null, a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      'where a.hier_name = '#39'102'#39' and e.credit_id = a.id'
      
        'and e.item_date >= trunc(:MAKE_DATE) and e.item_date < trunc(:MA' +
        'KE_DATE + 1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id')
    Left = 104
    Top = 104
    ParamData = <
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
  object DataSource3: TDataSource
    DataSet = dsDeclMain
    Left = 136
    Top = 72
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 64
    Top = 88
    object dxMemData1FROM_DATE: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'FROM_DATE'
      Required = True
    end
    object dxMemData1TO_DATE: TDateField
      DisplayLabel = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'TO_DATE'
    end
    object dxMemData1CURR_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_ID'
      Required = True
    end
    object dxMemData1Make_Date: TDateField
      FieldName = 'Make_Date'
    end
  end
  object DataSource1: TDataSource
    DataSet = fdcQuery2
    Left = 68
    Top = 124
  end
  object fdcQuery1: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select :MAKE_DATE date_day, acode cur_code,'
      '('
      'select nvl(sum(summa),0) from ('
      'select o.name, e.item_date, e.summa , null, a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      
        'where a.hier_name = '#39'112'#39' and a.payment_type = '#39'  '#39' and e.debet_' +
        'id = a.id'
      'and e.item_date < trunc(:MAKE_DATE)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      'union all'
      
        'select o.name, e.item_date, -e.summa, a.payment_type, a.currency' +
        '_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      'where a.hier_name = '#39'173'#39' and e.credit_id = a.id'
      'and e.item_date < trunc(:MAKE_DATE)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      'union all'
      'select o.name, e.item_date, -e.summa, null, a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      'where a.hier_name = '#39'102'#39' and e.credit_id = a.id'
      'and e.item_date < trunc(:MAKE_DATE)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      ')) begin_sum'
      ',('
      'select nvl(sum(summa),0) from ('
      'select o.name, e.item_date, e.summa , null, a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      
        'where a.hier_name = '#39'112'#39' and a.payment_type = '#39'  '#39' and e.debet_' +
        'id = a.id'
      'and e.item_date < trunc(:MAKE_DATE + 1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      'union all'
      
        'select o.name, e.item_date, -e.summa, a.payment_type, a.currency' +
        '_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      'where a.hier_name = '#39'173'#39' and e.credit_id = a.id'
      'and e.item_date < trunc(:MAKE_DATE +1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      'union all'
      'select o.name, e.item_date, -e.summa, null, a.currency_id'
      'from fdc_account_entry e, fdc_account a, fdc_object o '
      'where a.hier_name = '#39'102'#39' and e.credit_id = a.id'
      'and e.item_date < trunc(:MAKE_DATE +1)'
      'and a.currency_id = :curr_id'
      'and o.id(+) = e.operation_id'
      ')) end_sum'
      'from fdc_nsi_currency'
      'where id = :curr_id')
    Left = 184
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'MAKE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
end
