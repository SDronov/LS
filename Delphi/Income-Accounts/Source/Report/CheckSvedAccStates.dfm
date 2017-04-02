inherited checkSvedAccStatesForm: TcheckSvedAccStatesForm
  Left = 525
  Top = 479
  AutoSize = True
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1083#1080#1094#1077#1074#1099#1093' '#1089#1095#1077#1090#1086#1074
  ClientHeight = 155
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 155
    inherited btnCancel: TcxButton
      Top = 123
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Top = 123
      TabOrder = 3
    end
    object edtRepDate: TcxDBDateEdit [2]
      Left = 89
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
    object cxDBMaskEdit1: TcxDBMaskEdit [3]
      Left = 89
      Top = 36
      DataBinding.DataField = 'INN'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,12}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxDBMaskEdit2: TcxDBMaskEdit [4]
      Left = 89
      Top = 63
      DataBinding.DataField = 'KPP'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,9}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lciReport_Date: TdxLayoutItem [0]
        Caption = #1054#1090#1095#1077#1090#1085#1072#1103' '#1076#1072#1090#1072
        Control = edtRepDate
        ControlOptions.ShowBorder = False
      end
      object lciINN: TdxLayoutItem [1]
        Caption = #1048#1053#1053
        Control = cxDBMaskEdit1
        ControlOptions.ShowBorder = False
      end
      object lciKPP: TdxLayoutItem [2]
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
        Name = 'date_rep'
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
    Left = 192
    Top = 112
    object dsHeaderdate_report: TStringField
      FieldName = 'date_report'
    end
    object dsHeaderCustomsName: TStringField
      FieldName = 'CustomsName'
      Size = 30
    end
    object dsHeaderCustomsCode: TStringField
      FieldName = 'CustomsCode'
    end
  end
  object xlrAvansLong: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'AccStates.xls'
    DataSources = <
      item
        DataSet = dsTotals
        Alias = 'aTotals'
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
    Left = 234
    Top = 112
  end
  object srcdsMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 104
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
  object dsTotals: TfdcQuery
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
        Name = 'date_rep'
        ParamType = ptUnknown
      end>
  end
end
