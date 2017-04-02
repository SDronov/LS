inherited qTurnoverF21_1808Form: TqTurnoverF21_1808Form
  Left = 210
  Top = 138
  Width = 854
  Caption = #1089#1095' '#1056'01.00.00'
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
          Width = 134
        end
        item
          Caption = ' '#1076#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #8470
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 108
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 96
        end
        item
          Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1200
        end
        item
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 160
        end
        item
          Caption = #1042#1099#1073#1099#1083#1086
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 1040
        end
        item
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '
          Position.BandIndex = 7
          Position.ColIndex = 0
        end
        item
          Caption = #1059#1074#1040
          Position.BandIndex = 8
          Position.ColIndex = 0
          Width = 72
        end
        item
          Caption = #1059#1074#1062
          Position.BandIndex = 8
          Position.ColIndex = 1
          Width = 59
        end
        item
          Caption = #1059#1074#1048#1079#1083
          Position.BandIndex = 8
          Position.ColIndex = 2
          Width = 51
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 7
          Position.ColIndex = 1
        end
        item
          Caption = #1048#1090#1086#1075#1086' '#1074' '#1073#1102#1076#1078#1077#1090
          Position.BandIndex = 7
          Position.ColIndex = 2
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1090
          Position.BandIndex = 7
          Position.ColIndex = 3
        end
        item
          Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1102
          Position.BandIndex = 7
          Position.ColIndex = 4
        end
        item
          Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082' '
          FixedKind = fkRight
          Width = 100
        end>
      object grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'ITEM_NO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewCNoticeKindPay: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewConfirm: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_out: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'ITOGO_OUT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'REUSE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
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
        Width = 40
      end
      object grdTurnoverSheetDBBandedTableDViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
      end
      object grdTurnoverSheetDBBandedTableDViewDOC_DATE: TcxGridDBColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        Hidden = True
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewPostupilo: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
        DataBinding.FieldName = 'POSTUPILO'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS: TcxGridDBColumn
        Caption = #1059#1074#1040
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY: TcxGridDBColumn
        Caption = #1059#1074#1062
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY: TcxGridDBColumn
        Caption = #1059#1074#1048#1079#1083
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewCONFIRMKINDPAY: TcxGridDBColumn
        Caption = #1055#1086#1076#1090#1074
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewITOGO_OUT: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1074' '#1073#1102#1076#1078#1077#1090
        DataBinding.FieldName = 'ITOGO_OUT'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewRETURN: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088#1072#1090
        DataBinding.FieldName = 'RETURN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewREUSE: TcxGridDBColumn
        Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1102
        DataBinding.FieldName = 'REUSE'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1056'.01.00.00 "'#1044#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072' '#1085#1072' '#1089#1091 +
      #1073#1089#1095#1077#1090#1077'" ('#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084')'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual'
      'union all'
      'select to_char(nvl(item_no_sort,0)) id'
      
        '      ,to_char((case when (item_no_sort is null) then null else ' +
        '0 end)) parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,doc_number'
      '      ,doc_date'
      '      ,postupilo'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_celevoy'
      '      ,cnoticekindpay'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      
        '      ,(in_summa + postupilo - itogo_out - return - reuse) out_s' +
        'umma'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists)'
      '                                    else in_summa'
      '       end) in_summa'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(postupilo) postupilo'
      '      ,sum(noticekindpay_avans) noticekindpay_avans'
      '      ,sum(noticekindpay_celevoy) noticekindpay_celevoy'
      '      ,sum(cnoticekindpay) cnoticekindpay'
      '      ,sum(confirmkindpay) confirmkindpay'
      '      ,sum(return) return'
      '      ,sum(reuse) reuse'
      '      ,sum(itogo_out) itogo_out'
      'from ('
      
        '      select row_number() over(order by doc_date,doc_number,doc_' +
        'id) item_no'
      '            ,to_number(null) in_summa'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,postupilo'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_celevoy'
      '            ,cnoticekindpay'
      '            ,confirmkindpay'
      '            ,return'
      '            ,reuse'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay+confirmkindpay) itogo_out'
      '      from ('
      '            select doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(postupilo) postupilo'
      '                  ,sum(noticekindpay_avans) noticekindpay_avans'
      
        '                  ,sum(noticekindpay_celevoy) noticekindpay_cele' +
        'voy'
      '                  ,sum(cnoticekindpay) cnoticekindpay'
      '                  ,sum(confirmkindpay) confirmkindpay'
      '                  ,sum(return) return'
      '                  ,sum(reuse) reuse'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dl.id doc_id'
      '                        ,dl.doc_number doc_number'
      '                        ,dl.doc_date doc_date'
      
        '                        ,(case  when (acc.code = '#39#1056'01.10.01'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Notice'#39' and dic.code = p_params.prepaymentkbk) then sum_rur ' +
        'else 0 end) noticekindpay_avans'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Notice'#39' and dic.code != p_params.prepaymentkbk) then sum_rur' +
        ' else 0 end) noticekindpay_celevoy'
      
        '                        ,(case  when (acc.code = '#39#1056'01.10.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation.' +
        'BP.CNotice'#39') then sum_rur else 0 end) cnoticekindpay'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Confirm'#39') then sum_rur else 0 end) confirmkindpay'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.02'#39' an' +
        'd acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.04'#39' an' +
        'd acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_dict dic'
      '                      ,fdc_cnfrm_specify_kindpay_lst cnfr'
      '                      ,fdc_document_lst cn'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      
        '                    and nvl(p_oborotki.get_main_docpack_id(acct.' +
        'doc_id),acct.doc_id) = dl.id(+)'
      '                    and acct.kbk_id = dic.id'
      '                    and acct.doc_id = cnfr.id(+)'
      '                    and cnfr.rdoccnfrmid = cn.id(+)'
      '                  )'
      '            group by doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where postupilo != 0 '
      '         or noticekindpay_avans != 0 '
      '         or noticekindpay_celevoy != 0 '
      '         or cnoticekindpay != 0 '
      '         or confirmkindpay != 0 '
      '         or return != 0 '
      '         or reuse != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,in_summa'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,postupilo'
      '        ,noticekindpay_avans'
      '        ,noticekindpay_celevoy'
      '        ,cnoticekindpay'
      '        ,confirmkindpay'
      '        ,return'
      '        ,reuse'
      '        ,itogo_out),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000F000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000130000004E4F544943454B494E4450
      41595F4156414E53010000000000150000004E4F544943454B494E445041595F
      43454C45564F590100000000000E000000434E4F544943454B494E4450415901
      00000000000E000000434F4E4649524D4B494E44504159010000000000060000
      0052455455524E01000000000005000000524555534501000000000009000000
      49544F474F5F4F5554010000000000090000004F55545F53554D4D4101000000
      000002000000494401000000000008000000504152454E544944010000000000
      09000000504F53545550494C4F010000000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Top = 88
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataNOTICEKINDPAY_AVANS: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_CELEVOY: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object dsetDataCNOTICEKINDPAY: TFloatField
      FieldName = 'CNOTICEKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataCONFIRMKINDPAY: TFloatField
      FieldName = 'CONFIRMKINDPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE: TFloatField
      FieldName = 'REUSE'
      DisplayFormat = ',0.00'
    end
    object dsetDataITOGO_OUT: TFloatField
      FieldName = 'ITOGO_OUT'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataID: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object dsetDataPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
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
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,postupilo'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_celevoy'
      '      ,cnoticekindpay'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      
        '      ,(in_summa + postupilo - itogo_out - return - reuse) out_s' +
        'umma'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39'item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,postupilo'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_celevoy'
      '      ,cnoticekindpay'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      'from ('
      '      select postupilo'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_celevoy'
      '            ,cnoticekindpay'
      '            ,confirmkindpay'
      '            ,return'
      '            ,reuse'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay+confirmkindpay) itogo_out'
      '      from ('
      '            select nvl(sum(postupilo),0) postupilo'
      
        '                  ,nvl(sum(noticekindpay_avans),0) noticekindpay' +
        '_avans'
      
        '                  ,nvl(sum(noticekindpay_celevoy),0) noticekindp' +
        'ay_celevoy'
      '                  ,nvl(sum(cnoticekindpay),0) cnoticekindpay'
      '                  ,nvl(sum(confirmkindpay),0) confirmkindpay'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(reuse),0) reuse'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dl.id doc_id'
      '                        ,dl.doc_number doc_number'
      '                        ,dl.doc_date doc_date'
      
        '                        ,(case  when (acc.code = '#39#1056'01.10.01'#39' and' +
        ' acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) postupilo'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Notice'#39' and dic.code = p_params.prepaymentkbk) then sum_rur ' +
        'else 0 end) noticekindpay_avans'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Notice'#39' and dic.code != p_params.prepaymentkbk) then sum_rur' +
        ' else 0 end) noticekindpay_celevoy'
      
        '                        ,(case  when (acc.code = '#39#1056'01.10.03'#39' and' +
        ' acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation.' +
        'BP.CNotice'#39') then sum_rur else 0 end) cnoticekindpay'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.03'#39' an' +
        'd acct.is_debit = '#39'N'#39' and cn.typesysname = '#39'DocumentConfirmation' +
        '.BP.Confirm'#39') then sum_rur else 0 end) confirmkindpay'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.02'#39' an' +
        'd acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39#1056'01.10.04'#39' an' +
        'd acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_dict dic'
      '                      ,fdc_cnfrm_specify_kindpay_lst cnfr'
      '                      ,fdc_document_lst cn'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      
        '                    and nvl(p_oborotki.get_main_docpack_id(acct.' +
        'doc_id),acct.doc_id) = dl.id(+)'
      '                    and acct.kbk_id = dic.id'
      '                    and acct.doc_id = cnfr.id(+)'
      '                    and cnfr.rdoccnfrmid = cn.id(+)'
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0,:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) postupilo'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0,:ists) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000050000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00}
    QBEDefinition.QBEFieldDefs = {
      040000000F000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D424552010000000000130000004E4F544943454B494E4450
      41595F4156414E53010000000000150000004E4F544943454B494E445041595F
      43454C45564F590100000000000E000000434E4F544943454B494E4450415901
      00000000000E000000434F4E4649524D4B494E44504159010000000000060000
      0052455455524E01000000000005000000524555534501000000000009000000
      49544F474F5F4F5554010000000000090000004F55545F53554D4D4101000000
      000002000000494401000000000008000000504152454E544944010000000000
      09000000504F53545550494C4F010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 256
    Top = 136
    object StringField1: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
    end
    object FloatField1: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField2: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object FloatField6: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS'
      DisplayFormat = ',0.00'
    end
    object FloatField7: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY'
      DisplayFormat = ',0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'CNOTICEKINDPAY'
      DisplayFormat = ',0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'CONFIRMKINDPAY'
      DisplayFormat = ',0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object FloatField11: TFloatField
      FieldName = 'REUSE'
      DisplayFormat = ',0.00'
    end
    object FloatField12: TFloatField
      FieldName = 'ITOGO_OUT'
      DisplayFormat = ',0.00'
    end
    object FloatField13: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object StringField3: TStringField
      FieldName = 'ID'
      Size = 2000
    end
    object StringField4: TStringField
      FieldName = 'PARENTID'
      Size = 2000
    end
    object dsetItogPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 224
    Top = 216
  end
end
