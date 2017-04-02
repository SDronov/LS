inherited ObjectGridForm: TObjectGridForm
  Left = 551
  Top = 453
  Width = 594
  Height = 345
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 293
    Width = 586
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 281
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
      end
      inherited pnlProgress: TPanel
        Width = 281
        inherited lblProgress: TcxLabel
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 290
    Width = 586
  end
  inherited pnlWorkspace: TPanel
    Width = 586
    Height = 264
    inherited splSearchCriteria: TSplitter
      Height = 264
    end
    inherited pnlSearchCriteria: TPanel
      Height = 264
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 244
        inherited btnSearch: TcxButton
          Top = 212
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 381
      Height = 264
      inherited grdData: TcxGrid
        Width = 381
        Height = 264
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
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
end
