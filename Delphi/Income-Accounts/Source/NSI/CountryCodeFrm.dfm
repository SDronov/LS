inherited CountryCodeForm: TCountryCodeForm
  Left = 487
  Top = 214
  Width = 573
  Height = 661
  Caption = #1050#1086#1076' '#1089#1090#1088#1072#1085#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 565
    Height = 634
    ClientRectBottom = 610
    ClientRectRight = 565
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 559
        Height = 581
        inherited edtDescript: TcxDBMemo
          Top = 330
          TabOrder = 11
        end
        object edtCode2: TcxDBTextEdit [2]
          Left = 145
          Top = 63
          DataBinding.DataField = 'CODE2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 226
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 297
          TabOrder = 10
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Top = 204
          TabOrder = 7
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Top = 264
          TabOrder = 9
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Top = 237
          TabOrder = 8
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Top = 171
          TabOrder = 6
        end
        inherited edtSDate: TcxDBDateEdit
          Top = 144
          TabOrder = 5
        end
        inherited edtCode: TcxDBTextEdit
          Top = 36
          Width = 303
        end
        inherited edtFullCode: TcxDBTextEdit
          Top = 90
          TabOrder = 3
          Width = 303
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 117
          TabOrder = 4
          Width = 303
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem7: TdxLayoutItem [2]
            Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1081' '#1082#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCode2
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 565
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 581
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 607
        Width = 565
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 562
        Height = 581
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 565
        Height = 610
        ClientRectBottom = 586
        ClientRectRight = 565
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -11
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
      '  from fdc_Country_Code_lst'
      ' where ID = :ID')
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    inherited dsDataCODE: TStringField
      Size = 3
    end
    inherited dsDataCODE2: TStringField
      DisplayLabel = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1081' '#1082#1086#1076
      Size = 2
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Country_Code_add('
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
      '  fdc_Country_Code_upd('
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
