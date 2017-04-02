inherited ChangeKBKForm: TChangeKBKForm
  Left = 429
  Top = 297
  Height = 270
  Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#1084#1077#1078#1076#1091' '#1085#1077#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084#1080' '#1080' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084#1080' '#1050#1041#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 232
    ClientRectBottom = 208
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 177
        inherited edtName: TcxDBTextEdit
          Left = 71
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtDescript: TcxDBMemo
          Left = 71
          Top = 117
          Style.StyleController = OfficeEditStyleController
          TabOrder = 5
          Height = 91
        end
        object edtKBKFrom: TcxDBLookupComboBox [2]
          Left = 71
          Top = 36
          DataBinding.DataField = 'FROM_KBKCODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'FULLCODE'
          Properties.ListColumns = <
            item
              FieldName = 'FULLCODE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcKBK
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 145
        end
        object edtKBKTo: TcxDBLookupComboBox [3]
          Left = 71
          Top = 63
          DataBinding.DataField = 'TO_KBKCODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'FULLCODE'
          Properties.ListColumns = <
            item
              FieldName = 'FULLCODE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcKBKTo
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 145
        end
        object edtDateFrom: TcxDBDateEdit [4]
          Left = 71
          Top = 90
          DataBinding.DataField = 'DATE_BEGIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 121
        end
        object edtDateTo: TcxDBDateEdit [5]
          Left = 278
          Top = 90
          DataBinding.DataField = 'DATE_END'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavTop
            Visible = False
          end
          object lcGeneralItem1: TdxLayoutItem [1]
            Caption = #1050#1041#1050' '#1089
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtKBKFrom
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [2]
            Caption = #1050#1041#1050' '#1085#1072
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtKBKTo
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup2: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem3: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = edtDateFrom
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem4: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = edtDateTo
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 177
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 205
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 177
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 208
        ClientRectBottom = 184
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
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
        FloatClientWidth = 113
        FloatClientHeight = 53
        ItemLinks = <
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
      '  from fdc_change_kbk_Lst'
      ' where ID = :ID')
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataFROM_KBKCODE: TStringField
      FieldName = 'FROM_KBKCODE'
      Required = True
    end
    object dsDataTO_KBKCODE: TStringField
      FieldName = 'TO_KBKCODE'
      Required = True
    end
    object dsDataDATE_BEGIN: TDateTimeField
      FieldName = 'DATE_BEGIN'
      Required = True
    end
    object dsDataDATE_END: TDateTimeField
      FieldName = 'DATE_END'
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_change_kbk_add('
      '    :NAME,'
      '    :FROM_KBKCODE,'
      '    :TO_KBKCODE,'
      '    :DATE_BEGIN,'
      '    :DATE_END);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftUnknown
        Name = 'FROM_KBKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_KBKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_BEGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_END'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_change_kbk_upd('
      '      :ID,'
      '      :NAME,'
      '      :SHORTNAME,'
      '      :DESCRIPT,'
      '      :FROM_KBKCODE,'
      '      :TO_KBKCODE,'
      '      :DATE_BEGIN,'
      '      :DATE_END);'
      'end;')
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
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FROM_KBKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TO_KBKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_BEGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end>
  end
  object dsKBK: TOracleDataSet
    SQL.Strings = (
      'select distinct fullcode'
      '     , fmt_code'
      '--     , NVL2(edate,'#39'('#1087#1088#1077#1082#1088'.) '#39','#39#39')||name name '
      'from fdc_kbk_dict_lst fk order by 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000800000046554C4C434F444501000000000008000000464D
      545F434F4445010000000000}
    Session = MainData.Session
    Left = 19
    Top = 68
  end
  object srcKBK: TDataSource
    DataSet = dsKBK
    Left = 19
    Top = 116
  end
  object dsKBKTo: TOracleDataSet
    SQL.Strings = (
      'select distinct fullcode'
      '     , fmt_code'
      '--     , NVL2(edate,'#39'('#1087#1088#1077#1082#1088'.) '#39','#39#39')||name name '
      'from fdc_kbk_dict_lst fk '
      'where edate is null'
      'order by 1')
    QBEDefinition.QBEFieldDefs = {
      04000000020000000800000046554C4C434F444501000000000008000000464D
      545F434F4445010000000000}
    Session = MainData.Session
    Left = 83
    Top = 68
  end
  object srcKBKTo: TDataSource
    DataSet = dsKBKTo
    Left = 83
    Top = 116
  end
end
