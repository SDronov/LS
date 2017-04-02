inherited qInfoIncomeForm: TqInfoIncomeForm
  Left = 414
  Top = 368
  Caption = #1057#1087#1088#1072#1074#1082#1072' '#1086' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1080' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 210
  ClientWidth = 493
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 493
    Height = 210
    inherited btnCancel: TcxButton
      Left = 386
      Top = 171
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 281
      Top = 171
      ModalResult = 0
      TabOrder = 3
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 71
      Top = 37
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 413
    end
    object edtDateTo: TcxDBDateEdit [3]
      Left = 71
      Top = 65
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 413
    end
    object edtSubject: TcxDBButtonEdit [4]
      Left = 71
      Top = 9
      DataBinding.DataField = 'Subj_Name'
      DataBinding.DataSource = srcData
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
      Width = 413
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item3: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = #1087#1086
        Control = edtDateTo
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
    Left = 24
    Top = 112
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
  end
  object xlrInfoIncome: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 
      'D:\Projects\iacc\Delphi\Bin\report\'#1057#1087#1088#1072#1074#1082#1072'_'#1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074'.x' +
      'ls'
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
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReportTotal
        Alias = 'aReportTotal'
        Range = 'rngReportTotal6'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 136
    Top = 96
  end
  object srcData: TDataSource
    DataSet = dxMemData
    Left = 64
    Top = 112
  end
  object dsReport: TfdcQuery
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  s.inn'
      '  ,to_char(null) as doc_no_date'
      '  ,to_date(null) as coming_date'
      '  ,c.code'
      '  ,sum(ae.summa) as summa'
      'from'
      '  fdc_subject_lst s'
      '  ,fdc_nsi_currency_lst c'
      '  ,fdc_account_entry_lst ae'
      '  ,fdc_account_lst a'
      'where'
      '  s.id = :Subj_Id'
      '  and a.SUBJECT_ID = s.ID'
      '  and a.id = ae.credit_id'
      '  and (a.hier_name = '#39'100'#39' or a.hier_name = '#39'100'#1055#39')'
      '  and a.CURRENCY_ID = c.id'
      '  and a.payment_type = '#39'  '#39
      '  and ae.item_date >= trunc(:date_from)'
      '  and ae.item_date < trunc(1+:date_to)'
      'group by'
      '  s.INN'
      '  ,c.code')
    Left = 200
    Top = 128
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end>
  end
  object dsHeader: TfdcQuery
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      
        'select name, name ||'#39', '#1048#1053#1053' '#39'||inn as NameInn  from fdc_subject_l' +
        'st where id = :Subj_Id')
    Left = 200
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end>
  end
  object dsReportTotal: TfdcQuery
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  c.code'
      '  ,sum(ae.summa) as summa'
      'from'
      '  fdc_nsi_currency_lst c'
      '  ,fdc_account_entry_lst ae'
      '  ,fdc_account_lst a'
      'where'
      '  a.subject_id = :Subj_Id'
      '  and a.id = ae.credit_id'
      '  and (a.hier_name = '#39'100'#39' or a.hier_name = '#39'100'#1055#39')'
      '  and a.CURRENCY_ID = c.id'
      '  and a.payment_type = '#39'  '#39
      '  and ae.item_date >= trunc(:date_from)'
      '  and ae.item_date < trunc(1+:date_to)'
      'group by'
      '  c.code')
    Left = 200
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end>
  end
end
