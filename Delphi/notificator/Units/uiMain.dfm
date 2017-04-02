object Main: TMain
  Left = 825
  Top = 130
  AutoScroll = False
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1048#1085#1092#1086#1088#1084#1072#1090#1086#1088
  ClientHeight = 398
  ClientWidth = 427
  Color = clBtnFace
  Constraints.MaxHeight = 425
  Constraints.MaxWidth = 435
  Constraints.MinHeight = 425
  Constraints.MinWidth = 435
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PM
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 427
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 279
    Top = 0
    Width = 148
    Height = 379
    Align = alRight
    TabOrder = 1
    object Button3: TButton
      Left = 10
      Top = 303
      Width = 130
      Height = 25
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 9
      Top = 338
      Width = 130
      Height = 25
      Action = acQuit
      TabOrder = 2
    end
    object btStart: TButton
      Left = 10
      Top = 268
      Width = 130
      Height = 25
      Action = acStartScan
      TabOrder = 0
    end
  end
  object PC: TPageControl
    Left = 0
    Top = 0
    Width = 279
    Height = 379
    ActivePage = tsOptions
    Align = alClient
    TabOrder = 0
    object tsState: TTabSheet
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      object Label1: TLabel
        Left = 7
        Top = 31
        Width = 115
        Height = 13
        Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1079#1072#1087#1091#1097#1077#1085#1072':'
      end
      object lbStarted: TLabel
        Left = 143
        Top = 31
        Width = 42
        Height = 13
        Caption = 'lbStarted'
      end
      object lbQweryStatus: TLabel
        Left = 143
        Top = 57
        Width = 68
        Height = 13
        Caption = 'lbQweryStatus'
      end
      object Label4: TLabel
        Left = 7
        Top = 57
        Width = 120
        Height = 13
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1087#1088#1086#1089':'
      end
      object Label2: TLabel
        Left = 7
        Top = 83
        Width = 92
        Height = 13
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1086#1087#1088#1086#1089':'
      end
      object lbLastQwery: TLabel
        Left = 143
        Top = 83
        Width = 58
        Height = 13
        Caption = 'lbLastQwery'
      end
      object lbLastNotify: TLabel
        Left = 7
        Top = 130
        Width = 55
        Height = 13
        Caption = 'lbLastNotify'
      end
      object Label3: TLabel
        Left = 7
        Top = 110
        Width = 129
        Height = 13
        Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077':'
      end
    end
    object tsOptions: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 1
      OnShow = tsOptionsShow
      object Label10: TLabel
        Left = 38
        Top = 5
        Width = 102
        Height = 13
        Caption = #1054#1087#1088#1086#1089' '#1079#1072#1087#1091#1089#1082#1072#1077#1090#1089#1103':'
      end
      object Label5: TLabel
        Left = 8
        Top = 31
        Width = 132
        Height = 13
        Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1086#1087#1088#1086#1089#1072', '#1089#1077#1082#1091#1085#1076':'
      end
      object sbPath: TSpeedButton
        Left = 241
        Top = 95
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
          07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
          0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        OnClick = sbPathClick
      end
      object Label6: TLabel
        Left = 69
        Top = 56
        Width = 71
        Height = 13
        Caption = #1052#1072#1089#1082#1072' '#1092#1072#1081#1083#1072':'
      end
      object cbAutoRun: TCheckBox
        Left = 10
        Top = 329
        Width = 229
        Height = 16
        Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1079#1072#1087#1091#1089#1082#1072#1077#1090#1089#1103' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        TabOrder = 7
        WordWrap = True
        OnClick = cbAutoRunClick
      end
      object cbAutoStart: TComboBox
        Left = 143
        Top = 3
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnClick = cbAutoStartChange
        Items.Strings = (
          #1042#1088#1091#1095#1085#1091#1102
          #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080)
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 137
        Width = 248
        Height = 184
        TabOrder = 6
        object Label8: TLabel
          Left = 78
          Top = 15
          Width = 34
          Height = 13
          Caption = #1040#1076#1088#1077#1089':'
        end
        object Label9: TLabel
          Left = 84
          Top = 39
          Width = 28
          Height = 13
          Caption = #1055#1086#1088#1090':'
        end
        object Label11: TLabel
          Left = 11
          Top = 62
          Width = 101
          Height = 13
          Caption = #1056#1077#1078#1080#1084' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103':'
        end
        object Label12: TLabel
          Left = 36
          Top = 85
          Width = 76
          Height = 13
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
        end
        object Label13: TLabel
          Left = 71
          Top = 107
          Width = 41
          Height = 13
          Caption = #1055#1072#1088#1086#1083#1100':'
        end
        object Label14: TLabel
          Left = 47
          Top = 129
          Width = 65
          Height = 13
          Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103':'
        end
        object Button1: TButton
          Left = 162
          Top = 151
          Width = 75
          Height = 25
          Caption = #1058#1077#1089#1090
          TabOrder = 6
          OnClick = Button1Click
        end
        object edServer: TEdit
          Left = 115
          Top = 12
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '127.0.0.1'
          OnChange = edServerChange
        end
        object edPort: TcxSpinEdit
          Left = 115
          Top = 35
          Properties.MaxValue = 65535.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = edPortPropertiesChange
          Style.BorderStyle = ebs3D
          TabOrder = 1
          Value = 1
          Width = 50
        end
        object cbPassive: TComboBox
          Left = 115
          Top = 58
          Width = 100
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          OnClick = cbPassiveChange
          Items.Strings = (
            #1040#1082#1090#1080#1074#1085#1099#1081
            #1055#1072#1089#1089#1080#1074#1085#1099#1081)
        end
        object edUser: TEdit
          Left = 115
          Top = 81
          Width = 121
          Height = 21
          TabOrder = 3
          OnChange = edUserChange
        end
        object edPassword: TEdit
          Left = 115
          Top = 103
          Width = 121
          Height = 21
          TabOrder = 4
          OnChange = edPasswordChange
        end
        object edDirectory: TEdit
          Left = 115
          Top = 126
          Width = 121
          Height = 21
          TabOrder = 5
          OnChange = edDirectoryChange
        end
      end
      object edInterval: TcxSpinEdit
        Left = 143
        Top = 27
        Properties.MaxValue = 3600.000000000000000000
        Properties.MinValue = 30.000000000000000000
        Properties.OnChange = edIntervalPropertiesChange
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Value = 60
        Width = 50
      end
      object mntrNetwork: TRadioButton
        Left = 10
        Top = 79
        Width = 162
        Height = 17
        Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1089#1077#1090#1077#1074#1086#1081' '#1087#1072#1087#1082#1080
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = mntrNetworkClick
      end
      object mntrFTP: TRadioButton
        Left = 10
        Top = 125
        Width = 200
        Height = 17
        Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1087#1072#1087#1082#1080' '#1085#1072' FTP-'#1089#1077#1088#1074#1077#1088#1077
        TabOrder = 5
        OnClick = mntrFTPClick
      end
      object edPath: TEdit
        Left = 8
        Top = 96
        Width = 231
        Height = 21
        Enabled = False
        TabOrder = 4
        Text = 'edPath'
        OnChange = edPathChange
      end
      object edFileMask: TEdit
        Left = 143
        Top = 53
        Width = 121
        Height = 21
        TabOrder = 2
        Text = '*.lzh'
        OnChange = edFileMaskChange
      end
    end
  end
  object ActionList1: TActionList
    Left = 288
    Top = 24
    object acQuit: TAction
      Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      OnExecute = acQuitExecute
    end
    object acOptions: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnExecute = acOptionsExecute
    end
    object acShow: TAction
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
      OnExecute = acShowExecute
    end
    object acHide: TAction
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      OnExecute = acHideExecute
    end
    object acStartScan: TAction
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
      OnExecute = acStartScanExecute
    end
    object acStopScan: TAction
      Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091
      OnExecute = acStopScanExecute
    end
    object acMinimize: TAction
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      OnExecute = acMinimizeExecute
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 352
    Top = 24
  end
  object PM: TPopupMenu
    Left = 320
    Top = 24
    object pmHideShow: TMenuItem
      Action = acShow
    end
    object N3: TMenuItem
      Action = acOptions
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object pmStartStop: TMenuItem
      Action = acStartScan
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = acQuit
    end
  end
end
