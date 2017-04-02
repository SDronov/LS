inherited ValueDateTimeForm: TValueDateTimeForm
  Left = 324
  Top = 280
  Height = 296
  Caption = 'ValueDateTimeForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 258
    ClientRectBottom = 234
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 203
        inherited edtStringValue: TcxDBMemo [0]
          Left = 262
          Top = 92
          Enabled = False
          Properties.OnChange = nil
          TabOrder = 2
          Height = 18
          Width = 13
        end
        inherited edtName: TcxDBTextEdit [1]
          Width = 409
        end
        inherited edtDescript: TcxDBMemo [2]
          Top = 137
          TabOrder = 5
          Height = 89
          Width = 409
        end
        object edtDateTimeValue: TcxDBDateEdit [3]
          Left = 95
          Top = 41
          DataBinding.DataField = 'DATETIMEVALUE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Kind = ckDateTime
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 120
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
          object lciDateTimeValue: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtDateTimeValue
            ControlOptions.ShowBorder = False
          end
          inherited lciValueEdit: TdxLayoutItem
            AutoAligns = []
            AlignHorz = ahCenter
            AlignVert = avCenter
            Enabled = False
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 203
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 231
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 203
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 234
        ClientRectBottom = 210
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
      '  :ID ::= fdc_ValueDateTime_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :ISSYSTEM,'
      '    :OWNER_OBJECT_ID,     '
      '    :DATETIMEVALUE,    '
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEDATETIME_ADD'
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
        DataType = ftDateTime
        Name = 'DATETIMEVALUE'
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
      '  fdc_ValueDateTime_Upd('
      '    :ID,'
      '    :NAME,    '
      '    :SYSNAME,'
      '    :DATETIMEVALUE,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEDATETIME_UPD'
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
        DataType = ftDateTime
        Name = 'DATETIMEVALUE'
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
