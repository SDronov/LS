inherited ActCorrectOperBalansTranGridForm: TActCorrectOperBalansTranGridForm
  Caption = 'ActCorrectOperBalansTranGridForm'
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
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewDOC_TYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_TYPENAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 114
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUBJECT: TcxGridDBBandedColumn
            Caption = #1059#1095'. '#1042#1069#1044' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_SUBJECT'
            Visible = False
            Hidden = True
            Width = 266
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMM: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'DOC_SUMM'
            Visible = False
            Hidden = True
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_CODE: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072' '
            DataBinding.FieldName = 'ACCOUNT_CODE'
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_DEBIT: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1076#1074#1080#1078#1077#1085#1080#1103' '#1087#1086' '#1089#1095#1077#1090#1091' '
            DataBinding.FieldName = 'IS_DEBIT'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_CODE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBK_CODE'
            Width = 158
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            Caption = #1059#1095'. '#1042#1069#1044
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 240
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOPERATION_SUM: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'OPERATION_SUM'
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Width = 91
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
      Enabled = False
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
      '  from fdc_actcorrectob_tran_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
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
    object dsDataACT_ID: TFloatField
      FieldName = 'ACT_ID'
    end
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataKBK_ID: TFloatField
      FieldName = 'KBK_ID'
    end
    object dsDataPAYMENT_TYPE_ID: TFloatField
      FieldName = 'PAYMENT_TYPE_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
    end
    object dsDataIS_DEBIT: TStringField
      FieldName = 'IS_DEBIT'
      Size = 1
    end
    object dsDataOPERATION_SUM: TFloatField
      FieldName = 'OPERATION_SUM'
      DisplayFormat = ',0.00'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataACCOUNT_CODE: TStringField
      FieldName = 'ACCOUNT_CODE'
      Size = 1500
    end
    object dsDataKBK_CODE: TStringField
      FieldName = 'KBK_CODE'
      Size = 1500
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_TYPESYSNAME: TStringField
      FieldName = 'DOC_TYPESYSNAME'
      Size = 1500
    end
    object dsDataDOC_TYPENAME: TStringField
      FieldName = 'DOC_TYPENAME'
      Size = 1500
    end
    object dsDataDOC_SUBJECT: TStringField
      FieldName = 'DOC_SUBJECT'
      Size = 1500
    end
    object dsDataDOC_SUMM: TFloatField
      FieldName = 'DOC_SUMM'
      DisplayFormat = ',0.00'
    end
  end
end
