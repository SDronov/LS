inherited CheckSvedCustomReportForm: TCheckSvedCustomReportForm
  Left = 674
  Top = 593
  AutoSize = True
  Caption = #1060#1072#1082#1090#1099' '#1086#1073#1098#1077#1076#1080#1085#1077#1085#1080#1103' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
  ClientHeight = 115
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 115
    inherited btnCancel: TcxButton
      Top = 83
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Top = 83
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
        Control = edtDate_from
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1087#1086
        LookAndFeel = LayoutOfficeLookAndFeel
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
    XLSTemplate = #1060#1072#1082#1090#1099#1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1103#1051#1057'.xls'
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
        Range = 'lst5'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 282
    Top = 96
  end
end
