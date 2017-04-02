inherited qTurnoverF08_1808Form: TqTurnoverF08_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 10.01.00'
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
          Width = 40
        end
        item
          Caption = #1050#1041#1050
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
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
          Caption = #1044#1058
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
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074
          Position.BandIndex = 3
          Position.ColIndex = 1
        end
        item
          Caption = #1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1059#1074#1040
          Position.BandIndex = 10
          Position.ColIndex = 0
        end
        item
          Caption = #1059#1074#1062
          Position.BandIndex = 10
          Position.ColIndex = 1
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = #1080#1090#1086#1075#1086
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083'-'#1090#1100
          Position.BandIndex = 3
          Position.ColIndex = 2
          Width = 60
        end
        item
          Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
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
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_gtd: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'NACH_GTD'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_tpo: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'NACH_TPO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_others: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'NACH_OTHERS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNach_itogo: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'NACH_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_u_avans: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'INCLUDE_U_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_u_celevoy: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'INCLUDE_U_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_confirm: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'INCLUDE_CONFIRM'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInclude_itogo: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'INCLUDE_ITOGO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'ZADOLG'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 16
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
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Hidden = True
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNACH_GTD: TcxGridDBColumn
        Caption = #1044#1058
        DataBinding.FieldName = 'NACH_GTD'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNACH_TPO: TcxGridDBColumn
        Caption = #1058#1055#1054
        DataBinding.FieldName = 'NACH_TPO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNACH_OTHERS: TcxGridDBColumn
        Caption = #1080#1085#1099#1077
        DataBinding.FieldName = 'NACH_OTHERS'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNACH_ITOGO: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086
        DataBinding.FieldName = 'NACH_ITOGO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_U_AVANS: TcxGridDBColumn
        Caption = #1059#1074#1040
        DataBinding.FieldName = 'INCLUDE_U_AVANS'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCLUDE_U_CELEVOY: TcxGridDBColumn
        Caption = #1059#1074#1062
        DataBinding.FieldName = 'INCLUDE_U_CELEVOY'
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
      object grdTurnoverSheetDBBandedTableDViewZadolg: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083'-'#1090#1100
        DataBinding.FieldName = 'ZADOLG'
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.10.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1085 +
      #1072#1095#1080#1089#1083#1077#1085#1080#1102' '#1087#1083#1072#1090#1077#1078#1077#1081'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) kbk'
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
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select to_char(nvl(item_no_sort,0)) id'
      
        '      ,to_char((case when (item_no_sort is null) then null else ' +
        '0 end)) parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,kbk'
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
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
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
      
        '              select sum(p_oper_balans.get_bsumma_account_kbk( :' +
        'account_id, :account_code, :bdate, kd.id, 0,'#39'rur'#39','#39'rur'#39',0,:ists)' +
        ')'
      '              from fdc_kbk_dict_lst kd'
      '              where kd.code = a.kbk'
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
      '            select kbk'
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
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 1 or ' +
        'fdc_object_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'Cust' +
        'omDecl'#39',0) = 1)) then sum_rur else 0 end) nach_gtd'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'TPO'#39',0) = 1 or fdc_obj' +
        'ect_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'TPO'#39',0) = 1' +
        ')) then sum_rur else 0 end) nach_tpo'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 0) an' +
        'd (fdc_object_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'C' +
        'ustomDecl'#39',0) = 0) and (fdc_object_type_is_subtype(ol.typesysnam' +
        'e,'#39'TPO'#39',0) = 0) and (fdc_object_type_is_subtype(nvl(ol_cd.typesy' +
        'sname,'#39'Object'#39'),'#39'TPO'#39',0) = 0)) then sum_rur else 0 end) nach_oth' +
        'ers'
      
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
      '                      ,fdc_document_lst dl'
      '                      ,fdc_decl_charge dc'
      '                      ,fdc_object_lst  ol'
      '                      ,fdc_correction_doc cd'
      '                      ,fdc_object_lst  ol_cd'
      
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
      '                    and acct.doc_id = dc.id(+)'
      '                    and dc.decl_id = ol.id(+)'
      '                    and acct.doc_id = cd.id(+)'
      '                    and cd.doc_id = ol_cd.id(+)'
      '                  )'
      '            group by kbk'
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
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) kbk'
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
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E54494401000000000003000000
      4B424B010000000000080000004E4143485F475444010000000000080000004E
      4143485F54504F0100000000000B0000004E4143485F4F544845525301000000
      00000A0000004E4143485F49544F474F0100000000000F000000494E434C5544
      455F555F4156414E5301000000000011000000494E434C5544455F555F43454C
      45564F590100000000000F000000494E434C5544455F434F4E4649524D010000
      0000000D000000494E434C5544455F49544F474F010000000000060000005A41
      444F4C47010000000000}
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
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
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
    object dsetDataZADOLG: TFloatField
      FieldName = 'ZADOLG'
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
      '      ,to_char(null) kbk'
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
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,kbk'
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
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      '      ,to_char(null) kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,nach_gtd'
      '      ,nach_tpo'
      '      ,nach_others'
      '      ,nach_itogo'
      '      ,include_u_avans'
      '      ,include_u_celevoy'
      '      ,include_confirm'
      '      ,include_itogo'
      '      ,zadolg'
      'from ('
      '      select nach_gtd'
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
      '            select nvl(sum(nach_gtd),0) nach_gtd'
      '                  ,nvl(sum(nach_tpo),0) nach_tpo'
      '                  ,nvl(sum(nach_others),0) nach_others'
      '                  ,nvl(sum(include_u_avans),0) include_u_avans'
      
        '                  ,nvl(sum(include_u_celevoy),0) include_u_celev' +
        'oy'
      '                  ,nvl(sum(include_confirm),0) include_confirm'
      '                  ,nvl(sum(zadolg),0) zadolg'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 1 or ' +
        'fdc_object_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'Cust' +
        'omDecl'#39',0) = 1)) then sum_rur else 0 end) nach_gtd'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'TPO'#39',0) = 1 or fdc_obj' +
        'ect_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'TPO'#39',0) = 1' +
        ')) then sum_rur else 0 end) nach_tpo'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39' and (f' +
        'dc_object_type_is_subtype(ol.typesysname,'#39'CustomDecl'#39',0) = 0) an' +
        'd (fdc_object_type_is_subtype(nvl(ol_cd.typesysname,'#39'Object'#39'),'#39'C' +
        'ustomDecl'#39',0) = 0) and (fdc_object_type_is_subtype(ol.typesysnam' +
        'e,'#39'TPO'#39',0) = 0) and (fdc_object_type_is_subtype(nvl(ol_cd.typesy' +
        'sname,'#39'Object'#39'),'#39'TPO'#39',0) = 0)) then sum_rur else 0 end) nach_oth' +
        'ers'
      
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
      '                      ,fdc_document_lst dl'
      '                      ,fdc_decl_charge dc'
      '                      ,fdc_object_lst  ol'
      '                      ,fdc_correction_doc cd'
      '                      ,fdc_object_lst  ol_cd'
      
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
      '                    and acct.doc_id = dc.id(+)'
      '                    and dc.decl_id = ol.id(+)'
      '                    and acct.doc_id = cd.id(+)'
      '                    and cd.doc_id = ol_cd.id(+)'
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
      '      ,to_char(null) kbk'
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
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E54494401000000000003000000
      4B424B010000000000080000004E4143485F475444010000000000080000004E
      4143485F54504F0100000000000B0000004E4143485F4F544845525301000000
      00000A0000004E4143485F49544F474F0100000000000F000000494E434C5544
      455F555F4156414E5301000000000011000000494E434C5544455F555F43454C
      45564F590100000000000F000000494E434C5544455F434F4E4649524D010000
      0000000D000000494E434C5544455F49544F474F010000000000060000005A41
      444F4C47010000000000}
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
    object dsetItogIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogNACH_GTD: TFloatField
      FieldName = 'NACH_GTD'
      DisplayFormat = ',0.00'
    end
    object dsetItogNACH_TPO: TFloatField
      FieldName = 'NACH_TPO'
      DisplayFormat = ',0.00'
    end
    object dsetItogNACH_OTHERS: TFloatField
      FieldName = 'NACH_OTHERS'
      DisplayFormat = ',0.00'
    end
    object dsetItogNACH_ITOGO: TFloatField
      FieldName = 'NACH_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_U_AVANS: TFloatField
      FieldName = 'INCLUDE_U_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetItogINCLUDE_U_CELEVOY: TFloatField
      FieldName = 'INCLUDE_U_CELEVOY'
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
    object dsetItogZADOLG: TFloatField
      FieldName = 'ZADOLG'
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
end
