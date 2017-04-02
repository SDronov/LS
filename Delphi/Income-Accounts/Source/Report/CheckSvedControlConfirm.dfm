inherited CheckSvedControlConfirmForm: TCheckSvedControlConfirmForm
  Left = 592
  Top = 378
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1077#1084' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1074' '#1088#1077#1077#1089#1090#1088#1099
  ClientHeight = 151
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 151
    inherited btnCancel: TcxButton
      Top = 119
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Top = 119
      TabOrder = 4
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
    object edtDate_to: TcxDBDateEdit [3]
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
    object cxDBMaskEdit1: TcxDBMaskEdit [4]
      Left = 52
      Top = 63
      DataBinding.DataField = 'INN'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,12}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object cxDBMaskEdit2: TcxDBMaskEdit [5]
      Left = 52
      Top = 90
      DataBinding.DataField = 'KPP'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,9}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciDateFrom: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1089
        Control = edtDate_from
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1087#1086
        Control = edtDate_to
        ControlOptions.ShowBorder = False
      end
      object lciINN: TdxLayoutItem [2]
        Caption = #1048#1053#1053
        Control = cxDBMaskEdit1
        ControlOptions.ShowBorder = False
      end
      object lciKPP: TdxLayoutItem [3]
        Caption = #1050#1055#1055
        Control = cxDBMaskEdit2
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
  object srcdsMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 112
  end
  object xlrAvansLong: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'ControlConfirms.xls'
    DataSources = <
      item
        DataSet = dsTotals1
        Alias = 'aTotals1'
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
        Range = 'list'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsTotals2
        Alias = 'aTotals2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 194
    Top = 88
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 88
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
    object dxMemDataCustomsCode: TStringField
      FieldName = 'CustomsCode'
    end
    object dxMemDatadate_rep: TDateField
      FieldName = 'date_rep'
    end
    object dxMemDataINN: TStringField
      FieldName = 'INN'
    end
    object dxMemDataKPP: TStringField
      FieldName = 'KPP'
    end
  end
  object dsTotals1: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    SQL.Strings = (
      ':Subj_Id'
      ':INNREPORT'
      ':rep_mode'
      ':date_from'
      ':date_to')
    Left = 136
    Top = 88
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
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end>
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
    Left = 104
    Top = 88
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end>
  end
  object dsHeader: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    Left = 168
    Top = 88
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'kpp'
        ParamType = ptUnknown
      end>
    object dsHeaderdate_from: TStringField
      FieldName = 'date_from'
    end
    object dsHeaderdate_to: TStringField
      FieldName = 'date_to'
    end
    object dsHeaderINN: TStringField
      FieldName = 'INN'
    end
    object dsHeaderKPP: TStringField
      FieldName = 'KPP'
    end
  end
  object dsTotals2: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    SQL.Strings = (
      ':Subj_Id'
      ':INNREPORT'
      ':rep_mode'
      ':date_from'
      ':date_to')
    Left = 136
    Top = 88
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
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end>
  end
end
