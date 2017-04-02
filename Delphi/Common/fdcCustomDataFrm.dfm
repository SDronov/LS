inherited fdcCustomDataForm: TfdcCustomDataForm
  Left = 318
  Top = 245
  Caption = 'fdcCustomDataForm'
  OldCreateOrder = True
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList: TActionList
    Images = imglAction
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 164
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 192
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 108
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 136
  end
  object imglAction: TImageList
    Left = 220
    Top = 23
  end
  object imglLarge: TImageList
    Height = 24
    Width = 24
    Left = 248
    Top = 23
  end
  object BarManager: TdxBarManager
    AllowCallFromAnotherForm = True
    AllowReset = False
    AutoHideEmptyBars = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    Categories.Strings = (
      #1042#1080#1076)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = imglAction
    LargeImages = imglLarge
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseLargeImagesForLargeIcons = True
    UseSystemFont = True
    OnDocking = BarManagerDocking
    OnShowToolbarsPopup = BarManagerShowToolbarsPopup
    Left = 80
    Top = 23
    DockControlHeights = (
      0
      0
      0
      0)
    object miResetLayout: TdxBarButton
      Action = actResetLayout
      Category = 0
    end
  end
  object ParamsHolder: TfdcParamsHolder
    Params = <>
    Left = 276
    Top = 23
  end
end
