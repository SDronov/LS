inherited ActChangeOstKBKTransForm: TActChangeOstKBKTransForm
  Caption = 'ActChangeOstKBKTransForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Width = 409
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 737
        end
        inherited edtSignBy: TcxDBTextEdit
          Properties.ReadOnly = True
          Width = 737
        end
        inherited edtSignDate: TcxDBDateEdit
          Properties.ReadOnly = True
          Width = 737
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 394
        end
        inherited grdKBKList: TcxGrid
          Width = 696
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 417
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgSign: TdxLayoutGroup
            inherited lciSignByChief: TdxLayoutItem
              Visible = False
            end
            inherited lciSignBy: TdxLayoutItem
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSave: TAction
      Enabled = False
      Visible = False
    end
    inherited actChangeState: TAction
      Enabled = False
      Visible = False
    end
    inherited actPrint: TAction
      Visible = False
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 113
        FloatClientHeight = 82
        ItemLinks = <
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnPrint
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
    inherited btnStateTransit: TdxBarSubItem
      Visible = ivNever
    end
  end
end
