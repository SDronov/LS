inherited qTurnoverF16_1808Form: TqTurnoverF16_1808Form
  Left = 205
  Top = 253
  Width = 854
  Height = 341
  Caption = #1089#1095' 09.01.00 '#1080' '#1089#1095' 09.02.00'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 846
    Height = 288
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
          Width = 116
        end
        item
          Caption = #1085#1072#1080#1084'./'#1060#1048#1054
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 192
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 52
        end
        item
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
          Width = 360
        end
        item
          Caption = #1090#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 194
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 78
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 655
        end
        item
          Caption = #1055#1088#1080#1085#1103#1090#1086' '#1088#1077#1096#1077#1085#1080#1081
          Position.BandIndex = 10
          Position.ColIndex = 0
          Width = 461
        end
        item
          Caption = #1086' '#1074#1086#1079#1074#1088#1072#1090#1077
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 135
        end
        item
          Caption = #1086' '#1079#1072#1095#1077#1090#1077' '#1074' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 173
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088'/'#1089#1087#1080#1089#1072#1085#1086' '
          Position.BandIndex = 10
          Position.ColIndex = 1
          Width = 194
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
      object grdTurnoverSheetDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_TYPE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
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
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'REUSE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRReturn: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'RRETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 15
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
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1055#1088#1080#1085#1103#1090#1086' '#1088#1077#1096#1077#1085#1080#1081' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RETURN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewREUSE: TcxGridDBColumn
        Caption = #1079#1072#1095#1077#1090' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080
        DataBinding.FieldName = 'REUSE'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRRETURN: TcxGridDBColumn
        Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RRETURN'
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
        MinWidth = 80
        Width = 110
      end
      object grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        MinWidth = 160
        Width = 200
      end
      object grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        MinWidth = 40
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_TYPE: TcxGridDBColumn
        Caption = #1056#1077#1096#1077#1085#1080#1077' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1090#1080#1087
        DataBinding.FieldName = 'DOC_TYPE'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        MinWidth = 60
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBColumn
        Caption = #1056#1077#1096#1077#1085#1080#1077' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn
        Caption = #1055#1088#1080#1085#1103#1090#1086' '#1088#1077#1096#1077#1085#1080#1081' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RETURN'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewREUSE: TcxGridDBColumn
        Caption = #1079#1072#1095#1077#1090' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080
        DataBinding.FieldName = 'REUSE'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewRRETURN: TcxGridDBColumn
        Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RRETURN'
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1072#1084' '#1058'.09.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084'",' +
      ' '#1058'.09.02.00 "'#1047#1072#1095#1077#1090#1099' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1' +
        ' else 0 end),:ists)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) rreturn'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists)'
      '       ) out_summa'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,return'
      '      ,reuse'
      '      ,rreturn'
      '      ,(in_summa + return + reuse - rreturn) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else (case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091 +
        ' '#1086#1088#1075#1072#1085#1091#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        '(p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate' +
        '),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists' +
        ') + p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse_co' +
        'de,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 el' +
        'se 0 end),:ists))'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen (p_oborotki.get_bsumma_account_subject(:account_id,:account_' +
        'code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when ' +
        #39'Y'#39' then 1 else 0 end),:ists) + p_oborotki.get_bsumma_account_su' +
        'bject(:account_reuse_id,:account_reuse_code,trunc(:bdate),subjec' +
        't_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:i' +
        'sts))'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(return) return'
      '      ,sum(reuse) reuse'
      '      ,sum(rreturn) rreturn'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_type,doc_date,doc_number,doc_id) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||to_char(doc_date,'#39'dd.mm.yyyy'#39')||'#39'|'#39'||doc_number||' +
        #39'|'#39'||to_char(doc_id)) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,return'
      '            ,reuse'
      '            ,rreturn'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(return) return'
      '                  ,sum(reuse) reuse'
      '                  ,sum(rreturn) rreturn'
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
      '                        ,('
      '                          case '
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Advance'#39','#39'DecPayback356'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Deposit'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Levy'#39','#39'DecPaybackPay'#39','#39'DecPaybackPeriodic'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080#1096 +
        #1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'TimeOut'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#39
      
        '                            when (rd.typesysname in ('#39'DecisionPa' +
        'ybackOutback'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1077#1088#1085#1091#1074#1096#1080#1093#1089#1103' '#1085#1072' '#1089#1095 +
        #1077#1090#39
      '                            else null'
      '                          end'
      '                         ) doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      
        '                        ,(case  when (acc.code in ('#39'09.01.01'#39','#39'0' +
        '9.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'Y'#39') then su' +
        'm_rur else 0 end) return'
      '                        ,0 reuse'
      
        '                        ,-(case  when (acc.code in ('#39'09.01.01'#39','#39 +
        '09.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'N'#39') then s' +
        'um_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
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
      
        '--                    and dl.typesysname in ('#39'DecPaybackAdvance'#39 +
        ','#39'DecPayback356'#39','#39'DecPaybackDeposit'#39','#39'DecPaybackLevy'#39','#39'DecPaybac' +
        'kPay'#39','#39'DecPaybackPeriodic'#39','#39'DecPaybackTimeOut'#39','#39'DecisionPaybackO' +
        'utback'#39','#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39','#39'DocChil' +
        'dsBalance'#39')'
      
        '                    and p_oborotki.get_decision_on_return_id(dl.' +
        'id) = rd.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      
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
      '                        ,'#39#1047#1072#1095#1077#1090' '#1084#1077#1078#1076#1091' '#1058#1054#39' doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      '                        ,0 return'
      
        '                        ,(case  when (acc.code = '#39'09.02.00'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse'
      
        '                        ,-(case  when (acc.code = '#39'09.02.00'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      
        '                        select :account_reuse_id id, :account_re' +
        'use_code code'
      '                        from dual'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
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
      
        '--                    and dl.typesysname in ('#39'DocReuse'#39','#39'DocReus' +
        'eY'#39','#39'DocChildsBalance'#39')'
      
        '                    and p_oborotki.get_reuse_id(dl.id) = rd.id(+' +
        ')'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where return != 0 '
      '         or rreturn != 0 '
      '         or reuse != 0 '
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
      '        ,doc_type'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,return'
      '        ,rreturn'
      '        ,reuse),(subject_id,inn,name,type_person),())'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1' +
        ' else 0 end),:ists)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) rreturn'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists)'
      '       ) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000080000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000110000003A4143
      434F554E545F52455553455F4944030000000000000000000000130000003A41
      43434F554E545F52455553455F434F4445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E01000000000008000000444F435F5459504501000000
      000008000000444F435F44415445010000000000070000005252455455524E01
      00000000000900000052455553455F4F5554010000000000}
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
    object dsetDataDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 255
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataRRETURN: TFloatField
      FieldName = 'RRETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_OUT: TFloatField
      FieldName = 'REUSE'
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
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1' +
        ' else 0 end),:ists)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) rreturn'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists)'
      '       ) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,return'
      '      ,reuse'
      '      ,rreturn'
      '      ,(in_summa + return + reuse - rreturn) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,nvl(p_oper_balans.get_bsumma(:account_id,:account_code,tr' +
        'unc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 ' +
        'end),:ists),0) + nvl(p_oper_balans.get_bsumma(:account_reuse_id,' +
        ':account_reuse_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn w' +
        'hen '#39'Y'#39' then 1 else 0 end),:ists),0) in_summa'
      '      ,return'
      '      ,reuse'
      '      ,rreturn'
      'from ('
      '      select return'
      '            ,reuse'
      '            ,rreturn'
      '      from ('
      '            select nvl(sum(return),0) return'
      '                  ,nvl(sum(reuse),0) reuse'
      '                  ,nvl(sum(rreturn),0) rreturn'
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
      '                        ,('
      '                          case '
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Advance'#39','#39'DecPayback356'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Deposit'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Levy'#39','#39'DecPaybackPay'#39','#39'DecPaybackPeriodic'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080#1096 +
        #1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'TimeOut'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#39
      
        '                            when (rd.typesysname in ('#39'DecisionPa' +
        'ybackOutback'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1077#1088#1085#1091#1074#1096#1080#1093#1089#1103' '#1085#1072' '#1089#1095 +
        #1077#1090#39
      '                            else null'
      '                          end'
      '                         ) doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      
        '                        ,(case  when (acc.code in ('#39'09.01.01'#39','#39'0' +
        '9.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'Y'#39') then su' +
        'm_rur else 0 end) return'
      '                        ,0 reuse'
      
        '                        ,-(case  when (acc.code in ('#39'09.01.01'#39','#39 +
        '09.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'N'#39') then s' +
        'um_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
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
      
        '--                    and dl.typesysname in ('#39'DecPaybackAdvance'#39 +
        ','#39'DecPayback356'#39','#39'DecPaybackDeposit'#39','#39'DecPaybackLevy'#39','#39'DecPaybac' +
        'kPay'#39','#39'DecPaybackPeriodic'#39','#39'DecPaybackTimeOut'#39','#39'DecisionPaybackO' +
        'utback'#39','#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39','#39'DocChil' +
        'dsBalance'#39')'
      
        '                    and p_oborotki.get_decision_on_return_id(dl.' +
        'id) = rd.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      
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
      '                        ,'#39#1047#1072#1095#1077#1090' '#1084#1077#1078#1076#1091' '#1058#1054#39' doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      '                        ,0 return'
      
        '                        ,(case  when (acc.code = '#39'09.02.00'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse'
      
        '                        ,-(case  when (acc.code = '#39'09.02.00'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      
        '                        select :account_reuse_id id, :account_re' +
        'use_code code'
      '                        from dual'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
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
      
        '                    and p_oborotki.get_reuse_id(dl.id) = rd.id(+' +
        ')'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1' +
        ' else 0 end),:ists)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) rreturn'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists)'
      '       ) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000080000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000110000003A4143
      434F554E545F52455553455F4944030000000000000000000000130000003A41
      43434F554E545F52455553455F434F4445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E01000000000008000000444F435F5459504501000000
      000008000000444F435F44415445010000000000070000005252455455524E01
      00000000000900000052455553455F4F5554010000000000}
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
    object dsetItogDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 255
    end
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogRRETURN: TFloatField
      FieldName = 'RRETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogREUSE_OUT: TFloatField
      FieldName = 'REUSE'
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
      '      ,'#39'0'#39' parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,return'
      '      ,reuse'
      '      ,rreturn'
      '      ,(in_summa + return + reuse - rreturn) out_summa'
      'from ('
      'select id'
      
        '      ,(case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091 +
        #39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) item_no'
      '      ,subject_id'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) + p_oborotki.get_bsumma_account_' +
        'subject(:account_reuse_id,:account_reuse_code,trunc(:bdate),subj' +
        'ect_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),' +
        ':ists) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,return'
      '      ,reuse'
      '      ,rreturn'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,return'
      '            ,reuse'
      '            ,rreturn'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(return) return'
      '                  ,sum(reuse) reuse'
      '                  ,sum(rreturn) rreturn'
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
      '                        ,('
      '                          case '
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Advance'#39','#39'DecPayback356'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Deposit'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Levy'#39','#39'DecPaybackPay'#39','#39'DecPaybackPeriodic'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080#1096 +
        #1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'TimeOut'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#39
      
        '                            when (rd.typesysname in ('#39'DecisionPa' +
        'ybackOutback'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1077#1088#1085#1091#1074#1096#1080#1093#1089#1103' '#1085#1072' '#1089#1095 +
        #1077#1090#39
      '                            else null'
      '                          end'
      '                         ) doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      
        '                        ,(case  when (acc.code in ('#39'09.01.01'#39','#39'0' +
        '9.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'Y'#39') then su' +
        'm_rur else 0 end) return'
      '                        ,0 reuse'
      
        '                        ,-(case  when (acc.code in ('#39'09.01.01'#39','#39 +
        '09.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'N'#39') then s' +
        'um_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
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
      
        '--                    and dl.typesysname in ('#39'DecPaybackAdvance'#39 +
        ','#39'DecPayback356'#39','#39'DecPaybackDeposit'#39','#39'DecPaybackLevy'#39','#39'DecPaybac' +
        'kPay'#39','#39'DecPaybackPeriodic'#39','#39'DecPaybackTimeOut'#39','#39'DecisionPaybackO' +
        'utback'#39','#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39','#39'DocChil' +
        'dsBalance'#39')'
      
        '                    and p_oborotki.get_decision_on_return_id(dl.' +
        'id) = rd.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      
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
      '                        ,'#39#1047#1072#1095#1077#1090' '#1084#1077#1078#1076#1091' '#1058#1054#39' doc_type'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.id end) doc_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_number end) doc_number'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then null else rd.doc_date end) doc_date'
      '                        ,0 return'
      
        '                        ,(case  when (acc.code = '#39'09.02.00'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse'
      
        '                        ,-(case  when (acc.code = '#39'09.02.00'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) rreturn'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      
        '                        select :account_reuse_id id, :account_re' +
        'use_code code'
      '                        from dual'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst  sl'
      '                      ,fdc_customs_lst  cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      
        '                         nvl(dl.typesysname, '#39' '#39') not in ('#39'DocCh' +
        'ildsBalance'#39')'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '--                    and dl.typesysname in ('#39'DocReuse'#39','#39'DocReus' +
        'eY'#39','#39'DocChildsBalance'#39')'
      
        '                    and p_oborotki.get_reuse_id(dl.id) = rd.id(+' +
        ')'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where return != 0 '
      '         or rreturn != 0 '
      '         or reuse != 0 '
      '      order by 1'
      '     )'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000080000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000110000003A4143
      434F554E545F52455553455F4944050000000000000000000000130000003A41
      43434F554E545F52455553455F434F4445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E01000000000008000000444F435F5459504501000000
      000008000000444F435F44415445010000000000070000005252455455524E01
      00000000000900000052455553455F4F5554010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 296
    Top = 112
    object dsetItogSubjectID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsetItogSubjectPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetItogSubjectITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetItogSubjectIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectINN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object dsetItogSubjectNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetItogSubjectTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetItogSubjectDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 255
    end
    object dsetItogSubjectDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogSubjectDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogSubjectRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectRRETURN: TFloatField
      FieldName = 'RRETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectREUSE_OUT: TFloatField
      FieldName = 'REUSE'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectOUT_SUMMA: TFloatField
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
