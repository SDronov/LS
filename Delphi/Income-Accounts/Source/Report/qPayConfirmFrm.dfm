inherited qPayConfirmForm: TqPayConfirmForm
  Left = 473
  Top = 396
  HelpContext = 4123
  Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1091#1087#1083#1072#1090#1099
  ClientHeight = 167
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 167
    inherited btnCancel: TcxButton
      Top = 135
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Top = 135
      ModalResult = 0
      TabOrder = 3
    end
    object edtSubject: TcxDBButtonEdit [2]
      Left = 119
      Top = 9
      DataBinding.DataField = 'Subject_Name'
      DataBinding.DataSource = srcMemData
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
      Width = 312
    end
    object edtDate_From: TcxDBDateEdit [3]
      Left = 119
      Top = 33
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 312
    end
    object edtDate_To: TcxDBDateEdit [4]
      Left = 119
      Top = 57
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMemData
      ParentFont = False
      Properties.ReadOnly = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 312
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciSubject: TdxLayoutItem [0]
        Caption = #1057#1091#1073#1098#1077#1082#1090' - '#1047#1072#1103#1074#1080#1090#1077#1083#1100
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object lciDate_From: TdxLayoutItem [1]
        Caption = #1055#1077#1088#1080#1086#1076' '#1089
        Control = edtDate_From
        ControlOptions.ShowBorder = False
      end
      object lciDate_To: TdxLayoutItem [2]
        Caption = #1087#1086
        Control = edtDate_To
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
    Left = 24
    Top = 72
    object dxMemDataSubj_Id: TFloatField
      FieldName = 'Subject_Id'
    end
    object dxMemDataSubj_Name: TStringField
      FieldName = 'Subject_Name'
      Size = 200
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
  end
  object srcMemData: TDataSource
    DataSet = dxMemData
    Left = 64
    Top = 72
  end
  object xlrPayConfirm: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroAutoClose]
    XLSTemplate = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1091#1087#1083#1072#1090#1099'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoAutoClose, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsData
        Alias = 'aData'
        Range = 'rngData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 296
    Top = 80
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    DataSource = srcMemData
    ReadOnly = False
    SQL.Strings = (
      'subject_id = :subject_id')
    Left = 152
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
  end
  object dsData: TfdcQuery
    Session = MainData.Session
    DataSource = srcMemData
    ReadOnly = False
    SQL.Strings = (
      'subject_id = :subject_id'
      'date_from = :date_from'
      'date_to = :date_to')
    Left = 224
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_to'
        ParamType = ptUnknown
      end>
  end
end
