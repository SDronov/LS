inherited ValueBoolForm: TValueBoolForm
  Width = 499
  Height = 304
  Caption = #1041#1091#1083#1077#1074#1089#1082#1080#1081' '#1072#1090#1088#1080#1073#1091#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 483
    Height = 266
    ClientRectBottom = 242
    ClientRectRight = 483
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 477
        Height = 211
        inherited edtStringValue: TcxDBMemo [0]
          Left = 256
          Top = 97
          Enabled = False
          Height = 16
          Width = 24
        end
        inherited edtName: TcxDBTextEdit [1]
        end
        inherited edtDescript: TcxDBMemo [2]
          Top = 117
          TabOrder = 5
          Height = 85
        end
        object chbxNumValue: TcxDBCheckBox [3]
          Left = 95
          Top = 36
          Caption = '('#1076#1072'/'#1085#1077#1090')'
          DataBinding.DataField = 'NUMVALUE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 120
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 90
          TabOrder = 4
        end
        inherited edtSysName: TcxDBTextEdit
          Top = 63
          TabOrder = 3
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciValueEdit: TdxLayoutItem
            AutoAligns = []
            AlignHorz = ahCenter
            AlignVert = avCenter
            Enabled = False
            Visible = False
          end
          object lciNumValue: TdxLayoutItem [2]
            AutoAligns = [aaVertical]
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = chbxNumValue
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 483
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 211
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 239
        Width = 483
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 480
        Height = 211
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 483
        Height = 242
        ClientRectBottom = 218
        ClientRectRight = 483
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
        FloatLeft = 362
        FloatTop = 307
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
        SourceField = ValueForm.dsDataOWNER_OBJECT_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = ValueForm.dsDataOWNERNAME
      end>
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_ValueBool_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :ISSYSTEM,'
      '    :OWNER_OBJECT_ID,        '
      '    :NUMVALUE,    '
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEBOOL_ADD'
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
        DataType = ftFloat
        Name = 'NUMVALUE'
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
      '  fdc_ValueBool_Upd('
      '    :ID,'
      '    :NAME,    '
      '    :SYSNAME,'
      '    :NUMVALUE,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEBOOL_UPD'
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
        DataType = ftFloat
        Name = 'NUMVALUE'
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
