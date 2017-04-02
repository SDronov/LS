inherited fdcReportDateForm_DateToForm: TfdcReportDateForm_DateToForm
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 125
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 520
    Height = 125
    inherited btnCancel: TcxButton
      Left = 436
      Top = 93
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 355
      Top = 93
      TabOrder = 2
    end
    object edtDate_From: TcxDBDateEdit [2]
      Left = 52
      Top = 9
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 319
    end
    object edtDate_To: TcxDBDateEdit [3]
      Left = 52
      Top = 36
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 423
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLDate_From: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072' '#1089
        Control = edtDate_From
        ControlOptions.ShowBorder = False
      end
      object dxLDate_To: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072' '#1087#1086
        Control = edtDate_To
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 167
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 167
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 167
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 167
  end
  object xlrNoticeKindPay: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroRefreshParams]
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsBody
        Alias = 'aBody'
        Range = 'rngBody'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 200
    Top = 54
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    Left = 48
    Top = 22
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end>
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 96
    Top = 30
    object dxMemDataCustomsName: TStringField
      DisplayWidth = 400
      FieldName = 'CustomsName'
      Size = 1500
    end
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
      OnChange = dxMemDataDate_FromChange
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataPeriod: TStringField
      DisplayWidth = 300
      FieldName = 'Period'
      Size = 1500
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 40
    Top = 78
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'end_date'
        ParamType = ptUnknown
      end>
  end
end
