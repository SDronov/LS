inherited qTurnoverF07Form: TqTurnoverF07Form
  Left = 298
  Top = 306
  Width = 854
  Caption = #1089#1095' 02.01.00 '
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited grdTurnoverSheet: TcxGrid
    Width = 838
    inherited grdTurnoverSheetDBBandedTableView: TcxGridDBBandedTableView
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewNach
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
          Column = grdTurnoverSheetDBBandedTableViewPaid
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
          Column = grdTurnoverSheetDBBandedTableViewZadolg
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
          Width = 200
        end
        item
          Caption = #1090#1080#1087' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 62
        end
        item
          Caption = #8470
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 55
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 5
          Position.ColIndex = 2
          Width = 83
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 401
        end
        item
          Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
          Position.BandIndex = 10
          Position.ColIndex = 0
          Width = 117
        end
        item
          Caption = #1059#1087#1083#1072#1095#1077#1085#1086
          Position.BandIndex = 10
          Position.ColIndex = 1
          Width = 144
        end
        item
          Caption = #1055#1077#1088#1077#1074#1077#1076#1077#1085#1086' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
          Position.BandIndex = 10
          Position.ColIndex = 2
          Width = 140
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082' '
          Width = 90
        end
        item
          Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1091#1087#1083#1072#1090#1091
          Width = 340
        end
        item
          Caption = #8470
          Position.BandIndex = 15
          Position.ColIndex = 0
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 15
          Position.ColIndex = 1
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 15
          Position.ColIndex = 2
        end
        item
          Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077' '#1086#1073' '#1091#1087#1083#1072#1090#1077
          Width = 240
        end
        item
          Caption = #8470
          Position.BandIndex = 19
          Position.ColIndex = 0
          Width = 96
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 19
          Position.ColIndex = 1
          Width = 77
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 19
          Position.ColIndex = 2
          Width = 67
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
      object grdTurnoverSheetDBBandedTableNACH_TYPE: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'NACH_TYPE'
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_doc: TcxGridDBBandedColumn
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
        Width = 200
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
      object grdTurnoverSheetDBBandedTableViewNach: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'NACH'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPaid: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'PAID'
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewZadolg: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'ZADOLG'
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
      object grdTurnoverSheetDBBandedTableViewPp_number: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'PP_NUMBER'
        Width = 64
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPp_date: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'PP_DATE'
        Width = 64
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPp_summa: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'PP_SUMMA'
        Width = 64
        Position.BandIndex = 18
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_number: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'NPAY_NUMBER'
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_date: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'NPAY_DATE'
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNoticePay_summa: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'NPAY_SUMMA'
        Position.BandIndex = 22
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 838
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.02.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1072#1084'" '
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual'
      'union all'
      
        'select decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,name'
      '      ,type_person'
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,nach'
      '      ,paid'
      '      ,zadolg'
      '      ,(in_summa + nach - paid - zadolg) out_summa'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,npay_number'
      '      ,npay_date'
      '      ,npay_summa'
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
      '      ,nach_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,sum(nach) nach'
      '      ,sum(paid) paid'
      '      ,sum(zadolg) zadolg'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_doc_id'
      '      ,npay_number'
      '      ,npay_date'
      '      ,npay_summa'
      '      ,npay_doc_id'
      'from ('
      
        '      select row_number() over(order by inn,name,type_person,sub' +
        'ject_id,nach_type,doc_number,doc_date,doc_id) item_no'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,name'
      '            ,type_person'
      '            ,nach_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,nach'
      '            ,paid'
      '            ,zadolg'
      '            ,pp_number'
      '            ,pp_date'
      '            ,pp_summa'
      '            ,pp_doc_id'
      '            ,npay_number'
      '            ,npay_date'
      '            ,npay_summa'
      '            ,npay_doc_id'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,name'
      '                  ,type_person'
      '                  ,nach_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,sum(nach) nach'
      '                  ,sum(paid) paid'
      '                  ,sum(zadolg) zadolg'
      '                  ,pp_number'
      '                  ,pp_date'
      '                  ,pp_summa'
      '                  ,pp_doc_id'
      '                  ,npay_number'
      '                  ,npay_date'
      '                  ,npay_summa'
      '                  ,npay_doc_id'
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
      '                        ,(case  '
      
        '                                when (acc.code = '#39'02.01.01'#39') the' +
        'n '#39#1043#1058#1044#39
      
        '                                when (acc.code = '#39'02.01.02'#39') the' +
        'n '#39#1058#1055#1054#39
      
        '                                when (acc.code = '#39'02.01.03'#39') the' +
        'n '#39#1048#1085#1099#1077#39
      '                                else '#39#39
      '                          end) nach_type'
      '                        ,dc.id doc_id'
      '                        ,dc.name doc_number'
      '                        ,dc.doc_date doc_date'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        'sum_rur else 0 end) nach'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id != nvl(nl.id,0)) then sum_rur else 0 end) paid'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39' and a' +
        'cct.doc_id = nl.id) then sum_rur else 0 end) zadolg'
      '                        ,po.id pp_doc_id'
      '                        ,po.doc_number pp_number'
      '                        ,po.doc_date   pp_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) pp_summa'
      '                        ,nl.id npay_doc_id'
      '                        ,dm.doc_number npay_number'
      '                        ,dm.doc_date npay_date'
      
        '                        ,case when dm.doc_number is not null the' +
        'n fdc_noticepay_get_sum(nl.id, '#39'summa_only_dc'#39') else null end np' +
        'ay_summa'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_document_lst dc'
      '                      ,fdc_po_lst po'
      '                      ,fdc_noticepay_lst nl'
      '                      ,fdc_subject_lst sl'
      
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
      
        '                    and p_oborotki.get_doc_charge_id(acct.doc_id' +
        ') = dc.id(+)'
      
        '                    and p_oborotki.get_pp_doc_id(acct.doc_id) = ' +
        'po.id(+)'
      '                    and acct.doc_id = nl.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                    and dm.owner_object_id (+) = nl.id'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,name'
      '                    ,type_person'
      '                    ,nach_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,pp_number'
      '                    ,pp_date'
      '                    ,pp_summa'
      '                    ,pp_doc_id'
      '                    ,npay_number'
      '                    ,npay_date'
      '                    ,npay_summa'
      '                    ,npay_doc_id'
      '           ) a'
      '      where nach != 0 '
      '         or paid != 0 '
      '         or zadolg != 0'
      '      order by 1'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,subject_id'
      '        ,in_summa'
      '        ,inn'
      '        ,name'
      '        ,type_person'
      '        ,nach_type'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,nach'
      '        ,paid'
      '        ,zadolg'
      '        ,pp_number'
      '        ,pp_date'
      '        ,pp_summa'
      '        ,pp_doc_id'
      '        ,npay_number'
      '        ,npay_date'
      '        ,npay_summa'
      '        ,npay_doc_id),(subject_id,inn,name,type_person),())'
      '     )'
      'union all'
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) nach_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_number(null) nach'
      '      ,to_number(null) paid'
      '      ,to_number(null) zadolg'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      '      ,to_char(null)pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null)npay_number'
      '      ,to_date(null)npay_date'
      '      ,to_number(null) npay_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      03000000040000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D4101000000000003000000494E4E010000000000040000004E414D45
      0100000000000A000000444F435F4E554D424552010000000000090000004F55
      545F53554D4D410100000000000900000050505F4E554D424552010000000000
      0700000050505F444154450100000000000800000050505F53554D4D41010000
      0000000B0000004E5041595F4E554D424552010000000000090000004E504159
      5F444154450100000000000A0000004E5041595F53554D4D4101000000000006
      0000005A41444F4C470100000000000B000000545950455F504552534F4E0100
      00000000090000004E4143485F5459504501000000000008000000444F435F44
      415445010000000000040000004E414348010000000000040000005041494401
      0000000000}
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
    object dsetDataNACH_TYPE: TStringField
      FieldName = 'NACH_TYPE'
      Size = 4
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataNACH: TFloatField
      FieldName = 'NACH'
      DisplayFormat = ',0.00'
    end
    object dsetDataPAID: TFloatField
      FieldName = 'PAID'
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
    object dsetDataPP_NUMBER: TStringField
      FieldName = 'PP_NUMBER'
      Size = 100
    end
    object dsetDataPP_DATE: TDateTimeField
      FieldName = 'PP_DATE'
    end
    object dsetDataPP_SUMMA: TFloatField
      FieldName = 'PP_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataNPAY_NUMBER: TStringField
      FieldName = 'NPAY_NUMBER'
      Size = 100
    end
    object dsetDataNPAY_DATE: TDateTimeField
      FieldName = 'NPAY_DATE'
    end
    object dsetDataNPAY_SUMMA: TFloatField
      FieldName = 'NPAY_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
