object FormOptions: TFormOptions
  Left = 146
  Top = 128
  BorderStyle = bsToolWindow
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 322
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 303
    Width = 319
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 262
    Width = 319
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      319
      41)
    object Button1: TButton
      Left = 128
      Top = 7
      Width = 75
      Height = 25
      Action = acSave
      Anchors = [akTop, akRight]
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 224
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 262
    Align = alClient
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 16
    Top = 88
    object acSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      OnExecute = acSaveExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
    end
  end
end
