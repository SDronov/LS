inherited ActDeductionDocsPaysGrigForm: TActDeductionDocsPaysGrigForm
  Caption = 'ActDeductionDocsPaysGrigForm'
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
              Column = grdDataDBBandedTableViewRESERVE_SUMMA
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 120
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Width = 150
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRESERVE_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1072#1082#1090#1077
            DataBinding.FieldName = 'RESERVE_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
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
    Bars = <
      item
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
    inherited btnSwitchSearchCriteria: TdxBarButton
      Visible = ivNever
    end
    inherited btnAdd: TdxBarButton
      Visible = ivNever
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select po.*, r.id AS reserve_id, r.summa AS reserve_summa'
      '  FROM fdc_payment_order_Lst  po'
      '      ,fdc_reserved_3year_lst r'
      ' WHERE r.doc_id = :id'
      '   AND r.payment_id = po.id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object dsDataOPERATE_DATE: TDateTimeField
      FieldName = 'OPERATE_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
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
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
    end
    object dsDataEXEC_DATE: TDateTimeField
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
    end
    object dsDataSUMMA: TFloatField
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
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataINCOME_DATE: TDateTimeField
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
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataCASHDESK_NAME: TStringField
      FieldName = 'CASHDESK_NAME'
      Size = 1500
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataREST_SUMMA: TFloatField
      FieldName = 'REST_SUMMA'
    end
    object dsDataLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
    end
    object dsDataCOMING_DATE: TDateTimeField
      FieldName = 'COMING_DATE'
    end
    object dsDataASSURE_DATE: TDateTimeField
      FieldName = 'ASSURE_DATE'
    end
    object dsDataDESCRIPT2: TStringField
      FieldName = 'DESCRIPT2'
      Size = 280
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 80
    end
    object dsDataPO_INN: TStringField
      FieldName = 'PO_INN'
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      FieldName = 'PO_KPP'
      Size = 9
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
      FieldName = 'KBKCODE'
    end
    object dsDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsDataNAME_P: TStringField
      FieldName = 'NAME_P'
      Size = 80
    end
    object dsDataINN_P: TStringField
      FieldName = 'INN_P'
      Size = 12
    end
    object dsDataKPP_P: TStringField
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsDataACCOUNT_P: TStringField
      FieldName = 'ACCOUNT_P'
    end
    object dsDataRECIPIENT_ID: TFloatField
      FieldName = 'RECIPIENT_ID'
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
      Size = 2
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataRESERVE_ID: TFloatField
      FieldName = 'RESERVE_ID'
    end
    object dsDataRESERVE_SUMMA: TFloatField
      FieldName = 'RESERVE_SUMMA'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 56
    Top = 166
    object sqlRemovePay: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  P_ACT_DED_PAYS.RemovePay('
        '      pActID     => :act_id'
        '     ,pReserveID => :reserve_id'
        '    );'
        'END;')
    end
  end
end
