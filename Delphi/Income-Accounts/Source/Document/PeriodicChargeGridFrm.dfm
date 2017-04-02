inherited PeriodicChargeGridForm: TPeriodicChargeGridForm
  Left = 255
  Top = 218
  Width = 696
  Height = 480
  Caption = 'PeriodicChargeGridForm'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 428
    Width = 688
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 19
        Width = 81
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 383
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 383
      end
      inherited pnlProgress: TPanel
        Width = 383
        inherited lblProgress: TcxLabel
          Width = 383
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 596
      inherited ProgressBar: TcxProgressBar
        Height = 18
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 425
    Width = 688
  end
  inherited pnlWorkspace: TPanel
    Width = 688
    Height = 399
    inherited splSearchCriteria: TSplitter
      Height = 399
    end
    inherited pnlSearchCriteria: TPanel
      Height = 399
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 379
        inherited btnSearch: TcxButton
          Top = 348
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 319
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 483
      Height = 399
      inherited grdData: TcxGrid
        Width = 483
        Height = 399
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMONTH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MONTH'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATUS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATUS'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1045#1078#1077#1084#1077#1089#1103#1095#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.UseThousandSeparator = True
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actPeriodicPayment: TAction
      Caption = #1054#1087#1083#1072#1090#1080#1090#1100
      OnExecute = actPeriodicPaymentExecute
      OnUpdate = actPeriodicPaymentUpdate
    end
    object actChangeMode: TAction
      Caption = #1057#1084#1077#1085#1072' '#1088#1077#1078#1080#1084#1072
      Visible = False
      OnExecute = actChangeModeExecute
    end
    object actStop: TAction
      Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077'/'#1042#1099#1073#1099#1090#1080#1077
      Hint = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077'/'#1042#1099#1073#1099#1090#1080#1077
      OnExecute = actStopExecute
      OnUpdate = actStopUpdate
    end
    object actProlong: TAction
      Caption = #1055#1088#1086#1076#1083#1077#1085#1080#1077
      Hint = #1055#1088#1086#1076#1083#1077#1085#1080#1077' '#1089#1088#1086#1082#1072' '#1074#1088#1077#1084#1077#1085#1085#1086#1075#1086' '#1074#1074#1086#1079#1072
      OnExecute = actProlongExecute
    end
    object actCorrect: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      OnExecute = actCorrectExecute
      OnUpdate = actCorrectUpdate
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
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
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
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = dxBarSubItem1
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
    object dxBarButton1: TdxBarButton
      Action = actPeriodicPayment
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actChangeMode
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1088#1086#1094#1077#1076#1091#1088#1099
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton3
          Visible = True
        end
        item
          Item = dxBarButton4
          Visible = True
        end
        item
          Item = dxBarButton5
          Visible = True
        end>
    end
    object dxBarButton3: TdxBarButton
      Action = actStop
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actProlong
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = actCorrect
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select'
      '    rownum id,'
      '    '#39#1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1081' '#1087#1083#1072#1090#1077#1078#39' name,'
      '    null shortname,'
      '    cast(null as number) object_type_id,'
      '    cast(null as number) state_id,'
      '    cast(null as number) accesslevel,'
      '    null sysname,'
      '    null descript,'
      '    cast(null as number) owner_object_id,'
      '    null typename,'
      '    null typesysname,'
      '    null objectkindlist,'
      '    t.*,'
      '    c.code as curr_code,'
      '    c.name as curr_name,'
      '    pt.code as payment_code,'
      '    pt.name as payment_name,'
      
        '    DECODE(t.IS_PAYED, 3, '#39#1055#1054#1051#1053#1054#1045' '#1054#1057#1042#1054#1041#1054#1046#1044#1045#1053#1048#1045#39', 2, '#39#1055#1056#1048#1054#1057#1058#1040#1053#1054#1042#1051 +
        #1045#1053#1054#39', 1, '#39#1047#1040#1050#1056#1067#1058#1054#39', to_char(t.SUMMA, '#39'FM99G999G999G999G999G999G9' +
        '99G999D00'#39', '#39' NLS_NUMERIC_CHARACTERS = '#39#39', '#39#39#39')) as status'
      'from'
      
        '     TABLE(FDC_GET_PERIODIC_BY_MONTH(CAST(:DECL_ID AS NUMBER),0)' +
        ') t,'
      '     fdc_nsi_currency_lst c,'
      '     fdc_dict_lst pt'
      'where t.currency_id = c.id'
      '  and pt.id = t.pay_type_id     '
      'order by t.MONTH'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    inherited dsDataNAME: TStringField
      Size = 20
    end
    inherited dsDataSHORTNAME: TStringField
      Size = 0
    end
    inherited dsDataSYSNAME: TStringField
      Size = 0
    end
    inherited dsDataDESCRIPT: TStringField
      Size = 0
    end
    inherited dsDataTYPENAME: TStringField
      Size = 0
    end
    inherited dsDataTYPESYSNAME: TStringField
      Size = 0
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      Size = 0
    end
    object dsDataPAYMENT_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_CODE'
    end
    object dsDataPAYMENT_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 200
      FieldName = 'PAYMENT_NAME'
      Size = 200
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 200
      FieldName = 'CURR_NAME'
      Size = 200
    end
    object dsDataMONTH: TDateTimeField
      DisplayLabel = #1057#1088#1086#1082' '#1086#1087#1083#1072#1090#1099
      FieldName = 'MONTH'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataIS_PAYED: TFloatField
      FieldName = 'IS_PAYED'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataSTATUS: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATUS'
      Size = 34
    end
  end
  object dsetOldPayTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT c.*'
      '  FROM fdc_periodic_charge_lst c'
      '      ,fdc_payment_type_lst    pt'
      ' WHERE decl_id = :decl_id'
      '   AND pt.id   = c.pay_type_id'
      '   AND NVL( pt.edate, trunc( SYSDATE ) + 1 ) < trunc( SYSDATE )'
      '')
    Variables.Data = {
      0300000001000000080000003A4445434C5F4944040000000000000000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetOldPayTypesBeforeQuery
    Session = MainData.Session
    Left = 144
    Top = 190
  end
  object dsetNewPayType: TOracleDataSet
    SQL.Strings = (
      'SELECT pt.id, pt.code, pt.name, k.id AS kbk_id'
      '  FROM fdc_payment_type_lst pt'
      '      ,fdc_kbk_dict_lst     k'
      '  WHERE k.code  = :kbk'
      
        '    AND trunc( SYSDATE ) BETWEEN k.sdate AND NVL( k.edate, TRUNC' +
        '( SYSDATE ) + 1 )'
      '    AND k.code2 = pt.code'
      
        '    AND trunc( SYSDATE ) BETWEEN pt.sdate AND NVL( pt.edate, TRU' +
        'NC( SYSDATE ) + 1 )')
    Variables.Data = {0300000001000000040000003A4B424B050000000000000000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetNewPayTypeBeforeQuery
    Session = MainData.Session
    Left = 237
    Top = 194
  end
  object pkgCustomDecl: TOraclePackage
    Session = MainData.Session
    PackageName = 'p_Custom_Decl'
    Cursor = crSQLWait
    Left = 333
    Top = 194
  end
end
