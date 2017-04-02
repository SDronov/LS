inherited DecOffsetObligationPOGridForm: TDecOffsetObligationPOGridForm
  Caption = 'DecOffsetObligationPOGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewLOCKED_FOR_DECISION
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewLOCKED_FOR_DECISION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOCKED_FOR_DECISION'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Styles.Content = MainData.stlSumByDoc
            Styles.Footer = MainData.stlSumByDoc
            Styles.Header = MainData.stlSumByDoc
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 308
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Width = 109
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASSURE_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE'
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select ('
      '        select sum( r.summa )'
      '        from fdc_reserved_payment_lst r'
      '        where r.doc_id = :id'
      '          and r.payment_id = res.id'
      '       ) as locked_for_decision'
      '      ,res.*'
      'from ('
      '      select t.id'
      '            ,t.name'
      '            ,t.shortname'
      '            ,t.object_type_id'
      '            ,t.state_id'
      '            ,t.accesslevel'
      '            ,t.sysname'
      '            ,t.descript'
      '            ,t.owner_object_id'
      '            ,t.typename'
      '            ,t.typesysname'
      '            ,t.objectkindlist'
      '            ,t.operate_date'
      '            ,t.doc_number'
      '            ,t.is_active'
      '            ,t.activation_date'
      '            ,t.ext_source'
      '            ,t.ext_typesysname'
      '            ,t.ext_id'
      '            ,t.doc_no'
      '            ,t.doc_date'
      '            ,t.doc_no2'
      '            ,t.doc_date2'
      '            ,t.exec_date'
      '            ,t.payer_id'
      '            ,t.doc_summa'
      '            ,t.summa'
      '            ,t.currency_id'
      '            ,t.cashdesk_id'
      '            ,t.cardnum'
      '            ,t.pay_type_id'
      '            ,t.agreement_id'
      '            ,t.pay_type_code'
      '            ,t.income_date'
      '            ,t.note'
      '            ,t.nref'
      '            ,t.account_k'
      '            ,t.bic_k'
      '            ,t.nls'
      '            ,t.payer_name'
      '            ,t.payer_inn'
      '            ,t.payer_kpp'
      '            ,t.cashdesk_name'
      '            ,t.curr_name'
      '            ,t.curr_code'
      '            ,t.rest_summa'
      '            ,t.locked_summa'
      '            ,t.coming_date'
      '            ,t.assure_date'
      '            ,t.descript2'
      '            ,t.subject_id'
      '            ,t.po_name'
      '            ,t.po_inn'
      '            ,t.po_kpp'
      '            ,t.s_name'
      '            ,t.s_inn'
      '            ,t.s_kpp'
      '            ,t.kbkcode_id'
      '            ,t.kbkcode'
      '            ,t.kbk'
      '            ,t.name_p'
      '            ,t.inn_p'
      '            ,t.kpp_p'
      '            ,t.bik_p'
      '            ,t.account_p'
      '            ,t.recipient_id'
      '            ,t.name_k'
      '            ,t.inn_k'
      '            ,t.kpp_k'
      '            ,t.val_payment_reason'
      '            ,t.val_doc_number'
      '            ,t.val_doc_date'
      '            ,t.val_payment_type'
      '            ,t.destcustomscode'
      '            ,t.in_reg'
      '            ,t.is_ts'
      '            ,rest_summa - locked_summa as avail_summa'
      
        '            ,(case when (t.is_active = '#39'A'#39') then '#39'Y'#39' else '#39'N'#39' en' +
        'd) is_archive'
      '        from fdc_payment_order_lst t'
      '        where t.id in ('
      '                       select r.payment_id'
      '                       from fdc_reserved_payment_lst r'
      '                       where r.doc_id = :id'
      '                      )'
      '     ) res'
      ''
      '')
    SourceServerObject = 'FDC_PAYMENT_ORDER_LST'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataLOCKED_FOR_DECISION: TFloatField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086' '#1087#1086' '#1088#1077#1096#1077#1085#1080#1102
      FieldName = 'LOCKED_FOR_DECISION'
    end
    object dsDataOPERATE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'OPERATE_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087'/'#1087
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087'/'#1087
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NO2: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087'/'#1087' '#1073#1072#1085#1082#1072
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087'/'#1087' '#1073#1072#1085#1082#1072
      FieldName = 'DOC_DATE2'
    end
    object dsDataEXEC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDataDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'DOC_SUMMA'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCASHDESK_ID: TFloatField
      FieldName = 'CASHDESK_ID'
    end
    object dsDataCARDNUM: TStringField
      FieldName = 'CARDNUM'
      Size = 19
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataAGREEMENT_ID: TFloatField
      FieldName = 'AGREEMENT_ID'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
      FieldName = 'INCOME_DATE'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Size = 25
    end
    object dsDataACCOUNT_K: TStringField
      FieldName = 'ACCOUNT_K'
    end
    object dsDataBIC_K: TStringField
      FieldName = 'BIC_K'
      Size = 9
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
    end
    object dsDataPAYER_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataCASHDESK_NAME: TStringField
      FieldName = 'CASHDESK_NAME'
      Size = 1500
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataREST_SUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'REST_SUMMA'
    end
    object dsDataLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
    end
    object dsDataCOMING_DATE: TDateTimeField
      FieldName = 'COMING_DATE'
    end
    object dsDataASSURE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1077#1085#1080#1103
      FieldName = 'ASSURE_DATE'
    end
    object dsDataDESCRIPT2: TStringField
      FieldName = 'DESCRIPT2'
      Size = 0
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 1500
    end
    object dsDataPO_INN: TStringField
      FieldName = 'PO_INN'
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      FieldName = 'PO_KPP'
      Size = 10
    end
    object dsDataS_NAME: TStringField
      FieldName = 'S_NAME'
      Size = 1500
    end
    object dsDataS_INN: TStringField
      FieldName = 'S_INN'
      Size = 12
    end
    object dsDataS_KPP: TStringField
      FieldName = 'S_KPP'
      Size = 10
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBKCODE'
    end
    object dsDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsDataNAME_P: TStringField
      FieldName = 'NAME_P'
      Size = 160
    end
    object dsDataINN_P: TStringField
      FieldName = 'INN_P'
      Size = 12
    end
    object dsDataKPP_P: TStringField
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsDataBIK_P: TStringField
      FieldName = 'BIK_P'
      Size = 9
    end
    object dsDataACCOUNT_P: TStringField
      FieldName = 'ACCOUNT_P'
    end
    object dsDataRECIPIENT_ID: TFloatField
      FieldName = 'RECIPIENT_ID'
    end
    object dsDataNAME_K: TStringField
      FieldName = 'NAME_K'
      Size = 160
    end
    object dsDataINN_K: TStringField
      FieldName = 'INN_K'
      Size = 12
    end
    object dsDataKPP_K: TStringField
      FieldName = 'KPP_K'
      Size = 9
    end
    object dsDataVAL_PAYMENT_REASON: TStringField
      FieldName = 'VAL_PAYMENT_REASON'
      Size = 2
    end
    object dsDataVAL_DOC_NUMBER: TStringField
      FieldName = 'VAL_DOC_NUMBER'
      Size = 15
    end
    object dsDataVAL_DOC_DATE: TDateTimeField
      FieldName = 'VAL_DOC_DATE'
    end
    object dsDataVAL_PAYMENT_TYPE: TStringField
      FieldName = 'VAL_PAYMENT_TYPE'
      Size = 3
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'DESTCUSTOMSCODE'
      Size = 10
    end
    object dsDataIN_REG: TStringField
      FieldName = 'IN_REG'
      Size = 1
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataAVAIL_SUMMA: TFloatField
      FieldName = 'AVAIL_SUMMA'
    end
    object dsDataIS_ARCHIVE: TStringField
      DisplayLabel = #1040#1088#1093#1080#1074
      FieldName = 'IS_ARCHIVE'
      Size = 1
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 40
    Top = 158
    object qryGetMode: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  SELECT CASE WHEN s.SYSNAME = '#39'State.DecOffsetObligation.Create' +
          #39' THEN 1 ELSE 0 END'
        '    INTO :result'
        '    FROM fdc_dec_offset_obligation_lst dd'
        '        ,fdc_state_lst          s'
        '    WHERE dd.id = :id'
        '      AND s.id  = dd.state_id;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :result := -1;'
        'END;')
    end
  end
end
