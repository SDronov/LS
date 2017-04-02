inherited AccountEntryGridForm: TAccountEntryGridForm
  Width = 786
  Caption = #1055#1088#1086#1074#1086#1076#1082#1080
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    Width = 778
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
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
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 472
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 472
      end
      inherited pnlProgress: TPanel
        Width = 472
        inherited lblProgress: TcxLabel
          Height = 24
          Width = 472
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 685
      Width = 77
      inherited ProgressBar: TcxProgressBar
        Height = 23
        Width = 95
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 778
  end
  inherited pnlWorkspace: TPanel
    Width = 778
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 226
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 526
      inherited grdData: TcxGrid
        Width = 526
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnSelectionChanged = grdDataDBBandedTableViewSelectionChanged
          OptionsView.BandHeaders = True
          Preview.Column = nil
          Bands = <
            item
              Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            end
            item
              Caption = #1044#1077#1073#1077#1090
            end
            item
              Caption = #1050#1088#1077#1076#1080#1090
            end
            item
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Visible = True
            Width = 71
          end
          object grdDataDBBandedTableViewITEM_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ITEM_DATE'
            Width = 38
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBNO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBNO'
            Width = 38
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEB_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEB_INN'
            Width = 36
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEB_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEB_P'
            Width = 61
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCRENO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CRENO'
            Width = 38
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCRE_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CRE_INN'
            Width = 36
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCRE_P: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CRE_P'
            Width = 61
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 49
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODE'
            Width = 56
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_NAME'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_GOODS'
            Width = 118
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
    end
    inherited actDelete: TAction
      Visible = False
    end
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
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_account_entry_mb_lst'
      'where'
      ':name is null'
      'and rownum <= :MaxRecordCount'
      'order by '
      '  item_date')
    ParamData = <
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataITEM_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'ITEM_DATE'
    end
    object dsDataDEBNO: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'DEBNO'
      Size = 100
    end
    object dsDataDEB_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DEB_INN'
      Size = 12
    end
    object dsDataDEB_P: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1095'.'
      FieldName = 'DEB_P'
      Size = 3
    end
    object dsDataCRENO: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'CRENO'
      Size = 100
    end
    object dsDataCRE_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'CRE_INN'
      Size = 12
    end
    object dsDataCRE_P: TStringField
      DisplayLabel = #1042#1080#1076' '#1085#1072#1095'.'
      FieldName = 'CRE_P'
      Size = 3
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CODE'
      Size = 3
    end
    object dsDataOBJECT_NAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'OBJECT_NAME'
      Size = 3001
    end
    object dsDataDECL_GOODS: TStringField
      DisplayLabel = #1050#1086#1076#1099' '#1058#1086#1074#1072#1088#1086#1074
      FieldName = 'DECL_GOODS'
      Size = 4000
    end
  end
end
