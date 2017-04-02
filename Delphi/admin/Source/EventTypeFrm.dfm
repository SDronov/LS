inherited EventTypeForm: TEventTypeForm
  Caption = #1058#1080#1087' '#1089#1086#1073#1099#1090#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ClientRectBottom = 291
    ClientRectRight = 555
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Height = 89
        end
        inherited edtShortName: TcxDBTextEdit
          Width = 121
        end
        inherited edtSysName: TcxDBTextEdit
          Width = 121
        end
        inherited edtParentObjectTypeID: TfdcObjectLinkEdit
          Width = 121
        end
        inherited edtTableName: TcxDBTextEdit
          Width = 121
        end
        inherited edtStateSchemeID: TfdcObjectLinkEdit
          Width = 121
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 268
        ClientRectRight = 555
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
        FloatLeft = 330
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
      '  from fdc_Event_Type_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_EVENT_TYPE_LST'
  end
end
