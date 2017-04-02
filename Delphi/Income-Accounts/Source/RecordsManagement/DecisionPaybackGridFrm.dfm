inherited DecisionPaybackGridForm: TDecisionPaybackGridForm
  Left = 342
  Top = 333
  Height = 415
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 352
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 604
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 604
      end
      inherited pnlProgress: TPanel
        Width = 604
        inherited lblProgress: TcxLabel
          Width = 604
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 814
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 349
  end
  inherited pnlWorkspace: TPanel
    Height = 321
    inherited splSearchCriteria: TSplitter
      Height = 321
    end
    inherited pnlSearchCriteria: TPanel
      Height = 321
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 301
      end
    end
    inherited pnlGrid: TPanel
      Height = 321
      inherited grdData: TcxGrid
        Height = 321
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colSumma
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          object columnSTATE_NAME: TcxGridDBBandedColumn [1]
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'STATE_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Position.ColIndex = 3
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 220
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          inherited colDocNumber: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited colDocDate: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'DECL_INN'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn [9]
            DataBinding.FieldName = 'DECL_KPP'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 240
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          inherited colAppDateIncome: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited colSumma: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Properties.Nullable = True
            Position.ColIndex = 13
          end
          object colKBKCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE'
            Width = 179
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 16
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
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMSFULLNAME'
            Width = 220
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLAST_DAYS: TcxGridDBBandedColumn
            Caption = #1044#1086' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' ('#1076#1085#1077#1081')'
            DataBinding.FieldName = 'LAST_DAYS'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_NAME'
            Visible = False
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREASON_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_CODE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE_DOC_OSN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_OSN_CODE'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = True
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT dp.*,'
      
        '      ( SELECT o.name FROM fdc_object_lst o WHERE o.id = dp.stat' +
        'e_id ) AS state_name,'
      
        '      ( SELECT TRUNC( COALESCE (dp.date_last_doc, dp.APP_DATE_IN' +
        'COME, dp.APP_DATE, dp.DOC_DATE ) ) + 30 - trunc(SYSDATE)'
      '          FROM fdc_payment_order_payback p,'
      '               fdc_object_lst            s'
      '         WHERE p.id = s.id'
      '               AND p.dec_pay_id = dp.id'
      '               AND s.state_id IS NOT NULL'
      
        '               AND s.state_id not in ( SELECT st.id from fdc_obj' +
        'ect_lst st WHERE st.sysname IN'
      
        '                  ('#39'State.PayBack.Confirm'#39', '#39'State.PayBack.Denia' +
        'l'#39' ) )'
      '               AND ROWNUM = 1 ) AS last_days'
      '  FROM fdc_decision_payback_lst dp'
      ' WHERE (:Name is null or upper(dp.NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (dp.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (dp.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (dp.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (dp.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (dp.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (dp.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (dp.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (dp.summa <= :SUM_MAX)'
      '/*$p#active_from#*/ AND (dp.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (dp.activation_date  <= :ACTIVE_TO)'
      '       AND rownum <= :MaxRecordCount'
      ''
      '/* -- '#1087#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1074#1072#1088#1080#1072#1085#1090
      '    select  distinct'
      '        dp.*'
      
        '      ,( SELECT o.name FROM fdc_object_lst o WHERE o.id = dp.sta' +
        'te_id ) AS state_name'
      '      , case when s.STATE_ID is not null then'
      
        '        case when not fdc_object_get_sysname(s.STATE_ID) in ('#39'St' +
        'ate.PayBack.Confirm'#39','#39'State.PayBack.Denial'#39') then'
      
        '        trunc( nvl(dp.date_last_doc,NVL(dp.APP_DATE_INCOME,nvl(d' +
        'p.APP_DATE,dp.DOC_DATE))) + 30 - trunc( SYSDATE ) )'
      '        else'
      '        null'
      '        end'
      '        else'
      '        null'
      '        end  as last_days'
      '  from fdc_decision_payback_lst dp,'
      '       fdc_payment_order_payback p,'
      '       fdc_object_lst s'
      'WHERE dp.id = p.dec_pay_id(+)'
      '                  AND p.id = s.id(+)*/'
      ''
      ''
      ''
      '')
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataREASON_CODE: TStringField [23]
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'REASON_CODE'
      Size = 1500
    end
    object dsDataREASON_NAME: TStringField [24]
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1090#1100#1080
      FieldName = 'REASON_NAME'
      Size = 1500
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDESTSUB_ID: TFloatField
      FieldName = 'DESTSUB_ID'
    end
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsDataSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF_UDF: TStringField
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      Size = 50
    end
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 200
    end
    object dsDataKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 200
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDataEXT_SOURCE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataCUSTOMSFULLNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      FieldName = 'CUSTOMSFULLNAME'
      Size = 4000
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataLAST_DAYS: TFloatField
      DisplayLabel = #1044#1086' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'LAST_DAYS'
    end
    object dsDataDOC_OSN_CODE: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'DOC_OSN_CODE'
      Size = 2
    end
  end
end
