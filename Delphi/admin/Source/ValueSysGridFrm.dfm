inherited ValueGridForm: TValueGridForm
  Left = 208
  Top = 154
  Width = 790
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1080#1089#1090#1077#1084#1099
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    Width = 782
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      Height = 24
      inherited lblRecordCount: TcxLabel
        Height = 24
        Width = 102
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 24
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
      Height = 24
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 476
      Height = 24
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 476
        Height = 24
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 24
        end
      end
      inherited pnlProgress: TPanel
        Width = 476
        Height = 24
        inherited lblProgress: TcxLabel
          Height = 24
          Width = 476
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 689
      Width = 77
      Height = 24
      inherited ProgressBar: TcxProgressBar
        Height = 23
        Width = 95
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 782
  end
  inherited pnlWorkspace: TPanel
    Width = 782
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 226
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 530
      inherited grdData: TcxGrid
        Width = 530
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 191
          end
          object grdDataDBBandedTableViewStringValue: TcxGridDBBandedColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'STRINGVALUE'
            Width = 185
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSysName: TcxGridDBBandedColumn
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Width = 150
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
      Visible = False
      OnExecute = nil
      OnUpdate = nil
    end
    inherited actDelete: TAction
      Visible = False
      OnExecute = nil
      OnUpdate = nil
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
      'select  /*+ FIRST_ROWS */ *'
      '  from fdc_value_lst_sys'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and owner_object_id  is not null')
    SourceServerObject = 'FDC_VALUE_LST_SYS'
    object dsDataSTRINGVALUE: TStringField
      FieldName = 'STRINGVALUE'
      Size = 1500
    end
    object dsDataNUMVALUE: TFloatField
      FieldName = 'NUMVALUE'
    end
    object dsDataDATETIMEVALUE: TDateTimeField
      FieldName = 'DATETIMEVALUE'
    end
    object dsDataREF_OBJECT_ID: TFloatField
      FieldName = 'REF_OBJECT_ID'
    end
    object dsDataISSYSTEM: TIntegerField
      FieldName = 'ISSYSTEM'
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
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
    object dsDataREFNAME: TStringField
      FieldName = 'REFNAME'
      Size = 1500
    end
    object dsDataREFTYPENAME: TStringField
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
    object dsDataFILESOURCENAME: TStringField
      FieldName = 'FILESOURCENAME'
      Size = 1500
    end
  end
end
