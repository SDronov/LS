inherited qTurnoverF09Form: TqTurnoverF09Form
  Left = 262
  Top = 182
  Width = 890
  Height = 345
  Caption = #1089#1095' 03.00.00 '
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 874
    Height = 281
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewINST
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
          Column = grdTurnoverSheetDBBandedTableViewRest
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
          Column = grdTurnoverSheetDBBandedTableViewRESET
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
          Column = grdTurnoverSheetDBBandedTableViewExcl
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
          Column = grdTurnoverSheetDBBandedTableViewZab
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
          Column = grdTurnoverSheetDBBandedTableViewPay
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
          Column = grdTurnoverSheetDBBandedTableView117
        end
        item
          Format = ',0.00'
          Kind = skSum
        end
        item
          Format = ',0.00'
          Kind = skSum
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1091#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
          FixedKind = fkLeft
          Width = 240
        end
        item
          Caption = #1048#1053#1053
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 87
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 104
        end
        item
          Caption = #1090#1080#1087
          FixedKind = fkLeft
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 49
        end
        item
          Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100' / '#1087#1077#1085#1080
          Width = 117
        end
        item
          Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077
          Width = 360
        end
        item
          Caption = #8470
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 105
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 84
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 6
          Position.ColIndex = 2
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 120
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 770
        end
        item
          Caption = #1059#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 97
        end
        item
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1073#1072#1083#1072#1085#1089#1077
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 91
        end
        item
          Caption = #1055#1086#1075#1072#1096#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 2
          Width = 117
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086
          Position.BandIndex = 11
          Position.ColIndex = 3
          Width = 116
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1079#1072' '#1073#1072#1083#1072#1085#1089
          Position.BandIndex = 11
          Position.ColIndex = 4
          Width = 117
        end
        item
          Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1095#1077#1090#1072
          Position.BandIndex = 11
          Position.ColIndex = 5
          Width = 116
        end
        item
          Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1086' '#1087#1086' '#8470'117'#1085
          Position.BandIndex = 11
          Position.ColIndex = 6
          Width = 116
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
      object grdTurnoverSheetDBBandedTableViewPENY_ZADOLG: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'PENY_ZADOLG'
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOCNUMBER'
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocDate: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOCDATE'
        Width = 200
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocSumma: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DOCSUMMA'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa_itogo: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IN_SUMMA_ITOGO'
        Width = 120
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewINST: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'INST'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRest: TcxGridDBBandedColumn
        Caption = '11'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRESET: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'RESET'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewExcl: TcxGridDBBandedColumn
        Caption = '13'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZab: TcxGridDBBandedColumn
        Caption = '14'
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPay: TcxGridDBBandedColumn
        Caption = '15'
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableView117: TcxGridDBBandedColumn
        Caption = '16'
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_SUMMA_ITOGO: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'OUT_SUMMA_ITOGO'
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 874
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.03.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090 +
      #1080' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084' '#1080' '#1087#1077#1085#1103#1084'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'with peny_summa_date as'
      '('
      'select act.operation_date odate'
      '      ,act.subject_id subjectid'
      '      ,act.is_debit is_debit'
      '      ,nvl(sum(act.sum_rur),0) summa'
      'from fdc_acc_transaction act'
      '    ,fdc_payment_type_lst ptl'
      'where account_id in (:account_030101_id,:account_030103_id)'
      '  and act.payment_type_id = ptl.id'
      
        '  and p_oborotki.is_paytype_peny( ptl.code, act.operation_date )' +
        ' = 1'
      'group by act.operation_date'
      '        ,act.subject_id'
      '        ,act.is_debit'
      ')'
      'select item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,out_summa_itogo'
      'from ('
      '      select to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      '      from dual'
      '     )'
      'union all'
      'select item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,(in_summa_itogo + inst - reset) out_summa_itogo'
      'from ('
      '  select (case'
      '            when (peny_zadolg = '#39#1055#39') then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1077#1085#1080#39
      
        '            when (peny_zadolg = '#39#1047#39') then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090 +
        #1080#39
      '            else '#39#39
      '          end) item_no'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,peny_zadolg'
      '        ,(case'
      
        '            when (peny_zadolg = '#39#1047#39') then (nvl(p_oper_balans.get' +
        '_bsumma(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)' +
        ',0) - in_summa_itogo)'
      '            else in_summa_itogo'
      '          end) in_summa_itogo'
      '        ,docnumber'
      '        ,docdate'
      '        ,docsumma'
      '        ,(case'
      
        '            when (peny_zadolg = '#39#1047#39') then (nvl(p_oper_balans.get' +
        '_isumma(:account_id,:account_code,trunc(:bdate),trunc(:edate),0,' +
        #39'rur'#39','#39'rur'#39',0),0) - inst)'
      '            else inst'
      '          end) inst'
      '        ,(case'
      
        '            when (peny_zadolg = '#39#1047#39') then (-nvl(p_oper_balans.ge' +
        't_osumma(:account_id,:account_code,trunc(:bdate),trunc(:edate),0' +
        ','#39'rur'#39','#39'rur'#39',0),0) - reset)'
      '            else reset'
      '          end) reset'
      '  from ('
      '        select to_char(null) item_no'
      '              ,to_char(null) inn'
      '              ,to_char(null) name'
      '              ,to_char(null) type_person'
      
        '              ,nvl(sum((case when (odate < trunc(:bdate)) then s' +
        'umma else 0 end)),0) in_summa_itogo'
      '              ,to_char(null) docnumber'
      '              ,to_date(null) docdate'
      '              ,to_number(null) docsumma'
      
        '              ,nvl(sum((case when (odate >= trunc(:bdate) and is' +
        '_debit = '#39'Y'#39') then summa else 0 end)),0) inst'
      
        '              ,-nvl(sum((case when (odate >= trunc(:bdate) and i' +
        's_debit = '#39'N'#39') then summa else 0 end)),0) reset'
      '        from peny_summa_date psd'
      '        where odate < trunc(:edate)+1'
      '       )'
      '     ,('
      '        select '#39#1055#39' peny_zadolg from dual'
      '        union all'
      '        select '#39#1047#39' peny_zadolg from dual'
      '       ) pz'
      '     )'
      'union all'
      'select item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,(in_summa_itogo + inst - reset) out_summa_itogo'
      'from ('
      
        'select (case when (item_no is null and subject_id is null and pe' +
        'ny_zadolg is null) then '#39#1048#1090#1086#1075#1086#39
      
        '             when (item_no is null and subject_id is not null an' +
        'd peny_zadolg is null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39
      '             else item_no'
      '       end) item_no'
      '      ,item_no_sort'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      
        '      ,(case when (item_no is null and subject_id is null and pe' +
        'ny_zadolg is null) then p_oper_balans.get_bsumma(:account_id,:ac' +
        'count_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      
        '             when (item_no is null and subject_id is not null an' +
        'd peny_zadolg is null) then p_oper_balans.get_bsumma_account_sub' +
        'ject(:account_id,:account_code,trunc(:bdate),subject_id,0,'#39'rur'#39',' +
        #39'rur'#39',0)'
      '             else in_summa_itogo'
      '       end) in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,(in_summa_itogo + inst - reset) out_summa_itogo'
      'from ('
      'select to_char(item_no) item_no'
      '      ,item_no item_no_sort'
      '      ,subject_id'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,to_number(null) in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,doc_id'
      '      ,sum(inst) inst'
      '      ,sum(reset) reset'
      'from ('
      
        '      select row_number() over(order by name,type_person,inn,sub' +
        'ject_id,peny_zadolg,docnumber,docdate,doc_id) item_no'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,peny_zadolg'
      '            ,docnumber'
      '            ,docdate'
      '            ,docsumma'
      '            ,doc_id'
      '            ,inst'
      '            ,reset'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,peny_zadolg'
      '                  ,docnumber'
      '                  ,docdate'
      '                  ,docsumma'
      '                  ,doc_id'
      '                  ,sum(inst) inst'
      '                  ,sum(reset) reset'
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
      
        '                        ,CASE WHEN p_oborotki.is_paytype_peny( d' +
        'ict.CODE, acct.operation_date)= 1 THEN '#39#1055#39
      '                         ELSE '#39#1047#39' END AS peny_zadolg'
      '                        ,nl.id doc_id'
      '                        ,dm.doc_number docnumber'
      '                        ,dm.doc_date docdate'
      
        '                        ,case when dm.doc_number is not null the' +
        'n fdc_noticepay_get_sum(nl.id, '#39'summa_only_dc'#39') else null end do' +
        'csumma'
      
        '                        ,(case  when (acc.code = '#39'03.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) inst'
      
        '                        ,-(case when (acc.code = '#39'03.01.03'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reset'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      '                      ,fdc_payment_type_lst dict'
      
        '                      ,( select m.id, doc_number, doc_date, m.ow' +
        'ner_object_id from fdc_debts_measures_lst m,'
      
        '                          (select max(id) id, owner_object_id  f' +
        'rom fdc_debts_measures_lst where measures_type in ('#39'B20'#39','#39'B27'#39') ' +
        'group by owner_object_id) om'
      '                         where m.id = om.id'
      '                       ) dm'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      
        '                    and p_oborotki.get_noticepay_id(acct.doc_id)' +
        ' = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and acct.payment_type_id = dict.id'
      '                    and dm.owner_object_id (+) = nl.id'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,peny_zadolg'
      '                    ,docnumber'
      '                    ,docdate'
      '                    ,docsumma'
      '                    ,doc_id'
      '           ) a'
      '      where inst != 0 '
      '         or reset != 0 '
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,subject_id'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,peny_zadolg'
      '        ,docnumber'
      '        ,docdate'
      '        ,docsumma'
      '        ,doc_id'
      '        ,inst'
      '        ,reset),(subject_id,inn,name,type_person),())'
      '     )'
      'order by item_no_sort nulls first, item_no'
      '     )'
      'union all'
      'select item_no'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,peny_zadolg'
      '      ,in_summa_itogo'
      '      ,docnumber'
      '      ,docdate'
      '      ,docsumma'
      '      ,inst'
      '      ,reset'
      '      ,out_summa_itogo'
      'from ('
      '      select to_char(null) item_no'
      '            ,to_char(null) inn'
      '            ,to_char(null) name'
      '            ,to_char(null) type_person'
      '            ,to_char(null) peny_zadolg'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa_itogo'
      '            ,to_char(null) docnumber'
      '            ,to_date(null) docdate'
      '            ,to_number(null) docsumma'
      '            ,to_number(null) inst'
      '            ,to_number(null) reset'
      
        '            ,p_oper_balans.get_bsumma(:account_id,:account_code,' +
        'trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa_itogo'
      '      from dual'
      '     )')
    Optimize = False
    Variables.Data = {
      03000000060000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000120000003A4143434F554E545F3033303130315F
      4944030000000000000000000000120000003A4143434F554E545F3033303130
      335F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000070000004954454D5F4E4F01000000000003000000494E4E
      010000000000040000004E414D4501000000000009000000444F434E554D4245
      5201000000000007000000444F434441544501000000000008000000444F4353
      554D4D410100000000000B000000545950455F504552534F4E0100000000000B
      00000050454E595F5A41444F4C470100000000000E000000494E5F53554D4D41
      5F49544F474F01000000000004000000494E5354010000000000050000005245
      5345540100000000000F0000004F55545F53554D4D415F49544F474F01000000
      0000}
    Left = 64
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 40
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
    object dsetDataPENY_ZADOLG: TStringField
      FieldName = 'PENY_ZADOLG'
      Size = 1
    end
    object dsetDataIN_SUMMA_ITOGO: TFloatField
      FieldName = 'IN_SUMMA_ITOGO'
      DisplayFormat = ',0.00'
    end
    object dsetDataDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 100
    end
    object dsetDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsetDataDOCSUMMA: TFloatField
      FieldName = 'DOCSUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataINST: TFloatField
      FieldName = 'INST'
      DisplayFormat = ',0.00'
    end
    object dsetDataRESET: TFloatField
      FieldName = 'RESET'
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
