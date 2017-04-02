inherited qTurnoverF28_1808Form: TqTurnoverF28_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' '#1060'06.20.00'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 846
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      FilterBox.Visible = fvNever
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.DataSource = dsItog
      DataController.DetailKeyFieldNames = 'ID'
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableViewOut_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewOut_summa
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewOut_summa
        end>
      OptionsBehavior.CellHints = True
      OptionsView.ExpandButtonsForEmptyDetails = False
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'/'#1089#1091#1073#1089#1095#1077#1090' '#1056#1058#1059'/'#1089#1091#1073#1089#1095#1077#1090' '#1050#1055' '#1060#1058#1057
          Width = 200
        end
        item
          Caption = #1050#1041#1050
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1693
        end
        item
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
          Position.BandIndex = 4
          Position.ColIndex = 0
          Width = 146
        end
        item
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1086
          Position.BandIndex = 4
          Position.ColIndex = 1
          Width = 257
        end
        item
          Caption = #1087#1086' '#1056#1058#1059'/'#1058#1053#1055
          Position.BandIndex = 6
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086' '#1050#1041#1050' 4000'
          Position.BandIndex = 6
          Position.ColIndex = 1
        end
        item
          Caption = #1047#1072#1095#1077#1090' '#1089' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
          Position.BandIndex = 4
          Position.ColIndex = 2
          Width = 143
        end
        item
          Caption = #1057#1087#1080#1089#1072#1085#1086
          Position.BandIndex = 4
          Position.ColIndex = 3
          Width = 1200
        end
        item
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          Position.BandIndex = 10
          Position.ColIndex = 0
          Width = 437
        end
        item
          Caption = #1059#1074#1040
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 200
        end
        item
          Caption = #1089' '#1050#1041#1050
          Position.BandIndex = 12
          Position.ColIndex = 0
        end
        item
          Caption = #1085#1072' '#1050#1041#1050
          Position.BandIndex = 12
          Position.ColIndex = 1
        end
        item
          Caption = #1059#1074#1062
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 200
        end
        item
          Caption = #1089' '#1050#1041#1050
          Position.BandIndex = 15
          Position.ColIndex = 0
          Width = 79
        end
        item
          Caption = #1085#1072' '#1050#1041#1050
          Position.BandIndex = 15
          Position.ColIndex = 1
          Width = 119
        end
        item
          Caption = #1059#1074#1048#1079#1083
          Position.BandIndex = 11
          Position.ColIndex = 2
          Width = 200
        end
        item
          Caption = #1089' '#1050#1041#1050
          Position.BandIndex = 18
          Position.ColIndex = 0
        end
        item
          Caption = #1085#1072' '#1050#1041#1050
          Position.BandIndex = 18
          Position.ColIndex = 1
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 10
          Position.ColIndex = 1
          Width = 117
        end
        item
          Caption = #1048#1090#1086#1075#1086' '#1074' '#1073#1102#1076#1078#1077#1090
          Position.BandIndex = 10
          Position.ColIndex = 2
          Width = 117
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1090
          Position.BandIndex = 4
          Position.ColIndex = 4
          Width = 241
        end
        item
          Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
          Position.BandIndex = 4
          Position.ColIndex = 5
          Width = 235
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          FixedKind = fkRight
          Width = 100
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
      object grdTurnoverSheetDBBandedTableViewCustomName: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'CUSTOMNAME'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIdent: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'IDENT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIdent_kbk4000: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'IDENT_KBK4000'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_in: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'REUSE_IN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewnoticekindpay_avans: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewnoticekindpay_avans_t: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewnoticekindpay_celevoy_t: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewcnoticekindpay: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewcnoticekindpay_t: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'CNOTICEKINDPAY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewconfirmkindpay: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_budget: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'ITOGO_BUDGET'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 23
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_out_tortu: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'REUSE_OUT_TORTU'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 24
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '19'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 25
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
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableDViewOut_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewOut_summa
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableDViewOut_summa
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087' '
        DataBinding.FieldName = 'ITEM_NO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 100
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewCustomName: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'/'#1089#1091#1073#1089#1095#1077#1090' '#1056#1058#1059'/'#1089#1091#1073#1089#1095#1077#1090' '#1050#1055' '#1056#1058#1059
        DataBinding.FieldName = 'CUSTOMNAME'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBBandedColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewIn_summa: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBBandedColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewIdent: TcxGridDBBandedColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'IDENT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewIdent_kbk4000: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1050#1041#1050' 4000'
        DataBinding.FieldName = 'IDENT_KBK4000'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewReuse_in: TcxGridDBBandedColumn
        Caption = #1047#1072#1095#1077#1090' '#1089' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'REUSE_IN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans: TcxGridDBBandedColumn
        Caption = #1059#1074#1040' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewnoticekindpay_avans_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1040' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy: TcxGridDBBandedColumn
        Caption = #1059#1074#1062' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewnoticekindpay_celevoy_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1062' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewcnoticekindpay: TcxGridDBBandedColumn
        Caption = #1059#1074#1048#1079#1083' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewcnoticekindpay_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1048#1079#1083' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewconfirmkindpay: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1090#1074
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewItogo_budget: TcxGridDBBandedColumn
        Caption = #1048#1090#1086#1075#1086' '#1074' '#1073#1102#1076#1078#1077#1090' '
        DataBinding.FieldName = 'ITOGO_BUDGET'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewReturn: TcxGridDBBandedColumn
        Caption = #1042#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewReuse_out_tortu: TcxGridDBBandedColumn
        Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'REUSE_OUT_TORTU'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewOut_summa: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    object grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView [2]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsData
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2Viewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Position = spFooter
          Column = grdTurnoverSheetDBBandedTableD2ViewOut_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewOut_summa
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIn_summa
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewPostupilo
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewIdent_kbk4000
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_in
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay_t
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2Viewconfirmkindpay
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewItogo_budget
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReturn
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewReuse_out_tortu
        end
        item
          Format = ',0.00;-,0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableD2ViewOut_summa
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087' '
        DataBinding.FieldName = 'ITEM_NO'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 70
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewCustomName: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'/'#1089#1091#1073#1089#1095#1077#1090' '#1056#1058#1059'/'#1089#1091#1073#1089#1095#1077#1090' '#1050#1055' '#1056#1058#1059
        DataBinding.FieldName = 'CUSTOMNAME'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 180
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBBandedColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewIn_summa: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBBandedColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewIdent: TcxGridDBBandedColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'IDENT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewIdent_kbk4000: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1050#1041#1050' 4000'
        DataBinding.FieldName = 'IDENT_KBK4000'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewReuse_in: TcxGridDBBandedColumn
        Caption = #1047#1072#1095#1077#1090' '#1089' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'REUSE_IN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans: TcxGridDBBandedColumn
        Caption = #1059#1074#1040' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_avans_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1040' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy: TcxGridDBBandedColumn
        Caption = #1059#1074#1062' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewnoticekindpay_celevoy_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1062' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay: TcxGridDBBandedColumn
        Caption = #1059#1074#1048#1079#1083' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewcnoticekindpay_t: TcxGridDBBandedColumn
        Caption = #1059#1074#1048#1079#1083' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2Viewconfirmkindpay: TcxGridDBBandedColumn
        Caption = #1055#1086#1076#1090#1074
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewItogo_budget: TcxGridDBBandedColumn
        Caption = #1048#1090#1086#1075#1086' '#1074' '#1073#1102#1076#1078#1077#1090' '
        DataBinding.FieldName = 'ITOGO_BUDGET'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewReturn: TcxGridDBBandedColumn
        Caption = #1042#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewReuse_out_tortu: TcxGridDBBandedColumn
        Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1056#1058#1059'/'#1058#1053#1055
        DataBinding.FieldName = 'REUSE_OUT_TORTU'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewOut_summa: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
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
        end
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1060'.06.20.00 "'#1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1085#1099#1077' '#1076#1077#1085#1077#1078#1085#1099#1077 +
      ' '#1089#1088#1077#1076#1089#1090#1074#1072'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) kbk'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) ident'
      '      ,to_number(null) ident_kbk4000'
      '      ,to_number(null) reuse_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) itogo_budget'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out_tortu'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,kbk'
      '      ,postupilo'
      '      ,ident'
      '      ,ident_kbk4000'
      '      ,reuse_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,itogo_budget'
      '      ,return'
      '      ,reuse_out_tortu'
      
        '      ,(in_summa + postupilo + reuse_in - itogo_budget - return ' +
        '- reuse_out_tortu) out_summa'
      'from ('
      'select id'
      '      ,parentid '
      
        '      ,(case when (item_no is null and subject_id is null and it' +
        'em_no is null) then '#39#1048#1090#1086#1075#1086#39
      
        '             when (item_no is null and subject_id is not null an' +
        'd item_no is null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      
        '      ,(case when (item_no is null and subject_id is null and it' +
        'em_no is null) then p_oper_balans.get_bsumma(:account_id,:accoun' +
        't_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      
        '             when (item_no is null and subject_id is not null an' +
        'd item_no is null) then p_oborotki.get_bsumma_account_subject(:a' +
        'ccount_id,:account_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0' +
        ',:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,customname'
      '      ,kbk'
      '      ,sum(postupilo) postupilo'
      '      ,sum(ident) ident'
      '      ,sum(ident_kbk4000) ident_kbk4000'
      '      ,sum(reuse_in) reuse_in'
      '      ,sum(noticekindpay_avans) noticekindpay_avans'
      '      ,sum(noticekindpay_avans_t) noticekindpay_avans_t'
      '      ,sum(noticekindpay_celevoy) noticekindpay_celevoy'
      '      ,sum(noticekindpay_celevoy_t) noticekindpay_celevoy_t'
      '      ,sum(cnoticekindpay) cnoticekindpay'
      '      ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '      ,sum(confirmkindpay) confirmkindpay'
      '      ,sum(itogo_budget) itogo_budget'
      '      ,sum(return) return'
      '      ,sum(reuse_out_tortu) reuse_out_tortu'
      'from ('
      '      select (customname||'#39'|'#39'||to_char(subject_id)||'#39'|'#39'||kbk) id'
      '            ,(customname||'#39'|'#39'||to_char(subject_id)) parentid'
      
        '            ,row_number() over(order by customname, subject_id, ' +
        'kbk) item_no'
      '            ,to_number(null) in_summa'
      '            ,customname'
      '            ,subject_id'
      '            ,kbk'
      '            ,postupilo'
      '            ,ident'
      '            ,ident_kbk4000'
      '            ,reuse_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_avans_t'
      '            ,noticekindpay_celevoy'
      '            ,noticekindpay_celevoy_t'
      '            ,cnoticekindpay'
      '            ,cnoticekindpay_t'
      '            ,confirmkindpay'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay+confirmkindpay) itogo_budget'
      '            ,return'
      '            ,reuse_out_tortu'
      '      from ('
      '            select customname'
      '                  ,subject_id'
      '                  ,kbk'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(ident) ident'
      '                  ,sum(ident_kbk4000) ident_kbk4000'
      '                  ,sum(reuse_in) reuse_in'
      '                  ,sum(noticekindpay_avans) noticekindpay_avans'
      
        '                  ,sum(noticekindpay_avans_t) noticekindpay_avan' +
        's_t'
      
        '                  ,sum(noticekindpay_celevoy) noticekindpay_cele' +
        'voy'
      
        '                  ,sum(noticekindpay_celevoy_t) noticekindpay_ce' +
        'levoy_t'
      '                  ,sum(cnoticekindpay) cnoticekindpay'
      '                  ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '                  ,sum(confirmkindpay) confirmkindpay'
      '                  ,sum(return) return'
      '                  ,sum(reuse_out_tortu) reuse_out_tortu'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      
        '                        ,case WHEN acc.code = '#39#1060'06.20.04'#39' OR dl.' +
        'ext_source = '#39'10000KNP'#39' THEN '#39#1050#1053#1055' '#39' ELSE '#39#39' END  || nvl(cl.name,' +
        #39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dic.code kbk'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'CashlessPaymentOrder'#39','#39'PaymentOrderRestUFK'#39')) then sum_r' +
        'ur else 0 end) postupilo'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.01'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.05'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident_kbk4000'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'DocReuse'#39','#39'DocReuseY'#39') and dr.customs_code_new = p_param' +
        's.customcode) then sum_rur else 0 end) reuse_in'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code = p_params.prep' +
        'aymentkbk) then sum_rur else 0 end) noticekindpay_avans'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.01'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns_t'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code != p_params.pre' +
        'paymentkbk) then sum_rur else 0 end) noticekindpay_celevoy'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.02'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy_t'
      
        '                        ,-(case  when (acc.code = '#39#1060'12.10.03'#39' an' +
        'd acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) cnoticekindpay_t'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesysn' +
        'ame = '#39'ReestrNoticeSpecifyKindPayCorr'#39') then sum_rur else 0 end)' +
        ' cnoticekindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrConfirmSpecifyKindPay'#39') then sum_rur else 0 end) c' +
        'onfirmkindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'N'#39' and dl.typesysn' +
        'ame in ('#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39')) then s' +
        'um_rur else 0 end) return'
      
        '                        ,(case when (acct.is_debit = '#39'N'#39') then -' +
        '1 else +1 end)*(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060'06.20.03'#39',' +
        #39#1060'06.20.04'#39') and  dl.typesysname in ('#39'DocReuse'#39','#39'DocReuseY'#39') and' +
        ' dr.customs_code_new != p_params.customcode) then sum_rur else 0' +
        ' end) Reuse_out_tortu'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id = :account_id or code = '#39 +
        #1060'12.10.00'#39')'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_dict dic'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_reestr_specify_kindpay_lst rskl'
      '                      ,fdc_doc_reuse_customs_lst dr'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.kbk_id = dic.id'
      '                    and acct.doc_id = dl.id'
      
        '                    and p_oborotki.get_reestr_specify_kindpay_id' +
        '(acct.doc_id) = rskl.id(+)'
      
        '                    and p_oborotki.get_docreuse_id(acct.doc_id) ' +
        '= dr.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '            group by customname'
      '                    ,subject_id'
      '                    ,kbk'
      '           ) a'
      '      where postupilo != 0'
      '         or ident != 0'
      '         or ident_kbk4000 != 0'
      '         or reuse_in != 0'
      '         or noticekindpay_avans != 0 '
      '         or noticekindpay_avans_t != 0 '
      '         or noticekindpay_celevoy != 0 '
      '         or noticekindpay_celevoy_t != 0 '
      '         or cnoticekindpay != 0 '
      '         or cnoticekindpay_t != 0 '
      '         or confirmkindpay != 0 '
      '         or return != 0 '
      '         or reuse_out_tortu != 0 '
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,in_summa'
      '        ,customname'
      '        ,subject_id'
      '        ,kbk'
      '        ,postupilo'
      '        ,ident'
      '        ,ident_kbk4000'
      '        ,reuse_in'
      '        ,noticekindpay_avans'
      '        ,noticekindpay_avans_t'
      '        ,noticekindpay_celevoy'
      '        ,noticekindpay_celevoy_t'
      '        ,cnoticekindpay'
      '        ,cnoticekindpay_t'
      '        ,confirmkindpay'
      '        ,itogo_budget'
      '        ,return'
      '        ,reuse_out_tortu),(customname),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) kbk'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) ident'
      '      ,to_number(null) ident_kbk4000'
      '      ,to_number(null) Reuse_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) itogo_budget'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out_tortu'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000600000052455455524E010000000000090000004F
      55545F53554D4D41010000000000020000004944010000000000080000005041
      52454E544944010000000000030000004B424B0100000000000A000000435553
      544F4D4E414D4501000000000009000000504F53545550494C4F010000000000
      0800000052455553455F494E010000000000130000004E4F544943454B494E44
      5041595F4156414E53010000000000150000004E4F544943454B494E44504159
      5F4156414E535F54010000000000150000004E4F544943454B494E445041595F
      43454C45564F59010000000000170000004E4F544943454B494E445041595F43
      454C45564F595F540100000000000E000000434E4F544943454B494E44504159
      01000000000010000000434E4F544943454B494E445041595F54010000000000
      0E000000434F4E4649524D4B494E445041590100000000000C00000049544F47
      4F5F4255444745540100000000000F00000052455553455F4F55545F544F5254
      55010000000000050000004944454E540100000000000D0000004944454E545F
      4B424B34303030010000000000}
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
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataCUSTOMNAME: TStringField
      FieldName = 'CUSTOMNAME'
      Size = 1500
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_IN: TFloatField
      FieldName = 'REUSE_IN'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_AVANS: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_AVANS_T: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS_T'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_CELEVOY: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_CELEVOY_T: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY_T'
      DisplayFormat = ',0.00'
    end
    object dsetDataCNOTICEKINDPAY: TFloatField
      FieldName = 'CNOTICEKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataCNOTICEKINDPAY_T: TFloatField
      FieldName = 'CNOTICEKINDPAY_T'
      DisplayFormat = ',0.00'
    end
    object dsetDataCONFIRMKINDPAY: TFloatField
      FieldName = 'CONFIRMKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataITOGO_BUDGET: TFloatField
      FieldName = 'ITOGO_BUDGET'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_OUT_TORTU: TFloatField
      FieldName = 'REUSE_OUT_TORTU'
      DisplayFormat = ',0.00'
    end
    object dsetDataIDENT: TFloatField
      FieldName = 'IDENT'
      DisplayFormat = ',0.00'
    end
    object dsetDataIDENT_KBK4000: TFloatField
      FieldName = 'IDENT_KBK4000'
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
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) kbk'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) ident'
      '      ,to_number(null) ident_kbk4000'
      '      ,to_number(null) reuse_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) itogo_budget'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out_tortu'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) kbk'
      '      ,postupilo'
      '      ,ident'
      '      ,ident_kbk4000'
      '      ,reuse_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,itogo_budget'
      '      ,return'
      '      ,reuse_out_tortu'
      
        '      ,(in_summa + postupilo + reuse_in - itogo_budget - return ' +
        '- reuse_out_tortu) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,postupilo'
      '      ,ident'
      '      ,ident_kbk4000'
      '      ,reuse_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,itogo_budget'
      '      ,return'
      '      ,reuse_out_tortu'
      'from ('
      '      select postupilo'
      '            ,ident'
      '            ,ident_kbk4000'
      '            ,reuse_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_avans_t'
      '            ,noticekindpay_celevoy'
      '            ,noticekindpay_celevoy_t'
      '            ,cnoticekindpay'
      '            ,cnoticekindpay_t'
      '            ,confirmkindpay'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay+confirmkindpay) itogo_budget'
      '            ,return'
      '            ,reuse_out_tortu'
      '      from ('
      '            select nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(ident),0) ident'
      '                  ,nvl(sum(ident_kbk4000),0) ident_kbk4000'
      '                  ,nvl(sum(reuse_in),0) reuse_in'
      
        '                  ,nvl(sum(noticekindpay_avans),0) noticekindpay' +
        '_avans'
      
        '                  ,nvl(sum(noticekindpay_avans_t),0) noticekindp' +
        'ay_avans_t'
      
        '                  ,nvl(sum(noticekindpay_celevoy),0) noticekindp' +
        'ay_celevoy'
      
        '                  ,nvl(sum(noticekindpay_celevoy_t),0) noticekin' +
        'dpay_celevoy_t'
      '                  ,nvl(sum(cnoticekindpay),0) cnoticekindpay'
      '                  ,nvl(sum(cnoticekindpay_t),0) cnoticekindpay_t'
      '                  ,nvl(sum(confirmkindpay),0) confirmkindpay'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(reuse_out_tortu),0) reuse_out_tortu'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dic.code kbk'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'CashlessPaymentOrder'#39','#39'PaymentOrderRestUFK'#39')) then sum_r' +
        'ur else 0 end) postupilo'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.01'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.05'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident_kbk4000'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'DocReuse'#39','#39'DocReuseY'#39') and dr.customs_code_new = p_param' +
        's.customcode) then sum_rur else 0 end) reuse_in'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code = p_params.prep' +
        'aymentkbk) then sum_rur else 0 end) noticekindpay_avans'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.01'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns_t'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code != p_params.pre' +
        'paymentkbk) then sum_rur else 0 end) noticekindpay_celevoy'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.02'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy_t'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesysn' +
        'ame = '#39'ReestrNoticeSpecifyKindPayCorr'#39') then sum_rur else 0 end)' +
        ' cnoticekindpay_t'
      
        '                        ,-(case  when (acc.code = '#39#1060'12.10.03'#39' an' +
        'd acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) cnoticekindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrConfirmSpecifyKindPay'#39') then sum_rur else 0 end) c' +
        'onfirmkindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'N'#39' and dl.typesysn' +
        'ame in ('#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39')) then s' +
        'um_rur else 0 end) return'
      
        '                        ,(case when (acct.is_debit = '#39'N'#39') then -' +
        '1 else +1 end)*(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060'06.20.03'#39',' +
        #39#1060'06.20.04'#39') and  dl.typesysname in ('#39'DocReuse'#39','#39'DocReuseY'#39') and' +
        ' dr.customs_code_new != p_params.customcode) then sum_rur else 0' +
        ' end) Reuse_out_tortu'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id = :account_id or code = '#39 +
        #1060'12.10.00'#39')'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_dict dic'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_reestr_specify_kindpay_lst rskl'
      '                      ,fdc_doc_reuse_customs_lst dr'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.kbk_id = dic.id'
      '                    and acct.doc_id = dl.id'
      
        '                    and p_oborotki.get_reestr_specify_kindpay_id' +
        '(acct.doc_id) = rskl.id(+)'
      
        '                    and p_oborotki.get_docreuse_id(acct.doc_id) ' +
        '= dr.id(+)'
      ''
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) kbk'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) ident'
      '      ,to_number(null) ident_kbk4000'
      '      ,to_number(null) Reuse_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) itogo_budget'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out_tortu'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000600000052455455524E010000000000090000004F
      55545F53554D4D41010000000000020000004944010000000000080000005041
      52454E544944010000000000030000004B424B0100000000000A000000435553
      544F4D4E414D4501000000000009000000504F53545550494C4F010000000000
      0800000052455553455F494E010000000000130000004E4F544943454B494E44
      5041595F4156414E53010000000000150000004E4F544943454B494E44504159
      5F4156414E535F54010000000000150000004E4F544943454B494E445041595F
      43454C45564F59010000000000170000004E4F544943454B494E445041595F43
      454C45564F595F540100000000000E000000434E4F544943454B494E44504159
      01000000000010000000434E4F544943454B494E445041595F54010000000000
      0E000000434F4E4649524D4B494E445041590100000000000C00000049544F47
      4F5F4255444745540100000000000F00000052455553455F4F55545F544F5254
      55010000000000050000004944454E540100000000000D0000004944454E545F
      4B424B34303030010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 224
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
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogCUSTOMNAME: TStringField
      FieldName = 'CUSTOMNAME'
      Size = 1500
    end
    object dsetItogPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItogREUSE_IN: TFloatField
      FieldName = 'REUSE_IN'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTICEKINDPAY_AVANS: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTICEKINDPAY_AVANS_T: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTICEKINDPAY_CELEVOY: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTICEKINDPAY_CELEVOY_T: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogCNOTICEKINDPAY: TFloatField
      FieldName = 'CNOTICEKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogCNOTICEKINDPAY_T: TFloatField
      FieldName = 'CNOTICEKINDPAY_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogCONFIRMKINDPAY: TFloatField
      FieldName = 'CONFIRMKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogITOGO_BUDGET: TFloatField
      FieldName = 'ITOGO_BUDGET'
      DisplayFormat = ',0.00'
    end
    object dsetItogREUSE_OUT_TORTU: TFloatField
      FieldName = 'REUSE_OUT_TORTU'
      DisplayFormat = ',0.00'
    end
    object dsetItogIDENT: TFloatField
      FieldName = 'IDENT'
      DisplayFormat = ',0.00'
    end
    object dsetItogIDENT_KBK4000: TFloatField
      FieldName = 'IDENT_KBK4000'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 224
    Top = 216
  end
  object dsetItogSubject: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,to_char(null) kbk'
      '      ,postupilo'
      '      ,ident'
      '      ,ident_kbk4000'
      '      ,reuse_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,itogo_budget'
      '      ,return'
      '      ,reuse_out_tortu'
      
        '      ,(in_summa + postupilo + reuse_in - itogo_budget - return ' +
        '- reuse_out_tortu) out_summa'
      'from ('
      'select id'
      '      ,'#39'0'#39' parentid '
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' item_no'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,customname'
      '      ,postupilo'
      '      ,ident'
      '      ,ident_kbk4000'
      '      ,reuse_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,itogo_budget'
      '      ,return'
      '      ,reuse_out_tortu'
      'from ('
      '      select (customname||'#39'|'#39'||to_char(subject_id)) id'
      '            ,customname'
      '            ,subject_id'
      '            ,postupilo'
      '            ,ident'
      '            ,ident_kbk4000'
      '            ,reuse_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_avans_t'
      '            ,noticekindpay_celevoy'
      '            ,noticekindpay_celevoy_t'
      '            ,cnoticekindpay'
      '            ,cnoticekindpay_t'
      '            ,confirmkindpay'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay+confirmkindpay) itogo_budget'
      '            ,return'
      '            ,reuse_out_tortu'
      '      from ('
      '            select customname'
      '                  ,subject_id'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(ident) ident'
      '                  ,sum(ident_kbk4000) ident_kbk4000'
      '                  ,sum(reuse_in) reuse_in'
      '                  ,sum(noticekindpay_avans) noticekindpay_avans'
      
        '                  ,sum(noticekindpay_avans_t) noticekindpay_avan' +
        's_t'
      
        '                  ,sum(noticekindpay_celevoy) noticekindpay_cele' +
        'voy'
      
        '                  ,sum(noticekindpay_celevoy_t) noticekindpay_ce' +
        'levoy_t'
      '                  ,sum(cnoticekindpay) cnoticekindpay'
      '                  ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '                  ,sum(confirmkindpay) confirmkindpay'
      '                  ,sum(return) return'
      '                  ,sum(reuse_out_tortu) reuse_out_tortu'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      
        '                        ,case WHEN acc.code = '#39#1060'06.20.04'#39' OR dl.' +
        'ext_source = '#39'10000KNP'#39' THEN '#39#1050#1053#1055' '#39' ELSE '#39#39' END  || nvl(cl.name,' +
        #39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dic.code kbk'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'CashlessPaymentOrder'#39','#39'PaymentOrderRestUFK'#39')) then sum_r' +
        'ur else 0 end) postupilo'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.01'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.05'#39') ' +
        'and  acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ident_kbk4000'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'Y'#39' and dl.typesysna' +
        'me in ('#39'DocReuse'#39','#39'DocReuseY'#39') and dr.customs_code_new = p_param' +
        's.customcode) then sum_rur else 0 end) reuse_in'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code = p_params.prep' +
        'aymentkbk) then sum_rur else 0 end) noticekindpay_avans'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.01'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns_t'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrNoticeSpecifyKindPay'#39' and dic.code != p_params.pre' +
        'paymentkbk) then sum_rur else 0 end) noticekindpay_celevoy'
      
        '                        ,(case  when (acc.code = '#39#1060'12.10.02'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy_t'
      
        '                        ,-(case  when (acc.code = '#39#1060'12.10.03'#39' an' +
        'd acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) cnoticekindpay_t'
      
        '                        ,(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060 +
        '06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesysn' +
        'ame = '#39'ReestrNoticeSpecifyKindPayCorr'#39') then sum_rur else 0 end)' +
        ' cnoticekindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and acct.is_debit = '#39'N'#39' and rskl.typesys' +
        'name = '#39'ReestrConfirmSpecifyKindPay'#39') then sum_rur else 0 end) c' +
        'onfirmkindpay'
      
        '                        ,-(case  when (acc.code in('#39#1060'06.20.02'#39','#39 +
        #1060'06.20.03'#39','#39#1060'06.20.04'#39') and  acct.is_debit = '#39'N'#39' and dl.typesysn' +
        'ame in ('#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39')) then s' +
        'um_rur else 0 end) return'
      
        '                        ,(case when (acct.is_debit = '#39'N'#39') then -' +
        '1 else +1 end)*(case  when (acc.code in('#39#1060'06.20.02'#39','#39#1060'06.20.03'#39',' +
        #39#1060'06.20.04'#39') and  dl.typesysname in ('#39'DocReuse'#39','#39'DocReuseY'#39') and' +
        ' dr.customs_code_new != p_params.customcode) then sum_rur else 0' +
        ' end) Reuse_out_tortu'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id = :account_id or code = '#39 +
        #1060'12.10.00'#39')'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_dict dic'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_reestr_specify_kindpay_lst rskl'
      '                      ,fdc_doc_reuse_customs_lst dr'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.kbk_id = dic.id'
      '                    and acct.doc_id = dl.id'
      
        '                    and p_oborotki.get_reestr_specify_kindpay_id' +
        '(acct.doc_id) = rskl.id(+)'
      
        '                    and p_oborotki.get_docreuse_id(acct.doc_id) ' +
        '= dr.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '            group by customname'
      '                    ,subject_id'
      '           ) a'
      '      where postupilo != 0'
      '         or ident != 0'
      '         or ident_kbk4000 != 0'
      '         or reuse_in != 0'
      '         or noticekindpay_avans != 0 '
      '         or noticekindpay_avans_t != 0 '
      '         or noticekindpay_celevoy != 0 '
      '         or noticekindpay_celevoy_t != 0 '
      '         or cnoticekindpay != 0 '
      '         or cnoticekindpay_t != 0 '
      '         or confirmkindpay != 0 '
      '         or return != 0 '
      '         or reuse_out_tortu != 0 '
      '     )'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000600000052455455524E010000000000090000004F
      55545F53554D4D41010000000000020000004944010000000000080000005041
      52454E544944010000000000030000004B424B0100000000000A000000435553
      544F4D4E414D4501000000000009000000504F53545550494C4F010000000000
      0800000052455553455F494E010000000000130000004E4F544943454B494E44
      5041595F4156414E53010000000000150000004E4F544943454B494E44504159
      5F4156414E535F54010000000000150000004E4F544943454B494E445041595F
      43454C45564F59010000000000170000004E4F544943454B494E445041595F43
      454C45564F595F540100000000000E000000434E4F544943454B494E44504159
      01000000000010000000434E4F544943454B494E445041595F54010000000000
      0E000000434F4E4649524D4B494E445041590100000000000C00000049544F47
      4F5F4255444745540100000000000F00000052455553455F4F55545F544F5254
      55010000000000050000004944454E540100000000000D0000004944454E545F
      4B424B34303030010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 296
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
    object StringField8: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object FloatField8: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectCUSTOMNAME: TStringField
      FieldName = 'CUSTOMNAME'
      Size = 1500
    end
    object dsetItogSubjectPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectREUSE_IN: TFloatField
      FieldName = 'REUSE_IN'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNOTICEKINDPAY_AVANS: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNOTICEKINDPAY_AVANS_T: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNOTICEKINDPAY_CELEVOY: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNOTICEKINDPAY_CELEVOY_T: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectCNOTICEKINDPAY: TFloatField
      FieldName = 'CNOTICEKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectCNOTICEKINDPAY_T: TFloatField
      FieldName = 'CNOTICEKINDPAY_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectCONFIRMKINDPAY: TFloatField
      FieldName = 'CONFIRMKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectITOGO_BUDGET: TFloatField
      FieldName = 'ITOGO_BUDGET'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectREUSE_OUT_TORTU: TFloatField
      FieldName = 'REUSE_OUT_TORTU'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectIDENT: TFloatField
      FieldName = 'IDENT'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectIDENT_KBK4000: TFloatField
      FieldName = 'IDENT_KBK4000'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogSubject: TDataSource
    DataSet = dsetItogSubject
    Left = 296
    Top = 216
  end
end
