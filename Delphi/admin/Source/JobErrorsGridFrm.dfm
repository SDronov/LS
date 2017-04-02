inherited JobErrorsGridForm: TJobErrorsGridForm
  Left = 338
  Top = 212
  Caption = 'JobErrorsGridForm'
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
      Width = 285
      Height = 17
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 285
        Height = 17
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 17
        end
      end
      inherited pnlProgress: TPanel
        Width = 285
        Height = 17
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 285
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 498
      Top = 3
      Width = 75
      Height = 17
      inherited ProgressBar: TcxProgressBar
        Height = 18
        Width = 75
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 297
    Height = 3
  end
  inherited pnlWorkspace: TPanel
    Height = 271
    inherited splSearchCriteria: TSplitter
      Height = 271
    end
    inherited pnlSearchCriteria: TPanel
      Height = 271
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 251
        inherited btnSearch: TcxButton
          Top = 219
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 271
      inherited grdData: TcxGrid
        Height = 271
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOBEXEC_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOBEXEC_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewERROR_TEXT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERROR_TEXT'
            Position.BandIndex = 0
            Position.ColIndex = 2
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
      'from fdc_job_log where'
      '(:jobexec_id is null or jobexec_id = :jobexec_id)')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'jobexec_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'jobexec_id'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDataJOBEXEC_ID: TFloatField
      FieldName = 'JOBEXEC_ID'
    end
    object dsDataERROR_TEXT: TStringField
      FieldName = 'ERROR_TEXT'
      Size = 4000
    end
  end
end
