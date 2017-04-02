inherited PersonGridForm: TPersonGridForm
  Left = 299
  Top = 236
  Height = 383
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1091#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 336
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
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 333
  end
  inherited pnlWorkspace: TPanel
    Height = 307
    inherited splSearchCriteria: TSplitter
      Height = 307
    end
    inherited pnlSearchCriteria: TPanel
      Height = 307
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 287
        inherited btnSearch: TcxButton
          Top = 255
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 307
      inherited grdData: TcxGrid
        Height = 307
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          OptionsView.ColumnAutoWidth = False
          OptionsView.BandHeaders = True
          Bands = <
            item
              Caption = #1057#1091#1073#1098#1077#1082#1090
            end
            item
              Caption = #1056#1086#1078#1076#1077#1085#1080#1077'('#1089#1086#1079#1076#1072#1085#1080#1077')'
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 46
            Width = 46
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn [3]
            Caption = #1050#1086#1088#1086#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'SHORTNAME'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            Width = 210
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'INN'
            Visible = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn
            Caption = #1054#1050#1055#1054
            DataBinding.FieldName = 'OKPO'
            Visible = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn
            Caption = #1054#1043#1056#1053
            DataBinding.FieldName = 'OGRN'
            Visible = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'KPP'
            Visible = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn
            Caption = #1041#1048#1050
            DataBinding.FieldName = 'BIC'
            Visible = False
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFIRSTNAME: TcxGridDBBandedColumn
            Caption = #1048#1084#1103
            DataBinding.FieldName = 'FIRSTNAME'
            Visible = False
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMIDDLENAME: TcxGridDBBandedColumn
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            DataBinding.FieldName = 'MIDDLENAME'
            Visible = False
            Width = 230
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIRTHYEAR: TcxGridDBBandedColumn
            Caption = #1043#1086#1076
            DataBinding.FieldName = 'BIRTHYEAR'
            Width = 44
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIRTHDATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'BIRTHDATE'
            Width = 66
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIRTHLOCATION: TcxGridDBBandedColumn
            Caption = #1052#1077#1089#1090#1086
            DataBinding.FieldName = 'BIRTHLOCATION'
            Width = 200
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actHighlightLat: TAction
      Category = 'View'
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1083#1072#1090#1080#1085#1089#1082#1080#1077' '#1073#1091#1082#1074#1099
      Checked = True
      OnExecute = actHighlightLatExecute
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
    inherited btnView: TdxBarSubItem
      ItemLinks = <
        item
          Item = btnAutoPreview
          Visible = True
        end
        item
          BeginGroup = True
          Item = miHighlightLat
          Visible = True
        end
        item
          BeginGroup = True
          Item = btnViewToolBar
          Visible = True
        end
        item
          Item = btnViewStatusBar
          Visible = True
        end
        item
          BeginGroup = True
          Item = miResetLayout
          Visible = True
        end>
    end
    object miHighlightLat: TdxBarButton
      Action = actHighlightLat
      Category = 0
      Hint = #1042#1099#1076#1077#1083#1103#1090#1100' '#1083#1072#1090#1080#1085#1089#1082#1080#1077' '#1073#1091#1082#1074#1099
      ButtonStyle = bsChecked
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Person_Lst'
      'where rownum <= :MaxRecordCount'
      '')
    SourceServerObject = 'FDC_PERSON_LST'
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 1500
    end
    object dsDataFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 1500
    end
    object dsDataMIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 1500
    end
    object dsDataOGRN: TStringField
      FieldName = 'OGRN'
      Size = 1500
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 1500
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 1500
    end
    object dsDataOKPO: TStringField
      FieldName = 'OKPO'
      Size = 1500
    end
    object dsDataBIC: TStringField
      FieldName = 'BIC'
      Size = 1500
    end
    object dsDataBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object dsDataBIRTHYEAR: TIntegerField
      FieldName = 'BIRTHYEAR'
    end
    object dsDataBIRTHLOCATION: TStringField
      FieldName = 'BIRTHLOCATION'
      Size = 1500
    end
    object dsDataOPF_DICT_ID: TFloatField
      FieldName = 'OPF_DICT_ID'
    end
    object dsDataOPF_NAME: TStringField
      FieldName = 'OPF_NAME'
      Size = 4000
    end
  end
end
