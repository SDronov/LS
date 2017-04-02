inherited qDebetCreditForm: TqDebetCreditForm
  Left = 297
  Top = 237
  Caption = #1055#1083#1072#1090#1077#1078#1080' '#1080' '#1080#1093' '#1088#1072#1089#1093#1086#1076
  ClientHeight = 313
  ClientWidth = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 362
    Height = 313
    inherited btnCancel: TcxButton
      Left = 278
      Top = 281
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 197
      Top = 281
      ModalResult = 0
      TabOrder = 4
    end
    object cmbxCurrency: TfdcObjectLookupEdit [2]
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
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 302
    end
    object edtDateTo: TcxDBDateEdit [3]
      Left = 57
      Top = 57
      DataBinding.DataField = 'DateTo'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 302
    end
    object edtDateFrom: TcxDBDateEdit [4]
      Left = 57
      Top = 33
      DataBinding.DataField = 'DateFrom'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 302
    end
    object edtSubject: TcxDBButtonEdit [5]
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
      Properties.ReadOnly = True
      Properties.OnButtonClick = edtSubjectPropertiesButtonClick
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 302
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [1]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1087#1086
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [3]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurrency
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 144
    object actPasteFromBuffer: TAction
      Caption = 'actPasteFromBuffer'
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 172
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 256
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 284
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 200
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 228
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 30
    Top = 150
    object dxMemDataSubj_Name: TStringField
      FieldName = 'Subj_Name'
      Size = 400
    end
    object dxMemDataSubj_Id: TFloatField
      FieldName = 'Subj_Id'
    end
    object dxMemDataCurr_Id: TFloatField
      FieldName = 'Curr_Id'
    end
    object dxMemDataDateFrom: TDateField
      FieldName = 'DateFrom'
    end
    object dxMemDataDateTo: TDateField
      FieldName = 'DateTo'
    end
    object dxMemDataSubjInnKpp: TStringField
      FieldName = 'SubjInnKpp'
      Size = 400
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 200
    end
    object dxMemDataRest_Begin_Total: TFloatField
      FieldName = 'Rest_Begin_Total'
    end
    object dxMemDataRest_End_Total: TFloatField
      FieldName = 'Rest_End_Total'
    end
    object dxMemDataSumma_Total: TFloatField
      FieldName = 'Summa_Total'
    end
    object dxMemDataComing_Total: TFloatField
      FieldName = 'Coming_Total'
    end
    object dxMemDataPo_Total: TFloatField
      FieldName = 'Po_Total'
    end
  end
  object xlrDebetCredit: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1055#1083#1072#1090#1077#1078#1080#1056#1072#1089#1093#1086#1076'.xls'
    DataSources = <
      item
        DataSet = dsCurrency
        Alias = 'aCurrency'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dxMemData
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 90
    Top = 150
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 140
    Top = 150
  end
  object dsInnKpp: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      
        'select INN||'#39' \ '#39'||KPP as InnKpp from fdc_subject_lst where id =' +
        ' :Subj_Id')
    Left = 180
    Top = 150
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end>
  end
  object dsCurrency: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select code from fdc_nsi_currency_lst where id = :Curr_Id')
    Left = 220
    Top = 150
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object dsReport: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    Left = 30
    Top = 190
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'subj_id'
        ParamType = ptUnknown
      end>
  end
  object dsOnlyPays: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'SELECT'
      '  p.doc_no as doc_no'
      '  ,p.doc_date as doc_date'
      '  ,p.coming_date as coming_date'
      '  ,p.doc_summa as po_summa'
      
        '  ,fdc_payment_order_GetRestSumma(p.id, :DateFrom) as po_rest_su' +
        'mma_begin'
      '  ,p.rest_summa as po_rest_summa_end'
      '  ,to_char(null) as decl_no'
      '  ,to_char(null) as decl_typename'
      '  ,to_char(null) as payment_type'
      '  ,to_number(null) as summa'
      '  ,to_date(null) as item_date'
      '  ,to_date(null) as budget_date'
      'FROM'
      '  fdc_account_entry_lst  ae'
      '  ,fdc_account_lst       a'
      '  ,fdc_payment_order_lst p'
      '  ,fdc_nsi_currency_lst  c'
      'WHERE'
      '  p.payer_id = :Subj_Id'
      '  and p.currency_id = :Curr_Id'
      '  and ae.credit_id = a.id'
      '  and (a.hier_name = '#39'100'#39' or a.hier_name = '#39'100'#1055#39')'
      '  and a.payment_type = '#39'  '#39
      '  and p.id = a.pay_order_id'
      '  and c.id(+) = p.currency_id'
      
        '  and ae.item_date < NVL(trunc(:DateTo) + 1, to_date(5373484, '#39'J' +
        #39'))'
      '  and ae.item_date >= NVL(trunc(:DateFrom), to_date(1, '#39'J'#39'))'
      '  %s')
    Left = 90
    Top = 190
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateFrom'
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
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DateFrom'
        ParamType = ptUnknown
      end>
  end
end
