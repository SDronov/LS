inherited QDeclCardForm: TQDeclCardForm
  Left = 428
  Top = 323
  HelpContext = 4121
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
  ClientHeight = 170
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 170
    inherited btnCancel: TcxButton
      Top = 138
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Top = 138
      ModalResult = 0
      TabOrder = 5
    end
    object cmbxedtCurrID: TfdcObjectLookupEdit [2]
      Left = 94
      Top = 34
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
      TabOrder = 1
      Width = 319
    end
    object edtFrom: TcxDBDateEdit [3]
      Left = 94
      Top = 59
      DataBinding.DataField = 'FROM_DATE'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 245
    end
    object edtTo: TcxDBDateEdit [4]
      Left = 94
      Top = 84
      DataBinding.DataField = 'TO_DATE'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 245
    end
    object edtSubject: TcxDBButtonEdit [5]
      Left = 94
      Top = 9
      DataBinding.DataField = 'SUBJ_NAME'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 219
    end
    object chbxIsGenRepINN: TcxDBCheckBox [6]
      Left = 9
      Top = 109
      Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1048#1053#1053
      DataBinding.DataField = 'IS_GEN_REP_INN'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 4
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item5: TdxLayoutItem [0]
        Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxedtCurrID
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [4]
        Caption = 'cxDBCheckBox1'
        ShowCaption = False
        Control = chbxIsGenRepINN
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    object actPasteFromBuffer: TAction
      Caption = #1042#1089'&'#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object srcMain: TDataSource
    DataSet = dxMemData1
    Left = 112
    Top = 96
  end
  object xlrDeclarant: TxlReport
    DataExportMode = xdmDDE
    Options = [xroOptimizeLaunch, xroDisplayAlerts, xroUseTemp]
    XLSTemplate = 'report\'#1050#1072#1088#1090#1086#1095#1082#1072' '#1042#1069#1044'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'dsHeader'
        Options = [xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSaldo
        Alias = 'dsSaldo'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsOper
        Alias = 'dsOper'
        Range = 'oplist'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSaldo2
        Alias = 'dsSaldo2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsOper2
        Alias = 'dsOper2'
        Range = 'oplist2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = True
    Params = <>
    Left = 200
    Top = 24
  end
  object dsSaldo: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcHeader
    ReadOnly = False
    SQL.Strings = (
      
        'select :from_date FromDate, :to_date ToDate, x.subject_id, x.cur' +
        'rency_id, x.name, x.INN, x.KPP, x.currname, nvl(t.summa, 0) sald' +
        'o'
      'from ('
      'select subject_id, currency_id, sum(summa) summa'
      'from ('
      'select a1.subject_id, a1.currency_id, -sum(t.summa) summa'
      'from fdc_account_entry t,'
      'fdc_account a1'
      'where a1.id = t.debet_id '
      'and a1.hier_name = '#39'100'#39' and a1.payment_type = '#39'01'#39
      'and subject_id = :subj_id and currency_id = :curr_id'
      'and t.item_date < trunc(:from_date)'
      'group by a1.subject_id, a1.currency_id'
      'union all'
      'select a1.subject_id, a1.currency_id, sum(t.summa) summa'
      'from fdc_account_entry t,'
      'fdc_account a1'
      'where a1.id = t.credit_id '
      'and a1.hier_name = '#39'100'#39' and a1.payment_type = '#39'01'#39
      'and subject_id = :subj_id and currency_id = :curr_id'
      'and t.item_date < trunc(:from_date)'
      'group by a1.subject_id, a1.currency_id'
      ')  '
      'group by subject_id , currency_id'
      ') t,    '
      '(select s.name, s.INN, s.KPP, c.name as currname,'
      's.id as subject_id, c.ID as currency_id '
      'from '
      'fdc_subject_lst s      '
      ',fdc_nsi_currency_lst c'
      'where '
      's.id = :subj_id and c.id = :curr_id'
      ') x'
      'where'
      't.subject_id(+) = x.subject_id'
      'and t.currency_id(+) =  x.currency_id'
      'order by x.name, x.currname')
    Left = 176
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
  object dsOper: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcHeader
    ReadOnly = False
    SQL.Strings = (
      
        'select t.item_date "DATE", o2.name as plat_name, o.name, t.opera' +
        'tion_id Nomer, a1.subject_id, null credit, t.summa debit, a1.hie' +
        'r_name debt, a1.payment_type --, a2.hier_name cred, a2.payment_t' +
        'ype'
      'from fdc_account_entry t,'
      'fdc_account a1, fdc_object o,'
      'fdc_object o2, fdc_payment_order po'
      'where a1.id = t.debet_id'
      
        'and a1.hier_name = '#39'100'#39' and a1.payment_type = '#39'01'#39' --and a1.sub' +
        'ject_id =213820'
      'and o.id = t.operation_id'
      
        'and a1.currency_id = :currency_id and a1.subject_id = :subject_i' +
        'd'
      
        'and t.item_date >= trunc(:fromdate) and t.item_date < trunc(:tod' +
        'ate) + 1'
      'and po.id(+) = a1.pay_order_id and o2.id(+) = po.id'
      'union all'
      
        'select t.item_date, o.name as plat_name, null as name, t.operati' +
        'on_id, a1.subject_id, t.summa credit, null debit,  a1.hier_name ' +
        'debt, a1.payment_type --, a2.hier_name cred, a2.payment_type '
      'from fdc_account_entry t,'
      'fdc_account a1, fdc_object o,'
      'fdc_object o2, fdc_payment_order po'
      'where a1.id = t.credit_id '
      
        'and a1.hier_name = '#39'100'#39' and a1.payment_type = '#39'01'#39' --and a1.sub' +
        'ject_id =213820   '
      'and o.id = t.operation_id'
      
        'and a1.currency_id = :currency_id and a1.subject_id = :subject_i' +
        'd'
      
        'and t.item_date >= trunc(:fromdate) and t.item_date < trunc(:tod' +
        'ate) + 1'
      'and po.id(+) = a1.pay_order_id and o2.id(+) = po.id'
      'order by 4,3 asc')
    Left = 240
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'FROMDATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'TODATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptUnknown
      end>
  end
  object srcHeader: TDataSource
    DataSet = dsHeader
    Left = 144
    Top = 96
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 112
    Top = 64
    object dxMemData1SUBJ_ID: TFloatField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJ_ID'
      Required = True
    end
    object dxMemData1SUBJ_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJ_NAME'
      Required = True
      Size = 200
    end
    object dxMemData1FROM_DATE: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'FROM_DATE'
      Required = True
      OnValidate = dxMemData1FROM_DATEValidate
    end
    object dxMemData1TO_DATE: TDateField
      DisplayLabel = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      FieldName = 'TO_DATE'
      Required = True
    end
    object dxMemData1CURR_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_ID'
      Required = True
    end
    object dxMemData1IS_GEN_REP_INN: TIntegerField
      FieldName = 'IS_GEN_REP_INN'
    end
  end
  object dsSaldo2: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcHeader
    ReadOnly = False
    SQL.Strings = (
      
        'select :from_date FromDate, :to_date ToDate, x.subject_id, x.cur' +
        'rency_id, x.name, x.INN, x.KPP, x.currname, nvl(t.summa, 0) sald' +
        'o'
      'from ('
      'select subject_id, currency_id, sum(summa) summa'
      'from ('
      'select a1.subject_id, a1.currency_id, -sum(t.summa) summa'
      'from fdc_account_entry_lst t,'
      'fdc_account_lst a1'
      'where a1.id = t.DEBET_ID'
      'and a1.hier_name = '#39'152'#39' --and a1.payment_type = '#39'  '#39
      'and subject_id = :subj_id and currency_id = :curr_id'
      'and t.item_date < trunc(:from_date)'
      'group by a1.subject_id, a1.currency_id'
      'union all'
      'select a1.subject_id, a1.currency_id, sum(t.summa) summa'
      'from fdc_account_entry_lst t,'
      'fdc_account_lst a1'
      'where a1.id = t.credit_id '
      'and a1.hier_name = '#39'152'#39' --and a1.payment_type = '#39'  '#39
      'and subject_id = :subj_id and currency_id = :curr_id'
      'and t.item_date < trunc(:from_date)'
      'group by a1.subject_id, a1.currency_id'
      ''
      ')  '
      'group by subject_id , currency_id'
      ') t,    '
      '(select s.name, s.INN, s.KPP, c.name as currname,'
      's.id as subject_id, c.ID as currency_id '
      'from '
      'fdc_subject_lst s      '
      ',fdc_nsi_currency_lst c'
      'where '
      's.id = :subj_id and c.id = :curr_id'
      ') x'
      'where'
      't.subject_id(+) = x.subject_id'
      'and t.currency_id(+) =  x.currency_id'
      'order by x.name, x.currname')
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
  object dsOper2: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    DataSource = srcHeader
    ReadOnly = False
    SQL.Strings = (
      
        'select t.item_date "DATE", ot.shortname||'#39' '#39'||o.name name, o2.na' +
        'me as plat_name, pt.code, t.operation_id Nomer, a1.subject_id, n' +
        'ull credit, t.summa debit, a1.hier_name debt, a1.payment_type '
      '--,po.payer_inn'
      'from fdc_account_entry_lst t,'
      'fdc_account_lst a1, fdc_object_lst o,'
      'fdc_object_lst o2, fdc_payment_order_lst po'
      ',fdc_payment_deduction_lst dp, fdc_payment_type_lst pt '
      ',fdc_object_type_lst ot'
      'where a1.id=t.debet_id'
      
        'and a1.hier_name='#39'152'#39'-- and a1.payment_type = '#39'  '#39' --and a1.sub' +
        'ject_id =213820'
      'and o.id=a1.DECL_ID'
      'and a1.currency_id=:currency_id and a1.subject_id = :subject_id'
      
        'and t.item_date >=trunc(:fromdate) and t.item_date < trunc(:toda' +
        'te) + 1'
      'and po.id(+)=a1.pay_order_id and o2.id(+) = po.id'
      'and dp.id(+)=t.operation_id and pt.id(+) = dp.pay_type_id'
      'and ot.ID(+) = o.object_type_id'
      'union all'
      
        'select t.item_date,  ot.shortname||'#39' '#39'||o2.name as plat_name, nu' +
        'll as name, null, t.operation_id, a1.subject_id, t.summa credit,' +
        ' null debit,  a1.hier_name debt, a1.payment_type --, a2.hier_nam' +
        'e cred, a2.payment_type'
      'from fdc_account_entry_lst t,'
      'fdc_account_lst a1, fdc_object_lst o,'
      'fdc_object_lst o2,'
      'fdc_object_type_lst ot'
      'where a1.id=t.credit_id'
      'and a1.hier_name='#39'152'#39' '
      'and o.id=t.operation_id'
      'and a1.currency_id=:currency_id and a1.subject_id = :subject_id'
      
        'and t.item_date >=trunc(:fromdate) and t.item_date < trunc(:toda' +
        'te) + 1'
      'and o2.id(+) = a1.DECL_ID'
      'and ot.ID(+) = o2.object_type_id'
      'order by 1,2 asc, 10, 8 nulls first')
    Left = 272
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'FROMDATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDateTime
        Name = 'TODATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptUnknown
      end>
  end
  object dsHeader: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    Left = 144
    Top = 64
  end
end
