inherited ObjectGridForm: TObjectGridForm
  Left = 322
  Top = 294
  Width = 594
  Height = 345
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 291
    Width = 586
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited lblRecordCount: TcxLabel
        ParentFont = False
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        ParentFont = False
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      inherited lblQueryTime: TcxLabel
        ParentFont = False
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 280
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 280
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 264
          ParentFont = False
        end
      end
      inherited pnlProgress: TPanel
        Width = 280
        inherited lblProgress: TcxLabel
          Width = 280
          ParentFont = False
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 493
      inherited ProgressBar: TcxProgressBar
        ParentFont = False
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 288
    Width = 586
  end
  inherited pnlWorkspace: TPanel
    Width = 586
    Height = 260
    inherited splSearchCriteria: TSplitter
      Height = 260
    end
    inherited pnlSearchCriteria: TPanel
      Height = 260
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 240
        inherited btnSearch: TcxButton
          Top = 208
        end
        inherited edtName: TcxTextEdit
          Width = 184
          ParentFont = False
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 381
      Height = 260
      inherited grdData: TcxGrid
        Width = 381
        Height = 260
      end
    end
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
  end
end
