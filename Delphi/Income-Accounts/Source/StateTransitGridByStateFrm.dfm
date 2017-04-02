inherited StateTransitGridByStateForm: TStateTransitGridByStateForm
  Left = 263
  Top = 190
  Caption = #1055#1077#1088#1077#1093#1086#1076#1099' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
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
            Width = 154
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          inherited grdDataDBBandedTableViewSRCSTATENAME: TcxGridDBBandedColumn
            Width = 141
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDSTSTATENAME: TcxGridDBBandedColumn
            Width = 161
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewBEFOREPROCEDURENAME: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewAFTERPROCEDURENAME: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          object grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'DIRECTION'
            Width = 76
            Position.BandIndex = 0
            Position.ColIndex = 3
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
        SourceField = dsDataSTATE_SCHEME_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEMENAME
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select '#39#1042#1099#1093#1086#1076#39' as Direction,'
      '           T.*'
      '  from fdc_State_Transit_Lst T'
      ' where Src_State_ID = :ID'
      '    union'
      'select '#39#1042#1093#1086#1076#39' as Direction,'
      '          T.*'
      '  from fdc_State_Transit_Lst T'
      ' where Dst_State_ID = :ID'
      ''
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataDIRECTION: TStringField
      FieldName = 'DIRECTION'
      Size = 5
    end
  end
end
