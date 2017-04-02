inherited qPaymentOrderForm: TqPaymentOrderForm
  Left = 410
  Top = 287
  Caption = #1055#1086#1089#1090#1091#1087#1080#1074#1096#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
  ClientHeight = 184
  ClientWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 401
    Height = 184
    inherited btnCancel: TcxButton
      Left = 317
      Top = 152
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 236
      Top = 152
      ModalResult = 0
      TabOrder = 5
    end
    object cmbxCurrency: TfdcObjectLookupEdit [2]
      Left = 77
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
          FieldName = 'Name'
        end>
      Properties.ListSource = DictData.srcCurrency
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 336
    end
    object edtDateFrom: TcxDBDateEdit [3]
      Left = 77
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
      Width = 336
    end
    object edtDateTo: TcxDBDateEdit [4]
      Left = 77
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
      Width = 336
    end
    object edtSubject: TcxDBButtonEdit [5]
      Left = 77
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
    object cmbxPaymentType: TfdcObjectLookupEdit [6]
      Left = 77
      Top = 105
      DataBinding.DataField = 'PayTypeId'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = DictData.srcPayTypes
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 4
      Width = 111
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [2]
        Caption = #1087#1086
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [3]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxCurrency
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [4]
        Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Control = cmbxPaymentType
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    object actPasteFromBuffer: TAction
      Caption = 'actPasteFromBuffer'
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 70
    Top = 130
    object dxMemDataSubj_Id: TFloatField
      FieldName = 'Subj_Id'
    end
    object dxMemDataSubj_Name: TStringField
      FieldName = 'Subj_Name'
      Size = 400
    end
    object dxMemDataCurr_Id: TFloatField
      FieldName = 'Curr_Id'
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 400
    end
    object dxMemDataDateFrom: TDateField
      FieldName = 'DateFrom'
    end
    object dxMemDataDateTo: TDateField
      FieldName = 'DateTo'
    end
    object dxMemDataSubjInnKpp: TStringField
      FieldName = 'SubjInnKpp'
      Size = 200
    end
    object dxMemDataCurrCode: TStringField
      FieldName = 'CurrCode'
      Size = 100
    end
    object dxMemDataPayTypeId: TFloatField
      FieldName = 'PayTypeId'
    end
  end
  object xlrPaymentOrder: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1055#1086#1089#1090#1091#1087#1080#1074#1096#1080#1077' '#1055#1055'.xls'
    DataSources = <
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'Report'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dxMemData
        Alias = 'aValue'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsTotal
        Alias = 'aTotal'
        Range = 'Total4'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 110
    Top = 130
  end
  object dsInnKpp: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      
        'select Inn||'#39'\'#39'||Kpp as InnKpp from fdc_Subject_Lst where Id = :' +
        'Subj_Id')
    Left = 90
    Top = 210
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end>
  end
  object dsReport: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  coming_date'
      '  ,doc_no'
      '  ,doc_date'
      '  ,summa'
      '  ,curr_Code'
      '  ,payer_name'
      '  ,payer_inn'
      '  ,payer_kpp'
      'from'
      '  fdc_payment_order_lst'
      'where'
      '  (Payer_Id = :Subj_Id or :Subj_Id is null)'
      
        '  and (coming_date between :DateFrom and :DateTo or :DateFrom is' +
        ' null and :DateTo is null)'
      '  and (currency_Id = :Curr_Id or :Curr_Id is null)'
      '  and (pay_type_id = :PayTypeId or :PayTypeId is null)')
    Left = 170
    Top = 210
    ParamData = <
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
        DataType = ftDate
        Name = 'DateFrom'
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
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PayTypeId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PayTypeId'
        ParamType = ptUnknown
      end>
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 70
    Top = 170
  end
  object dsCurrency: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select code from fdc_nsi_currency_lst where id = :Curr_Id')
    Left = 130
    Top = 210
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end>
  end
  object dsTotal: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select '
      '  sum(summa) as summa'
      '  ,curr_code'
      'from'
      '  fdc_payment_order_lst'
      'where'
      '  (Payer_Id = :Subj_Id or :Subj_Id is null)'
      
        '  and (coming_date between :DateFrom and :DateTo or :DateFrom is' +
        ' null and :DateTo is null)'
      '  and (currency_Id = :Curr_Id or :Curr_Id is null)'
      '  and (pay_type_id = :PayTypeId or :PayTypeId is null)'
      'group by'
      '  curr_code')
    Left = 210
    Top = 210
    ParamData = <
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
        DataType = ftDate
        Name = 'DateFrom'
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
      end
      item
        DataType = ftDate
        Name = 'DateTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Curr_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PayTypeId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PayTypeId'
        ParamType = ptUnknown
      end>
  end
end
