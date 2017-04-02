inherited ValueForm: TValueForm
  Left = 304
  Top = 230
  Height = 307
  Caption = #1040#1090#1088#1080#1073#1091#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 269
    ClientRectBottom = 245
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 214
        inherited edtName: TcxDBTextEdit
          Left = 95
        end
        inherited edtDescript: TcxDBMemo
          Left = 95
          Top = 132
          TabOrder = 4
          Height = 73
        end
        object edtStringValue: TcxDBMemo [2]
          Left = 95
          Top = 41
          DataBinding.DataField = 'STRINGVALUE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Height = 21
          Width = 383
        end
        object edtOwnerID: TfdcObjectLinkEdit [3]
          Left = 95
          Top = 100
          DataBinding.DataField = 'OWNERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
          DataBinding.TypeSysName = 'Object'
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
        object edtSysName: TcxDBTextEdit [4]
          Left = 95
          Top = 68
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciValueEdit: TdxLayoutItem [1]
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtStringValue
            ControlOptions.ShowBorder = False
          end
          object lciSysName: TdxLayoutItem [2]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSysName
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
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 214
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 242
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 214
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 245
        ClientRectBottom = 221
      end
    end
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
        FloatLeft = 347
        FloatTop = 310
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
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataOWNER_OBJECT_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataOWNERNAME
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select /*+ FIRST_ROWS */ *'
      '  from fdc_Value_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_VALUE_LST'
    object dsDataSTRINGVALUE: TStringField
      FieldName = 'STRINGVALUE'
      Size = 1500
    end
    object dsDataNUMVALUE: TFloatField
      FieldName = 'NUMVALUE'
    end
    object dsDataDATETIMEVALUE: TDateTimeField
      FieldName = 'DATETIMEVALUE'
    end
    object dsDataREF_OBJECT_ID: TFloatField
      FieldName = 'REF_OBJECT_ID'
    end
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
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
    object dsDataREFNAME: TStringField
      FieldName = 'REFNAME'
      Size = 1500
    end
    object dsDataREFTYPENAME: TStringField
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
    object dsDataFILESOURCENAME: TStringField
      FieldName = 'FILESOURCENAME'
      Size = 1500
    end
    object dsDataISSYSTEM: TIntegerField
      FieldName = 'ISSYSTEM'
    end
    object dsDataLOCALITY: TIntegerField
      FieldName = 'LOCALITY'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Value_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :ISSYSTEM,'
      '    :OWNER_OBJECT_ID,    '
      '    :STRINGVALUE,'
      '    :NUMVALUE,'
      '    :DATETIMEVALUE,'
      '    :REF_OBJECT_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUE_ADD'
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
        Name = 'SYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ISSYSTEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STRINGVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATETIMEVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REF_OBJECT_ID'
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
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Value_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :STRINGVALUE,'
      '    :NUMVALUE,'
      '    :DATETIMEVALUE,'
      '    :REF_OBJECT_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUE_UPD'
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
        Name = 'SYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STRINGVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATETIMEVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REF_OBJECT_ID'
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
  object LocValues: TOraclePackage
    Session = MainData.Session
    PackageName = 'asbc_LocValues'
    Left = 419
    Top = 156
  end
end
