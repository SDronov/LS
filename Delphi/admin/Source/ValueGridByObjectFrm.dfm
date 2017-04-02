inherited ValueGridByObjectForm: TValueGridByObjectForm
  Left = 396
  Top = 163
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081
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
          inherited grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          inherited grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Position.ColIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 205
            Position.ColIndex = 1
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewREFTYPENAME: TcxGridDBBandedColumn
            Caption = #1057#1089#1099#1083#1082#1072
            DataBinding.FieldName = 'REFTYPENAME'
            Visible = False
            Hidden = True
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLINKVALUE: TcxGridDBBandedColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'STRINGVALUE'
            Width = 302
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUMVALUE: TcxGridDBBandedColumn
            Caption = #1063#1080#1089#1083#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'NUMVALUE'
            Visible = False
            Hidden = True
            Width = 212
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATETIMEVALUE: TcxGridDBBandedColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1076#1072#1090#1099' '#1080' '#1074#1088#1077#1084#1077#1085#1080
            DataBinding.FieldName = 'DATETIMEVALUE'
            Visible = False
            Hidden = True
            Width = 167
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actAddFile: TAction
      Category = 'File'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      Enabled = False
      Visible = False
      OnExecute = actAddFileExecute
    end
    object actOpenFile: TAction
      Category = 'File'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      Enabled = False
      Visible = False
      OnExecute = actOpenFileExecute
    end
    object actSaveEditFile: TAction
      Category = 'File'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Enabled = False
      Visible = False
      OnExecute = actSaveEditFileExecute
    end
    object actSaveDisk: TAction
      Category = 'File'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1085#1072' '#1076#1080#1089#1082
      Enabled = False
      Visible = False
      OnExecute = actSaveDiskExecute
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
    object btnFiles: TdxBarSubItem
      Caption = #1060#1072#1081#1083#1099
      Category = 0
      Enabled = False
      Visible = ivNever
      ItemLinks = <
        item
          Item = btnAddFile
          Visible = True
        end
        item
          Item = btnOpenFile
          Visible = True
        end
        item
          Item = btnSaveFile
          Visible = True
        end
        item
          Item = dxBarButton1
          Visible = True
        end>
    end
    object btnAddFile: TdxBarButton
      Action = actAddFile
      Category = 0
    end
    object btnOpenFile: TdxBarButton
      Action = actOpenFile
      Category = 0
    end
    object btnSaveFile: TdxBarButton
      Action = actSaveEditFile
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    end
    object dxBarButton1: TdxBarButton
      Action = actSaveDisk
      Category = 0
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1085#1072' '#1076#1080#1089#1082
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataOWNER_OBJECT_ID
        SourceParamName = 'ID'
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataOWNERNAME
        SourceParamName = 'Name'
      end>
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select v.*'
      '  from fdc_Value_Lst v'
      'where v.Owner_Object_ID = :ID and'
      '          (:Name is null or upper(NAME) like upper(:Name))'
      '')
    SourceServerObject = 'FDC_VALUE_LST'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataSTRINGVALUE: TStringField
      FieldName = 'STRINGVALUE'
      Size = 1500
    end
    object dsDataNUMVALUE: TFloatField
      FieldName = 'NUMVALUE'
    end
    object dsDataDATETIMEVALUE: TDateTimeField
      FieldName = 'DATETIMEVALUE'
    end
    object dsDataREF_OBJECT_ID: TFloatField
      FieldName = 'REF_OBJECT_ID'
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataOWNERTYPENAME: TStringField
      FieldName = 'OWNERTYPENAME'
      Size = 1500
    end
    object dsDataOWNERTYPESYSNAME: TStringField
      FieldName = 'OWNERTYPESYSNAME'
      Size = 1500
    end
    object dsDataREFNAME: TStringField
      FieldName = 'REFNAME'
      Size = 1500
    end
    object dsDataREFTYPENAME: TStringField
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
    object dsDataFILESOURCENAME: TStringField
      FieldName = 'FILESOURCENAME'
      Size = 1500
    end
  end
  inherited pmnGridDataDBBandedTableView: TdxBarPopupMenu
    ItemLinks = <
      item
        Item = btnSearchOk
        Visible = True
      end
      item
        Item = btnSearchCancel
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnAdd
        Visible = True
      end
      item
        Item = btnOpen
        Visible = True
      end
      item
        Item = btnRefresh
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnFiles
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnView
        Visible = True
      end
      item
        Item = btnFilter
        Visible = True
      end
      item
        Item = btnSwitchSearchCriteria
        Visible = True
      end
      item
        Item = btnCopySelection
        Visible = True
      end
      item
        Item = btnCopyAll
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnDelete
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnSaveToFile
        Visible = True
      end>
  end
  object dsAddFile: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      
        '   :ID ::= fdc_ValueRefFile_Add_ByName(:Name, :Object_ID, :FileN' +
        'ame);'
      'end;')
    Left = 273
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Object_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FileName'
        ParamType = ptUnknown
      end>
  end
  object dlgOpenFile: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 212
    Top = 144
  end
  object dlgSaveFile: TSaveDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 244
    Top = 144
  end
end
