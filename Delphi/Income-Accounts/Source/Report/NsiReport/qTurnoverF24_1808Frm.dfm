inherited qTurnoverF24_1808Form: TqTurnoverF24_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' '#1056'09.10.00 '#1080' '#1056'09.20.00'
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
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'/'#1089#1091#1073#1089#1095#1077#1090' '#1056#1058#1059'/'#1089#1091#1073#1089#1095#1077#1090' '#1050#1055' '#1056#1058#1059
          FixedKind = fkLeft
          Width = 200
        end
        item
          Caption = #1056#1077#1077#1089#1090#1088' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090'/'#1079#1072#1095#1077#1090' '#1085#1072' '#1056#1058#1059'/'#1058#1053#1055
          Width = 270
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 2
          Position.ColIndex = 0
          Width = 60
        end
        item
          Caption = #8470
          Position.BandIndex = 2
          Position.ColIndex = 1
          Width = 90
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 2
          Position.ColIndex = 2
          Width = 90
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 280
        end
        item
          Caption = #1055#1086#1083#1091#1095#1077#1085#1086
          Position.BandIndex = 7
          Position.ColIndex = 0
          Width = 140
        end
        item
          Caption = #1057#1087#1080#1089#1072#1085#1086' '#1089#1086' '#1089#1095#1077#1090#1072
          Position.BandIndex = 7
          Position.ColIndex = 1
          Width = 140
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
      object grdTurnoverSheetDBBandedTableViewDocType: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOCTYPE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDoc_number: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDoc_date: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDebit: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DEBIT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 10
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
        Caption = #8470' '#1087'/'#1087' '
        DataBinding.FieldName = 'ITEM_NO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 70
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewCustomName: TcxGridDBBandedColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'/'#1089#1091#1073#1089#1095#1077#1090' '#1056#1058#1059'/'#1089#1091#1073#1089#1095#1077#1090' '#1050#1055' '#1056#1058#1059
        DataBinding.FieldName = 'CUSTOMNAME'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 180
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDocType: TcxGridDBBandedColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'DOCTYPE'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 60
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDoc_number: TcxGridDBBandedColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDoc_date: TcxGridDBBandedColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
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
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDebit: TcxGridDBBandedColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1089#1086' '#1089#1095#1077#1090#1072
        DataBinding.FieldName = 'DEBIT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
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
      DataController.DataSource = dsItog_Doctype
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      object grdTurnoverSheetDBBandedTableD2ViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087' '
        DataBinding.FieldName = 'ITEM_NO'
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
      object grdTurnoverSheetDBBandedTableD2ViewDocType: TcxGridDBBandedColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'DOCTYPE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 60
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewDoc_number: TcxGridDBBandedColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewDoc_date: TcxGridDBBandedColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
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
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD2ViewDebit: TcxGridDBBandedColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1089#1086' '#1089#1095#1077#1090#1072
        DataBinding.FieldName = 'DEBIT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
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
      object grdTurnoverSheetDBBandedTableD3ViewCustomName: TcxGridDBBandedColumn
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
      object grdTurnoverSheetDBBandedTableD3ViewDocType: TcxGridDBBandedColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'DOCTYPE'
        Visible = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 60
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3iewDoc_number: TcxGridDBBandedColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewDoc_date: TcxGridDBBandedColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewIn_summa: TcxGridDBBandedColumn
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
      object grdTurnoverSheetDBBandedTableD3ViewPostupilo: TcxGridDBBandedColumn
        Caption = #1055#1086#1083#1091#1095#1077#1085#1086' '
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewDebit: TcxGridDBBandedColumn
        Caption = #1057#1087#1080#1089#1072#1085#1086' '#1089#1086' '#1089#1095#1077#1090#1072
        DataBinding.FieldName = 'DEBIT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableD3ViewOut_summa: TcxGridDBBandedColumn
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
          object grdTurnoverSheetLevel3: TcxGridLevel
            GridView = grdTurnoverSheetDBBandedTableD3View
          end
        end
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1056'.09.10.00 "'#1056#1077#1077#1089#1090#1088#1099' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090'", '#1056 +
      '.09.20.00 "'#1056#1077#1077#1089#1090#1088' '#1085#1072' '#1079#1072#1095#1077#1090' '#1085#1072' '#1056#1058#1059'/'#1058#1053#1055'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       )in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       ) out_summa'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,doctype'
      '      ,doc_number'
      '      ,doc_date'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa + postupilo - debit) out_summa'
      'from ('
      'select id'
      '      ,parentid '
      
        '      ,(case when (item_no is null and subject_id is null and do' +
        'ctype is null) then '#39#1048#1090#1086#1075#1086#39
      
        '             when (item_no is null and subject_id is not null an' +
        'd doctype is null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39
      
        '             when (item_no is null and subject_id is not null an' +
        'd doctype is not null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1080#1087#1091#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      
        '      ,(case when (item_no is null and subject_id is null and do' +
        'ctype is null) then p_oper_balans.get_bsumma(:account_id,:accoun' +
        't_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      
        '                                                                ' +
        '                    +'
      
        '                                                                ' +
        '                    p_oper_balans.get_bsumma(:account_id_reuse,:' +
        'account_code_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      
        '             when (item_no is null and subject_id is not null an' +
        'd doctype is null) then p_oborotki.get_bsumma_account_subject(:a' +
        'ccount_id,:account_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0' +
        ',:ists)'
      
        '                                                                ' +
        '                        +'
      
        '                                                                ' +
        '                        p_oborotki.get_bsumma_account_subject(:a' +
        'ccount_id_reuse,:account_code_reuse,trunc(:bdate),subject_id,0,'#39 +
        'rur'#39','#39'rur'#39',0,:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,customname'
      '      ,doctype'
      '      ,doc_number'
      '      ,doc_date'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select (customname||'#39'|'#39'||to_char(subject_id)||'#39'|'#39'||doctype' +
        '||'#39'|'#39'||doc_number||'#39'|'#39'||to_date(doc_date,'#39'dd.mm.yyyy'#39')) id'
      
        '            ,(customname||'#39'|'#39'||to_char(subject_id)||'#39'|'#39'||doctype' +
        ') parentid'
      
        '            ,row_number() over(order by customname, subject_id, ' +
        'doctype, doc_number, doc_date) item_no'
      '            ,to_number(null) in_summa'
      '            ,customname'
      '            ,subject_id'
      '            ,doctype'
      '            ,doc_number'
      '            ,doc_date'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select customname'
      '                  ,subject_id'
      '                  ,doctype'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,nvl(cl.name,'#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      
        '                        ,(case acc.code when '#39#1056'09.10.00'#39' then '#39#1042 +
        #1086#1079#1074#1088#1072#1090#39' when '#39#1056'09.20.00'#39' then '#39#1047#1072#1095#1077#1090#39' else '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' end) ' +
        'doctype'
      '                        ,dl.doc_number'
      '                        ,dl.doc_date'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id in (:account_id,:account_' +
        'id_reuse))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      
        '                    and p_oborotki.get_main_docpack_id(acct.doc_' +
        'id) = dl.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '            group by customname'
      '                    ,subject_id'
      '                    ,doctype'
      '                    ,doc_number'
      '                    ,doc_date'
      '           ) a'
      '      where postupilo != 0'
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,in_summa'
      '        ,customname'
      '        ,subject_id'
      '        ,doctype'
      '        ,doc_number'
      '        ,doc_date'
      '        ,postupilo'
      '        ,debit),(customname),(customname,doctype),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       )in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       ) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000070000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00110000003A4143434F554E545F49445F524555534503000000000000000000
      0000130000003A4143434F554E545F434F44455F524555534505000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E5449440100000000000A000000
      435553544F4D4E414D4501000000000009000000504F53545550494C4F010000
      00000007000000444F43545950450100000000000A000000444F435F4E554D42
      455201000000000008000000444F435F44415445010000000000050000004445
      424954010000000000}
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
    object dsetDataDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
      Size = 255
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataDEBIT: TFloatField
      FieldName = 'DEBIT'
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
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       )in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       ) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa + postupilo - debit) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       ) in_summa'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select postupilo'
      '            ,debit'
      '      from ('
      '            select nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,nvl(cl.name,'#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      
        '                        ,(case acc.code when '#39#1056'09.10.00'#39' then '#39#1042 +
        #1086#1079#1074#1088#1072#1090#39' when '#39#1056'09.20.00'#39' then '#39#1047#1072#1095#1077#1090#39' else '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' end) ' +
        'doctype'
      '                        ,dl.doc_number'
      '                        ,dl.doc_date'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id in (:account_id,:account_' +
        'id_reuse))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      
        '                    and p_oborotki.get_main_docpack_id(acct.doc_' +
        'id) = dl.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       )in_summa'
      '      ,to_char(null) customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      '      ,('
      
        '        p_oper_balans.get_bsumma(:account_id,:account_code,trunc' +
        '(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oper_balans.get_bsumma(:account_id_reuse,:account_code' +
        '_reuse,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '       ) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000070000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00110000003A4143434F554E545F49445F524555534503000000000000000000
      0000130000003A4143434F554E545F434F44455F524555534505000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E5449440100000000000A000000
      435553544F4D4E414D4501000000000009000000504F53545550494C4F010000
      00000007000000444F43545950450100000000000A000000444F435F4E554D42
      455201000000000008000000444F435F44415445010000000000050000004445
      424954010000000000}
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
    object dsetItogDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
      Size = 255
    end
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogDEBIT: TFloatField
      FieldName = 'DEBIT'
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
      '      ,'#39'0'#39' parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,to_char(null) doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa + postupilo - debit) out_summa'
      'from ('
      'select id'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' item_no'
      '      ,('
      
        '        p_oborotki.get_bsumma_account_subject(:account_id,:accou' +
        'nt_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '        +'
      
        '        p_oborotki.get_bsumma_account_subject(:account_id_reuse,' +
        ':account_code_reuse,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0,:is' +
        'ts)'
      '       ) in_summa'
      '      ,customname'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select (customname||'#39'|'#39'||to_char(subject_id)) id'
      '            ,customname'
      '            ,subject_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select customname'
      '                  ,subject_id'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,nvl(cl.name,'#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      
        '                        ,(case acc.code when '#39#1056'09.10.00'#39' then '#39#1042 +
        #1086#1079#1074#1088#1072#1090#39' when '#39#1056'09.20.00'#39' then '#39#1047#1072#1095#1077#1090#39' else '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' end) ' +
        'doctype'
      '                        ,dl.doc_number'
      '                        ,dl.doc_date'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id in (:account_id,:account_' +
        'id_reuse))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      
        '                    and p_oborotki.get_main_docpack_id(acct.doc_' +
        'id) = dl.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '            group by customname'
      '                    ,subject_id'
      '           ) a'
      '      where postupilo != 0'
      '         or debit != 0'
      '     )'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000070000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00110000003A4143434F554E545F49445F524555534503000000000000000000
      0000130000003A4143434F554E545F434F44455F524555534505000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E5449440100000000000A000000
      435553544F4D4E414D4501000000000009000000504F53545550494C4F010000
      00000007000000444F43545950450100000000000A000000444F435F4E554D42
      455201000000000008000000444F435F44415445010000000000050000004445
      424954010000000000}
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
    object dsetItogSubjectDOCTYPE: TStringField
      FieldName = 'DOCTYPE'
      Size = 255
    end
    object dsetItogSubjectDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogSubjectDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogSubjectDEBIT: TFloatField
      FieldName = 'DEBIT'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogSubject: TDataSource
    DataSet = dsetItogSubject
    Left = 296
    Top = 216
  end
  object dsetItog_doctype: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,doctype'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa + postupilo - debit) out_summa'
      'from ('
      'select id'
      '      ,parentid '
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1080#1087#1091#39' item_no'
      '      ,in_summa'
      '      ,customname'
      '      ,doctype'
      '      ,postupilo'
      '      ,debit'
      '      ,:account_code account_code'
      '      ,:account_code_reuse account_code_reuse'
      'from ('
      
        '      select (customname||'#39'|'#39'||to_char(subject_id)||'#39'|'#39'||doctype' +
        ') id'
      '            ,(customname||'#39'|'#39'||to_char(subject_id)) parentid'
      '            ,to_number(null) in_summa'
      '            ,customname'
      '            ,subject_id'
      '            ,doctype'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select customname'
      '                  ,subject_id'
      '                  ,doctype'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,nvl(cl.name,'#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39') customname'
      
        '                        ,(case acc.code when '#39#1056'09.10.00'#39' then '#39#1042 +
        #1086#1079#1074#1088#1072#1090#39' when '#39#1056'09.20.00'#39' then '#39#1047#1072#1095#1077#1090#39' else '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' end) ' +
        'doctype'
      '                        ,dl.doc_number'
      '                        ,dl.doc_date'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                 from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      
        '                        start with (id in (:account_id,:account_' +
        'id_reuse))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      
        '                    and p_oborotki.get_main_docpack_id(acct.doc_' +
        'id) = dl.id(+)'
      '                    and acct.subject_id = cl.id'
      '                  )'
      '            group by customname'
      '                    ,subject_id'
      '                    ,doctype'
      '           ) a'
      '      where postupilo != 0'
      '         or debit != 0'
      '     )'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000070000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00110000003A4143434F554E545F49445F524555534503000000000000000000
      0000130000003A4143434F554E545F434F44455F524555534505000000000000
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000B000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E5449440100000000000A000000
      435553544F4D4E414D4501000000000009000000504F53545550494C4F010000
      00000007000000444F43545950450100000000000A000000444F435F4E554D42
      455201000000000008000000444F435F44415445010000000000050000004445
      424954010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 384
    Top = 112
    object StringField4: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object StringField5: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object StringField6: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object FloatField2: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField7: TStringField
      FieldName = 'CUSTOMNAME'
      Size = 1500
    end
    object FloatField4: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object StringField8: TStringField
      FieldName = 'DOCTYPE'
      Size = 255
    end
    object StringField9: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object FloatField5: TFloatField
      FieldName = 'DEBIT'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog_Doctype: TDataSource
    DataSet = dsetItog_doctype
    Left = 360
    Top = 216
  end
end
