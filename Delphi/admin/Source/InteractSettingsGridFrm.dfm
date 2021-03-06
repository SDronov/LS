inherited InteractSettingsGridForm: TInteractSettingsGridForm
  Left = 359
  Top = 240
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1081
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
          object grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn [3]
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'CODE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPE: TcxGridDBBandedColumn [5]
            Caption = #1058#1080#1087' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103
            DataBinding.FieldName = 'TYPE'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSoftName: TcxGridDBBandedColumn
            Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'SOFT_NAME'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 7
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from ASBC_Interact_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'ASBC_Interact_lst'
    object dsDataCODE: TStringField
      FieldName = 'CODE'
    end
    object dsDataInteract_name: TStringField
      FieldName = 'Interact_name'
      Size = 240
    end
    object dsDataTYPE: TStringField
      FieldName = 'TYPE'
    end
    object dsDataNTYPE: TIntegerField
      FieldName = 'NTYPE'
    end
    object dsDataSOFT_CODE: TStringField
      FieldName = 'SOFT_CODE'
      Size = 100
    end
    object dsDataSOFT_NAME: TStringField
      FieldName = 'SOFT_NAME'
      Size = 1000
    end
  end
end
