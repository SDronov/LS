inherited ChangeImportDateForm: TChangeImportDateForm
  Left = 503
  Top = 350
  Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1085#1086#1089#1072
  ClientHeight = 105
  ClientWidth = 293
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 293
    Height = 105
    inherited btnCancel: TcxButton
      Left = 209
      Top = 73
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 128
      Top = 73
      ModalResult = 0
      TabOrder = 2
    end
    object edtPassword: TcxMaskEdit [2]
      Left = 48
      Top = 9
      ParentFont = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 121
    end
    object edtDate: TcxDateEdit [3]
      Left = 48
      Top = 36
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1055#1072#1088#1086#1083#1100
        Control = edtPassword
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1044#1072#1090#1072
        Control = edtDate
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object qryChange: TOracleQuery
    SQL.Strings = (
      'begin'
      '  change_moving_date ( pDate     => :pDate'
      '                      ,pPassword => :pPassword);'
      'end;')
    Variables.Data = {
      0300000002000000060000003A50444154450C00000000000000000000000A00
      00003A5050415353574F5244050000000000000000000000}
    Left = 24
    Top = 56
  end
end
