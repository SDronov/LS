inherited qTurnoverF17Form: TqTurnoverF17Form
  Left = 170
  Top = 164
  Width = 854
  Caption = #1089#1095' 12.01.00 '
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
        end>
      OptionsView.CellAutoHeight = True
      OptionsView.FooterAutoHeight = True
      Bands = <
        item
          Caption = #8470' '#1087'/'#1087
          FixedKind = fkLeft
          Width = 40
        end
        item
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080'/'#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 1
          Position.ColIndex = 0
          Width = 120
        end
        item
          Caption = #8470
          Position.BandIndex = 1
          Position.ColIndex = 1
          Width = 82
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 1
          Position.ColIndex = 2
          Width = 90
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 1
          Position.ColIndex = 3
          Width = 150
        end
        item
          Caption = #1091#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
          Width = 800
        end
        item
          Caption = #1048#1053#1053
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 115
        end
        item
          Caption = #1050#1055#1055
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 147
        end
        item
          Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'/'#1060#1048#1054
          Position.BandIndex = 6
          Position.ColIndex = 2
          Width = 300
        end
        item
          Caption = #1090#1080#1087
          Position.BandIndex = 6
          Position.ColIndex = 3
          Width = 20
        end
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
          Width = 200
        end
        item
          Caption = #1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #8470
          Position.BandIndex = 12
          Position.ColIndex = 0
          Width = 100
        end
        item
          Caption = #1076#1072#1090#1072
          Position.BandIndex = 12
          Position.ColIndex = 1
        end
        item
          Caption = #1089#1091#1084#1084#1072
          Position.BandIndex = 12
          Position.ColIndex = 2
        end
        item
          Caption = #1050#1041#1050
          Position.BandIndex = 12
          Position.ColIndex = 3
        end
        item
          Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          Width = 201
        end
        item
          Caption = #1054#1073#1086#1088#1086#1090#1099' '#1079#1072'  '#1087#1077#1088#1080#1086#1076
          FixedKind = fkRight
          Width = 344
        end
        item
          Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081'/'#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1081
          FixedKind = fkRight
          Position.BandIndex = 18
          Position.ColIndex = 0
          Width = 180
        end
        item
          Caption = #1042#1082#1083#1102#1095#1077#1085#1086' '#1074' '#1088#1077#1077#1089#1090#1088
          FixedKind = fkRight
          Position.BandIndex = 18
          Position.ColIndex = 1
          Width = 180
        end
        item
          Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
          FixedKind = fkRight
          Width = 150
        end>
      object grdTurnoverSheetDBBandedTableViewItem_no: TcxGridDBBandedColumn
        Caption = '1'
        DataBinding.FieldName = 'ITEM_NO'
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'DOC_TYPE'
        Width = 120
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOC_NUMBER'
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'DOC_DATE'
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'KBK'
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'SUBJECT_INN'
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'SUBJECT_KPP'
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'SUBJECT_NAME'
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewSUBJECT_TYPE: TcxGridDBBandedColumn
        Caption = '9'
        DataBinding.FieldName = 'SUBJECT_TYPE'
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDOC_NACH: TcxGridDBBandedColumn
        Caption = '10'
        DataBinding.FieldName = 'DOC_NACH'
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPP_NUMBER: TcxGridDBBandedColumn
        Caption = '11'
        DataBinding.FieldName = 'PP_NUMBER'
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPP_DATE: TcxGridDBBandedColumn
        Caption = '12'
        DataBinding.FieldName = 'PP_DATE'
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPP_SUMMA: TcxGridDBBandedColumn
        Caption = '13'
        DataBinding.FieldName = 'PP_SUMMA'
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPP_KBK: TcxGridDBBandedColumn
        Caption = '14'
        DataBinding.FieldName = 'PP_KBK'
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIN_SUMMA: TcxGridDBBandedColumn
        Caption = '15'
        DataBinding.FieldName = 'IN_SUMMA'
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIN_UVED: TcxGridDBBandedColumn
        Caption = '16'
        DataBinding.FieldName = 'IN_UVED'
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_UVED: TcxGridDBBandedColumn
        Caption = '17'
        DataBinding.FieldName = 'OUT_UVED'
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOUT_SUMMA: TcxGridDBBandedColumn
        Caption = '18'
        DataBinding.FieldName = 'OUT_SUMMA'
        Position.BandIndex = 21
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
  end
  inherited PanelHeading: TPanel
    Width = 846
    Caption = 
      #1054#1073#1086#1088#1086#1090#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1089#1095#1077#1090#1091' '#1058'.12.01.00 "'#1056#1072#1089#1095#1077#1090#1099' '#1089' '#1073#1102#1076#1078#1077#1090#1086#1084' '#1087#1086' '#1079 +
      #1072#1095#1077#1090#1091' '#1087#1083#1072#1090#1077#1078#1077#1081'"'
  end
  inherited dsetData: TOracleDataSet
    SQL.Strings = (
      'select to_char(null) item_no'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_char(null) subject_inn'
      '      ,to_char(null) subject_kpp'
      '      ,to_char(null) subject_name'
      '      ,to_char(null) subject_type'
      '      ,to_char(null) doc_nach'
      '      ,to_char(null) pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null) pp_kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_number(null) in_uved'
      '      ,to_number(null) out_uved'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate),0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1050#1041#1050' '#1072#1074#1072#1085#1089
      'select item_no'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,in_summa'
      '      ,in_uved'
      '      ,out_uved'
      '      ,(in_summa + in_uved - out_uved) out_summa'
      'from ('
      '      select to_char('#39' '#39') item_no'
      
        '            ,to_char('#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1050#1041#1050' '#1072#1074#1072#1085 +
        #1089#39') doc_type'
      '            ,to_char(null) doc_number'
      '            ,to_date(null) doc_date'
      '            ,to_char(null) kbk'
      '            ,to_char(null) subject_inn'
      '            ,to_char(null) subject_kpp'
      '            ,to_char(null) subject_name'
      '            ,to_char(null) subject_type'
      '            ,to_char(null) doc_nach'
      '            ,to_char(null) pp_number'
      '            ,to_date(null) pp_date'
      '            ,to_number(null) pp_summa'
      '            ,to_char(null) pp_kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_kbkavans_id,:acco' +
        'unt_kbkavans_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      
        '            ,p_oper_balans.get_isumma(:account_kbkavans_id,:acco' +
        'unt_kbkavans_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) i' +
        'n_uved'
      
        '            ,-p_oper_balans.get_osumma(:account_kbkavans_id,:acc' +
        'ount_kbkavans_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) ' +
        'out_uved'
      '      from dual'
      '     )'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1094#1077#1083#1077#1074#1086#1075#1086' '#1050#1041#1050
      'select item_no'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,in_summa'
      '      ,in_uved'
      '      ,out_uved'
      '      ,(in_summa + in_uved - out_uved) out_summa'
      'from ('
      '      select to_char('#39' '#39') item_no'
      
        '            ,to_char('#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1094#1077#1083#1077#1074#1086#1075#1086 +
        ' '#1050#1041#1050#39') doc_type'
      '            ,to_char(null) doc_number'
      '            ,to_date(null) doc_date'
      '            ,to_char(null) kbk'
      '            ,to_char(null) subject_inn'
      '            ,to_char(null) subject_kpp'
      '            ,to_char(null) subject_name'
      '            ,to_char(null) subject_type'
      '            ,to_char(null) doc_nach'
      '            ,to_char(null) pp_number'
      '            ,to_date(null) pp_date'
      '            ,to_number(null) pp_summa'
      '            ,to_char(null) pp_kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_kbkcelevoy_id,:ac' +
        'count_kbkcelevoy_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      
        '            ,p_oper_balans.get_isumma(:account_kbkcelevoy_id,:ac' +
        'count_kbkcelevoy_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',' +
        '0) in_uved'
      
        '            ,-p_oper_balans.get_osumma(:account_kbkcelevoy_id,:a' +
        'ccount_kbkcelevoy_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39 +
        ',0) out_uved'
      '      from dual'
      '     )'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
      'select item_no'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,in_summa'
      '      ,in_uved'
      '      ,out_uved'
      '      ,(in_summa + in_uved - out_uved) out_summa'
      'from ('
      '      select to_char('#39' '#39') item_no'
      
        '            ,to_char('#39#1048#1090#1086#1075#1086' '#1087#1086' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1102' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1080#1079#1083#1080#1096#1085#1077#1081 +
        ' '#1091#1087#1083#1072#1090#1099#39') doc_type'
      '            ,to_char(null) doc_number'
      '            ,to_date(null) doc_date'
      '            ,to_char(null) kbk'
      '            ,to_char(null) subject_inn'
      '            ,to_char(null) subject_kpp'
      '            ,to_char(null) subject_name'
      '            ,to_char(null) subject_type'
      '            ,to_char(null) doc_nach'
      '            ,to_char(null) pp_number'
      '            ,to_date(null) pp_date'
      '            ,to_number(null) pp_summa'
      '            ,to_char(null) pp_kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_extpay_id,:accoun' +
        't_extpay_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      
        '            ,-p_oper_balans.get_isumma(:account_extpay_id,:accou' +
        'nt_extpay_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) in_u' +
        'ved'
      
        '            ,p_oper_balans.get_osumma(:account_extpay_id,:accoun' +
        't_extpay_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) out_u' +
        'ved'
      '      from dual'
      '     )'
      'union all'
      '--'#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1102
      'select item_no'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,in_summa'
      '      ,in_uved'
      '      ,out_uved'
      '      ,(in_summa + in_uved - out_uved) out_summa'
      'from ('
      '      select to_char('#39' '#39') item_no'
      '            ,to_char('#39#1048#1090#1086#1075#1086' '#1087#1086' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1102#39') doc_type'
      '            ,to_char(null) doc_number'
      '            ,to_date(null) doc_date'
      '            ,to_char(null) kbk'
      '            ,to_char(null) subject_inn'
      '            ,to_char(null) subject_kpp'
      '            ,to_char(null) subject_name'
      '            ,to_char(null) subject_type'
      '            ,to_char(null) doc_nach'
      '            ,to_char(null) pp_number'
      '            ,to_date(null) pp_date'
      '            ,to_number(null) pp_summa'
      '            ,to_char(null) pp_kbk'
      
        '            ,p_oper_balans.get_bsumma(:account_confirm_id,:accou' +
        'nt_confirm_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      
        '            ,p_oper_balans.get_isumma(:account_confirm_id,:accou' +
        'nt_confirm_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) in_' +
        'uved'
      
        '            ,-p_oper_balans.get_osumma(:account_confirm_id,:acco' +
        'unt_confirm_code,trunc(:bdate),trunc(:edate),0,'#39'rur'#39','#39'rur'#39',0) ou' +
        't_uved'
      '      from dual'
      '     )'
      'union all'
      'select item_no'
      '      ,doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,in_summa'
      '      ,in_uved'
      '      ,out_uved'
      '      ,(in_summa + in_uved - out_uved) out_summa'
      'from ('
      'select to_char(item_no) item_no'
      '      ,item_no item_no_sort'
      
        '      ,nvl(doc_type,(case when (item_no is null) then '#39#1048#1090#1086#1075#1086#39' el' +
        'se doc_type end)) doc_type'
      '      ,doc_number'
      '      ,doc_date'
      '      ,doc_id'
      '      ,kbk'
      '      ,subject_inn'
      '      ,subject_kpp'
      '      ,subject_name'
      '      ,subject_type'
      '      ,doc_nach'
      '      ,pp_number'
      '      ,pp_date'
      '      ,pp_summa'
      '      ,pp_kbk'
      '      ,pp_doc_id'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',0)'
      '                                    else in_summa'
      '       end) in_summa'
      '      ,sum(in_uved) in_uved'
      '      ,sum(out_uved) out_uved'
      'from ('
      
        '      select row_number() over(order by doc_type, doc_date, doc_' +
        'number, doc_id, kbk, subject_inn, subject_kpp, subject_name, sub' +
        'ject_type, doc_nach, pp_date, pp_number, pp_kbk, pp_summa, pp_do' +
        'c_id) item_no'
      '            ,doc_type'
      '            ,doc_number'
      '            ,doc_date'
      '            ,doc_id'
      '            ,kbk'
      '            ,subject_inn'
      '            ,subject_kpp'
      '            ,subject_name'
      '            ,subject_type'
      '            ,doc_nach'
      '            ,pp_number'
      '            ,pp_date'
      '            ,pp_summa'
      '            ,pp_kbk'
      '            ,pp_doc_id'
      '            ,to_number(null) in_summa'
      '            ,in_uved'
      '            ,out_uved'
      '      from ('
      '            select doc_type'
      '                  ,doc_number'
      '                  ,doc_date'
      '                  ,doc_id'
      '                  ,kbk'
      '                  ,subject_inn'
      '                  ,subject_kpp'
      '                  ,subject_name'
      '                  ,subject_type'
      '                  ,doc_nach'
      '                  ,pp_number'
      '                  ,pp_date'
      '                  ,pp_summa'
      '                  ,pp_kbk'
      '                  ,pp_doc_id'
      '                  ,sum(in_uved) in_uved'
      '                  ,sum(out_uved) out_uved'
      '            from ('
      '                  select ('
      '                          case'
      
        '                            when (skl.typesysname in ('#39'NoticeSpe' +
        'cifyKindPay'#39','#39'NoticeSpecifyKindPaySumm'#39')) then '#39#1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1091 +
        #1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072#39
      
        '                            when (skl.typesysname in ('#39'NoticeSpe' +
        'cifyKindPayCorr'#39','#39'NoticeSpecifyKindPayCorrSumm'#39')) then '#39#1059#1074#1077#1076#1086#1084#1083#1077 +
        #1085#1080#1077' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072' ('#1080#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072')' +
        #39
      
        '                            when (skl.typesysname in ('#39'ConfirmSp' +
        'ecifyKindPay'#39','#39'ConfirmSpecifyKindPaySumm'#39')) then '#39#1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' ' +
        #1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072#39
      '                            else null'
      '                          end'
      '                         ) doc_type'
      '                        ,skl.id doc_id'
      '                        ,skl.doc_number'
      '                        ,skl.doc_date'
      
        '                        ,(case when (skl.typesysname in ('#39'Notice' +
        'SpecifyKindPayCorr'#39','#39'NoticeSpecifyKindPayCorrSumm'#39')) then skl.kb' +
        'k_code_s else skl.kbk_code_t end) kbk'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      '                        ,(case '
      
        '                            when (fdc_object_type_is_subtype(dl.' +
        'typesysname,'#39'CustomDecl'#39',0) = 1) then dl.name || '#39'  '#1043#1058#1044#39
      
        '                            when (fdc_object_type_is_subtype(dl.' +
        'typesysname,'#39'TPO'#39',0) = 1) then dl.name || '#39' '#1058#1055#1054#39
      
        '                            when (dl.typesysname is not null) th' +
        'en dl.doc_number || '#39' '#1080#1085#1099#1077#39
      '                            else null'
      '                          end) doc_nach'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.in' +
        'n end) subject_inn'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.kp' +
        'p end) subject_kpp'
      
        '                        ,(case sl.id when -1 then '#39' '#39' else sl.na' +
        'me end) subject_name'
      
        '                        ,(case when (sl.id = -1)or(sl.id is null' +
        ') then null else (case sl.typesysname when '#39'Person'#39' then '#39#1060#39' els' +
        'e '#39#1070#39' end) end) subject_type'
      '                        ,po.id pp_doc_id'
      '                        ,po.doc_number pp_number'
      '                        ,po.doc_date pp_date'
      
        '                        ,(case when (nvl(po.summa,0)>0) then po.' +
        'summa else po.doc_summa end) pp_summa'
      '                        ,po.kbk pp_kbk'
      
        '                        ,(case  when (acct.is_debit = '#39'Y'#39') then ' +
        '(sum_rur * (case when (acc.code in ('#39'12.01.03'#39')) then -1 else 1 ' +
        'end)) else 0 end) in_uved'
      
        '                        ,-(case  when (acct.is_debit = '#39'N'#39') then' +
        ' (sum_rur * (case when (acc.code in ('#39'12.01.03'#39')) then -1 else 1' +
        ' end)) else 0 end) out_uved'
      '                  from fdc_acc_transaction acct'
      '                      ,('
      '                        select id, code'
      '                        from fdc_acc_lst'
      '                        start with id = :account_id'
      '                        connect by prior id = parent_id'
      '                       ) acc'
      '                      ,fdc_bud_specify_kindpay_lst skl'
      '                      ,fdc_payment_deduction pd'
      '                      ,fdc_po_lst po'
      '                      ,fdc_doc_charge_lst dl'
      '                      ,fdc_subject_lst sl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.is_current = 1'
      '                    and acct.account_id = acc.id'
      
        '                    and p_oborotki.get_skindpay_id(acct.doc_id) ' +
        '= skl.id(+)'
      '                    and acct.doc_id = pd.id(+)'
      '                    and pd.decl_id = dl.id(+)'
      '                    and pd.payment_id = po.id(+)'
      '                    and acct.subject_id = sl.id(+)'
      '                  )'
      '            group by doc_type'
      '                    ,doc_number'
      '                    ,doc_date'
      '                    ,doc_id'
      '                    ,kbk'
      '                    ,subject_inn'
      '                    ,subject_kpp'
      '                    ,subject_name'
      '                    ,subject_type'
      '                    ,doc_nach'
      '                    ,pp_number'
      '                    ,pp_date'
      '                    ,pp_summa'
      '                    ,pp_kbk'
      '                    ,pp_doc_id'
      '          ) a'
      '      where in_uved != 0'
      '         or out_uved != 0'
      '     )'
      'group by grouping sets(('
      '         item_no'
      '        ,doc_type'
      '        ,doc_number'
      '        ,doc_date'
      '        ,doc_id'
      '        ,kbk'
      '        ,subject_inn'
      '        ,subject_kpp'
      '        ,subject_name'
      '        ,subject_type'
      '        ,doc_nach'
      '        ,pp_number'
      '        ,pp_date'
      '        ,pp_summa'
      '        ,pp_kbk'
      '        ,pp_doc_id'
      '        ,in_summa'
      '        ,in_uved'
      '        ,out_uved),())'
      'order by item_no_sort nulls first'
      '     )'
      'union all'
      'select to_char(null) item_no'
      '      ,to_char(null) doc_type'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_char(null) subject_inn'
      '      ,to_char(null) subject_kpp'
      '      ,to_char(null) subject_name'
      '      ,to_char(null) subject_type'
      '      ,to_char(null) doc_nach'
      '      ,to_char(null) pp_number'
      '      ,to_date(null) pp_date'
      '      ,to_number(null) pp_summa'
      '      ,to_char(null) pp_kbk'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',0) in_summa'
      '      ,to_number(null) in_uved'
      '      ,to_number(null) out_uved'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate),0,'#39'rur'#39','#39'rur'#39',0) out_summa'
      'from dual')
    Optimize = False
    Variables.Data = {
      030000000C0000000B0000003A4143434F554E545F4944030000000000000000
      000000060000003A42444154450C0000000000000000000000060000003A4544
      4154450C0000000000000000000000160000003A4143434F554E545F4B424B41
      56414E535F434F4445050000000000000000000000180000003A4143434F554E
      545F4B424B43454C45564F595F434F4445050000000000000000000000150000
      003A4143434F554E545F434F4E4649524D5F434F444505000000000000000000
      0000140000003A4143434F554E545F4B424B4156414E535F4944030000000000
      000000000000160000003A4143434F554E545F4B424B43454C45564F595F4944
      030000000000000000000000130000003A4143434F554E545F434F4E4649524D
      5F49440300000000000000000000000D0000003A4143434F554E545F434F4445
      050000000000000000000000140000003A4143434F554E545F4558545041595F
      434F4445050000000000000000000000120000003A4143434F554E545F455854
      5041595F4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000012000000070000004954454D5F4E4F010000000000030000004B424B
      01000000000008000000444F435F545950450100000000000A000000444F435F
      4E554D42455201000000000008000000444F435F444154450100000000000800
      0000494E5F53554D4D4101000000000007000000494E5F555645440100000000
      00080000004F55545F55564544010000000000090000004F55545F53554D4D41
      0100000000000B0000005355424A4543545F494E4E0100000000000B00000053
      55424A4543545F4B50500100000000000C0000005355424A4543545F4E414D45
      0100000000000C0000005355424A4543545F5459504501000000000009000000
      50505F4E554D4245520100000000000700000050505F44415445010000000000
      0800000050505F53554D4D410100000000000600000050505F4B424B01000000
      000008000000444F435F4E414348010000000000}
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 49
    end
    object dsetDataDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 72
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
      Size = 1500
    end
    object dsetDataSUBJECT_INN: TStringField
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsetDataSUBJECT_KPP: TStringField
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object dsetDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsetDataSUBJECT_TYPE: TStringField
      FieldName = 'SUBJECT_TYPE'
      Size = 1
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
    object dsetDataPP_KBK: TStringField
      FieldName = 'PP_KBK'
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataIN_UVED: TFloatField
      FieldName = 'IN_UVED'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_UVED: TFloatField
      FieldName = 'OUT_UVED'
      DisplayFormat = ',0.00'
    end
    object dsetDataOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataDOC_NACH: TStringField
      FieldName = 'DOC_NACH'
      Size = 1505
    end
  end
  inherited dsetAccount: TOracleDataSet
    Optimize = False
  end
end
