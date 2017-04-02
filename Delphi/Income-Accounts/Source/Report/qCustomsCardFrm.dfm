inherited QCustomsCardForm: TQCustomsCardForm
  Left = 448
  Top = 447
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1077#1090#1072' '#1088#1072#1089#1095#1077#1090#1086#1074
  ClientHeight = 256
  ClientWidth = 357
  PixelsPerInch = 115
  TextHeight = 16
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 357
    Height = 256
    inherited btnCancel: TcxButton
      Left = 253
      Top = 216
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 153
      Top = 216
      ModalResult = 0
      TabOrder = 2
    end
    object edtTo: TcxDBDateEdit [2]
      Left = 111
      Top = 40
      Width = 290
      Height = 21
      DataBinding.DataField = 'TO_DATE'
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
    object edtFrom: TcxDBDateEdit [3]
      Left = 111
      Top = 12
      Width = 290
      Height = 21
      DataBinding.DataField = 'FROM_DATE'
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
      TabOrder = 0
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtTo
        ControlOptions.ShowBorder = False
      end
    end
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 24
    Top = 69
    object dxMemData1FROM_DATE: TDateField
      FieldName = 'FROM_DATE'
      Required = True
    end
    object dxMemData1TO_DATE: TDateField
      FieldName = 'TO_DATE'
      Required = True
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData1
    Left = 56
    Top = 68
  end
  object dsDeclMain: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select n3, n4, n5, n6, n7, n8, n6+n8-n7 n10'
      'from ('
      'select'
      #39#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1087#1086#1083#1091#1095#1077#1085#1085#1099#1084' '#1072#1074#1072#1085#1089#1072#1084#39' n3,'
      'null n4,'
      'null n5,'
      '('
      'select sum(summa) from'
      '('
      
        'select nvl(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_i' +
        'd),1)),0) summa'
      '  from fdc_account_entry_lst t'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      '          where a.payment_type = '#39'01'#39' '
      '        connect by a.parent_id = prior id'
      '         start with a.hier_name = '#39'100'#39
      '                and a.parent_id is null) a'
      'where t.item_date < trunc(:FROM_DATE)  and t.credit_id = a.id  '
      'union all'
      
        'select -nvl(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_' +
        'id),1)),0) summa'
      '  from fdc_account_entry_lst t'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      '          where a.payment_type = '#39'01'#39' '
      '        connect by a.parent_id = prior id'
      '         start with a.hier_name = '#39'100'#39
      '                and a.parent_id is null) a'
      'where t.item_date < trunc(:FROM_DATE)  and t.debet_id = a.id  '
      ')'
      ') n6,'
      '('
      
        'select NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_i' +
        'd),1)),0)'
      '  from fdc_account_entry_lst t'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      '          where a.payment_type = '#39'01'#39' '
      '        connect by a.parent_id = prior id'
      '         start with a.hier_name = '#39'100'#39
      '                and a.parent_id is null) a'
      
        'where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(' +
        ':TO_DATE +1) and t.debet_id = a.id  '
      ') n7,'
      '('
      
        'select NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_i' +
        'd),1)),0)'
      '  from fdc_account_entry_lst t'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      '          where a.payment_type = '#39'01'#39' '
      '        connect by a.parent_id = prior id'
      '         start with a.hier_name = '#39'100'#39
      '                and a.parent_id is null) a'
      
        'where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(' +
        ':TO_DATE +1)  and t.credit_id = a.id  '
      ') n8'
      'from dual'
      ')'
      'union all'
      
        'select '#39'    '#1047#1072#1095#1077#1090' '#1087#1086#1083#1091#1095#1077#1085#1085#1086#1075#1086' '#1072#1074#1072#1085#1089#1072#39' n3, nvl(kbk.code, a.paymen' +
        't_type) n4, null n5, null n6, NVL(sum(t.summa * nvl(p_nsi_curren' +
        'cy.GetRate(a.currency_id),1)),0) n7, null n8, null n10'
      '  from fdc_account_entry_lst t'
      '  ,fdc_kbk_dict_lst kbk'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      '          where a.hier_name = '#39'152'#39
      '                ) a'
      
        'where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(' +
        ':TO_DATE +1) and t.debet_id = a.id  and kbk.code2(+) = a.payment' +
        '_type'
      'group by nvl(kbk.code, a.payment_type)'
      'union all'
      
        'select '#39'    '#1042#1086#1079#1074#1088#1072#1090' '#1087#1086#1083#1091#1095#1077#1085#1085#1086#1075#1086' '#1072#1074#1072#1085#1089#1072#39' n3, null n4, null n5, nu' +
        'll n6, NVL(sum(t.summa * nvl(p_nsi_currency.GetRate(a.currency_i' +
        'd),1)),0) n7, null n8, null n10'
      '  from fdc_account_entry_lst t'
      ' ,(select a.*'
      '          from fdc_account a             '
      '          where a.hier_name = '#39'102'#39
      '                ) a'
      
        'where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(' +
        ':TO_DATE +1) and t.credit_id = a.id  '
      'group by null'
      'union all'
      
        'select '#39#1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1076#1086#1093#1086#1076#1072#39' n3, nvl(kbk.code, a.payme' +
        'nt_type) n4, null n5, null n6,null n7, NVL(sum(t.summa * nvl(p_n' +
        'si_currency.GetRate(a.currency_id),1)),0) n8, null n10'
      '  from fdc_account_entry_lst t'
      '  ,fdc_kbk_dict_lst kbk'
      ' ,(select a.*'
      '          from fdc_account_lst a             '
      
        '          where a.hier_name = '#39'152'#39'                             ' +
        '            '
      '    ) a'
      
        'where t.item_date >= trunc(:FROM_DATE)  and t.item_date < trunc(' +
        ':TO_DATE +1) and t.credit_id = a.id  and kbk.code2(+) = a.paymen' +
        't_type'
      'group by nvl(kbk.code, a.payment_type)')
    Left = 16
    Top = 104
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end>
  end
  object xlrDeclarant: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1077#1090#1072' '#1088#1072#1089#1093#1086#1076#1086#1074'.XLS'
    DataSources = <
      item
        DataSet = dxMemData1
        Alias = 'dsMain'
        Options = [xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsDeclMain
        Alias = 'dsData'
        Range = 'data'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = True
    Params = <>
    Left = 72
    Top = 101
  end
end
