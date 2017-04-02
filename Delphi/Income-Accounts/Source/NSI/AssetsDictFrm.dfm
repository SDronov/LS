inherited AssetsDictForm: TAssetsDictForm
  Left = 342
  Top = 131
  Width = 682
  Height = 584
  Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1079#1072#1095#1077#1090#1099' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 674
    Height = 557
    ClientRectBottom = 533
    ClientRectRight = 674
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 668
        Height = 504
        inherited edtName: TcxDBTextEdit
          Width = 418
        end
        inherited edtDescript: TcxDBMemo
          Top = 365
          TabOrder = 11
          Height = 145
          Width = 418
        end
        object edtCode2: TcxDBTextEdit [2]
          Left = 145
          Top = 73
          DataBinding.DataField = 'CODE2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 332
          TabOrder = 10
          Width = 122
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Top = 234
          TabOrder = 7
          Width = 122
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Top = 299
          TabOrder = 9
          Width = 122
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Top = 267
          TabOrder = 8
          Width = 122
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Top = 201
          TabOrder = 6
          Width = 122
        end
        inherited edtSDate: TcxDBDateEdit
          Top = 169
          TabOrder = 5
          Width = 122
        end
        inherited edtCode: TcxDBTextEdit
          Width = 122
        end
        inherited edtFullCode: TcxDBTextEdit
          Top = 105
          TabOrder = 3
          Width = 122
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 137
          TabOrder = 4
          Width = 122
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem7: TdxLayoutItem [2]
            Caption = #1057#1090#1072#1090#1100#1103' '#1058#1050
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCode2
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 674
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 504
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 530
        Width = 674
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 671
        Height = 504
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 674
        Height = 533
        ClientRectBottom = 509
        ClientRectRight = 674
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
      '  from fdc_assets_dict_lst'
      ' where ID = :ID')
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Assets_dict_Add('
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
      '  fdc_assets_dict_upd('
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
