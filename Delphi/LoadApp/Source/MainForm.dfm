object MainMDIForm: TMainMDIForm
  Left = 364
  Top = 301
  Width = 659
  Height = 460
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1085#1072#1095#1072#1083#1100#1085#1099#1093' '#1086#1089#1090#1072#1090#1082#1086#1074
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LeftDockSite: TdxDockSite
    Left = 213
    Top = 26
    Width = 0
    Height = 382
    Align = alLeft
    AutoSize = True
    DockType = 0
    OriginalWidth = 0
    OriginalHeight = 382
  end
  object barNavigator: TdxNavBar
    Left = 0
    Top = 26
    Width = 205
    Height = 382
    Align = alLeft
    ActiveGroupIndex = 0
    DragCopyCursor = -1119
    DragCursor = -1120
    DragDropFlags = []
    HotTrackedGroupCursor = crDefault
    HotTrackedLinkCursor = -1118
    View = 11
    object bngPO: TdxNavBarGroup
      Caption = #1055#1055
      LinksUseSmallImages = True
      SelectedLinkIndex = -1
      ShowAsIconView = False
      ShowControl = False
      TopVisibleLinkIndex = 0
      UseControl = False
      UseSmallImages = True
      Visible = True
      Links = <
        item
          Item = bniDocPackpays
        end
        item
          Item = bniShowRestUFK
        end
        item
          Item = bniShowRestCustoms
        end>
    end
    object bngErrors: TdxNavBarGroup
      Caption = #1054#1096#1080#1073#1082#1080
      LinksUseSmallImages = True
      SelectedLinkIndex = -1
      ShowAsIconView = False
      ShowControl = False
      TopVisibleLinkIndex = 0
      UseControl = False
      UseSmallImages = True
      Visible = True
      Links = <
        item
          Item = bniShowErrors
        end>
    end
    object bniDocPackpays: TdxNavBarItem
      Caption = #1042#1099#1087#1080#1089#1082#1072
      Enabled = True
      LargeImageIndex = -1
      SmallImageIndex = -1
      Visible = True
      OnClick = bniDocPackpaysClick
    end
    object bniShowRestUFK: TdxNavBarItem
      Caption = #1055#1055' '#1080#1079' '#1059#1060#1050
      Enabled = True
      LargeImageIndex = -1
      SmallImageIndex = -1
      Visible = True
      OnClick = bniShowRestUFKClick
    end
    object bniShowRestCustoms: TdxNavBarItem
      Caption = #1055#1055' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084
      Enabled = True
      LargeImageIndex = -1
      SmallImageIndex = -1
      Visible = True
      OnClick = bniShowRestCustomsClick
    end
    object bniShowErrors: TdxNavBarItem
      Action = actShowErrors
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 205
    Top = 26
    Width = 8
    Height = 382
    HotZoneClassName = 'TcxXPTaskBarStyle'
    PositionAfterOpen = 130
    Control = barNavigator
    Color = clMenuBar
    ShowHint = False
    ParentColor = False
    ParentShowHint = False
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 408
    Width = 651
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer0
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer3
        Width = 20
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'CAPS'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'CAPS'
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'OVR'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 496
      Height = 21
      object lblHint: TcxLabel
        Left = 0
        Top = 0
        Align = alClient
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsNone
        Style.TransparentBorder = False
        Transparent = True
      end
    end
    object StatusBarContainer3: TdxStatusBarContainerControl
      Left = 499
      Top = 2
      Width = 22
      Height = 21
      object imgUser: TImage
        Left = 0
        Top = 0
        Width = 22
        Height = 21
        Align = alClient
        Center = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          0000100000000100180000000000000300000000000000000000000000000000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA07B
          4293713D8768387D60347358306A512C8C6B3A826436FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFB39363B08F5DECB96DEAB463E0AB5CD09F55C1944FB18748
          A17B4294713C8F6D3AFF00FFFF00FFFF00FFFF00FFFF00FFBA9E72EFC484EEC2
          7FEDBD76ECB96CA68148FF00FF916F3CBC904DAB8346A27C42FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFBFA57CF0C88CEFC585B49566FF00FFFF00FFA47E44
          D6A458896939FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2A8
          81BEA37ABA9E72489BDEFF00FFAB8853A47F45FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF009BDA0092D44A9EE10080C80079C3
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00AC
          E572BDF563B2EE55A6E7479BE03A91D90079C3FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF1FB6E888CBFB80C8FB72BDF563B1ED54A5E6459ADF
          3A91D90079C3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF319ECE2699
          CB1792C880C8FB72BEF562B1ED53A5E6459ADF007FC7FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF41A6D237A1CF2A9BCC1892C880C8FB71BDF561B0EC
          52A4E50086CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4FACD546A8
          D33AA2D02A9BCC1691C70187C2007FBC0076B60070B1FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF5AB1D853AED649A9D33AA2D0289ACC1390C70086C1
          007EBB0077B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5CB2
          D853AED646A8D335A0CF2297CA0E8EC50085C0FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF59B1D74DABD43FA5D12E9DCD1C94C9
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF}
        ShowHint = True
        Transparent = True
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 188
    Top = 48
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 216
    Top = 48
  end
  object ActionList1: TActionList
    Images = ActionsImages
    Left = 272
    Top = 48
    object actChangeImportDate: TAction
      Caption = 'actChangeImportDate'
      ShortCut = 49220
      OnExecute = actChangeImportDateExecute
    end
    object actClear: TAction
      Category = 'MainToolBar'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1073#1091#1092#1077#1088' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1074#1089#1077' '#1087#1077#1088#1077#1085#1077#1089#1077#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      Visible = False
      OnExecute = actClearExecute
    end
    object actCancel: TAction
      Category = 'MainToolBar'
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093', '#1087#1077#1088#1077#1085#1077#1089#1077#1085#1085#1099#1093' '#1080#1079' '#1073#1091#1092#1077#1088#1072
      Visible = False
      OnExecute = actCancelExecute
    end
    object actExit: TAction
      Category = 'MainToolBar'
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      OnExecute = actExitExecute
    end
    object actExport: TAction
      Category = 'MainToolBar'
      Caption = #1069#1082#1089#1087#1086#1088#1090
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1092#1072#1081#1083
      OnExecute = actExportExecute
    end
    object actImport: TAction
      Category = 'MainToolBar'
      Caption = #1048#1084#1087#1086#1088#1090
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1092#1072#1081#1083#1072
      OnExecute = actImportExecute
    end
    object actShowErrors: TAction
      Caption = #1054#1096#1080#1073#1082#1080' '#1080#1084#1087#1086#1088#1090#1072
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1096#1080#1073#1082#1080', '#1074#1086#1079#1085#1080#1082#1096#1080#1077' '#1087#1088#1080' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1076#1072#1085#1085#1099#1093
      OnExecute = actShowErrorsExecute
    end
    object actMerge: TAction
      Category = 'MainToolBar'
      Caption = #1057#1083#1080#1103#1085#1080#1077
      OnExecute = actMergeExecute
    end
  end
  object ActionsImages: TImageList
    Height = 24
    Width = 24
    Left = 244
    Top = 48
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 300
    Top = 48
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
      GroupOptions.Color = 15790320
      Offsets.ItemOffset = 2
      Offsets.RootItemsAreaOffsetHorz = 3
      Offsets.RootItemsAreaOffsetVert = 5
    end
    object dxLayoutOfficeLookAndFeel1: TdxLayoutOfficeLookAndFeel
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Main Menu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 0
        FloatTop = 0
        FloatClientWidth = 0
        FloatClientHeight = 0
        IsMainMenu = True
        ItemLinks = <
          item
            Item = btnExport
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnImport
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnExit
            Visible = True
          end>
        MultiLine = True
        Name = 'Main Menu'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default'
      'Menus')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    LargeImages = fdcCustomGridForm.imglLarge
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 424
    Top = 56
    DockControlHeights = (
      0
      0
      26
      0)
    object btnClear: TdxBarButton
      Action = actClear
      Category = 1
    end
    object btnExit: TdxBarButton
      Action = actExit
      Category = 1
    end
    object btnCancel: TdxBarButton
      Action = actCancel
      Category = 0
    end
    object btnExport: TdxBarButton
      Action = actExport
      Category = 1
    end
    object btnImport: TdxBarButton
      Action = actImport
      Category = 1
    end
    object dxBarButton1: TdxBarButton
      Action = actMerge
      Category = 0
    end
  end
end
