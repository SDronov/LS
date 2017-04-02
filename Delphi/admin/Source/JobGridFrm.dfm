inherited JobGridForm: TJobGridForm
  Caption = 'JobGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 17
      inherited lblRecordCount: TcxLabel
        Height = 17
        Width = 100
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 19
        Width = 81
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 17
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Height = 17
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 17
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 17
        end
      end
      inherited pnlProgress: TPanel
        Height = 17
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Top = 3
      Width = 75
      Height = 17
      inherited ProgressBar: TcxProgressBar
        Height = 18
        Width = 77
      end
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
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            Width = 50
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Width = 50
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Hidden = True
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOB_PROCEDURE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOB_PROCEDURE'
            Width = 274
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOB_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOB_NAME'
            Width = 306
            Position.BandIndex = 0
            Position.ColIndex = 11
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
      'select l.*,l.id job_id'
      '  from fdc_job_Lst l'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    object dsDataJOB_PROCEDURE: TStringField
      FieldName = 'JOB_PROCEDURE'
      Size = 30
    end
    object dsDataJOB_NAME: TStringField
      FieldName = 'JOB_NAME'
      Size = 250
    end
  end
end
