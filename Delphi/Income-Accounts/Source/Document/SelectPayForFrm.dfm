inherited SelectPayForForm: TSelectPayForForm
  Left = 374
  Top = 215
  Caption = #1055#1077#1088#1077#1074#1086#1076' '#1089#1088#1077#1076#1089#1090#1074' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1051#1057
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    inherited Bevel1: TBevel
      Top = 310
      Width = 630
    end
    inherited btnCancel: TcxButton
      Left = 312
      Top = 320
      TabOrder = 7
    end
    inherited btnOk: TcxButton
      Left = 207
      Top = 320
      TabOrder = 6
    end
    object edtSubject: TfdcObjectLinkEdit [3]
      Left = 179
      Top = 9
      DataBinding.DataField = 'subject_name'
      DataBinding.DataSource = srcData
      DataBinding.DataKeyField = 'subject_id'
      DataBinding.TypeSysName = 'Declarant;Person;Broker;Bank'
      DataBinding.SearchFormClass = 'TSubjectFindGridForm'
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 378
    end
    object cxDBLabel1: TcxDBLabel [4]
      Left = 179
      Top = 45
      DataBinding.DataField = 'rest_summa'
      DataBinding.DataSource = srcData
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.IsFontAssigned = True
      Height = 27
      Width = 158
    end
    object edtSumma: TcxDBCurrencyEdit [5]
      Left = 179
      Top = 79
      DataBinding.DataField = 'summa'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.AssignedValues.MaxValue = True
      Properties.AssignedValues.MinValue = True
      Properties.Nullable = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 158
    end
    object cxDBDateEdit1: TcxDBDateEdit [6]
      Left = 179
      Top = 115
      DataBinding.DataField = 'doc_date'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 158
    end
    object cxDBTextEdit1: TcxDBTextEdit [7]
      Left = 179
      Top = 151
      DataBinding.DataField = 'doc_no'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 378
    end
    object cxDBMemo1: TcxDBMemo [8]
      Left = 179
      Top = 187
      DataBinding.DataField = 'doc_name'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.IsFontAssigned = True
      TabOrder = 5
      Height = 116
      Width = 242
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        AutoAligns = [aaVertical]
        Caption = #1054#1089#1090#1072#1090#1086#1082
        Control = cxDBLabel1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [2]
        AutoAligns = [aaVertical]
        Caption = #1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1074#1086#1076#1072
        Control = edtSumma
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [3]
        AutoAligns = [aaVertical]
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item6: TdxLayoutItem [4]
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Control = cxDBTextEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item7: TdxLayoutItem [5]
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Control = cxDBMemo1
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOk: TAction
      OnUpdate = actOkUpdate
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
  object dsData: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 48
    Top = 88
    object dsDatasubject_id: TIntegerField
      FieldName = 'subject_id'
    end
    object dsDatasubject_name: TStringField
      FieldName = 'subject_name'
      Size = 1500
    end
    object dsDatasumma: TCurrencyField
      FieldName = 'summa'
      DisplayFormat = ',0.00'
    end
    object dsDatarest_summa: TCurrencyField
      FieldName = 'rest_summa'
      DisplayFormat = ',0.00'
    end
    object dsDatadoc_date: TDateTimeField
      FieldName = 'doc_date'
    end
    object dsDatadoc_no: TStringField
      FieldName = 'doc_no'
    end
    object dsDatadoc_name: TStringField
      FieldName = 'doc_name'
      Size = 500
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 104
    Top = 88
  end
  object Params: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
        Value = 0.010000000000000000
      end>
    Left = 72
    Top = 120
  end
end
