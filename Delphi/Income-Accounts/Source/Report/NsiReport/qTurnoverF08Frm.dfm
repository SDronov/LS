inherited qTurnoverF08Form: TqTurnoverF08Form
  Left = 298
  Top = 284
  Width = 854
  Height = 342
  Caption = #1089#1095' 10.01.00 '
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
          Column = grdTurnoverSheetDBBandedTableViewNach_gtd
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNach_tpo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNach_others
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNach_itogo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_u_avans
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInclude_u_celevoy
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
          Column = grdTurnoverSheetDBBandedTableViewZadolg
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          Width = 40
        end
        item
          Caption = #1050#1041#1050
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1120
        end
        item
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Position.BandIndex = 3
          Position.ColIndex = 0
        end
        item
          Caption = #1043#1058#1044
          Position.BandIndex = 4
          Position.ColIndex = 0
        end
        item
          Caption = #1058#1055#1054
          Position.BandIndex = 4
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1085#1099#1077
          Position.BandIndex = 4
          Position.ColIndex = 2
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 4
          Position.ColIndex = 3
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086
          Position.BandIndex = 3
          Position.ColIndex = 1
        end
        item
          Caption = #1074' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1050#1041#1050' '#1072#1074#1072#1085#1089#1072
          Position.BandIndex = 10
          Position.ColIndex = 0
        end
        item
          Caption = #1094#1077#1083#1077#1074#1086#1075#1086' '#1050#1041#1050
          Position.BandIndex = 10
          Position.ColIndex = 1
        end
        item
          Caption = #1074' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
          Position.BandIndex = 3
          Position.ColIndex = 2
          Width = 60
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          FixedKind = fkRight
          Width = 100
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
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_gtd: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'NACH_GTD'
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_tpo: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'NACH_TPO'
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_others: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'NACH_OTHERS'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_itogo: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'NACH_ITOGO'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_u_avans: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'INCLUDE_U_AVANS'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_u_celevoy: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'INCLUDE_U_CELEVOY'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'ZADOLG'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.10.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1085 +
      #1072#1095#1080#1089#1083#1077#1085#1080#1102' '#1087#1083#1072#1090#1077#1078#1077#1081'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_number(null) nach_gtd'
      '      ,to_number(null) nach_tpo'
      '      ,to_number(null) nach_others'
      '      ,to_number(null) nach_itogo'
      '      ,to_number(null) include_u_avans'
      '      ,to_number(null) include_u_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      'select item_no'
      '      ,kbk'
      '      ,in_summa'
      '      ,nach_gtd'
      '      ,nach_tpo'
      '      ,nach_others'
      '      ,nach_itogo'
      '      ,include_u_avans'
      '      ,include_u_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,zadolg'
      
        '      ,(in_summa + nach_itogo - include_itogo - zadolg) out_summ' +
        'a'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      '      ,kbk'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa'
      '       end) in_summa'
      '      ,sum(nach_gtd) nach_gtd'
      '      ,sum(nach_tpo) nach_tpo'
      '      ,sum(nach_others) nach_others'
      '      ,sum(nach_itogo) nach_itogo'
      '      ,sum(include_u_avans) include_u_avans'
      '      ,sum(include_u_celevoy) include_u_celevoy'
      '      ,sum(include_confirm) include_confirm'
      '      ,sum(include_itogo) include_itogo'
      '      ,sum(zadolg) zadolg'
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
      '             ) in_summa'
      '            ,kbk'
      '            ,nach_gtd'
      '            ,nach_tpo'
      '            ,nach_others'
      '            ,(nach_gtd+nach_tpo+nach_others) nach_itogo'
      '            ,include_u_avans'
      '            ,include_u_celevoy'
      '            ,include_confirm'
      
        '            ,(include_u_avans+include_u_celevoy+include_confirm)' +
        ' include_itogo'
      '            ,zadolg'
      '      from ('
      '            select kbk_id'
      '                  ,kbk'
      '                  ,sum(nach_gtd) nach_gtd'
      '                  ,sum(nach_tpo) nach_tpo'
      '                  ,sum(nach_others) nach_others'
      '                  ,sum(include_u_avans) include_u_avans'
      '                  ,sum(include_u_celevoy) include_u_celevoy'
      '                  ,sum(include_confirm) include_confirm'
      '                  ,sum(zadolg) zadolg'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,p_oborotki.get_kbk_code(acct.kbk_id) kb' +
        'k'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 1)) t' +
        'hen sum_rur else 0 end) nach_gtd'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'TPO'#39',0) = 1)) then sum' +
        '_rur else 0 end) nach_tpo'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 0) an' +
        'd (fdc_object_type_is_subtype(ol.typesysname,'#39'TPO'#39',0) = 0)) then' +
        ' sum_rur else 0 end) nach_others'
      
        '                        ,-(case  when (acc.code = '#39'10.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_u_avans'
      
        '                        ,-(case  when (acc.code = '#39'10.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_u_celevoy'
      
        '                        ,-(case  when (acc.code = '#39'10.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) include_confirm'
      
        '                        ,-(case  when (acc.code = '#39'10.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) zadolg'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_decl_charge dc'
      '                      ,fdc_object_lst  ol'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                    and acct.doc_id = dc.id(+)'
      '                    and dc.decl_id = ol.id(+)'
      '                  )'
      '            group by kbk_id '
      '                    ,kbk'
      '           ) a'
      '      where nach_gtd != 0 '
      '         or nach_tpo != 0 '
      '         or nach_others != 0 '
      '         or include_u_avans != 0 '
      '         or include_u_celevoy != 0 '
      '         or include_confirm != 0'
      '         or zadolg != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,kbk'
      '        ,in_summa'
      '        ,nach_gtd'
      '        ,nach_tpo'
      '        ,nach_others'
      '        ,nach_itogo'
      '        ,include_u_avans'
      '        ,include_u_celevoy'
      '        ,include_confirm'
      '        ,include_itogo'
      '        ,zadolg),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_number(null) nach_gtd'
      '      ,to_number(null) nach_tpo'
      '      ,to_number(null) nach_others'
      '      ,to_number(null) nach_itogo'
      '      ,to_number(null) include_u_avans'
      '      ,to_number(null) include_u_celevoy'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000040000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000019000000070000004954454D5F4E4F0100000000000E0000004F5045
      524154494F4E5F4441544501000000000008000000494E5F53554D4D41010000
      00000003000000494E4E010000000000040000004E414D450100000000000300
      000046494F0100000000000A000000444F435F4E554D42455201000000000009
      0000004F55545F53554D4D41010000000000080000004E4143485F4754440100
      00000000080000004E4143485F54504F0100000000000B0000004E4143485F4F
      54484552530100000000000A0000004E4143485F49544F474F01000000000008
      000000504149445F47544401000000000008000000504149445F54504F010000
      0000000B000000504149445F4F54484552530100000000000A00000050414944
      5F49544F474F010000000000080000004E4143485F4B424B0100000000000900
      000050505F4E554D4245520100000000000700000050505F4441544501000000
      00000800000050505F53554D4D410100000000000600000050505F4B424B0100
      000000000B0000004E5041595F4E554D424552010000000000090000004E5041
      595F444154450100000000000A0000004E5041595F53554D4D41010000000000
      060000005A41444F4C47010000000000}
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 4000
    end
    object dsetDataNACH_GTD: TFloatField
      FieldName = 'NACH_GTD'
      DisplayFormat = ',0.00'
    end
    object dsetDataNACH_TPO: TFloatField
      FieldName = 'NACH_TPO'
      DisplayFormat = ',0.00'
    end
    object dsetDataNACH_OTHERS: TFloatField
      FieldName = 'NACH_OTHERS'
      DisplayFormat = ',0.00'
    end
    object dsetDataNACH_ITOGO: TFloatField
      FieldName = 'NACH_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_U_AVANS: TFloatField
      FieldName = 'INCLUDE_U_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCLUDE_U_CELEVOY: TFloatField
      FieldName = 'INCLUDE_U_CELEVOY'
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
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataZADOLG: TFloatField
      FieldName = 'ZADOLG'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
