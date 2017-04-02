object MainForm: TMainForm
  Left = 247
  Top = 237
  Width = 870
  Height = 548
  Caption = 
    #1048#1056#1057' "'#1044#1086#1093#1086#1076'" - '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1090#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1103' '#1084#1086#1076#1091#1083#1103' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103' '#1040#1048#1057' "' +
    #1040#1048#1057#1058'-'#1052'" '#1080' '#1050#1055#1057' "'#1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072'-'#1058'"'
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
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 854
    Height = 510
    Align = alClient
    TabOrder = 0
    AutoContentSizes = [acsWidth, acsHeight]
    LookAndFeel = dxLayoutWebLookAndFeel1
    object cbDir: TcxShellComboBox
      Left = 113
      Top = 11
      Properties.ShowFullPath = sfpAlways
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      TabOrder = 0
      Width = 121
    end
    object cbKey: TcxComboBox
      Left = 113
      Top = 38
      Properties.Items.Strings = (
        'R'
        'T'
        'E1'
        'E'
        'O'
        'V'
        'S')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      TabOrder = 1
      Text = 'E'
      Width = 121
    end
    object btnExec: TcxButton
      Left = 11
      Top = 92
      Width = 75
      Height = 25
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      TabOrder = 4
      OnClick = btnExecClick
    end
    object memLog: TcxMemo
      Left = 11
      Top = 369
      ParentFont = False
      Properties.ScrollBars = ssVertical
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Courier New'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 7
      Height = 89
      Width = 185
    end
    object cxGrid1: TcxGrid
      Left = 11
      Top = 141
      Width = 832
      Height = 100
      TabOrder = 5
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsOtvet
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object meIP: TcxMaskEdit
      Left = 113
      Top = 65
      Properties.EditMask = '999.999.999.999;1;_'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      TabOrder = 2
      Text = '172.19 .1  .39 '
      Width = 121
    end
    object sePort: TcxSpinEdit
      Left = 722
      Top = 65
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.HotTrack = False
      Style.ButtonStyle = btsHotFlat
      TabOrder = 3
      Value = 211
      Width = 121
    end
    object cxGrid2: TcxGrid
      Left = 11
      Top = 247
      Width = 832
      Height = 98
      TabOrder = 6
      object cxGridDBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsDK_PP
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridDBTableView1
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Item1: TdxLayoutItem
        Caption = #1050#1072#1090#1072#1083#1086#1075' '#1089' '#1044#1058' '#1080' '#1044#1050
        Control = cbDir
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem
        Caption = #1047#1072#1087#1088#1086#1089
        Control = cbKey
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Group1: TdxLayoutGroup
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item6: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahClient
          Caption = 'IP'
          Control = meIP
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item7: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahRight
          Caption = #1055#1086#1088#1090
          Control = sePort
          ControlOptions.ShowBorder = False
        end
      end
      object dxLayoutControl1Item3: TdxLayoutItem
        Caption = 'cxButton1'
        ShowCaption = False
        Control = btnExec
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        CaptionOptions.Layout = clTop
        Control = cxGrid1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item8: TdxLayoutItem
        Control = cxGrid2
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = #1046#1091#1088#1085#1072#1083
        CaptionOptions.Layout = clTop
        Control = memLog
        ControlOptions.ShowBorder = False
      end
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 360
    Top = 144
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
    end
  end
  object dsOtvet: TDataSource
    DataSet = dsetOtvet
    Left = 128
    Top = 208
  end
  object dsetOtvet: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstOuterStream
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 40960
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 80
    Top = 208
  end
  object Zip: TZip
    RelativeDir = byItem
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    RecurseDirs = False
    ArcType = atZip
    AttributesEx = []
    CompressMethod = cmDeflate
    DefaultExt = '.zip'
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    StoreFilesOfType.Strings = (
      '.ACE'
      '.ARC'
      '.ARJ'
      '.BH'
      '.CAB'
      '.ENC'
      '.GZ'
      '.HA'
      '.JAR'
      '.LHA'
      '.LZH'
      '.PAK'
      '.PK3'
      '.PK_'
      '.RAR'
      '.TAR'
      '.TGZ'
      '.UUE'
      '.UU'
      '.WAR'
      '.XXE'
      '.Z'
      '.ZIP'
      '.ZOO')
    StoredDirNames = sdNone
    TempDir = 'C:\DOCUME~1\user\LOCALS~1\Temp\'
    Switch = swAdd
    Left = 224
    Top = 152
  end
  object UnZip: TUnZip
    TranslateOemChar = False
    CpuType = cptAuto
    SeedDataKeys.Key0 = 305419896
    SeedDataKeys.Key1 = 591751049
    SeedDataKeys.Key2 = 878082192
    SeedHeaderKeys.Key0 = 269766672
    SeedHeaderKeys.Key1 = 33834504
    SeedHeaderKeys.Key2 = 541352064
    Left = 272
    Top = 152
  end
  object dsDK_PP: TDataSource
    DataSet = dsetDK
    Left = 296
    Top = 208
  end
  object dsetDK: TVKDBFNTX
    OEM = True
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstOuterStream
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 40960
    WaitBusyRes = 3000
    CreateNow = False
    DbfVersion = xBaseIII
    LobBlockSize = 512
    LockProtocol = lpClipperLock
    LobLockProtocol = lpClipperLock
    FoxTableFlag.TableFlag = 0
    FoxTableFlag.HasGotIndex = False
    FoxTableFlag.HasGotMemo = False
    FoxTableFlag.ItIsDatabase = False
    Left = 248
    Top = 208
  end
end
