inherited ObjectGridForm: TObjectGridForm
  Left = 474
  Top = 361
  Width = 594
  Height = 345
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 282
    Width = 578
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 20
        Width = 82
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 275
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 275
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 275
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 275
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 485
      Top = 2
      Width = 77
      Height = 23
      inherited ProgressBar: TcxProgressBar
        Height = 19
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 279
    Width = 578
  end
  inherited pnlWorkspace: TPanel
    Width = 578
    Height = 251
    inherited splSearchCriteria: TSplitter
      Left = 201
      Width = 4
      Height = 251
    end
    inherited pnlSearchCriteria: TPanel
      Width = 201
      Height = 251
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 201
        Height = 231
        inherited btnSearch: TcxButton
          Left = 117
          Top = 200
          Height = 22
          TabOrder = 2
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        object btnSearchClear: TcxButton [2]
          Left = 117
          Top = 171
          Width = 75
          Height = 23
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100
          TabOrder = 1
          TabStop = False
          OnClick = btnSearchClearClick
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciSearchClearBtn: TdxLayoutItem [1]
            AutoAligns = []
            AlignHorz = ahRight
            AlignVert = avBottom
            Caption = 'cxButton1'
            ShowCaption = False
            Control = btnSearchClear
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 201
      end
    end
    inherited pnlGrid: TPanel
      Width = 373
      Height = 251
      inherited grdData: TcxGrid
        Width = 373
        Height = 251
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsView.Footer = True
        end
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    object dsDataOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Visible = False
      Size = 4000
    end
  end
end
