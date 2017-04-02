inherited RegDocumentForm: TRegDocumentForm
  Left = 382
  Top = 204
  Width = 503
  Height = 287
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 495
    Height = 260
    ClientRectBottom = 237
    ClientRectRight = 495
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 489
        Height = 208
        inherited edtName: TcxDBTextEdit
          Left = 82
          Top = 178
          Width = 21
          Enabled = False
          TabOrder = 7
        end
        inherited edtDescript: TcxDBMemo
          Left = 82
          Top = 128
          Width = 185
          Height = 89
          TabOrder = 6
        end
        object edtOwnerObjectID: TfdcObjectLinkEdit [2]
          Left = 82
          Top = 9
          Width = 121
          Height = 21
          DataBinding.DataField = 'OWNER_NAME'
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
        object edtDocSerial: TcxDBTextEdit [3]
          Left = 82
          Top = 36
          Width = 63
          Height = 21
          DataBinding.DataField = 'DOCSERIAL'
          DataBinding.DataSource = srcData
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtDocNumber: TcxDBTextEdit [4]
          Left = 184
          Top = 36
          Width = 228
          Height = 21
          DataBinding.DataField = 'DOCNUMBER'
          DataBinding.DataSource = srcData
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object edtDocDate: TcxDBDateEdit [5]
          Left = 387
          Top = 36
          Width = 93
          Height = 21
          DataBinding.DataField = 'DOCDATE'
          DataBinding.DataSource = srcData
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        object edtStopDate: TcxDBDateEdit [6]
          Left = 82
          Top = 101
          Width = 97
          Height = 21
          DataBinding.DataField = 'STOPDATE'
          DataBinding.DataSource = srcData
          Style.StyleController = WebEditStyleController
          TabOrder = 5
        end
        object edtGrantee: TcxDBMemo [7]
          Left = 82
          Top = 63
          Width = 377
          Height = 32
          DataBinding.DataField = 'GRANTEE'
          DataBinding.DataSource = srcData
          Style.StyleController = WebEditStyleController
          TabOrder = 4
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciOwnerObjectID: TdxLayoutItem [0]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtOwnerObjectID
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciDocSerial: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1057#1077#1088#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocSerial
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem4: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
            object lciDocNumber: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1086#1084#1077#1088
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocNumber
              ControlOptions.ShowBorder = False
            end
          end
          object lciGrantee: TdxLayoutItem [2]
            Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtGrantee
            ControlOptions.ShowBorder = False
          end
          object lciStopDate: TdxLayoutItem [3]
            AutoAligns = [aaVertical]
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090' '#1076#1086
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtStopDate
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem [4]
          end
          inherited lciNameEdit: TdxLayoutItem [5]
            AutoAligns = []
            Enabled = False
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 495
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 208
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 234
        Width = 495
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 492
        Height = 208
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 495
        Height = 237
        ClientRectBottom = 214
        ClientRectRight = 495
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    Top = 155
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 155
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Top = 155
  end
  inherited WebEditStyleController: TcxEditStyleController
    Top = 155
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 155
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Top = 155
  end
  inherited imglAction: TImageList
    Left = 116
    Top = 155
  end
  inherited imglLarge: TImageList
    Left = 144
    Top = 155
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
    Top = 155
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Top = 183
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Reg_Document_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_REG_DOCUMENT_LST'
    Top = 183
    object dsDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsDataSTOPDATE: TDateTimeField
      FieldName = 'STOPDATE'
    end
    object dsDataDOCNUMBER: TStringField
      FieldName = 'DOCNUMBER'
      Size = 1500
    end
    object dsDataDOCSERIAL: TStringField
      FieldName = 'DOCSERIAL'
      Size = 1500
    end
    object dsDataGRANTEE: TStringField
      FieldName = 'GRANTEE'
      Size = 1500
    end
    object dsDataOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Left = 188
    Top = 211
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Reg_Document_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :OWNER_OBJECT_ID,'
      '    :DOCDATE,'
      '    :DOCNUMBER,'
      '    :DOCSERIAL,'
      '    :GRANTEE,'
      '    :STOPDATE,    '
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_REG_DOCUMENT_ADD'
    Top = 183
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
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCNUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCSERIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRANTEE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STOPDATE'
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
      '  fdc_Reg_Document_Upd('
      '    :ID,'
      '    :NAME,'
      '    :DOCDATE,'
      '    :DOCNUMBER,'
      '    :DOCSERIAL,'
      '    :GRANTEE,'
      '    :STOPDATE,    '
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_REG_DOCUMENT_UPD'
    Top = 183
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
        DataType = ftUnknown
        Name = 'DOCDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCNUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOCSERIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GRANTEE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STOPDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Top = 211
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Top = 183
  end
  inherited dsUpdateState: TfdcQuery
    Top = 183
  end
  inherited srcState: TDataSource
    Top = 211
  end
  inherited dsTransit: TfdcQuery
    Top = 183
  end
  inherited dsState: TfdcQuery
    Top = 183
  end
  inherited srcAccessLevel: TDataSource
    Top = 211
  end
  inherited dsAccessLevel: TfdcQuery
    Top = 183
  end
end
