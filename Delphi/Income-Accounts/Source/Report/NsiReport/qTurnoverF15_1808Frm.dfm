inherited qTurnoverF15_1808Form: TqTurnoverF15_1808Form
  Left = 255
  Top = 262
  Width = 854
  Caption = #1089#1095' 08.01.00'
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
          Caption = #1085#1072#1080#1084'./'#1060#1048#1054
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
          Width = 360
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
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 400
        end
        item
          Caption = #1074#1099#1103#1074#1083#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1085#1072' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = #1074#1086#1079#1074#1088#1072#1097#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1085#1077' '#1074#1086#1089#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 3
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
          Position.BandIndex = 9
          Position.ColIndex = 4
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
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIsRevealed: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'ISREVEALED'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOffset_Acc: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'OFFSET_ACC'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNotVostr: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'NOTVOSTR'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOffset_indep: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'OFFSET_INDEP'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '13'
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
      object grdTurnoverSheetDBBandedTableDViewISREVEALED: TcxGridDBColumn
        Caption = #1074#1099#1103#1074#1083#1077#1085#1086
        DataBinding.FieldName = 'ISREVEALED'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOFFSET_ACC: TcxGridDBColumn
        Caption = #1079#1072#1095#1090#1077#1085#1086' '#1085#1072' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        DataBinding.FieldName = 'OFFSET_ACC'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1074#1086#1079#1074#1088#1072#1097#1077#1085#1086
        DataBinding.FieldName = 'RETURN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTVOSTR: TcxGridDBColumn
        Caption = #1085#1077' '#1074#1086#1089#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086
        DataBinding.FieldName = 'NOTVOSTR'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOFFSET_INDEP: TcxGridDBColumn
        Caption = #1079#1072#1095#1090#1077#1085#1086' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'OFFSET_INDEP'
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
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        MinWidth = 160
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        MinWidth = 40
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        MinWidth = 60
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_DATE: TcxGridDBColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        MinWidth = 40
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewISREVEALED: TcxGridDBColumn
        Caption = #1074#1099#1103#1074#1083#1077#1085#1086
        DataBinding.FieldName = 'ISREVEALED'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOFFSET_ACC: TcxGridDBColumn
        Caption = #1079#1072#1095#1090#1077#1085#1086' '#1085#1072' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
        DataBinding.FieldName = 'OFFSET_ACC'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn
        Caption = #1074#1086#1079#1074#1088#1072#1097#1077#1085#1086
        DataBinding.FieldName = 'RETURN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewNOTVOSTR: TcxGridDBColumn
        Caption = #1085#1077' '#1074#1086#1089#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086
        DataBinding.FieldName = 'NOTVOSTR'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOFFSET_INDEP: TcxGridDBColumn
        Caption = #1079#1072#1095#1090#1077#1085#1086' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'OFFSET_INDEP'
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.08.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1080#1079#1083#1080#1096#1085#1077' '#1091#1087#1083#1072 +
      #1095#1077#1085#1085#1099#1084' ('#1074#1079#1099#1089#1082#1072#1085#1085#1099#1084') '#1087#1083#1072#1090#1077#1078#1072#1084'"'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, '
      'item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      
        '      ,(in_summa + isrevealed - offset_acc - return - notvostr -' +
        ' offset_indep) '
      'out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else '
      '(case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' else'
      #39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      '      ,(case when (item_no is null and subject_id is null) then '
      
        'p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate)' +
        ',0,'#39'rur'#39','#39'rur'#39','
      '(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen '
      
        'p_oborotki.get_bsumma_account_subject(:account_id,:account_code,' +
        'trunc(:bdate),'
      
        'subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 e' +
        'nd),:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,sum(isrevealed) isrevealed'
      '      ,sum(offset_acc) offset_acc'
      '      ,sum(return) return'
      '      ,sum(notvostr) notvostr'
      '      ,sum(offset_indep) offset_indep'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,'
      'doc_date,doc_number) item_no'
      '            ,'
      
        '(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(subject_id)||'#39'|'#39 +
        '||to_char(doc_date,'
      #39'dd.mm.yyyy'#39')||'#39'|'#39'||doc_number) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) '
      'parentid'
      '            ,subject_id'
      '            ,to_number(null) in_summa'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,doc_date'
      '            ,isrevealed'
      '            ,offset_acc'
      '            ,return'
      '            ,notvostr'
      '            ,offset_indep'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,sum(isrevealed) isrevealed'
      '                  ,sum(offset_acc) offset_acc'
      '                  ,sum(return) return'
      '                  ,sum(notvostr) notvostr'
      '                  ,sum(offset_indep) offset_indep'
      '            from ('
      '                  select  acct.doc_id'
      '      ,acct.kbk_id'
      
        '      ,(case :summarn when '#39'Y'#39' then (case dl.typesysname when '#39'D' +
        'ocChildsBalance'#39' then acct.subject_id else p_params.customsid en' +
        'd) else acct.subject_id end) subject_id'
      '      ,acct.account_id'
      '      ,acct.operation_date'
      
        '      ,(case :summarn when '#39'Y'#39' then (case dl.typesysname when '#39'D' +
        'ocChildsBalance'#39' then cl.inn else (select inn from fdc_customs_l' +
        'st where id = p_params.customsid) end) else (case slq.id when -1' +
        ' then '#39' '#39' else slq.inn end) end) inn'
      
        '      ,(case :summarn when '#39'Y'#39' then (case dl.typesysname when '#39'D' +
        'ocChildsBalance'#39' then cl.name else (select name from fdc_customs' +
        '_lst where id = p_params.customsid) end) else (case slq.id when ' +
        '-1 then '#39' '#39' else slq.name end) end) name'
      
        '      ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (case slq.id when -' +
        '1 then null else (case slq.typesysname when '#39'Person'#39' then '#39#1060#39' el' +
        'se '#39#1070#39' end) end) end) as type_person'
      
        '      ,(case :summarn when '#39'Y'#39' then null else (case when  (dc.do' +
        'c_date is not null) then dc.name else dl.name end) end) doc_numb' +
        'er'
      
        '      ,(case :summarn when '#39'Y'#39' then null else (case when  (dc.do' +
        'c_date is not null) then dc.doc_date else dl.doc_date end) end) ' +
        'doc_date'
      
        '      ,(case  when (acc.code = '#39'08.01.01'#39' and acct.is_debit = '#39'Y' +
        #39') then sum_rur else 0 end) isrevealed'
      
        '      ,-(case  when (acc.code = '#39'08.01.02'#39' and acct.is_debit   =' +
        ' '#39'N'#39') then sum_rur else 0 end) offset_acc'
      
        '      ,-(case  when (acc.code = '#39'08.01.03'#39' and acct.is_debit   =' +
        ' '#39'N'#39') then sum_rur else 0 end) return'
      
        '      ,-(case  when (acc.code = '#39'08.01.04'#39' and acct.is_debit   =' +
        ' '#39'N'#39') then sum_rur else 0 end) notvostr'
      
        '      ,-(case  when (acc.code = '#39'08.01.05'#39' and acct.is_debit  = ' +
        #39'N'#39') then sum_rur else 0 end) offset_indep'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl                     '
      '                     ,fdc_subject_lst slq'
      '                     ,fdc_customs_lst  cl'
      '                     ,fdc_document_lst dc'
      
        '                    where (operation_date between trunc(:bdate) ' +
        'and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      '                    and acct.doc_id = dl.id                     '
      
        '                    and ( ( acct.is_current = 1 and nvl(dl.types' +
        'ysname, '#39' '#39') not in ('#39'DecisionPaymentPeriodic'#39','#39'DecPaybackPeriod' +
        'ic'#39','#39'CancelDecisionPayback'#39','
      
        '                                                                ' +
        '                     '#39'DecPaybackLevy'#39', '#39'DecPaybackPay'#39', '#39'Decisio' +
        'nPayment'#39') ) '
      '                            or  :summarn = '#39'Y'#39' )'
      '                   and acct.subject_id = slq.id(+)'
      '                   and acct.subject_id = cl.id(+)'
      
        '                   and p_oborotki.get_doc_charge_id(acct.doc_id)' +
        ' = dc.id(+)'
      '                   union all                   '
      ' select '
      '        acct1.doc_id'
      '       ,acct1.kbk_id'
      '       ,acct1.subject_id  '
      '       ,acct1.account_id'
      '       ,acct1.operation_date'
      '       ,(case sl1.id when -1 then '#39' '#39' else sl1.inn end) inn'
      '       ,(case sl1.id when -1 then '#39' '#39' else sl1.name end) name'
      
        '       ,(case sl1.id when -1 then null else (case sl1.typesysnam' +
        'e when '#39'Person'#39' then '#39#1060#39' else '#39#1070#39' end) end) as  type_person'
      
        '       ,(case when (dc1.doc_date is not null) then dc1.name else' +
        ' null end) doc_number'
      '        , dc1.doc_date'
      '        ,0 isrevealed'
      
        '        ,(case  when (acct1.code = '#39'08.01.02'#39') then rp.summa  el' +
        'se 0 end) offset_acc'
      
        '        ,(case  when (acct1.code = '#39'08.01.03'#39') then rp.summa  el' +
        'se 0 end) return'
      '        ,0 notvostr'
      '        ,0 offset_indep'
      '                  from ('
      '                        select distinct'
      '                               act1.doc_id'
      '                              ,dl1.typesysname '
      '                              ,act1.account_id'
      '                              ,acc1.code'
      '                              ,act1.operation_date'
      '                              ,act1.subject_id'
      '                              ,act1.kbk_id'
      '                        from ('
      '                              select id, typesysname '
      '                              from fdc_document_lst'
      
        '                              where (typesysname in ('#39'DecisionPa' +
        'ymentPeriodic'#39','#39'DecPaybackPeriodic'#39','#39'CancelDecisionPayback'#39','
      
        '                                                     '#39'DecPayback' +
        'Levy'#39', '#39'DecPaybackPay'#39', '#39'DecisionPayment'#39')'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and'
      '                                trunc(:edate)) )'
      '                             ) dl1'
      '                            ,fdc_acc_transaction act1'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc1'
      '                        where dl1.id = act1.doc_id'
      
        '                        and (act1.operation_date between trunc(:' +
        'bdate) and'
      '                             trunc(:edate))'
      
        '                        and (case :ists when '#39'N'#39' then '#39'Y'#39' else a' +
        'ct1.is_ts end) = '#39'Y'#39
      '                        and act1.account_id = acc1.id'
      '                       ) acct1'
      '                       join fdc_value_lst v'
      '                       on ( v.owner_object_id = acct1.doc_id )'
      '                       join fdc_reserved_payment_lst rp'
      '                       on ( rp.id = v.ref_object_id and '
      '                            ('
      
        '                            ( rp.kbkcode_id = acct1.kbk_id and a' +
        'cct1.typesysname not in ( '#39'DecisionPaymentPeriodic'#39', '#39'DecisionPa' +
        'yment'#39' ) ) or'
      
        '                            ( acct1.kbk_id = ( select po.kbkcode' +
        '_id from fdc_payment_order po where po.id = rp.payment_id) and a' +
        'cct1.typesysname in (  '#39'DecisionPaymentPeriodic'#39', '#39'DecisionPayme' +
        'nt'#39' ) )'
      '                            ) )'
      '                       left outer join fdc_subject_lst sl1'
      '                       on ( sl1.id = acct1.subject_id )'
      '                       left outer join fdc_document_lst dc1'
      '                       on ( rp.doc_id = dc1.id)'
      '                       where (:summarn != '#39'Y'#39')'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '                    ,doc_date'
      '           ) a'
      '      where isrevealed != 0 '
      '         or offset_acc != 0 '
      '         or return != 0 '
      '         or notvostr != 0 '
      '         or offset_indep != 0 '
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
      '        ,doc_number'
      '        ,doc_date'
      '        ,isrevealed'
      '        ,offset_acc'
      '        ,return'
      '        ,notvostr'
      '        ,offset_indep),(subject_id,inn,name,type_person),())'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
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
      040000000F000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E0100000000000A000000495352455645414C4544
      0100000000000A0000004F46465345545F414343010000000000060000005245
      5455524E010000000000080000004E4F54564F5354520100000000000C000000
      4F46465345545F494E444550010000000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Top = 88
    object dsetDataID: TStringField
      FieldName = 'ID'
      Size = 200
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
      Size = 1500
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataISREVEALED: TFloatField
      FieldName = 'ISREVEALED'
      DisplayFormat = ',0.00'
    end
    object dsetDataOFFSET_ACC: TFloatField
      FieldName = 'OFFSET_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTVOSTR: TFloatField
      FieldName = 'NOTVOSTR'
      DisplayFormat = ',0.00'
    end
    object dsetDataOFFSET_INDEP: TFloatField
      FieldName = 'OFFSET_INDEP'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
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
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      
        '      ,(in_summa + isrevealed - offset_acc - return - notvostr -' +
        ' offset_indep) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      'from ('
      '      select isrevealed'
      '            ,offset_acc'
      '            ,return'
      '            ,notvostr'
      '            ,offset_indep'
      '      from ('
      '            select nvl(sum(isrevealed),0) isrevealed'
      '                  ,nvl(sum(offset_acc),0) offset_acc'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(notvostr),0) notvostr'
      '                  ,nvl(sum(offset_indep),0) offset_indep'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acc.code = '#39'08.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) isrevealed'
      
        '                        ,-(case  when (acc.code = '#39'08.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_acc'
      
        '                        ,-(case  when (acc.code = '#39'08.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'08.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) notvostr'
      
        '                        ,-(case  when (acc.code = '#39'08.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_indep'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
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
      040000000F000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E0100000000000A000000495352455645414C4544
      0100000000000A0000004F46465345545F414343010000000000060000005245
      5455524E010000000000080000004E4F54564F5354520100000000000C000000
      4F46465345545F494E444550010000000000}
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
    object dsetItogISREVEALED: TFloatField
      FieldName = 'ISREVEALED'
      DisplayFormat = ',0.00'
    end
    object dsetItogOFFSET_ACC: TFloatField
      FieldName = 'OFFSET_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTVOSTR: TFloatField
      FieldName = 'NOTVOSTR'
      DisplayFormat = ',0.00'
    end
    object dsetItogOFFSET_INDEP: TFloatField
      FieldName = 'OFFSET_INDEP'
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
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      
        '      ,(in_summa + isrevealed - offset_acc - return - notvostr -' +
        ' offset_indep) out_summa'
      'from ('
      'select id'
      
        '      ,(case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091 +
        #39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) item_no'
      '      ,subject_id'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,isrevealed'
      '            ,offset_acc'
      '            ,return'
      '            ,notvostr'
      '            ,offset_indep'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(isrevealed) isrevealed'
      '                  ,sum(offset_acc) offset_acc'
      '                  ,sum(return) return'
      '                  ,sum(notvostr) notvostr'
      '                  ,sum(offset_indep) offset_indep'
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
      
        '                        ,(case  when (acc.code = '#39'08.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) isrevealed'
      
        '                        ,-(case  when (acc.code = '#39'08.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_acc'
      
        '                        ,-(case  when (acc.code = '#39'08.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'08.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) notvostr'
      
        '                        ,-(case  when (acc.code = '#39'08.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_indep'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_subject_lst sl'
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where isrevealed != 0 '
      '         or offset_acc != 0 '
      '         or return != 0 '
      '         or notvostr != 0 '
      '         or offset_indep != 0 '
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
      040000000F000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E0100000000000A000000495352455645414C4544
      0100000000000A0000004F46465345545F414343010000000000060000005245
      5455524E010000000000080000004E4F54564F5354520100000000000C000000
      4F46465345545F494E444550010000000000}
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
    object dsetItogSubjectDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogSubjectDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogSubjectISREVEALED: TFloatField
      FieldName = 'ISREVEALED'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectOFFSET_ACC: TFloatField
      FieldName = 'OFFSET_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectNOTVOSTR: TFloatField
      FieldName = 'NOTVOSTR'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectOFFSET_INDEP: TFloatField
      FieldName = 'OFFSET_INDEP'
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
