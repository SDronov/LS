inherited SubjectLookupForm: TSubjectLookupForm
  Caption = 'SubjectLookupForm'
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 226
        end
        inherited edtINN: TcxTextEdit
          Width = 151
        end
        inherited edtOKPO: TcxTextEdit
          Width = 151
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 361
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Width = 122
            Position.BandIndex = 0
            Position.ColIndex = 5
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
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
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
end
