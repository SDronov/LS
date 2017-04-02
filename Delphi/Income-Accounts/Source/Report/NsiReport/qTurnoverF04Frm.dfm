inherited qTurnoverF04Form: TqTurnoverF04Form
  Left = 170
  Top = 256
  Width = 854
  Caption = #1089#1095' 01.03.01'
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
          Column = grdTurnoverSheetDBBandedTableViewTransaction
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewPostupilo
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
          Caption = #1050#1055#1055
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 91
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 88
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 3
          Width = 106
        end
        item
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 460
        end
        item
          Caption = #1076#1077#1088#1078#1072#1090#1077#1083#1100' '#1052#1050
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 135
        end
        item
          Caption = #8470
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 119
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 6
          Position.ColIndex = 2
          Width = 110
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 6
          Position.ColIndex = 3
          Width = 96
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 100
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          Width = 200
        end
        item
          Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103
          Position.BandIndex = 12
          Position.ColIndex = 0
        end
        item
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
          Position.BandIndex = 12
          Position.ColIndex = 1
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
      object grdTurnoverSheetDBBandedTableViewKPP: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'KPP'
        Width = 100
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewName: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'NAME'
        Width = 200
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewTypePerson: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'TYPE_PERSON'
        Width = 140
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewHOLDER_MK: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'HOLDER_MK'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'DOC_DATE'
        Width = 80
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'KBK'
        Width = 200
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewTransaction: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'Transaction'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'POSTUPILO'
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
    Caption = #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'  '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.01.03.01 " '#1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080'. '#1052#1050'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) kpp'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      
        'select decode(item_no, lag(item_no, 1) over(order by item_sort n' +
        'ulls first, item_no, name nulls first), null, item_no) item_no'
      '      ,in_summa'
      '      ,inn'
      '      ,kpp'
      '      ,name'
      '      ,type_person'
      '      ,holder_mk'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,transaction'
      '      ,postupilo'
      '      ,(in_summa + transaction - postupilo) out_summa'
      'from ('
      
        'select nvl(to_char(item_no),(case when (subject_id is null and h' +
        'older_mk is null) then '#39#1048#1090#1086#1075#1086#39' when (subject_id is null and hold' +
        'er_mk is not null) then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1076#1077#1088#1078#1072#1090#1077#1083#1102' '#1052#1050#39' else '#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091 +
        #1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044#39' end)) item_no'
      '      ,item_no item_sort'
      '      ,subject_id'
      
        '      ,(case when (item_no is null and subject_id is null and ho' +
        'lder_mk is null) then p_oper_balans.get_bsumma(:account_id,:acco' +
        'unt_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      
        '             when (item_no is null and subject_id is not null) t' +
        'hen p_oper_balans.get_bsumma_account_subject(:account_id,:accoun' +
        't_code,trunc(:bdate),subject_id,0,'#39'rur'#39','#39'rur'#39',0)'
      
        '             when (item_no is null and subject_id is null and ho' +
        'lder_mk is not null) then p_oborotki.get_bsumma_mk(:account_id,t' +
        'runc(:bdate),holder_mk)'
      '             else in_summa'
      '       end) in_summa'
      '      ,inn'
      '      ,kpp'
      '      ,name'
      '      ,type_person'
      '      ,holder_mk'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,kbk'
      '      ,sum(transaction) transaction'
      '      ,sum(postupilo) postupilo'
      'from ('
      
        '      select row_number() over(order by inn,kpp,name,type_person' +
        ',holder_mk,doc_date,doc_number,doc_id,kbk) item_no'
      '            ,to_number(null) in_summa'
      '            ,subject_id'
      '            ,inn'
      '            ,kpp'
      '            ,name'
      '            ,type_person'
      '            ,holder_mk'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,kbk'
      '            ,transaction'
      '            ,postupilo'
      '      from ('
      '            select subject_id'
      '                  ,inn'
      '                  ,kpp'
      '                  ,name'
      '                  ,type_person'
      '                  ,holder_mk'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,sum(transaction) transaction'
      '                  ,sum(postupilo) postupilo'
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
      
        '                        ,(case when (po.paysysname is null) then' +
        ' '#39#1058#1050#39' else '#39#1058#1055#1057#39' end) holder_mk'
      '                        ,po.id doc_id'
      
        '                        ,nvl(po.doc_number,(case when (po.doc_da' +
        'te is null) then null else '#39#1073'/'#1085#39' end)) doc_number'
      '                        ,po.doc_date'
      '                        ,po.kbk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) transaction'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_po_cheque_lst_all po'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = :account_id'
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id'
      '                    and acct.subject_id = sl.id(+)'
      '                  )'
      '            group by subject_id '
      '                    ,inn'
      '                    ,kpp'
      '                    ,name'
      '                    ,type_person'
      '                    ,holder_mk'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,kbk'
      '           ) a'
      '      where transaction != 0 '
      '         or postupilo != 0 '
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,in_summa'
      '        ,subject_id'
      '        ,inn'
      '        ,kpp'
      '        ,name'
      '        ,type_person'
      '        ,holder_mk'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,kbk'
      '        ,transaction'
      
        '        ,postupilo),(holder_mk),(subject_id,inn,kpp,name,type_pe' +
        'rson),())'
      '     )'
      'union all'
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) inn'
      '      ,to_char(null) kpp'
      '      ,to_char(null) name'
      '      ,to_char(null) type_person'
      '      ,to_char(null) holder_mk'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) transaction'
      '      ,to_number(null) postupilo'
      
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
      040000000D000000070000004954454D5F4E4F01000000000008000000444F43
      5F4441544501000000000008000000494E5F53554D4D41010000000000030000
      00494E4E010000000000030000004B5050010000000000040000004E414D4501
      00000000000A000000444F435F4E554D424552010000000000030000004B424B
      010000000000090000004F55545F53554D4D410100000000000B000000545950
      455F504552534F4E01000000000009000000484F4C4445525F4D4B0100000000
      000B0000005452414E53414354494F4E01000000000009000000504F53545550
      494C4F010000000000}
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
    object dsetDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
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
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetDataTransaction: TFloatField
      FieldName = 'Transaction'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataHOLDER_MK: TStringField
      FieldName = 'HOLDER_MK'
      Size = 3
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
