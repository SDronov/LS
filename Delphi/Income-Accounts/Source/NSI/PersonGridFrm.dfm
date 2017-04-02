inherited PersonGridForm: TPersonGridForm
  Left = 330
  Top = 213
  Width = 807
  Height = 490
  HelpContext = 323
  Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' '#1087#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1080', '#1092#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 427
    Width = 791
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 488
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 488
      end
      inherited pnlProgress: TPanel
        Width = 488
        inherited lblProgress: TcxLabel
          Width = 488
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 698
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 424
    Width = 791
  end
  inherited pnlWorkspace: TPanel
    Width = 791
    Height = 396
    inherited splSearchCriteria: TSplitter
      Height = 396
    end
    inherited pnlSearchCriteria: TPanel
      Height = 396
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 376
        inherited btnSearch: TcxButton
          Top = 345
          TabOrder = 7
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Top = 147
          TabOrder = 3
          Width = 122
        end
        inherited edtOKPO: TcxTextEdit
          Top = 213
          TabOrder = 5
          Width = 122
        end
        object cbPrivateOwner: TcxCheckBox [4]
          Left = 9
          Top = 171
          Caption = '  '#1048#1055
          ParentColor = False
          ParentFont = False
          Properties.AllowGrayed = True
          Properties.ImmediatePost = True
          Properties.ValueChecked = 'Y'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'N'
          State = cbsGrayed
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 48
        end
        object edtFirstName: TcxTextEdit [5]
          Left = 9
          Top = 63
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Width = 121
        end
        object edtMiddleName: TcxTextEdit [6]
          Left = 9
          Top = 105
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        inherited btnSearchClear: TcxButton
          Top = 316
          TabOrder = 6
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1060#1072#1084#1080#1083#1080#1103':'
          end
          object lciFirstName: TdxLayoutItem [1]
            Caption = #1048#1084#1103':'
            CaptionOptions.Layout = clTop
            Control = edtFirstName
            ControlOptions.ShowBorder = False
          end
          object lciMiddleName: TdxLayoutItem [2]
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
            CaptionOptions.Layout = clTop
            Control = edtMiddleName
            ControlOptions.ShowBorder = False
          end
          object lciPrivateOwner: TdxLayoutItem [4]
            AutoAligns = [aaVertical]
            Caption = 'cxCheckBox1'
            ShowCaption = False
            Control = cbPrivateOwner
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 586
      Height = 396
      inherited grdData: TcxGrid
        Width = 586
        Height = 396
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn
            Width = 200
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            Position.ColIndex = 11
          end
          object grdDataDBBandedTableViewLastName: TcxGridDBBandedColumn
            Caption = #1060#1072#1084#1080#1083#1080#1103
            DataBinding.FieldName = 'LAST_NAME'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFirstName: TcxGridDBBandedColumn
            Caption = #1048#1084#1103
            DataBinding.FieldName = 'FIRST_NAME'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewMiddleName: TcxGridDBBandedColumn
            Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            DataBinding.FieldName = 'MIDDLE_NAME'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCountryCode: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1089#1090#1088#1072#1085#1099
            DataBinding.FieldName = 'COUNTRY_CODE'
            Width = 67
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDoc_Type: TcxGridDBBandedColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'DOC_TYPE'
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSer_No: TcxGridDBBandedColumn
            Caption = #1057#1077#1088#1080#1103
            DataBinding.FieldName = 'SER_NO'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDoc_No: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088
            DataBinding.FieldName = 'DOC_NO'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIssued_By: TcxGridDBBandedColumn
            Caption = #1042#1099#1076#1072#1085
            DataBinding.FieldName = 'ISSUED_BY'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIsSued_Date: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
            DataBinding.FieldName = 'ISSUED_DATE'
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPRIVATE_OWNER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PRIVATE_OWNER'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = True
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 38
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 304
    Top = 79
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 332
    Top = 79
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 444
    Top = 79
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 472
    Top = 79
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 388
    Top = 79
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 416
    Top = 79
  end
  inherited imglAction: TImageList
    Left = 388
    Top = 107
  end
  inherited imglLarge: TImageList
    Left = 416
    Top = 107
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
    Left = 360
    Top = 79
    DockControlHeights = (
      0
      0
      28
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    Left = 304
    Top = 107
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Person_Lst t'
      ' where rownum <= :MaxRecordCount'
      '/*$p#name#*/ and UPPER(last_name) like upper(:Name)'
      
        '/*$p#first_name#*/ and UPPER(t.first_name) LIKE UPPER(:first_nam' +
        'e)'
      
        '/*$p#middle_name#*/ and UPPER(t.middle_name) LIKE UPPER(:middle_' +
        'name)'
      '/*$p#inn#*/ and t.INN like :INN'
      '/*$p#private_owner#*/ and t.private_owner = :private_owner')
    SourceServerObject = 'FDC_PERSON_LST'
    Left = 332
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'first_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'middle_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'private_owner'
        ParamType = ptUnknown
      end>
    object dsDataLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object dsDataFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object dsDataMIDDLE_NAME: TStringField
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
    object dsDataDOC_TYPE: TStringField
      FieldName = 'DOC_TYPE'
      Size = 3
    end
    object dsDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 30
    end
    object dsDataSER_NO: TStringField
      FieldName = 'SER_NO'
      Size = 30
    end
    object dsDataCOUNTRY_CODE: TStringField
      FieldName = 'COUNTRY_CODE'
      Size = 3
    end
    object dsDataISSUED_BY: TStringField
      FieldName = 'ISSUED_BY'
      Size = 100
    end
    object dsDataISSUED_DATE: TDateTimeField
      FieldName = 'ISSUED_DATE'
    end
    object dsDataPRIVATE_OWNER: TStringField
      DisplayLabel = #1048#1055
      FieldName = 'PRIVATE_OWNER'
      Size = 1
    end
  end
  inherited srcData: TDataSource
    Left = 332
    Top = 135
  end
  inherited dlgExportData: TSaveDialog
    Left = 360
    Top = 107
  end
  inherited GridPopupMenu: TcxGridPopupMenu
    Left = 472
    Top = 107
  end
  inherited pmnGridDataDBBandedTableView: TdxBarPopupMenu
    Left = 444
    Top = 107
  end
end
