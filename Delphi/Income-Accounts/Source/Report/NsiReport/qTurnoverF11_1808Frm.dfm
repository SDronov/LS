inherited qTurnoverF11_1808Form: TqTurnoverF11_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 11.00.00'
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
          Width = 120
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 120
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1200
        end
        item
          Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
          Position.BandIndex = 3
          Position.ColIndex = 0
        end
        item
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
          Position.BandIndex = 3
          Position.ColIndex = 1
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074
          Position.BandIndex = 3
          Position.ColIndex = 2
        end
        item
          Caption = #1059#1074#1040
          Position.BandIndex = 6
          Position.ColIndex = 0
        end
        item
          Caption = #1059#1074#1062
          Position.BandIndex = 6
          Position.ColIndex = 1
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 6
          Position.ColIndex = 2
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 6
          Position.ColIndex = 3
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086
          Position.BandIndex = 3
          Position.ColIndex = 3
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1079#1072' '#1073#1072#1083#1072#1085#1089
          Position.BandIndex = 3
          Position.ColIndex = 4
        end
        item
          Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1095#1077#1090#1072
          Position.BandIndex = 3
          Position.ColIndex = 5
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1087#1086' '#8470'117'#1085
          Position.BandIndex = 3
          Position.ColIndex = 6
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
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInst_itogo: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'INST_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRest_itogo: TcxGridDBBandedColumn
        Caption = '5'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_uv_avans: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'INCLUDE_UV_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_uv_celevoy: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCLUDE_UV_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcl_itogo: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'EXCL_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZab_itogo: TcxGridDBBandedColumn
        Caption = '11'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPay_other_acc: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'PAY_OTHER_ACC'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcl_117: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'EXCL_117'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 15
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
      object grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        Width = 150
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Hidden = True
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINST_ITOGO: TcxGridDBColumn
        Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
        DataBinding.FieldName = 'INST_ITOGO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRest_itogo: TcxGridDBColumn
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_UV_AVANS: TcxGridDBColumn
        Caption = #1059#1074#1040
        DataBinding.FieldName = 'INCLUDE_UV_AVANS'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_UV_CELEVOY: TcxGridDBColumn
        Caption = #1059#1074#1062
        DataBinding.FieldName = 'INCLUDE_UV_CELEVOY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_CONFIRM: TcxGridDBColumn
        Caption = #1055#1086#1076#1090#1074
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_ITOGO: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewEXCL_ITOGO: TcxGridDBColumn
        Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086
        DataBinding.FieldName = 'EXCL_ITOGO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewZab_itogo: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1079#1072' '#1073#1072#1083#1072#1085#1089
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewEXCL_117: TcxGridDBColumn
        Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1087#1086' '#8470'117'#1085
        DataBinding.FieldName = 'EXCL_117'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Hidden = True
        Width = 120
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.11.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1079 +
      #1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1080' '#1096#1090#1088#1072#1092#1072#1084'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-1'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select to_char(nvl(item_no_sort,0)) id'
      
        '      ,to_char((case when (item_no_sort is null) then null else ' +
        '0 end)) parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      
        '      ,(in_summa_itogo + inst_itogo - include_itogo - excl_itogo' +
        ' - pay_other_acc - excl_117) out_summa_itogo'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(inst_itogo) inst_itogo'
      '      ,sum(include_uv_avans) include_uv_avans'
      '      ,sum(include_uv_celevoy) include_uv_celevoy'
      '      ,sum(include_confirm) include_confirm'
      '      ,sum(include_itogo) include_itogo'
      '      ,sum(excl_itogo) excl_itogo'
      '      ,sum(pay_other_acc) pay_other_acc'
      '      ,sum(excl_117) excl_117'
      'from ('
      '      select row_number() over(order by kbk) item_no'
      '            ,kbk'
      '            ,('
      
        '              select sum(p_oper_balans.get_bsumma_account_kbk( :' +
        'account_id, :account_code, :bdate, kd.id, 0,'#39'rur'#39','#39'rur'#39', case :s' +
        'ummarn WHEN '#39'Y'#39' THEN 1 ELSE 0 end , :ists ))'
      '              from fdc_kbk_dict_lst kd'
      '              where kd.code = kbk'
      '             ) in_summa_itogo'
      '            ,inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select kbk'
      '                  ,nvl(sum(inst_itogo),0) inst_itogo'
      '                  ,nvl(sum(include_uv_avans),0) include_uv_avans'
      
        '                  ,nvl(sum(include_uv_celevoy),0) include_uv_cel' +
        'evoy'
      '                  ,nvl(sum(include_confirm),0) include_confirm'
      '                  ,nvl(sum(excl_itogo),0) excl_itogo'
      '                  ,nvl(sum(pay_other_acc),0) pay_other_acc'
      '                  ,nvl(sum(excl_117),0) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,dict_kbk.code kbk'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dict_kbk'
      
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
      '                    and acct.kbk_id = dict_kbk.id(+)'
      '                  )'
      '            group by kbk'
      '           ) a'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,kbk'
      '        ,in_summa_itogo'
      '        ,inst_itogo'
      '        ,include_uv_avans'
      '        ,include_uv_celevoy'
      '        ,include_confirm'
      '        ,include_itogo'
      '        ,excl_itogo'
      '        ,pay_other_acc'
      '        ,excl_117),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
      'select '#39'-3'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084#39' item_no'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      'from ('
      '      select inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '                  ,sum(include_uv_avans) include_uv_avans'
      '                  ,sum(include_uv_celevoy) include_uv_celevoy'
      '                  ,sum(include_confirm) include_confirm'
      '                  ,sum(excl_itogo) excl_itogo'
      '                  ,sum(pay_other_acc) pay_other_acc'
      '                  ,sum(excl_117) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and acct.is_current = 1'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'N'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080
      'select '#39'-4'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080#39' item_no'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      'from ('
      '      select inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '                  ,sum(include_uv_avans) include_uv_avans'
      '                  ,sum(include_uv_celevoy) include_uv_celevoy'
      '                  ,sum(include_confirm) include_confirm'
      '                  ,sum(excl_itogo) excl_itogo'
      '                  ,sum(pay_other_acc) pay_other_acc'
      '                  ,sum(excl_117) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and acct.is_current = 1'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'Y'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1074#1089#1077#1075#1086' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-5'#39' id'
      '            ,null parentid'
      '            ,'#39#1042' '#1090'.'#1095'. '#1074#1089#1077#1075#1086' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '            ,to_char(null) kbk'
      '            ,to_number(null) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      '            ,to_number(null) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select '#39'-6'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,to_number(null) include_uv_avans'
      '      ,to_number(null) include_uv_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) excl_itogo'
      '      ,to_number(null) pay_other_acc'
      '      ,to_number(null) excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '      ,inst_itogo'
      'from ('
      '      select inst_itogo'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.02.01'#39')) ' +
        'and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst_itogo'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      
        '                    and nvl(dl.typesysname, '#39' '#39') in ('#39'DebtsMeasu' +
        'res'#39')'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'N'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1077#1085#1080', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select '#39'-7'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,to_number(null) include_uv_avans'
      '      ,to_number(null) include_uv_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) excl_itogo'
      '      ,to_number(null) pay_other_acc'
      '      ,to_number(null) excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '      ,inst_itogo'
      'from ('
      '      select inst_itogo'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.02.01'#39')) ' +
        'and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst_itogo'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      
        '                    and nvl(dl.typesysname, '#39' '#39') in ('#39'DebtsMeasu' +
        'res'#39')'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'Y'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-2'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      
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
      040000000E000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000F000000494E434C5544455F434F4E4649524D0100000000000D0000
      00494E434C5544455F49544F474F0100000000000E000000494E5F53554D4D41
      5F49544F474F0100000000000A000000494E53545F49544F474F010000000000
      10000000494E434C5544455F55565F4156414E5301000000000012000000494E
      434C5544455F55565F43454C45564F590100000000000A0000004558434C5F49
      544F474F0100000000000D0000005041595F4F544845525F4143430100000000
      00080000004558434C5F3131370100000000000F0000004F55545F53554D4D41
      5F49544F474F010000000000}
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
      Size = 1500
    end
    object dsetDataIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataINST_ITOGO: TFloatField
      FieldName = 'INST_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_UV_AVANS: TFloatField
      FieldName = 'INCLUDE_UV_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_UV_CELEVOY: TFloatField
      FieldName = 'INCLUDE_UV_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_CONFIRM: TFloatField
      FieldName = 'INCLUDE_CONFIRM'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_ITOGO: TFloatField
      FieldName = 'INCLUDE_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataEXCL_ITOGO: TFloatField
      FieldName = 'EXCL_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataPAY_OTHER_ACC: TFloatField
      FieldName = 'PAY_OTHER_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetDataEXCL_117: TFloatField
      FieldName = 'EXCL_117'
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
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-1'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 els' +
        'e 0 end),:ists) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      
        '      ,(in_summa_itogo + inst_itogo - include_itogo - excl_itogo' +
        ' - pay_other_acc - excl_117) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      '      ,null kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      'from ('
      '      select inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select nvl(sum(inst_itogo),0) inst_itogo'
      '                  ,nvl(sum(include_uv_avans),0) include_uv_avans'
      
        '                  ,nvl(sum(include_uv_celevoy),0) include_uv_cel' +
        'evoy'
      '                  ,nvl(sum(include_confirm),0) include_confirm'
      '                  ,nvl(sum(excl_itogo),0) excl_itogo'
      '                  ,nvl(sum(pay_other_acc),0) pay_other_acc'
      '                  ,nvl(sum(excl_117),0) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      
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
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
      'select '#39'-3'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084#39' item_no'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      'from ('
      '      select inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '                  ,sum(include_uv_avans) include_uv_avans'
      '                  ,sum(include_uv_celevoy) include_uv_celevoy'
      '                  ,sum(include_confirm) include_confirm'
      '                  ,sum(excl_itogo) excl_itogo'
      '                  ,sum(pay_other_acc) pay_other_acc'
      '                  ,sum(excl_117) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and acct.is_current = 1'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'N'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080
      'select '#39'-4'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080#39' item_no'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      'from ('
      '      select inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '            ,excl_itogo'
      '            ,pay_other_acc'
      '            ,excl_117'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '                  ,sum(include_uv_avans) include_uv_avans'
      '                  ,sum(include_uv_celevoy) include_uv_celevoy'
      '                  ,sum(include_confirm) include_confirm'
      '                  ,sum(excl_itogo) excl_itogo'
      '                  ,sum(pay_other_acc) pay_other_acc'
      '                  ,sum(excl_117) excl_117'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.01.01'#39','#39'1' +
        '1.01.02'#39')) and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) ins' +
        't_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.04'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_avans'
      
        '                        ,-(case when (acc.code = '#39'11.01.10'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_uv_celevoy'
      
        '                        ,-(case when (acc.code = '#39'11.01.05'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case when (acc.code = '#39'11.01.06'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_itogo'
      
        '                        ,-(case when (acc.code = '#39'11.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) pay_other_acc'
      
        '                        ,-(case when (acc.code = '#39'11.02.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) excl_117'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and acct.is_current = 1'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'Y'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1074#1089#1077#1075#1086' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-5'#39' id'
      '            ,null parentid'
      '            ,'#39#1042' '#1090'.'#1095'. '#1074#1089#1077#1075#1086' '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1086#1081' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '            ,to_char(null) kbk'
      '            ,to_number(null) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      '            ,to_number(null) out_summa_itogo'
      '      from dual'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select '#39'-6'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,to_number(null) include_uv_avans'
      '      ,to_number(null) include_uv_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) excl_itogo'
      '      ,to_number(null) pay_other_acc'
      '      ,to_number(null) excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '      ,inst_itogo'
      'from ('
      '      select inst_itogo'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.02.01'#39')) ' +
        'and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst_itogo'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      
        '                    and nvl(dl.typesysname, '#39' '#39') in ('#39'DebtsMeasu' +
        'res'#39')'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'N'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      '--'#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1077#1085#1080', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102
      'select '#39'-7'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,null kbk'
      '      ,to_number(null) in_summa_itogo'
      '      ,inst_itogo'
      '      ,to_number(null) include_uv_avans'
      '      ,to_number(null) include_uv_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) excl_itogo'
      '      ,to_number(null) pay_other_acc'
      '      ,to_number(null) excl_117'
      '      ,to_number(null) out_summa_itogo'
      'from ('
      'select '#39#1042' '#1090'.'#1095'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084', '#1073#1077#1079#1085#1072#1076#1077#1078#1085#1099#1084' '#1082' '#1074#1079#1099#1089#1082#1072#1085#1080#1102#39' item_no'
      '      ,inst_itogo'
      'from ('
      '      select inst_itogo'
      '      from ('
      '            select sum(inst_itogo) inst_itogo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when ((acc.code in('#39'11.02.01'#39')) ' +
        'and acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst_itogo'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                     ,fdc_document_lst dl'
      '                     ,fdc_dict dic'
      
        '                  where (acct.operation_date between trunc(:bdat' +
        'e) and trunc(:edate))'
      '                    and acct.account_id = acc.id'
      '                    and :summarn = '#39'N'#39
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      
        '                    and nvl(dl.typesysname, '#39' '#39') in ('#39'DebtsMeasu' +
        'res'#39')'
      '                    and acct.payment_type_id = dic.id'
      
        '                    and fdc_is_paytype_peny(dic.code,acct.operat' +
        'ion_date) = '#39'Y'#39
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'where :summarn = '#39'N'#39
      'union all'
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,excl_itogo'
      '      ,pay_other_acc'
      '      ,excl_117'
      '      ,out_summa_itogo'
      'from ('
      '      select '#39'-2'#39' id'
      '            ,null parentid'
      '            ,to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else ' +
        '0 end),:ists) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '            ,to_number(null) excl_itogo'
      '            ,to_number(null) pay_other_acc'
      '            ,to_number(null) excl_117'
      
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
      040000000E000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000F000000494E434C5544455F434F4E4649524D0100000000000D0000
      00494E434C5544455F49544F474F0100000000000E000000494E5F53554D4D41
      5F49544F474F0100000000000A000000494E53545F49544F474F010000000000
      10000000494E434C5544455F55565F4156414E5301000000000012000000494E
      434C5544455F55565F43454C45564F590100000000000A0000004558434C5F49
      544F474F0100000000000D0000005041595F4F544845525F4143430100000000
      00080000004558434C5F3131370100000000000F0000004F55545F53554D4D41
      5F49544F474F010000000000}
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
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogINST_ITOGO: TFloatField
      FieldName = 'INST_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_UV_AVANS: TFloatField
      FieldName = 'INCLUDE_UV_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_UV_CELEVOY: TFloatField
      FieldName = 'INCLUDE_UV_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_CONFIRM: TFloatField
      FieldName = 'INCLUDE_CONFIRM'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_ITOGO: TFloatField
      FieldName = 'INCLUDE_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogEXCL_ITOGO: TFloatField
      FieldName = 'EXCL_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogPAY_OTHER_ACC: TFloatField
      FieldName = 'PAY_OTHER_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetItogEXCL_117: TFloatField
      FieldName = 'EXCL_117'
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
