inherited DictForm: TDictForm
  Left = 358
  Top = 299
  Width = 530
  Height = 317
  ActiveControl = edtName
  Caption = #1055#1086#1079#1080#1094#1080#1103' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 522
    Height = 290
    ClientRectBottom = 266
    ClientRectRight = 522
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 516
        Height = 237
        inherited edtName: TcxDBTextEdit
          Left = 84
          Width = 424
        end
        inherited edtDescript: TcxDBMemo
          Left = 84
          Top = 109
          TabOrder = 4
          Height = 58
          Width = 185
        end
        object edtCode: TcxDBTextEdit [2]
          Left = 84
          Top = 34
          DataBinding.DataField = 'CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 121
        end
        object edtFullCode: TcxDBTextEdit [3]
          Left = 84
          Top = 59
          DataBinding.DataField = 'FULLCODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        object edtOwnerID: TfdcObjectLinkEdit [4]
          Left = 84
          Top = 84
          DataBinding.DataField = 'OWNERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
          DataBinding.TypeSysName = 'Dict'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 3
          AcceptObjects = False
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          end
          object lciCode: TdxLayoutItem [1]
            Caption = #1050#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
          object lciFullCode: TdxLayoutItem [2]
            Caption = #1055#1086#1083#1085#1099#1081' '#1082#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtFullCode
            ControlOptions.ShowBorder = False
          end
          object lciOwnerID: TdxLayoutItem [3]
            Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtOwnerID
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 522
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 237
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 263
        Width = 522
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 519
        Height = 237
      end
    end
    object tabPositions: TcxTabSheet [1]
      Caption = #1055#1086#1079#1080#1094#1080#1080
      ImageIndex = 2
      OnShow = tabPositionsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 522
        Height = 266
        ClientRectBottom = 242
        ClientRectRight = 522
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
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
      '  from fdc_Dict_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_DICT_LST'
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Required = True
    end
    inherited dsDataSHORTNAME: TStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    inherited dsDataDESCRIPT: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object dsDataCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Required = True
      Size = 1500
    end
    object dsDataCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
    object dsDataFULLCODE: TStringField
      DisplayLabel = #1055#1086#1083#1085#1099#1081' '#1082#1086#1076
      FieldName = 'FULLCODE'
      Size = 4000
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataOWNERSYSNAME: TStringField
      FieldName = 'OWNERSYSNAME'
      Size = 1500
    end
    object dsDataOWNERTYPENAME: TStringField
      FieldName = 'OWNERTYPENAME'
      Size = 1500
    end
    object dsDataOWNERTYPESYSNAME: TStringField
      FieldName = 'OWNERTYPESYSNAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Dict_Add('
      '    :TYPESYSNAME,'
      '    :OWNER_OBJECT_ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CODE,'
      '    :CODE2,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_DICT_ADD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Dict_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CODE,'
      '    :CODE2,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_DICT_UPD'
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
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
