inherited ServerComponentForm: TServerComponentForm
  Caption = #1057#1077#1088#1074#1077#1088#1085#1099#1081' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 291
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Height = 285
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 285
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Top = 3
        Height = 285
      end
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
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
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
      '  from fdc_Server_Component_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_SERVER_COMPONENT_LST'
  end
end
