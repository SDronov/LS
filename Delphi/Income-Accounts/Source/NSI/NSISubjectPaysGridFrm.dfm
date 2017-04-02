inherited NSISubjectPaysGridForm: TNSISubjectPaysGridForm
  Width = 877
  Height = 402
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1086#1074' '#1079#1072' '#1060#1080#1079'. '#1083#1080#1094' '
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 339
    Width = 869
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 563
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 563
      end
      inherited pnlProgress: TPanel
        Width = 563
        inherited lblProgress: TcxLabel
          Width = 563
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 776
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 336
    Width = 869
  end
  inherited pnlWorkspace: TPanel
    Width = 869
    Height = 308
    inherited splSearchCriteria: TSplitter
      Height = 308
    end
    inherited pnlSearchCriteria: TPanel
      Height = 308
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 288
        inherited btnSearch: TcxButton
          Top = 257
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 228
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 664
      Height = 308
      inherited grdData: TcxGrid
        Width = 664
        Height = 308
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewCODE: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewADDRESS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ADDRESS'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FULL_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OKPO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OGRN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SOATO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PHONE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FAX'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEX'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEGRAPH'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELETYPE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 22
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
      '  from fdc_nsi_subject_pays_lst t'
      ' where (:Name is null or upper(SUBJECT_NAME) like upper(:Name))'
      
        'and NVL(:dat, t.sdate) between t.sdate and NVL(t.edate, to_date(' +
        #39'31123000'#39', '#39'ddmmyyyy'#39'))')
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 200
    end
    object dsDataFULL_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1085'. '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'FULL_NAME'
      Visible = False
      Size = 4000
    end
    object dsDataOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataOGRN: TStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      DisplayLabel = #1057#1054#1040#1058#1054
      FieldName = 'SOATO'
      Size = 8
    end
    object dsDataPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Size = 40
    end
    object dsDataFAX: TStringField
      DisplayLabel = #1060#1072#1082
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      DisplayLabel = #1058#1077#1083#1077#1093
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      DisplayLabel = #1058#1077#1083#1077#1075#1088#1072#1092
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1090#1072#1081#1087
      FieldName = 'TELETYPE'
      Size = 100
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1050#1086#1076' '#1089#1091#1073#1100#1077#1082#1090#1072
      FieldName = 'SUBJECT_ID'
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
  end
end
