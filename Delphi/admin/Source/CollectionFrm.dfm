inherited CollectionForm: TCollectionForm
  Left = 360
  Top = 175
  Height = 341
  ActiveControl = edtName
  Caption = #1055#1086#1076#1073#1086#1088#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 307
    ClientRectBottom = 284
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 253
        inherited edtName: TcxDBTextEdit
          Left = 87
        end
        inherited edtDescript: TcxDBMemo
          Left = 87
          Top = 90
          Height = 127
          TabOrder = 3
        end
        object edtUserID: TfdcObjectLinkEdit [2]
          Left = 87
          Top = 36
          Width = 121
          Height = 21
          DataBinding.DataField = 'USERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'USER_ID'
          DataBinding.TypeSysName = 'User'
          DataBinding.SearchFormClass = 'TUserGridForm'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtColDate: TcxDBTextEdit [3]
          Left = 87
          Top = 63
          Width = 121
          Height = 21
          DataBinding.DataField = 'COLDATE'
          DataBinding.DataSource = srcData
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        object chbxDefCollection: TcxDBCheckBox [4]
          Left = 87
          Top = 223
          Width = 121
          Height = 21
          Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1088#1072#1073#1086#1095#1077#1081' '#1087#1086#1076#1073#1086#1088#1082#1086#1081
          DataBinding.DataField = 'DEFCOLLECTION'
          DataBinding.DataSource = srcData
          ParentColor = False
          Properties.Alignment = taLeftJustify
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = '1'
          Properties.ValueUnchecked = '0'
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 4
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciUserID: TdxLayoutItem [1]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtUserID
            ControlOptions.ShowBorder = False
          end
          object lciColDate: TdxLayoutItem [2]
            AutoAligns = [aaVertical]
            Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtColDate
            ControlOptions.ShowBorder = False
          end
          object lciDefCollection: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = ' '
            CaptionOptions.AlignHorz = taRightJustify
            Control = chbxDefCollection
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 253
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 281
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 253
      end
    end
    object tabContent: TcxTabSheet [1]
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      OnShow = tabContentShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 284
        ClientRectBottom = 261
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
      '  from fdc_Collection_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_COLLECTION_LST'
    object dsDataCOLDATE: TDateTimeField
      FieldName = 'COLDATE'
    end
    object dsDataUSER_ID: TFloatField
      FieldName = 'USER_ID'
    end
    object dsDataDEFCOLLECTION: TIntegerField
      FieldName = 'DEFCOLLECTION'
    end
    object dsDataCUR_USER_DEFCOLLECTION: TFloatField
      FieldName = 'CUR_USER_DEFCOLLECTION'
    end
    object dsDataUSERNAME: TStringField
      FieldName = 'USERNAME'
      Size = 1500
    end
    object dsDataLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 1500
    end
    object dsDataSTATENAME: TStringField
      FieldName = 'STATENAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Collection_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :USER_ID,   '
      '    :DESCRIPT,'
      '    :DEFCOLLECTION);'
      'end;')
    SourceServerObject = 'FDC_COLLECTION_ADD'
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
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEFCOLLECTION'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Collection_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :USER_ID,   '
      '    :DESCRIPT,'
      '    :DEFCOLLECTION);'
      'end;')
    SourceServerObject = 'FDC_COLLECTION_UPD'
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
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'USER_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEFCOLLECTION'
        ParamType = ptUnknown
      end>
  end
end
