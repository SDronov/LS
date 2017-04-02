inherited PaysUpGridForm: TPaysUpGridForm
  Left = 332
  Top = 241
  Width = 987
  Height = 430
  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 378
    Width = 979
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 690
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 690
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 690
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 690
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 903
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 375
    Width = 979
  end
  inherited pnlWorkspace: TPanel
    Width = 979
    Height = 349
    inherited splSearchCriteria: TSplitter
      Height = 349
    end
    inherited pnlSearchCriteria: TPanel
      Height = 349
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 329
        inherited btnSearch: TcxButton
          Top = 297
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 774
      Height = 349
      inherited grdData: TcxGrid
        Width = 774
        Height = 349
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESCRIPT'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECTKINDLIST'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_P'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_P'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP_P'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIK_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIK_P'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCOUNT_P'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNREF: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NREF'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRECIPIENT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RECIPIENT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_K'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_K'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP_K'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIC_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIC_K'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 38
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCOUNT_K'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 40
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 41
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NOTE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 42
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 43
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NLS'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 44
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 45
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_PAYMENT_REASON'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 46
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_DOC_NUMBER'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 47
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_DOC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 48
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_PAYMENT_TYPE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 49
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIN_REG: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IN_REG'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 50
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 51
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBK'
            Position.BandIndex = 0
            Position.ColIndex = 52
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 53
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 54
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Width = 121
            Position.BandIndex = 0
            Position.ColIndex = 55
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 56
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_INN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 57
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_KPP'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 58
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 59
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOCKED_SUMMA'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 60
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMING_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 61
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASSURE_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 62
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOverPay: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OVERPAY_SUMMA'
            Width = 111
            Position.BandIndex = 0
            Position.ColIndex = 63
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actRestPaysUpload: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1055#1055
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1087#1087' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '
      OnExecute = actRestPaysUploadExecute
      OnUpdate = actRestPaysUploadUpdate
    end
    object actRestPaysLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1055#1055
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1087#1087' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '
      OnExecute = actRestPaysLoadExecute
      OnUpdate = actRestPaysLoadUpdate
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
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnUploadPays
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRestPaysLoad
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
    object btnUploadPays: TdxBarButton
      Action = actRestPaysUpload
      Category = 0
    end
    object btnRestPaysLoad: TdxBarButton
      Action = actRestPaysLoad
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT po.*'
      '              ,(SELECT nvl(SUM(t.summa), 0)'
      '                          FROM fdc_reserved_for_reuse_lst t'
      '                         WHERE t.payment_id = po.ID'
      '                           AND EXISTS (SELECT 1'
      '                                FROM exp_reserv r'
      
        '                                WHERE r.new_id = t.id)) AS OverP' +
        'ay_SUMMA'
      '          FROM fdc_po_credit_lst_all po'
      '         WHERE po.EXT_TYPESYSNAME = '#39'PaymentOrderRestCustoms'#39
      
        '         AND NOT EXISTS (SELECT 1 FROM fdc_payment_order_non_id ' +
        'n WHERE po.id = n.payment_order_id )) q'
      ' WHERE (q.Summa + OverPay_SUMMA) > 0'
      '   AND rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsDataNAME: TStringField
      FieldName = 'NAME'
      Visible = False
      Size = 1500
    end
    object dsDataSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Visible = False
      Size = 1500
    end
    object dsDataOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
      Visible = False
    end
    object dsDataSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
      Visible = False
    end
    object dsDataACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
      Visible = False
    end
    object dsDataSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Visible = False
      Size = 1500
    end
    object dsDataOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
      Visible = False
    end
    object dsDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Visible = False
      Size = 1500
    end
    object dsDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Visible = False
      Size = 4000
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082'.'
      FieldName = 'DOC_DATE'
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Visible = False
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
      Visible = False
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Visible = False
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
      Visible = False
    end
    object dsDataEXEC_DATE: TDateTimeField
      FieldName = 'EXEC_DATE'
      Visible = False
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
      Visible = False
    end
    object dsDataNAME_P: TStringField
      FieldName = 'NAME_P'
      Visible = False
      Size = 160
    end
    object dsDataINN_P: TStringField
      FieldName = 'INN_P'
      Visible = False
      Size = 12
    end
    object dsDataKPP_P: TStringField
      FieldName = 'KPP_P'
      Visible = False
      Size = 9
    end
    object dsDataBIK_P: TStringField
      FieldName = 'BIK_P'
      Visible = False
      Size = 9
    end
    object dsDataACCOUNT_P: TStringField
      FieldName = 'ACCOUNT_P'
      Visible = False
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086#1089#1090'.'
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Visible = False
      Size = 1500
    end
    object dsDataDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082'.'
      FieldName = 'DOC_SUMMA'
    end
    object dsDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Visible = False
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
      Visible = False
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Visible = False
      Size = 25
    end
    object dsDataRECIPIENT_ID: TFloatField
      FieldName = 'RECIPIENT_ID'
      Visible = False
    end
    object dsDataNAME_K: TStringField
      FieldName = 'NAME_K'
      Visible = False
      Size = 160
    end
    object dsDataINN_K: TStringField
      FieldName = 'INN_K'
      Visible = False
      Size = 12
    end
    object dsDataKPP_K: TStringField
      FieldName = 'KPP_K'
      Visible = False
      Size = 9
    end
    object dsDataBIC_K: TStringField
      FieldName = 'BIC_K'
      Visible = False
      Size = 9
    end
    object dsDataACCOUNT_K: TStringField
      FieldName = 'ACCOUNT_K'
      Visible = False
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Visible = False
      Size = 1500
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Visible = False
      Size = 400
    end
    object dsDataINCOME_DATE: TDateTimeField
      FieldName = 'INCOME_DATE'
      Visible = False
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
      Visible = False
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
      Visible = False
    end
    object dsDataVAL_PAYMENT_REASON: TStringField
      FieldName = 'VAL_PAYMENT_REASON'
      Visible = False
      Size = 2
    end
    object dsDataVAL_DOC_NUMBER: TStringField
      FieldName = 'VAL_DOC_NUMBER'
      Visible = False
      Size = 15
    end
    object dsDataVAL_DOC_DATE: TDateTimeField
      FieldName = 'VAL_DOC_DATE'
      Visible = False
    end
    object dsDataVAL_PAYMENT_TYPE: TStringField
      FieldName = 'VAL_PAYMENT_TYPE'
      Visible = False
      Size = 3
    end
    object dsDataIN_REG: TStringField
      FieldName = 'IN_REG'
      Visible = False
      Size = 1
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      FieldName = 'DESTCUSTOMSCODE'
      Visible = False
      Size = 10
    end
    object dsDataKBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
    object dsDataPAYER_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Visible = False
      Size = 1500
    end
    object dsDataPO_INN: TStringField
      FieldName = 'PO_INN'
      Visible = False
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      FieldName = 'PO_KPP'
      Visible = False
      Size = 10
    end
    object dsDataREST_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072
      FieldName = 'REST_SUMMA'
    end
    object dsDataLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
      Visible = False
    end
    object dsDataCOMING_DATE: TDateTimeField
      FieldName = 'COMING_DATE'
      Visible = False
    end
    object dsDataASSURE_DATE: TDateTimeField
      FieldName = 'ASSURE_DATE'
      Visible = False
    end
    object dsDataOVERPAY_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1048#1079#1083'.'#1059#1087#1083'.'
      FieldName = 'OVERPAY_SUMMA'
    end
  end
  object Zip: TZip
    RelativeDir = byItem
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    ArcType = atZip
    AttributesEx = []
    CompressMethod = cmDeflate
    DefaultExt = '.zip'
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    StoreFilesOfType.Strings = (
      '.ACE'
      '.ARC'
      '.ARJ'
      '.BH'
      '.CAB'
      '.ENC'
      '.GZ'
      '.HA'
      '.JAR'
      '.LHA'
      '.LZH'
      '.PAK'
      '.PK3'
      '.PK_'
      '.RAR'
      '.TAR'
      '.TGZ'
      '.UUE'
      '.UU'
      '.WAR'
      '.XXE'
      '.Z'
      '.ZIP'
      '.ZOO')
    TempDir = 'C:\Documents and Settings\user\Local Settings\Temp\'
    Switch = swAdd
    Left = 72
    Top = 166
  end
  object dlgOpenFile: TOpenDialog
    Filter = 
      #1060#1072#1081#1083#1099' RAR (*.rar)|*.rar|'#1060#1072#1081#1083#1099' ZIP (*.zip)|*.zip|'#1060#1072#1081#1083#1099' LZH (*.lzh' +
      ')|*.lzh'
    FilterIndex = 2
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableIncludeNotify, ofEnableSizing]
    Left = 388
    Top = 150
  end
end
