inherited StateForm: TStateForm
  Left = 359
  Top = 214
  Caption = 'StateForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 291
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        object shpColor: TShape [0]
          Left = 338
          Top = 91
          Width = 58
          Height = 21
          Align = alTop
          Pen.Color = clBackground
          OnMouseDown = shpColorMouseDown
        end
        inherited edtName: TcxDBTextEdit
          Left = 86
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 86
          Top = 171
          Width = 185
          Height = 89
          TabOrder = 7
        end
        object edtStateScheme: TfdcObjectLinkEdit [3]
          Left = 86
          Top = 63
          Width = 121
          Height = 21
          DataBinding.DataField = 'STATE_SCHEMENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'STATE_SCHEME_ID'
          DataBinding.TypeSysName = 'StateScheme'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          AcceptObjects = False
        end
        object edtSysName: TcxDBTextEdit [4]
          Left = 86
          Top = 36
          Width = 121
          Height = 21
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object chbxActive: TcxDBCheckBox [5]
          Left = 79
          Top = 90
          Width = 98
          Height = 21
          Caption = #1040#1082#1090#1080#1074#1085#1086#1077
          DataBinding.DataField = 'ACTIVE'
          DataBinding.DataSource = srcData
          ParentColor = False
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object chbxAllowUpdates: TcxDBCheckBox [6]
          Left = 79
          Top = 117
          Width = 134
          Height = 21
          Caption = #1044#1086#1087#1091#1089#1082#1072#1077#1090' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          DataBinding.DataField = 'ALLOWUPDATES'
          DataBinding.DataSource = srcData
          ParentColor = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 4
        end
        object chbxAllowDelete: TcxDBCheckBox [7]
          Left = 79
          Top = 144
          Width = 134
          Height = 21
          Caption = #1044#1086#1087#1091#1089#1082#1072#1077#1090' '#1091#1076#1072#1083#1077#1085#1080#1077
          DataBinding.DataField = 'ALLOWDELETE'
          DataBinding.DataSource = srcData
          ParentColor = False
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 5
        end
        object btnSelectColor: TcxButton [8]
          Left = 402
          Top = 90
          Width = 75
          Height = 23
          Action = actSelectColor
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciSysName: TdxLayoutItem [1]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSysName
            ControlOptions.ShowBorder = False
          end
          object lciStateScheme: TdxLayoutItem [2]
            Caption = #1057#1093#1077#1084#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtStateScheme
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [3]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralGroup2: TdxLayoutGroup
              Offsets.Left = 70
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lciActive: TdxLayoutItem
                AutoAligns = [aaVertical]
                CaptionOptions.AlignHorz = taRightJustify
                Control = chbxActive
                ControlOptions.ShowBorder = False
              end
              object lciAllowUpdates: TdxLayoutItem
                AutoAligns = [aaVertical]
                CaptionOptions.AlignHorz = taRightJustify
                Control = chbxAllowUpdates
                ControlOptions.ShowBorder = False
              end
              object lciAllowDelete: TdxLayoutItem
                AutoAligns = [aaVertical]
                CaptionOptions.AlignHorz = taRightJustify
                Control = chbxAllowDelete
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup3: TdxLayoutGroup
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciColor: TdxLayoutItem
                AutoAligns = []
                AlignHorz = ahRight
                CaptionOptions.AlignHorz = taRightJustify
                Offsets.Top = 1
                ShowCaption = False
                Control = shpColor
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem1: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = 'cxButton1'
                CaptionOptions.AlignHorz = taRightJustify
                ShowCaption = False
                Control = btnSelectColor
                ControlOptions.ShowBorder = False
              end
            end
          end
        end
      end
    end
    object tabStateTransit: TcxTabSheet [1]
      Caption = #1055#1077#1088#1077#1093#1086#1076#1099
      OnShow = tabStateTransitShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 268
        ClientRectRight = 492
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    Left = 200
    Top = 211
    object actSelectColor: TAction
      Category = 'Object'
      Caption = #1062#1074#1077#1090'...'
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
      OnExecute = actSelectColorExecute
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 284
    Top = 211
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Left = 396
    Top = 211
  end
  inherited WebEditStyleController: TcxEditStyleController
    Left = 424
    Top = 211
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 340
    Top = 211
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Left = 368
    Top = 211
  end
  inherited imglAction: TImageList
    Left = 228
    Top = 211
  end
  inherited imglLarge: TImageList
    Left = 256
    Top = 211
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
        FloatClientWidth = 86
        FloatClientHeight = 75
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
    Left = 312
    Top = 211
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptOutput
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEME_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataSTATE_SCHEMENAME
      end>
    Left = 200
    Top = 239
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_STATE_LST'
    Left = 228
    Top = 239
    object dsDataSTATE_SCHEME_ID: TFloatField
      FieldName = 'STATE_SCHEME_ID'
    end
    object dsDataALLOWUPDATES: TIntegerField
      FieldName = 'ALLOWUPDATES'
    end
    object dsDataALLOWDELETE: TIntegerField
      FieldName = 'ALLOWDELETE'
    end
    object dsDataACTIVE: TIntegerField
      FieldName = 'ACTIVE'
    end
    object dsDataCOLOR: TFloatField
      FieldName = 'COLOR'
    end
    object dsDataSTATE_SCHEMENAME: TStringField
      FieldName = 'STATE_SCHEMENAME'
      Size = 1500
    end
    object dsDataSTATE_SCHEMESYSNAME: TStringField
      FieldName = 'STATE_SCHEMESYSNAME'
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Left = 228
    Top = 267
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_State_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :STATE_SCHEME_ID,'
      '    :ACTIVE,'
      '    :ALLOWUPDATES,'
      '    :ALLOWDELETE,'
      '    :COLOR,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_STATE_ADD'
    Left = 256
    Top = 239
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
        DataType = ftUnknown
        Name = 'SYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STATE_SCHEME_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALLOWUPDATES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALLOWDELETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_State_Upd('
      '    :ID,'
      '    :NAME,     '
      '    :SYSNAME,'
      '    :ACTIVE,'
      '    :ALLOWUPDATES,'
      '    :ALLOWDELETE,'
      '    :COLOR,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_STATE_UPD'
    Left = 284
    Top = 239
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
        DataType = ftUnknown
        Name = 'SYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACTIVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALLOWUPDATES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALLOWDELETE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COLOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 340
    Top = 267
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 424
    Top = 239
  end
  inherited dsUpdateState: TfdcQuery
    Left = 368
    Top = 239
  end
  inherited srcState: TDataSource
    Left = 312
    Top = 267
  end
  inherited dsTransit: TfdcQuery
    Left = 340
    Top = 239
  end
  inherited dsState: TfdcQuery
    Left = 312
    Top = 239
  end
  inherited srcAccessLevel: TDataSource
    Left = 396
    Top = 267
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 396
    Top = 239
  end
  object dlgColor: TColorDialog
    Options = [cdFullOpen, cdAnyColor]
    Left = 452
    Top = 211
  end
end
