object TestMainForm1: TTestMainForm1
  Left = 460
  Top = 79
  Width = 402
  Height = 374
  Caption = 'TestMainForm1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 13
    Width = 79
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1089#1082#1088#1080#1087#1090#1091':'
  end
  object Label2: TLabel
    Left = 4
    Top = 37
    Width = 76
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Label3: TLabel
    Left = 5
    Top = 63
    Width = 41
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object Label4: TLabel
    Left = 4
    Top = 85
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088':'
  end
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 369
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1043#1058#1044
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 88
    Top = 8
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'D:\Projects\iacc\00303\Delphi\Bin\gtdview\'
  end
  object Button2: TButton
    Left = 8
    Top = 144
    Width = 369
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1058#1055#1054
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 6
    Top = 240
    Width = 371
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1043#1058#1044' (DOA)'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 6
    Top = 272
    Width = 371
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1058#1055#1054' (DOA)'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 7
    Top = 176
    Width = 370
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1058#1056
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 6
    Top = 304
    Width = 371
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1058#1056' (DOA)'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 6
    Top = 208
    Width = 371
    Height = 25
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1045#1040#1044
    TabOrder = 7
    OnClick = Button7Click
  end
  object eLogin: TEdit
    Left = 88
    Top = 32
    Width = 289
    Height = 21
    TabOrder = 8
    Text = 'EFZ_ORDER'
  end
  object ePass: TEdit
    Left = 87
    Top = 58
    Width = 290
    Height = 21
    PasswordChar = '*'
    TabOrder = 9
    Text = 'EFZ_ORDER'
  end
  object Edit2: TEdit
    Left = 88
    Top = 80
    Width = 289
    Height = 21
    TabOrder = 10
    Text = '10404070/02.05.2013/0500044'
  end
  object OracleSession1: TOracleSession
    Cursor = crSQLWait
    LogonUsername = 'guftd_egorov'
    LogonDatabase = 'b4'
    Left = 104
    Top = 144
  end
  object OracleLogon1: TOracleLogon
    Session = OracleSession1
    Options = [ldDatabase]
    Left = 56
    Top = 136
  end
end
