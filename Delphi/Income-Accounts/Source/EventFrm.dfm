inherited EventForm: TEventForm
  ActiveControl = pcService
  Caption = #1057#1086#1073#1099#1090#1080#1077
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    ActivePage = tabService
    ClientRectBottom = 280
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 89
          Properties.ReadOnly = True
          Style.Color = clSilver
          Width = 553
        end
        inherited edtDescript: TcxDBMemo
          Left = 89
          Top = 168
          Properties.ReadOnly = True
          Style.Color = clSilver
          TabOrder = 6
          Height = 116
          Width = 242
        end
        object edtUser: TfdcObjectLinkEdit [2]
          Left = 89
          Top = 90
          DataBinding.DataField = 'USERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'USER_ID'
          DataBinding.TypeSysName = 'User'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          AcceptObjects = False
          Width = 215
        end
        object edtObject: TfdcObjectLinkEdit [3]
          Left = 89
          Top = 51
          DataBinding.DataField = 'OBJECTNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OBJECT_ID'
          DataBinding.TypeSysName = 'Object'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          AcceptObjects = False
          Width = 158
        end
        object edtProgram: TcxDBTextEdit [4]
          Left = 291
          Top = 129
          DataBinding.DataField = 'PROGRAM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 183
        end
        object edtMachine: TcxDBTextEdit [5]
          Left = 89
          Top = 129
          DataBinding.DataField = 'MACHINE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 158
        end
        object edtMoment: TcxDBDateEdit [6]
          Left = 291
          Top = 90
          DataBinding.DataField = 'MOMENT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 183
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciObject: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1054#1073#1098#1077#1082#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtObject
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciUser: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1057#1086#1079#1076#1072#1083
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtUser
                ControlOptions.ShowBorder = False
              end
              object lciMoment: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1052#1086#1084#1077#1085#1090
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtMoment
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciMachine: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1086#1084#1087#1100#1102#1090#1077#1088
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtMachine
                ControlOptions.ShowBorder = False
              end
              object lciProgram: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1077
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtProgram
                ControlOptions.ShowBorder = False
              end
            end
          end
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ActivePage = tabRelations
        ClientRectBottom = 252
        ClientRectRight = 492
        ClientRectTop = 0
        inherited tabAccess: TcxTabSheet
          Enabled = False
          TabVisible = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSave: TAction
      Visible = False
    end
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -20
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
    ReadOnly = True
    SQL.Strings = (
      'select *'
      '  from fdc_Event_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_EVENT_LST'
    inherited dsDataSHORTNAME: TStringField
      Size = 0
    end
    inherited dsDataSYSNAME: TStringField
      Size = 0
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataOBJECT_ID: TFloatField
      FieldName = 'OBJECT_ID'
    end
    object dsDataMOMENT: TDateTimeField
      FieldName = 'MOMENT'
    end
    object dsDataLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 1500
    end
    object dsDataPROGRAM: TStringField
      FieldName = 'PROGRAM'
      Size = 1500
    end
    object dsDataMACHINE: TStringField
      FieldName = 'MACHINE'
      Size = 1500
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object dsDataUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 1500
    end
    object dsDataOBJECTNAME: TStringField
      FieldName = 'OBJECTNAME'
      Size = 1500
    end
    object dsDataOBJECTTYPEID: TFloatField
      FieldName = 'OBJECTTYPEID'
    end
    object dsDataREFTYPENAME: TStringField
      FieldName = 'REFTYPENAME'
      Size = 1500
    end
    object dsDataREFTYPESYSNAME: TStringField
      FieldName = 'REFTYPESYSNAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  null;'
      'end;')
    SourceServerObject = 'NULL'
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  null;'
      'end;')
    SourceServerObject = 'NULL'
  end
end
