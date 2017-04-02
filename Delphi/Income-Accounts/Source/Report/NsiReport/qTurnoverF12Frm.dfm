inherited qTurnoverF12Form: TqTurnoverF12Form
  Left = 298
  Top = 284
  Width = 854
  Height = 342
  Caption = #1089#1095' 05.01.00 '
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 846
    Height = 289
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewreturn
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewinclude_uved
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
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 200
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1000
        end
        item
          Caption = #1055#1086#1076#1083#1077#1078#1080#1090' '#1074#1086#1079#1084#1077#1097#1077#1085#1080#1102' '#1080#1079' '#1073#1102#1076#1078#1077#1090#1072
          Position.BandIndex = 3
          Position.ColIndex = 0
          Width = 400
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074
          Position.BandIndex = 3
          Position.ColIndex = 1
          Width = 600
        end
        item
          Caption = #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
          Position.BandIndex = 5
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
          Position.BandIndex = 5
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 5
          Position.ColIndex = 2
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          FixedKind = fkRight
          Width = 200
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
        Width = 200
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewreturn: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'RETURN'
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewinclude_uved: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'INCLUDE_UVED'
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Width = 120
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.05.01.00 "'#1042#1086#1079#1084#1077#1097#1077#1085#1080#1077' '#1080#1079' '#1073#1102#1076#1078#1077#1090#1072'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      'from dual'
      'union all'
      'select item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,(in_summa_itogo + return - include_itogo) out_summa_itogo'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(return) return'
      '      ,sum(include_uved) include_uved'
      '      ,sum(include_confirm) include_confirm'
      '      ,sum(include_itogo) include_itogo'
      'from ('
      '      select row_number() over(order by kbk) item_no'
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
      '            ,kbk'
      '            ,return'
      '            ,include_uved'
      '            ,include_confirm'
      '            ,(include_uved+include_confirm) include_itogo'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,sum(return) return'
      '                  ,sum(include_uved) include_uved'
      '                  ,sum(include_confirm) include_confirm'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,p_oborotki.get_kbk_code(acct.kbk_id) kb' +
        'k'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) return'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and n' +
        'ot(fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSpecifyKind' +
        'Pay'#39',0) = 1 or fdc_object_type_is_subtype(ol.typesysname,'#39'Confir' +
        'mSpecifyKindPaySumm'#39',0) = 1 or nvl((select min(1) from fdc_payme' +
        'nt_deduction_lst pdl where pdl.id = acct.doc_id and pdl.kbkcode ' +
        '= pdl.kbkcode1),0) = 1)) then sum_rur else 0 end) include_uved'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and (' +
        'fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSpecifyKindPay' +
        #39',0) = 1 or fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSp' +
        'ecifyKindPaySumm'#39',0) = 1 or nvl((select min(1) from fdc_payment_' +
        'deduction_lst pdl where pdl.id = acct.doc_id and pdl.kbkcode = p' +
        'dl.kbkcode1),0) = 1)) then sum_rur else 0 end) include_confirm'
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
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                    and acct.doc_id = ol.id(+)'
      '                  )'
      '            group by kbk_id '
      '                    ,kbk'
      '           ) a'
      '      where return != 0 '
      '         or include_uved != 0 '
      '         or include_confirm != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,kbk'
      '        ,in_summa_itogo'
      '        ,return'
      '        ,include_uved'
      '        ,include_confirm'
      '        ,include_itogo),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select '#39#1042' '#1090'.'#1095'. '#1087#1088#1086#1094#1077#1085#1090#1099' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072#39' item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,(in_summa_itogo + return) out_summa_itogo'
      'from ('
      '      select to_char(null) item_no'
      '            ,to_char(null) kbk'
      
        '            ,nvl(p_oper_balans.get_bsumma(:account_percent_id,:a' +
        'ccount_percent_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0),0) in_summa_i' +
        'togo'
      
        '            ,nvl(p_oper_balans.get_isumma(:account_percent_id,:a' +
        'ccount_percent_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0)' +
        ',0) return'
      '            ,to_number(null) include_uved'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '      from dual'
      '     )'
      'union all'
      'select to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000150000003A4143434F554E545F50455243454E54
      5F434F4445050000000000000000000000130000003A4143434F554E545F5045
      5243454E545F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000070000004954454D5F4E4F010000000000030000004B424B
      0100000000000E000000494E5F53554D4D415F49544F474F0100000000000C00
      0000494E434C5544455F555645440100000000000F000000494E434C5544455F
      434F4E4649524D0100000000000D000000494E434C5544455F49544F474F0100
      000000000F0000004F55545F53554D4D415F49544F474F010000000000060000
      0052455455524E010000000000}
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 44
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 4000
    end
    object dsetDataIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_UVED: TFloatField
      FieldName = 'INCLUDE_UVED'
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
