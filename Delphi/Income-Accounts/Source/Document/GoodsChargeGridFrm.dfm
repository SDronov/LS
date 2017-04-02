inherited GoodsChargeGridForm: TGoodsChargeGridForm
  Left = 358
  Top = 300
  Width = 690
  Caption = 'GoodsChargeGridForm'
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    Width = 682
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 376
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 376
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 360
        end
      end
      inherited pnlProgress: TPanel
        Width = 376
        inherited lblProgress: TcxLabel
          Width = 376
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 589
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 682
  end
  inherited pnlWorkspace: TPanel
    Width = 682
    inherited pnlGrid: TPanel
      Width = 430
      inherited grdData: TcxGrid
        Width = 430
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_NAME'
            Width = 112
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_MODE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_MODE_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_MODE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_MODE_NAME'
            Width = 142
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_MODE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_MODE_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_NAME'
            Width = 94
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
        end
      end
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
      '  from fdc_Goods_Charge_Lst'
      ' where DECL_GOODS_ID = :DECL_GOODS_ID'
      'and (:Name is null or upper(NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_GOODS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsDataPAY_TYPE_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_TYPE_NAME'
      Size = 1500
    end
    object dsDataPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataPAY_MODE_ID: TFloatField
      FieldName = 'PAY_MODE_ID'
      Visible = False
    end
    object dsDataPAY_MODE_NAME: TStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_MODE_NAME'
      Size = 1500
    end
    object dsDataPAY_MODE_CODE: TStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_MODE_CODE'
      Size = 1500
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataCURRENCY_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_NAME'
      Size = 1500
    end
    object dsDataCURRENCY_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
  end
end
