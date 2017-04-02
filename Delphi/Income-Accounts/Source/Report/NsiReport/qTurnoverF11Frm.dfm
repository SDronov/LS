inherited qTurnoverF11Form: TqTurnoverF11Form
  Left = 232
  Top = 179
  Width = 890
  Caption = #1089#1095' 11.00.00'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 882
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInst_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewRest_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_uv_avans
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_uv_celevoy
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_confirm
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewExcl_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewZab_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewPay_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableView117_itogo
        end>
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
          Caption = #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080
          Position.BandIndex = 6
          Position.ColIndex = 0
        end
        item
          Caption = #1050#1041#1050' '#1072#1074#1072#1085#1089#1072
          Position.BandIndex = 7
          Position.ColIndex = 0
        end
        item
          Caption = #1094#1077#1083#1077#1074#1086#1075#1086' '#1050#1041#1050
          Position.BandIndex = 7
          Position.ColIndex = 1
        end
        item
          Caption = #1074' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
          Position.BandIndex = 6
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 6
          Position.ColIndex = 2
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
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'KBK'
        Width = 100
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInst_itogo: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'INST_ITOGO'
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRest_itogo: TcxGridDBBandedColumn
        Caption = '5'
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_uv_avans: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'INCLUDE_UV_AVANS'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_uv_celevoy: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCLUDE_UV_CELEVOY'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcl_itogo: TcxGridDBBandedColumn
        Caption = '10'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZab_itogo: TcxGridDBBandedColumn
        Caption = '11'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPay_itogo: TcxGridDBBandedColumn
        Caption = '12'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableView117_itogo: TcxGridDBBandedColumn
        Caption = '13'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 882
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.11.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1079 +
      #1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1080' '#1096#1090#1088#1072#1092#1072#1084'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,out_summa_itogo'
      'from ('
      '      select to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      
        '      ,(in_summa_itogo + inst_itogo - include_itogo) out_summa_i' +
        'togo'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(inst_itogo) inst_itogo'
      '      ,sum(include_uv_avans) include_uv_avans'
      '      ,sum(include_uv_celevoy) include_uv_celevoy'
      '      ,sum(include_confirm) include_confirm'
      '      ,sum(include_itogo) include_itogo'
      'from ('
      '      select row_number() over(order by kbk) item_no'
      '            ,kbk'
      '            ,('
      '              (select nvl(sum(ab.balance_sum_rur), 0) summa'
      '              from fdc_acc_balance_kbk ab'
      '              where (ab.account_id in ('
      '                                       select id'
      '                                       from fdc_acc_lst '
      
        '                                       start with id = :account_' +
        'id'
      
        '                                       connect by prior id = par' +
        'ent_id'
      '                                      )'
      '                    )'
      '                and (ab.balance_date <= trunc(:bdate))'
      '                and (ab.kbk_id = a.kbk_id)'
      '     '#9#9'    and (ab.is_current = 1))'
      '              +'
      '              (select nvl(sum(ar.reg_sum_rur), 0) summa'
      '              from fdc_acc_reg_kbk ar'
      
        '              where (ar.reg_date between last_day(add_months(:bd' +
        'ate, -1)) + 1 and trunc(:bdate) - 1)'
      '                and (ar.account_id in ('
      '                                       select id'
      '                                       from fdc_acc_lst '
      
        '                                       start with id = :account_' +
        'id'
      
        '                                       connect by prior id = par' +
        'ent_id'
      '                                      )'
      '                    )'
      '                and (ar.kbk_id = a.kbk_id)'
      '                and (ar.is_current = 1))'
      '             ) in_summa_itogo'
      '            ,inst_itogo'
      '            ,include_uv_avans'
      '            ,include_uv_celevoy'
      '            ,include_confirm'
      
        '            ,(include_uv_avans + include_uv_celevoy + include_co' +
        'nfirm) include_itogo'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,sum(inst_itogo) inst_itogo'
      '                  ,sum(include_uv_avans) include_uv_avans'
      '                  ,sum(include_uv_celevoy) include_uv_celevoy'
      '                  ,sum(include_confirm) include_confirm'
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
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_dict dict_kbk'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                    and acct.kbk_id = dict_kbk.id(+)'
      '                  )'
      '            group by kbk_id'
      '                    ,kbk'
      '           ) a'
      '      where inst_itogo != 0 '
      '         or include_uv_avans != 0'
      '         or include_uv_celevoy != 0'
      '         or include_confirm != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,kbk'
      '        ,in_summa_itogo'
      '        ,inst_itogo'
      '        ,include_uv_avans'
      '        ,include_uv_celevoy'
      '        ,include_confirm'
      '        ,include_itogo),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,inst_itogo'
      '      ,include_uv_avans'
      '      ,include_uv_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,out_summa_itogo'
      'from ('
      '      select to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '            ,to_number(null) inst_itogo'
      '            ,to_number(null) include_uv_avans'
      '            ,to_number(null) include_uv_celevoy'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      '      from dual'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000040000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000070000004954454D5F4E4F010000000000030000004B424B
      0100000000000A000000494E53545F49544F474F01000000000010000000494E
      434C5544455F55565F4156414E5301000000000012000000494E434C5544455F
      55565F43454C45564F590100000000000F000000494E434C5544455F434F4E46
      49524D0100000000000D000000494E434C5544455F49544F474F010000000000
      0E000000494E5F53554D4D415F49544F474F0100000000000F0000004F55545F
      53554D4D415F49544F474F010000000000}
    Left = 64
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
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
    object dsetDataOUT_SUMMA_ITOGO: TFloatField
      FieldName = 'OUT_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
