inherited DecisionQualifierForm: TDecisionQualifierForm
  Left = 292
  Top = 326
  ActiveControl = nil
  Caption = 'DecisionQualifierForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 424
        end
        inherited edtDescript: TcxDBMemo
          Width = 185
        end
        inherited edtCode: TcxDBTextEdit
          Width = 122
        end
        inherited edtFullCode: TcxDBTextEdit
          Width = 122
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Width = 122
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciFullCode: TdxLayoutItem
            Visible = False
          end
          inherited lciOwnerID: TdxLayoutItem
            Visible = False
          end
        end
      end
    end
    inherited tabPositions: TcxTabSheet
      TabVisible = False
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
        FloatLeft = 289
        FloatTop = 306
        FloatClientWidth = 137
        FloatClientHeight = 56
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Decision_Qualifier_lst'
      ' where ID = :ID')
    inherited dsDataCODE: TStringField
      Size = 2
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Decision_Qualifier_Add('
      '    :TYPESYSNAME,'
      '    :OWNER_OBJECT_ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CODE,'
      '    :CODE2,'
      '    :DESCRIPT);'
      'end;')
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Decision_Qualifier_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CODE,'
      '    :CODE2,'
      '    :DESCRIPT);'
      'end;')
  end
end
