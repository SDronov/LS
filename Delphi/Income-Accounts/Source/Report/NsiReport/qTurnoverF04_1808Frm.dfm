inherited qTurnoverF04_1808Form: TqTurnoverF04_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 01.03.01'
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
          Width = 120
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
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 460
        end
        item
          Caption = #1076#1077#1088#1078#1072#1090#1077#1083#1100' '#1052#1050
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 135
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 119
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 110
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 5
          Position.ColIndex = 3
          Width = 96
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 200
        end
        item
          Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
          Position.BandIndex = 11
          Position.ColIndex = 0
        end
        item
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
          Position.BandIndex = 11
          Position.ColIndex = 1
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
        Width = 120
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
      object grdTurnoverSheetDBBandedTableViewHOLDER_MK: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'HOLDER_MK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
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
      object grdTurnoverSheetDBBandedTableViewTransaction: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'Transaction'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
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
    end
    object grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView [1]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsItogHolder
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
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableDViewHOLDER_MK: TcxGridDBColumn
        Caption = #1076#1077#1088#1078#1072#1090#1077#1083#1100' '#1052#1050
        DataBinding.FieldName = 'HOLDER_MK'
        MinWidth = 40
        Width = 80
      end
      object grdTurnoverSheetDBBandedTableDViewINN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        Width = 100
      end
      object grdTurnoverSheetDBBandedTableDViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Hidden = True
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewTRANSACTION: TcxGridDBColumn
        Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
        DataBinding.FieldName = 'TRANSACTION'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewPOSTUPILO: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
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
      DataController.DataSource = dsItogSubject
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
        MinWidth = 40
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD2ViewHOLDER_MK: TcxGridDBColumn
        Caption = #1076#1077#1088#1078#1072#1090#1077#1083#1100' '#1052#1050
        DataBinding.FieldName = 'HOLDER_MK'
        Visible = False
        MinWidth = 40
        Width = 80
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
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewTRANSACTION: TcxGridDBColumn
        Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
        DataBinding.FieldName = 'TRANSACTION'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewPOSTUPILO: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        MinWidth = 80
        Width = 120
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
      object grdTurnoverSheetDBBandedTableD3ViewITEM_NO: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Visible = False
        MinWidth = 60
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableD3ViewINN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD3ViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD3ViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Visible = False
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD3ViewHOLDER_MK: TcxGridDBColumn
        Caption = #1076#1077#1088#1078#1072#1090#1077#1083#1100' '#1052#1050
        DataBinding.FieldName = 'HOLDER_MK'
        Visible = False
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableD3ViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
      end
      object grdTurnoverSheetDBBandedTableD3ViewDOC_DATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
      end
      object grdTurnoverSheetDBBandedTableD3ViewKBK: TcxGridDBColumn
        Caption = #1050#1041#1050' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DataBinding.FieldName = 'KBK'
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD3ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD3ViewTRANSACTION: TcxGridDBColumn
        Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
        DataBinding.FieldName = 'TRANSACTION'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD3ViewPOSTUPILO: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD3ViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
        Width = 120
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
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'  '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.01.03.01 " '#1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080'. '#1052#1050'"'
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
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
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
      '      ,holder_mk'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,nvl(to_char(item_no),(case when (subject_id is null and h' +
        'older_mk is null) then '#39#1048#1090#1086#1075#1086#39' when (subject_id is null and hold' +
        'er_mk is not null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1076#1077#1088#1078#1072#1090#1077#1083#1102' '#1052#1050#39' else (case :summ' +
        'arn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091 +
        #1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null and ho' +
        'lder_mk is null) then p_oper_balans.get_bsumma(:account_id,:acco' +
        'unt_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' the' +
        'n 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen p_oborotki.get_bsumma_account_subject(:account_id,:account_c' +
        'ode,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39 +
        'Y'#39' then 1 else 0 end),:ists)'
      
        '             when (item_no is null and subject_id is null and ho' +
        'lder_mk is not null) then p_oborotki.get_bsumma_mk(:account_id,t' +
        'runc(:bdate),holder_mk,(case :summarn when '#39'Y'#39' then 1 else 0 end' +
        '),:ists)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,holder_mk'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,kbk'
      '      ,sum(transaction) transaction'
      '      ,sum(postupilo) postupilo'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,hol' +
        'der_mk,doc_date,doc_number,doc_id,kbk) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||holder_mk||'#39'|'#39'||to_char(doc_date,'#39'dd.mm.yyyy'#39')||'#39 +
        '|'#39'||doc_number||'#39'|'#39'||doc_id||'#39'|'#39'||kbk) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||holder_mk) parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,holder_mk'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,kbk'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,holder_mk'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,sum(transaction) transaction'
      '                  ,sum(postupilo) postupilo'
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
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' else (case when (po.paysysname is nul' +
        'l) then '#39#1058#1050#39' else '#39#1058#1055#1057#39' end) end) holder_mk'
      '                        ,po.id doc_id'
      
        '                        ,nvl(po.doc_number,(case when (po.doc_da' +
        'te is null) then null else '#39#1073'/'#1085#39' end)) doc_number'
      '                        ,po.doc_date'
      '                        ,po.kbk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_po_cheque_lst_all po'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and :summarn = '#39'N'#39
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                        ) '
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,holder_mk'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,kbk'
      '           ) a'
      '      where transaction != 0 '
      '         or postupilo != 0 '
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,in_summa'
      '        ,subject_id'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,holder_mk'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,kbk'
      '        ,transaction'
      
        '        ,postupilo),(holder_mk),(subject_id,inn,name,type_person' +
        '),())'
      '     )'
      'union all'
      '--// '#1089#1091#1084#1084#1072#1088#1085#1072#1103' '#1086#1073#1086#1088#1086#1090#1082#1072
      'select id'
      '      ,parentid'
      
        '      ,decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        #39#1048#1090#1086#1075#1086#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' end) item_no'
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
      '      ,sum(transaction) transaction'
      '      ,sum(postupilo) postupilo'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person) it' +
        'em_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,'#39'0'#39' parentid'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(transaction) transaction'
      '                  ,sum(postupilo) postupilo'
      '            from ('
      '                  select acct.kbk_id'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
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
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and :summarn = '#39'Y'#39
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where transaction != 0 '
      '         or postupilo != 0 '
      '     )'
      
        'group by grouping sets((id,parentid,item_no,in_summa,subject_id,' +
        'inn,name,type_person),())'
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
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
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
      040000000E000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000030000004B424B01000000000009
      000000504F53545550494C4F01000000000009000000484F4C4445525F4D4B01
      00000000000B0000005452414E53414354494F4E010000000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Top = 88
    object dsetDataID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetDataPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
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
    object dsetDataHOLDER_MK: TStringField
      FieldName = 'HOLDER_MK'
      Size = 255
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetDataTRANSACTION: TFloatField
      FieldName = 'TRANSACTION'
      DisplayFormat = ',0.00'
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
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
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
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
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,transaction'
      '      ,postupilo'
      'from ('
      '      select transaction'
      '            ,postupilo'
      '      from ('
      '            select nvl(sum(transaction),0) transaction'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = :account_id'
      
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
      '      )'
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
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
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
      040000000E000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000030000004B424B01000000000009
      000000504F53545550494C4F01000000000009000000484F4C4445525F4D4B01
      00000000000B0000005452414E53414354494F4E010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 224
    Top = 112
    object dsetItogID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetItogPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
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
      Size = 255
    end
    object dsetItogTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetItogHOLDER_MK: TStringField
      FieldName = 'HOLDER_MK'
      Size = 255
    end
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogTRANSACTION: TFloatField
      FieldName = 'TRANSACTION'
      DisplayFormat = ',0.00'
    end
    object dsetItogPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
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
      '      ,holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,(case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091 +
        #39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) item_no'
      '      ,subject_id'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,holder_mk'
      '      ,transaction'
      '      ,postupilo'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||holder_mk) id'
      '            ,holder_mk parentid'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,holder_mk'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,holder_mk'
      '                  ,sum(transaction) transaction'
      '                  ,sum(postupilo) postupilo'
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
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' else (case when (po.paysysname is nul' +
        'l) then '#39#1058#1050#39' else '#39#1058#1055#1057#39' end) end) holder_mk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_po_cheque_lst_all po'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,holder_mk'
      '           ) a'
      '      where transaction != 0 '
      '         or postupilo != 0 '
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
      040000000E000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000030000004B424B01000000000009
      000000504F53545550494C4F01000000000009000000484F4C4445525F4D4B01
      00000000000B0000005452414E53414354494F4E010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 296
    Top = 112
    object dsetItogSubjectID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetItogSubjectPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
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
    object dsetItogSubjectHOLDER_MK: TStringField
      FieldName = 'HOLDER_MK'
      Size = 255
    end
    object dsetItogSubjectDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogSubjectDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogSubjectKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogSubjectTRANSACTION: TFloatField
      FieldName = 'TRANSACTION'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
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
  object dsetItogHolder: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,'#39'0'#39' parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select id'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1076#1077#1088#1078#1072#1090#1077#1083#1102' '#1052#1050#39' item_no'
      
        '      ,p_oborotki.get_bsumma_mk(:account_id,trunc(:bdate),holder' +
        '_mk,(case :summarn when '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,:edate edate'
      '      ,:account_code account_code'
      '      ,holder_mk'
      '      ,transaction'
      '      ,postupilo'
      'from ('
      '      select holder_mk id'
      '            ,holder_mk'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select holder_mk'
      '                  ,nvl(sum(transaction),0) transaction'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' else (case when (po.paysysname is nul' +
        'l) then '#39#1058#1050#39' else '#39#1058#1055#1057#39' end) end) holder_mk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_po_cheque_lst_all po'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and :summarn = '#39'N'#39
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                        ) '
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                  )'
      '            group by holder_mk'
      '           ) a'
      '     )'
      '     )'
      'union all'
      '--// '#1076#1083#1103' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1086#1073#1086#1088#1086#1090#1082#1080
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1086#1088#1075#1072#1085#1091#39' item_no'
      '      ,subject_id'
      
        '      ,p_oborotki.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn whe' +
        'n '#39'Y'#39' then 1 else 0 end),:ists) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,transaction'
      '      ,postupilo'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,'#39'0'#39' parentid'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,nvl(sum(transaction),0) transaction'
      '                  ,nvl(sum(postupilo),0) postupilo'
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
      
        '                        ,(case dl.typesysname when '#39'DocChildsBal' +
        'ance'#39' then '#39#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#1086#39' else (case when (po.paysysname is nul' +
        'l) then '#39#1058#1050#39' else '#39#1058#1055#1057#39' end) end) holder_mk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_po_cheque_lst_all po'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and ('
      '                         :summarn = '#39'Y'#39
      '                        ) '
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      #9#9#9#9'    and acct.doc_id = dl.id'
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
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
      040000000E000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000090000004F55545F53554D4D410100
      0000000002000000494401000000000008000000504152454E54494401000000
      000003000000494E4E010000000000040000004E414D450100000000000B0000
      00545950455F504552534F4E010000000000030000004B424B01000000000009
      000000504F53545550494C4F01000000000009000000484F4C4445525F4D4B01
      00000000000B0000005452414E53414354494F4E010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 392
    Top = 104
    object dsetItogHolderID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetItogHolderPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
    end
    object dsetItogHolderITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetItogHolderIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogHolderINN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object dsetItogHolderNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetItogHolderTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetItogHolderHOLDER_MK: TStringField
      FieldName = 'HOLDER_MK'
      Size = 255
    end
    object dsetItogHolderDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogHolderDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogHolderKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogHolderTRANSACTION: TFloatField
      FieldName = 'TRANSACTION'
      DisplayFormat = ',0.00'
    end
    object dsetItogHolderPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItogHolderOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItogHolder: TDataSource
    DataSet = dsetItogHolder
    Left = 384
    Top = 224
  end
end
