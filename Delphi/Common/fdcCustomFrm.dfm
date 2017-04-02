object fdcCustomForm: TfdcCustomForm
  Left = 325
  Top = 162
  Width = 448
  Height = 348
  Caption = '<'#1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099'>'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList: TActionList
    Left = 24
    Top = 23
    object actResetLayout: TAction
      Category = 'View'
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100'...'
      Hint = 
        #1057#1073#1088#1086#1089#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103'|'#1057#1073#1088#1086#1089#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1077' ' +
        #1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1080' '#1074#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087 +
        #1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnExecute = actResetLayoutExecute
      OnUpdate = actResetLayoutUpdate
    end
  end
  object LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 52
    Top = 23
    object LayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'MS Sans Serif'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      ItemOptions.CaptionOptions.HotTrackStyles = []
      ItemOptions.ControlBorderStyle = lbsFlat
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'MS Sans Serif'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      ItemOptions.CaptionOptions.HotTrackStyles = []
      ItemOptions.ControlBorderStyle = lbsFlat
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutWebLookAndFeel: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.Color = clBtnFace
      GroupOptions.Color = clWindow
      GroupOptions.FrameColor = clBtnFace
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutWebToolLookAndFeel: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.Color = 15313283
      GroupOptions.Color = 16311512
      GroupOptions.FrameColor = 15313283
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
  end
  object OfficeEditStyleController: TcxEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 136
    Top = 23
  end
  object WebEditStyleController: TcxEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsOffice11
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsOffice11
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 164
    Top = 23
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfFlat
    NativeStyle = True
    Left = 80
    Top = 23
  end
  object DefaultEditStyleController: TcxDefaultEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -8
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 108
    Top = 23
  end
end
