inherited HumanForm: THumanForm
  Left = 324
  Top = 177
  Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ActivePage = tabGeneral
    ClientRectBottom = 357
    ClientRectRight = 580
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Height = 351
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Width = 185
          Height = 89
        end
        inherited edtMiddleName: TcxDBTextEdit
          Width = 255
        end
        inherited edtOKPO: TcxDBTextEdit
          Enabled = False
        end
        inherited edtOGRN: TcxDBTextEdit
          Enabled = False
        end
        inherited edtBIC: TcxDBTextEdit
          Width = 121
        end
        inherited edtBirthLocation: TcxDBMemo
          Width = 477
        end
        inherited cmbxOpfDictID: TcxDBLookupComboBox
          Left = 540
          Width = 25
          Enabled = False
        end
        inherited edtSurName: TcxDBTextEdit
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup5: TdxLayoutGroup
            inherited lciShortName: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
            end
            inherited lciOpfDictID: TdxLayoutItem
              AlignHorz = ahRight
              Enabled = False
              Visible = False
            end
          end
          inherited lcGeneralGroup3: TdxLayoutGroup
            Enabled = False
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 351
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Top = 3
        Height = 351
      end
    end
    inherited tabChars: TcxTabSheet
      inherited pcChars: TcxPageControl
        ClientRectBottom = 334
        ClientRectRight = 580
        ClientRectTop = 0
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 334
        ClientRectRight = 580
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
end
