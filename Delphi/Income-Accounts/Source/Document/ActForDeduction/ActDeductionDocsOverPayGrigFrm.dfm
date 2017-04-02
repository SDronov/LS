inherited ActDeductionDocsOverPayGrigForm: TActDeductionDocsOverPayGrigForm
  Left = 435
  Top = 315
  Caption = 'ActDeductionDocsOverPayGrigForm'
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
            Width = 128
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 115
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Width = 104
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME'
            Width = 239
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN'
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP'
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOM_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1058#1054
            DataBinding.FieldName = 'CUSTOM_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE_8: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
            DataBinding.FieldName = 'CUSTOMS_CODE_8'
            Visible = False
            Width = 73
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_ACT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_ACT'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 114
            Position.BandIndex = 0
            Position.ColIndex = 7
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT a.*, '
      '       (SELECT SUM(rp.summa)'
      '          FROM fdc_reserved_payment_lst rp'
      '          WHERE rp.doc_id = :id ) AS Sum_Act'
      'FROM fdc_advice_lst a, fdc_value_lst v'
      'WHERE v.OWNER_OBJECT_ID = :id'
      '  AND v.Ref_Object_ID = a.ID'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end>
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    inherited dsDataDESCRIPT: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    inherited dsDataTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataDECL_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataCUSTOM_NAME: TStringField
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsDataSUM_ACT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1072#1082#1090#1091
      FieldName = 'SUM_ACT'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 56
    Top = 166
    object sqlRemoveOverPay: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  P_ACT_DED_OVERPAY.RemoveOverPay('
        '      pActID     => :ACT_ID,'
        '      pAdviceID  => :ADVICE_ID'
        '    );'
        'END;')
    end
  end
end
