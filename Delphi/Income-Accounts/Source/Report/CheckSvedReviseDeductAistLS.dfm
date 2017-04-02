inherited CheckSvedReviseDeductAistLSForm: TCheckSvedReviseDeductAistLSForm
  Left = 433
  Top = 452
  AutoSize = True
  Caption = #1057#1074#1077#1088#1082#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1089' '#1040#1048#1057' '#1040#1048#1057#1058'-'#1052
  ClientHeight = 282
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 536
    Height = 282
    inherited btnCancel: TcxButton
      Left = 452
      Top = 250
      TabOrder = 7
    end
    inherited btnOk: TcxButton
      Left = 371
      Top = 250
      TabOrder = 6
    end
    object edtDate_from: TcxDBDateEdit [2]
      Left = 77
      Top = 71
      DataBinding.DataField = 'dlgDate_From'
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
    object edtDate_to: TcxDBDateEdit [3]
      Left = 77
      Top = 98
      DataBinding.DataField = 'dlgDate_To'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 121
    end
    object cxDBMaskEdit1: TcxDBMaskEdit [4]
      Left = 77
      Top = 125
      DataBinding.DataField = 'INN'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,12}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 3
      Width = 121
    end
    object cxDBMaskEdit2: TcxDBMaskEdit [5]
      Left = 77
      Top = 152
      DataBinding.DataField = 'KPP'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '\d{0,9}'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 4
      Width = 121
    end
    object cmbxPaytype: TfdcObjectLookupEdit [6]
      Left = 77
      Top = 179
      DataBinding.DataField = 'PaytypeCode'
      DataBinding.DataSource = srcdsMain
      ParentFont = False
      Properties.KeyFieldNames = 'CODE'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = DictData.srcPayTypes
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 5
      Width = 145
    end
    object rgReportType: TcxRadioGroup [7]
      Left = 9
      Top = 9
      Caption = ' '#1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1086#1090#1095#1077#1090' '
      ParentColor = False
      ParentFont = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1103#1084
          Value = '0'
        end
        item
          Caption = #1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
          Value = '1'
        end>
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = OfficeEditStyleController
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Height = 56
      Width = 518
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        ShowCaption = False
        Control = rgReportType
        ControlOptions.ShowBorder = False
      end
      object lciDateFrom: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1089
        Control = edtDate_from
        ControlOptions.ShowBorder = False
      end
      object lciDateTo: TdxLayoutItem [2]
        Caption = #1044#1072#1090#1072' '#1087#1086
        Control = edtDate_to
        ControlOptions.ShowBorder = False
      end
      object lciINN: TdxLayoutItem [3]
        Caption = #1048#1053#1053
        Control = cxDBMaskEdit1
        ControlOptions.ShowBorder = False
      end
      object lciKPP: TdxLayoutItem [4]
        Caption = #1050#1055#1055
        Control = cxDBMaskEdit2
        ControlOptions.ShowBorder = False
      end
      object lciPaytype: TdxLayoutItem [5]
        Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Control = cmbxPaytype
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
    Left = 240
    Top = 32
  end
  object xlrAvansLong: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'ReviseDeductAistLS.xls'
    DataSources = <
      item
        DataSet = dsTotals1
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
        Range = 'list'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 290
    Top = 24
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 208
    Top = 24
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
    object dxMemDataPaytypeCode: TStringField
      FieldName = 'PaytypeCode'
    end
    object dxMemDataReportType: TIntegerField
      FieldName = 'ReportType'
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
    Left = 144
    Top = 56
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
      end
      item
        DataType = ftString
        Name = 'PAYTYPECODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ReportType'
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
    Left = 112
    Top = 48
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
      end
      item
        DataType = ftString
        Name = 'PAYTYPECODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ReportType'
        ParamType = ptUnknown
      end>
  end
  object dsHeader: TfdcQuery
    DataSource = srcdsMain
    ReadOnly = False
    Left = 312
    Top = 32
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
end
