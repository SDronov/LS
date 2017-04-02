inherited StateTransitForm: TStateTransitForm
  Left = 774
  Top = 192
  Width = 542
  Height = 435
  Caption = #1055#1077#1088#1077#1093#1086#1076' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 534
    Height = 408
    ClientRectBottom = 384
    ClientRectRight = 534
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 528
        Height = 355
        inherited edtName: TcxDBTextEdit
          Left = 101
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 101
          Top = 231
          TabOrder = 9
          Height = 99
          Width = 185
        end
        object edtSysName: TcxDBTextEdit [2]
          Left = 101
          Top = 33
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 120
        end
        object edtStateSchemeID: TfdcObjectLinkEdit [3]
          Left = 101
          Top = 57
          DataBinding.DataField = 'STATE_SCHEMENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'STATE_SCHEME_ID'
          DataBinding.TypeSysName = 'StateScheme'
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
          TabOrder = 2
          AcceptObjects = False
          Width = 120
        end
        object edtBeforeProcedure: TfdcObjectLinkEdit [4]
          Left = 101
          Top = 129
          DataBinding.DataField = 'BEFORE_PROCEDURENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BEFORE_PROCEDURE_ID'
          DataBinding.TypeSysName = 'Procedure'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 5
          Width = 120
        end
        object edtAfterProcedure: TfdcObjectLinkEdit [5]
          Left = 101
          Top = 153
          DataBinding.DataField = 'AFTER_PROCEDURENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'AFTER_PROCEDURE_ID'
          DataBinding.TypeSysName = 'Procedure'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 6
          Width = 120
        end
        object cmbxSrcStateID: TcxDBLookupComboBox [6]
          Left = 101
          Top = 81
          DataBinding.DataField = 'SRC_STATE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              SortOrder = soAscending
              FieldName = 'Name'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcSchemeState
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          OnDblClick = cmbxSrcStateIDDblClick
          Width = 145
        end
        object cmbxDstStateID: TcxDBLookupComboBox [7]
          Left = 101
          Top = 105
          DataBinding.DataField = 'DST_STATE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              SortOrder = soAscending
              FieldName = 'Name'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcSchemeState
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          OnDblClick = cmbxDstStateIDDblClick
          Width = 145
        end
        object cxAccessLevel: TcxDBCheckBox [8]
          Left = 9
          Top = 177
          Caption = #1055#1077#1088#1077#1093#1086#1076' '#1076#1086#1089#1090#1091#1087#1077#1085' '#1076#1083#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          DataBinding.DataField = 'TR_ACCESS_LEVEL'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.Alignment = taLeftJustify
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 232
        end
        object edtCondition: TcxDBTextEdit [9]
          Left = 101
          Top = 204
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CONDITION'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 241
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
            Control = edtStateSchemeID
            ControlOptions.ShowBorder = False
          end
          object lciSrcStateID: TdxLayoutItem [3]
            Caption = #1048#1079' '#1089#1086#1089#1090#1086#1103#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxSrcStateID
            ControlOptions.ShowBorder = False
          end
          object lciDstStateID: TdxLayoutItem [4]
            Caption = #1042' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxDstStateID
            ControlOptions.ShowBorder = False
          end
          object lciBeforeProcedure: TdxLayoutItem [5]
            Caption = #1055#1077#1088#1077#1076' '#1087#1077#1088#1077#1093#1086#1076#1086#1084
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtBeforeProcedure
            ControlOptions.ShowBorder = False
          end
          object lciAfterProcedure: TdxLayoutItem [6]
            Caption = #1055#1086#1089#1083#1077' '#1087#1077#1088#1077#1093#1086#1076#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtAfterProcedure
            ControlOptions.ShowBorder = False
          end
          object lciAccessLevel: TdxLayoutItem [7]
            Caption = 'sdf'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = cxAccessLevel
            ControlOptions.ShowBorder = False
          end
          object lciCondition: TdxLayoutItem [8]
            Caption = #1055#1088#1080' '#1091#1089#1083#1086#1074#1080#1080
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCondition
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 534
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 355
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 381
        Width = 534
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 531
        Height = 355
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 534
        Height = 384
        ClientRectBottom = 360
        ClientRectRight = 534
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Transit_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_STATE_TRANSIT_LST'
    object dsDataSTATE_SCHEME_ID: TFloatField
      FieldName = 'STATE_SCHEME_ID'
    end
    object dsDataSRC_STATE_ID: TFloatField
      FieldName = 'SRC_STATE_ID'
    end
    object dsDataDST_STATE_ID: TFloatField
      FieldName = 'DST_STATE_ID'
    end
    object dsDataBEFORE_PROCEDURE_ID: TFloatField
      FieldName = 'BEFORE_PROCEDURE_ID'
    end
    object dsDataAFTER_PROCEDURE_ID: TFloatField
      FieldName = 'AFTER_PROCEDURE_ID'
    end
    object dsDataSTATE_SCHEMENAME: TStringField
      FieldName = 'STATE_SCHEMENAME'
      Size = 1500
    end
    object dsDataSTATE_SCHEMESYSNAME: TStringField
      FieldName = 'STATE_SCHEMESYSNAME'
      Size = 1500
    end
    object dsDataSRC_STATENAME: TStringField
      FieldName = 'SRC_STATENAME'
      Size = 1500
    end
    object dsDataSRC_STATESYSNAME: TStringField
      FieldName = 'SRC_STATESYSNAME'
      Size = 1500
    end
    object dsDataDST_STATENAME: TStringField
      FieldName = 'DST_STATENAME'
      Size = 1500
    end
    object dsDataDST_STATESYSNAME: TStringField
      FieldName = 'DST_STATESYSNAME'
      Size = 1500
    end
    object dsDataBEFORE_PROCEDURENAME: TStringField
      FieldName = 'BEFORE_PROCEDURENAME'
      Size = 1500
    end
    object dsDataBEFORE_PROCEDURESYSNAME: TStringField
      FieldName = 'BEFORE_PROCEDURESYSNAME'
      Size = 1500
    end
    object dsDataAFTER_PROCEDURENAME: TStringField
      FieldName = 'AFTER_PROCEDURENAME'
      Size = 1500
    end
    object dsDataAFTER_PROCEDURESYSNAME: TStringField
      FieldName = 'AFTER_PROCEDURESYSNAME'
      Size = 1500
    end
    object dsDataTR_ACCESS_LEVEL: TFloatField
      FieldName = 'TR_ACCESS_LEVEL'
    end
    object dsDataCONDITION: TStringField
      FieldName = 'CONDITION'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_State_Transit_Add('
      '    :TYPESYSNAME,'
      '    :NAME,    '
      '    :SYSNAME,'
      '    :STATE_SCHEME_ID,'
      '    :SRC_STATE_ID,'
      '    :DST_STATE_ID,'
      '    :BEFORE_PROCEDURE_ID,'
      '    :AFTER_PROCEDURE_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT,'
      '    :TR_ACCESS_LEVEL,'
      '    :CONDITION);'
      'end;')
    SourceServerObject = 'FDC_STATE_TRANSIT_ADD'
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
        Name = 'SRC_STATE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DST_STATE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BEFORE_PROCEDURE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AFTER_PROCEDURE_ID'
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
      end
      item
        DataType = ftUnknown
        Name = 'TR_ACCESS_LEVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONDITION'
        ParamType = ptInput
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_State_Transit_Upd('
      '    :ID,'
      '    :NAME,    '
      '    :SYSNAME,'
      '    :SRC_STATE_ID,'
      '    :DST_STATE_ID,'
      '    :BEFORE_PROCEDURE_ID,'
      '    :AFTER_PROCEDURE_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT,'
      '    :TR_ACCESS_LEVEL,'
      '    :CONDITION);'
      'end;')
    SourceServerObject = 'FDC_STATE_TRANSIT_UPD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'SYSNAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftFloat
        Name = 'SRC_STATE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'DST_STATE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'BEFORE_PROCEDURE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'AFTER_PROCEDURE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'SHORTNAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftFloat
        Name = 'TR_ACCESS_LEVEL'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CONDITION'
        ParamType = ptInput
      end>
  end
  object srcSchemeState: TDataSource
    DataSet = dsSchemeState
    Left = 444
    Top = 155
  end
  object dsSchemeState: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select ID, Name'
      '   from fdc_State_Lst'
      'where State_Scheme_ID = :State_Scheme_ID')
    SourceServerObject = 'FDC_STATE_LST'
    Left = 444
    Top = 127
    ParamData = <
      item
        DataType = ftFloat
        Name = 'State_Scheme_ID'
        ParamType = ptUnknown
      end>
    object dsSchemeStateID: TFloatField
      FieldName = 'ID'
    end
    object dsSchemeStateName: TStringField
      FieldName = 'Name'
      Size = 1500
    end
  end
end
