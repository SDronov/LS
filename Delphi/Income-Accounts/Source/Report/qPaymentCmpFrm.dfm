inherited qPaymentCmpForm: TqPaymentCmpForm
  Left = 365
  Top = 282
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1080#1080' '#1074#1089#1077#1093' '#1074#1080#1076#1086#1074' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081
  ClientHeight = 315
  ClientWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 401
    Height = 315
    inherited btnCancel: TcxButton
      Left = 317
      Top = 283
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 236
      Top = 283
      ModalResult = 0
      TabOrder = 5
    end
    object edtSubject: TcxDBButtonEdit [2]
      Left = 57
      Top = 9
      DataBinding.DataField = 'Subj_Name'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edtSubjectPropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 336
    end
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [3]
      Left = 57
      Top = 81
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
      TabOrder = 3
      Width = 336
    end
    object edtDateFrom: TcxDBDateEdit [4]
      Left = 57
      Top = 33
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 336
    end
    object edtDateTo: TcxDBDateEdit [5]
      Left = 57
      Top = 57
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 336
    end
    object gbxType: TcxDBRadioGroup [6]
      Left = 9
      Top = 105
      Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1077#1082' '#1073#1077#1079' '#1089#1087#1080#1089#1072#1085#1080#1103
      DataBinding.DataField = 'Report_Type'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100
          Value = 0
        end
        item
          Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1087#1086#1087#1072#1076#1072#1102#1097#1080#1077' '#1074' '#1087#1077#1088#1080#1086#1076
          Value = 1
        end
        item
          Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074#1089#1077
          Value = 2
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      TabOrder = 4
      Height = 73
      Width = 387
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1087#1086' '
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = fdcObjectLookupEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [4]
        Caption = 'cxDBRadioGroup1'
        ShowCaption = False
        Control = gbxType
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 104
    Top = 73
    object actPasteFromBuffer: TAction
      Caption = 'actPasteFromBuffer'
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 132
    Top = 73
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 216
    Top = 73
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 244
    Top = 73
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 160
    Top = 73
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 73
  end
  object xlrPaymentCmp: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\iacc\Delphi\Bin\report\'#1056#1072#1089#1093#1086#1076#1086#1074#1072#1085#1080#1077#1042#1089#1077#1093#1055#1083#1072#1090#1077#1078#1077#1081'.xls'
    DataSources = <
      item
        DataSet = dxMemData
        Alias = 'aValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dxMemDataReport
        Alias = 'aReport'
        Range = 'Report'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsCurrency
        Alias = 'aCurrency'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSaldoIn
        Alias = 'aSaldoIn'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsSaldoOut
        Alias = 'aSaldoOut'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 210
    Top = 180
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 160
    Top = 180
    object dxMemDataSubj_Id: TFloatField
      FieldName = 'Subj_Id'
    end
    object dxMemDataSubj_Name: TStringField
      FieldName = 'Subj_Name'
      Size = 400
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 400
    end
    object dxMemDataCurr_Id: TFloatField
      FieldName = 'Curr_Id'
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 400
    end
    object dxMemDataCustomInn: TStringField
      FieldName = 'CustomInn'
      Size = 400
    end
    object dxMemDataRep_Day: TStringField
      FieldName = 'Rep_Day'
      Size = 400
    end
    object dxMemDataRep_Month: TStringField
      FieldName = 'Rep_Month'
      Size = 400
    end
    object dxMemDataRep_Year: TStringField
      FieldName = 'Rep_Year'
      Size = 400
    end
    object dxMemDataSaldoIn: TFloatField
      FieldName = 'SaldoIn'
    end
    object dxMemDataSaldoOut: TFloatField
      FieldName = 'SaldoOut'
    end
    object dxMemDataReport_Type: TIntegerField
      FieldName = 'Report_Type'
    end
  end
  object dsReport: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT '
      
        '  decode(doc_no, lag(doc_no, 1) over(order by doc_no, name), nul' +
        'l, doc_no) doc_no'
      
        '  ,decode(doc_no, lag(doc_no, 1) over(order by doc_no, name), to' +
        '_number(null), po_summa) po_summa'
      '  ,name'
      '  ,payment_type'
      
        '  ,decode(doc_no, lag(doc_no, 1) over(order by doc_no, name), to' +
        '_number(null), pay_order_id) pay_order_id'
      '  ,summa'
      'FROM'
      '('
      'SELECT'
      '  p.name as doc_no,'
      '  p.doc_summa as po_summa,'
      '  o.name as Name,'
      '  a2.payment_type as payment_Type,'
      '  a.pay_order_id as pay_order_id,'
      '  ae.summa as summa'
      'FROM'
      '  fdc_account_entry_lst     ae,'
      '  fdc_account_lst           a,'
      '  fdc_account_lst           a2,'
      '  fdc_decl_payment_lst  o,'
      '  fdc_payment_order_lst p'
      'WHERE'
      '  p.payer_id = :Subj_Id'
      '  and ae.debet_id = a.id'
      '  and a.hier_name = '#39'100'#39'    '
      '  and a2.id = ae.credit_id'
      '  and o.id(+) = ae.operation_id'
      '  and a.payment_type = '#39'  '#39
      '  and p.id = a.pay_order_id'
      '  and p.currency_id = :Curr_Id'
      '  and ae.item_date < trunc(:date_to+1)'
      '  and ae.item_date >= trunc(:date_from)'
      ')')
    Left = 110
    Top = 180
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'date_to+1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end>
  end
  object dsValue: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'select stringvalue, sysname from fdc_value_lst_sys')
    Left = 60
    Top = 220
  end
  object dsSaldoIn: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  nvl(- x.saldo, 0) as saldo'
      'from'
      '  fdc_account_saldo_lst x'
      '  ,fdc_account_lst a '
      '  ,(SELECT l.account_id, MAX(l.from_date) from_date'
      '    FROM  fdc_account_saldo_lst l'
      '    WHERE l.from_date < :Date_From'
      '      and l.hier_name = '#39'100'#39
      '      and l.payment_type = '#39'  '#39
      '     and l.currency_id = :Curr_Id'
      '     and l.Subject_Id = :Subj_Id'
      '    GROUP BY l.account_id) t'
      'where'
      '  a.hier_name = '#39'100'#39
      '  and a.payment_type = '#39'  '#39
      '  and a.subject_Id = :Subj_Id'
      '  and a.currency_Id = :Curr_Id'
      '  and a.hier_level = 1'
      '  and t.account_id(+) = a.id'
      '  and x.account_id(+) = t.account_id'
      '  and x.from_date(+) = t.from_date')
    Left = 10
    Top = 180
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object dsSaldoOut: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  nvl(- x.saldo, 0) as saldo'
      'from'
      '  fdc_account_saldo_lst x'
      '  ,fdc_account_lst a '
      '  ,(SELECT l.account_id, MAX(l.from_date) from_date'
      '    FROM  fdc_account_saldo_lst l'
      '    WHERE l.from_date < (1 + :Date_To)'
      '      and l.hier_name = '#39'100'#39
      '      and l.payment_type = '#39'  '#39
      '     and l.currency_id = :Curr_Id'
      '     and l.Subject_Id = :Subj_Id'
      '    GROUP BY l.account_id) t'
      'where'
      '  a.hier_name = '#39'100'#39
      '  and a.payment_type = '#39'  '#39
      '  and a.subject_Id = :Subj_Id'
      '  and a.currency_Id = :Curr_Id'
      '  and a.hier_level = 1'
      '  and t.account_id(+) = a.id'
      '  and x.account_id(+) = t.account_id'
      '  and x.from_date(+) = t.from_date  '#9)
    Left = 10
    Top = 220
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 160
    Top = 220
  end
  object dsHeader: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select '
      '  name as Subj_Name'
      '  ,Inn as Subj_Inn'
      'from '
      '  fdc_Subject_lst '
      'where Id = :Subj_Id')
    Left = 60
    Top = 180
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end>
  end
  object dxMemDataReport: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 160
    Top = 260
  end
  object dsCurrency: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select code, name'
      'from fdc_nsi_currency_lst'
      'where Id = :Curr_Id')
    Left = 60
    Top = 260
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object dsOnlyPays: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  p.name as doc_no,'
      '  p.doc_summa as po_summa'
      'FROM'
      '  fdc_account_entry_lst     ae,'
      '  fdc_account_lst           a,'
      '  fdc_payment_order_lst p'
      'WHERE'
      '  p.payer_id = :Subj_Id'
      '  and p.currency_Id = :Curr_Id'
      '  and ae.credit_id = a.id'
      '  and (a.hier_name = '#39'100'#39' or a.hier_name = '#39'100'#1055#39')'
      '  and a.payment_type = '#39'  '#39
      '  and p.id = a.pay_order_id'
      
        '  and ae.item_date < NVL(trunc(:date_to) + 1, to_date(5373484, '#39 +
        'J'#39'))'
      '  and ae.item_date >= NVL(trunc(:date_from), to_date(1, '#39'J'#39'))'
      '  %0:s')
    Left = 110
    Top = 220
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end>
  end
end
