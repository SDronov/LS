inherited qTurnoverF01Form: TqTurnoverF01Form
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
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewBezNal
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewInPath
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_y
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewItogo_in
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewCNoticeKindPay
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewConfirm
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewItogo_out
        end>
      OptionsBehavior.CellHints = True
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
          Width = 123
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 96
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
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
          Width = 326
        end
        item
          Caption = #1087#1086' '#1073#1077#1079#1085#1072#1083#1080#1095#1085#1086#1084#1091' '#1088#1072#1089#1095#1077#1090#1091
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 95
        end
        item
          Caption = #1076#1077#1085#1077#1075' '#1074' '#1087#1091#1090#1080
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 80
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1089' '#1076#1088#1091#1075#1086#1081' '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 6
          Position.ColIndex = 2
          Width = 74
        end
        item
          Caption = #1048#1090#1086#1075#1086
          Position.BandIndex = 6
          Position.ColIndex = 3
          Width = 77
        end
        item
          Caption = #1057#1087#1080#1089#1072#1085#1086
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 500
        end
        item
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '
          Position.BandIndex = 11
          Position.ColIndex = 0
        end
        item
          Caption = #1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1050#1041#1050' '#1072#1074#1072#1085#1089#1072
          Position.BandIndex = 12
          Position.ColIndex = 0
          Width = 72
        end
        item
          Caption = #1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1094#1077#1083#1077#1074#1086#1075#1086' '#1050#1041#1050
          Position.BandIndex = 12
          Position.ColIndex = 1
          Width = 59
        end
        item
          Caption = #1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
          Position.BandIndex = 12
          Position.ColIndex = 2
          Width = 51
        end
        item
          Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
          Position.BandIndex = 11
          Position.ColIndex = 1
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1090#1099
          Position.BandIndex = 11
          Position.ColIndex = 2
        end
        item
          Caption = #1047#1072#1095#1077#1090#1099' '#1085#1072' '#1076#1088#1091#1075#1091#1102' '#1090#1072#1084#1086#1078#1085#1102
          Position.BandIndex = 11
          Position.ColIndex = 3
        end
        item
          Caption = #1048#1090#1086#1075#1086
          Position.BandIndex = 11
          Position.ColIndex = 4
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          FixedKind = fkRight
          Width = 100
        end>
      object grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'ITEM_NO'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'DOC_NUMBER'
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOC_DATE'
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewBezNal: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'BEZNAL'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewInPath: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'INPATH'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_y: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'REUSE_Y'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_in: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'ITOGO_IN'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_avans: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'NOTICEKINDPAY_AVANS'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticeKindPay_celevoy: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'NOTICEKINDPAY_CELEVOY'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewCNoticeKindPay: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'CNOTICEKINDPAY'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewConfirm: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'CONFIRMKINDPAY'
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'RETURN'
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'REUSE'
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewItogo_out: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'ITOGO_OUT'
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.01.01.00 "'#1044#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072' '#1085#1072' '#1089#1091 +
      #1073#1089#1095#1077#1090#1077'" ('#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084')'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      'select item_no'
      '      ,in_summa'
      '      ,doc_number'
      '      ,doc_date'
      '      ,beznal'
      '      ,inpath'
      '      ,reuse_y'
      '      ,itogo_in'
      '      ,noticekindpay_avans'
      '      ,noticekindpay_celevoy'
      '      ,cnoticekindpay'
      '      ,confirmkindpay'
      '      ,return'
      '      ,reuse'
      '      ,itogo_out'
      '      ,(in_summa + itogo_in - itogo_out) out_summa'
      'from ('
      'select nvl(to_char(item_no),'#39#1048#1090#1086#1075#1086#39') item_no'
      '      ,item_no item_no_sort'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa'
      '       end) in_summa'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(beznal) beznal'
      '      ,sum(inpath) inpath'
      '      ,sum(reuse_y) reuse_y'
      '      ,sum(itogo_in) itogo_in'
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
      '            ,beznal'
      '            ,inpath'
      '            ,reuse_y'
      '            ,(beznal+inpath+reuse_y) itogo_in'
      '            ,noticekindpay_avans'
      '            ,noticekindpay_celevoy'
      '            ,cnoticekindpay'
      '            ,confirmkindpay'
      '            ,return'
      '            ,reuse'
      
        '            ,(noticekindpay_avans+noticekindpay_celevoy+cnoticek' +
        'indpay+confirmkindpay+return+reuse) itogo_out'
      '      from ('
      '            select doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(beznal) beznal'
      '                  ,sum(inpath) inpath'
      '                  ,sum(reuse_y) reuse_y'
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
      '                        ,dl.doc_number'
      '                        ,dl.doc_date'
      
        '                        ,(case  when (acc.code = '#39'01.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) beznal'
      
        '                        ,(case  when (acc.code = '#39'01.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inpath'
      
        '                        ,(case  when (acc.code = '#39'01.01.06'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) reuse_y'
      
        '                        ,-(case  when (acc.code = '#39'01.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_ava' +
        'ns'
      
        '                        ,-(case  when (acc.code = '#39'01.01.08'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) noticekindpay_cel' +
        'evoy'
      
        '                        ,-(case  when (acc.code = '#39'01.01.09'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) cnoticekindpay'
      
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
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dl'
      
        '                  where (operation_date between :bdate and :edat' +
        'e)'
      
        '                    and nvl(p_oborotki.get_skindpay_id(acct.doc_' +
        'id),p_oborotki.get_pp_doc_id(acct.doc_id)) = dl.id(+)'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                  )'
      '            group by doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where beznal != 0 '
      '         or inpath != 0 '
      '         or reuse_y != 0 '
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
      '        ,beznal'
      '        ,inpath'
      '        ,reuse_y'
      '        ,itogo_in'
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
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) beznal'
      '      ,to_number(null) inpath'
      '      ,to_number(null) reuse_y'
      '      ,to_number(null) itogo_in'
      '      ,to_number(null) noticekindpay_avans'
      '      ,to_number(null) noticekindpay_celevoy'
      '      ,to_number(null) cnoticekindpay'
      '      ,to_number(null) confirmkindpay'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse'
      '      ,to_number(null) itogo_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
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
      03000000040000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000010000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D410100000000000A0000
      00444F435F4E554D4245520100000000000600000042455A4E414C0100000000
      0006000000494E504154480100000000000700000052455553455F5901000000
      00000800000049544F474F5F494E010000000000130000004E4F544943454B49
      4E445041595F4156414E53010000000000150000004E4F544943454B494E4450
      41595F43454C45564F590100000000000E000000434E4F544943454B494E4450
      41590100000000000E000000434F4E4649524D4B494E44504159010000000000
      0600000052455455524E01000000000005000000524555534501000000000009
      00000049544F474F5F4F5554010000000000090000004F55545F53554D4D4101
      0000000000}
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
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
