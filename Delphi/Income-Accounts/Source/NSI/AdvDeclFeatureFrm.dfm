inherited AdvDeclFeatureForm: TAdvDeclFeatureForm
  Left = 449
  Top = 223
  Caption = 'AdvDeclFeatureForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Height = 224
          Width = 417
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Width = 121
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Width = 121
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Width = 121
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Width = 121
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Width = 121
        end
        inherited edtSDate: TcxDBDateEdit
          Width = 121
        end
        inherited edtCode: TcxDBTextEdit
          Width = 121
        end
        inherited edtFullCode: TcxDBTextEdit
          Width = 121
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Width = 121
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 558
        FloatTop = 311
        FloatClientWidth = 103
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
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
  end
end
