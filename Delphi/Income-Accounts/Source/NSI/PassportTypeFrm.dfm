inherited PassportTypeForm: TPassportTypeForm
  Left = 445
  Top = 360
  Width = 571
  Height = 388
  ActiveControl = nil
  Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1091#1076#1086#1089#1090#1086#1074#1077#1088#1103#1102#1097#1077#1075#1086' '#1083#1080#1095#1085#1086#1089#1090#1100
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 563
    Height = 361
    ClientRectBottom = 337
    ClientRectRight = 563
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 557
        Height = 308
        inherited edtName: TcxDBTextEdit
          Left = 104
          Width = 291
        end
        inherited edtDescript: TcxDBMemo
          Left = 104
          Top = 119
          TabOrder = 5
          Height = 60
          Width = 291
        end
        object edtShortName: TcxDBTextEdit [2]
          Left = 104
          Top = 53
          DataBinding.DataField = 'SHORTNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 316
        end
        inherited edtCode: TcxDBTextEdit
          Left = 104
          Top = 31
          Width = 291
        end
        inherited edtFullCode: TcxDBTextEdit
          Left = 104
          Top = 75
          TabOrder = 3
          Width = 291
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Left = 104
          Top = 97
          TabOrder = 4
          Width = 291
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem1: TdxLayoutItem [2]
            Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtShortName
            ControlOptions.ShowBorder = False
          end
          inherited lciFullCode: TdxLayoutItem
            Visible = False
          end
          inherited lciOwnerID: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 563
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 308
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 334
        Width = 563
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 560
        Height = 308
      end
    end
    inherited tabPositions: TcxTabSheet
      Caption = #1055#1086#1079#1080#1094#1080#1103
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 563
        Height = 337
        ClientRectBottom = 313
        ClientRectRight = 563
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -7
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
      '  from fdc_Passport_Type_lst'
      ' where ID = :ID')
    inherited dsDataCODE: TStringField
      Size = 2
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Passport_Type_add('
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
      '  fdc_Passport_Type_upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CODE,'
      '    :CODE2,'
      '    :DESCRIPT);'
      'end;')
  end
end
