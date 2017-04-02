inherited BPAgreementGridForm: TBPAgreementGridForm
  Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1103' '#1089' '#1082#1088#1091#1087#1085#1099#1084#1080' '#1085#1072#1083#1086#1075#1086#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072#1084#1080
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Width = 77
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 226
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJ_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJ_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJ_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJ_INN'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJ_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJ_KPP'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFROM_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FROM_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTO_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TO_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 11
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_bp_Agreement_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))')
    object dsDataDOC_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NO'
      Size = 10
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataSUBJ_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      FieldName = 'SUBJ_NAME'
      Size = 1500
    end
    object dsDataSUBJ_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJ_INN'
      Size = 12
    end
    object dsDataSUBJ_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJ_KPP'
      Size = 10
    end
    object dsDataFROM_DATE: TDateTimeField
      DisplayLabel = #1057
      FieldName = 'FROM_DATE'
    end
    object dsDataTO_DATE: TDateTimeField
      DisplayLabel = #1055#1086
      FieldName = 'TO_DATE'
    end
  end
end
