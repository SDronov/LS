inherited qTurnoverF15Form: TqTurnoverF15Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 08.01.00'
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
          Column = grdTurnoverSheetDBBandedTableViewIsRevealed
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewOffset_Acc
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewReturn
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNotVostr
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewOffset_indep
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
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 88
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 106
        end
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Width = 360
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
          Width = 84
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 400
        end
        item
          Caption = #1074#1099#1103#1074#1083#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1085#1072' '#1083#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = #1074#1086#1079#1074#1088#1072#1097#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1085#1077' '#1074#1086#1089#1090#1088#1077#1073#1086#1074#1072#1085#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 3
        end
        item
          Caption = #1079#1072#1095#1090#1077#1085#1086' '#1087#1086' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
          Position.BandIndex = 9
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
      object grdTurnoverSheetDBBandedTableViewDocNumbe: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'DOC_DATE'
        Width = 200
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIsRevealed: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'ISREVEALED'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOffset_Acc: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'OFFSET_ACC'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewReturn: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'RETURN'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNotVostr: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'NOTVOSTR'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOffset_indep: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'OFFSET_INDEP'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.08.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1080#1079#1083#1080#1096#1085#1077' '#1091#1087#1083#1072 +
      #1095#1077#1085#1085#1099#1084' ('#1074#1079#1099#1089#1082#1072#1085#1085#1099#1084') '#1087#1083#1072#1090#1077#1078#1072#1084'"'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
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
      '      ,isrevealed'
      '      ,offset_acc'
      '      ,return'
      '      ,notvostr'
      '      ,offset_indep'
      
        '      ,(in_summa + isrevealed - offset_acc - return - notvostr -' +
        ' offset_indep) out_summa'
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
      '      ,sum(isrevealed) isrevealed'
      '      ,sum(offset_acc) offset_acc'
      '      ,sum(return) return'
      '      ,sum(notvostr) notvostr'
      '      ,sum(offset_indep) offset_indep'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,doc_date,doc_number) item_no'
      '            ,subject_id'
      '            ,to_number(null) in_summa'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,doc_date'
      '            ,isrevealed'
      '            ,offset_acc'
      '            ,return'
      '            ,notvostr'
      '            ,offset_indep'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,sum(isrevealed) isrevealed'
      '                  ,sum(offset_acc) offset_acc'
      '                  ,sum(return) return'
      '                  ,sum(notvostr) notvostr'
      '                  ,sum(offset_indep) offset_indep'
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
      '                       ,dl.name doc_number'
      '                       ,dl.doc_date doc_date'
      
        '                        ,(case  when (acc.code = '#39'08.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) isrevealed'
      
        '                        ,-(case  when (acc.code = '#39'08.01.02'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_acc'
      
        '                        ,-(case  when (acc.code = '#39'08.01.03'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) return'
      
        '                        ,-(case  when (acc.code = '#39'08.01.04'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) notvostr'
      
        '                        ,-(case  when (acc.code = '#39'08.01.05'#39' and' +
        ' acct.is_debit = '#39'N'#39') then sum_rur else 0 end) offset_indep'
      '                  from fdc_acc_transaction acct'
      '                  join ('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      
        '                  on (acct.is_current = 1 and acct.account_id = ' +
        'acc.id and operation_date between trunc(:bdate) and trunc(:edate' +
        ') )'
      '                  join fdc_document_lst dl1'
      
        '                  on ( dl1.id =acct.doc_id and nvl(dl1.typesysna' +
        'me, '#39' '#39') not in ('#39'DecisionPaymentPeriodic'#39','#39'DecPaybackPeriodic'#39',' +
        #39'CancelDecisionPayback'#39','
      
        '                                                                ' +
        '                     '#39'DecPaybackLevy'#39', '#39'DecPaybackPay'#39', '#39'Decisio' +
        'nPayment'#39') )'
      '                  left outer join fdc_subject_lst sl'
      '                  on ( acct.subject_id = sl.id )'
      '                  left outer join fdc_document_lst dl'
      
        '                  on ( p_oborotki.get_doc_charge_id(acct.doc_id)' +
        ' = dl.id)'
      '                  union all            '
      '             select  acct1.kbk_id'
      '                    ,acct1.subject_id'
      '                    ,acct1.account_id'
      '                    ,acct1.operation_date'
      
        '                    ,(case sl1.id when -1 then '#39' '#39' else sl1.inn ' +
        'end) inn'
      
        '                    ,(case sl1.id when -1 then '#39' '#39' else sl1.kpp ' +
        'end) kpp'
      
        '                    ,(case sl1.id when -1 then '#39' '#39' else sl1.name' +
        ' end) name'
      
        '                    ,(case sl1.typesysname when '#39'Person'#39' then '#39#1060 +
        #39' else '#39#1070#39' end)  as  type_person'
      
        '                    ,(case when (dc1.doc_date is not null) then ' +
        'dc1.name else null end) doc_number'
      '                    ,dc1.doc_date'
      '                    ,0 isrevealed'
      
        '                    ,(case  when (acct1.code = '#39'08.01.02'#39') then ' +
        'rp.summa  else 0 end) offset_acc'
      
        '                    ,(case  when (acct1.code = '#39'08.01.03'#39') then ' +
        'rp.summa  else 0 end) return'
      '                    ,0 notvostr'
      '                    ,0 offset_indep'
      '                  from ('
      '                        select distinct'
      '                               act1.doc_id'
      '                              ,act1.account_id'
      '                              ,acc1.code'
      '                              ,act1.operation_date'
      '                              ,act1.subject_id'
      '                              ,act1.kbk_id'
      '                        from ('
      '                              select id '
      '                              from fdc_document_lst'
      
        '                              where (typesysname in ('#39'DecisionPa' +
        'ymentPeriodic'#39','#39'DecPaybackPeriodic'#39','#39'CancelDecisionPayback'#39','
      
        '                                                     '#39'DecPayback' +
        'Levy'#39', '#39'DecPaybackPay'#39', '#39'DecisionPayment'#39')'
      
        '                                and (activation_date between tru' +
        'nc(:bdate) and  trunc(:edate)) )'
      '                             ) dl1'
      '                            ,fdc_acc_transaction act1'
      '                            ,('
      '                              select id, code'
      '                              from fdc_acc_lst al'
      '                              start with id = :account_id'
      '                              connect by prior id = parent_id'
      '                             ) acc1'
      '                        where dl1.id = act1.doc_id'
      
        '                        and (act1.operation_date between trunc(:' +
        'bdate) and  trunc(:edate))'
      '                        and act1.account_id = acc1.id'
      '                       ) acct1'
      '                       join fdc_value_lst v'
      '                       on ( v.owner_object_id = acct1.doc_id )'
      '                       join fdc_reserved_payment_lst rp'
      '                       on ( rp.id = v.ref_object_id )'
      '                       left outer join fdc_subject_lst sl1'
      '                       on ( sl1.id = acct1.subject_id )'
      '                       left outer join fdc_document_lst dc1'
      '                       on ( rp.doc_id = dc1.id)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '                    ,doc_date'
      '           ) a'
      '      where isrevealed != 0 '
      '         or offset_acc != 0 '
      '         or return != 0 '
      '         or notvostr != 0 '
      '         or offset_indep != 0 '
      '      order by 1'
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
      '        ,isrevealed'
      '        ,offset_acc'
      '        ,return'
      '        ,notvostr'
      '        ,offset_indep),(subject_id,inn,name,type_person),())'
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
      '      ,to_number(null) isrevealed'
      '      ,to_number(null) offset_acc'
      '      ,to_number(null) return'
      '      ,to_number(null) notvostr'
      '      ,to_number(null) offset_indep'
      
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
      040000000D000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D4101000000000003000000494E4E010000000000040000004E414D45
      0100000000000A000000444F435F4E554D424552010000000000060000005245
      5455524E010000000000090000004F55545F53554D4D410100000000000B0000
      00545950455F504552534F4E01000000000008000000444F435F444154450100
      000000000A000000495352455645414C45440100000000000A0000004F464653
      45545F414343010000000000080000004E4F54564F5354520100000000000C00
      00004F46465345545F494E444550010000000000}
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
      Size = 2
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 1500
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataISREVEALED: TFloatField
      FieldName = 'ISREVEALED'
      DisplayFormat = ',0.00'
    end
    object dsetDataOFFSET_ACC: TFloatField
      FieldName = 'OFFSET_ACC'
      DisplayFormat = ',0.00'
    end
    object dsetDataRETURN: TFloatField
      FieldName = 'RETURN'
      DisplayFormat = ',0.00'
    end
    object dsetDataNOTVOSTR: TFloatField
      FieldName = 'NOTVOSTR'
      DisplayFormat = ',0.00'
    end
    object dsetDataOFFSET_INDEP: TFloatField
      FieldName = 'OFFSET_INDEP'
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
