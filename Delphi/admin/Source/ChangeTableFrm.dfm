inherited ChangeTableForm: TChangeTableForm
  Left = 347
  Top = 183
  Height = 416
  ActiveControl = nil
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 382
    ClientRectBottom = 358
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 327
        object edtEventType: TcxDBTextEdit [0]
          Left = 83
          Top = 36
          DataBinding.DataField = 'EVENTNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 121
        end
        object edtDate_From: TcxDBTextEdit [1]
          Left = 83
          Top = 90
          DataBinding.DataField = 'DATE_FROM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 121
        end
        object edtName: TcxDBTextEdit [2]
          Left = 42
          Top = 148
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 121
        end
        object edtSysName: TcxDBTextEdit [3]
          Left = 287
          Top = 148
          DataBinding.DataField = 'SYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 121
        end
        object edtTypeName: TcxDBTextEdit [4]
          Left = 42
          Top = 175
          DataBinding.DataField = 'TYPENAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 121
        end
        object edtTypeSysName: TcxDBTextEdit [5]
          Left = 300
          Top = 175
          DataBinding.DataField = 'TYPESYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 121
        end
        object edtUserName: TcxDBTextEdit [6]
          Left = 83
          Top = 9
          DataBinding.DataField = 'USERNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 121
        end
        object edtTableName: TcxDBTextEdit [7]
          Left = 83
          Top = 63
          DataBinding.DataField = 'TABLE_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem8: TdxLayoutItem
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            Control = edtUserName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem
            Tag = 13
            Caption = #1057#1086#1073#1099#1090#1080#1077
            Control = edtEventType
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem1: TdxLayoutItem
            Caption = #1058#1072#1073#1083#1080#1094#1072
            Control = edtTableName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem
            Tag = 13
            Caption = #1052#1086#1084#1077#1085#1090
            Control = edtDate_From
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup
            Caption = #1054#1073#1098#1077#1082#1090
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem4: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1084#1103
                Control = edtName
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem5: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
                Control = edtSysName
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem6: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1058#1080#1087
                Control = edtTypeName
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem7: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103' '#1090#1080#1087#1072
                Control = edtTypeSysName
                ControlOptions.ShowBorder = False
              end
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 327
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 355
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 327
      end
    end
    object tabColumns: TcxTabSheet
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 1
      OnShow = tabColumnsShow
    end
  end
  inherited ActionList: TActionList
    Left = 144
    Top = 207
    inherited actSave: TAction
      Visible = False
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 172
    Top = 207
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 284
    Top = 207
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 312
    Top = 207
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 228
    Top = 207
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 256
    Top = 207
  end
  inherited imglAction: TImageList
    Left = 340
    Top = 207
  end
  inherited imglLarge: TImageList
    Left = 368
    Top = 207
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
        FloatLeft = 466
        FloatTop = 203
        FloatClientWidth = 24
        FloatClientHeight = 48
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
    Left = 200
    Top = 207
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarButton1: TdxBarButton
      Caption = 'actTest'
      Category = 0
      Visible = ivAlways
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 144
    Top = 235
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'select *'
      'from'
      '  fdc_change_table_lst'
      'where id = :ID')
    Left = 172
    Top = 235
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    inherited dsDataID: TFloatField
      ReadOnly = True
    end
    object dsDataDATE_FROM: TDateTimeField
      FieldName = 'DATE_FROM'
      ReadOnly = True
    end
    object dsDataOBJECT_ID: TFloatField
      FieldName = 'OBJECT_ID'
      ReadOnly = True
    end
    object dsDataEVENT_TYPE_ID: TFloatField
      FieldName = 'EVENT_TYPE_ID'
      ReadOnly = True
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
      ReadOnly = True
    end
    object dsDataTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      ReadOnly = True
      Size = 30
    end
    object dsDataEVENTNAME: TStringField
      FieldName = 'EVENTNAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataUSERNAME: TStringField
      FieldName = 'USERNAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataSYSNAME: TStringField
      FieldName = 'SYSNAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      ReadOnly = True
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Left = 172
    Top = 263
  end
  inherited dsInsert: TfdcQuery
    Left = 200
    Top = 235
  end
  inherited dsUpdate: TfdcQuery
    Left = 228
    Top = 235
  end
end
