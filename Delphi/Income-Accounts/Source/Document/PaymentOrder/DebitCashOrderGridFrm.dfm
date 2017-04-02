inherited DebitCashOrderGridForm: TDebitCashOrderGridForm
  Width = 899
  Height = 346
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1082#1072#1089#1089#1086#1074#1099#1093' '#1086#1088#1076#1077#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 294
    Width = 891
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 586
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 586
      end
      inherited pnlProgress: TPanel
        Width = 586
        inherited lblProgress: TcxLabel
          Width = 586
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 799
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 291
    Width = 891
  end
  inherited pnlWorkspace: TPanel
    Width = 891
    Height = 265
    inherited splSearchCriteria: TSplitter
      Height = 265
    end
    inherited pnlSearchCriteria: TPanel
      Height = 265
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 245
        inherited btnSearch: TcxButton
          Top = 214
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Top = 185
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 686
      Height = 265
      inherited grdData: TcxGrid
        Width = 686
        Height = 265
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 132
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECTKINDLIST'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Width = 101
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_P'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_P'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP_P'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIK_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIK_P'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCOUNT_P'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNREF: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NREF'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewRECIPIENT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RECIPIENT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_K'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_K'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP_K'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIC_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIC_K'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCOUNT_K'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 38
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NOTE'
            Width = 329
            Position.BandIndex = 0
            Position.ColIndex = 42
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 43
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NLS'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 44
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 45
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIN_REG: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IN_REG'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 46
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 47
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBK'
            Position.BandIndex = 0
            Position.ColIndex = 48
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_PAYMENT_REASON'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 49
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_DOC_NUMBER'
            Width = 146
            Position.BandIndex = 0
            Position.ColIndex = 50
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_DOC_DATE'
            Width = 121
            Position.BandIndex = 0
            Position.ColIndex = 51
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VAL_PAYMENT_TYPE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 52
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Visible = False
            Hidden = True
            Width = 247
            Position.BandIndex = 0
            Position.ColIndex = 53
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Visible = False
            Hidden = True
            Width = 99
            Position.BandIndex = 0
            Position.ColIndex = 54
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Visible = False
            Hidden = True
            Width = 88
            Position.BandIndex = 0
            Position.ColIndex = 55
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_NAME'
            Width = 212
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_INN'
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 40
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_KPP'
            Width = 138
            Position.BandIndex = 0
            Position.ColIndex = 41
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 56
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 57
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 58
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
      'select *'
      '  from fdc_PO_DCO_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '   and rownum <= :MaxRecordCount')
    SourceServerObject = 'FDC_PO_DCO_LST'
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataID: TFloatField
      Visible = False
    end
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      DisplayWidth = 120
    end
    inherited dsDataSHORTNAME: TStringField
      Visible = False
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      Visible = False
    end
    inherited dsDataSTATE_ID: TFloatField
      Visible = False
    end
    inherited dsDataACCESSLEVEL: TFloatField
      Visible = False
    end
    inherited dsDataSYSNAME: TStringField
      Visible = False
    end
    inherited dsDataDESCRIPT: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 120
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Visible = False
    end
    inherited dsDataTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087
      Visible = False
    end
    inherited dsDataTYPESYSNAME: TStringField
      Visible = False
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
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
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataDOC_SUMMA: TFloatField
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
    object dsDataNOTE: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 180
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'INCOME_DATE'
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
      Visible = False
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
      Visible = False
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
    object dsDataVAL_PAYMENT_REASON: TStringField
      FieldName = 'VAL_PAYMENT_REASON'
      Visible = False
      Size = 2
    end
    object dsDataVAL_DOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
      FieldName = 'VAL_DOC_NUMBER'
      Size = 15
    end
    object dsDataVAL_DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'-'#1086#1089#1085#1086#1074#1072#1085#1080#1103
      FieldName = 'VAL_DOC_DATE'
    end
    object dsDataVAL_PAYMENT_TYPE: TStringField
      FieldName = 'VAL_PAYMENT_TYPE'
      Visible = False
      Size = 3
    end
    object dsDataPAYER_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      DisplayWidth = 120
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
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 120
      FieldName = 'PO_NAME'
      Visible = False
      Size = 1500
    end
    object dsDataPO_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'PO_INN'
      Visible = False
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'PO_KPP'
      Visible = False
      Size = 10
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      DisplayWidth = 24
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 120
      FieldName = 'CURR_NAME'
      Visible = False
      Size = 1500
    end
    object dsDataPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 50
      FieldName = 'PAY_TYPE_CODE'
      Visible = False
      Size = 1500
    end
  end
end
