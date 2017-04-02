inherited DeclObligationGridForm: TDeclObligationGridForm
  Caption = #1050' '#1091#1087#1083#1072#1090#1077
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 226
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Width = 20
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            Width = 112
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 79
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
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
      'select *'
      '  from fdc_cdecl_obligation_lst'
      ' where '
      '(:Name is null )'
      'and DECL_ID = :DECL_ID')
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    inherited dsDataNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
      Visible = False
    end
    object dsDataPAYMENT_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_NAME'
      Size = 1500
    end
  end
end
