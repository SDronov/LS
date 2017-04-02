inherited ContactForm: TContactForm
  Left = 310
  Top = 192
  Width = 460
  Height = 260
  Caption = #1050#1086#1085#1090#1072#1082#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 452
    Height = 226
    ClientRectBottom = 203
    ClientRectRight = 452
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 446
        Height = 172
        inherited edtName: TcxDBTextEdit
          Top = 36
          Width = 423
          TabOrder = 1
        end
        inherited edtDescript: TcxDBMemo
          Top = 63
          Width = 185
          Height = 89
          TabOrder = 2
        end
        object edtOwnerObjectID: TfdcObjectLinkEdit [2]
          Left = 60
          Top = 9
          Width = 121
          Height = 21
          DataBinding.DataField = 'OWNERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
          DataBinding.TypeSysName = 'Object'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          AcceptObjects = False
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem1: TdxLayoutItem [0]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtOwnerObjectID
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1050#1086#1085#1090#1072#1082#1090
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 452
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 172
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 200
        Width = 452
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 449
        Height = 172
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 452
        Height = 203
        ClientRectBottom = 180
        ClientRectRight = 452
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
        SourceField = dsDataOWNER_OBJECT_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataOWNERNAME
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Contact_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_CONTACT_LST'
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
  end
end
