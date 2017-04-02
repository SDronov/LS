inherited RoleGridForm: TRoleGridForm
  Top = 271
  Height = 368
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1086#1083#1077#1081' '#1076#1086#1089#1090#1091#1087#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 316
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 313
  end
  inherited pnlWorkspace: TPanel
    Height = 287
    inherited splSearchCriteria: TSplitter
      Height = 287
    end
    inherited pnlSearchCriteria: TPanel
      Height = 287
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 267
        inherited btnSearch: TcxButton
          Top = 235
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1086#1083#1080' '#1076#1086#1089#1090#1091#1087#1072':'
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 287
      inherited grdData: TcxGrid
        Height = 287
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewROLE_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'ROLE_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumnDesc: TcxGridDBBandedColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Width = 400
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_role_Lst'
      ' where (:Name is null or upper(name) like upper(:Name))'
      'order by name')
    SourceServerObject = 'FDC_ROLE_LST'
    object dsDataROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Size = 32
    end
  end
end
