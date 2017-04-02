inherited qTurnoverF02_1808Form: TqTurnoverF02_1808Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 01.01.00'
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
          Caption = #1050#1041#1050
          Width = 123
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
          Position.BandIndex = 3
          Position.ColIndex = 0
          Width = 326
        end
        item
          Caption = #1087#1086' '#1041#1053
          Position.BandIndex = 4
          Position.ColIndex = 0
          Width = 95
        end
        item
          Caption = #1076#1077#1085#1077#1075' '#1074' '#1087#1091#1090#1080
          Position.BandIndex = 4
          Position.ColIndex = 1
          Width = 80
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1089' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 4
          Position.ColIndex = 2
          Width = 74
        end
        item
          Caption = #1048#1090#1086#1075#1086
          Position.BandIndex = 4
          Position.ColIndex = 3
          Width = 77
        end
        item
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '
          Position.BandIndex = 3
          Position.ColIndex = 1
        end
        item
          Caption = #1059#1074#1040
          Position.BandIndex = 9
          Position.ColIndex = 0
          Width = 72
        end
        item
          Caption = #1074#1099#1073#1099#1083#1086' '#1089' '#1050#1041#1050
          Position.BandIndex = 10
          Position.ColIndex = 0
        end
        item
          Caption = #1085#1072' '#1050#1041#1050
          Position.BandIndex = 10
          Position.ColIndex = 1
        end
        item
          Caption = #1059#1074#1062
          Position.BandIndex = 9
          Position.ColIndex = 1
          Width = 59
        end
        item
          Caption = #1074#1099#1073#1099#1083#1086' '#1089' '#1050#1041#1050
          Position.BandIndex = 13
          Position.ColIndex = 0
        end
        item
          Caption = #1085#1072' '#1050#1041#1050
          Position.BandIndex = 13
          Position.ColIndex = 1
        end
        item
          Caption = #1059#1074#1048#1079#1083
          Position.BandIndex = 9
          Position.ColIndex = 2
          Width = 51
        end
        item
          Caption = ' '#1089' '#1050#1041#1050' '
          Position.BandIndex = 16
          Position.ColIndex = 0
        end
        item
          Caption = #1087#1086#1089#1090#1091#1087#1080#1083#1086' '#1085#1072' '#1050#1041#1050
          Position.BandIndex = 16
          Position.ColIndex = 1
        end
        item
          Caption = #1055#1086#1076#1090#1074
          Position.BandIndex = 3
          Position.ColIndex = 2
        end
        item
          Caption = #1074#1099#1073#1099#1083#1086' '#1089' '#1050#1041#1050' '
          Position.BandIndex = 19
          Position.ColIndex = 0
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1090
          Position.BandIndex = 3
          Position.ColIndex = 4
        end
        item
          Caption = #1047#1072#1095#1077#1090' '#1085#1072' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1102
          Position.BandIndex = 3
          Position.ColIndex = 5
        end
        item
          Caption = #1048#1090#1086#1075#1086' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
          Position.BandIndex = 3
          Position.ColIndex = 3
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
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
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
      object grdTurnoverSheetDBBandedTableViewBezNal: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'BEZNAL'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInPath: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'INPATH'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_y: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'REUSE_Y'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_in: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'ITOGO_IN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_AVANS_T: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNOTICEKINDPAY_CELEVOY_T: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewCNoticeKindPay: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewCNOTICEKINDPAY_T: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'CNOTICEKINDPAY_T'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewConfirm: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'RETURN'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'REUSE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_out: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'ITOGO_OUT'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Position.BandIndex = 23
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 24
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
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewBEZNAL: TcxGridDBColumn
        Caption = #1087#1086' '#1041#1053
        DataBinding.FieldName = 'BEZNAL'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINPATH: TcxGridDBColumn
        Caption = #1076#1077#1085#1077#1075' '#1074' '#1087#1091#1090#1080
        DataBinding.FieldName = 'INPATH'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewREUSE_Y: TcxGridDBColumn
        Caption = #1079#1072#1095#1090#1077#1085#1086' '#1089' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
        DataBinding.FieldName = 'REUSE_Y'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewITOGO_IN: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086
        DataBinding.FieldName = 'ITOGO_IN'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS: TcxGridDBColumn
        Caption = #1059#1074#1040' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_AVANS_T: TcxGridDBColumn
        Caption = #1059#1074#1040' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS_T'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY: TcxGridDBColumn
        Caption = #1059#1074#1062' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewNOTICEKINDPAY_CELEVOY_T: TcxGridDBColumn
        Caption = #1059#1074#1062' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY_T'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY: TcxGridDBColumn
        Caption = #1059#1074#1048#1079#1083' '#1089' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewCNOTICEKINDPAY_T: TcxGridDBColumn
        Caption = #1059#1074#1048#1079#1083' '#1085#1072' '#1050#1041#1050
        DataBinding.FieldName = 'CNOTICEKINDPAY_T'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewCONFIRMKINDPAY: TcxGridDBColumn
        Caption = #1055#1086#1076#1090#1074
        DataBinding.FieldName = 'CONFIRMKINDPAY'
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
      object grdTurnoverSheetDBBandedTableDViewITOGO_OUT: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086
        DataBinding.FieldName = 'ITOGO_OUT'
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
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
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.01.01.00 "'#1044#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072' '#1085#1072' '#1089#1091 +
      #1073#1089#1095#1077#1090#1077'" ('#1087#1086' '#1050#1041#1050')'
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
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
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
      '      ,beznal'
      '      ,inpath'
      '      ,reuse_y'
      '      ,itogo_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      '      ,(in_summa + itogo_in - itogo_out_full) out_summa'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
      '                                    else in_summa'
      '       end) in_summa'
      '      ,kbk'
      '      ,sum(beznal) beznal'
      '      ,sum(inpath) inpath'
      '      ,sum(reuse_y) reuse_y'
      '      ,sum(itogo_in) itogo_in'
      '      ,sum(noticekindpay_avans) noticekindpay_avans'
      '      ,sum(noticekindpay_avans_t) noticekindpay_avans_t'
      '      ,sum(noticekindpay_celevoy) noticekindpay_celevoy'
      '      ,sum(noticekindpay_celevoy_t) noticekindpay_celevoy_t'
      '      ,sum(cnoticekindpay) cnoticekindpay'
      '      ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '      ,sum(confirmkindpay) confirmkindpay'
      '      ,sum(itogo_out) itogo_out'
      '      ,sum(return) return'
      '      ,sum(reuse) reuse'
      '      ,sum(itogo_out_full) itogo_out_full'
      'from ('
      '      select row_number() over(order by kbk) item_no'
      '            ,('
      
        '              select sum(p_oper_balans.get_bsumma_account_kbk( :' +
        'account_id, :account_code, :bdate, kd.id, 0,'#39'rur'#39','#39'rur'#39', case :s' +
        'ummarn WHEN '#39'Y'#39' THEN 1 ELSE 0 end , :ists ))'
      '              from fdc_kbk_dict_lst kd'
      '              where kd.code = kbk'
      '             ) in_summa'
      '            ,kbk'
      '            ,beznal'
      '            ,inpath'
      '            ,reuse_y'
      '            ,(beznal+inpath+reuse_y) itogo_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_avans_t'
      '            ,noticekindpay_celevoy'
      '            ,noticekindpay_celevoy_t'
      '            ,cnoticekindpay'
      '            ,cnoticekindpay_t'
      '            ,confirmkindpay'
      
        '            ,(noticekindpay_avans_t+noticekindpay_celevoy_t-cnot' +
        'icekindpay+confirmkindpay) itogo_out'
      '            ,return'
      '            ,reuse'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay_t+confirmkindpay+return+reuse) itogo_out_full'
      '      from ('
      '            select kbk'
      '                  ,sum(beznal) beznal'
      '                  ,sum(inpath) inpath'
      '                  ,sum(reuse_y) reuse_y'
      '                  ,sum(noticekindpay_avans) noticekindpay_avans'
      
        '                  ,sum(noticekindpay_avans_t) noticekindpay_avan' +
        's_t'
      
        '                  ,sum(noticekindpay_celevoy) noticekindpay_cele' +
        'voy'
      
        '                  ,sum(noticekindpay_celevoy_t) noticekindpay_ce' +
        'levoy_t'
      '                  ,sum(cnoticekindpay) cnoticekindpay'
      '                  ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '                  ,sum(confirmkindpay) confirmkindpay'
      '                  ,sum(return) return'
      '                  ,sum(reuse) reuse'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,dic.code kbk'
      
        '                        ,(case  when (acc.code = '#39'01.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) beznal'
      
        '                        ,(case  when (acc.code = '#39'01.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inpath'
      
        '                        ,(case  when (acc.code = '#39'01.01.06'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse_y'
      
        '                        ,-(case  when (acc.code = '#39'01.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns'
      
        '                        ,-(case  when (acc.code = '#39'12.02.01'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns_t'
      
        '                        ,-(case  when (acc.code = '#39'01.01.08'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy'
      
        '                        ,-(case  when (acc.code = '#39'12.02.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy_t'
      
        '                        ,(case  when (acc.code = '#39'01.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) cnoticekindpay_t'
      
        '                        ,(case  when (acc.code = '#39'12.02.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) cnoticekindpay'
      
        '                        ,-(case  when (acc.code = '#39'01.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) confirmkindpay'
      
        '                        ,-(case  when (acc.code = '#39'01.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'01.01.07'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        start with (id = :account_id or code = '#39 +
        '12.02.00'#39')'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_dict dic'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      '                    and acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      '                    and acct.kbk_id = dic.id'
      '                  union all'
      '                  -- '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1074#1089#1077#1084' '#1082#1073#1082' '#1080#1079' '#1073#1072#1083#1072#1085#1089#1072
      '                  select null kbk_id'
      '                        ,null subject_id'
      '                        ,null account_id'
      '                        ,null operation_date'
      '                        ,dic.code kbk'
      '                        ,0 beznal'
      '                        ,0 inpath'
      '                        ,0 reuse_y'
      '                        ,0 noticekindpay_avans'
      '                        ,0 noticekindpay_avans_t'
      '                        ,0 noticekindpay_celevoy'
      '                        ,0 noticekindpay_celevoy_t'
      '                        ,0 cnoticekindpay_t'
      '                        ,0 cnoticekindpay'
      '                        ,0 confirmkindpay'
      '                        ,0 return'
      '                        ,0 reuse'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with (id = :account_id)'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_dict dic'
      '                  where acct.account_id = acc.id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      '                    and acct.kbk_id = dic.id'
      '                  )'
      '            group by kbk'
      '           ) a'
      '/* '#1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074#1085#1077' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1086#1090' '#1085#1072#1083#1080#1095#1080#1103' '#1076#1074#1080#1078#1077#1085#1080#1103
      '      where beznal != 0 '
      '         or inpath != 0 '
      '         or reuse_y != 0 '
      '         or noticekindpay_avans != 0 '
      '         or noticekindpay_avans_t != 0 '
      '         or noticekindpay_celevoy != 0 '
      '         or noticekindpay_celevoy_t != 0 '
      '         or cnoticekindpay != 0 '
      '         or cnoticekindpay_t != 0 '
      '         or confirmkindpay != 0 '
      '         or return != 0 '
      '         or reuse != 0'
      '*/'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,in_summa'
      '        ,kbk'
      '        ,beznal'
      '        ,inpath'
      '        ,reuse_y'
      '        ,itogo_in'
      '        ,noticekindpay_avans'
      '        ,noticekindpay_avans_t'
      '        ,noticekindpay_celevoy'
      '        ,noticekindpay_celevoy_t'
      '        ,cnoticekindpay'
      '        ,cnoticekindpay_t'
      '        ,confirmkindpay'
      '        ,itogo_out'
      '        ,return'
      '        ,reuse'
      '        ,itogo_out_full),())'
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
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      ''
      '/*'
      #39'DocumentConfirmation.SpecifyKindPay'#39
      ''
      
        #39'CashlessPaymentOrder'#39' '#39'PaymentOrderNonID'#39' '#39'PaymentOrderNonIDDes' +
        't'#39
      #39'PaymentOrderConfirm'#39
      ''
      #39'PaymentOrderReuse'#39
      #39'CancelDecisionPayback'#39
      ''
      #39'CorrectionPoSubject'#39
      #39'CorrectionPOBack'#39
      ''
      #39'DocumentConfirmation.DPReturns'#39
      ''
      #39'PaymentOrderRestUFK'#39
      #39'DocReuseY'#39
      '*/')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000600000042455A4E414C0100000000000600000049
      4E504154480100000000000700000052455553455F5901000000000008000000
      49544F474F5F494E010000000000130000004E4F544943454B494E445041595F
      4156414E53010000000000150000004E4F544943454B494E445041595F43454C
      45564F590100000000000E000000434E4F544943454B494E4450415901000000
      00000E000000434F4E4649524D4B494E44504159010000000000060000005245
      5455524E0100000000000500000052455553450100000000000900000049544F
      474F5F4F5554010000000000090000004F55545F53554D4D4101000000000002
      000000494401000000000008000000504152454E544944010000000000030000
      004B424B010000000000150000004E4F544943454B494E445041595F4156414E
      535F54010000000000170000004E4F544943454B494E445041595F43454C4556
      4F595F5401000000000010000000434E4F544943454B494E445041595F540100
      00000000}
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
    object dsetDataBEZNAL: TFloatField
      FieldName = 'BEZNAL'
      DisplayFormat = ',0.00'
    end
    object dsetDataINPATH: TFloatField
      FieldName = 'INPATH'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_Y: TFloatField
      FieldName = 'REUSE_Y'
      DisplayFormat = ',0.00'
    end
    object dsetDataITOGO_IN: TFloatField
      FieldName = 'ITOGO_IN'
      DisplayFormat = ',0.00'
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
      Size = 40
    end
    object dsetDataPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 40
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 1500
    end
    object dsetDataNOTICEKINDPAY_AVANS_T: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS_T'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTICEKINDPAY_CELEVOY_T: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY_T'
      DisplayFormat = ',0.00'
    end
    object dsetDataCNOTICEKINDPAY_T: TFloatField
      FieldName = 'CNOTICEKINDPAY_T'
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
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
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
      '      ,beznal'
      '      ,inpath'
      '      ,reuse_y'
      '      ,itogo_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_avans_t'
      '      ,noticekindpay_celevoy'
      '      ,noticekindpay_celevoy_t'
      '      ,cnoticekindpay'
      '      ,cnoticekindpay_t'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      '      ,(in_summa + itogo_in - itogo_out_full) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,kbk'
      '      ,sum(beznal) beznal'
      '      ,sum(inpath) inpath'
      '      ,sum(reuse_y) reuse_y'
      '      ,sum(itogo_in) itogo_in'
      '      ,sum(noticekindpay_avans) noticekindpay_avans'
      '      ,sum(noticekindpay_avans_t) noticekindpay_avans_t'
      '      ,sum(noticekindpay_celevoy) noticekindpay_celevoy'
      '      ,sum(noticekindpay_celevoy_t) noticekindpay_celevoy_t'
      '      ,sum(cnoticekindpay) cnoticekindpay'
      '      ,sum(cnoticekindpay_t) cnoticekindpay_t'
      '      ,sum(confirmkindpay) confirmkindpay'
      '      ,sum(itogo_out) itogo_out'
      '      ,sum(return) return'
      '      ,sum(reuse) reuse'
      '      ,sum(itogo_out_full) itogo_out_full'
      'from ('
      '      select to_number(null) in_summa'
      '            ,null kbk'
      '            ,beznal'
      '            ,inpath'
      '            ,reuse_y'
      '            ,(beznal+inpath+reuse_y) itogo_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_avans_t'
      '            ,noticekindpay_celevoy'
      '            ,noticekindpay_celevoy_t'
      '            ,cnoticekindpay'
      '            ,cnoticekindpay_t'
      '            ,confirmkindpay'
      
        '            ,(noticekindpay_avans_t+noticekindpay_celevoy_t-cnot' +
        'icekindpay+confirmkindpay) itogo_out'
      '            ,return'
      '            ,reuse'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy-cnoticek' +
        'indpay_t+confirmkindpay+return+reuse) itogo_out_full'
      '      from ('
      '            select nvl(sum(beznal),0) beznal'
      '                  ,nvl(sum(inpath),0) inpath'
      '                  ,nvl(sum(reuse_y),0) reuse_y'
      
        '                  ,nvl(sum(noticekindpay_avans),0) noticekindpay' +
        '_avans'
      
        '                  ,nvl(sum(noticekindpay_avans_t),0) noticekindp' +
        'ay_avans_t'
      
        '                  ,nvl(sum(noticekindpay_celevoy),0) noticekindp' +
        'ay_celevoy'
      
        '                  ,nvl(sum(noticekindpay_celevoy_t),0) noticekin' +
        'dpay_celevoy_t'
      '                  ,nvl(sum(cnoticekindpay),0) cnoticekindpay'
      '                  ,nvl(sum(cnoticekindpay_t),0) cnoticekindpay_t'
      '                  ,nvl(sum(confirmkindpay),0) confirmkindpay'
      '                  ,nvl(sum(return),0) return'
      '                  ,nvl(sum(reuse),0) reuse'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case  when (acc.code = '#39'01.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) beznal'
      
        '                        ,(case  when (acc.code = '#39'01.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inpath'
      
        '                        ,(case  when (acc.code = '#39'01.01.06'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse_y'
      
        '                        ,-(case  when (acc.code = '#39'01.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns'
      
        '                        ,-(case  when (acc.code = '#39'12.02.01'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns_t'
      
        '                        ,-(case  when (acc.code = '#39'01.01.08'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy'
      
        '                        ,-(case  when (acc.code = '#39'12.02.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy_t'
      
        '                        ,(case  when (acc.code = '#39'01.01.09'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) cnoticekindpay_t'
      
        '                        ,(case  when (acc.code = '#39'12.02.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) cnoticekindpay'
      
        '                        ,-(case  when (acc.code = '#39'01.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) confirmkindpay'
      
        '                        ,-(case  when (acc.code = '#39'01.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'01.01.07'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      
        '                        start with (id = :account_id or code = '#39 +
        '12.02.00'#39')'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
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
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) kbk'
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_avans_t'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) noticekindpay_celevoy_t'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) cnoticekindpay_t'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      ''
      '/*'
      #39'DocumentConfirmation.SpecifyKindPay'#39
      ''
      
        #39'CashlessPaymentOrder'#39' '#39'PaymentOrderNonID'#39' '#39'PaymentOrderNonIDDes' +
        't'#39
      #39'PaymentOrderConfirm'#39
      ''
      #39'PaymentOrderReuse'#39
      #39'CancelDecisionPayback'#39
      ''
      #39'CorrectionPoSubject'#39
      #39'CorrectionPOBack'#39
      ''
      #39'DocumentConfirmation.DPReturns'#39
      ''
      #39'PaymentOrderRestUFK'#39
      #39'DocReuseY'#39
      '*/')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000014000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D410100000000000600000042455A4E414C0100000000000600000049
      4E504154480100000000000700000052455553455F5901000000000008000000
      49544F474F5F494E010000000000130000004E4F544943454B494E445041595F
      4156414E53010000000000150000004E4F544943454B494E445041595F43454C
      45564F590100000000000E000000434E4F544943454B494E4450415901000000
      00000E000000434F4E4649524D4B494E44504159010000000000060000005245
      5455524E0100000000000500000052455553450100000000000900000049544F
      474F5F4F5554010000000000090000004F55545F53554D4D4101000000000002
      000000494401000000000008000000504152454E544944010000000000030000
      004B424B010000000000150000004E4F544943454B494E445041595F4156414E
      535F54010000000000170000004E4F544943454B494E445041595F43454C4556
      4F595F5401000000000010000000434E4F544943454B494E445041595F540100
      00000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 256
    Top = 136
    object StringField1: TStringField
      FieldName = 'ITEM_NO'
      Size = 5
    end
    object FloatField1: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'BEZNAL'
      DisplayFormat = ',0.00'
    end
    object FloatField3: TFloatField
      FieldName = 'INPATH'
      DisplayFormat = ',0.00'
    end
    object FloatField4: TFloatField
      FieldName = 'REUSE_Y'
      DisplayFormat = ',0.00'
    end
    object FloatField5: TFloatField
      FieldName = 'ITOGO_IN'
      DisplayFormat = ',0.00'
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
      Size = 2
    end
    object StringField4: TStringField
      FieldName = 'PARENTID'
      Size = 1
    end
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 1
    end
    object dsetItogNOTICEKINDPAY_AVANS_T: TFloatField
      FieldName = 'NOTICEKINDPAY_AVANS_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogNOTICEKINDPAY_CELEVOY_T: TFloatField
      FieldName = 'NOTICEKINDPAY_CELEVOY_T'
      DisplayFormat = ',0.00'
    end
    object dsetItogCNOTICEKINDPAY_T: TFloatField
      FieldName = 'CNOTICEKINDPAY_T'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 224
    Top = 216
  end
end
