inherited StateTransitGridForm: TStateTransitGridForm
  Left = 310
  Top = 183
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1077#1088#1077#1093#1086#1076#1086#1074' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 50
            Width = 50
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 176
          end
          object grdDataDBBandedTableViewSRCSTATENAME: TcxGridDBBandedColumn
            Caption = #1048#1079' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
            DataBinding.FieldName = 'SRC_STATENAME'
            Width = 161
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDSTSTATENAME: TcxGridDBBandedColumn
            Caption = #1042' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
            DataBinding.FieldName = 'DST_STATENAME'
            Width = 183
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBEFOREPROCEDURENAME: TcxGridDBBandedColumn
            Caption = #1055#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084
            DataBinding.FieldName = 'BEFORE_PROCEDURENAME'
            Visible = False
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAFTERPROCEDURENAME: TcxGridDBBandedColumn
            Caption = #1055#1086#1089#1083#1077' '#1087#1077#1088#1077#1093#1086#1076#1072
            DataBinding.FieldName = 'AFTER_PROCEDURENAME'
            Visible = False
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 8
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
      26
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEME_ID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEMENAME
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Transit_Lst'
      '')
    SourceServerObject = 'FDC_STATE_TRANSIT_LST'
    object dsDataSTATE_SCHEME_ID: TFloatField
      FieldName = 'STATE_SCHEME_ID'
    end
    object dsDataSRC_STATE_ID: TFloatField
      FieldName = 'SRC_STATE_ID'
    end
    object dsDataDST_STATE_ID: TFloatField
      FieldName = 'DST_STATE_ID'
    end
    object dsDataBEFORE_PROCEDURE_ID: TFloatField
      FieldName = 'BEFORE_PROCEDURE_ID'
    end
    object dsDataAFTER_PROCEDURE_ID: TFloatField
      FieldName = 'AFTER_PROCEDURE_ID'
    end
    object dsDataSTATE_SCHEMENAME: TStringField
      FieldName = 'STATE_SCHEMENAME'
      Size = 1500
    end
    object dsDataSTATE_SCHEMESYSNAME: TStringField
      FieldName = 'STATE_SCHEMESYSNAME'
      Size = 1500
    end
    object dsDataSRC_STATENAME: TStringField
      FieldName = 'SRC_STATENAME'
      Size = 1500
    end
    object dsDataSRC_STATESYSNAME: TStringField
      FieldName = 'SRC_STATESYSNAME'
      Size = 1500
    end
    object dsDataDST_STATENAME: TStringField
      FieldName = 'DST_STATENAME'
      Size = 1500
    end
    object dsDataDST_STATESYSNAME: TStringField
      FieldName = 'DST_STATESYSNAME'
      Size = 1500
    end
    object dsDataBEFORE_PROCEDURENAME: TStringField
      FieldName = 'BEFORE_PROCEDURENAME'
      Size = 1500
    end
    object dsDataBEFORE_PROCEDURESYSNAME: TStringField
      FieldName = 'BEFORE_PROCEDURESYSNAME'
      Size = 1500
    end
    object dsDataAFTER_PROCEDURENAME: TStringField
      FieldName = 'AFTER_PROCEDURENAME'
      Size = 1500
    end
    object dsDataAFTER_PROCEDURESYSNAME: TStringField
      FieldName = 'AFTER_PROCEDURESYSNAME'
      Size = 1500
    end
  end
end
