inherited DecisionPaymentGridForm: TDecisionPaymentGridForm
  Caption = 
    #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1077#1090#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1074' '#1089#1095#1077#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090 +
    #1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
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
      Width = 610
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 610
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 610
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 610
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 823
      Top = 3
      Width = 75
      Height = 21
    end
  end
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
          Width = 167
        end
        inherited edtDeclName: TcxTextEdit
          Width = 167
        end
        inherited edtINN: TcxTextEdit
          Width = 116
        end
        inherited edtKPP: TcxTextEdit
          Width = 116
        end
        inherited edtNomer: TcxTextEdit
          Width = 116
        end
        inherited edtFromDate: TcxDateEdit
          Width = 116
        end
        inherited edtToDate: TcxDateEdit
          Width = 116
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 116
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 116
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object columnSTATE_NAME: TcxGridDBBandedColumn [1]
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'STATE_NAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Position.ColIndex = 3
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          inherited colDocNumber: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited colDocDate: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited colAppDate: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
          inherited colAppDateIncome: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited colSumma: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          object colSignedBy: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SIGNED_BY'
            Width = 263
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object columnIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object columnACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewATICLE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ATICLE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_OSN_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_OSN_CODE'
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 17
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      
        '      ,( SELECT o.name FROM fdc_object_lst o WHERE o.id = d.stat' +
        'e_id ) AS state_name'
      '      ,r.code2 AS aticle'
      '  from fdc_decision_payment_lst d'
      '      ,fdc_dict_lst r'
      ' where (:Name is null or upper(d.NAME) like upper(:Name))'
      '   AND r.id(+) = d.reason_id'
      '/*$p#decl_name#*/ AND (d.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (d.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (d.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (d.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (d.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (d.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (d.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (d.summa <= :SUM_MAX)'
      '/*$p#active_from#*/ AND (d.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (d.activation_date  <= :ACTIVE_TO)'
      '   and rownum <= :MaxRecordCount  ')
    inherited dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
    end
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    inherited dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
    end
    object dsDataSIGNED_BY: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1072#1074#1096#1077#1077' '#1083#1080#1094#1086
      FieldName = 'SIGNED_BY'
      Size = 50
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
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF_UDF: TStringField
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      Size = 50
    end
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 200
    end
    object dsDataATICLE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'ATICLE'
      Size = 1500
    end
    object dsDataDOC_OSN_CODE: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'DOC_OSN_CODE'
      Size = 2
    end
  end
end
