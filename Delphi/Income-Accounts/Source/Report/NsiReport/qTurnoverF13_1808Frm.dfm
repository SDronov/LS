inherited qTurnoverF13_1808Form: TqTurnoverF13_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 06.00.00'
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
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1090#1080#1087' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 106
        end
        item
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 460
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 105
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 96
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 84
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 5
          Position.ColIndex = 3
          Width = 95
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
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086' '#1087#1086' '#1089#1091#1073#1089#1095#1077#1090#1091
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 352
        end
        item
          Caption = #1089#1087#1086#1089#1086#1073
          Position.BandIndex = 12
          Position.ColIndex = 0
          Width = 92
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 12
          Position.ColIndex = 1
          Width = 194
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 229
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1079#1072#1083#1086#1075#1086#1074
          Position.BandIndex = 11
          Position.ColIndex = 2
          Width = 188
        end
        item
          Caption = #1057#1087#1080#1089#1072#1085#1086' '#1074' '#1086#1087#1083#1072#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 11
          Position.ColIndex = 3
          Width = 442
        end
        item
          Caption = #1090#1080#1087' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 17
          Position.ColIndex = 0
          Width = 159
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 17
          Position.ColIndex = 1
          Width = 272
        end
        item
          Caption = #1089#1087#1080#1089#1072#1085#1086' '#1085#1072' '#1076#1077#1085#1077#1078#1085#1099#1077' '#1079#1072#1083#1086#1075#1080
          Position.BandIndex = 11
          Position.ColIndex = 4
          Width = 169
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 5
          Width = 158
        end
        item
          Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 11
          Position.ColIndex = 6
          Width = 155
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
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSumma_pp: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DOC_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIN_WAY: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'IN_WAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewin_BezNal: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'IN_BEZNAL'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZach_ExPay: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'ZACH_EXPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZach_money_lien: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'ZACH_MONEY_LIEN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_NACH_TYPE: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'OUT_NACH_TYPE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_pay: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'OUT_PAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSpisano_money_zalog: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'SPISANO_MONEY_ZALOG'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_out: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'REUSE_OUT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '19'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 23
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
      object grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Visible = False
        MinWidth = 60
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        MinWidth = 160
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableDViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        MinWidth = 40
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Hidden = True
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewIN_BEZNAL: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086' '#1087#1086' '#1089#1091#1073#1089#1095#1077#1090#1091
        DataBinding.FieldName = 'IN_BEZNAL'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewZACH_EXPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1080#1079#1083#1080#1096'. '#1091#1087#1083#1072#1090#1099'/'#1074#1079#1099#1089#1082'.'
        DataBinding.FieldName = 'ZACH_EXPAY'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewZACH_MONEY_LIEN: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
        DataBinding.FieldName = 'ZACH_MONEY_LIEN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_PAY: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1074' '#1086#1087#1083#1072#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'OUT_PAY'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewSPISANO_MONEY_ZALOG: TcxGridDBColumn
        Caption = #1044#1047
        DataBinding.FieldName = 'SPISANO_MONEY_ZALOG'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088#1072#1090' '
        DataBinding.FieldName = 'RETURN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewREUSE_OUT: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1074' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
        DataBinding.FieldName = 'REUSE_OUT'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Hidden = True
        MinWidth = 80
        Width = 120
      end
    end
    object grdTurnoverSheetDBBandedTableD2View: TcxGridDBTableView [2]
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
      object grdTurnoverSheetDBBandedTableD2ViewITEM_NO: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Visible = False
        MinWidth = 40
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        MinWidth = 160
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Visible = False
        MinWidth = 40
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        MinWidth = 60
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        MinWidth = 40
      end
      object grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        MinWidth = 120
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_SUMMA: TcxGridDBColumn
        Caption = #1089#1091#1084#1084#1072
        DataBinding.FieldName = 'DOC_SUMMA'
        MinWidth = 60
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_WAY: TcxGridDBColumn
        Caption = #1089#1087#1086#1089#1086#1073
        DataBinding.FieldName = 'IN_WAY'
        MinWidth = 40
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_BEZNAL: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086' '#1087#1086' '#1089#1091#1073#1089#1095#1077#1090#1091
        DataBinding.FieldName = 'IN_BEZNAL'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewZACH_EXPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1080#1079#1083#1080#1096'. '#1091#1087#1083#1072#1090#1099'/'#1074#1079#1099#1089#1082'.'
        DataBinding.FieldName = 'ZACH_EXPAY'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewZACH_MONEY_LIEN: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
        DataBinding.FieldName = 'ZACH_MONEY_LIEN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOUT_NACH_TYPE: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1074' '#1086#1087#1083#1072#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' - '#1090#1080#1087
        DataBinding.FieldName = 'OUT_NACH_TYPE'
        MinWidth = 60
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOUT_PAY: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1074' '#1086#1087#1083#1072#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'OUT_PAY'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewSPISANO_MONEY_ZALOG: TcxGridDBColumn
        Caption = #1044#1047
        DataBinding.FieldName = 'SPISANO_MONEY_ZALOG'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088#1072#1090' '
        DataBinding.FieldName = 'RETURN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewREUSE_OUT: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1074' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
        DataBinding.FieldName = 'REUSE_OUT'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
        MinWidth = 80
        Width = 120
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.06.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084#1080' '#1042 +
      #1069#1044'"'
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
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select id id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_summa'
      '      ,kbk'
      '      ,in_way'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,out_nach_type'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,return'
      '      ,reuse_out'
      
        '      ,(in_summa + in_beznal + zach_expay +zach_money_lien - out' +
        '_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      
        'select nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else (case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091 +
        ' '#1086#1088#1075#1072#1085#1091#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) end)) item_no'
      '      ,item_no item_sort'
      '      ,id'
      '      ,parentid'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        'p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate)' +
        ',0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen p_oborotki.get_bsumma_account_subject(:account_id,:account_c' +
        'ode,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39 +
        'Y'#39' then 1 else 0 end),:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_summa'
      '      ,kbk'
      '      ,in_way'
      '      ,sum(in_beznal) in_beznal'
      '      ,sum(zach_expay) zach_expay'
      '      ,sum(zach_money_lien) zach_money_lien'
      '      ,out_nach_type'
      '      ,sum(out_pay) out_pay'
      '      ,sum(spisano_money_zalog) spisano_money_zalog'
      '      ,sum(return) return'
      '      ,sum(reuse_out) reuse_out'
      
        '      ,sum(in_summa + in_beznal + zach_expay +zach_money_lien - ' +
        'out_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_date,doc_number,doc_id,kbk,in_way,out_nach_type) ite' +
        'm_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||to_char(doc_date,'#39'dd.mm.yyyy'#39')||'#39'|'#39'||doc_number||' +
        #39'|'#39'||doc_id||'#39'|'#39'||kbk||'#39'|'#39'||in_way||'#39'|'#39'||out_nach_type) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) parentid'
      '            ,subject_id'
      '            ,to_number(null) in_summa'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_summa'
      '            ,doc_id'
      '            ,kbk'
      '            ,in_way'
      '            ,in_beznal'
      '            ,zach_expay'
      '            ,zach_money_lien'
      '            ,out_nach_type'
      '            ,out_pay'
      '            ,spisano_money_zalog'
      '            ,return'
      '            ,reuse_out'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_summa'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,in_way'
      '                  ,sum(in_beznal) in_beznal'
      '                  ,sum(zach_expay) zach_expay'
      '                  ,sum(zach_money_lien) zach_money_lien'
      '                  ,out_nach_type'
      '                  ,sum(out_pay) out_pay'
      '                  ,sum(spisano_money_zalog) spisano_money_zalog'
      '                  ,sum(return) return'
      '                  ,sum(reuse_out) reuse_out'
      '            from ('
      '                  select acct.kbk_id'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
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
        'e from fdc_customs_lst where id = p_params.customsid) end) ELSE ' +
        'sl.name end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      '                        ,po.id doc_id'
      
        '                        ,nvl(po.doc_number,(case when (po.doc_da' +
        'te is null) then null else '#39#1073'/'#1085#39' end)) doc_number'
      '                        ,po.doc_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) doc_summa'
      '                        ,po.kbk'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then'
      '                                    (case '
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashlessPaymentOrder'#39',0) = 1 or fdc_o' +
        'bject_type_is_subtype(ol_in.typesysname,'#39'PaymentOrderNonID'#39',0) =' +
        ' 1) then '#39#1041#1053#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashOrderCustoms'#39',0) = 1) then '#39#1050#1058#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CustomCheque'#39',0) = 1) then '#39#1052#1050#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashOrderBank'#39',0) = 1) then '#39#1050#1041#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderReuse'#39',0) = 1) then '#39#1047#1063#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderRestUFK'#39',0) = 1) then '#39#1055#1054 +
        #39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderRestCustoms'#39',0) = 1) then' +
        ' '#39#1055#1054#39
      '                                       else null'
      '                                     end)'
      '                                else null '
      '                          end) in_way'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) in_beznal'
      
        '                        ,(case  when (acc.code = '#39'06.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_expay'
      
        '                        ,(case  when (acc.code = '#39'06.01.05'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_money_lien'
      
        '                        ,(case  when (acc.code = '#39'06.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then'
      '                                    (case '
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_out.typesysname,'#39'CustomDecl'#39',0) = 1) then '#39#1044#1058#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_out.typesysname,'#39'TPO'#39',0) = 1) then '#39#1058#1055#1054#39
      '                                       else '#39#1048#1085#1099#1077#39
      '                                     end)'
      '                                else null '
      '                          end) out_nach_type'
      
        '                        ,-(case  when (acc.code = '#39'06.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_pay'
      
        '                        ,-(case  when (acc.code = '#39'06.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) spisano_money_zal' +
        'og'
      
        '                        ,-(case  when (acc.code = '#39'06.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'06.01.06'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      #9#9#9#9#9'            ,fdc_document_lst dl'
      '                      ,fdc_po_lst po'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_object_lst ol_in'
      '                      ,fdc_object_lst ol_out'
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
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'ol_in.id(+)'
      
        '                    and p_oborotki.get_deduct_main_doc_id(acct.d' +
        'oc_id) = ol_out.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_summa'
      '                    ,doc_id'
      '                    ,kbk'
      '                    ,in_way'
      '                    ,out_nach_type'
      '           ) a'
      '      where in_beznal != 0'
      '         or zach_expay != 0'
      '         or zach_money_lien != 0'
      '         or out_pay != 0'
      '         or spisano_money_zalog != 0'
      '         or return != 0'
      '         or reuse_out != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,id'
      '        ,parentid'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_summa'
      '        ,doc_id'
      '        ,kbk'
      '        ,in_way'
      '        ,in_beznal'
      '        ,zach_expay'
      '        ,zach_money_lien'
      '        ,out_nach_type'
      '        ,out_pay'
      '        ,spisano_money_zalog'
      '        ,return'
      '        ,reuse_out),(subject_id,inn,name,type_person),())'
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
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D4245520100000000000600000052455455524E0100000000
      00090000004F55545F53554D4D41010000000000020000004944010000000000
      08000000504152454E54494401000000000003000000494E4E01000000000004
      0000004E414D450100000000000B000000545950455F504552534F4E01000000
      000009000000444F435F53554D4D41010000000000030000004B424B01000000
      000006000000494E5F57415901000000000009000000494E5F42455A4E414C01
      00000000000A0000005A4143485F45585041590100000000000F0000005A4143
      485F4D4F4E45595F4C49454E0100000000000D0000004F55545F4E4143485F54
      595045010000000000070000004F55545F504159010000000000130000005350
      4953414E4F5F4D4F4E45595F5A414C4F47010000000000090000005245555345
      5F4F5554010000000000}
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
    object dsetDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetDataTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetDataIN_WAY: TStringField
      FieldName = 'IN_WAY'
      Size = 255
    end
    object dsetDataIN_BEZNAL: TFloatField
      FieldName = 'IN_BEZNAL'
      DisplayFormat = ',0.00'
    end
    object dsetDataZACH_EXPAY: TFloatField
      FieldName = 'ZACH_EXPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataZACH_MONEY_LIEN: TFloatField
      FieldName = 'ZACH_MONEY_LIEN'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_NACH_TYPE: TStringField
      FieldName = 'OUT_NACH_TYPE'
      Size = 255
    end
    object dsetDataOUT_PAY: TFloatField
      FieldName = 'OUT_PAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataSPISANO_MONEY_ZALOG: TFloatField
      FieldName = 'SPISANO_MONEY_ZALOG'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_OUT: TFloatField
      FieldName = 'REUSE_OUT'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
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
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,return'
      '      ,reuse_out'
      
        '      ,(in_summa + in_beznal + zach_expay +zach_money_lien - out' +
        '_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,return'
      '      ,reuse_out'
      'from ('
      '      select in_beznal'
      '            ,zach_expay'
      '            ,zach_money_lien'
      '            ,out_pay'
      '            ,spisano_money_zalog'
      '            ,return'
      '            ,reuse_out'
      '      from ('
      '            select nvl(sum(in_beznal),0) in_beznal'
      '                  ,nvl(sum(zach_expay),0) zach_expay'
      '                  ,nvl(sum(zach_money_lien),0) zach_money_lien'
      '                  ,nvl(sum(out_pay),0) out_pay'
      
        '                  ,nvl(sum(spisano_money_zalog),0) spisano_money' +
        '_zalog'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(reuse_out),0) reuse_out'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) in_beznal'
      
        '                        ,(case  when (acc.code = '#39'06.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_expay'
      
        '                        ,(case  when (acc.code = '#39'06.01.05'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_money_lien'
      
        '                        ,-(case  when (acc.code = '#39'06.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_pay'
      
        '                        ,-(case  when (acc.code = '#39'06.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) spisano_money_zal' +
        'og'
      
        '                        ,-(case  when (acc.code = '#39'06.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'06.01.06'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      
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
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D4245520100000000000600000052455455524E0100000000
      00090000004F55545F53554D4D41010000000000020000004944010000000000
      08000000504152454E54494401000000000003000000494E4E01000000000004
      0000004E414D450100000000000B000000545950455F504552534F4E01000000
      000009000000444F435F53554D4D41010000000000030000004B424B01000000
      000006000000494E5F57415901000000000009000000494E5F42455A4E414C01
      00000000000A0000005A4143485F45585041590100000000000F0000005A4143
      485F4D4F4E45595F4C49454E0100000000000D0000004F55545F4E4143485F54
      595045010000000000070000004F55545F504159010000000000130000005350
      4953414E4F5F4D4F4E45595F5A414C4F47010000000000090000005245555345
      5F4F5554010000000000}
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
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogIN_WAY: TStringField
      FieldName = 'IN_WAY'
      Size = 255
    end
    object dsetItogIN_BEZNAL: TFloatField
      FieldName = 'IN_BEZNAL'
      DisplayFormat = ',0.00'
    end
    object dsetItogZACH_EXPAY: TFloatField
      FieldName = 'ZACH_EXPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogZACH_MONEY_LIEN: TFloatField
      FieldName = 'ZACH_MONEY_LIEN'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_NACH_TYPE: TStringField
      FieldName = 'OUT_NACH_TYPE'
      Size = 255
    end
    object dsetItogOUT_PAY: TFloatField
      FieldName = 'OUT_PAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSPISANO_MONEY_ZALOG: TFloatField
      FieldName = 'SPISANO_MONEY_ZALOG'
      DisplayFormat = ',0.00'
    end
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogREUSE_OUT: TFloatField
      FieldName = 'REUSE_OUT'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
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
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,to_char(null) out_nach_type'
      '      ,return'
      '      ,reuse_out'
      
        '      ,(in_summa + in_beznal + zach_expay +zach_money_lien - out' +
        '_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      
        'select (case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091 +
        #39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) item_no'
      '      ,item_no item_sort'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,id'
      '      ,'#39'0'#39' parentid'
      '      ,subject_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,return'
      '      ,reuse_out'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,in_beznal'
      '            ,zach_expay'
      '            ,zach_money_lien'
      '            ,out_pay'
      '            ,spisano_money_zalog'
      '            ,return'
      '            ,reuse_out'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(in_beznal) in_beznal'
      '                  ,sum(zach_expay) zach_expay'
      '                  ,sum(zach_money_lien) zach_money_lien'
      '                  ,sum(out_pay) out_pay'
      '                  ,sum(spisano_money_zalog) spisano_money_zalog'
      '                  ,sum(return) return'
      '                  ,sum(reuse_out) reuse_out'
      '            from ('
      '                  select acct.kbk_id'
      
        '                        ,(case :summarn when '#39'Y'#39' then (case dl.t' +
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
        'e from fdc_customs_lst where id = p_params.customsid) end) ELSE ' +
        'sl.name end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) in_beznal'
      
        '                        ,(case  when (acc.code = '#39'06.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_expay'
      
        '                        ,(case  when (acc.code = '#39'06.01.05'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_money_lien'
      
        '                        ,-(case  when (acc.code = '#39'06.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_pay'
      
        '                        ,-(case  when (acc.code = '#39'06.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) spisano_money_zal' +
        'og'
      
        '                        ,-(case  when (acc.code = '#39'06.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'06.01.06'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
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
      '                    and acct.subject_id = sl.id(+)'
      
        '                    and acct.subject_id = cl.id(+)              ' +
        '    )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where in_beznal != 0'
      '         or zach_expay != 0'
      '         or zach_money_lien != 0'
      '         or out_pay != 0'
      '         or spisano_money_zalog != 0'
      '         or return != 0'
      '         or reuse_out != 0'
      '     )'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000015000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D4245520100000000000600000052455455524E0100000000
      00090000004F55545F53554D4D41010000000000020000004944010000000000
      08000000504152454E54494401000000000003000000494E4E01000000000004
      0000004E414D450100000000000B000000545950455F504552534F4E01000000
      000009000000444F435F53554D4D41010000000000030000004B424B01000000
      000006000000494E5F57415901000000000009000000494E5F42455A4E414C01
      00000000000A0000005A4143485F45585041590100000000000F0000005A4143
      485F4D4F4E45595F4C49454E0100000000000D0000004F55545F4E4143485F54
      595045010000000000070000004F55545F504159010000000000130000005350
      4953414E4F5F4D4F4E45595F5A414C4F47010000000000090000005245555345
      5F4F5554010000000000}
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
    object StringField7: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object FloatField2: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField8: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object StringField9: TStringField
      FieldName = 'IN_WAY'
      Size = 255
    end
    object FloatField3: TFloatField
      FieldName = 'IN_BEZNAL'
      DisplayFormat = ',0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'ZACH_EXPAY'
      DisplayFormat = ',0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'ZACH_MONEY_LIEN'
      DisplayFormat = ',0.00'
    end
    object StringField10: TStringField
      FieldName = 'OUT_NACH_TYPE'
      Size = 255
    end
    object FloatField6: TFloatField
      FieldName = 'OUT_PAY'
      DisplayFormat = ',0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'SPISANO_MONEY_ZALOG'
      DisplayFormat = ',0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'REUSE_OUT'
      DisplayFormat = ',0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogSubject: TDataSource
    DataSet = dsetItogSubject
    Left = 296
    Top = 216
  end
end
