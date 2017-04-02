inherited SelectDateDlgForm: TSelectDateDlgForm
  Left = 292
  Top = 308
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091
  ClientHeight = 79
  ClientWidth = 256
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 256
    Height = 79
    inherited btnCancel: TcxButton
      Left = 172
      Top = 47
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 91
      Top = 47
      TabOrder = 1
    end
    object edtDate: TcxDateEdit [2]
      Left = 9
      Top = 9
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 422
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072
        ShowCaption = False
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
end
