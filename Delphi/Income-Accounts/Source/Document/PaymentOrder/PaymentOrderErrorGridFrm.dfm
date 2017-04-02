inherited PaymentOrderErrorGridForm: TPaymentOrderErrorGridForm
  Width = 686
  Caption = 'PaymentOrderErrorGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 678
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 373
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 373
      end
      inherited pnlProgress: TPanel
        Width = 373
        inherited lblProgress: TcxLabel
          Width = 373
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 586
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 678
  end
  inherited pnlWorkspace: TPanel
    Width = 678
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 473
      inherited grdData: TcxGrid
        Width = 473
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewERRORMESSAGE: TcxGridDBBandedColumn
            Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
            DataBinding.FieldName = 'ERRORMESSAGE'
            Width = 800
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction [3]
      Visible = False
    end
    inherited actSaveToFile: TAction [4]
    end
    inherited actCopySelection: TAction [5]
    end
    inherited actCopyAll: TAction [6]
    end
    inherited actFilterByCell: TAction [7]
    end
    inherited actFilterExcludeCell: TAction [8]
    end
    inherited actClearFilter: TAction [9]
    end
    inherited actOpen: TAction [10]
    end
    inherited actAdd: TAction [11]
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
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
    Filtered = True
    SQL.Strings = (
      'SELECT *'
      'FROM fdc_po_errors_lst t'
      'WHERE t.PaymentID = :ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataADDITIONMESSAGE: TStringField
      FieldName = 'ADDITIONMESSAGE'
      Size = 1500
    end
    object dsDataERRORMESSAGE: TStringField
      FieldName = 'ERRORMESSAGE'
      Size = 3003
    end
  end
end
