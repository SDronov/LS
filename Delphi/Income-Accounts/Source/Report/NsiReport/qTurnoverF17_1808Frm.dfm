inherited qTurnoverF17_1808Form: TqTurnoverF17_1808Form
  Left = 239
  Top = 247
  Width = 854
  Caption = #1089#1095' 12.01.00'
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
          Caption = #1050#1041#1050
          FixedKind = fkLeft
          Width = 84
        end
        item
          Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
        end
        item
          Caption = #1048#1053#1053
          Position.BandIndex = 2
          Position.ColIndex = 0
          Width = 131
        end
        item
          Caption = #1085#1072#1080#1084'./'#1060#1048#1054
          Position.BandIndex = 2
          Position.ColIndex = 1
          Width = 132
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 2
          Position.ColIndex = 2
          Width = 180
        end
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        end
        item
          Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
          Width = 140
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 260
        end
        item
          Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1086' '#1091#1074#1077#1076'./'#1087#1086#1076#1090#1074'.'
          Position.BandIndex = 8
          Position.ColIndex = 0
          Width = 140
        end
        item
          Caption = #1074#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088
          Position.BandIndex = 8
          Position.ColIndex = 1
          Width = 140
        end
        item
          Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
          FixedKind = fkRight
          Width = 140
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
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'INN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'NAME'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewTYPE_PERSON: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'TYPE_PERSON'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewdoc_number: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 160
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIN_SUMMA_ITOGO: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewdebit: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'DEBIT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView [1]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsItog_kbk
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
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
      end
      object grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        Width = 150
      end
      object grdTurnoverSheetDBBandedTableDViewInn: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Visible = False
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableDViewName: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Visible = False
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableDViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087
        DataBinding.FieldName = 'TYPE_PERSON'
        Visible = False
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableDViewDoc_number: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'DOC_NUMBER'
        Visible = False
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Hidden = True
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBColumn
        Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1086' '#1091#1074#1077#1076'./'#1087#1086#1076#1090#1074'.'
        DataBinding.FieldName = 'POSTUPILO'
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewdebit: TcxGridDBColumn
        Caption = #1074#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088
        DataBinding.FieldName = 'DEBIT'
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Hidden = True
        Width = 140
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
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
      end
      object grdTurnoverSheetDBBandedTableD2ViewKBK: TcxGridDBColumn
        DataBinding.FieldName = 'KBK'
        Visible = False
        Width = 150
      end
      object grdTurnoverSheetDBBandedTableD2ViewINN: TcxGridDBColumn
        Caption = #1048#1053#1053
        DataBinding.FieldName = 'INN'
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableD2ViewNAME: TcxGridDBColumn
        Caption = #1085#1072#1080#1084'./'#1060#1048#1054
        DataBinding.FieldName = 'NAME'
        Width = 180
      end
      object grdTurnoverSheetDBBandedTableD2ViewTYPE_PERSON: TcxGridDBColumn
        Caption = #1090#1080#1087' '
        DataBinding.FieldName = 'TYPE_PERSON'
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableD2ViewDOC_NUMBER: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 160
      end
      object grdTurnoverSheetDBBandedTableD2ViewIN_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Visible = False
        Hidden = True
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableD2ViewPostupilo: TcxGridDBColumn
        Caption = #1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1086' '#1091#1074#1077#1076'./'#1087#1086#1076#1090#1074'.'
        DataBinding.FieldName = 'POSTUPILO'
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableD2Viewdebit: TcxGridDBColumn
        Caption = #1074#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088
        DataBinding.FieldName = 'DEBIT'
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableD2ViewOUT_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Visible = False
        Hidden = True
        Width = 140
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.12.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1079 +
      #1072#1095#1077#1090#1091' '#1087#1083#1072#1090#1077#1078#1077#1081'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual'
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,(case when (item_no is null and kbk is null) then null'
      
        '             when (item_no is null and kbk is not null) then nul' +
        'l'
      '             else parentid'
      '       end) parentid'
      '      ,(case when (item_no is null and kbk is null) then '#39#1048#1090#1086#1075#1086#39
      
        '             when (item_no is null and kbk is not null) then '#39#1048#1090 +
        #1086#1075#1086' '#1087#1086' '#1050#1041#1050#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      '      ,kbk_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select row_number() over(order by kbk, kbk_id, type_person' +
        ', name, inn, doc_number) item_no'
      
        '            ,(kbk||'#39'|'#39'||to_char(kbk_id)||'#39'|'#39'||type_person||'#39'|'#39'||' +
        'name||'#39'|'#39'||inn||'#39'|'#39'||doc_number) id'
      '            ,(kbk||'#39'|'#39'||to_char(kbk_id)) parentid'
      '            ,to_number(null) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                 )'
      '            group by kbk_id'
      '                    ,kbk'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where postupilo != 0 '
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,kbk_id'
      '        ,kbk'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,in_summa_itogo'
      '        ,postupilo'
      '        ,debit)'
      '        ,(kbk),())'
      'order by item_no_sort nulls first, kbk nulls first'
      '     )'
      '-- '#1059#1074#1040
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,(case when (item_no is null and kbk is null) then null'
      
        '             when (item_no is null and kbk is not null) then nul' +
        'l'
      '             else parentid'
      '       end) parentid'
      
        '      ,(case when (item_no is null and kbk is null) then '#39#1048#1090#1086#1075#1086' ' +
        #1087#1086' '#1059#1074#1040#39
      
        '             when (item_no is null and kbk is not null) then '#39#1048#1090 +
        #1086#1075#1086' '#1087#1086' '#1050#1041#1050#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      '      ,kbk_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(account_id,'#39'12.01.01'#39',trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summa' +
        'rn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select row_number() over(order by kbk, kbk_id, type_person' +
        ', name, inn, doc_number) item_no'
      
        '            ,('#39#1059#1074#1040#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)||'#39'|'#39'||type_p' +
        'erson||'#39'|'#39'||name||'#39'|'#39'||inn||'#39'|'#39'||doc_number) id'
      '            ,('#39#1059#1074#1040#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) parentid'
      '            ,to_number(null) in_summa_itogo'
      '            ,account_id'
      '            ,kbk'
      '            ,kbk_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,kbk_id'
      '                  ,kbk'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.01'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by account_id'
      '                    ,kbk_id'
      '                    ,kbk'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where postupilo != 0 '
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,account_id'
      '        ,kbk_id'
      '        ,kbk'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,in_summa_itogo'
      '        ,postupilo'
      '        ,debit)'
      '        ,(kbk),())'
      'order by item_no_sort nulls first, kbk nulls first'
      '     )'
      '-- '#1059#1074#1062
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,(case when (item_no is null and kbk is null) then null'
      
        '             when (item_no is null and kbk is not null) then nul' +
        'l'
      '             else parentid'
      '       end) parentid'
      
        '      ,(case when (item_no is null and kbk is null) then '#39#1048#1090#1086#1075#1086' ' +
        #1087#1086' '#1059#1074#1062#39
      
        '             when (item_no is null and kbk is not null) then '#39#1048#1090 +
        #1086#1075#1086' '#1087#1086' '#1050#1041#1050#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      '      ,kbk_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(account_id,'#39'12.01.02'#39',trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summa' +
        'rn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select row_number() over(order by kbk, kbk_id, type_person' +
        ', name, inn, doc_number) item_no'
      
        '            ,('#39#1059#1074#1062#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)||'#39'|'#39'||type_p' +
        'erson||'#39'|'#39'||name||'#39'|'#39'||inn||'#39'|'#39'||doc_number) id'
      '            ,('#39#1059#1074#1062#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) parentid'
      '            ,to_number(null) in_summa_itogo'
      '            ,account_id'
      '            ,kbk'
      '            ,kbk_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,kbk_id'
      '                  ,kbk'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.02'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by account_id'
      '                    ,kbk_id'
      '                    ,kbk'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where postupilo != 0 '
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,account_id'
      '        ,kbk_id'
      '        ,kbk'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,in_summa_itogo'
      '        ,postupilo'
      '        ,debit)'
      '        ,(kbk),())'
      'order by item_no_sort nulls first, kbk nulls first'
      '     )'
      '-- '#1059#1074#1048#1079#1083
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,(case when (item_no is null and kbk is null) then null'
      
        '             when (item_no is null and kbk is not null) then nul' +
        'l'
      '             else parentid'
      '       end) parentid'
      
        '      ,(case when (item_no is null and kbk is null) then '#39#1048#1090#1086#1075#1086' ' +
        #1087#1086' '#1059#1074#1048#1079#1083#39
      
        '             when (item_no is null and kbk is not null) then '#39#1048#1090 +
        #1086#1075#1086' '#1087#1086' '#1050#1041#1050#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      '      ,kbk_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(account_id,'#39'12.01.03'#39',trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summa' +
        'rn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select row_number() over(order by kbk, kbk_id, type_person' +
        ', name, inn, doc_number) item_no'
      
        '            ,('#39#1059#1074#1048#1079#1083#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)||'#39'|'#39'||type' +
        '_person||'#39'|'#39'||name||'#39'|'#39'||inn||'#39'|'#39'||doc_number) id'
      '            ,('#39#1059#1074#1048#1079#1083#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) parentid'
      '            ,to_number(null) in_summa_itogo'
      '            ,account_id'
      '            ,kbk'
      '            ,kbk_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,kbk_id'
      '                  ,kbk'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.03'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by account_id'
      '                    ,kbk_id'
      '                    ,kbk'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where postupilo != 0 '
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,account_id'
      '        ,kbk_id'
      '        ,kbk'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,in_summa_itogo'
      '        ,postupilo'
      '        ,debit)'
      '        ,(kbk),())'
      'order by item_no_sort nulls first, kbk nulls first'
      '     )'
      '-- '#1055
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,(case when (item_no is null and kbk is null) then null'
      
        '             when (item_no is null and kbk is not null) then nul' +
        'l'
      '             else parentid'
      '       end) parentid'
      
        '      ,(case when (item_no is null and kbk is null) then '#39#1048#1090#1086#1075#1086' ' +
        #1087#1086' '#1055#39
      
        '             when (item_no is null and kbk is not null) then '#39#1048#1090 +
        #1086#1075#1086' '#1087#1086' '#1050#1041#1050#39
      '             else to_char(item_no)'
      '       end) item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      '      ,kbk_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(account_id,'#39'12.01.04'#39',trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summa' +
        'rn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(postupilo) postupilo'
      '      ,sum(debit) debit'
      'from ('
      
        '      select row_number() over(order by kbk, kbk_id, type_person' +
        ', name, inn, doc_number) item_no'
      
        '            ,('#39#1055#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)||'#39'|'#39'||type_per' +
        'son||'#39'|'#39'||name||'#39'|'#39'||inn||'#39'|'#39'||doc_number) id'
      '            ,('#39#1055#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) parentid'
      '            ,to_number(null) in_summa_itogo'
      '            ,account_id'
      '            ,kbk'
      '            ,kbk_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,kbk_id'
      '                  ,kbk'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(debit) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.04'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by account_id'
      '                    ,kbk_id'
      '                    ,kbk'
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '           ) a'
      '      where postupilo != 0 '
      '         or debit != 0'
      '     )'
      'group by grouping sets(('
      '         id'
      '        ,parentid'
      '        ,item_no'
      '        ,account_id'
      '        ,kbk_id'
      '        ,kbk'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,in_summa_itogo'
      '        ,postupilo'
      '        ,debit)'
      '        ,(kbk),())'
      'order by item_no_sort nulls first, kbk nulls first'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000E000000494E5F53554D4D415F49544F474F0100000000000F000000
      4F55545F53554D4D415F49544F474F01000000000009000000504F5354555049
      4C4F01000000000005000000444542495401000000000003000000494E4E0100
      00000000040000004E414D450100000000000B000000545950455F504552534F
      4E0100000000000A000000444F435F4E554D424552010000000000}
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
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetDataIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetDataDEBIT: TFloatField
      FieldName = 'DEBIT'
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
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
  object dsetItog: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
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
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                 )'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1040
      'union all'
      'select '#39'1'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1059#1074#1040#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(account_id,'#39'12.01.01'#39',trunc(:bda' +
        'te),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:is' +
        'ts) in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select account_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.01'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '             group by account_id'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1062
      'union all'
      'select '#39'2'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1059#1074#1062#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(account_id,'#39'12.01.02'#39',trunc(:bda' +
        'te),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:is' +
        'ts) in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select account_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.02'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '             group by account_id'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1048#1079#1083
      'union all'
      'select '#39'3'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1059#1074#1048#1079#1083#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(account_id,'#39'12.01.03'#39',trunc(:bda' +
        'te),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:is' +
        'ts) in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select account_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select account_id'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.03'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '             group by account_id'
      '           ) a'
      '     )'
      '     )'
      '-- '#1055
      'union all'
      'select '#39'4'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1055#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(account_id,'#39'12.01.04'#39',trunc(:bda' +
        'te),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end),:is' +
        'ts) in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select  account_id'
      '             ,postupilo'
      '             ,debit'
      '      from ('
      '            select  account_id'
      '                   ,nvl(sum(postupilo),0) postupilo'
      '                   ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.04'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '             group by account_id'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) debit'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000E000000494E5F53554D4D415F49544F474F0100000000000F000000
      4F55545F53554D4D415F49544F474F01000000000009000000504F5354555049
      4C4F01000000000005000000444542495401000000000003000000494E4E0100
      00000000040000004E414D450100000000000B000000545950455F504552534F
      4E0100000000000A000000444F435F4E554D424552010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 240
    Top = 104
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
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItogDEBIT: TFloatField
      FieldName = 'DEBIT'
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
      Size = 1500
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 240
    Top = 200
  end
  object dsetItog_kbk: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,'#39'0'#39' parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1050#1041#1050#39' item_no'
      '      ,kbk'
      '      ,kbk_id'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,:account_code account_code'
      'from ('
      '      select (kbk||'#39'|'#39'||to_char(kbk_id)) id'
      
        '            ,(p_oper_balans.get_bsumma_account_kbk(:account_id,:' +
        'account_code,trunc(:bdate),kbk_id,0,'#39'rur'#39','#39'rur'#39',(case :summarn w' +
        'hen '#39'Y'#39' then 1 else 0 end),:ists)) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                 )'
      '            group by kbk_id'
      '                    ,kbk'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1040
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,'#39'1'#39' parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1050#1041#1050#39' item_no'
      '      ,kbk'
      '      ,kbk_id'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select ('#39#1059#1074#1040#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) id'
      '            ,to_number(null) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.01'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by kbk_id'
      '                    ,kbk'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1062
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,'#39'2'#39' parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1050#1041#1050#39' item_no'
      '      ,kbk'
      '      ,kbk_id'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select ('#39#1059#1074#1062#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) id'
      '            ,to_number(null) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.02'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by kbk_id'
      '                    ,kbk'
      '           ) a'
      '     )'
      '     )'
      '-- '#1059#1074#1048#1079#1083
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,'#39'3'#39' parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1050#1041#1050#39' item_no'
      '      ,kbk'
      '      ,kbk_id'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select ('#39#1059#1074#1048#1079#1083#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) id'
      '            ,to_number(null) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.03'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by kbk_id'
      '                    ,kbk'
      '           ) a'
      '     )'
      '     )'
      '-- '#1055
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      '      ,(in_summa_itogo + postupilo - debit) out_summa_itogo'
      'from ('
      'select id'
      '      ,'#39'4'#39' parentid'
      '      ,'#39#1048#1090#1086#1075#1086' '#1087#1086' '#1050#1041#1050#39' item_no'
      '      ,kbk'
      '      ,kbk_id'
      '      ,in_summa_itogo'
      '      ,postupilo'
      '      ,debit'
      'from ('
      '      select ('#39#1055#39'||'#39'|'#39'||kbk||'#39'|'#39'||to_char(kbk_id)) id'
      '            ,to_number(null) in_summa_itogo'
      '            ,kbk'
      '            ,kbk_id'
      '            ,postupilo'
      '            ,debit'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '                  ,nvl(sum(debit),0) debit'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict.code kbk'
      
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
      
        '                        ,(case :summarn when '#39'Y'#39' then null else ' +
        'dc.name end) doc_number'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' sum_rur else 0 end) debit'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        where (:bdate between sdate and nvl(edat' +
        'e,:bdate + 1))'
      '                          and code = '#39'12.01.04'#39
      '                        start with (id in (:account_id))'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_customs_lst  cl'
      '                      ,fdc_dict dict'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.subject_id = cl.id(+)'
      '                    and acct.kbk_id = dict.id(+)'
      '                  )'
      '            group by kbk_id'
      '                    ,kbk'
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
      040000000C000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000E000000494E5F53554D4D415F49544F474F01000000000009000000
      504F53545550494C4F0100000000000500000044454249540100000000000F00
      00004F55545F53554D4D415F49544F474F01000000000003000000494E4E0100
      00000000040000004E414D450100000000000B000000545950455F504552534F
      4E0100000000000A000000444F435F4E554D424552010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 304
    Top = 104
    object dsetItog_kbkID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsetItog_kbkPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetItog_kbkITM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetItog_kbkKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItog_kbkPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItog_kbkDEBIT: TFloatField
      FieldName = 'DEBIT'
      DisplayFormat = ',0.00'
    end
    object dsetItog_kbkOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItog_kbkIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItog_kbkINN: TStringField
      FieldName = 'INN'
      Size = 255
    end
    object dsetItog_kbkNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetItog_kbkTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 255
    end
    object dsetItog_kbkDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 1500
    end
  end
  object dsItog_kbk: TDataSource
    DataSet = dsetItog_kbk
    Left = 312
    Top = 200
  end
end
