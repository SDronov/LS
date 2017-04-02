inherited ContactGridForm: TContactGridForm
  Left = 297
  Top = 263
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1072#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 16
      inherited lblRecordCount: TcxLabel
        Width = 100
        Height = 16
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 16
      inherited lblQueryTime: TcxLabel
        Width = 100
        Height = 16
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 16
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 16
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 16
        end
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 265
          Height = 16
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 16
        inherited lblProgress: TcxLabel
          Width = 281
          Height = 16
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 16
    end
  end
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
          object grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn [3]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            DataBinding.FieldName = 'OWNERNAME'
            Width = 210
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1050#1086#1085#1090#1072#1082#1090
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
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
      26
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
        SourceField = dsDataOWNERNAME
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Contact_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_CONTACT_LST'
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
  end
end
