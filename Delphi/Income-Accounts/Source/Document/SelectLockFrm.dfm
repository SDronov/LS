inherited SelectLockForm: TSelectLockForm
  Left = 420
  Top = 279
  Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1089#1091#1084#1084#1099
  ClientHeight = 331
  ClientWidth = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 418
    Height = 331
    inherited Bevel1: TBevel
      Top = 291
      Width = 482
    end
    inherited btnCancel: TcxButton
      Left = 334
      Top = 299
      TabOrder = 8
    end
    inherited btnOk: TcxButton
      Left = 253
      Top = 299
      TabOrder = 7
    end
    object edtSubject: TfdcObjectLinkEdit [3]
      Left = 105
      Top = 156
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
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 304
    end
    object edtLockSum: TcxDBCurrencyEdit [4]
      Left = 105
      Top = 126
      DataBinding.DataField = 'summa'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 160
    end
    object edtCustomsCode: TcxDBTextEdit [5]
      Left = 105
      Top = 9
      DataBinding.DataField = 'customs_code'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 287
    end
    object cxDBDateEdit1: TcxDBDateEdit [6]
      Left = 105
      Top = 39
      DataBinding.DataField = 'reg_date'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit [7]
      Left = 105
      Top = 69
      DataBinding.DataField = 'decl_no'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 287
    end
    object edtNote: TcxDBMemo [8]
      Left = 105
      Top = 186
      DataBinding.DataField = 'note'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.ScrollBars = ssVertical
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 6
      Height = 89
      Width = 185
    end
    object edtRestSum: TcxDBCurrencyEdit [9]
      Left = 105
      Top = 99
      DataBinding.DataField = 'rest_summa'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clInfoBk
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 160
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item4: TdxLayoutItem [0]
        Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
        Control = edtCustomsCode
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [1]
        AutoAligns = [aaVertical]
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Control = cxDBDateEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item6: TdxLayoutItem [2]
        Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Control = cxDBTextEdit2
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item11: TdxLayoutItem [3]
        AutoAligns = [aaVertical]
        Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1087'/'#1087
        Control = edtRestSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [4]
        AutoAligns = [aaVertical]
        Caption = #1057#1091#1084#1084#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
        Control = edtLockSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [5]
        Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
        Control = edtSubject
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item9: TdxLayoutItem [6]
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Control = edtNote
        ControlOptions.ShowBorder = False
      end
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
    Left = 40
    Top = 88
    object dsDatabdate: TDateTimeField
      FieldName = 'bdate'
    end
    object dsDatasumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
      FieldName = 'summa'
      Required = True
    end
    object dsDatacustoms_code: TStringField
      FieldName = 'customs_code'
      Size = 8
    end
    object dsDatareg_date: TDateTimeField
      FieldName = 'reg_date'
    end
    object dsDatadecl_no: TStringField
      FieldName = 'decl_no'
      Size = 10
    end
    object dsDatasubject_id: TIntegerField
      FieldName = 'subject_id'
    end
    object dsDatasubject_name: TStringField
      FieldName = 'subject_name'
      Size = 1500
    end
    object dsDatarest_summa: TFloatField
      FieldName = 'rest_summa'
    end
    object dsDatanote: TStringField
      FieldName = 'note'
      Size = 1000
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
