inherited DecisionDebtsGridForm: TDecisionDebtsGridForm
  Left = 416
  Top = 297
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1077#1090#1077' '#1044#1057' '#1074' '#1089#1095#1077#1090' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
    end
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
        inherited edtDeclName: TcxTextEdit
          Width = 167
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
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colSumRub
            end>
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 256
          end
          inherited colAppDate: TcxGridDBBandedColumn
            Visible = False
          end
          inherited colAppDateIncome: TcxGridDBBandedColumn
            Visible = False
          end
          object colValuta: TcxGridDBBandedColumn
            DataBinding.FieldName = 'VALUTA'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object colSumRub: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_RUB'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 128
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object colStateName: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATENAME'
            Width = 141
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 63
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
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
      
        'select d.*, s.NAME AS StateName, c.code||'#39' - '#39'||nvl(c.ShortName,' +
        'c.Name) AS Valuta'
      
        '  from fdc_decision_debts_lst d, fdc_state_lst s, fdc_nsi_curren' +
        'cy_lst c'
      ' where (:Name is null or upper(d.NAME) like upper(:Name))'
      '   AND s.ID (+) = d.state_id'
      '   AND c.ID (+) = d.currency_id'
      '/*$p#decl_name#*/ AND (d.decl_name        LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (d.decl_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (d.decl_kpp         LIKE :KPP)'
      '/*$p#doc_no#*/    AND (d.doc_number       LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (d.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (d.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (d.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (d.summa <= :SUM_MAX)'
      '/*$p#active_from#*/ AND (d.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (d.activation_date  <= :ACTIVE_TO)'
      '   and rownum <= :MaxRecordCount  ')
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataVALUTA: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 25
      FieldName = 'VALUTA'
      Size = 1506
    end
    object dsDataSTATENAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 30
      FieldName = 'STATENAME'
      Size = 1500
    end
    object dsDataSUM_RUB: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073'.'
      DisplayWidth = 20
      FieldName = 'SUM_RUB'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1077#1085
      DisplayWidth = 20
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_EXTERNAL: TStringField
      FieldName = 'IS_EXTERNAL'
      Size = 1
    end
  end
end
