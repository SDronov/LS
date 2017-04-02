inherited fdcCustomTreeListForm: TfdcCustomTreeListForm
  Caption = #1048#1077#1088#1072#1088#1093#1080#1095#1077#1089#1082#1072#1103' '#1090#1072#1073#1083#1080#1094#1072
  PixelsPerInch = 96
  TextHeight = 13
  object dxBarDockControl1: TdxBarDockControl [0]
    Left = 0
    Top = 291
    Width = 440
    Height = 3
    Align = dalBottom
    BarManager = BarManager
  end
  object StatusBar: TdxStatusBar [1]
    Left = 0
    Top = 294
    Width = 440
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer0
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer1
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer2
        Fixed = False
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = StatusBarContainer3
        Width = 75
      end>
    PaintStyle = stpsUseLookAndFeel
    ParentFont = True
    object StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 18
      object lblRecordCount: TcxLabel
        Left = 0
        Top = 0
        Width = 102
        Height = 18
        Cursor = crIBeam
        Hint = 
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1077'. '#1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077 +
          #1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1077'.'
        Align = alClient
        AutoSize = False
        Caption = 'lblRecordCount'
        ParentColor = False
        ParentShowHint = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Transparent = True
        ShowHint = True
        Style.BorderStyle = ebsNone
      end
      object edtMaxRecordCount: TcxSpinEdit
        Left = 16
        Top = 0
        Width = 81
        Height = 19
        Hint = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1095#1080#1089#1083#1072' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1077
        AutoSize = False
        ParentShowHint = False
        Properties.MaxValue = 1000000.000000000000000000
        Properties.MinValue = 1.000000000000000000
        ShowHint = True
        Style.StyleController = OfficeEditStyleController
        TabOrder = 1
        Value = 500
        Visible = False
      end
    end
    object StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 2
      Width = 102
      Height = 18
      object lblQueryTime: TcxLabel
        Left = 0
        Top = 0
        Width = 102
        Height = 18
        Hint = #1042#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1095#1090#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
        Align = alClient
        AutoSize = False
        Caption = 'lblQueryTime'
        ParentColor = False
        ParentShowHint = False
        Properties.Alignment.Vert = taVCenter
        Properties.Transparent = True
        ShowHint = True
        Style.BorderStyle = ebsNone
      end
    end
    object StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Top = 2
      Width = 134
      Height = 18
      object pnlMaxRecordCoundExceeded: TPanel
        Left = 0
        Top = 0
        Width = 134
        Height = 18
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = True
        ParentColor = True
        TabOrder = 0
        Visible = False
        object imgMaxRecordCoundExceeded: TImage
          Left = 0
          Top = 0
          Width = 16
          Height = 18
          Cursor = crHandPoint
          Hint = 
            #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1088#1077#1079#1091#1083#1100#1090#1072 +
            #1090#1077
          Align = alLeft
          AutoSize = True
          Center = True
          ParentShowHint = False
          Picture.Data = {
            07544269746D617036050000424D360500000000000036040000280000001000
            000010000000010008000000000000010000F30E0000F30E0000000100000001
            0000080000003110180018394A001042420010424A000842520008525200086B
            7300396B7B00FF00FF0018A5C6004AC6E70073DEF7009CDEEF0094F7FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000090909090909090909090909090909090909090909090909090909090909
            090909090A0A0A0A0A0A0A0A0A0A0A0A0909090D0E0C0C0C0C04030C0C0C0C0B
            0A0909090E0C0C0C0C05020C0C0C0C0A090909090D0E0C0C0C0C0C0C0C0C0B0A
            09090909090E0C0C0C0C0C0C0C0C0A0909090909090D0E0C0C07080C0C0B0A09
            0909090909090E0C0C07080C0C0A09090909090909090D0E0C04010C0B0A0909
            090909090909090E0C00010C0A090909090909090909090D0E06030B0A090909
            09090909090909090E0C0C0A0909090909090909090909090D0E0B0A09090909
            0909090909090909090E0A090909090909090909090909090909090909090909
            0909}
          ShowHint = True
          Transparent = True
        end
        object lblMaxRecordCoundExceeded: TcxLabel
          Left = 16
          Top = 0
          Width = 118
          Height = 18
          Cursor = crHandPoint
          Hint = 
            #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1079#1072#1087#1080#1089#1077#1081' '#1074' '#1088#1077#1079#1091#1083#1100#1090#1072 +
            #1090#1077
          Align = alClient
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1072#1087#1080#1089#1077#1081' '#1087#1088#1077#1074#1099#1089#1080#1083#1086' '#1079#1072#1076#1072#1085#1085#1086#1077' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
          ParentColor = False
          ParentShowHint = False
          Properties.Alignment.Vert = taVCenter
          Properties.Transparent = True
          ShowHint = True
          Style.BorderStyle = ebsNone
        end
      end
      object pnlProgress: TPanel
        Left = 0
        Top = 0
        Width = 134
        Height = 18
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = True
        ParentColor = True
        TabOrder = 1
        Visible = False
        object lblProgress: TcxLabel
          Left = 0
          Top = 0
          Width = 134
          Height = 18
          Align = alClient
          AutoSize = False
          Caption = 'lblProgress'
          ParentColor = False
          Properties.Alignment.Vert = taVCenter
          Properties.Transparent = True
          Style.BorderStyle = ebsNone
        end
      end
    end
    object StatusBarContainer3: TdxStatusBarContainerControl
      Left = 347
      Top = 2
      Width = 77
      Height = 18
      object ProgressBar: TcxProgressBar
        Left = 1
        Top = 0
        Width = 75
        Height = 18
        AutoSize = False
        ParentColor = False
        Properties.BarStyle = cxbsLEDs
        Properties.PeakValue = 70.000000000000000000
        Style.StyleController = OfficeEditStyleController
        TabOrder = 0
        Visible = False
      end
    end
  end
  object pnlWorkspace: TPanel [2]
    Left = 0
    Top = 28
    Width = 440
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 6
    object splSearchCriteria: TSplitter
      Left = 200
      Top = 0
      Width = 5
      Height = 263
      AutoSnap = False
      Color = 15313283
      MinSize = 40
      ParentColor = False
    end
    object pnlSearchCriteria: TPanel
      Left = 0
      Top = 0
      Width = 200
      Height = 263
      Align = alLeft
      BevelOuter = bvNone
      Color = 15313283
      ParentBackground = False
      TabOrder = 0
      object lcSearchCriteria: TdxLayoutControl
        Left = 0
        Top = 20
        Width = 200
        Height = 243
        Align = alClient
        ParentBackground = True
        TabOrder = 0
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebToolLookAndFeel
        object btnSearch: TcxButton
          Left = 116
          Top = 211
          Width = 75
          Height = 23
          TabOrder = 0
        end
        object dxLayoutGroup1: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object lciSearchBtn: TdxLayoutItem
            AutoAligns = []
            AlignHorz = ahRight
            AlignVert = avBottom
            Caption = 'Button1'
            ShowCaption = False
            Control = btnSearch
            ControlOptions.ShowBorder = False
          end
        end
      end
      object pnlSearchCriteriaCaption: TPanel
        Left = 0
        Top = 0
        Width = 200
        Height = 20
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = 15313283
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblSearchCriteriaCaption: TLabel
          Left = 25
          Top = 4
          Width = 34
          Height = 13
          Caption = #1055#1086#1080#1089#1082
        end
        object imgSearchCriteriaCaption: TImage
          Left = 0
          Top = 0
          Width = 24
          Height = 20
          Align = alLeft
          Center = True
          Picture.Data = {
            07544269746D617036040000424D360400000000000036000000280000001000
            0000100000000100200000000000000400000000000000000000000000000000
            0000FF00FF00B5B5B500726F7E00BA939C00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00749BBC00315FB7006A638E00BA939C00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008FCCFF0036A0FE003360B7006A638E00BA939C00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0082C4FF0039A4FE003360B7006A638E00BA939C00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0082C4FF003AA4FE003264BC006A638E00CEB7
            BE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0080C3FF003AA4FE003D73C2009799
            9E00C9A59B00BD876F00BB816800BC836A00C4907A00CAA29800FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009BD0FF00BCC3C900A677
            6800CB967600E7CA9A00F8F0BD00F8F2C700E7D1AB00CEA38A00C2958500FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2AEA500CC93
            7400FFF2B400FFF3B200FFFFCE00FFFFE200FFFFF600FFFFFF00CEA38900C199
            9000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6907900E7C6
            9500FFDD9F00FFF7B600FFFFD100FFFFE600FFFFFA00FFFFF300E7D1AB00BB89
            7200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD826900F8EA
            B400FFD09200FFEEAD00FFFFCA00FFFFDC00FFFFE500FFFFDD00F8F2C400BA81
            6800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD826900F8EA
            B400FFE0AA00FFEFB000FFFFBF00FFFFC700FFFFCA00FFFFC900F8EFBA00BA81
            6700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6937D00E7CC
            A300FFEED000FFD8A600FFEAAB00FFEDAD00FFF2B200FFF0B000E7C99700BB87
            6F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D7B6AD00CB9C
            8000FFFFFF00FFF7E900FFEDB800FFCF9100FFDEA000FFF2B600CA927100CAA8
            9F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C79B
            8B00CA9A8300E7CCAD00F8EDBD00F8E7B100E7C99900CA907100BF908100FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00D6B7AE00BE8B7600BB826800BD836900C48F7B00D4B3AA00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00}
          Transparent = True
        end
      end
    end
    object pnlGrid: TPanel
      Left = 205
      Top = 0
      Width = 235
      Height = 263
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object tlData: TcxDBTreeList
        Left = 0
        Top = 0
        Width = 235
        Height = 263
        BorderStyle = cxcbsNone
        Align = alClient
        Bands = <
          item
          end>
        BufferedPaint = True
        DataController.DataSource = srcData
        OptionsBehavior.CellHints = True
        OptionsCustomizing.BandCustomizing = False
        OptionsCustomizing.ColumnVertSizing = False
        OptionsData.Editing = False
        OptionsData.AnsiSort = True
        OptionsData.Deleting = False
        OptionsSelection.InvertSelect = False
        OptionsView.CellEndEllipsis = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        RootValue = -1
        TabOrder = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      28
      0)
  end
end
