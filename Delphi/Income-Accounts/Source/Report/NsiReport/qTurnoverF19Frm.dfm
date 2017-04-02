inherited qTurnoverF19Form: TqTurnoverF19Form
  Left = 231
  Top = 245
  Width = 854
  Caption = #1089#1095' 11.05.00.'#1079#1072#1073' '
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 846
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIn_pay
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIn_peny
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIn_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewRestored_pay
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewRestored_peny
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewRestored_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewExcluded_pay
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewExcluded_peny
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewExcluded_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewDop_peny
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1076#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
          FixedKind = fkLeft
          Width = 80
        end
        item
          Caption = #1050#1041#1050
          FixedKind = fkLeft
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 300
        end
        item
          Caption = #1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084' '
          Position.BandIndex = 3
          Position.ColIndex = 0
          Width = 73
        end
        item
          Caption = #1087#1086' '#1087#1077#1085#1103#1084
          Position.BandIndex = 3
          Position.ColIndex = 1
          Width = 82
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 3
          Position.ColIndex = 2
          Width = 85
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1000
        end
        item
          Caption = #1055#1088#1080#1085#1103#1090#1086' '#1085#1072' '#1091#1095#1077#1090' '
          Position.BandIndex = 7
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
          Position.BandIndex = 8
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086' '#1087#1077#1085#1103#1084
          Position.BandIndex = 8
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 8
          Position.ColIndex = 2
        end
        item
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
          Position.BandIndex = 7
          Position.ColIndex = 1
        end
        item
          Caption = #1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
          Position.BandIndex = 12
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086' '#1087#1077#1085#1103#1084
          Position.BandIndex = 12
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 12
          Position.ColIndex = 2
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1080#1079' '#1091#1095#1077#1090#1072
          Position.BandIndex = 7
          Position.ColIndex = 3
        end
        item
          Caption = #1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
          Position.BandIndex = 16
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086' '#1087#1077#1085#1103#1084
          Position.BandIndex = 16
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 16
          Position.ColIndex = 2
        end
        item
          Caption = #1044#1086#1085#1072#1095#1080#1089#1083#1077#1085#1086' '#1087#1077#1085#1077#1081
          Position.BandIndex = 7
          Position.ColIndex = 2
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          FixedKind = fkRight
          Width = 300
        end
        item
          Caption = #1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084' '
          FixedKind = fkRight
          Position.BandIndex = 21
          Position.ColIndex = 0
          Width = 88
        end
        item
          Caption = #1087#1086' '#1087#1077#1085#1103#1084
          FixedKind = fkRight
          Position.BandIndex = 21
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = #1080#1090#1086#1075#1086
          FixedKind = fkRight
          Position.BandIndex = 21
          Position.ColIndex = 2
          Width = 77
        end>
      object grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'ITEM_NO'
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOperation_date: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'OPERATION_DATE'
        Width = 80
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'KBK'
        Width = 200
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_pay: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'IN_SUMMA_AVSNS'
        Width = 120
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_peny: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'IN_SUMMA_CELEVOY'
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'IN_SUMMA_EXTPAY'
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_pay: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'IN_UVED_AVANS_GOODS'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_peny: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'IN_UVED_AVANS_ZADOLG'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_itogo: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IN_UVED_AVANS_ITOGO'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRestored_pay: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'IN_UVED_CELEVOY_GOODS'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRestored_peny: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'IN_UVED_CELEVOY_ZADOLG'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRestored_itogo: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'IN_UVED_CELEVOY_ITOGO'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcluded_pay: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'OUT_UVED_AVANS'
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcluded_peny: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'OUT_UVED_CELEVOY'
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcluded_itogo: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'OUT_UVED_EXTPAY'
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDop_peny: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'IN_UVED_EXTPAY'
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_pay: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'OUT_SUMMA_AVSNS'
        Width = 120
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_peny: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'OUT_SUMMA_CELEVOY'
        Position.BandIndex = 23
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '19'
        DataBinding.FieldName = 'OUT_SUMMA_EXTPAY'
        Position.BandIndex = 24
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      '      ,to_date(null) operation_date'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkavans_id,:account_kb' +
        'kavans_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_avsns'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkcelevoy_id,:account_' +
        'kbkcelevoy_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_celevoy'
      
        '      ,p_oper_balans.get_bsumma(:account_extpay_id,:account_extp' +
        'ay_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_extpay'
      '      ,to_number(null) in_uved_avans_goods'
      '      ,to_number(null) in_uved_avans_zadolg'
      '      ,to_number(null) in_uved_avans_itogo'
      '      ,to_number(null) in_uved_celevoy_goods'
      '      ,to_number(null) in_uved_celevoy_zadolg'
      '      ,to_number(null) in_uved_celevoy_itogo'
      '      ,to_number(null) in_uved_extpay'
      '      ,to_number(null) out_uved_avans'
      '      ,to_number(null) out_uved_celevoy'
      '      ,to_number(null) out_uved_extpay'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkavans_id,:account_kb' +
        'kavans_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_avsns'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkcelevoy_id,:account_' +
        'kbkcelevoy_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_celev' +
        'oy'
      
        '      ,p_oper_balans.get_bsumma(:account_extpay_id,:account_extp' +
        'ay_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_extpay'
      'from dual'
      'union all'
      'select item_no'
      '      ,operation_date'
      '      ,kbk'
      '      ,in_summa_avsns'
      '      ,in_summa_celevoy'
      '      ,in_summa_extpay'
      '      ,in_uved_avans_goods'
      '      ,in_uved_avans_zadolg'
      '      ,in_uved_avans_itogo'
      '      ,in_uved_celevoy_goods'
      '      ,in_uved_celevoy_zadolg'
      '      ,in_uved_celevoy_itogo'
      '      ,in_uved_extpay'
      '      ,out_uved_avans'
      '      ,out_uved_celevoy'
      '      ,out_uved_extpay'
      
        '      ,(in_summa_avsns + in_uved_avans_itogo - out_uved_avans) o' +
        'ut_summa_avsns'
      
        '      ,(in_summa_celevoy + in_uved_celevoy_itogo - out_uved_cele' +
        'voy) out_summa_celevoy'
      
        '      ,(in_summa_extpay + in_uved_extpay - out_uved_extpay) out_' +
        'summa_extpay'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,operation_date'
      '      ,kbk'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_kbkavans_id,:account_kbkavans_code,trunc(:bdate),0,'#39'r' +
        'ur'#39','#39'rur'#39',0)'
      '                                    else in_summa_avsns'
      '       end) in_summa_avsns'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_kbkcelevoy_id,:account_kbkcelevoy_code,trunc(:bdate),' +
        '0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa_celevoy'
      '       end) in_summa_celevoy'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_extpay_id,:account_extpay_code,trunc(:bdate),0,'#39'rur'#39',' +
        #39'rur'#39',0)'
      '                                    else in_summa_extpay'
      '       end) in_summa_extpay'
      '      ,sum(in_uved_avans_goods) in_uved_avans_goods'
      '      ,sum(in_uved_avans_zadolg) in_uved_avans_zadolg'
      '      ,sum(in_uved_avans_itogo) in_uved_avans_itogo'
      '      ,sum(in_uved_celevoy_goods) in_uved_celevoy_goods'
      '      ,sum(in_uved_celevoy_zadolg) in_uved_celevoy_zadolg'
      '      ,sum(in_uved_celevoy_itogo) in_uved_celevoy_itogo'
      '      ,sum(in_uved_extpay) in_uved_extpay'
      '      ,sum(out_uved_avans) out_uved_avans'
      '      ,sum(out_uved_celevoy) out_uved_celevoy'
      '      ,sum(out_uved_extpay) out_uved_extpay'
      'from ('
      
        '      select row_number() over(order by operation_date, kbk) ite' +
        'm_no'
      '            ,operation_date'
      '            ,kbk'
      '            ,('
      '              (select nvl(sum(ab.balance_sum_rur), 0) summa'
      '              from fdc_acc_balance_kbk ab'
      '              where (ab.account_id = :account_kbkavans_id)'
      '                and (ab.balance_date <= trunc(:bdate))'
      '                and (ab.kbk_id = a.kbk_id)'
      '     '#9#9'    and (ab.is_current = 1))'
      '              +'
      '              (select nvl(sum(ar.reg_sum_rur), 0) summa'
      '              from fdc_acc_reg_kbk ar'
      
        '              where (ar.reg_date between last_day(add_months(:bd' +
        'ate, -1)) + 1 and trunc(:bdate) - 1)'
      '                and (ar.account_id = :account_kbkavans_id)'
      '                and (ar.kbk_id = a.kbk_id)'
      '                and (ar.is_current = 1))'
      '             ) in_summa_avsns'
      '            ,('
      '              (select nvl(sum(ab.balance_sum_rur), 0) summa'
      '              from fdc_acc_balance_kbk ab'
      '              where (ab.account_id = :account_kbkcelevoy_id)'
      '                and (ab.balance_date <= trunc(:bdate))'
      '                and (ab.kbk_id = a.kbk_id)'
      '     '#9#9'    and (ab.is_current = 1))'
      '              +'
      '              (select nvl(sum(ar.reg_sum_rur), 0) summa'
      '              from fdc_acc_reg_kbk ar'
      
        '              where (ar.reg_date between last_day(add_months(:bd' +
        'ate, -1)) + 1 and trunc(:bdate) - 1)'
      '                and (ar.account_id = :account_kbkcelevoy_id)'
      '                and (ar.kbk_id = a.kbk_id)'
      '                and (ar.is_current = 1))'
      '             ) in_summa_celevoy'
      '            ,('
      '              (select nvl(sum(ab.balance_sum_rur), 0) summa'
      '              from fdc_acc_balance_kbk ab'
      '              where (ab.account_id = :account_extpay_id)'
      '                and (ab.balance_date <= trunc(:bdate))'
      '                and (ab.kbk_id = a.kbk_id)'
      '     '#9#9'    and (ab.is_current = 1))'
      '              +'
      '              (select nvl(sum(ar.reg_sum_rur), 0) summa'
      '              from fdc_acc_reg_kbk ar'
      
        '              where (ar.reg_date between last_day(add_months(:bd' +
        'ate, -1)) + 1 and trunc(:bdate) - 1)'
      '                and (ar.account_id = :account_extpay_id)'
      '                and (ar.kbk_id = a.kbk_id)'
      '                and (ar.is_current = 1))'
      '             ) in_summa_extpay'
      '            ,in_uved_avans_goods'
      '            ,in_uved_avans_zadolg'
      
        '            ,(in_uved_avans_goods + in_uved_avans_zadolg) in_uve' +
        'd_avans_itogo'
      '            ,in_uved_celevoy_goods'
      '            ,in_uved_celevoy_zadolg'
      
        '            ,(in_uved_celevoy_goods + in_uved_celevoy_zadolg) in' +
        '_uved_celevoy_itogo'
      '            ,in_uved_extpay'
      '            ,out_uved_avans'
      '            ,out_uved_celevoy'
      '            ,out_uved_extpay'
      '      from ('
      '            select operation_date'
      '                  ,kbk_id'
      '                  ,kbk'
      '                  ,sum(in_uved_avans_goods) in_uved_avans_goods'
      
        '                  ,sum(in_uved_avans_zadolg) in_uved_avans_zadol' +
        'g'
      
        '                  ,sum(in_uved_celevoy_goods) in_uved_celevoy_go' +
        'ods'
      
        '                  ,sum(in_uved_celevoy_zadolg) in_uved_celevoy_z' +
        'adolg'
      '                  ,sum(in_uved_extpay) in_uved_extpay'
      '                  ,sum(out_uved_avans) out_uved_avans'
      '                  ,sum(out_uved_celevoy) out_uved_celevoy'
      '                  ,sum(out_uved_extpay) out_uved_extpay'
      '            from ('
      '                  select acct.doc_id'
      '                        ,acct.kbk_id'
      
        '                        ,p_oborotki.get_kbk_code(acct.kbk_id) kb' +
        'k'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acc.code = '#39'12.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39' and ol.typesysname = '#39'DeclPayment'#39') then sum' +
        '_rur else 0 end) in_uved_avans_goods'
      
        '                        ,(case  when (acc.code = '#39'12.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39' and nvl(ol.typesysname,'#39' '#39') != '#39'DeclPayment'#39 +
        ') then sum_rur else 0 end) in_uved_avans_zadolg'
      
        '                        ,(case  when (acc.code = '#39'12.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39' and ol.typesysname = '#39'DeclPayment'#39') then sum' +
        '_rur else 0 end) in_uved_celevoy_goods'
      
        '                        ,(case  when (acc.code = '#39'12.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39' and nvl(ol.typesysname,'#39' '#39') != '#39'DeclPayment'#39 +
        ') then sum_rur else 0 end) in_uved_celevoy_zadolg'
      
        '                        ,(case  when (acc.code = '#39'12.01.03'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) in_uved_extpay'
      
        '                        ,-(case  when (acc.code = '#39'12.01.01'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_uved_avans'
      
        '                        ,-(case  when (acc.code = '#39'12.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_uved_celevoy'
      
        '                        ,-(case  when (acc.code = '#39'12.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_uved_extpay'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_object_lst ol'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      
        '                    and (p_oborotki.is_doc_this_type(acct.doc_id' +
        ','#39'DocChildsBalance'#39') = 0)'
      '                    and acct.account_id = acc.id'
      '                    and acct.doc_id = ol.id(+)'
      '                  )'
      '            group by operation_date'
      '                    ,kbk_id '
      '                    ,kbk'
      '           ) a'
      '      where in_uved_avans_goods != 0'
      '         or in_uved_avans_zadolg != 0'
      '         or in_uved_celevoy_goods != 0'
      '         or in_uved_celevoy_zadolg != 0'
      '         or in_uved_extpay != 0'
      '         or out_uved_avans != 0'
      '         or out_uved_celevoy != 0'
      '         or out_uved_extpay != 0'
      '      order by 1'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,operation_date'
      '        ,kbk'
      '        ,in_summa_avsns'
      '        ,in_summa_celevoy'
      '        ,in_summa_extpay'
      '        ,in_uved_avans_goods'
      '        ,in_uved_avans_zadolg'
      '        ,in_uved_avans_itogo'
      '        ,in_uved_celevoy_goods'
      '        ,in_uved_celevoy_zadolg'
      '        ,in_uved_celevoy_itogo'
      '        ,in_uved_extpay'
      '        ,out_uved_avans'
      '        ,out_uved_celevoy'
      '        ,out_uved_extpay),())'
      '     )'
      'union all'
      'select to_char(null) item_no'
      '      ,to_date(null) operation_date'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkavans_id,:account_kb' +
        'kavans_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_avsns'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkcelevoy_id,:account_' +
        'kbkcelevoy_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_celevoy'
      
        '      ,p_oper_balans.get_bsumma(:account_extpay_id,:account_extp' +
        'ay_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_extpay'
      '      ,to_number(null) in_uved_avans_goods'
      '      ,to_number(null) in_uved_avans_zadolg'
      '      ,to_number(null) in_uved_avans_itogo'
      '      ,to_number(null) in_uved_celevoy_goods'
      '      ,to_number(null) in_uved_celevoy_zadolg'
      '      ,to_number(null) in_uved_celevoy_itogo'
      '      ,to_number(null) in_uved_extpay'
      '      ,to_number(null) out_uved_avans'
      '      ,to_number(null) out_uved_celevoy'
      '      ,to_number(null) out_uved_extpay'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkavans_id,:account_kb' +
        'kavans_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_avsns'
      
        '      ,p_oper_balans.get_bsumma(:account_kbkcelevoy_id,:account_' +
        'kbkcelevoy_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_celev' +
        'oy'
      
        '      ,p_oper_balans.get_bsumma(:account_extpay_id,:account_extp' +
        'ay_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_extpay'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000040000000B0000003A4143434F554E545F4944030000000000000000
      000000060000003A42444154450C0000000000000000000000060000003A4544
      4154450C00000000000000000000000D0000003A4143434F554E545F434F4445
      050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000013000000070000004954454D5F4E4F0100000000000E0000004F5045
      524154494F4E5F44415445010000000000030000004B424B0100000000000E00
      0000494E5F53554D4D415F4156534E5301000000000010000000494E5F53554D
      4D415F43454C45564F590100000000000F000000494E5F53554D4D415F455854
      50415901000000000013000000494E5F555645445F4156414E535F474F4F4453
      01000000000014000000494E5F555645445F4156414E535F5A41444F4C470100
      0000000013000000494E5F555645445F4156414E535F49544F474F0100000000
      0015000000494E5F555645445F43454C45564F595F474F4F4453010000000000
      16000000494E5F555645445F43454C45564F595F5A41444F4C47010000000000
      15000000494E5F555645445F43454C45564F595F49544F474F0100000000000E
      000000494E5F555645445F4558545041590100000000000E0000004F55545F55
      5645445F4156414E53010000000000100000004F55545F555645445F43454C45
      564F590100000000000F0000004F55545F555645445F45585450415901000000
      00000F0000004F55545F53554D4D415F4156534E53010000000000110000004F
      55545F53554D4D415F43454C45564F59010000000000100000004F55545F5355
      4D4D415F455854504159010000000000}
    Left = 64
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
    end
    object dsetDataOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 4000
    end
    object dsetDataIN_SUMMA_AVSNS: TFloatField
      FieldName = 'IN_SUMMA_AVSNS'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_SUMMA_CELEVOY: TFloatField
      FieldName = 'IN_SUMMA_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_SUMMA_EXTPAY: TFloatField
      FieldName = 'IN_SUMMA_EXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_AVANS_GOODS: TFloatField
      FieldName = 'IN_UVED_AVANS_GOODS'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_AVANS_ZADOLG: TFloatField
      FieldName = 'IN_UVED_AVANS_ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_AVANS_ITOGO: TFloatField
      FieldName = 'IN_UVED_AVANS_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_CELEVOY_GOODS: TFloatField
      FieldName = 'IN_UVED_CELEVOY_GOODS'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_CELEVOY_ZADOLG: TFloatField
      FieldName = 'IN_UVED_CELEVOY_ZADOLG'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_CELEVOY_ITOGO: TFloatField
      FieldName = 'IN_UVED_CELEVOY_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED_EXTPAY: TFloatField
      FieldName = 'IN_UVED_EXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_UVED_AVANS: TFloatField
      FieldName = 'OUT_UVED_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_UVED_CELEVOY: TFloatField
      FieldName = 'OUT_UVED_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_UVED_EXTPAY: TFloatField
      FieldName = 'OUT_UVED_EXTPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA_AVSNS: TFloatField
      FieldName = 'OUT_SUMMA_AVSNS'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA_CELEVOY: TFloatField
      FieldName = 'OUT_SUMMA_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA_EXTPAY: TFloatField
      FieldName = 'OUT_SUMMA_EXTPAY'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
