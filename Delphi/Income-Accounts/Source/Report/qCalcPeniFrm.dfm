inherited qCalcPeniForm: TqCalcPeniForm
  Left = 274
  Top = 236
  Caption = #1056#1072#1089#1095#1077#1090' '#1087#1077#1085#1080
  ClientHeight = 340
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 595
    Height = 340
    object Bevel1: TBevel [0]
      Left = 9
      Top = 81
      Width = 470
      Height = 8
      Shape = bsBottomLine
    end
    inherited btnCancel: TcxButton
      Left = 511
      Top = 308
      TabOrder = 7
    end
    inherited btnOk: TcxButton
      Left = 430
      Top = 308
      ModalResult = 0
      TabOrder = 6
    end
    object grdResult: TcxGrid [3]
      Left = 94
      Top = 119
      Width = 192
      Height = 152
      TabOrder = 4
      object grdResultDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = srcOut
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        object grdResultDBTableView1Column1: TcxGridDBColumn
          Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1088#1086#1095#1082#1080
          DataBinding.FieldName = 'Period'
          Width = 200
        end
        object grdResultDBTableView1Column2: TcxGridDBColumn
          Caption = #1057#1090#1072#1074#1082#1072' '#1088#1077#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'Rate'
          Width = 150
        end
        object grdResultDBTableView1Column3: TcxGridDBColumn
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1087#1088#1086#1089#1088#1086#1095#1082#1080
          DataBinding.FieldName = 'Day_Count'
          Width = 150
        end
        object grdResultDBTableView1Column4: TcxGridDBColumn
          Caption = #1057#1091#1084#1084#1072' '#1087#1077#1085#1080
          DataBinding.FieldName = 'Summa'
          Width = 100
        end
      end
      object grdResultLevel1: TcxGridLevel
        GridView = grdResultDBTableView1
      end
    end
    object edtDateFrom: TcxDBDateEdit [4]
      Left = 94
      Top = 33
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcIn
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 394
    end
    object edtDateTo: TcxDBDateEdit [5]
      Left = 94
      Top = 57
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcIn
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 394
    end
    object edtSumma: TcxDBTextEdit [6]
      Left = 94
      Top = 9
      DataBinding.DataField = 'Summa'
      DataBinding.DataSource = srcIn
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 394
    end
    object btnCalc: TcxButton [7]
      Left = 433
      Top = 277
      Width = 153
      Height = 23
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1088#1072#1089#1095#1077#1090
      TabOrder = 5
      OnClick = btnCalcClick
    end
    object edtTotal: TcxDBTextEdit [8]
      Left = 94
      Top = 95
      DataBinding.DataField = 'Total'
      DataBinding.DataSource = srcIn
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Width = 499
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item4: TdxLayoutItem [0]
        Caption = #1057#1091#1084#1084#1072
        Control = edtSumma
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item7: TdxLayoutItem [3]
        Control = Bevel1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item6: TdxLayoutItem [4]
        Caption = #1048#1090#1086#1075#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
        Control = edtTotal
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [5]
        Caption = #1056#1072#1089#1095#1077#1090#1099
        Control = grdResult
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [6]
        AutoAligns = [aaVertical]
        AlignHorz = ahRight
        Caption = 'cxButton1'
        ShowCaption = False
        Control = btnCalc
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 335
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 36
    Top = 335
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 120
    Top = 335
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 148
    Top = 335
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 64
    Top = 335
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 92
    Top = 335
  end
  object dsIn: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 80
    Top = 136
    object dsInSumma: TFloatField
      FieldName = 'Summa'
    end
    object dsInDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dsInDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dsInPeriod: TStringField
      FieldName = 'Period'
      Size = 200
    end
    object dsInTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '0.##'
    end
  end
  object dsOut: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 120
    Top = 136
    object dsOutBegin_Date: TDateField
      FieldName = 'Begin_Date'
    end
    object dsOutEnd_Date: TDateField
      FieldName = 'End_Date'
    end
    object dsOutRate: TFloatField
      FieldName = 'Rate'
    end
    object dsOutDay_Count: TIntegerField
      FieldName = 'Day_Count'
    end
    object dsOutPeriod: TStringField
      FieldName = 'Period'
      Size = 200
    end
    object dsOutNo: TIntegerField
      FieldName = 'No'
    end
    object dsOutSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.##'
      Precision = 2
    end
  end
  object srcIn: TDataSource
    DataSet = dsIn
    Left = 80
    Top = 176
  end
  object srcOut: TDataSource
    DataSet = dsOut
    Left = 120
    Top = 176
  end
  object dsRates: TfdcQuery
    DataSource = srcIn
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  rs.rate_date'
      '  ,r.refinancing_rate'
      'from (select '
      '        max(rate_date) rate_date'
      '      from'
      '        fdc_nsi_refinancing_rate_lst'
      '      where'
      '        rate_date <= :Date_From'
      '      union'
      '      select '
      '        rate_date'
      '      from'
      '        fdc_nsi_refinancing_rate_lst'
      '      where'
      '        rate_date > :Date_From'
      '        and rate_date <= :Date_To'
      '      ) rs'
      '      ,fdc_nsi_refinancing_rate_lst r'
      'where '
      '  rs.rate_date = r.rate_date')
    Left = 80
    Top = 216
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
  object xlrCalcPeni: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'D:\Projects\iacc\Delphi\Bin\report\'#1055#1077#1085#1080'.xls'
    DataSources = <
      item
        DataSet = dsOut
        Alias = 'aReport'
        Range = 'items'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsIn
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 120
    Top = 216
  end
  object dsCheck: TfdcQuery
    DataSource = srcIn
    ReadOnly = False
    SQL.Strings = (
      'select '
      '  rate_date'
      'from'
      '  fdc_nsi_refinancing_rate_lst'
      'where'
      '  rate_date <= :Date_From')
    Left = 80
    Top = 256
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date_From'
        ParamType = ptUnknown
      end>
  end
end
