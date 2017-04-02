inherited qTurnoverF14_1808Form: TqTurnoverF14_1808Form
  Left = 484
  Top = 211
  Width = 854
  Caption = #1089#1095' 07.00.00'
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
          Caption = #8470' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1088#1072#1089#1087#1080#1089#1082#1080
          Width = 100
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
        end
        item
          Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1086
          Position.BandIndex = 7
          Position.ColIndex = 0
          Width = 80
        end
        item
          Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1089#1095#1077#1090
          Position.BandIndex = 7
          Position.ColIndex = 1
          Width = 240
        end
        item
          Caption = #1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = #1091#1087#1083#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
          Position.BandIndex = 7
          Position.ColIndex = 2
          Width = 80
        end
        item
          Caption = #1057#1085#1103#1090#1086' '#1089' '#1091#1095#1077#1090#1072' '#1085#1077#1074#1086#1089#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
          Position.BandIndex = 7
          Position.ColIndex = 3
          Width = 80
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
      object grdTurnoverSheetDBBandedTableViewIsMadeOut: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'ISMADEOUT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'ZADOLG'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewForNextPay: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'FORNEXTPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewForPay: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'FORPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRemovedFromAcc: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'REMOVEDFROMACC'
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
      object grdTurnoverSheetDBBandedTableDViewISMADEOUT: TcxGridDBColumn
        Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1086
        DataBinding.FieldName = 'ISMADEOUT'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewZADOLG: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1089#1095#1077#1090' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'ZADOLG'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewFORNEXTPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1089#1095#1105#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
        DataBinding.FieldName = 'FORNEXTPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewFORPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086'  '#1074' '#1089#1095#1105#1090' '#1091#1087#1083#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
        DataBinding.FieldName = 'FORPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
        DataBinding.FieldName = 'RETURN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewREMOVEDFROMACC: TcxGridDBColumn
        Caption = #1057#1085#1103#1090#1086' '#1089' '#1091#1095#1077#1090#1072' '#1085#1077#1074#1086#1089#1090#1088#1077#1073'. '#1079#1072#1083#1086#1075#1072
        DataBinding.FieldName = 'REMOVEDFROMACC'
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
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewISMADEOUT: TcxGridDBColumn
        Caption = #1054#1092#1086#1088#1084#1083#1077#1085#1086
        DataBinding.FieldName = 'ISMADEOUT'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewZADOLG: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1089#1095#1077#1090' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'ZADOLG'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewFORNEXTPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086'  '#1074' '#1089#1095#1105#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
        DataBinding.FieldName = 'FORNEXTPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewFORPAY: TcxGridDBColumn
        Caption = #1047#1072#1095#1090#1077#1085#1086'  '#1074' '#1089#1095#1105#1090' '#1091#1087#1083#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
        DataBinding.FieldName = 'FORPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewRETURN: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
        DataBinding.FieldName = 'RETURN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableD2ViewREMOVEDFROMACC: TcxGridDBColumn
        Caption = #1057#1085#1103#1090#1086' '#1089' '#1091#1095#1077#1090#1072' '#1085#1077#1074#1086#1089#1090#1088#1077#1073'. '#1079#1072#1083#1086#1075#1072
        DataBinding.FieldName = 'REMOVEDFROMACC'
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.07.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1076#1077#1085#1077#1078#1085#1099#1084' '#1079#1072#1083 +
      #1086#1075#1072#1084'" '
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
      '      ,to_number(null) ismadeout'
      '      ,to_number(null) zadolg'
      '      ,to_number(null) fornextpay'
      '      ,to_number(null) forpay'
      '      ,to_number(null) return'
      '      ,to_number(null) removedfromacc'
      
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
      '      ,doc_number'
      '      ,ismadeout'
      '      ,zadolg'
      '      ,fornextpay'
      '      ,forpay'
      '      ,return'
      '      ,removedfromacc'
      
        '      ,(in_summa + ismadeout - zadolg - fornextpay - forpay - re' +
        'turn - removedfromacc) out_summa'
      'from ('
      'select id'
      '      ,parentid'
      
        '      ,nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else (case :summarn when '#39'Y'#39' then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091 +
        ' '#1086#1088#1075#1072#1085#1091#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end) end)) item_no'
      '      ,item_no item_sort'
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
      '      ,sum(ismadeout) ismadeout'
      '      ,sum(zadolg) zadolg'
      '      ,sum(fornextpay) fornextpay'
      '      ,sum(forpay) forpay'
      '      ,sum(return) return'
      '      ,sum(removedfromacc) removedfromacc'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_number) item_no'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)||'#39'|'#39'||doc_number) id'
      
        '            ,(inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) parentid'
      '            ,subject_id'
      '            ,to_number(null) in_summa'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,ismadeout'
      '            ,zadolg'
      '            ,fornextpay'
      '            ,forpay'
      '            ,return'
      '            ,removedfromacc'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(ismadeout) ismadeout'
      '                  ,sum(zadolg) zadolg'
      '                  ,sum(fornextpay) fornextpay'
      '                  ,sum(forpay) forpay'
      '                  ,sum(return) return'
      '                  ,sum(removedfromacc) removedfromacc'
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
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case'
      
        '                         when (d.typesysname IN ( '#39'TR'#39', '#39'TrDupli' +
        'cate'#39') ) then d.name'
      '                           else null end) end) doc_number'
      
        '                        ,(case  when (acc.code = '#39'07.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ismadeout'
      
        '                        ,-(case  when (acc.code = '#39'07.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) zadolg'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and nvl(dl.typesysname,'#39' '#39') != '#39'DecOffsetOb' +
        'ligation'#39') then sum_rur else 0 end) fornextpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and dl.typesysname = '#39'DecOffsetObligation'#39')' +
        ' then sum_rur else 0 end) forpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'07.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) removedfromacc'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst d'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         ('
      
        '                          acct.is_current = 1 and dl.object_type' +
        '_id not in ('
      
        '                                                                ' +
        '             fdc_object_type_get_bysysname('#39'DecisionPaymentDepos' +
        'it'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'CancelDecisionPaybac' +
        'k'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecOffsetObligation'#39 +
        ')'
      
        '                                                                ' +
        '           )'
      '                         )'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = d.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd nvl(acct.typesysname,'#39' '#39') != '#39'DecOffsetObligation'#39') then (p.su' +
        'mma * fdc_nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) e' +
        'lse 0 end) fornextpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd acct.typesysname = '#39'DecOffsetObligation'#39') then (p.summa * fdc_' +
        'nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) else 0 end)' +
        ' forpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.04'#39') t' +
        'hen p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,dl.typesysname'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id, typesysname'
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                         fdc_obj' +
        'ect_type_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecOffsetObligation'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse rr1'
      '                            ,fdc_value_lst v1'
      '                            ,fdc_document_lst d1'
      '                        where v1.ref_object_id = rr1.id'
      '                          and d1.id = v1.owner_object_id'
      
        '                          and d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr2.id'
      '                              ,rp2.doc_id'
      '                        from fdc_reserved_for_return rr2'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_document d1'
      '                        where rr2.id = rp2.id'
      '                          and rp2.doc_id = d1.id'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse_lst rr1'
      '                            ,fdc_document_lst d1'
      
        '                        where d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecOffsetObligation'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and d1.id = rr1.doc_id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      '                        ,0 fornextpay'
      '                        ,0 forpay'
      
        '                        ,(case  when (acct.code = '#39'07.01.04'#39') th' +
        'en p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id '
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                        fdc_obje' +
        'ct_type_get_bysysname('#39'CancelDecisionPayback'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr2.id'
      '                              ,cd.id doc_id'
      '                        from fdc_cancel_dec_payback_lst cd'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_reserved_for_return rr2'
      
        '                        where (cd.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and cd.dec_pay_id = rp2.doc_id'
      '                          and rp2.id = rr2.id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                 )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where ismadeout != 0'
      '         or zadolg != 0'
      '         or fornextpay != 0'
      '         or forpay != 0'
      '         or return != 0'
      '         or removedfromacc != 0'
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
      '        ,ismadeout'
      '        ,zadolg'
      '        ,fornextpay'
      '        ,forpay'
      '        ,return'
      '        ,removedfromacc),(subject_id,inn,name,type_person),())'
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
      '      ,to_number(null) ismadeout'
      '      ,to_number(null) zadolg'
      '      ,to_number(null) fornextpay'
      '      ,to_number(null) forpay'
      '      ,to_number(null) return'
      '      ,to_number(null) removedfromacc'
      
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
      040000000F000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E0100000000000900000049534D4144454F5554010000
      000000060000005A41444F4C470100000000000A000000464F524E4558545041
      5901000000000006000000464F525041590100000000000E00000052454D4F56
      454446524F4D414343010000000000}
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
      Size = 1500
    end
    object dsetDataISMADEOUT: TFloatField
      FieldName = 'ISMADEOUT'
      DisplayFormat = ',0.00'
    end
    object dsetDataZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetDataFORNEXTPAY: TFloatField
      FieldName = 'FORNEXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataFORPAY: TFloatField
      FieldName = 'FORPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataREMOVEDFROMACC: TFloatField
      FieldName = 'REMOVEDFROMACC'
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
      '      ,to_number(null) ismadeout'
      '      ,to_number(null) zadolg'
      '      ,to_number(null) fornextpay'
      '      ,to_number(null) forpay'
      '      ,to_number(null) return'
      '      ,to_number(null) removedfromacc'
      
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
      '      ,ismadeout'
      '      ,zadolg'
      '      ,fornextpay'
      '      ,forpay'
      '      ,return'
      '      ,removedfromacc'
      
        '      ,(in_summa + ismadeout - zadolg - fornextpay - forpay - re' +
        'turn - removedfromacc) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,ismadeout'
      '      ,zadolg'
      '      ,fornextpay'
      '      ,forpay'
      '      ,return'
      '      ,removedfromacc'
      'from ('
      '      select ismadeout'
      '            ,zadolg'
      '            ,fornextpay'
      '            ,forpay'
      '            ,return'
      '            ,removedfromacc'
      '      from ('
      '            select nvl(sum(ismadeout),0) ismadeout'
      '                  ,nvl(sum(zadolg),0) zadolg'
      '                  ,nvl(sum(fornextpay),0) fornextpay'
      '                  ,nvl(sum(forpay),0) forpay'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(removedfromacc),0) removedfromacc'
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
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case when (d.typesysname = '#39'TR'#39') then d.name else null end) end)' +
        ' doc_number'
      
        '                        ,(case  when (acc.code = '#39'07.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ismadeout'
      
        '                        ,-(case  when (acc.code = '#39'07.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) zadolg'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and nvl(dl.typesysname,'#39' '#39') != '#39'DecOffsetOb' +
        'ligation'#39') then sum_rur else 0 end) fornextpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and dl.typesysname = '#39'DecOffsetObligation'#39')' +
        ' then sum_rur else 0 end) forpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'07.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) removedfromacc'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst d'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         ('
      
        '                          acct.is_current = 1 and dl.object_type' +
        '_id not in ('
      
        '                                                                ' +
        '             fdc_object_type_get_bysysname('#39'DecisionPaymentDepos' +
        'it'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'CancelDecisionPaybac' +
        'k'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecOffsetObligation'#39 +
        ')'
      
        '                                                                ' +
        '           )'
      '                         )'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = d.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd nvl(acct.typesysname,'#39' '#39') != '#39'DecOffsetObligation'#39') then (p.su' +
        'mma * fdc_nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) e' +
        'lse 0 end) fornextpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd acct.typesysname = '#39'DecOffsetObligation'#39') then (p.summa * fdc_' +
        'nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) else 0 end)' +
        ' forpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.04'#39') t' +
        'hen p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,dl.typesysname'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id, typesysname'
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                         fdc_obj' +
        'ect_type_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecOffsetObligation'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse rr1'
      '                            ,fdc_value_lst v1'
      '                            ,fdc_document_lst d1'
      '                        where v1.ref_object_id = rr1.id'
      '                          and d1.id = v1.owner_object_id'
      
        '                          and d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr2.id'
      '                              ,rp2.doc_id'
      '                        from fdc_reserved_for_return rr2'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_document d1'
      '                        where rr2.id = rp2.id'
      '                          and rp2.doc_id = d1.id'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse_lst rr1'
      '                            ,fdc_document_lst d1'
      
        '                        where d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecOffsetObligation'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and d1.id = rr1.doc_id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      '                        ,0 fornextpay'
      '                        ,0 forpay'
      
        '                        ,(case  when (acct.code = '#39'07.01.04'#39') th' +
        'en p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id '
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                        fdc_obje' +
        'ct_type_get_bysysname('#39'CancelDecisionPayback'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr2.id'
      '                              ,cd.id doc_id'
      '                        from fdc_cancel_dec_payback_lst cd'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_reserved_for_return rr2'
      
        '                        where (cd.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and cd.dec_pay_id = rp2.doc_id'
      '                          and rp2.id = rr2.id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                 )'
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
      '      ,to_number(null) ismadeout'
      '      ,to_number(null) zadolg'
      '      ,to_number(null) fornextpay'
      '      ,to_number(null) forpay'
      '      ,to_number(null) return'
      '      ,to_number(null) removedfromacc'
      
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
      040000000F000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E0100000000000900000049534D4144454F5554010000
      000000060000005A41444F4C470100000000000A000000464F524E4558545041
      5901000000000006000000464F525041590100000000000E00000052454D4F56
      454446524F4D414343010000000000}
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
    object dsetItogISMADEOUT: TFloatField
      FieldName = 'ISMADEOUT'
      DisplayFormat = ',0.00'
    end
    object dsetItogZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetItogFORNEXTPAY: TFloatField
      FieldName = 'FORNEXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogFORPAY: TFloatField
      FieldName = 'FORPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogREMOVEDFROMACC: TFloatField
      FieldName = 'REMOVEDFROMACC'
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
      '      ,ismadeout'
      '      ,zadolg'
      '      ,fornextpay'
      '      ,forpay'
      '      ,return'
      '      ,removedfromacc'
      
        '      ,(in_summa + ismadeout - zadolg - fornextpay - forpay - re' +
        'turn - removedfromacc) out_summa'
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
      '      ,ismadeout'
      '      ,zadolg'
      '      ,fornextpay'
      '      ,forpay'
      '      ,return'
      '      ,removedfromacc'
      'from ('
      
        '      select (inn||'#39'|'#39'||name||'#39'|'#39'||type_person||'#39'|'#39'||to_char(sub' +
        'ject_id)) id'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,ismadeout'
      '            ,zadolg'
      '            ,fornextpay'
      '            ,forpay'
      '            ,return'
      '            ,removedfromacc'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,sum(ismadeout) ismadeout'
      '                  ,sum(zadolg) zadolg'
      '                  ,sum(fornextpay) fornextpay'
      '                  ,sum(forpay) forpay'
      '                  ,sum(return) return'
      '                  ,sum(removedfromacc) removedfromacc'
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
      
        '                        ,(case :summarn when '#39'Y'#39' then '#39' '#39' else (' +
        'case when (d.typesysname = '#39'TR'#39') then d.name else null end) end)' +
        ' doc_number'
      
        '                        ,(case  when (acc.code = '#39'07.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ismadeout'
      
        '                        ,-(case  when (acc.code = '#39'07.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) zadolg'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and nvl(dl.typesysname,'#39' '#39') != '#39'DecOffsetOb' +
        'ligation'#39') then sum_rur else 0 end) fornextpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and dl.typesysname = '#39'DecOffsetObligation'#39')' +
        ' then sum_rur else 0 end) forpay'
      
        '                        ,-(case  when (acc.code = '#39'07.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'07.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) removedfromacc'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst d'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         ('
      
        '                          acct.is_current = 1 and dl.object_type' +
        '_id not in ('
      
        '                                                                ' +
        '             fdc_object_type_get_bysysname('#39'DecisionPaymentDepos' +
        'it'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'CancelDecisionPaybac' +
        'k'#39')'
      
        '                                                                ' +
        '            ,fdc_object_type_get_bysysname('#39'DecOffsetObligation'#39 +
        ')'
      
        '                                                                ' +
        '           )'
      '                         )'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = d.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd nvl(acct.typesysname,'#39' '#39') != '#39'DecOffsetObligation'#39') then (p.su' +
        'mma * fdc_nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) e' +
        'lse 0 end) fornextpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.03'#39' an' +
        'd acct.typesysname = '#39'DecOffsetObligation'#39') then (p.summa * fdc_' +
        'nsi_currency_get_rate(p.charge_curr_id, p.doc_date)) else 0 end)' +
        ' forpay'
      
        '                        ,-(case  when (acct.code = '#39'07.01.04'#39') t' +
        'hen p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,dl.typesysname'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id, typesysname'
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                         fdc_obj' +
        'ect_type_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecPaybackDeposit'#39')'
      
        '                                                        ,fdc_obj' +
        'ect_type_get_bysysname('#39'DecOffsetObligation'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse rr1'
      '                            ,fdc_value_lst v1'
      '                            ,fdc_document_lst d1'
      '                        where v1.ref_object_id = rr1.id'
      '                          and d1.id = v1.owner_object_id'
      
        '                          and d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecisionPaymentDeposit'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr2.id'
      '                              ,rp2.doc_id'
      '                        from fdc_reserved_for_return rr2'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_document d1'
      '                        where rr2.id = rp2.id'
      '                          and rp2.doc_id = d1.id'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                        union all'
      '                        select rr1.id'
      '                              ,d1.id doc_id'
      '                        from fdc_reserved_for_reuse_lst rr1'
      '                            ,fdc_document_lst d1'
      
        '                        where d1.object_type_id = fdc_object_typ' +
        'e_get_bysysname('#39'DecOffsetObligation'#39')'
      
        '                          and (d1.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and d1.id = rr1.doc_id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                  union all'
      '                  select p.kbkcode_id kbk_id'
      '                        ,tr.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.typesysname when '#39'Person'#39' then' +
        ' '#39#1060#39' else '#39#1070#39' end) type_person'
      
        '                        ,(case when (tr.typesysname = '#39'TR'#39') then' +
        ' tr.name else null end) doc_number'
      '                        ,0 ismadeout'
      '                        ,0 zadolg'
      '                        ,0 fornextpay'
      '                        ,0 forpay'
      
        '                        ,(case  when (acct.code = '#39'07.01.04'#39') th' +
        'en p.summa else 0 end) return'
      '                        ,0 removedfromacc'
      '                  from ('
      '                        select distinct'
      '                               dl.id doc_id'
      '                              ,act.account_id'
      '                              ,acc.code'
      '                              ,act.operation_date'
      '                        from ('
      '                              select id '
      '                              from fdc_document_lst'
      '                              where (object_type_id in ('
      
        '                                                        fdc_obje' +
        'ct_type_get_bysysname('#39'CancelDecisionPayback'#39')'
      '                                                       )'
      '                                    )'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and trunc(:edate)) '
      '                             ) dl'
      '                            ,fdc_acc_transaction act'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc'
      '                        where dl.id = act.doc_id'
      
        '                          and (act.operation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      
        '                          and (case :ists when '#39'N'#39' then '#39'Y'#39' else' +
        ' act.is_ts end) = '#39'Y'#39
      '                          and act.account_id = acc.id'
      '                       ) acct'
      '                      ,('
      '                        select rr2.id'
      '                              ,cd.id doc_id'
      '                        from fdc_cancel_dec_payback_lst cd'
      '                            ,fdc_reserved_payment rp2'
      '                            ,fdc_reserved_for_return rr2'
      
        '                        where (cd.activation_date between trunc(' +
        ':bdate) and trunc(:edate))'
      '                          and cd.dec_pay_id = rp2.doc_id'
      '                          and rp2.id = rr2.id'
      '                        ) rr  '
      '                      ,fdc_payment_deduction_lst p'
      '                      ,fdc_tr_lst tr'
      '                      ,fdc_subject_lst sl'
      '                  where (:summarn != '#39'Y'#39')'
      '                    and acct.doc_id = rr.doc_id'
      '                    and rr.id = p.charge_id'
      '                    and p.decl_id = tr.id(+)'
      '                    and tr.subject_id = sl.id(+)'
      '                 )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '           ) a'
      '      where ismadeout != 0'
      '         or zadolg != 0'
      '         or fornextpay != 0'
      '         or forpay != 0'
      '         or return != 0'
      '         or removedfromacc != 0'
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
      040000000F000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D410100000000000200000049440100000000000800
      0000504152454E54494401000000000003000000494E4E010000000000040000
      004E414D450100000000000B000000545950455F504552534F4E010000000000
      0600000052455455524E0100000000000900000049534D4144454F5554010000
      000000060000005A41444F4C470100000000000A000000464F524E4558545041
      5901000000000006000000464F525041590100000000000E00000052454D4F56
      454446524F4D414343010000000000}
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
    object dsetItogSubjectISMADEOUT: TFloatField
      FieldName = 'ISMADEOUT'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectFORNEXTPAY: TFloatField
      FieldName = 'FORNEXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectFORPAY: TFloatField
      FieldName = 'FORPAY'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogSubjectREMOVEDFROMACC: TFloatField
      FieldName = 'REMOVEDFROMACC'
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
