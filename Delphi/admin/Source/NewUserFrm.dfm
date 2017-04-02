inherited NewUserForm: TNewUserForm
  Left = 377
  Top = 370
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' ORACLE'
  ClientHeight = 196
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 349
    Height = 196
    object Bevel1: TBevel [0]
      Left = 9
      Top = 69
      Width = 338
      Height = 4
      Shape = bsBottomLine
    end
    object Bevel2: TBevel [1]
      Left = 9
      Top = 154
      Width = 320
      Height = 4
      Shape = bsBottomLine
    end
    object Bevel3: TBevel [2]
      Left = 9
      Top = 9
      Width = 320
      Height = 4
      Shape = bsBottomLine
    end
    inherited btnCancel: TcxButton
      Left = 265
      Top = 164
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 184
      Top = 164
      ModalResult = 0
      TabOrder = 5
    end
    object edtAdminUserName: TcxTextEdit [5]
      Left = 135
      Top = 19
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 0
      Text = 'edtAdminUserName'
      Width = 220
    end
    object edtAdminPassword: TcxTextEdit [6]
      Left = 135
      Top = 44
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 1
      Text = 'edtAdminPassword'
      Width = 220
    end
    object edtNewUserName: TcxTextEdit [7]
      Left = 135
      Top = 79
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 2
      Text = 'edtNewUserName'
      Width = 220
    end
    object edtNewPassword1: TcxTextEdit [8]
      Left = 135
      Top = 104
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 3
      Text = 'edtNewPassword1'
      Width = 220
    end
    object edtNewPassword2: TcxTextEdit [9]
      Left = 135
      Top = 129
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 4
      Text = 'edtNewPassword2'
      Width = 220
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item9: TdxLayoutItem [0]
        Control = Bevel3
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = #1048#1084#1103' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
        Control = edtAdminUserName
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = #1055#1072#1088#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
        Control = edtAdminPassword
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item6: TdxLayoutItem [3]
        Control = Bevel1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [4]
        Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Control = edtNewUserName
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [5]
        Caption = #1055#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Control = edtNewPassword1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [6]
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
        Control = edtNewPassword2
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item7: TdxLayoutItem [7]
        Control = Bevel2
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object ssnLocal: TfdcOracleSession
    TraceException = False
    Left = 20
    Top = 190
  end
  object dsLocalSQL: TfdcQuery
    Session = ssnLocal
    ReadOnly = False
    Left = 60
    Top = 190
  end
end
