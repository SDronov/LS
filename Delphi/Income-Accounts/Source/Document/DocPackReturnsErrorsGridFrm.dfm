inherited DocPackRetsErrorGridForm: TDocPackRetsErrorGridForm
  Left = 351
  Top = 184
  Caption = 'DocPackRetsErrorGridForm'
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
    inherited actOpen: TAction
      Enabled = False
      Visible = False
    end
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
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
    inherited btnAdd: TdxBarButton
      Enabled = False
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *  from fdc_po_errors_lst t '
      'where 1 = 1'
      ' and t.TypeSYSNAME = '#39'PO_PaybackIllegalChars'#39
      ' and (:id is null) or (:id is not null)')
    AfterScroll = dsDataAfterScroll
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
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
