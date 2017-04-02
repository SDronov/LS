inherited qTurnoverF05_1808Form: TqTurnoverF05_1808Form
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
      FilterBox.Visible = fvNever
      OnCustomDrawCell = grdTurnoverSheetDBBandedTableViewCustomDrawCell
      DataController.DataSource = dsItog
      DataController.DetailKeyFieldNames = 'ID'
      DataController.Filter.OnChanged = grdTurnoverSheetDBBandedTableViewDataControllerFilterChanged
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ID'
      OptionsBehavior.CellHints = True
      OptionsView.ExpandButtonsForEmptyDetails = False
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
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewNumber_pp: TcxGridDBBandedColumn
        Caption = '2'
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewDate_pp: TcxGridDBBandedColumn
        Caption = '3'
        DataBinding.FieldName = 'DOC_DATE'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 80
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewKBK_PP: TcxGridDBBandedColumn
        Caption = '4'
        DataBinding.FieldName = 'KBK'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 200
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIn_summa: TcxGridDBBandedColumn
        Caption = '5'
        DataBinding.FieldName = 'IN_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 5
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewPostupilo: TcxGridDBBandedColumn
        Caption = '6'
        DataBinding.FieldName = 'POSTUPILO'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewIncass: TcxGridDBBandedColumn
        Caption = '7'
        DataBinding.FieldName = 'INCASS'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object grdTurnoverSheetDBBandedTableViewOut_summa: TcxGridDBBandedColumn
        Caption = '8'
        DataBinding.FieldName = 'OUT_SUMMA'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 120
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object grdTurnoverSheetDBBandedTableDView: TcxGridDBTableView [1]
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsData
      DataController.DetailKeyFieldNames = 'PARENTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      object grdTurnoverSheetDBBandedTableDViewITEM_NO: TcxGridDBColumn
        Caption = #8470' '#1087'/'#1087
        DataBinding.FieldName = 'ITEM_NO'
        MinWidth = 40
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Width = 60
      end
      object grdTurnoverSheetDBBandedTableDViewDOC_NUMBER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'DOC_NUMBER'
        MinWidth = 60
        Width = 140
      end
      object grdTurnoverSheetDBBandedTableDViewDOC_DATE: TcxGridDBColumn
        Caption = #1076#1072#1090#1072
        DataBinding.FieldName = 'DOC_DATE'
        MinWidth = 40
      end
      object grdTurnoverSheetDBBandedTableDViewKBK: TcxGridDBColumn
        Caption = #1050#1041#1050
        DataBinding.FieldName = 'KBK'
        MinWidth = 60
        Width = 150
      end
      object grdTurnoverSheetDBBandedTableDViewIN_SUMMA: TcxGridDBColumn
        Caption = #1042#1093#1086#1076'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'IN_SUMMA'
        Visible = False
        Hidden = True
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewINCASS: TcxGridDBColumn
        Caption = #1048#1085#1082#1072#1089#1089#1080#1088#1086#1074#1072#1085#1086
        DataBinding.FieldName = 'INCASS'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewPOSTUPILO: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1086' '#1085#1072' '#1089#1095#1077#1090
        DataBinding.FieldName = 'POSTUPILO'
        MinWidth = 80
        Width = 120
      end
      object grdTurnoverSheetDBBandedTableDViewOUT_SUMMA: TcxGridDBColumn
        Caption = #1048#1089#1093'. '#1086#1089#1090#1072#1090#1086#1082
        DataBinding.FieldName = 'OUT_SUMMA'
        Visible = False
        Hidden = True
        MinWidth = 80
        Width = 120
      end
    end
    inherited grdTurnoverSheetLevel: TcxGridLevel
      object grdTurnoverSheetLevel1: TcxGridLevel
        GridView = grdTurnoverSheetDBBandedTableDView
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
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select id'
      
        '      ,(case when (item_no_sort is null) then null else '#39'0'#39' end)' +
        ' parentid'
      '      ,item_no'
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
      '      ,id'
      
        '      ,(case when (item_no is null) then p_oper_balans.get_bsumm' +
        'a(:account_id,:account_code,trunc(:bdate),0,'#39'rur'#39','#39'rur'#39',(case :s' +
        'ummarn when '#39'Y'#39' then 1 else 0 end),:ists)'
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
      
        '            ,(to_char(doc_date,'#39'dd.mm.yyyy'#39')||doc_number||to_cha' +
        'r(doc_id)||kbk) id'
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
      
        '                        ,(case :summarn when '#39'Y'#39' then (select cl' +
        '.name from fdc_customs_lst cl where id = (case dl.typesysname wh' +
        'en '#39'DocChildsBalance'#39' then acct.subject_id else p_params.customs' +
        'id end)) else nvl(po.doc_number,(case when (po.doc_date is null)' +
        ' then null else '#39#1073'/'#1085#39' end)) end) doc_number'
      '                        ,po.doc_date'
      '                        ,po.kbk'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) incass'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      '                      ,fdc_po_lst po'
      '                      ,fdc_customs_lst cl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      
        '                    and p_oborotki.get_cnfrm_pp_doc_id(p_oborotk' +
        'i.get_pp_doc_id(acct.doc_id)) = po.id(+)'
      '                    and acct.subject_id = cl.id(+)'
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
      '        ,id'
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
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      '')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E54494401000000000003000000
      4B424B0100000000000A000000444F435F4E554D424552010000000000080000
      00444F435F4441544501000000000006000000494E4341535301000000000009
      000000504F53545550494C4F010000000000}
    AfterQuery = dsetDataAfterQuery
    AfterClose = dsetDataAfterClose
    Top = 88
    object dsetDataID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetDataPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
    end
    object dsetDataITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetDataIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 1500
    end
    object dsetDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetDataKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetDataINCASS: TFloatField
      FieldName = 'INCASS'
      DisplayFormat = ',0.00'
    end
    object dsetDataPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
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
  object dsetItog: TOracleDataSet
    SQL.Strings = (
      'select '#39'-1'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      'union all'
      'select '#39'0'#39' id'
      '      ,null parentid'
      '      ,item_no'
      '      ,in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,incass'
      '      ,postupilo'
      '     ,(in_summa + incass - postupilo) out_summa'
      'from ('
      'select '#39#1048#1090#1086#1075#1086#39' item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,incass'
      '      ,postupilo'
      'from ('
      '      select incass'
      '            ,postupilo'
      '      from ('
      '            select nvl(sum(incass),0) incass'
      '                  ,nvl(sum(postupilo),0) postupilo'
      '            from ('
      '                  select acct.kbk_id'
      '                        ,acct.account_id'
      '                        ,acct.operation_date'
      
        '                        ,(case acct.is_debit when '#39'Y'#39' then sum_r' +
        'ur else 0 end) incass'
      
        '                        ,-(case acct.is_debit when '#39'N'#39' then sum_' +
        'rur else 0 end) postupilo'
      '                  from fdc_acc_transaction acct'
      '                      ,fdc_document_lst dl'
      
        '                  where (operation_date between trunc(:bdate) an' +
        'd trunc(:edate))'
      '                    and acct.account_id = :account_id'
      
        '                    and (case :ists when '#39'N'#39' then '#39'Y'#39' else acct.' +
        'is_ts end) = '#39'Y'#39' '
      '                    and acct.doc_id = dl.id'
      '                    and ('
      '                         acct.is_current = 1'
      '                         or'
      '                         :summarn = '#39'Y'#39
      '                        ) '
      '                  )'
      '           ) a'
      '     )'
      '     )'
      'union all'
      'select '#39'-2'#39' id'
      '      ,null parentid'
      '      ,to_char(null) item_no'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':bdate),0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 end)' +
        ',:ists) in_summa'
      '      ,to_char(null) doc_number'
      '      ,to_date(null) doc_date'
      '      ,to_char(null) kbk'
      '      ,to_number(null) incass'
      '      ,to_number(null) postupilo'
      
        '      ,p_oper_balans.get_bsumma(:account_id,:account_code,trunc(' +
        ':edate)+1,0,'#39'rur'#39','#39'rur'#39',(case :summarn when '#39'Y'#39' then 1 else 0 en' +
        'd),:ists) out_summa'
      'from dual'
      '')
    Optimize = False
    Variables.Data = {
      03000000060000000B0000003A4143434F554E545F4944030000000000000000
      0000000D0000003A4143434F554E545F434F4445050000000000000000000000
      060000003A42444154450C0000000000000000000000060000003A4544415445
      0C0000000000000000000000050000003A495354530500000000000000000000
      00080000003A53554D4D41524E050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A000000070000004954454D5F4E4F01000000000008000000494E5F
      53554D4D41010000000000090000004F55545F53554D4D410100000000000200
      0000494401000000000008000000504152454E54494401000000000003000000
      4B424B0100000000000A000000444F435F4E554D424552010000000000080000
      00444F435F4441544501000000000006000000494E4341535301000000000009
      000000504F53545550494C4F010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetItogBeforeQuery
    Session = MainData.Session
    Left = 256
    Top = 136
    object dsetItogID: TStringField
      FieldName = 'ID'
      Size = 255
    end
    object dsetItogPARENTID: TStringField
      FieldName = 'PARENTID'
      Size = 255
    end
    object dsetItogITEM_NO: TStringField
      FieldName = 'ITEM_NO'
      Size = 255
    end
    object dsetItogIN_SUMMA: TFloatField
      FieldName = 'IN_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsetItogDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 255
    end
    object dsetItogDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetItogKBK: TStringField
      FieldName = 'KBK'
      Size = 255
    end
    object dsetItogINCASS: TFloatField
      FieldName = 'INCASS'
      DisplayFormat = ',0.00'
    end
    object dsetItogPOSTUPILO: TFloatField
      FieldName = 'POSTUPILO'
      DisplayFormat = ',0.00'
    end
    object dsetItogOUT_SUMMA: TFloatField
      FieldName = 'OUT_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsItog: TDataSource
    DataSet = dsetItog
    Left = 224
    Top = 216
  end
end
