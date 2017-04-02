inherited StateTransitForm: TStateTransitForm
  Left = 348
  Top = 226
  Width = 517
  Height = 358
  Caption = #1055#1077#1088#1077#1093#1086#1076' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 509
    Height = 331
    ClientRectBottom = 308
    ClientRectRight = 509
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 503
        Height = 279
        inherited edtName: TcxDBTextEdit
          Left = 101
        end
        inherited edtDescript: TcxDBMemo
          Left = 101
          Top = 198
          TabOrder = 7
        end
        object edtSysName: TcxDBTextEdit [2]
          Left = 101
          Top = 36
          Width = 121
          Height = 21
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtStateSchemeID: TfdcObjectLinkEdit [3]
          Left = 101
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
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          AcceptObjects = False
        end
        object edtBeforeProcedure: TfdcObjectLinkEdit [4]
          Left = 101
          Top = 144
          Width = 121
          Height = 21
          DataBinding.DataField = 'BEFORE_PROCEDURENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BEFORE_PROCEDURE_ID'
          DataBinding.TypeSysName = 'Procedure'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.StyleController = WebEditStyleController
          TabOrder = 5
        end
        object edtAfterProcedure: TfdcObjectLinkEdit [5]
          Left = 101
          Top = 171
          Width = 121
          Height = 21
          DataBinding.DataField = 'AFTER_PROCEDURENAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'AFTER_PROCEDURE_ID'
          DataBinding.TypeSysName = 'Procedure'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.StyleController = WebEditStyleController
          TabOrder = 6
        end
        object cmbxSrcStateID: TcxDBLookupComboBox [6]
          Left = 101
          Top = 90
          Width = 145
          Height = 21
          DataBinding.DataField = 'SRC_STATE_ID'
          DataBinding.DataSource = srcData
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
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          OnDblClick = cmbxSrcStateIDDblClick
        end
        object cmbxDstStateID: TcxDBLookupComboBox [7]
          Left = 101
          Top = 117
          Width = 145
          Height = 21
          DataBinding.DataField = 'DST_STATE_ID'
          DataBinding.DataSource = srcData
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
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          OnDblClick = cmbxDstStateIDDblClick
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
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 509
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 279
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 305
        Width = 509
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 506
        Height = 279
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 509
        Height = 308
        ClientRectBottom = 285
        ClientRectRight = 509
        ClientRectTop = 0
      end
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
  end
  inherited dsInsert: TfdcQuery
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
      '    :DESCRIPT);'
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
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_State_Transit_Upd('
      '    :ID,'
      '    :NAME,    '
      '    :SYSNAME,'
      '    :STATE_SCHEME_ID,'
      '    :SRC_STATE_ID,'
      '    :DST_STATE_ID,'
      '    :BEFORE_PROCEDURE_ID,'
      '    :AFTER_PROCEDURE_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_STATE_TRANSIT_UPD'
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
