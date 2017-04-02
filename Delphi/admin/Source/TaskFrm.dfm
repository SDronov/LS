inherited TaskForm: TTaskForm
  Caption = #1047#1072#1076#1072#1095#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ActivePage = tabUserGroup
    ClientRectBottom = 291
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 86
        end
        inherited edtDescript: TcxDBMemo
          Left = 86
          Top = 63
          TabOrder = 2
        end
        object edtSysName: TcxDBTextEdit [2]
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
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem1: TdxLayoutItem [1]
            Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSysName
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    object tabSysComponent: TcxTabSheet [1]
      Caption = #1050#1086#1084#1087#1086#1085#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabSysComponentShow
    end
    object tabUserGroup: TcxTabSheet [2]
      Caption = #1043#1088#1091#1087#1087#1099
      ImageIndex = 3
      OnShow = tabUserGroupShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 268
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
      '  from fdc_Task_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_TASK_LST'
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Task_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_TASK_ADD'
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
      '  fdc_Task_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SYSNAME,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_TASK_UPD'
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
