inherited NSIDictForm: TNSIDictForm
  Left = 549
  Top = 270
  Height = 454
  HelpContext = 32
  ActiveControl = nil
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 427
    ClientRectBottom = 403
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 374
        inherited edtName: TcxDBTextEdit
          Left = 145
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Left = 145
          Top = 333
          Enabled = False
          TabOrder = 10
          Height = 224
          Width = 417
        end
        object cxDBTextEdit1: TcxDBTextEdit [2]
          Left = 145
          Top = 300
          DataBinding.DataField = 'NUMENDDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 121
        end
        object cxDBTextEdit2: TcxDBTextEdit [3]
          Left = 145
          Top = 202
          DataBinding.DataField = 'NUMBEGDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 121
        end
        object cxDBDateEdit1: TcxDBDateEdit [4]
          Left = 145
          Top = 267
          DataBinding.DataField = 'DATENDDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 121
        end
        object cxDBDateEdit2: TcxDBDateEdit [5]
          Left = 145
          Top = 235
          DataBinding.DataField = 'EDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 121
        end
        object edtDatBegDoc: TcxDBDateEdit [6]
          Left = 145
          Top = 169
          DataBinding.DataField = 'DATBEGDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 121
        end
        object edtSDate: TcxDBDateEdit [7]
          Left = 145
          Top = 137
          DataBinding.DataField = 'SDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 121
        end
        inherited edtCode: TcxDBTextEdit
          Left = 145
          Top = 41
          Width = 121
        end
        inherited edtFullCode: TcxDBTextEdit
          Left = 145
          Top = 73
          Enabled = False
          Width = 121
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Left = 145
          Top = 105
          Enabled = False
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciFullCode: TdxLayoutItem
            Enabled = False
            Visible = False
          end
          inherited lciOwnerID: TdxLayoutItem
            Enabled = False
            Visible = False
          end
          object lcGeneralItem6: TdxLayoutItem [4]
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSDate
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem5: TdxLayoutItem [5]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Width = 120
            Control = edtDatBegDoc
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [6]
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Width = 120
            Control = cxDBTextEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem [7]
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = cxDBDateEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem [8]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Width = 120
            Control = cxDBDateEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem1: TdxLayoutItem [9]
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Width = 120
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Enabled = False
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 374
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 400
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 374
      end
    end
    inherited tabPositions: TcxTabSheet
      Enabled = False
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 403
        ClientRectBottom = 379
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -15
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
        FloatClientWidth = 127
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
      '  from FDC_NSI_DICT_LST'
      ' where ID = :ID')
    SourceServerObject = 'FDC_NSI_DICT_LST'
    object dsDataSDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'SDATE'
      Required = True
    end
    object dsDataEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'EDATE'
    end
    object dsDataDATBEGDOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'DATBEGDOC'
      Required = True
    end
    object dsDataNUMBEGDOC: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'NUMBEGDOC'
      Required = True
      Size = 100
    end
    object dsDataDATENDDOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'DATENDDOC'
    end
    object dsDataNUMENDDOC: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
      FieldName = 'NUMENDDOC'
      Size = 100
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_nsidict_Add('
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
    SourceServerObject = ''
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
      '  fdc_nsidict_upd('
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
    SourceServerObject = ''
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
end
