inherited ActDeductionDedsGridForm: TActDeductionDedsGridForm
  Caption = 'ActDeductionDedsGridForm'
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
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Width = 120
          end
          object grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'PO_NAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_SOURCE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050' "'#1057'"'
            DataBinding.FieldName = 'KBK_SOURCE'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_TARGET: TcxGridDBBandedColumn
            Caption = #1050#1041#1050' "'#1053#1072'"'
            DataBinding.FieldName = 'KBK_TARGET'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1086#1074#1077#1076#1105#1085
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBUDGET_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'BUDGET_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 12
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
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnAutoFilter
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT pd.*'
      '      ,CASE pd.is_active'
      '         WHEN '#39'A'#39' THEN '#39'Y'#39
      '         ELSE          '#39'N'#39
      '       END      AS is_archive'
      '      ,po.name  AS po_name'
      '      ,pt.code  AS pay_type_code'
      '      ,k_f.code AS kbk_source'
      '      ,k_t.code AS kbk_target'
      '      ,(SELECT b.doc_date'
      
        '          FROM fdc_reestr_specify_kindpay_lst b, fdc_value_lst v' +
        'l'
      '          WHERE vl.Ref_Object_ID = pd.id'
      '            AND b.id             = vl.owner_object_id )'
      '                AS budget_date'
      '  FROM fdc_payment_deduction_all_Lst pd'
      '      ,fdc_object_lst                po'
      '      ,fdc_payment_type_lst          pt'
      '      ,fdc_kbk_dict_lst              k_f'
      '      ,fdc_kbk_dict_lst              k_t'
      ' WHERE decl_id = :id'
      '   AND pd.payment_id = po.id'
      '   AND pt.id(+)      = pd.pay_type_id'
      '   AND k_f.id(+)     = pd.kbkcode1_id'
      '   AND k_t.id(+)     = pd.kbkcode_id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
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
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataPAYMENT_MONTH: TDateTimeField
      FieldName = 'PAYMENT_MONTH'
    end
    object dsDataCHARGE_CURR_ID: TFloatField
      FieldName = 'CHARGE_CURR_ID'
    end
    object dsDataCHARGE_SUMMA: TFloatField
      FieldName = 'CHARGE_SUMMA'
    end
    object dsDataCHARGE_ID: TFloatField
      FieldName = 'CHARGE_ID'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataKBKCODE1_ID: TFloatField
      FieldName = 'KBKCODE1_ID'
    end
    object dsDataCONTRACT_ID: TFloatField
      FieldName = 'CONTRACT_ID'
    end
    object dsDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      Size = 1
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 1500
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataKBK_SOURCE: TStringField
      FieldName = 'KBK_SOURCE'
      Size = 1500
    end
    object dsDataKBK_TARGET: TStringField
      FieldName = 'KBK_TARGET'
      Size = 1500
    end
    object dsDataBUDGET_DATE: TDateTimeField
      FieldName = 'BUDGET_DATE'
    end
  end
end
