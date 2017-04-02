inherited qTurnoverF12_1808Form: TqTurnoverF12_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 05.01.00'
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
          Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082' '
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
          Caption = #1059#1074#1048#1079#1083
          Position.BandIndex = 5
          Position.ColIndex = 0
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 5
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 5
          Position.ColIndex = 2
        end
        item
          Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
          FixedKind = fkRight
          Width = 200
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
      object grdTurnoverSheetDBBandedTableViewIN_SUMMA_ITOGO: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewreturn: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewinclude_uved: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'INCLUDE_UVED'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa_itogo: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 9
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
        Width = 40
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
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1055#1086#1076#1083#1077#1078#1080#1090' '#1074#1086#1079#1084#1077#1097#1077#1085#1080#1102' '#1080#1079' '#1073#1102#1076#1078#1077#1090#1072
        DataBinding.FieldName = 'RETURN'
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_U_AVANS: TcxGridDBColumn
        Caption = #1059#1074#1048#1079#1083
        DataBinding.FieldName = 'INCLUDE_UVED'
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
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA_ITOGO: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
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
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.05.01.00 "'#1042#1086#1079#1084#1077#1097#1077#1085#1080#1077' '#1080#1079' '#1073#1102#1076#1078#1077#1090#1072'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual'
      'union all'
      'select to_char(nvl(item_no_sort,0)) id'
      
        '      ,to_char((case when (item_no_sort is null) then null else ' +
        '0 end)) parentid'
      '      ,item_no'
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
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,sum(return) return'
      '      ,sum(include_uved) include_uved'
      '      ,sum(include_confirm) include_confirm'
      '      ,sum(include_itogo) include_itogo'
      'from ('
      '      select row_number() over(order by kbk) item_no'
      '            ,('
      
        '              select sum(p_oper_balans.get_bsumma_account_kbk( :' +
        'account_id, :account_code, :bdate, kd.id, 0,'#39'rur'#39','#39'rur'#39', case :s' +
        'ummarn WHEN '#39'Y'#39' THEN 1 ELSE 0 end , :ists ))'
      '              from fdc_kbk_dict_lst kd'
      '              where kd.code = kbk'
      '             ) in_summa_itogo'
      '            ,kbk'
      '            ,return'
      '            ,include_uved'
      '            ,include_confirm'
      '            ,(include_uved+include_confirm) include_itogo'
      '      from ('
      '            select kbk'
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
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = ol.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      '                  )'
      '            group by kbk'
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
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,(in_summa_itogo + return) out_summa_itogo'
      'from ('
      '      select '#39'-3'#39' id'
      '            ,null parentid'
      
        '            ,'#39#1042' '#1090'.'#1095'. '#1087#1088#1086#1094#1077#1085#1090#1099' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072#39' item' +
        '_no'
      '            ,to_char(null) kbk'
      '            ,to_number(null) in_summa_itogo'
      
        '            ,nvl(p_oper_balans.get_isumma(acc.id,acc.code,trunc(' +
        ':bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists),0) return'
      '            ,to_number(null) include_uved'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '      from fdc_acc_light_lst acc'
      '      where :summarn = '#39'N'#39
      '        and code = '#39'05.01.02'#39
      '        and acc.sdate <= trunc(:bdate)'
      '        and nvl(acc.edate,trunc(:bdate)) >= trunc(:bdate)'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
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
      040000000A000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000F000000494E434C5544455F434F4E4649524D0100000000000D0000
      00494E434C5544455F49544F474F0100000000000E000000494E5F53554D4D41
      5F49544F474F0100000000000600000052455455524E0100000000000C000000
      494E434C5544455F555645440100000000000F0000004F55545F53554D4D415F
      49544F474F010000000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Left = 81
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
  object dsetItog: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa_itogo'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,to_char(null) kbk'
      '      ,in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,(in_summa_itogo + return - include_itogo) out_summa_itogo'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      'from ('
      '      select return'
      '            ,include_uved'
      '            ,include_confirm'
      '            ,(include_uved+include_confirm) include_itogo'
      '      from ('
      '            select sum(return) return'
      '                  ,sum(include_uved) include_uved'
      '                  ,sum(include_confirm) include_confirm'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) return'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and n' +
        'ot(fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSpecifyKind' +
        'Pay'#39',0) = 1 or fdc_object_type_is_subtype(ol.typesysname,'#39'Confir' +
        'mSpecifyKindPaySumm'#39',0) = 1 or nvl((select min(1) from fdc_payme' +
        'nt_deduction_lst pdl where pdl.id = acct.doc_id and pdl.kbkcode_' +
        'id = pdl.kbkcode1_id),0) = 1)) then sum_rur else 0 end) include_' +
        'uved'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and (' +
        'fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSpecifyKindPay' +
        #39',0) = 1 or fdc_object_type_is_subtype(ol.typesysname,'#39'ConfirmSp' +
        'ecifyKindPaySumm'#39',0) = 1 or nvl((select min(1) from fdc_payment_' +
        'deduction_lst pdl where pdl.id = acct.doc_id and pdl.kbkcode_id ' +
        '= pdl.kbkcode1_id),0) = 1)) then sum_rur else 0 end) include_con' +
        'firm'
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
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = ol.id'
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
      'select id'
      '      ,parentid'
      '      ,item_no'
      '      ,kbk'
      '      ,in_summa_itogo'
      '      ,return'
      '      ,include_uved'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,(in_summa_itogo + return) out_summa_itogo'
      'from ('
      '      select '#39'-3'#39' id'
      '            ,null parentid'
      
        '            ,'#39#1042' '#1090'.'#1095'. '#1087#1088#1086#1094#1077#1085#1090#1099' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072#39' item' +
        '_no'
      '            ,to_char(null) kbk'
      '            ,to_number(null) in_summa_itogo'
      
        '            ,nvl(p_oper_balans.get_isumma(acc.id,acc.code,trunc(' +
        ':bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then' +
        ' 1 else 0 end),:ists),0) return'
      '            ,to_number(null) include_uved'
      '            ,to_number(null) include_confirm'
      '            ,to_number(null) include_itogo'
      '      from fdc_acc_light_lst acc'
      '      where :summarn = '#39'N'#39
      '        and code = '#39'05.01.02'#39
      '        and acc.sdate <= trunc(:bdate)'
      '        and nvl(acc.edate,trunc(:bdate)) >= trunc(:bdate)'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa_itogo'
      '      ,to_number(null) return'
      '      ,to_number(null) include_uved'
      '      ,to_number(null) include_confirm'
      '      ,to_number(null) include_itogo'
      
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
      040000000A000000070000004954454D5F4E4F01000000000002000000494401
      000000000008000000504152454E544944010000000000030000004B424B0100
      000000000F000000494E434C5544455F434F4E4649524D0100000000000D0000
      00494E434C5544455F49544F474F0100000000000E000000494E5F53554D4D41
      5F49544F474F0100000000000600000052455455524E0100000000000C000000
      494E434C5544455F555645440100000000000F0000004F55545F53554D4D415F
      49544F474F010000000000}
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
    object dsetItogRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_UVED: TFloatField
      FieldName = 'INCLUDE_UVED'
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
