inherited SelectRByPayerForm: TSelectRByPayerForm
  Width = 805
  Caption = #1055#1077#1088#1077#1079#1072#1095#1077#1090#1099' '#1087#1086'  '#1043#1058#1044
  PixelsPerInch = 120
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 797
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited lblRecordCount: TcxLabel
        Height = 25
        Width = 102
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 25
        Width = 106
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 491
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 491
      end
      inherited pnlProgress: TPanel
        Width = 491
        inherited lblProgress: TcxLabel
          Height = 25
          Width = 491
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 704
      inherited ProgressBar: TcxProgressBar
        Height = 24
        Width = 98
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 797
  end
  inherited pnlWorkspace: TPanel
    Width = 797
    inherited pnlGrid: TPanel
      Width = 529
      inherited grdData: TcxGrid
        Width = 529
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NAME'
            Width = 224
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_NAME'
            Width = 190
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 116
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 3
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
    SQL.Strings = (
      'select * from fdc_reserved_payment_lst'
      'where payer_id = :subject_id'
      'and edate is null'
      'and reason_code = '#39'L'#39)
    ParamData = <
      item
        DataType = ftFloat
        Name = 'subject_id'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsDataDOC_NAME: TStringField
      DisplayLabel = #1043#1058#1044
      DisplayWidth = 200
      FieldName = 'DOC_NAME'
      Size = 1500
    end
    object dsDataPO_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
      DisplayWidth = 300
      FieldName = 'PO_NAME'
      Size = 1500
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
  end
end
