object FMain: TFMain
  Left = 262
  Top = 223
  Width = 626
  Height = 425
  Caption = #1058#1077#1089#1090#1086#1074#1072#1103' '#1092#1086#1088#1084#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object M: TMemo
    Left = 0
    Top = 0
    Width = 618
    Height = 357
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 618
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      618
      41)
    object btStop: TButton
      Left = 518
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1090#1086#1087
      TabOrder = 0
      OnClick = btStopClick
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 48
    Top = 24
  end
end
