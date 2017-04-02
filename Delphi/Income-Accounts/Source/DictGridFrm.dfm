inherited DictGridForm: TDictGridForm
  Left = 259
  Top = 163
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1079#1080#1094#1080#1081' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 281
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
      end
      inherited pnlProgress: TPanel
        Width = 281
        inherited lblProgress: TcxLabel
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 179
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          object grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'CODE'
            Width = 49
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFULLCODE: TcxGridDBBandedColumn
            Caption = #1055#1086#1083#1085#1099#1081' '#1082#1086#1076
            DataBinding.FieldName = 'FULLCODE'
            Width = 97
            Position.BandIndex = 0
            Position.ColIndex = 4
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
      '  from fdc_Dict_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_DICT_LST'
    object dsDataCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsDataCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataOWNERSYSNAME: TStringField
      FieldName = 'OWNERSYSNAME'
      Size = 1500
    end
    object dsDataOWNERTYPENAME: TStringField
      FieldName = 'OWNERTYPENAME'
      Size = 1500
    end
    object dsDataOWNERTYPESYSNAME: TStringField
      FieldName = 'OWNERTYPESYSNAME'
      Size = 1500
    end
    object dsDataFULLCODE: TStringField
      FieldName = 'FULLCODE'
      Size = 4000
    end
  end
end
