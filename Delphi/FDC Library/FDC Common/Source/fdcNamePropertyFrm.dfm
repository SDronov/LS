object fdcNamePropertyForm: TfdcNamePropertyForm
  Left = 408
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 153
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel3: TPanel
    Left = 0
    Top = 0
    Width = 292
    Height = 153
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 10
      Width = 60
      Height = 13
      Caption = #1048#1084#1103' '#1082#1083#1072#1089#1089#1072':'
    end
    object lblClassName: TLabel
      Left = 75
      Top = 10
      Width = 62
      Height = 13
      Caption = 'lblClassName'
    end
    object Label2: TLabel
      Left = 6
      Top = 36
      Width = 55
      Height = 13
      Caption = #1057#1091#1097#1085#1086#1089#1090#1100':'
    end
    object Label3: TLabel
      Left = 6
      Top = 66
      Width = 148
      Height = 13
      Caption = #1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088':'
    end
    object Panel1: TPanel
      Left = 6
      Top = 60
      Width = 280
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 4
    end
    object edtNamePreview: TEdit
      Left = 6
      Top = 85
      Width = 280
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 6
      Top = 112
      Width = 280
      Height = 2
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object btnOK: TButton
      Left = 124
      Top = 122
      Width = 77
      Height = 24
      Action = actOk
      Default = True
      ModalResult = 1
      TabOrder = 2
    end
    object btnCancel: TButton
      Left = 209
      Top = 122
      Width = 77
      Height = 24
      Action = actCancel
      Cancel = True
      ModalResult = 2
      TabOrder = 3
    end
    object edtName: TEdit
      Left = 75
      Top = 32
      Width = 211
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object ActionList: TActionList
    Left = 6
    Top = 121
    object actOk: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actOkExecute
      OnUpdate = actOkUpdate
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
end
