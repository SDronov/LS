inherited StateSchemeForm: TStateSchemeForm
  Left = 278
  Top = 252
  Height = 297
  Caption = #1057#1093#1077#1084#1072' '#1089#1086#1089#1090#1086#1103#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 263
    ClientRectBottom = 240
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 209
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Width = 185
          Height = 173
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 209
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 237
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 209
      end
    end
    object tabState: TcxTabSheet [1]
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1103
      OnShow = tabStateShow
    end
    object tabStateTransit: TcxTabSheet [2]
      Caption = #1055#1077#1088#1077#1093#1086#1076#1099
      OnShow = tabStateTransitShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 240
        ClientRectBottom = 217
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Scheme_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_STATE_SCHEME_LST'
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_State_Scheme_Add('
      '    :TYPESYSNAME,'
      '    :NAME,    '
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_STATE_SCHEME_ADD'
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
      '  fdc_State_Scheme_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_STATE_SCHEME_UPD'
  end
end
