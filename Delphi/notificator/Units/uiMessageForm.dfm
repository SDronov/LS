object MsgForm: TMsgForm
  Left = 535
  Top = 135
  BorderStyle = bsToolWindow
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
  ClientHeight = 246
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 205
    Align = alClient
    TabOrder = 0
    DesignSize = (
      420
      205)
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 418
      Height = 28
      Align = alTop
      Alignment = taCenter
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077'!'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 1
      Top = 29
      Width = 418
      Height = 28
      Align = alTop
      Alignment = taCenter
      Caption = #1055#1086#1089#1090#1091#1087#1080#1083#1080' '#1085#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object cbRecol: TCheckBox
      Left = 9
      Top = 182
      Width = 153
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1053#1072#1087#1086#1084#1085#1080#1090#1100' '#1095#1077#1088#1077#1079' 5 '#1084#1080#1085#1091#1090
      TabOrder = 0
    end
    object LB: TListBox
      Left = 9
      Top = 71
      Width = 400
      Height = 104
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 205
    Width = 420
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      420
      41)
    object btOk: TButton
      Left = 28
      Top = 8
      Width = 368
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
      OnClick = btOkClick
    end
  end
end
