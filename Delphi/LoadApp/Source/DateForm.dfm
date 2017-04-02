inherited fdcCustomDlgForm1: TfdcCustomDlgForm1
  Left = 599
  Top = 309
  Caption = 'fdcCustomDlgForm1'
  ClientHeight = 106
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 106
    inherited btnCancel: TcxButton
      Top = 64
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Top = 64
      TabOrder = 1
    end
    object cxDateEdit1: TcxDateEdit [2]
      Left = 212
      Top = 12
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        AutoAligns = [aaVertical]
        AlignHorz = ahCenter
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080':'
        Control = cxDateEdit1
        ControlOptions.ShowBorder = False
      end
    end
  end
end
