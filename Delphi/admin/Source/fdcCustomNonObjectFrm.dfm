inherited fdcCustomNonObjectForm: TfdcCustomNonObjectForm
  Left = 419
  Top = 380
  Caption = 'fdcCustomNonObjectForm'
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 28
        Height = 249
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Height = 28
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 28
        Height = 249
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 277
        Height = 3
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Top = 28
        Height = 249
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
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
