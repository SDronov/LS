inherited ImportErrorsForm: TImportErrorsForm
  Left = 454
  Top = 281
  Width = 783
  Height = 449
  Caption = #1054#1096#1080#1073#1082#1080', '#1074#1086#1079#1085#1080#1082#1096#1080#1077' '#1087#1088#1080' '#1080#1084#1087#1086#1088#1090#1077' '#1076#1072#1085#1085#1099#1093
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 397
    Width = 775
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
      Width = 486
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 486
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 486
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 486
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 699
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 394
    Width = 775
  end
  inherited pnlWorkspace: TPanel
    Width = 775
    Height = 368
    inherited splSearchCriteria: TSplitter
      Height = 368
    end
    inherited pnlSearchCriteria: TPanel
      Height = 368
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 348
        inherited btnSearch: TcxButton
          Top = 316
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 570
      Height = 368
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 260
        Width = 570
        Height = 5
        Cursor = crVSplit
        Align = alBottom
      end
      inherited grdData: TcxGrid
        Width = 570
        Height = 260
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewIMPERRMSG: TcxGridDBBandedColumn
            Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
            DataBinding.FieldName = 'IMPERRMSG'
            Width = 297
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Hidden = True
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'NAME'
            Width = 275
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'FULL_NAME'
            Width = 237
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'INN'
            Width = 106
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'KPP'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object viewGTD: TcxGridDBBandedTableView [2]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcGTD
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OptionsView.BandHeaderEndEllipsis = True
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object viewGTDG011: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G011'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object viewGTDOKPO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OKPO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object viewGTDINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object viewGTDG12: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G12'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object viewGTDG444A: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G444A'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object viewGTDG444B: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G444B'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object viewGTDG447A: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G447A'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object viewGTDG447B: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G447B'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object viewGTDK115: TcxGridDBBandedColumn
            DataBinding.FieldName = 'K115'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object viewGTDG40: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G40'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object viewGTDG221: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G221'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object viewGTDACT_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACT_NO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object viewGTDGD1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'GD1'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object viewGTDEXPORT_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1099#1074#1086#1079#1072
            DataBinding.FieldName = 'EXPORT_DATE'
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object viewGTDG0131_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G0131_CODE'
            Visible = False
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object viewGTDCHARGE_MONTH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_MONTH'
            Visible = False
            Width = 97
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object viewGTDLOAD_FROM_DK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOAD_FROM_DK'
            Visible = False
            Width = 93
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object viewGTDTAX_EXEMPTION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TAX_EXEMPTION'
            Visible = False
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object viewGTDPAYED_MONTHS: TcxGridDBBandedColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1086#1087#1083'.'#1084#1077#1089#1103#1094#1077#1074
            DataBinding.FieldName = 'PAYED_MONTHS'
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object viewGTDNEXT_PAY_MONTH: TcxGridDBBandedColumn
            Caption = #1057#1083#1077#1076'.'#1087#1083#1072#1090#1077#1078#1099#1081' '#1084#1077#1089#1103#1094
            DataBinding.FieldName = 'NEXT_PAY_MONTH'
            SortIndex = 0
            SortOrder = soAscending
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object viewGTDSUBJECT_NAME: TcxGridDBBandedColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 265
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object viewGTDSUBJECT_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'SUBJECT_INN'
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object viewGTDSUBJECT_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'SUBJECT_KPP'
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object viewGTDCURRENCY_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 102
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object viewGTDCUSTOM_MODE_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1088#1077#1078#1080#1084#1072
            DataBinding.FieldName = 'CUSTOM_MODE_CODE'
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object viewGTDCUSTOMS_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 73
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object viewGTDREG_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            DataBinding.FieldName = 'REG_DATE'
            Width = 99
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object viewGTDDECL_NO: TcxGridDBBandedColumn
            Caption = #8470' '#1043#1058#1044
            DataBinding.FieldName = 'DECL_NO'
            Width = 77
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object viewGTDMODIFY_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODIFY_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object viewGTDDECISION_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECISION_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object viewGTDDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object viewGTDDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object viewGTDIMPERRMSG: TcxGridDBBandedColumn
            Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
            DataBinding.FieldName = 'IMPERRMSG'
            Width = 805
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
        end
        object viewPays: TcxGridDBBandedTableView [3]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcPays
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OptionsView.BandHeaderEndEllipsis = True
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object viewPaysID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object viewPaysTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object viewPaysDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1087#1087
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object viewPaysDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1087
            DataBinding.FieldName = 'DOC_DATE'
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object viewPaysDOC_NO2: TcxGridDBBandedColumn
            Caption = #8470' '#1073#1072#1085#1082#1072
            DataBinding.FieldName = 'DOC_NO2'
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object viewPaysDOC_DATE2: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1073#1072#1085#1082#1072
            DataBinding.FieldName = 'DOC_DATE2'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object viewPaysDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_SUMMA'
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object viewPaysSUMMA: TcxGridDBBandedColumn
            Caption = #1055#1086#1089#1090#1091#1087'. '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object viewPaysEXEC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
            DataBinding.FieldName = 'EXEC_DATE'
            Width = 122
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object viewPaysPAY_TYPE_CODE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object viewPaysCURR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object viewPaysINCOME_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            Visible = False
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object viewPaysNREF: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NREF'
            Visible = False
            Width = 35
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object viewPaysCOMING_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMING_DATE'
            Visible = False
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object viewPaysASSURE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASSURE_DATE'
            Visible = False
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object viewPaysPAYER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_ID'
            Visible = False
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object viewPaysPAYER_NAME: TcxGridDBBandedColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 136
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object viewPaysPAYER_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'PAYER_INN'
            Width = 88
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object viewPaysPAYER_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'PAYER_KPP'
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object viewPaysNOTE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'NOTE'
            Width = 154
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object viewPaysDESCRIPT: TcxGridDBBandedColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object viewPaysDESCRIPT2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRIPT2'
            Visible = False
            Width = 66
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object viewPaysBIC_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIC_K'
            Visible = False
            Width = 36
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object viewPaysEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object viewPaysEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Width = 113
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object viewPaysEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Width = 44
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object viewPaysCARDNUM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CARDNUM'
            Visible = False
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object viewPaysCASHDESK_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CASHDESK_ID'
            Visible = False
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object viewPaysCASHDESK_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CASHDESK_NAME'
            Visible = False
            Width = 101
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 2
          end
          object viewPaysSTEP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STEP'
            Visible = False
            Width = 34
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object viewPaysNEW_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NEW_ID'
            Visible = False
            Width = 49
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object viewPaysIMPERRMSG: TcxGridDBBandedColumn
            Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
            DataBinding.FieldName = 'IMPERRMSG'
            Width = 249
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object viewPaysLAST_USE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LAST_USE'
            Visible = False
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
        end
        object viewTR: TcxGridDBBandedTableView [4]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = scrTR
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OptionsView.BandHeaderEndEllipsis = True
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object viewTRCUSTOMS_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Width = 97
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object viewTRREG_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
            DataBinding.FieldName = 'REG_DATE'
            Width = 109
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object viewTRDECL_NO: TcxGridDBBandedColumn
            Caption = #8470' '#1058#1056'/'#1058#1055#1054
            DataBinding.FieldName = 'DECL_NO'
            Width = 125
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object viewTRID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Width = 20
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 1
          end
          object viewTRNUM_MPO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_MPO'
            Visible = False
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object viewTRREGIM: TcxGridDBBandedColumn
            Caption = #1056#1077#1078#1080#1084
            DataBinding.FieldName = 'REGIM'
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object viewTRMETH_MOVE: TcxGridDBBandedColumn
            Caption = #1052#1077#1090#1086#1076' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
            DataBinding.FieldName = 'METH_MOVE'
            Width = 112
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object viewTRORDER_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ORDER_TYPE'
            Visible = False
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object viewTRSUM_RUB: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUM_RUB'
            Width = 40
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object viewTRCARRIER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CARRIER_ID'
            Visible = False
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object viewTRCARRIER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CARRIER_NAME'
            Visible = False
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object viewTRCARRIER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CARRIER_INN'
            Visible = False
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object viewTRCARRIER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CARRIER_KPP'
            Visible = False
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object viewTRSUBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_ID'
            Visible = False
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object viewTRSUBJECT_NAME: TcxGridDBBandedColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 113
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object viewTRSUBJECT_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'SUBJECT_INN'
            Width = 71
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object viewTRSUBJECT_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'SUBJECT_KPP'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object viewTRCURRENCY_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object viewTRCUSTOM_MODE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOM_MODE_CODE'
            Visible = False
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object viewTRMODIFY_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MODIFY_DATE'
            Visible = False
            Width = 82
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object viewTRDECISION_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECISION_CODE'
            Visible = False
            Width = 93
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object viewTRDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object viewTRDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object viewTRDESCRIPT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRIPT'
            Visible = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object viewTRIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            Visible = False
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object viewTRACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Visible = False
            Width = 105
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object viewTRSTATE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_NAME'
            Visible = False
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object viewTREXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object viewTREXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Width = 113
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object viewTREXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Width = 44
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object viewTRNEW_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NEW_ID'
            Visible = False
            Width = 49
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object viewTRIMPERRMSG: TcxGridDBBandedColumn
            Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
            DataBinding.FieldName = 'IMPERRMSG'
            Width = 171
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object viewTRSTEP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STEP'
            Visible = False
            Width = 34
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
        end
        object viewAdvice: TcxGridDBBandedTableView [5]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcAdvice
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.CellEndEllipsis = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OptionsView.BandHeaderEndEllipsis = True
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object viewAdviceID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object viewAdviceDESCRIPT: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Width = 137
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object viewAdviceDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 146
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object viewAdviceDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Width = 106
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object viewAdviceCUSTOMS_CODE_8: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1058#1054
            DataBinding.FieldName = 'CUSTOMS_CODE_8'
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object viewAdviceSUBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object viewAdviceEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object viewAdviceEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object viewAdviceEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object viewAdviceNEW_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NEW_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object viewAdviceIMPERRMSG: TcxGridDBBandedColumn
            Caption = #1058#1077#1082#1089#1090' '#1086#1096#1080#1073#1082#1080
            DataBinding.FieldName = 'IMPERRMSG'
            Width = 244
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
      end
      object memError: TcxDBMemo
        Left = 0
        Top = 265
        Align = alBottom
        DataBinding.DataField = 'ImpErrMsg'
        DataBinding.DataSource = srcData
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssBoth
        Style.StyleController = WebEditStyleController
        TabOrder = 1
        Height = 103
        Width = 570
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
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
            Item = cbView
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
    inherited btnAutoFilter: TdxBarButton
      Visible = ivNever
    end
    object cbView: TdxBarCombo
      Align = iaRight
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Category = 0
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
      Visible = ivAlways
      Text = #1053#1057#1048
      OnChange = cbViewChange
      ShowCaption = True
      Width = 150
      ShowEditor = False
      Items.Strings = (
        #1053#1057#1048
        #1055#1083#1072#1090#1105#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
        #1043#1058#1044
        #1058#1055#1054
        #1058#1056
        #1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072)
      ItemIndex = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'SELECT *'
      'from exp_subject_lst t'
      'WHERE t.New_Id IS NULL'
      '  AND t.ImpErrMsg <> '#39'Rollback'#39)
  end
  object dsPays: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT *'
      'from exp_rest_pays t'
      'WHERE t.New_Id IS NULL'
      '  AND t.ImpErrMsg <> '#39'Rollback'#39)
    Left = 245
    Top = 178
  end
  object dsGTD: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT *'
      'from exp_gtd t'
      'WHERE t.New_Id IS NULL'
      '  AND t.ImpErrMsg <> '#39'Rollback'#39)
    Left = 285
    Top = 178
  end
  object dsTR: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT *'
      'from exp_tr t'
      'WHERE t.New_Id IS NULL'
      '  AND t.ImpErrMsg <> '#39'Rollback'#39
      '  AND ( ( :Filter = 4 AND t.ext_typesysname = '#39'TR'#39') OR'
      '        ( :Filter = 3 AND t.ext_typesysname = '#39'TPO'#39')'
      '      )  ')
    BeforeOpen = dsTRBeforeOpen
    Left = 325
    Top = 178
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Filter'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Filter'
        ParamType = ptUnknown
      end>
  end
  object dsAdvice: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT *'
      'from exp_advice t'
      'WHERE t.New_Id IS NULL'
      '  AND t.ImpErrMsg <> '#39'Rollback'#39)
    Left = 373
    Top = 178
  end
  object srcPays: TDataSource
    DataSet = dsPays
    Left = 245
    Top = 234
  end
  object srcGTD: TDataSource
    DataSet = dsGTD
    Left = 285
    Top = 234
  end
  object scrTR: TDataSource
    DataSet = dsTR
    Left = 325
    Top = 234
  end
  object srcAdvice: TDataSource
    DataSet = dsAdvice
    Left = 373
    Top = 234
  end
end
