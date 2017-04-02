inherited SysComponentForm: TSysComponentForm
  Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 291
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 101
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 101
          Top = 90
          Width = 185
          Height = 89
          TabOrder = 3
        end
        object edtSysName: TcxDBTextEdit [2]
          Left = 101
          Top = 36
          Width = 121
          Height = 21
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtObjectType: TfdcObjectLinkEdit [3]
          Left = 101
          Top = 63
          Width = 121
          Height = 21
          DataBinding.DataField = 'BASETYPENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BASE_TYPE_ID'
          DataBinding.TypeSysName = 'ObjectType'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          AcceptObjects = False
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciSysName: TdxLayoutItem [1]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSysName
            ControlOptions.ShowBorder = False
          end
          object lciObjectType: TdxLayoutItem [2]
            Caption = #1054#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1090#1080#1087#1091
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtObjectType
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    object tabTask: TcxTabSheet [1]
      Caption = #1047#1072#1076#1072#1095#1080
      ImageIndex = 2
      OnShow = tabTaskShow
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
    inherited actNew: TAction
      Visible = False
    end
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
      '  from fdc_SysComponent_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_SYSCOMPONENT_LST'
    object dsDataBASE_TYPE_ID: TFloatField
      FieldName = 'BASE_TYPE_ID'
    end
    object dsDataBASETYPENAME: TStringField
      FieldName = 'BASETYPENAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1099#1077' '#1086#1073#1098#1077#1082#1090#1099' '#1084#1086#1078#1085#1086' '#1090#1086#1083#1100#1082#1086' '
      '  -- '#1095#1077#1088#1077#1079' '#1084#1077#1093#1072#1085#1080#1079#1084' '#1080#1093' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080' '
      '  null;'
      'end;')
    SourceServerObject = 'NULL'
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_SysComponent_Upd('
      '    :ID,'
      '    :NAME,'
      '    :BASE_TYPE_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_SYSCOMPONENT_UPD'
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
        Name = 'BASE_TYPE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
