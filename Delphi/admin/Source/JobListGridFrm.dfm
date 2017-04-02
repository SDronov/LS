inherited JobListGridForm: TJobListGridForm
  Left = 259
  Top = 274
  Width = 600
  Caption = 'JobListGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 592
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
      Width = 287
      Height = 17
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 287
        Height = 17
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 17
        end
      end
      inherited pnlProgress: TPanel
        Width = 287
        Height = 17
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 287
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 500
      Top = 3
      Width = 75
      Height = 17
      inherited ProgressBar: TcxProgressBar
        Height = 18
        Width = 77
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 592
  end
  inherited pnlWorkspace: TPanel
    Width = 592
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 387
      inherited grdData: TcxGrid
        Width = 387
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Hidden = True
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
          object grdDataDBBandedTableViewJOB_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOB_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOB_PARAMS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOB_PARAMS'
            Visible = False
            Hidden = True
            Width = 88
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewWHEN: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            DataBinding.FieldName = 'WHEN'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOB_SUBMIT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'JOB_SUBMIT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATUS: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1076#1072#1085#1080#1103
            DataBinding.FieldName = 'STATUS'
            SortIndex = 0
            SortOrder = soAscending
            Width = 134
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewJOB_NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103
            DataBinding.FieldName = 'JOB_NAME'
            Width = 183
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDIR: TcxGridDBBandedColumn
            Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
            DataBinding.FieldName = 'DIR'
            Width = 112
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINTERVAL: TcxGridDBBandedColumn
            Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            DataBinding.FieldName = 'INTERVAL'
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINTERVAL_UNITS: TcxGridDBBandedColumn
            Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1085#1090#1077#1088#1074#1072#1083#1072
            DataBinding.FieldName = 'INTERVAL_UNITSNAME'
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewWHEN_LAST: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            DataBinding.FieldName = 'WHEN_LAST'
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 15
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
      '  from fdc_Job_List_Lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    object dsDataJOB_ID: TFloatField
      FieldName = 'JOB_ID'
    end
    object dsDataJOB_PARAMS: TBlobField
      FieldName = 'JOB_PARAMS'
    end
    object dsDataWHEN: TDateTimeField
      FieldName = 'WHEN'
    end
    object dsDataJOB_SUBMIT_ID: TFloatField
      FieldName = 'JOB_SUBMIT_ID'
    end
    object dsDataSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4000
    end
    object dsDataJOB_NAME: TStringField
      FieldName = 'JOB_NAME'
      Size = 250
    end
    object dsDataDIR: TStringField
      FieldName = 'DIR'
      Size = 4000
    end
    object dsDataINTERVAL: TFloatField
      FieldName = 'INTERVAL'
    end
    object dsDataINTERVAL_UNITS: TStringField
      FieldName = 'INTERVAL_UNITS'
      Size = 30
    end
    object dsDataINTERVAL_UNITSNAME: TStringField
      FieldName = 'INTERVAL_UNITSNAME'
      Size = 4
    end
    object dsDataWHEN_LAST: TDateTimeField
      FieldName = 'WHEN_LAST'
    end
  end
end
