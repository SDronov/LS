inherited qTurnoverF13Form: TqTurnoverF13Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 06.00.00 '
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
          Column = grdTurnoverSheetDBBandedTableViewin_BezNal
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
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewZach_ExPay
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewZach_money_lien
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewOut_pay
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
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewSpisano_money_zalog
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReuse_out
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1091#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
          Width = 360
        end
        item
          Caption = #1048#1053#1053
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 75
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1090#1080#1087' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 106
        end
        item
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 460
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 105
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 96
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 84
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 5
          Position.ColIndex = 3
          Width = 95
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 1693
        end
        item
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086' '#1087#1086' '#1089#1091#1073#1089#1095#1077#1090#1091
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 352
        end
        item
          Caption = #1089#1087#1086#1089#1086#1073
          Position.BandIndex = 12
          Position.ColIndex = 0
          Width = 92
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 12
          Position.ColIndex = 1
          Width = 194
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 229
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1079#1072#1083#1086#1075#1086#1074
          Position.BandIndex = 11
          Position.ColIndex = 2
          Width = 188
        end
        item
          Caption = #1057#1087#1080#1089#1072#1085#1086' '#1074' '#1086#1087#1083#1072#1090#1091' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 11
          Position.ColIndex = 3
          Width = 442
        end
        item
          Caption = #1090#1080#1087' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 17
          Position.ColIndex = 0
          Width = 159
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 17
          Position.ColIndex = 1
          Width = 272
        end
        item
          Caption = #1089#1087#1080#1089#1072#1085#1086' '#1085#1072' '#1076#1077#1085#1077#1078#1085#1099#1077' '#1079#1072#1083#1086#1075#1080
          Position.BandIndex = 11
          Position.ColIndex = 4
          Width = 169
        end
        item
          Caption = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 5
          Width = 158
        end
        item
          Caption = #1047#1072#1095#1090#1077#1085#1086' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 11
          Position.ColIndex = 6
          Width = 155
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
      object grdTurnoverSheetDBBandedTableViewINN: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'INN'
        Width = 100
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'NAME'
        Width = 200
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'TYPE_PERSON'
        Width = 140
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_DATE'
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'KBK'
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSumma_pp: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DOC_SUMMA'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIN_WAY: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'IN_WAY'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewin_BezNal: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'IN_BEZNAL'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZach_ExPay: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'ZACH_EXPAY'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZach_money_lien: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'ZACH_MONEY_LIEN'
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_NACH_TYPE: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'OUT_NACH_TYPE'
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_pay: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'OUT_PAY'
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSpisano_money_zalog: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'SPISANO_MONEY_ZALOG'
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'RETURN'
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_out: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'REUSE_OUT'
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '19'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 23
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.06.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1091#1095#1072#1089#1090#1085#1080#1082#1072#1084#1080' '#1042 +
      #1069#1044'" '
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      
        'select decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_summa'
      '      ,kbk'
      '      ,in_way'
      '      ,in_beznal'
      '      ,zach_expay'
      '      ,zach_money_lien'
      '      ,out_nach_type'
      '      ,out_pay'
      '      ,spisano_money_zalog'
      '      ,return'
      '      ,reuse_out'
      
        '      ,(in_summa + in_beznal + zach_expay +zach_money_lien - out' +
        '_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      
        'select nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        'p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate)' +
        ',0,'#39'rur'#39','#39'rur'#39',0)'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen p_oper_balans.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_summa'
      '      ,kbk'
      '      ,in_way'
      '      ,sum(in_beznal) in_beznal'
      '      ,sum(zach_expay) zach_expay'
      '      ,sum(zach_money_lien) zach_money_lien'
      '      ,out_nach_type'
      '      ,sum(out_pay) out_pay'
      '      ,sum(spisano_money_zalog) spisano_money_zalog'
      '      ,sum(return) return'
      '      ,sum(reuse_out) reuse_out'
      
        '      ,sum(in_summa + in_beznal + zach_expay +zach_money_lien - ' +
        'out_pay - spisano_money_zalog - return - reuse_out) out_summa'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_date,doc_number,doc_id,kbk,in_way,out_nach_type) ite' +
        'm_no'
      '            ,subject_id'
      '            ,to_number(null) in_summa'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_summa'
      '            ,doc_id'
      '            ,kbk'
      '            ,in_way'
      '            ,in_beznal'
      '            ,zach_expay'
      '            ,zach_money_lien'
      '            ,out_nach_type'
      '            ,out_pay'
      '            ,spisano_money_zalog'
      '            ,return'
      '            ,reuse_out'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_summa'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,in_way'
      '                  ,sum(in_beznal) in_beznal'
      '                  ,sum(zach_expay) zach_expay'
      '                  ,sum(zach_money_lien) zach_money_lien'
      '                  ,out_nach_type'
      '                  ,sum(out_pay) out_pay'
      '                  ,sum(spisano_money_zalog) spisano_money_zalog'
      '                  ,sum(return) return'
      '                  ,sum(reuse_out) reuse_out'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.kp' +
        'p end) kpp'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.id when -1 then null else (cas' +
        'e sl.typesysname when '#39'Person'#39' then '#39#1060#39' else '#39#1070#39' end) end) type_' +
        'person'
      '                        ,po.id doc_id'
      
        '                        ,nvl(po.doc_number,(case when (po.doc_da' +
        'te is null) then null else '#39#1073'/'#1085#39' end)) doc_number'
      '                        ,po.doc_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) doc_summa'
      '                        ,po.kbk'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then'
      '                                    (case '
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashlessPaymentOrder'#39',0) = 1 or fdc_o' +
        'bject_type_is_subtype(ol_in.typesysname,'#39'PaymentOrderNonID'#39',0) =' +
        ' 1) then '#39#1041#1053#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashOrderCustoms'#39',0) = 1) then '#39#1050#1058#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CustomCheque'#39',0) = 1) then '#39#1052#1050#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'CashOrderBank'#39',0) = 1) then '#39#1050#1041#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderReuse'#39',0) = 1) then '#39#1047#1063#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderRestUFK'#39',0) = 1) then '#39#1055#1054 +
        #39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_in.typesysname,'#39'PaymentOrderRestCustoms'#39',0) = 1) then' +
        ' '#39#1055#1054#39
      '                                       else null'
      '                                     end)'
      '                                else null '
      '                          end) in_way'
      
        '                        ,(case  when (acc.code = '#39'06.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) in_beznal'
      
        '                        ,(case  when (acc.code = '#39'06.01.02'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_expay'
      
        '                        ,(case  when (acc.code = '#39'06.01.05'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) zach_money_lien'
      
        '                        ,(case  when (acc.code = '#39'06.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then'
      '                                    (case '
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_out.typesysname,'#39'CustomDecl'#39',0) = 1) then '#39#1043#1058#1044#39
      
        '                                       when (fdc_object_type_is_' +
        'subtype(ol_out.typesysname,'#39'TPO'#39',0) = 1) then '#39#1058#1055#1054#39
      '                                       else '#39#1048#1085#1099#1077#39
      '                                     end)'
      '                                else null '
      '                          end) out_nach_type'
      
        '                        ,-(case  when (acc.code = '#39'06.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) out_pay'
      
        '                        ,-(case  when (acc.code = '#39'06.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) spisano_money_zal' +
        'og'
      
        '                        ,-(case  when (acc.code = '#39'06.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'06.01.06'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_object_lst ol_in'
      '                      ,fdc_object_lst ol_out'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'ol_in.id(+)'
      
        '                    and p_oborotki.get_deduct_main_doc_id(acct.d' +
        'oc_id) = ol_out.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_summa'
      '                    ,doc_id'
      '                    ,kbk'
      '                    ,in_way'
      '                    ,out_nach_type'
      '           ) a'
      '      where in_beznal != 0'
      '         or zach_expay != 0'
      '         or zach_money_lien != 0'
      '         or out_pay != 0'
      '         or spisano_money_zalog != 0'
      '         or return != 0'
      '         or reuse_out != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_summa'
      '        ,doc_id'
      '        ,kbk'
      '        ,in_way'
      '        ,in_beznal'
      '        ,zach_expay'
      '        ,zach_money_lien'
      '        ,out_nach_type'
      '        ,out_pay'
      '        ,spisano_money_zalog'
      '        ,return'
      '        ,reuse_out),(subject_id,inn,name,type_person),())'
      '     )'
      'union all'
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) doc_summa'
      '      ,to_char(null) kbk'
      '      ,to_char(null) in_way'
      '      ,to_number(null) in_beznal'
      '      ,to_number(null) zach_expay'
      '      ,to_number(null) zach_money_lien'
      '      ,to_char(null) out_nach_type'
      '      ,to_number(null) out_pay'
      '      ,to_number(null) Spisano_money_zalog'
      '      ,to_number(null) return'
      '      ,to_number(null) reuse_out'
      
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
      0400000013000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D41010000000000030000
      00494E4E010000000000040000004E414D450100000000000A000000444F435F
      4E554D42455201000000000009000000444F435F53554D4D4101000000000003
      0000004B424B0100000000000600000052455455524E01000000000009000000
      4F55545F53554D4D4101000000000009000000494E5F42455A4E414C01000000
      00000A0000005A4143485F45585041590100000000000F0000005A4143485F4D
      4F4E45595F4C49454E0100000000001300000053504953414E4F5F4D4F4E4559
      5F5A414C4F470100000000000900000052455553455F4F55540100000000000B
      000000545950455F504552534F4E01000000000006000000494E5F5741590100
      000000000D0000004F55545F4E4143485F54595045010000000000070000004F
      55545F504159010000000000}
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsetDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetDataTYPE_PERSON: TStringField
      FieldName = 'TYPE_PERSON'
      Size = 1
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsetDataIN_WAY: TStringField
      FieldName = 'IN_WAY'
      Size = 2
    end
    object dsetDataIN_BEZNAL: TFloatField
      FieldName = 'IN_BEZNAL'
      DisplayFormat = ',0.00'
    end
    object dsetDataZACH_EXPAY: TFloatField
      FieldName = 'ZACH_EXPAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataZACH_MONEY_LIEN: TFloatField
      FieldName = 'ZACH_MONEY_LIEN'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_NACH_TYPE: TStringField
      FieldName = 'OUT_NACH_TYPE'
      Size = 4
    end
    object dsetDataOUT_PAY: TFloatField
      FieldName = 'OUT_PAY'
      DisplayFormat = ',0.00'
    end
    object dsetDataSPISANO_MONEY_ZALOG: TFloatField
      FieldName = 'SPISANO_MONEY_ZALOG'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataREUSE_OUT: TFloatField
      FieldName = 'REUSE_OUT'
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
