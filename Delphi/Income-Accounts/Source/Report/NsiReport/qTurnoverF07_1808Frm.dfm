inherited qTurnoverF07_1808Form: TqTurnoverF07_1808Form
  Left = 312
  Top = 252
  Width = 854
  Caption = #1089#1095' 02.01.00'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 838
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      FilterBox.Visible = fvNever
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.DataSource = dsItog
      DataController.DetailKeyFieldNames = 'ID'
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ID'
      OptionsBehavior.CellHints = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1091#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
          Width = 360
        end
        item
          Caption = #1048#1053#1053
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 75
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 106
        end
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Width = 200
        end
        item
          Caption = #1090#1080#1087' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 62
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 55
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 83
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 401
        end
        item
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Position.BandIndex = 10
          Position.ColIndex = 0
          Width = 117
        end
        item
          Caption = #1059#1087#1083#1072#1095#1077#1085#1086
          Position.BandIndex = 10
          Position.ColIndex = 1
          Width = 144
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
          Position.BandIndex = 10
          Position.ColIndex = 2
          Width = 140
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          Width = 90
        end
        item
          Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091
          Width = 340
        end
        item
          Caption = #8470
          Position.BandIndex = 15
          Position.ColIndex = 0
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 15
          Position.ColIndex = 1
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 15
          Position.ColIndex = 2
        end
        item
          Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077
          Width = 278
        end
        item
          Caption = #8470
          Position.BandIndex = 19
          Position.ColIndex = 0
          Width = 96
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 19
          Position.ColIndex = 1
          Width = 77
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 19
          Position.ColIndex = 2
          Width = 67
        end>
      object grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'ITEM_NO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'INN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 100
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'NAME'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'TYPE_PERSON'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableNACH_TYPE: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'NACH_TYPE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_doc: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'NACH'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPaid: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'PAID'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'ZADOLG'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPp_number: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'PP_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 64
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPp_date: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'PP_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 64
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPp_summa: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'PP_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 64
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_number: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'NPAY_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_date: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'NPAY_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_summa: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'NPAY_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView [1]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsItogSubject
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Width = 160
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBBandedColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Width = 100
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewName: TcxGridDBBandedColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewTypePerson: TcxGridDBBandedColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNACH_TYPE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1090#1080#1087
        DataBinding.FieldName = 'NACH_TYPE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNumber_doc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'DOC_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDOC_DATE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewIn_summa: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNach: TcxGridDBBandedColumn
        Caption = ' '#1053#1072#1095#1080#1089#1083#1077#1085#1086
        DataBinding.FieldName = 'NACH'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPaid: TcxGridDBBandedColumn
        Caption = ' '#1059#1087#1083#1072#1095#1077#1085#1086' '
        DataBinding.FieldName = 'PAID'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewZadolg: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'ZADOLG'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewOut_summa: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPp_number: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'PP_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPp_date: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'PP_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPp_summa: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'PP_SUMMA'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNoticePay_number: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'NPAY_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNoticePay_date: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'NPAY_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewNoticePay_summa: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'NPAY_SUMMA'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView [2]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsItogSubjectDoc
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Width = 160
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBBandedColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        Width = 100
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewName: TcxGridDBBandedColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewTypePerson: TcxGridDBBandedColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Visible = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNACH_TYPE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1090#1080#1087
        DataBinding.FieldName = 'NACH_TYPE'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNumber_doc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewIn_summa: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNach: TcxGridDBBandedColumn
        Caption = ' '#1053#1072#1095#1080#1089#1083#1077#1085#1086
        DataBinding.FieldName = 'NACH'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewPaid: TcxGridDBBandedColumn
        Caption = ' '#1059#1087#1083#1072#1095#1077#1085#1086' '
        DataBinding.FieldName = 'PAID'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewZadolg: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'ZADOLG'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewPp_number: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'PP_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewPp_date: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'PP_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewPp_summa: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'PP_SUMMA'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNoticePay_number: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'NPAY_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNoticePay_date: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'NPAY_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewNoticePay_summa: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'NPAY_SUMMA'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object grdTurnoverSheetDBBandedTableD3View: TcxGridDBTableView [3]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsData
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object grdTurnoverSheetDBBandedTableD3ViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Visible = False
        Width = 70
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewINN: TcxGridDBBandedColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        Width = 100
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewName: TcxGridDBBandedColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewTypePerson: TcxGridDBBandedColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Visible = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNACH_TYPE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1090#1080#1087
        DataBinding.FieldName = 'NACH_TYPE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNumber_doc: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'DOC_NUMBER'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewDOC_DATE: TcxGridDBBandedColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Visible = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewIn_summa: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNach: TcxGridDBBandedColumn
        Caption = ' '#1053#1072#1095#1080#1089#1083#1077#1085#1086
        DataBinding.FieldName = 'NACH'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewPaid: TcxGridDBBandedColumn
        Caption = ' '#1059#1087#1083#1072#1095#1077#1085#1086' '
        DataBinding.FieldName = 'PAID'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewZadolg: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'ZADOLG'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewOut_summa: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewPp_number: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'PP_NUMBER'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewPp_date: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'PP_DATE'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewPp_summa: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'PP_SUMMA'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNoticePay_number: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'NPAY_NUMBER'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNoticePay_date: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1076#1072#1090#1072
        DataBinding.FieldName = 'NPAY_DATE'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewNoticePay_summa: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'NPAY_SUMMA'
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    inherited grdTurnoverSheetLevel: TcxGridLevel
      object grdTurnoverSheetLevel1: TcxGridLevel
        GridView = grdTurnoverSheetDBBandedTableDView
        object grdTurnoverSheetLevel2: TcxGridLevel
          GridView = grdTurnoverSheetDBBandedTableD2View
          object grdTurnoverSheetLevel3: TcxGridLevel
            GridView = grdTurnoverSheetDBBandedTableD3View
          end
        end
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 838
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.02.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084'" '
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first, nach_type nulls first, do' +
        'c_number nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,npay_number'
      '      ,npay_date'
      '      ,npay_summa'
      'from ('
      'select id'
      '      ,parentid'
      '      ,nvl(to_char(item_no),('
      
        '                             case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39
      
        '                                  when (subject_id is not null a' +
        'nd doc_id is null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39
      
        '                                  when (subject_id is not null a' +
        'nd doc_id is not null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' ' +
        #1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#39
      '                                  else null'
      '                             end'
      '                            )) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        'p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate)' +
        ',0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is not null an' +
        'd doc_id is null) then p_oborotki.get_bsumma_account_subject(:ac' +
        'count_id,:account_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(c' +
        'ase :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(nach) nach'
      '      ,sum(paid) paid'
      '      ,sum(zadolg) zadolg'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_doc_id'
      '      ,npay_number'
      '      ,npay_date'
      '      ,npay_summa'
      '      ,npay_doc_id'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,nach_type,doc_number,doc_date,doc_id,pp_number,pp_date,p' +
        'p_summa,pp_doc_id,npay_number,npay_date,npay_summa,npay_doc_id) ' +
        'item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||nach_type||'#39'|'#39'||doc_number||'#39'|'#39'||to_char(doc_date' +
        ','#39'dd.mm.yyyy'#39')||'#39'|'#39'||to_char(doc_id)||'#39'|'#39'||pp_number||'#39'|'#39'||to_ch' +
        'ar(pp_date,'#39'dd.mm.yyyy'#39')||'#39'|'#39'||to_char(pp_summa)||'#39'|'#39'||to_char(p' +
        'p_doc_id)||'#39'|'#39'||npay_number||'#39'|'#39'||to_char(npay_date,'#39'dd.mm.yyyy'#39 +
        ')||'#39'|'#39'||to_char(npay_summa)||'#39'|'#39'||to_char(npay_doc_id)) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||nach_type||'#39'|'#39'||doc_number||'#39'|'#39'||to_char(doc_date' +
        ','#39'dd.mm.yyyy'#39')||'#39'|'#39'||to_char(doc_id)) parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,nach_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,nach'
      '            ,paid'
      '            ,zadolg'
      '            ,pp_number'
      '            ,pp_date'
      '            ,pp_summa'
      '            ,pp_doc_id'
      '            ,npay_number'
      '            ,npay_date'
      '            ,npay_summa'
      '            ,npay_doc_id'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,nach_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(nach) nach'
      '                  ,sum(paid) paid'
      '                  ,sum(zadolg) zadolg'
      '                  ,pp_number'
      '                  ,pp_date'
      '                  ,pp_summa'
      '                  ,pp_doc_id'
      '                  ,npay_number'
      '                  ,npay_date'
      '                  ,npay_summa'
      '                  ,npay_doc_id'
      '            from ('
      
        '                  select (case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then acct.subject_id else p_p' +
        'arams.customsid end) else acct.subject_id end) subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.inn else (select inn ' +
        'from fdc_customs_lst where id = p_params.customsid) end) else (c' +
        'ase sl.id when -1 then '#39' '#39' else sl.inn end) end) inn'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.name else (select nam' +
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      '                        ,(case :summarn when '#39'Y'#39' then '#39#39
      '                                        else (case  '
      
        '                                                when (acc.code =' +
        ' '#39'02.01.01'#39') then '#39#1044#1058#39
      
        '                                                when (acc.code =' +
        ' '#39'02.01.02'#39') then '#39#1058#1055#1054#39
      
        '                                                when (acc.code =' +
        ' '#39'02.01.03'#39') then '#39#1048#1085#1099#1077#39
      '                                                else '#39#39
      '                                              end)'
      '                          end)  nach_type'
      '                        ,dc.id doc_id'
      '                        ,dc.name doc_number'
      '                        ,dc.doc_date doc_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                        ,po.id pp_doc_id'
      '                        ,po.doc_number pp_number'
      '                        ,po.doc_date   pp_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) pp_summa'
      '                        ,nl.id npay_doc_id'
      '                        ,dm.doc_number npay_number'
      '                        ,dm.doc_date npay_date'
      
        '                        ,case when dm.doc_number is not null the' +
        'n fdc_noticepay_get_sum(nl.id, '#39'summa_only_dc'#39') else null end np' +
        'ay_summa'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'            ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                      ,( select m.id, doc_number, doc_date, m.ow' +
        'ner_object_id from fdc_debts_measures_lst m,'
      
        '                          (select max(id) id, owner_object_id  f' +
        'rom fdc_debts_measures_lst where measures_type in ('#39'B20'#39','#39'B27'#39') ' +
        'group by owner_object_id) om'
      '                         where m.id = om.id'
      '                       ) dm'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and :summarn = '#39'N'#39
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and dm.owner_object_id (+) = nl.id'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,nach_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,pp_number'
      '                    ,pp_date'
      '                    ,pp_summa'
      '                    ,pp_doc_id'
      '                    ,npay_number'
      '                    ,npay_date'
      '                    ,npay_summa'
      '                    ,npay_doc_id'
      '           ) a'
      '      where nach != 0 '
      '         or paid != 0 '
      '         or zadolg != 0'
      '      order by 1'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,nach_type'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,nach'
      '        ,paid'
      '        ,zadolg'
      '        ,pp_number'
      '        ,pp_date'
      '        ,pp_summa'
      '        ,pp_doc_id'
      '        ,npay_number'
      '        ,npay_date'
      '        ,npay_summa'
      
        '        ,npay_doc_id),(subject_id,inn,name,type_person),(subject' +
        '_id,inn,name,type_person,nach_type,doc_number,doc_date,doc_id),(' +
        '))'
      '     )'
      'union all'
      '--// '#1076#1083#1103' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1086#1073#1086#1088#1086#1090#1082#1080
      'select id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from ('
      'select id'
      '      ,parentid'
      '      ,nvl(to_char(item_no),('
      
        '                             case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39
      
        '                                  when (subject_id is not null) ' +
        'then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39
      '                                  else null'
      '                             end'
      '                            )) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        'p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate)' +
        ',0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      
        '             when (item_no is not null and subject_id is not nul' +
        'l) then p_oborotki.get_bsumma_account_subject(:account_id,:accou' +
        'nt_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn wh' +
        'en '#39'Y'#39' then 1 else 0 end),:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,sum(nach) nach'
      '      ,sum(paid) paid'
      '      ,sum(zadolg) zadolg'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,'#39'0'#39' parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,nach'
      '            ,paid'
      '            ,zadolg'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,nach_type'
      '                  ,sum(nach) nach'
      '                  ,sum(paid) paid'
      '                  ,sum(zadolg) zadolg'
      '            from ('
      
        '                  select (case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then acct.subject_id else p_params.customsid end) subject_' +
        'id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then cl.inn else (select inn from fdc_customs_lst where id' +
        ' = p_params.customsid) end) inn'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then cl.name else (select name from fdc_customs_lst where ' +
        'id = p_params.customsid) end) name'
      '                        ,'#39#39' type_person'
      '                        ,'#39#39'  nach_type'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                        ,po.id pp_doc_id'
      '                        ,po.doc_number pp_number'
      '                        ,po.doc_date   pp_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) pp_summa'
      '                        ,nl.id npay_doc_id'
      '                        ,nl.doc_number npay_number'
      '                        ,nl.doc_date npay_date'
      '                        ,nl.summa npay_summa'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and :summarn = '#39'Y'#39
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where nach != 0 '
      '         or paid != 0 '
      '         or zadolg != 0'
      '      order by 1'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,nach'
      '        ,paid'
      '        ,zadolg),())'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000090000004E4143485F5459504501
      0000000000040000004E41434801000000000004000000504149440100000000
      00060000005A41444F4C470100000000000900000050505F4E554D4245520100
      000000000700000050505F444154450100000000000800000050505F53554D4D
      410100000000000B0000004E5041595F4E554D42455201000000000009000000
      4E5041595F444154450100000000000A0000004E5041595F53554D4D41010000
      000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Top = 88
    object dsetDataID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsetDataPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataINN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetDataTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetDataNACH_TYPE: TStringField
      FieldName = 'NACH_TYPE'
      Size = 255
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 1500
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataNACH: TFloatField
      FieldName = 'NACH'
      DisplayFormat = ',0.00'
    end
    object dsetDataPAID: TFloatField
      FieldName = 'PAID'
      DisplayFormat = ',0.00'
    end
    object dsetDataZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetDataPP_NUMBER: TStringField
      FieldName = 'PP_NUMBER'
      Size = 255
    end
    object dsetDataPP_DATE: TDateTimeField
      FieldName = 'PP_DATE'
    end
    object dsetDataPP_SUMMA: TFloatField
      FieldName = 'PP_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataNPAY_NUMBER: TStringField
      FieldName = 'NPAY_NUMBER'
      Size = 255
    end
    object dsetDataNPAY_DATE: TDateTimeField
      FieldName = 'NPAY_DATE'
    end
    object dsetDataNPAY_SUMMA: TFloatField
      FieldName = 'NPAY_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
  object dsetItog: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      'from ('
      '      select nach'
      '            ,paid'
      '            ,zadolg'
      '      from ('
      '            select nvl(sum(nach),0) nach'
      '                  ,nvl(sum(paid),0) paid'
      '                  ,nvl(sum(zadolg),0) zadolg'
      '            from ('
      '                  select acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dc.id doc_id'
      '                        ,dc.name doc_number'
      '                        ,dc.doc_date doc_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000090000004E4143485F5459504501
      0000000000040000004E41434801000000000004000000504149440100000000
      00060000005A41444F4C470100000000000900000050505F4E554D4245520100
      000000000700000050505F444154450100000000000800000050505F53554D4D
      410100000000000B0000004E5041595F4E554D42455201000000000009000000
      4E5041595F444154450100000000000A0000004E5041595F53554D4D41010000
      000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 208
    Top = 112
    object dsetItogID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsetItogPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetItogITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetItogIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogINN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object dsetItogNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetItogTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetItogOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogNACH_TYPE: TStringField
      FieldName = 'NACH_TYPE'
      Size = 255
    end
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogNACH: TFloatField
      FieldName = 'NACH'
      DisplayFormat = ',0.00'
    end
    object dsetItogPAID: TFloatField
      FieldName = 'PAID'
      DisplayFormat = ',0.00'
    end
    object dsetItogZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetItogPP_NUMBER: TStringField
      FieldName = 'PP_NUMBER'
      Size = 255
    end
    object dsetItogPP_DATE: TDateTimeField
      FieldName = 'PP_DATE'
    end
    object dsetItogPP_SUMMA: TFloatField
      FieldName = 'PP_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogNPAY_NUMBER: TStringField
      FieldName = 'NPAY_NUMBER'
      Size = 255
    end
    object dsetItogNPAY_DATE: TDateTimeField
      FieldName = 'NPAY_DATE'
    end
    object dsetItogNPAY_SUMMA: TFloatField
      FieldName = 'NPAY_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 208
    Top = 200
  end
  object dsetItogSubject: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from ('
      'select id'
      '      ,'#39'0'#39' parentid'
      
        '      ,(case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091 +
        #39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) item_no'
      '      ,subject_id'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,nach'
      '            ,paid'
      '            ,zadolg'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(nach) nach'
      '                  ,sum(paid) paid'
      '                  ,sum(zadolg) zadolg'
      '            from ('
      
        '                  select (case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then acct.subject_id else p_p' +
        'arams.customsid end) else acct.subject_id end) subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.inn else (select inn ' +
        'from fdc_customs_lst where id = p_params.customsid) end) else (c' +
        'ase sl.id when -1 then '#39' '#39' else sl.inn end) end) inn'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.name else (select nam' +
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where nach != 0 '
      '         or paid != 0 '
      '         or zadolg != 0'
      '     )'
      'order by id     '
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000090000004E4143485F5459504501
      0000000000040000004E41434801000000000004000000504149440100000000
      00060000005A41444F4C470100000000000900000050505F4E554D4245520100
      000000000700000050505F444154450100000000000800000050505F53554D4D
      410100000000000B0000004E5041595F4E554D42455201000000000009000000
      4E5041595F444154450100000000000A0000004E5041595F53554D4D41010000
      000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 272
    Top = 112
    object StringField1: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object StringField2: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object StringField3: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object FloatField1: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField4: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object StringField5: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object StringField6: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object FloatField10: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNACH_TYPE: TStringField
      FieldName = 'NACH_TYPE'
      Size = 255
    end
    object dsetItogSubjectDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogSubjectDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogSubjectNACH: TFloatField
      FieldName = 'NACH'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectPAID: TFloatField
      FieldName = 'PAID'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectPP_NUMBER: TStringField
      FieldName = 'PP_NUMBER'
      Size = 255
    end
    object dsetItogSubjectPP_DATE: TDateTimeField
      FieldName = 'PP_DATE'
    end
    object dsetItogSubjectPP_SUMMA: TFloatField
      FieldName = 'PP_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNPAY_NUMBER: TStringField
      FieldName = 'NPAY_NUMBER'
      Size = 255
    end
    object dsetItogSubjectNPAY_DATE: TDateTimeField
      FieldName = 'NPAY_DATE'
    end
    object dsetItogSubjectNPAY_SUMMA: TFloatField
      FieldName = 'NPAY_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogSubject: TDataSource
    DataSet = dsetItogSubject
    Left = 264
    Top = 200
  end
  object dsetItogSubjectDoc: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from ('
      'select id'
      '      ,parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044' '#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#39' item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      '      ,to_number(null) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,:account_code account_code'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,nach_type,doc_number,doc_date,doc_id) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||nach_type||'#39'|'#39'||doc_number||'#39'|'#39'||to_char(doc_date' +
        ','#39'dd.mm.yyyy'#39')||'#39'|'#39'||to_char(doc_id)) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,nach_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,nach'
      '            ,paid'
      '            ,zadolg'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,nach_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(nach) nach'
      '                  ,sum(paid) paid'
      '                  ,sum(zadolg) zadolg'
      '            from ('
      
        '                  select (case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then acct.subject_id else p_p' +
        'arams.customsid end) else acct.subject_id end) subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.inn else (select inn ' +
        'from fdc_customs_lst where id = p_params.customsid) end) else (c' +
        'ase sl.id when -1 then '#39' '#39' else sl.inn end) end) inn'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
        'ypesysname when '#39'DocChildsBalance'#39' then cl.name else (select nam' +
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      '                        ,(case :summarn when '#39'Y'#39' then '#39#39
      '                                        else (case  '
      
        '                                                when (acc.code =' +
        ' '#39'02.01.01'#39') then '#39#1044#1058#39
      
        '                                                when (acc.code =' +
        ' '#39'02.01.02'#39') then '#39#1058#1055#1054#39
      
        '                                                when (acc.code =' +
        ' '#39'02.01.03'#39') then '#39#1048#1085#1099#1077#39
      '                                                else '#39#39
      '                                              end)'
      '                          end)  nach_type'
      '                        ,dc.id doc_id'
      '                        ,dc.name doc_number'
      '                        ,dc.doc_date doc_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                        ,po.id pp_doc_id'
      '                        ,po.doc_number pp_number'
      '                        ,po.doc_date   pp_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) pp_summa'
      '                        ,nl.id npay_doc_id'
      '                        ,nl.doc_number npay_number'
      '                        ,nl.doc_date npay_date'
      '                        ,nl.summa npay_summa'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and :summarn = '#39'N'#39
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,nach_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where nach != 0 '
      '         or paid != 0 '
      '         or zadolg != 0'
      '     )'
      'order by id     '
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000090000004E4143485F5459504501
      0000000000040000004E41434801000000000004000000504149440100000000
      00060000005A41444F4C470100000000000900000050505F4E554D4245520100
      000000000700000050505F444154450100000000000800000050505F53554D4D
      410100000000000B0000004E5041595F4E554D42455201000000000009000000
      4E5041595F444154450100000000000A0000004E5041595F53554D4D41010000
      000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 384
    Top = 112
    object StringField7: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object StringField8: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object StringField9: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object FloatField2: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField10: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object StringField11: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object StringField12: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object FloatField3: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField13: TStringField
      FieldName = 'NACH_TYPE'
      Size = 255
    end
    object StringField14: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object FloatField4: TFloatField
      FieldName = 'NACH'
      DisplayFormat = ',0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'PAID'
      DisplayFormat = ',0.00'
    end
    object FloatField6: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object StringField15: TStringField
      FieldName = 'PP_NUMBER'
      Size = 255
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'PP_DATE'
    end
    object FloatField7: TFloatField
      FieldName = 'PP_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField16: TStringField
      FieldName = 'NPAY_NUMBER'
      Size = 255
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'NPAY_DATE'
    end
    object FloatField8: TFloatField
      FieldName = 'NPAY_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogSubjectDoc: TDataSource
    DataSet = dsetItogSubjectDoc
    Left = 352
    Top = 200
  end
end
