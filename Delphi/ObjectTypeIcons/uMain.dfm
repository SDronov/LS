object frmMain: TfrmMain
  Left = 237
  Top = 194
  Width = 882
  Height = 667
  Caption = #1055#1080#1082#1090#1086#1075#1088#1072#1084#1084#1099' '#1090#1080#1087#1086#1074' '#1086#1073#1098#1077#1082#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBTreeList1: TcxDBTreeList
    Left = 0
    Top = 0
    Width = 250
    Height = 640
    Align = alLeft
    Bands = <
      item
      end>
    BufferedPaint = False
    DataController.DataSource = dsetTypes
    DataController.ParentField = 'PARENT_OBJECT_TYPE_ID'
    DataController.KeyField = 'ID'
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    RootValue = 1
    TabOrder = 0
    object cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.Text = #1048#1084#1103
      DataBinding.FieldName = 'NAME'
      Width = 150
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
    end
    object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
      Caption.Text = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
      DataBinding.FieldName = 'SYSNAME'
      Width = 120
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 250
    Top = 0
    Width = 8
    Height = 640
    HotZoneClassName = 'TcxSimpleStyle'
    Control = cxDBTreeList1
  end
  object pcMain: TcxPageControl
    Left = 258
    Top = 0
    Width = 616
    Height = 640
    ActivePage = tabImage
    Align = alClient
    TabOrder = 2
    TabPosition = tpBottom
    ClientRectBottom = 616
    ClientRectRight = 616
    ClientRectTop = 0
    object tabImage: TcxTabSheet
      Caption = #1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
      ImageIndex = 0
      PopupMenu = PopupMenu1
      OnResize = tabImageResize
      object imgIcon: TcxImage
        Left = 300
        Top = 300
        AutoSize = True
        Picture.Data = {
          07544269746D617036050000424D360500000000000036040000280000001000
          000010000000010008000000000000010000220B0000220B0000000100000001
          00000073A500007BAD00087BAD001084AD001884AD000884B5001084B5001884
          B500218CB500088CBD00108CBD00298CBD002194BD002994BD00219CC60018A5
          CE0031A5CE0039ADCE0042ADCE005AB5D60063B5D60042BDDE0084CEDE0029BD
          E7004AC6E70052C6E7005ACEEF0063D6EF0073D6EF007BDEEF0063DEF70073DE
          F70073E7F7009CE7F700CEEFF700FF00FF0010D6FF0018D6FF0021D6FF0029D6
          FF0029DEFF0031DEFF004ADEFF005ADEFF0063DEFF004AE7FF0052E7FF005AE7
          FF0063E7FF0073E7FF0063EFFF006BEFFF0073EFFF008CEFFF007BF7FF008CF7
          FF0094F7FF009CF7FF00ADF7FF00B5F7FF00BDF7FF00C6F7FF00A5FFFF00CEFF
          FF00DEFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF002323230C0223232323232305062323232323041C1802232323230E210F04
          2323232323123619022323103B2B12232323232323041E331B06113D331E0023
          232323232323042E311F3B392F04232323232323232323042A31353904232323
          2323232323020426272A31381D040423232323000D1C302925292B3139351515
          00230816403F38332925292F363E3E1E16000000000000001C27251700000000
          00002323232323230030270923232323232323232323232300352A0623232323
          2323232323232323003A1A02232323232323232323232323003C130023232323
          232323232323232300221400232323232323232323232323230B042323232323
          2323}
        PopupMenu = PopupMenu1
        Properties.GraphicTransparency = gtTransparent
        TabOrder = 0
      end
    end
    object tapText: TcxTabSheet
      Caption = #1058#1077#1082#1090
      ImageIndex = 1
      object cxDBMemo1: TcxDBMemo
        Left = 0
        Top = 0
        Align = alClient
        DataBinding.DataField = 'ICON'
        DataBinding.DataSource = dsetTypes
        ParentFont = False
        Properties.ScrollBars = ssVertical
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 616
        Width = 616
      end
    end
    object tabScript: TcxTabSheet
      Caption = #1057#1082#1088#1080#1087#1090
      ImageIndex = 2
      object cxDBMemo2: TcxDBMemo
        Left = 0
        Top = 0
        Align = alClient
        DataBinding.DataField = 'FMT_ICON'
        DataBinding.DataSource = dsetTypes
        ParentFont = False
        Properties.ScrollBars = ssVertical
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Courier New'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Height = 616
        Width = 616
      end
    end
  end
  object OracleSession: TOracleSession
    Cursor = crSQLWait
    DesignConnection = True
    LogonUsername = 'DOXOD_LS_00014'
    LogonPassword = 'w'
    LogonDatabase = 'LS'
    Left = 184
    Top = 80
  end
  object OracleLogon: TOracleLogon
    Session = OracleSession
    Options = [ldAuto, ldDatabase, ldDatabaseList]
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
    Left = 256
    Top = 80
  end
  object dsTypes: TOracleDataSet
    SQL.Strings = (
      'SELECT id, parent_object_type_id, name, sysname, icon, rowid'
      '  FROM fdc_object_type'
      '  ORDER BY parent_object_type_id')
    QBEDefinition.QBEFieldDefs = {
      0400000005000000020000004944010000000000040000004E414D4501000000
      0000070000005359534E414D450100000000000400000049434F4E0100000000
      0015000000504152454E545F4F424A4543545F545950455F4944010000000000}
    Cursor = crSQLWait
    Session = OracleSession
    AfterOpen = dsTypesAfterOpen
    AfterScroll = dsTypesAfterScroll
    OnCalcFields = dsTypesCalcFields
    Left = 232
    Top = 160
    object dsTypesID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsTypesNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 1500
    end
    object dsTypesSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Required = True
      Size = 1500
    end
    object dsTypesICON: TStringField
      FieldName = 'ICON'
      Size = 4000
    end
    object dsTypesPARENT_OBJECT_TYPE_ID: TFloatField
      FieldName = 'PARENT_OBJECT_TYPE_ID'
    end
    object dsTypesFMT_ICON: TStringField
      FieldKind = fkCalculated
      FieldName = 'FMT_ICON'
      Size = 6000
      Calculated = True
    end
  end
  object dsetTypes: TDataSource
    DataSet = dsTypes
    Left = 232
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 386
    Top = 152
    object itemLoadFromFile: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      OnClick = itemLoadFromFileClick
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Title = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    Left = 514
    Top = 152
  end
end
