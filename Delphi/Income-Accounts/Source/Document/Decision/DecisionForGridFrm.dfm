inherited DecisionForGridForm: TDecisionForGridForm
  Left = 427
  Top = 292
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1087#1077#1088#1077#1074#1086#1076#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 113
        end
        inherited edtKPP: TcxTextEdit
          Width = 113
        end
        inherited edtNomer: TcxTextEdit
          Width = 113
        end
        inherited edtFromDate: TcxDateEdit
          Width = 113
        end
        inherited edtToDate: TcxDateEdit
          Width = 113
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 113
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 113
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn [7]
            DataBinding.FieldName = 'DECL_KPP'
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'DECL_INN'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          inherited colAppDate: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          object grdDataDBBandedTableViewSUB_INN_DEST: TcxGridDBBandedColumn [12]
            DataBinding.FieldName = 'SUB_INN_DEST'
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUB_KPP_DEST: TcxGridDBBandedColumn [13]
            DataBinding.FieldName = 'SUB_KPP_DEST'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUB_NAME_DEST: TcxGridDBBandedColumn [14]
            DataBinding.FieldName = 'SUB_NAME_DEST'
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
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
      'select     ID,'
      '              NAME,'
      '              SHORTNAME,'
      '              OBJECT_TYPE_ID,'
      '              STATE_ID,'
      '              ACCESSLEVEL,'
      '              SYSNAME,'
      '              DESCRIPT,'
      '              OWNER_OBJECT_ID,'
      '              TYPENAME,'
      '              TYPESYSNAME,'
      '              OBJECTKINDLIST,'
      '              DOC_DATE,'
      '              DOC_NUMBER,'
      '              SUB_ID   AS SUBJECT_ID,'
      '              SUB_NAME AS DECL_NAME,'
      '              SUB_INN  AS DECL_INN,'
      '              SUB_KPP AS DECL_KPP,'
      '              APP_NUMBER,'
      '              APP_DATE,'
      '              APP_DATE_INCOME,'
      '              REASON_ID,'
      '              SUMMA,'
      '              SIGNED_BY,'
      '              SIGN_DATE,'
      '              SIGNED_BY_CHIEF,'
      '              SIGNED_BY_CHIEF_UDF,'
      '              SUB_ID_DEST,'
      '              SUB_NAME_DEST,'
      '              SUB_INN_DEST,'
      '              SUB_KPP_DEST,'
      '              CURRENCY_ID,'
      '              ACTIVATION_DATE,'
      '              IS_ACTIVE,'
      '              REASON'
      '  from fdc_decision_for_lst  dp'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (dp.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (dp.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (dp.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (dp.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (dp.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (dp.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (dp.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (dp.summa <= :SUM_MAX)'
      '   and rownum <= :MaxRecordCount')
    inherited dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
    end
    object dsDataSIGNED_BY: TStringField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
      FieldName = 'SIGN_DATE'
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1080#1082
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF_UDF: TStringField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1054#1060#1058#1044
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      Size = 50
    end
    object dsDataSUB_ID_DEST: TFloatField
      FieldName = 'SUB_ID_DEST'
    end
    object dsDataSUB_NAME_DEST: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' ('#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100')'
      FieldName = 'SUB_NAME_DEST'
      Size = 4000
    end
    object dsDataSUB_INN_DEST: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'SUB_INN_DEST'
      Size = 12
    end
    object dsDataSUB_KPP_DEST: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'SUB_KPP_DEST'
      Size = 10
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataREASON: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'REASON'
    end
  end
end
