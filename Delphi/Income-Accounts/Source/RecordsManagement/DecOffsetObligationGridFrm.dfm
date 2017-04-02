inherited DecOffsetObligationGridForm: TDecOffsetObligationGridForm
  Left = 270
  Top = 299
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1077#1090#1077' '#1058#1056' '#1089#1090'.145'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited colDocNumber: TcxGridDBBandedColumn [3]
            Position.ColIndex = 4
          end
          inherited colDocDate: TcxGridDBBandedColumn [4]
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn [5]
            Visible = True
            Width = 443
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn [6]
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn [7]
            DataBinding.FieldName = 'DECL_INN'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'DECL_KPP'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
          end
          object grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn [10]
            Caption = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
            DataBinding.FieldName = 'SIGN_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          inherited colSumma: TcxGridDBBandedColumn [11]
            Width = 120
            Position.ColIndex = 11
          end
          object grdDataDBBandedTableViewVALUTA: TcxGridDBBandedColumn [12]
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'VALUTA'
            Visible = False
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn [13]
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn [14]
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn [15]
            Visible = False
            Hidden = True
            Position.ColIndex = 12
          end
          inherited colAppDate: TcxGridDBBandedColumn [16]
            Hidden = True
            Position.ColIndex = 13
          end
          inherited colAppDateIncome: TcxGridDBBandedColumn [17]
            Hidden = True
            Position.ColIndex = 14
          end
          inherited colState: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            Position.ColIndex = 15
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = True
    end
    inherited actSearchOk: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
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
            Item = cmbDocType
            UserDefine = [udWidth]
            UserWidth = 90
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
      28
      0)
    inherited cmbDocType: TdxBarCombo
      Visible = ivNever
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select d.*, s.NAME AS StateName, c.code||'#39' - '#39'||nvl(c.ShortName,' +
        'c.Name) AS Valuta'
      
        '  from fdc_dec_offset_obligation_lst d, fdc_state_lst s, fdc_nsi' +
        '_currency_lst c'
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
        DataType = ftString
        Name = 'DECL_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataSUMMA: TFloatField
      DisplayWidth = 24
      DisplayFormat = ',0.00'
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
    object dsDataAPP_NUMBER_INCOME: TStringField
      FieldName = 'APP_NUMBER_INCOME'
      Size = 50
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
    object dsDataPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataDOC_CODE: TStringField
      FieldName = 'DOC_CODE'
      Size = 8
    end
    object dsDataDOC_OSN_CODE: TStringField
      FieldName = 'DOC_OSN_CODE'
      Size = 2
    end
    object dsDataSUD_REASON_ID: TFloatField
      FieldName = 'SUD_REASON_ID'
    end
    object dsDataDEBTS_SUMMA: TFloatField
      FieldName = 'DEBTS_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDOC_NUMBER_FULL: TStringField
      FieldName = 'DOC_NUMBER_FULL'
      Size = 131
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataVALUTA: TStringField
      DisplayWidth = 200
      FieldName = 'VALUTA'
      Size = 1506
    end
  end
end
