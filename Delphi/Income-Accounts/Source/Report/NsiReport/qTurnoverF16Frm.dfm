inherited qTurnoverF16Form: TqTurnoverF16Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 09.00.00'
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
          Column = grdTurnoverSheetDBBandedTableViewReturn
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
          Column = grdTurnoverSheetDBBandedTableViewRReturn
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
          Width = 116
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 192
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 52
        end
        item
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
          Width = 360
        end
        item
          Caption = #1090#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 194
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 78
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 655
        end
        item
          Caption = #1055#1088#1080#1085#1103#1090#1086' '#1088#1077#1096#1077#1085#1080#1081' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '
          Position.BandIndex = 10
          Position.ColIndex = 0
          Width = 201
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
          Position.BandIndex = 10
          Position.ColIndex = 1
          Width = 227
        end
        item
          Caption = #1079#1072#1095#1077#1090' '#1074' '#1076#1088#1091#1075#1080#1077' '#1090#1072#1084#1086#1078#1085#1080
          Position.BandIndex = 10
          Position.ColIndex = 2
          Width = 227
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
      object grdTurnoverSheetDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_TYPE'
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOC_DATE'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'RETURN'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRReturn: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'RRETURN'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReuse_out: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'REUSE_OUT'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.09.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1084'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) rreturn'
      '      ,to_number(null) reuse_out'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0)'
      '       ) out_summa'
      'from dual'
      'union all'
      
        'select decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,return'
      '      ,rreturn'
      '      ,reuse_out'
      '      ,(in_summa + return - rreturn - reuse_out) out_summa'
      'from ('
      
        'select nvl(to_char(item_no),(case when (subject_id is null) then' +
        ' '#39#1048#1090#1086#1075#1086#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null) then ' +
        '(p_oper_balans.get_bsumma(:account_id,:account_code,trunc(:bdate' +
        '),0,'#39'rur'#39','#39'rur'#39',0) + p_oper_balans.get_bsumma(:account_reuse_id,' +
        ':account_reuse_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0))'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen (p_oper_balans.get_bsumma_account_subject(:account_id,:accou' +
        'nt_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0) + p_oper_balan' +
        's.get_bsumma_account_subject(:account_reuse_id,:account_reuse_co' +
        'de,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0))'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(return) return'
      '      ,sum(rreturn) rreturn'
      '      ,sum(reuse_out) reuse_out'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_type,doc_date,doc_number,doc_id) item_no'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,return'
      '            ,rreturn'
      '            ,reuse_out'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(return) return'
      '                  ,sum(rreturn) rreturn'
      '                  ,sum(reuse_out) reuse_out'
      '            from ('
      '                  select acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.id when -1 then null else (cas' +
        'e sl.typesysname when '#39'Person'#39' then '#39#1060#39' else '#39#1070#39' end) end) type_' +
        'person'
      '                        ,('
      '                          case '
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Advance'#39','#39'DecPayback356'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Deposit'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'Levy'#39','#39'DecPaybackPay'#39','#39'DecPaybackPeriodic'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080#1096 +
        #1085#1077#1081' '#1091#1087#1083#1072#1090#1099' ('#1074#1079#1099#1089#1082#1072#1085#1080#1103')'#39
      
        '                            when (rd.typesysname in ('#39'DecPayback' +
        'TimeOut'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1079#1072' '#1085#1072#1088#1091#1096#1077#1085#1080#1077' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#39
      
        '                            when (rd.typesysname in ('#39'DecisionPa' +
        'ybackOutback'#39')) then '#39#1042#1086#1079#1074#1088#1072#1090' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1074#1077#1088#1085#1091#1074#1096#1080#1093#1089#1103' '#1085#1072' '#1089#1095 +
        #1077#1090#39
      '                            else null'
      '                          end'
      '                         ) doc_type'
      '                        ,rd.id doc_id'
      '                        ,rd.doc_number doc_number'
      '                        ,rd.doc_date doc_date'
      
        '                        ,(case  when (acc.code in ('#39'09.01.01'#39','#39'0' +
        '9.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'Y'#39') then su' +
        'm_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code in ('#39'09.01.01'#39','#39 +
        '09.01.02'#39','#39'09.01.03'#39','#39'09.01.04'#39') and acct.is_debit = '#39'N'#39') then s' +
        'um_rur else 0 end) rreturn'
      '                        ,0 reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst d'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                    and acct.doc_id = d.id'
      
        '                    and d.typesysname in ('#39'DecPaybackAdvance'#39','#39'D' +
        'ecPayback356'#39','#39'DecPaybackDeposit'#39','#39'DecPaybackLevy'#39','#39'DecPaybackPa' +
        'y'#39','#39'DecPaybackPeriodic'#39','#39'DecPaybackTimeOut'#39','#39'DecisionPaybackOutb' +
        'ack'#39','#39'Payment_Order_PayBack'#39','#39'CancelDecisionPayback'#39')'
      
        '                    and p_oborotki.get_decision_on_return_id(d.i' +
        'd) = rd.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                  union all'
      '                  select acct.subject_id subject_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) name'
      
        '                        ,(case sl.id when -1 then null else (cas' +
        'e sl.typesysname when '#39'Person'#39' then '#39#1060#39' else '#39#1070#39' end) end) type_' +
        'person'
      '                        ,'#39#1047#1072#1095#1077#1090' '#1084#1077#1078#1076#1091' '#1058#1054#39' doc_type'
      '                        ,rd.id doc_id'
      '                        ,rd.doc_number doc_number'
      '                        ,rd.doc_date doc_date'
      
        '                        ,(case  when (acc.code = '#39'09.02.00'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) return'
      '                        ,0 rreturn'
      
        '                        ,-(case  when (acc.code = '#39'09.02.00'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) reuse_out'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      
        '                        select :account_reuse_id id, :account_re' +
        'use_code code'
      '                        from dual'
      '                       ) acc'
      '                      ,fdc_document_lst d'
      '                      ,fdc_document_lst rd'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      '                    and acct.doc_id = d.id'
      
        '                    and d.typesysname in ('#39'DocReuse'#39','#39'DocReuseY'#39 +
        ')'
      '                    and p_oborotki.get_reuse_id(d.id) = rd.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where return != 0 '
      '         or rreturn != 0 '
      '         or reuse_out != 0 '
      '      order by 1'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_type'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,return'
      '        ,rreturn'
      '        ,reuse_out),(subject_id,inn,name,type_person),())'
      '     )'
      'union all'
      'select to_char(null) item_no'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '       ) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) return'
      '      ,to_number(null) rreturn'
      '      ,to_number(null) reuse_out'
      '      ,('
      
        '       p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0)'
      '       +'
      
        '       p_oper_balans.get_bsumma(:account_reuse_id,:account_reuse' +
        '_code,trunc(:edate)+1,0,'#39'rur'#39','#39'rur'#39',0)'
      '       ) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000060000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000110000003A4143434F554E545F52455553455F49
      44030000000000000000000000130000003A4143434F554E545F52455553455F
      434F4445050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000C000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D4101000000000003000000494E4E010000000000040000004E414D45
      0100000000000A000000444F435F4E554D424552010000000000090000004F55
      545F53554D4D410100000000000900000052455553455F4F5554010000000000
      0B000000545950455F504552534F4E01000000000008000000444F435F545950
      4501000000000008000000444F435F4441544501000000000006000000524554
      55524E010000000000070000005252455455524E010000000000}
    Left = 64
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
    object dsetDataDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 45
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataRRETURN: TFloatField
      FieldName = 'RRETURN'
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
