inherited qTurnoverF10Form: TqTurnoverF10Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 04.00.00 '
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
          Column = grdTurnoverSheetDBBandedTableViewNachisleno
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIsPaid
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewRemoveFromAcc
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewPaidOthersAcc
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 161
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
          Caption = #1044#1072#1090#1072
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
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 0
        end
        item
          Caption = #1054#1087#1083#1072#1095#1077#1085#1086
          Position.BandIndex = 9
          Position.ColIndex = 1
        end
        item
          Caption = ' '#1057#1085#1103#1090#1086' '#1089' '#1091#1095#1077#1090#1072' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099
          Position.BandIndex = 9
          Position.ColIndex = 2
        end
        item
          Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1089#1095#1077#1090#1072
          Position.BandIndex = 9
          Position.ColIndex = 3
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
      object grdTurnoverSheetDBBandedTableViewNachisleno: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'NACHISLENO'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIsPaid: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'IsPaid'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewRemoveFromAcc: TcxGridDBBandedColumn
        Caption = '10'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPaidOthersAcc: TcxGridDBBandedColumn
        Caption = '11'
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
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.04.00.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1096#1090#1088#1072#1092#1072#1084'" '
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
      '      ,to_number(null) nachisleno'
      '      ,to_number(null) ispaid'
      
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
      '      ,ispaid'
      '      ,nachisleno'
      '      ,(in_summa + nachisleno - ispaid) out_summa'
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
      '      ,doc_id'
      '      ,sum(ispaid) ispaid'
      '      ,sum(nachisleno) nachisleno'
      'from ('
      
        '      select row_number() over(order by name,type_person,inn,sub' +
        'ject_id,doc_number,doc_date,doc_id) item_no'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,nachisleno'
      '            ,ispaid'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(nachisleno) nachisleno'
      '                  ,sum(ispaid) ispaid'
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
      '                        ,dc.id doc_id'
      '                        ,dc.name doc_number'
      '                        ,dc.doc_date doc_date'
      
        '                        ,(case  when (acc.code = '#39'04.01.01'#39' and ' +
        'acct.is_debit = '#39'Y'#39') then sum_rur else 0 end) nachisleno'
      
        '                        ,-(case when (acc.code = '#39'04.01.02'#39' and ' +
        'acct.is_debit = '#39'N'#39') then sum_rur else 0 end) ispaid'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '           ) a'
      '      where ispaid != 0 '
      '         or nachisleno != 0 '
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,in_summa'
      '        ,subject_id'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,nachisleno'
      '        ,ispaid),(subject_id,inn,name,type_person),())'
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
      '      ,to_number(null) nachisleno'
      '      ,to_number(null) ispaid'
      
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
      040000000A000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D41010000000000030000
      00494E4E010000000000040000004E414D450100000000000A000000444F435F
      4E554D424552010000000000090000004F55545F53554D4D410100000000000B
      000000545950455F504552534F4E0100000000000A0000004E41434849534C45
      4E4F01000000000006000000495350414944010000000000}
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
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 1500
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataNACHISLENO: TFloatField
      FieldName = 'NACHISLENO'
      DisplayFormat = ',0.00'
    end
    object dsetDataISPAID: TFloatField
      FieldName = 'ISPAID'
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
