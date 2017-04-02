inherited qAvansCmpNewForm: TqAvansCmpNewForm
  Left = 437
  Top = 309
  Caption = #1040#1082#1090' '#1074#1099#1074#1077#1088#1082#1080' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
  ClientHeight = 229
  ClientWidth = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 464
    Height = 229
    inherited btnCancel: TcxButton
      Left = 380
      Top = 197
      TabOrder = 7
    end
    inherited btnOk: TcxButton
      Left = 299
      Top = 197
      ModalResult = 0
      TabOrder = 6
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
    object cmbxCurrency: TfdcObjectLookupEdit [3]
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
      Width = 335
    end
    object chbxGenRepINN: TcxDBCheckBox [6]
      Left = 9
      Top = 105
      Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1048#1053#1053
      DataBinding.DataField = 'IsGenReport'
      DataBinding.DataSource = srcMain
      ParentColor = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 4
      Width = 121
    end
    object RadioGrSelectDate: TRadioGroup [7]
      Left = 9
      Top = 132
      Width = 446
      Height = 54
      ItemIndex = 0
      Items.Strings = (
        #1087#1086' '#1076#1072#1090#1077' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1074' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093' '#1080' '#1076#1072#1090#1077' '#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1080#1103' '#1089#1088#1077#1076#1089#1090#1074
        #1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074)
      TabOrder = 5
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
        Control = cmbxCurrency
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item7: TdxLayoutItem [4]
        Caption = 'cxDBCheckBox1'
        ShowCaption = False
        Control = chbxGenRepINN
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [5]
        Caption = 'RadioGroup1'
        ShowCaption = False
        Control = RadioGrSelectDate
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 104
    Top = 17
    object actPasteFromBuffer: TAction
      Caption = 'actPasteFromBuffer'
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 132
    Top = 17
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 216
    Top = 17
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 244
    Top = 17
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 160
    Top = 17
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 17
  end
  object xlrAvansCmp: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = #1040#1050#1058'_'#1042#1067#1042#1045#1056#1050#1048'_'#1040#1042#1040#1053#1057#1054#1042#1067#1061'_'#1055#1051#1040#1058#1045#1046#1045#1049'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'Report'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 215
    Top = 89
  end
  object dxMemData: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F1000000008000000060008005375626A5F49640090
      01000001000A005375626A5F4E616D65000400000009000A00446174655F4672
      6F6D000400000009000800446174655F546F009001000001000700506572696F
      64000800000006000800437572725F4964009001000001000C00437573746F6D
      734E616D65009001000001000A00437573746F6D496E6E009001000001000800
      5265705F446179009001000001000A005265705F4D6F6E746800900100000100
      09005265705F5965617200080000000600080053616C646F496E000800000006
      00090053616C646F4F7574000400000003000C005265706F72745F5479706500
      0400000003000C00497347656E5265706F7274000C000000010009005355424A
      5F494E4E00}
    SortOptions = []
    Left = 168
    Top = 81
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
    object dxMemDataSaldoIn: TFloatField
      FieldName = 'SaldoIn'
    end
    object dxMemDataSaldoOut: TFloatField
      FieldName = 'SaldoOut'
    end
    object dxMemDataReport_Type: TIntegerField
      FieldName = 'Report_Type'
    end
    object dxMemDataIsGenReport: TIntegerField
      FieldName = 'IsGenReport'
    end
    object dxMemDataSUBJ_INN: TStringField
      FieldName = 'SUBJ_INN'
      Size = 12
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 168
    Top = 109
  end
  object dsHeader: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    Left = 196
    Top = 52
    ParamData = <
      item
        DataType = ftFloat
        Name = 'subj_id'
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
      end
      item
        DataType = ftFloat
        Name = 'curr_id'
        ParamType = ptUnknown
      end>
  end
  object dsCurrency: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    SQL.Strings = (
      'select code, name'
      'from fdc_nsi_currency_lst'
      'where Id = :Curr_Id')
    Left = 241
    Top = 52
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
    Left = 136
    Top = 60
    ParamData = <
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'isgenreport'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subj_inn'
        ParamType = ptUnknown
      end>
  end
  object dsReport_activation_date: TfdcQuery
    DataSource = srcMain
    ReadOnly = False
    Left = 312
    Top = 76
    ParamData = <
      item
        DataType = ftDate
        Name = 'date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'isgenreport'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'subj_inn'
        ParamType = ptUnknown
      end>
  end
end
