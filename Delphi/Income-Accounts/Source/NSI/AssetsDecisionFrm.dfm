inherited AssetsDecisionForm: TAssetsDecisionForm
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1058#1054' '#1087#1086' '#1044#1057
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
        FloatClientWidth = 104
        FloatClientHeight = 55
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
      '  from FDC_assets_decision_LST'
      ' where ID = :ID')
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_assets_decision_Add('
      '    :NAME,'
      '    :CODE,'
      '    :SDate,'
      '    :EDate,'
      '    :DatBegDoc,'
      '    :NumBegDoc,'
      '    :DatEndDoc,'
      '    :NumEndDoc,'
      '   :CODE2);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE2'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_assets_decision_upd('
      '    :ID,'
      '    :NAME,'
      '    :CODE,'
      '    :SDate,'
      '    :EDate,'
      '    :DatBegDoc,'
      '    :NumBegDoc,'
      '    :DatEndDoc,'
      '    :NumEndDoc,'
      '   :CODE2);'
      'end;')
  end
end
