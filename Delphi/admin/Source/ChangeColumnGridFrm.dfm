inherited ChangeColumnGridForm: TChangeColumnGridForm
  Left = 356
  Top = 272
  VertScrollBar.Range = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsNone
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1086#1083#1073#1094#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 300
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 300
      end
      inherited pnlProgress: TPanel
        Width = 300
        inherited lblProgress: TcxLabel
          Width = 300
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 513
      Width = 77
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 290
    Height = 3
  end
  inherited pnlWorkspace: TPanel
    Height = 262
    inherited splSearchCriteria: TSplitter
      Height = 262
    end
    inherited pnlSearchCriteria: TPanel
      Height = 262
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 242
        inherited btnSearch: TcxButton
          Top = 210
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 262
      inherited grdData: TcxGrid
        Height = 262
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsSelection.CellSelect = False
          object colCol_Name: TcxGridDBBandedColumn
            Caption = #1048#1084#1103' '#1087#1086#1083#1103
            DataBinding.FieldName = 'COL_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colChar_New: TcxGridDBBandedColumn
            Caption = #1053#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'CHAR_NEW'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object colChar_Old: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1088#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'CHAR_OLD'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actOpen: TAction
      Category = 'Data'
      Caption = 'actOpen'
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select * from fdc_Change_Column_lst '
      'where table_id = :Table_ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Table_ID'
        ParamType = ptUnknown
      end>
  end
end
