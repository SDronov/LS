inherited RegDocumentGridForm: TRegDocumentGridForm
  Left = 291
  Top = 164
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
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
          OptionsView.ColumnAutoWidth = False
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewOWNERNAME: TcxGridDBBandedColumn
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            DataBinding.FieldName = 'OWNER_NAME'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOCSERIAL: TcxGridDBBandedColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'DOCSERIAL'
            Width = 40
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOCNUMBER: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'DOCNUMBER'
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOCDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            DataBinding.FieldName = 'DOCDATE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewGRANTEE: TcxGridDBBandedColumn
            Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
            DataBinding.FieldName = 'GRANTEE'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTOPDATE: TcxGridDBBandedColumn
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1076#1086
            DataBinding.FieldName = 'STOPDATE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      '  from fdc_Reg_Document_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_REG_DOCUMENT_LST'
    object dsDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsDataSTOPDATE: TDateTimeField
      FieldName = 'STOPDATE'
    end
    object dsDataDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 1500
    end
    object dsDataDOCSERIAL: TStringField
      FieldName = 'DOCSERIAL'
      Size = 1500
    end
    object dsDataGRANTEE: TStringField
      FieldName = 'GRANTEE'
      Size = 1500
    end
    object dsDataOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 1500
    end
  end
end
