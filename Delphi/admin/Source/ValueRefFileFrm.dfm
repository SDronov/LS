inherited ValueRefFileForm: TValueRefFileForm
  Height = 294
  Caption = #1040#1090#1088#1080#1073#1091#1090' '#1089#1089#1099#1083#1082#1080' '#1085#1072' '#1092#1072#1081#1083
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 260
    ClientRectBottom = 237
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 206
        inherited edtStringValue: TcxDBMemo
          Top = 95
        end
        inherited edtName: TcxDBTextEdit
          Left = 95
          Width = 396
        end
        inherited edtDescript: TcxDBMemo
          Left = 95
          Width = 396
          Height = 73
        end
        inherited edtRefObjectID: TfdcObjectLinkEdit
          Left = 95
          Width = 121
          DataBinding.TypeSysName = 'File'
          DataBinding.SearchFormClass = 'TFileGridForm'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Left = 95
          Width = 396
        end
        inherited edtSysName: TcxDBTextEdit
          Left = 95
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciRefObjectID: TdxLayoutItem
            Caption = #1060#1072#1081#1083' *'
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 206
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 234
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 206
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 237
        ClientRectBottom = 214
        ClientRectRight = 492
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
        FloatLeft = 416
        FloatTop = 240
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
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_ValueRefFile_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :ISSYSTEM,'
      '    :OWNER_OBJECT_ID,        '
      '    :REF_OBJECT_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEREFFILE_ADD'
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
      '  fdc_ValueRefFile_Upd('
      '    :ID,'
      '    :NAME,   '
      '    :SYSNAME,'
      '    :REF_OBJECT_ID,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_VALUEREFFILE_UPD'
  end
end
