inherited UFKPaymentsGridForm: TUFKPaymentsGridForm
  Width = 964
  Height = 535
  Caption = #1055#1044' '#1080#1079' '#1059#1060#1050
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 483
    Width = 956
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 667
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 667
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 667
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 667
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 880
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 480
    Width = 956
  end
  inherited pnlWorkspace: TPanel
    Width = 956
    Height = 454
    inherited splSearchCriteria: TSplitter
      Height = 454
    end
    inherited pnlSearchCriteria: TPanel
      Height = 454
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 434
        object Label2: TLabel [0]
          Left = 9
          Top = 190
          Width = 78
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
          Color = 16311512
          ParentColor = False
        end
        object Label1: TLabel [1]
          Left = 9
          Top = 117
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072' '
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 402
          TabOrder = 9
        end
        object edtName: TcxTextEdit [3]
          Left = 79
          Top = 9
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 182
        end
        object edtINN: TcxTextEdit [4]
          Left = 79
          Top = 36
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 109
        end
        object edtKPP: TcxTextEdit [5]
          Left = 79
          Top = 63
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 109
        end
        object edtNomer: TcxTextEdit [6]
          Left = 79
          Top = 90
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 109
        end
        object edtFromDate: TcxDateEdit [7]
          Left = 79
          Top = 136
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 109
        end
        object edtToDate: TcxDateEdit [8]
          Left = 79
          Top = 163
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 109
        end
        object edtSumMin: TcxCurrencyEdit [9]
          Left = 79
          Top = 209
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 109
        end
        object edtSumMax: TcxCurrencyEdit [10]
          Left = 79
          Top = 236
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 109
        end
        object btnSearchClear: TcxButton [11]
          Left = 116
          Top = 373
          Width = 75
          Height = 23
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 8
          TabStop = False
          OnClick = btnSearchClearClick
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [0]
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082':'
            Control = edtName
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [1]
            Caption = #1048#1053#1053':'
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [2]
            Caption = #1050#1055#1055':'
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [3]
            Caption = #1053#1086#1084#1077#1088':'
            Control = edtNomer
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem10: TdxLayoutItem [4]
            ShowCaption = False
            Control = Label1
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem5: TdxLayoutItem [5]
            Caption = #1089
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem6: TdxLayoutItem [6]
            Caption = #1087#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem9: TdxLayoutItem [7]
            ShowCaption = False
            Control = Label2
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem7: TdxLayoutItem [8]
            Caption = '>='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [9]
            Caption = '<='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMax
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem11: TdxLayoutItem [10]
            AutoAligns = []
            AlignHorz = ahRight
            AlignVert = avBottom
            ShowCaption = False
            Control = btnSearchClear
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 751
      Height = 454
      inherited grdData: TcxGrid
        Width = 751
        Height = 454
        inherited grdDataDBTableView: TcxGridDBTableView
          object grdDataDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
          end
          object grdDataDBTableViewNAME: TcxGridDBColumn
            DataBinding.FieldName = 'NAME'
          end
          object grdDataDBTableViewDOC_SUMMA: TcxGridDBColumn
            DataBinding.FieldName = 'DOC_SUMMA'
          end
          object grdDataDBTableViewSUMMA: TcxGridDBColumn
            DataBinding.FieldName = 'SUMMA'
          end
          object grdDataDBTableViewPAYER_INN: TcxGridDBColumn
            DataBinding.FieldName = 'PAYER_INN'
          end
          object grdDataDBTableViewPAYER_KPP: TcxGridDBColumn
            DataBinding.FieldName = 'PAYER_KPP'
          end
        end
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1055#1055
            DataBinding.FieldName = 'NAME'
            Width = 312
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Visible = False
            Width = 240
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Visible = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1087
            DataBinding.FieldName = 'DOC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Width = 86
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 171
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ARCHIVE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actUFK: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1055#1055
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1085#1072' '#1055#1055' '#1080#1079' '#1059#1060#1050
      OnExecute = actUFKExecute
      OnUpdate = actUFKUpdate
    end
    object actSplit: TAction
      Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1055#1055
      Hint = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1055#1055' '#1080#1079' '#1059#1060#1050' '#1076#1083#1103' '#1087#1086#1076#1095#1080#1085#1077#1085#1085#1099#1093' '#1058#1054
      OnExecute = actSplitExecute
      OnUpdate = actSplitUpdate
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
  inherited BarManager: TdxBarManager
    Bars = <
      item
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnSetUFKPays
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnSplitUFKPays
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
    object btnSetUFKPays: TdxBarButton
      Action = actUFK
      Category = 0
    end
    object btnSplitUFKPays: TdxBarButton
      Action = actSplit
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      
        'SELECT t.id, t.TypeNAME, t.TypeSYSNAME, t.NAME, t.DOC_NUMBER, t.' +
        'DOC_DATE, t.DOC_NO2,'
      
        't.DOC_DATE2, t.EXEC_DATE,t.DOC_SUMMA, t.SUMMA, t.payer_inn, t.pa' +
        'yer_kpp, t.payer_name,'
      't.DestCustomsCode,'
      'CASE WHEN t.IS_ACTIVE = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END AS IS_ARCHIVE'
      '  FROM fdc_po_lst t'
      
        '  WHERE t.ext_typesysname IN ('#39'CashlessPaymentOrder'#39', '#39'PaymentOr' +
        'derRestUFK'#39')'
      
        '  AND NOT EXISTS ( SELECT 0 FROM fdc_payment_deduction_all_lst p' +
        'd WHERE pd.payment_id = t.id)'
      '/*$p#name#*/      AND (upper(t.payer_name) LIKE upper(:Name))'
      '/*$p#inn#*/       AND (t.payer_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (t.payer_kpp         LIKE :KPP)'
      
        '/*$p#doc_no#*/    AND (t.doc_number        LIKE :DOC_NO OR t.doc' +
        '_no2 LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (t.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (t.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (t.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (t.doc_summa <= :SUM_MAX)'
      '   AND rownum <= :MaxRecordCount'
      '   ')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
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
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsDataTYPENAME: TStringField
      DisplayLabel = #1090#1080#1087' '#1055#1055
      DisplayWidth = 90
      FieldName = 'TYPENAME'
      Visible = False
      Size = 1500
    end
    object dsDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1055#1044
      FieldName = 'NAME'
      Size = 250
    end
    object dsDataDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'DOC_SUMMA'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1089#1090#1091#1087#1080#1074#1096#1072#1103
      FieldName = 'SUMMA'
    end
    object dsDataPAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1087#1087
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NO2: TStringField
      DisplayLabel = #8470' '#1087#1087' ('#1073#1072#1085#1082#1072')'
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1087' ('#1073#1072#1085#1082#1072')'
      FieldName = 'DOC_DATE2'
    end
    object dsDataPAYER_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      DisplayWidth = 120
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataEXEC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'EXEC_DATE'
    end
    object dsDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      Visible = False
      Size = 1
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTCUSTOMSCODE'
      Size = 10
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 64
    Top = 272
    object sqlOp1: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_legacy_import.UFKPayment(:id);'
        'end;')
      DataSet = dsData
    end
  end
end
