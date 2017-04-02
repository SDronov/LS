inherited qTurnoverF05Form: TqTurnoverF05Form
  Left = 298
  Top = 256
  Width = 854
  Caption = #1089#1095' 01.03.02'
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
          Column = grdTurnoverSheetDBBandedTableViewPostupilo
        end
        item
          Format = ',0.00'
          Kind = skSum
          Column = grdTurnoverSheetDBBandedTableViewIncass
        end>
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
          Width = 460
        end
        item
          Caption = #8470
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 105
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 96
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 84
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
          Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086
          Position.BandIndex = 6
          Position.ColIndex = 0
        end
        item
          Caption = #1048#1085#1082#1072#1089#1089#1080#1088#1086#1074#1072#1085#1086
          Position.BandIndex = 6
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
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'DOC_NUMBER'
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOC_DATE'
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'KBK'
        Width = 200
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'IN_SUMMA'
        Width = 120
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'POSTUPILO'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIncass: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCASS'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'OUT_SUMMA'
        Width = 120
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'  '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.01.03.02 " '#1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080'. '#1048#1085#1082#1072#1089#1089 +
      #1072#1094#1080#1103' '#1080#1079' '#1082#1072#1089#1089#1099' '#1090#1072#1084#1086#1078#1085#1080'" '
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      'select item_no'
      '      ,in_summa'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,incass'
      '      ,postupilo'
      '     ,(in_summa + incass - postupilo) out_summa'
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
      '      ,kbk'
      '      ,sum(incass) incass'
      '      ,sum(postupilo) postupilo'
      'from ('
      
        '      select row_number() over(order by doc_date,doc_number,doc_' +
        'id,kbk) item_no'
      '            ,to_number(null) in_summa'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,kbk'
      '            ,incass'
      '            ,postupilo'
      '      from ('
      '            select doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,sum(incass) incass'
      '                  ,sum(postupilo) postupilo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,po.id doc_id'
      
        '                        ,nvl(po.doc_number,(case when (po.doc_da' +
        'te is null) then null else '#39#1073'/'#1085#39' end)) doc_number'
      '                        ,po.doc_date'
      '                        ,po.kbk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) incass'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_po_lst po'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = :account_id'
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                  )'
      '            group by doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,kbk'
      '           ) a'
      '      where postupilo != 0'
      '         or incass != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,in_summa'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,kbk'
      '        ,incass'
      '        ,postupilo),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      '')
    Optimize = False
    Variables.Data = {
      03000000040000000D0000003A4143434F554E545F434F444505000000000000
      00000000000B0000003A4143434F554E545F4944030000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000017000000070000004954454D5F4E4F01000000000008000000444F43
      5F444154450100000000000E0000004F5045524154494F4E5F44415445010000
      00000008000000494E5F53554D4D4101000000000003000000494E4E01000000
      0000030000004B5050010000000000040000004E414D45010000000000030000
      0046494F0100000000000A000000444F435F4E554D4245520100000000000900
      0000444F435F53554D4D41010000000000030000004B424B0100000000000600
      000042455A4E414C01000000000006000000494E504154480100000000000700
      000052455553455F590100000000000800000049544F474F5F494E0100000000
      00130000004E4F544943454B494E445041595F4156414E530100000000001500
      00004E4F544943454B494E445041595F43454C45564F590100000000000E0000
      00434E4F544943454B494E445041590100000000000E000000434F4E4649524D
      4B494E445041590100000000000600000052455455524E010000000000050000
      0052455553450100000000000900000049544F474F5F4F555401000000000009
      0000004F55545F53554D4D41010000000000}
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
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetDataINCASS: TFloatField
      FieldName = 'INCASS'
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
