inherited ValueNumberForm: TValueNumberForm
  Left = 256
  Top = 257
  Height = 289
  Caption = 'ValueNumberForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 251
    ClientRectBottom = 227
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 196
        inherited edtName: TcxDBTextEdit
          Width = 409
        end
        inherited edtDescript: TcxDBMemo
          Top = 137
          TabOrder = 5
          Height = 113
          Width = 409
        end
        object edtNumValue: TcxDBSpinEdit [2]
          Left = 95
          Top = 41
          DataBinding.DataField = 'NUMVALUE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.ValueType = vtFloat
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          Width = 120
        end
        inherited edtStringValue: TcxDBMemo
          Left = 255
          Top = 87
          Enabled = False
          Properties.OnChange = nil
          Width = 27
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 105
          TabOrder = 4
        end
        inherited edtSysName: TcxDBTextEdit
          Top = 73
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
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtNumValue
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 196
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 224
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 196
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 227
        ClientRectBottom = 203
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
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
        FloatClientHeight = 81
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
      '  :ID ::= fdc_ValueNumber_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :ISSYSTEM,'
      '    :OWNER_OBJECT_ID,     '
      '    :NUMVALUE,   '
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUENUMBER_ADD'
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
      '  fdc_ValueNumber_Upd('
      '    :ID,'
      '    :NAME,   '
      '    :SYSNAME,'
      '    :NUMVALUE,    '
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUENUMBER_UPD'
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
