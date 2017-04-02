inherited CheckSvedDocsNotAccForm: TCheckSvedDocsNotAccForm
  Left = 645
  Top = 471
  AutoSize = True
  Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1073#1077#1079' '#1087#1088#1080#1079#1085#1072#1082#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
  ClientHeight = 95
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 95
    inherited btnCancel: TcxButton
      Top = 63
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Top = 63
      TabOrder = 2
    end
    object edtDate_from: TcxDBDateEdit [2]
      Left = 52
      Top = 9
      DataBinding.DataField = 'dlgDate_From'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 121
    end
    object edtDateTo: TcxDBDateEdit [3]
      Left = 52
      Top = 36
      DataBinding.DataField = 'dlgDate_To'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciDateFrom: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1089
        LookAndFeel = LayoutOfficeLookAndFeel
        Visible = False
        Control = edtDate_from
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1087#1086
        LookAndFeel = LayoutOfficeLookAndFeel
        Visible = False
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 88
    Top = 135
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 135
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 336
    Top = 95
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 220
    Top = 127
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 152
    Top = 143
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 164
    Top = 111
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 24
    Top = 128
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
  object dsSysValues: TfdcQuery
    ReadOnly = False
    Left = 80
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
  object dsHeader: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    Left = 192
    Top = 112
  end
  object xlrAvansLong: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'DocsNotAcc.xls'
    DataSources = <
      item
        DataSet = dxMemData
        Alias = 'aValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsLong
        Alias = 'aLong2'
        Range = 'list'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 282
    Top = 96
  end
end
