inherited qAvansRashodNewForm: TqAvansRashodNewForm
  Left = 598
  Top = 561
  HelpContext = 4122
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1080#1080' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 180
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 180
    inherited btnCancel: TcxButton
      Left = 346
      Top = 148
      Width = 77
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 263
      Top = 148
      Width = 77
      ModalResult = 0
      TabOrder = 4
    end
    object edtSubject: TcxDBButtonEdit [2]
      Left = 118
      Top = 9
      DataBinding.DataField = 'Subj_Name'
      DataBinding.DataSource = srcdsMain
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
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Width = 237
    end
    object edtDate_From: TcxDBDateEdit [3]
      Left = 68
      Top = 85
      DataBinding.DataField = 'dlgDate_From'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 237
    end
    object edtDate_To: TcxDBDateEdit [4]
      Left = 68
      Top = 109
      DataBinding.DataField = 'dlgDate_To'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 237
    end
    object chbxINN: TcxDBCheckBox [5]
      Left = 9
      Top = 33
      Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1048#1053#1053
      DataBinding.DataField = 'INNReport'
      DataBinding.DataSource = srcdsMain
      ParentColor = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.ImmediatePost = True
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 1
      Width = 400
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciSubject: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090' - '#1079#1072#1103#1074#1080#1090#1077#1083#1100
        LookAndFeel = LayoutOfficeLookAndFeel
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [1]
        Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1087#1086' '#1048#1053#1053
        ShowCaption = False
        Control = chbxINN
        ControlOptions.ShowBorder = False
      end
      object lcgDate: TdxLayoutGroup [2]
        LookAndFeel = LayoutOfficeLookAndFeel
        object lciDate_From: TdxLayoutItem
          Caption = #1055#1077#1088#1080#1086#1076' '#1089
          Control = edtDate_From
          ControlOptions.ShowBorder = False
        end
        object lciDate_To: TdxLayoutItem
          Caption = #1087#1086
          Control = edtDate_To
          ControlOptions.ShowBorder = False
        end
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        LookAndFeel = LayoutOfficeLookAndFeel
      end
    end
  end
  inherited ActionList: TActionList
    Left = 232
    Top = 39
    object actPasteFromBuffer: TAction
      Caption = #1042#1089'&'#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
      ShortCut = 114
      OnExecute = actPasteFromBufferExecute
      OnUpdate = actPasteFromBufferUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 260
    Top = 39
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 344
    Top = 39
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 372
    Top = 39
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 288
    Top = 39
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 316
    Top = 39
  end
  object dsSysValues: TfdcQuery
    ReadOnly = False
    Left = 80
    Top = 104
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 64
    object dxMemDataBossName: TStringField
      FieldName = 'BossName'
      Size = 2000
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 2000
    end
    object dxMemDataSubj_Id: TFloatField
      FieldName = 'Subj_Id'
    end
    object dxMemDataSubj_Name: TStringField
      FieldName = 'Subj_Name'
      Size = 512
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataRest: TStringField
      FieldName = 'Rest'
      Size = 512
    end
    object dxMemDataPeriod: TStringField
      FieldName = 'Period'
      Size = 200
    end
    object dxMemDatadlgDate_From: TDateField
      FieldName = 'dlgDate_From'
    end
    object dxMemDatadlgDate_To: TDateField
      FieldName = 'dlgDate_To'
    end
    object dxMemDataDate_Now: TDateField
      FieldName = 'Date_Now'
    end
    object dxMemDataINNReport: TIntegerField
      FieldName = 'INNReport'
    end
    object dxMemDataSubj_INN: TStringField
      FieldName = 'Subj_INN'
      Size = 12
    end
  end
  object srcdsMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 104
  end
  object dsHeader: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    Left = 80
    Top = 64
  end
  object xlrAvansLong: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = #1040#1074#1072#1085#1089#1086#1074#1099#1081' '#1086#1090#1095#1077#1090'.xls'
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
        DataSet = dsLong
        Alias = 'aLong2'
        Range = 'list2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 162
    Top = 104
  end
  object dsLong: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    SQL.Strings = (
      ':Subj_Id'
      ':INNREPORT'
      ':rep_mode'
      ':date_from'
      ':date_to')
    Left = 120
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INNREPORT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rep_mode'
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
