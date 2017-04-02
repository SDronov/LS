inherited RezulttoForm: TRezulttoForm
  Left = 375
  Top = 259
  Width = 675
  Height = 650
  Caption = #1056#1077#1096#1077#1085#1080#1077', '#1087#1088#1080#1085#1080#1084#1072#1077#1084#1086#1077' '#1058#1054
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 667
    Height = 623
    ClientRectBottom = 599
    ClientRectRight = 667
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Width = 661
        Height = 593
        inherited edtName: TcxDBTextEdit
          Width = 418
        end
        inherited edtDescript: TcxDBMemo
          Height = 145
          Width = 418
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Width = 122
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Width = 122
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Width = 122
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Width = 122
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Width = 122
        end
        inherited edtSDate: TcxDBDateEdit
          Width = 122
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
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 667
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 593
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 596
        Width = 667
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 664
        Top = 3
        Height = 593
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 667
        Height = 599
        ClientRectBottom = 575
        ClientRectRight = 667
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
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from Fdc_Rezultto_Lst'
      ' where ID = :ID')
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Rezultto_Add('
      '    :TYPESYSNAME,'
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
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Rezultto_upd('
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
