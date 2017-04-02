inherited StateGridBySchemeForm: TStateGridBySchemeForm
  Left = 312
  Top = 166
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 50
            Width = 50
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEME_ID
        SourceParamName = 'ID'
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEMENAME
        SourceParamName = 'Name'
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Lst'
      'where State_Scheme_ID = :ID')
    SourceServerObject = 'FDC_STATE_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataSTATE_SCHEME_ID: TFloatField
      FieldName = 'STATE_SCHEME_ID'
    end
    object dsDataALLOWUPDATES: TIntegerField
      FieldName = 'ALLOWUPDATES'
    end
    object dsDataALLOWDELETE: TIntegerField
      FieldName = 'ALLOWDELETE'
    end
    object dsDataACTIVE: TIntegerField
      FieldName = 'ACTIVE'
    end
    object dsDataCOLOR: TFloatField
      FieldName = 'COLOR'
    end
    object dsDataSTATE_SCHEMENAME: TStringField
      FieldName = 'STATE_SCHEMENAME'
      Size = 1500
    end
    object dsDataSTATE_SCHEMESYSNAME: TStringField
      FieldName = 'STATE_SCHEMESYSNAME'
      Size = 1500
    end
  end
end
