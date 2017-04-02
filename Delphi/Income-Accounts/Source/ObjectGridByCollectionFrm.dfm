inherited ObjectGridByCollectionForm: TObjectGridByCollectionForm
  Left = 365
  Top = 285
  Caption = #1054#1073#1098#1077#1082#1090#1099' '#1074' '#1087#1086#1076#1073#1086#1088#1082#1077
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
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnDragDrop = grdDataDBBandedTableViewDragDrop
          OnDragOver = grdDataDBBandedTableViewDragOver
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 196
          end
          object grdDataDBBandedTableViewROLENAME: TcxGridDBBandedColumn
            Caption = #1056#1086#1083#1100
            DataBinding.FieldName = 'ROLENAME'
            Width = 170
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actAddFile: TAction
      Category = 'File'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083#1099
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
      Visible = ivAlways
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
          Item = btnSaveEditFile
          Visible = True
        end
        item
          Item = btnSaveDisk
          Visible = True
        end>
    end
    object btnAddFile: TdxBarButton
      Action = actAddFile
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083#1099
    end
    object btnSaveEditFile: TdxBarButton
      Action = actSaveEditFile
      Category = 0
    end
    object btnOpenFile: TdxBarButton
      Action = actOpenFile
      Category = 0
    end
    object btnSaveDisk: TdxBarButton
      Action = actSaveDisk
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Collection_Object_Lst'
      ' where Collection_ID = :ID and'
      '          (:Name is null or upper(NAME) like upper(:Name))')
    SourceServerObject = 'FDC_COLLECTION_OBJECT_LST'
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
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
    object dsDataCOLLECTION_OBJECT_ID: TFloatField
      FieldName = 'COLLECTION_OBJECT_ID'
    end
    object dsDataCOLLECTION_ID: TFloatField
      FieldName = 'COLLECTION_ID'
    end
    object dsDataOBJECT_ID: TFloatField
      FieldName = 'OBJECT_ID'
    end
    object dsDataROLENAME: TStringField
      FieldName = 'ROLENAME'
      Size = 1500
    end
    object dsDataCODESCRIPT: TStringField
      FieldName = 'CODESCRIPT'
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
  object dlgSaveFile: TSaveDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 244
    Top = 136
  end
  object dlgOpenFile: TOpenDialog
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 212
    Top = 136
  end
  object dsAddFile: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      
        '   :ID ::= fdc_Collection_Object_AddFile(:Collection_ID, :FileNa' +
        'me, :RoleName, :Descript);'
      'end;')
    Left = 177
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftUnknown
        Name = 'Collection_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FileName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RoleName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Descript'
        ParamType = ptUnknown
      end>
  end
end
