inherited AddressGridForm: TAddressGridForm
  Left = 298
  Top = 237
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1076#1088#1077#1089#1086#1074
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
          OptionsView.ColumnAutoWidth = False
          OptionsView.BandHeaders = True
          Bands = <
            item
            end
            item
              Caption = #1057#1090#1088#1072#1085#1072
            end>
          object grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn [3]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            DataBinding.FieldName = 'OWNERNAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn [4]
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn [5]
            Caption = #1040#1076#1088#1077#1089
            Width = 210
          end
          object grdDataDBBandedTableViewCOUNTRYCODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'COUNTRYCODE'
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCOUNTRYNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'COUNTRYNAME'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 1
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataOWNER_OBJECT_ID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataOWNER_OBJECT_ID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Address_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_ADDRESS_LST'
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataCOUNTRY_DICT_ID: TFloatField
      FieldName = 'COUNTRY_DICT_ID'
    end
    object dsDataCOUNTRYCODE: TStringField
      FieldName = 'COUNTRYCODE'
      Size = 1500
    end
    object dsDataCOUNTRYNAME: TStringField
      FieldName = 'COUNTRYNAME'
      Size = 1500
    end
  end
end
