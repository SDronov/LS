inherited fdcCustomTabDlgForm: TfdcCustomTabDlgForm
  Left = 394
  Top = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited btnCancel: TcxButton
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      TabOrder = 1
    end
    object PageControl: TcxPageControl [2]
      Left = 9
      Top = 9
      Width = 482
      Height = 249
      ActivePage = tabGeneral
      Align = alClient
      TabOrder = 0
      ClientRectBottom = 248
      ClientRectLeft = 1
      ClientRectRight = 481
      ClientRectTop = 21
      object tabGeneral: TcxTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        ImageIndex = 0
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Control = PageControl
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
