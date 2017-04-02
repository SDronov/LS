inherited LastCloseDayGridForm: TLastCloseDayGridForm
  Width = 340
  Height = 251
  HelpContext = 411
  Caption = 'LastCloseDayGridForm'
  PixelsPerInch = 115
  TextHeight = 16
  inherited pcMain: TcxPageControl
    Width = 332
    Height = 217
    ClientRectBottom = 217
    ClientRectRight = 332
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      TabVisible = False
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Width = 326
        Height = 211
        object cxDBDateEdit1: TcxDBDateEdit [0]
          Left = 175
          Top = 11
          Width = 344
          Height = 21
          DataBinding.DataField = 'DATETIMEVALUE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 0
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem1: TdxLayoutItem
            Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1079#1072#1082#1088#1099#1090#1099#1081' '#1076#1077#1085#1100':'
            Control = cxDBDateEdit1
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 332
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 211
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 214
        Width = 332
        Height = 3
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 329
        Top = 3
        Height = 211
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
        FloatLeft = 293
        FloatTop = 389
        FloatClientWidth = 23
        FloatClientHeight = 44
        ItemLinks = <
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end>
        Name = 'barTools'
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
    Session = MainData.Session
    SQL.Strings = (
      'select /*+ RULE FIRST_ROWS */ t.*'
      '  from fdc_Value_Lst t'
      ' where t.sysname='#39'LastCloseDate'#39)
    object dsDataDATETIMEVALUE: TDateTimeField
      FieldName = 'DATETIMEVALUE'
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_set_last_closed_day(:datetimevalue);'
      ' :id ::= 0;'
      'end;')
    ParamData = <
      item
        DataType = ftDate
        Name = 'datetimevalue'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_set_last_closed_day(:datetimevalue);'
      'end;')
    ParamData = <
      item
        DataType = ftDate
        Name = 'datetimevalue'
        ParamType = ptUnknown
      end>
  end
end
