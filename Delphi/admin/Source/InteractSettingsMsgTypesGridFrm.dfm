inherited InteractSettingsMsgTypesGridForm: TInteractSettingsMsgTypesGridForm
  Left = 839
  Top = 206
  Caption = #1050#1086#1076#1099' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103
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
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewCode: TcxGridDBBandedColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'CODE'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDirection: TcxGridDBBandedColumn
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'DIRECTION'
            Position.BandIndex = 0
            Position.ColIndex = 6
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
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from ASBC_INTERACTMSGTYPES_LST'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '     and owner_object_id = :ID')
    SourceServerObject = 'ASBC_INTERACTMSGTYPES_LST'
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
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataCODE: TStringField
      FieldName = 'CODE'
    end
    object dsDataEXECPROC: TStringField
      FieldName = 'EXECPROC'
      Size = 100
    end
    object dsDataDIRECTION: TStringField
      FieldName = 'DIRECTION'
      Size = 100
    end
    object dsDataNDIRECTION: TIntegerField
      FieldName = 'NDIRECTION'
    end
    object dsDataOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 1000
    end
  end
end
