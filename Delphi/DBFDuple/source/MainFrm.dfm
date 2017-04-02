object MainForm: TMainForm
  Left = 235
  Top = 142
  Width = 996
  Height = 681
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1076#1091#1073#1083#1077#1081' '#1074' DBF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 106
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 988
    Height = 638
    Align = alClient
    TabOrder = 0
    AutoContentSizes = [acsWidth, acsHeight]
    object edtMemo: TcxMemo
      Left = 10
      Top = 10
      Align = alClient
      ParentFont = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.StyleController = styleMain
      TabOrder = 0
      Height = 527
      Width = 968
    end
    object btnClose: TcxButton
      Left = 897
      Top = 604
      Width = 81
      Height = 24
      Action = actClose
      Default = True
      ModalResult = 2
      TabOrder = 6
      LookAndFeel.Kind = lfOffice11
    end
    object btnFile: TcxButton
      Left = 97
      Top = 604
      Width = 81
      Height = 24
      Action = actFile
      ModalResult = 1
      TabOrder = 4
      LookAndFeel.Kind = lfOffice11
    end
    object barFile: TcxProgressBar
      Left = 10
      Top = 570
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      TabOrder = 2
      Width = 98
    end
    object barDir: TcxProgressBar
      Left = 10
      Top = 543
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      TabOrder = 1
      Width = 98
    end
    object btnDir: TcxButton
      Left = 10
      Top = 604
      Width = 81
      Height = 24
      Action = actDir
      TabOrder = 3
      LookAndFeel.Kind = lfOffice11
    end
    object btnStop: TcxButton
      Left = 816
      Top = 604
      Width = 75
      Height = 24
      Action = actStop
      TabOrder = 5
      LookAndFeel.Kind = lfOffice11
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      ShowCaption = False
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Item2: TdxLayoutItem
        Control = edtMemo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item6: TdxLayoutItem
        Control = barDir
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem
        Control = barFile
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Group1: TdxLayoutGroup
        AutoAligns = []
        AlignHorz = ahClient
        AlignVert = avBottom
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item8: TdxLayoutItem
          Caption = 'cxButton1'
          ShowCaption = False
          Control = btnDir
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item3: TdxLayoutItem
          Caption = 'cxButton1'
          ShowCaption = False
          Control = btnFile
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item1: TdxLayoutItem
          AutoAligns = [aaVertical]
          AlignHorz = ahRight
          Caption = 'cxButton2'
          ShowCaption = False
          Control = btnStop
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item4: TdxLayoutItem
          AutoAligns = []
          AlignHorz = ahRight
          AlignVert = avBottom
          Caption = 'cxButton2'
          ShowCaption = False
          Control = btnClose
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = 'dbf'
    Filter = 'DBF - '#1092#1072#1081#1083#1099'|*.dbf'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #1054#1090#1082#1088#1099#1090#1100
    Left = 24
    Top = 376
  end
  object dsDBF: TVKDBFNTX
    SetDeleted = False
    FastPostRecord = False
    LookupOptions = []
    TrimInLocate = False
    TrimCType = False
    StorageType = pstFile
    AccessMode.AccessMode = 16
    AccessMode.OpenRead = True
    AccessMode.OpenWrite = False
    AccessMode.OpenReadWrite = False
    AccessMode.ShareExclusive = True
    AccessMode.ShareDenyWrite = False
    AccessMode.ShareDenyNone = False
    Crypt.Active = False
    Crypt.CryptMethod = cmNone
    BufferSize = 4096
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
    Left = 64
    Top = 376
  end
  object actlMain: TActionList
    Left = 104
    Top = 376
    object actFile: TAction
      Caption = #1060#1072#1081#1083
      OnExecute = actFileExecute
      OnUpdate = actWorkDisabled
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = actCloseExecute
      OnUpdate = actWorkDisabled
    end
    object actDir: TAction
      Caption = #1050#1072#1090#1072#1083#1086#1075
      OnExecute = actDirExecute
      OnUpdate = actWorkDisabled
    end
    object actStop: TAction
      Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
      OnExecute = actStopExecute
      OnUpdate = actWorkEnabled
    end
  end
  object evtApp: TApplicationEvents
    OnException = evtAppException
    Left = 144
    Top = 376
  end
  object styleMain: TcxEditStyleController
    Style.BorderStyle = ebsOffice11
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.ButtonStyle = btsOffice11
    Style.IsFontAssigned = True
    Left = 184
    Top = 376
  end
end
