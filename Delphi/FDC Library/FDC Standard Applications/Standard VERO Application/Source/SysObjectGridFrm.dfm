inherited SysObjectGridForm: TSysObjectGridForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1080#1089#1090#1077#1084#1085#1099#1093' '#1086#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 277
            Position.ColIndex = 3
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn [4]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            DataBinding.FieldName = 'SYSNAME'
            Width = 242
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 5
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
      '  from fdc_Object_Lst'
      ' where (SYSNAME is not null) and'
      '       (:Name is null or upper(NAME) like upper(:Name))')
  end
end
