inherited qTurnoverF09_1808Form: TqTurnoverF09_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 03.00.00'
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
          FixedKind = fkLeft
          Width = 240
        end
        item
          Caption = #1048#1053#1053
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 87
        end
        item
          Caption = #1085#1072#1080#1084'./'#1060#1048#1054
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 104
        end
        item
          Caption = #1090#1080#1087
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 49
        end
        item
          Caption = #1055#1083#1072#1090#1077#1078#1080' / '#1087#1077#1085#1080
          Width = 117
        end
        item
          Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077
          Width = 360
        end
        item
          Caption = #8470
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 105
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 84
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 6
          Position.ColIndex = 2
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 120
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 770
        end
        item
          Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 97
        end
        item
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 92
        end
        item
          Caption = #1055#1086#1075#1072#1096#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 2
          Width = 117
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 3
          Width = 116
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1079#1072' '#1073#1072#1083#1072#1085#1089
          Position.BandIndex = 11
          Position.ColIndex = 4
          Width = 116
        end
        item
          Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1095#1077#1090#1072
          Position.BandIndex = 11
          Position.ColIndex = 5
          Width = 116
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1087#1086' '#8470'117'#1085
          Position.BandIndex = 11
          Position.ColIndex = 6
          Width = 116
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          Width = 120
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
      object grdTurnoverSheetDBBandedTableViewPENY_ZADOLG: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'PENY_ZADOLG'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOCNUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocDate: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOCDATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocSumma: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DOCSUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewINST: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'INST'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRest: TcxGridDBBandedColumn
        Caption = '11'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRESET: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'RESET'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcl: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'EXCLUDE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZab: TcxGridDBBandedColumn
        Caption = '14'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPay: TcxGridDBBandedColumn
        Caption = '15'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableView117: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'EXCLUDE_117'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_SUMMA_ITOGO: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView [1]
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
      OptionsView.HeaderAutoHeight = True
      object grdTurnoverSheetDBBandedTableDViewItem_no: TcxGridDBBandedColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Width = 70
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
        Width = 140
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPENY_ZADOLG: TcxGridDBBandedColumn
        Caption = #1055#1083#1072#1090#1077#1078#1080' / '#1087#1077#1085#1080
        DataBinding.FieldName = 'PENY_ZADOLG'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDocNumbe: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077' - '#8470
        DataBinding.FieldName = 'DOCNUMBER'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDocDate: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077'  - '#1076#1072#1090#1072
        DataBinding.FieldName = 'DOCDATE'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewDocSumma: TcxGridDBBandedColumn
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077'  - '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'DOCSUMMA'
        Width = 100
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Visible = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewINST: TcxGridDBBandedColumn
        Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
        DataBinding.FieldName = 'INST'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewRest: TcxGridDBBandedColumn
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewRESET: TcxGridDBBandedColumn
        Caption = #1055#1086#1075#1072#1096#1077#1085#1086
        DataBinding.FieldName = 'RESET'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewExcl: TcxGridDBBandedColumn
        Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086
        DataBinding.FieldName = 'EXCLUDE'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewZab: TcxGridDBBandedColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1079#1072' '#1073#1072#1083#1072#1085#1089
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewPay: TcxGridDBBandedColumn
        Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1095#1077#1090#1072
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDView117: TcxGridDBBandedColumn
        Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1087#1086' '#8470'117'#1085
        DataBinding.FieldName = 'EXCLUDE_117'
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA_ITOGO: TcxGridDBBandedColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Visible = False
        Width = 120
        Position.BandIndex = -1
        Position.ColIndex = -1
        Position.RowIndex = -1
      end
    end
    inherited grdTurnoverSheetLevel: TcxGridLevel
      object grdTurnoverSheetLevel1: TcxGridLevel
        GridView = grdTurnoverSheetDBBandedTableDView
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.03.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090 +
      #1080' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084' '#1080' '#1087#1077#1085#1103#1084'"  '
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-1'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      '            ,to_number(null) exclude'
      '            ,to_number(null) exclude_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,(case when (item_no is null and subject_id is null and pe' +
        'ny_zadolg is null) then '#39#1048#1090#1086#1075#1086#39
      
        '             when (item_no is null and subject_id is not null an' +
        'd peny_zadolg is null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39
      '             else item_no'
      '       end) item_no'
      '      ,item_no_sort'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      
        '      ,(case when (item_no is null and subject_id is null and pe' +
        'ny_zadolg is null) then p_oper_balans.get_bsumma(:account_id,:ac' +
        'count_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' t' +
        'hen 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is not null an' +
        'd peny_zadolg is null) then p_oper_balans.get_bsumma_account_sub' +
        'ject(:account_id,:account_code,trunc(:bdate),subject_id,0,'#39'rur'#39',' +
        #39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '             else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select id'
      '      ,parentid'
      '      ,to_char(item_no) item_no'
      '      ,item_no item_no_sort'
      '      ,subject_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,to_number(null) in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,doc_id'
      '      ,sum(inst) inst'
      '      ,sum(reset) reset'
      '      ,sum(exclude) exclude'
      '      ,sum(exclude_117) exclude_117'
      'from ('
      
        '      select row_number() over(order by name,type_person,inn,sub' +
        'ject_id,peny_zadolg,docnumber,docdate,doc_id) item_no'
      
        '            ,(name||'#39'|'#39'||type_person||'#39'|'#39'||inn||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||peny_zadolg||'#39'|'#39'||docnumber||'#39'|'#39'||to_char(docdate' +
        ','#39'dd.mm.yyyy'#39')||'#39'|'#39'||to_char(doc_id)) id'
      '            ,'#39'0'#39' parentid'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,peny_zadolg'
      '            ,docnumber'
      '            ,docdate'
      '            ,docsumma'
      '            ,doc_id'
      '            ,inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,peny_zadolg'
      '                  ,docnumber'
      '                  ,docdate'
      '                  ,docsumma'
      '                  ,doc_id'
      '                  ,sum(inst) inst'
      '                  ,sum(reset) reset'
      '                  ,sum(exclude) exclude'
      '                  ,sum(exclude_117) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,dm.doc_number docnumber'
      '                        ,dm.doc_date docdate'
      
        '                        ,case when dm.doc_number is not null the' +
        'n fdc_noticepay_get_sum(nl.id, '#39'summa_only_dc'#39') else null end do' +
        'csumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        )'
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and dm.owner_object_id (+) = nl.id'
      '                  )'
      '            group by subject_id'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,peny_zadolg'
      '                    ,docnumber'
      '                    ,docdate'
      '                    ,docsumma'
      '                    ,doc_id'
      '           ) a'
      '      where inst != 0 '
      '         or reset != 0'
      '         or exclude != 0'
      '         or exclude_117 != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,subject_id'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,peny_zadolg'
      '        ,docnumber'
      '        ,docdate'
      '        ,docsumma'
      '        ,doc_id'
      '        ,inst'
      '        ,reset'
      '        ,exclude'
      '        ,exclude_117),(subject_id,inn,name,type_person),())'
      '     )'
      'order by item_no_sort nulls first, item_no'
      '     )'
      'union all'
      '--// '#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
      'select '#39'1'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) peny_zadolg'
      '      ,in_summa_itogo'
      '      ,to_char(null) docnumber'
      '      ,to_date(null) docdate'
      '      ,to_number(null) docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa_itogo'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      '      select inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select nvl(sum(inst),0) inst'
      '                  ,nvl(sum(reset),0) reset'
      '                  ,nvl(sum(exclude),0) exclude'
      '                  ,nvl(sum(exclude_117),0) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,nl.doc_number docnumber'
      '                        ,nl.doc_date docdate'
      '                        ,nl.summa docsumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      ' '#9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            where peny_zadolg = '#39#1047#39
      '           ) a'
      '     )'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--// '#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080
      'select '#39'2'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) peny_zadolg'
      '      ,in_summa_itogo'
      '      ,to_char(null) docnumber'
      '      ,to_date(null) docdate'
      '      ,to_number(null) docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa_itogo'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      '      select inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select nvl(sum(inst),0) inst'
      '                  ,nvl(sum(reset),0) reset'
      '                  ,nvl(sum(exclude),0) exclude'
      '                  ,nvl(sum(exclude_117),0) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,nl.doc_number docnumber'
      '                        ,nl.doc_date docdate'
      '                        ,nl.summa docsumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      ' '#9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            where peny_zadolg = '#39#1055#39
      '           ) a'
      '     )'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-2'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      '            ,to_number(null) exclude'
      '            ,to_number(null) exclude_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000010000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E54494401000000000003000000494E4E0100
      00000000040000004E414D450100000000000B000000545950455F504552534F
      4E0100000000000B00000050454E595F5A41444F4C470100000000000E000000
      494E5F53554D4D415F49544F474F01000000000009000000444F434E554D4245
      5201000000000007000000444F434441544501000000000008000000444F4353
      554D4D4101000000000004000000494E53540100000000000500000052455345
      54010000000000070000004558434C5544450100000000000B0000004558434C
      5544455F3131370100000000000F0000004F55545F53554D4D415F49544F474F
      010000000000}
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
    object dsetDataPENY_ZADOLG: TStringField
      FieldName = 'PENY_ZADOLG'
      Size = 255
    end
    object dsetDataIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 255
    end
    object dsetDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsetDataDOCSUMMA: TFloatField
      FieldName = 'DOCSUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataINST: TFloatField
      FieldName = 'INST'
      DisplayFormat = ',0.00'
    end
    object dsetDataRESET: TFloatField
      FieldName = 'RESET'
      DisplayFormat = ',0.00'
    end
    object dsetDataEXCLUDE: TFloatField
      FieldName = 'EXCLUDE'
      DisplayFormat = ',0.00'
    end
    object dsetDataEXCLUDE_117: TFloatField
      FieldName = 'EXCLUDE_117'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
  object dsetItog: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-1'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      '            ,to_number(null) exclude'
      '            ,to_number(null) exclude_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) peny_zadolg'
      '      ,in_summa_itogo'
      '      ,to_char(null) docnumber'
      '      ,to_date(null) docdate'
      '      ,to_number(null) docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      '      select inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select nvl(sum(inst),0) inst'
      '                  ,nvl(sum(reset),0) reset'
      '                  ,nvl(sum(exclude),0) exclude'
      '                  ,nvl(sum(exclude_117),0) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,nl.doc_number docnumber'
      '                        ,nl.doc_date docdate'
      '                        ,nl.summa docsumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      ' '#9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '           ) a'
      '     )'
      '     )'
      '     )'
      'union all'
      '--// '#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
      'select '#39'1'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) peny_zadolg'
      '      ,in_summa_itogo'
      '      ,to_char(null) docnumber'
      '      ,to_date(null) docdate'
      '      ,to_number(null) docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa_itogo'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      '      select inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select nvl(sum(inst),0) inst'
      '                  ,nvl(sum(reset),0) reset'
      '                  ,nvl(sum(exclude),0) exclude'
      '                  ,nvl(sum(exclude_117),0) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,nl.doc_number docnumber'
      '                        ,nl.doc_date docdate'
      '                        ,nl.summa docsumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      ' '#9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            where peny_zadolg = '#39#1047#39
      '           ) a'
      '     )'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--// '#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080
      'select '#39'2'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) peny_zadolg'
      '      ,in_summa_itogo'
      '      ,to_char(null) docnumber'
      '      ,to_date(null) docdate'
      '      ,to_number(null) docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      
        '      ,(in_summa_itogo + inst - reset - exclude - exclude_117) o' +
        'ut_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa_itogo'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      'select inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      'from ('
      '      select inst'
      '            ,reset'
      '            ,exclude'
      '            ,exclude_117'
      '      from ('
      '            select nvl(sum(inst),0) inst'
      '                  ,nvl(sum(reset),0) reset'
      '                  ,nvl(sum(exclude),0) exclude'
      '                  ,nvl(sum(exclude_117),0) exclude_117'
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
        'e from fdc_customs_lst where id = p_params.customsid) end) else ' +
        '(case sl.id when -1 then '#39' '#39' else sl.name end) end) name'
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case sl.id when -1 then null else (case sl.typesysname when '#39'Per' +
        'son'#39' then '#39#1060#39' else '#39#1070#39' end) end) end) type_person'
      
        '                        ,(case when p_oborotki.is_paytype_peny( ' +
        'dict.code, acct.operation_date)= 1'
      '                               then '#39#1055#39
      '                               else '#39#1047#39
      '                          end) peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,nl.doc_number docnumber'
      '                        ,nl.doc_date docdate'
      '                        ,nl.summa docsumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      
        '                        ,-(case when (acc.code = '#39'03.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude'
      
        '                        ,-(case when (acc.code = '#39'03.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) exclude_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      ' '#9#9#9#9#9'  ,fdc_document_lst dl'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
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
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            where peny_zadolg = '#39#1055#39
      '           ) a'
      '     )'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,exclude'
      '      ,exclude_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-2'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      '            ,to_number(null) exclude'
      '            ,to_number(null) exclude_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000010000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E54494401000000000003000000494E4E0100
      00000000040000004E414D450100000000000B000000545950455F504552534F
      4E0100000000000B00000050454E595F5A41444F4C470100000000000E000000
      494E5F53554D4D415F49544F474F01000000000009000000444F434E554D4245
      5201000000000007000000444F434441544501000000000008000000444F4353
      554D4D4101000000000004000000494E53540100000000000500000052455345
      54010000000000070000004558434C5544450100000000000B0000004558434C
      5544455F3131370100000000000F0000004F55545F53554D4D415F49544F474F
      010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 256
    Top = 136
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
    object dsetItogPENY_ZADOLG: TStringField
      FieldName = 'PENY_ZADOLG'
      Size = 255
    end
    object dsetItogIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 255
    end
    object dsetItogDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsetItogDOCSUMMA: TFloatField
      FieldName = 'DOCSUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogINST: TFloatField
      FieldName = 'INST'
      DisplayFormat = ',0.00'
    end
    object dsetItogRESET: TFloatField
      FieldName = 'RESET'
      DisplayFormat = ',0.00'
    end
    object dsetItogEXCLUDE: TFloatField
      FieldName = 'EXCLUDE'
      DisplayFormat = ',0.00'
    end
    object dsetItogEXCLUDE_117: TFloatField
      FieldName = 'EXCLUDE_117'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 224
    Top = 216
  end
end
