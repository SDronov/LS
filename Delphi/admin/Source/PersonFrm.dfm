inherited PersonForm: TPersonForm
  Left = 476
  Top = 215
  Width = 588
  Height = 407
  ActiveControl = pcChars
  Caption = #1057#1091#1073#1098#1077#1082#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 572
    Height = 369
    ActivePage = tabChars
    ClientRectBottom = 345
    ClientRectRight = 572
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 566
        Height = 314
        inherited edtName: TcxDBTextEdit
          Left = 104
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 104
          Top = 260
          TabOrder = 14
          Height = 89
          Width = 185
        end
        object edtShortName: TcxDBTextEdit [2]
          Left = 104
          Top = 36
          DataBinding.DataField = 'SHORTNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 169
        end
        object edtFirstName: TcxDBTextEdit [3]
          Left = 104
          Top = 95
          DataBinding.DataField = 'FIRSTNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 169
        end
        object edtMiddleName: TcxDBTextEdit [4]
          Left = 330
          Top = 95
          DataBinding.DataField = 'MIDDLENAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 255
        end
        object edtINN: TcxDBTextEdit [5]
          Left = 104
          Top = 127
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 121
        end
        object edtKPP: TcxDBTextEdit [6]
          Left = 273
          Top = 127
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 121
        end
        object edtOKPO: TcxDBTextEdit [7]
          Left = 273
          Top = 154
          DataBinding.DataField = 'OKPO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 121
        end
        object edtOGRN: TcxDBTextEdit [8]
          Left = 104
          Top = 154
          DataBinding.DataField = 'OGRN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 121
        end
        object edtBIC: TcxDBTextEdit [9]
          Left = 432
          Top = 127
          DataBinding.DataField = 'BIC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 121
        end
        object edtBirthDate: TcxDBDateEdit [10]
          Left = 104
          Top = 186
          DataBinding.DataField = 'BIRTHDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 121
        end
        object edtBirthYear: TcxDBSpinEdit [11]
          Left = 306
          Top = 186
          DataBinding.DataField = 'BIRTHYEAR'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 12
          Width = 87
        end
        object edtBirthLocation: TcxDBMemo [12]
          Left = 104
          Top = 213
          DataBinding.DataField = 'BIRTHLOCATION'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 13
          Height = 36
          Width = 477
        end
        object cmbxOpfDictID: TcxDBLookupComboBox [13]
          Left = 330
          Top = 36
          DataBinding.DataField = 'OPF_DICT_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              SortOrder = soAscending
              Width = 140
              FieldName = 'NAME'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcDictOpf
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          OnDblClick = cmbxOpfDictIDDblClick
          Width = 461
        end
        object edtSurName: TcxDBTextEdit [14]
          Left = 104
          Top = 68
          DataBinding.DataField = 'SURNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          end
          object lcGeneralGroup5: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciShortName: TdxLayoutItem
              Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtShortName
              ControlOptions.ShowBorder = False
            end
            object lciOpfDictID: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1055#1060
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxOpfDictID
              ControlOptions.ShowBorder = False
            end
          end
          object lciSurName: TdxLayoutItem [2]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1060#1072#1084#1080#1083#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Offsets.Top = 5
            Control = edtSurName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup2: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciFirstName: TdxLayoutItem
              Caption = #1048#1084#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtFirstName
              ControlOptions.ShowBorder = False
            end
            object lciMiddleName: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtMiddleName
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup1: TdxLayoutGroup [4]
            Offsets.Top = 5
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciINN: TdxLayoutItem
              Caption = #1048#1053#1053
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtINN
              ControlOptions.ShowBorder = False
            end
            object lciKPP: TdxLayoutItem
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              Offsets.Left = 10
              Control = edtKPP
              ControlOptions.ShowBorder = False
            end
            object lciBIC: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1041#1048#1050
              CaptionOptions.AlignHorz = taRightJustify
              Offsets.Left = 10
              Control = edtBIC
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup3: TdxLayoutGroup [5]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciOGRN: TdxLayoutItem
              Caption = #1054#1043#1056#1053
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtOGRN
              ControlOptions.ShowBorder = False
            end
            object lciOKPO: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1054#1050#1055#1054
              CaptionOptions.AlignHorz = taRightJustify
              Offsets.Left = 10
              Control = edtOKPO
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup [6]
            Offsets.Top = 5
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciBirthDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtBirthDate
              ControlOptions.ShowBorder = False
            end
            object lciBirthYear: TdxLayoutItem
              Caption = #1043#1086#1076' '#1088#1086#1078#1076#1077#1085#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtBirthYear
              ControlOptions.ShowBorder = False
            end
          end
          object lciBirthLocation: TdxLayoutItem [7]
            Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtBirthLocation
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Offsets.Top = 5
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 572
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 314
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 342
        Width = 572
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 569
        Height = 314
      end
    end
    object tabChars: TcxTabSheet [1]
      Caption = #1044#1072#1085#1085#1099#1077
      OnShow = tabCharsShow
      object pcChars: TcxPageControl
        Left = 0
        Top = 0
        Width = 572
        Height = 345
        ActivePage = tabAddress
        Align = alClient
        Style = 5
        TabOrder = 0
        TabPosition = tpBottom
        ClientRectBottom = 321
        ClientRectRight = 572
        ClientRectTop = 0
        object tabAddress: TcxTabSheet
          Caption = #1040#1076#1088#1077#1089#1072
          OnShow = tabAddressShow
        end
        object tabRegDocument: TcxTabSheet
          Caption = #1056#1077#1075'.'#1076#1086#1082#1091#1084#1077#1085#1090#1099
          ImageIndex = 1
          OnShow = tabRegDocumentShow
        end
        object tabContact: TcxTabSheet
          Caption = #1050#1086#1085#1090#1072#1082#1090#1099
          ImageIndex = 2
          OnShow = tabContactShow
        end
        object tabCharsFake: TcxTabSheet
          Caption = 'tabCharsFake'
          ImageIndex = 3
          TabVisible = False
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 572
        Height = 345
        ActivePage = tabChildObjects
        ClientRectBottom = 321
        ClientRectRight = 572
      end
    end
  end
  inherited ActionList: TActionList
    Left = 184
    Top = 235
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 268
    Top = 235
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 380
    Top = 235
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 408
    Top = 235
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 324
    Top = 235
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 352
    Top = 235
  end
  inherited imglAction: TImageList
    Left = 212
    Top = 235
  end
  inherited imglLarge: TImageList
    Left = 240
    Top = 235
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
    Left = 296
    Top = 235
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 184
    Top = 263
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Person_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_PERSON_LST'
    Left = 216
    Top = 263
    object dsDataSURNAME: TStringField
      FieldName = 'SURNAME'
      Size = 1500
    end
    object dsDataFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 1500
    end
    object dsDataMIDDLENAME: TStringField
      FieldName = 'MIDDLENAME'
      Size = 1500
    end
    object dsDataOGRN: TStringField
      FieldName = 'OGRN'
      Size = 1500
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 1500
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 1500
    end
    object dsDataOKPO: TStringField
      FieldName = 'OKPO'
      Size = 1500
    end
    object dsDataBIC: TStringField
      FieldName = 'BIC'
      Size = 1500
    end
    object dsDataBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object dsDataBIRTHYEAR: TIntegerField
      FieldName = 'BIRTHYEAR'
    end
    object dsDataBIRTHLOCATION: TStringField
      FieldName = 'BIRTHLOCATION'
      Size = 1500
    end
    object dsDataOPF_DICT_ID: TFloatField
      FieldName = 'OPF_DICT_ID'
    end
    object dsDataOPF_NAME: TStringField
      FieldName = 'OPF_NAME'
      Size = 4000
    end
  end
  inherited srcData: TDataSource
    Left = 212
    Top = 291
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Person_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :SHORTNAME,    '
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDDLENAME,'
      '    :OGRN,'
      '    :INN,'
      '    :KPP,'
      '    :OKPO,'
      '    :BIC,'
      '    :BIRTHDATE, '
      '    :BIRTHYEAR,'
      '    :BIRTHLOCATION,'
      '    :OPF_Dict_ID,      '
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_PERSON_ADD'
    Left = 240
    Top = 263
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
        DataType = ftUnknown
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SURNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIRSTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MIDDLENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHYEAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHLOCATION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPF_Dict_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Person_Upd('
      '    :ID,'
      '    :NAME,'
      '    :SHORTNAME,    '
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDDLENAME,'
      '    :OGRN,'
      '    :INN,'
      '    :KPP,'
      '    :OKPO,'
      '    :BIC,'
      '    :BIRTHDATE, '
      '    :BIRTHYEAR,'
      '    :BIRTHLOCATION,'
      '    :OPF_Dict_ID,      '
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_PERSON_UPD'
    Left = 268
    Top = 263
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
        Name = 'SHORTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SURNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIRSTNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MIDDLENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OGRN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHYEAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIRTHLOCATION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OPF_Dict_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 324
    Top = 291
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 408
    Top = 263
  end
  inherited dsUpdateState: TfdcQuery
    Left = 352
    Top = 263
  end
  inherited srcState: TDataSource
    Left = 296
    Top = 291
  end
  inherited dsTransit: TfdcQuery
    Left = 324
    Top = 263
  end
  inherited dsState: TfdcQuery
    Left = 296
    Top = 263
  end
  inherited srcAccessLevel: TDataSource
    Left = 380
    Top = 291
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 380
    Top = 263
  end
  object dsDictOpf: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select D.ID,'
      '          D.OwnerName,'
      '          D.Name,'
      '          D.Code,'
      '          D.Code2          '
      '  from  fdc_Dict_Lst D '
      ' where D.TypeSysName = '#39'DictOPF'#39
      '   ')
    SourceServerObject = 'FDC_DICT_LST'
    AfterOpen = dsDictOpfAfterOpen
    Left = 484
    Top = 281
    object dsDictOpfID: TFloatField
      FieldName = 'ID'
    end
    object dsDictOpfName: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDictOpfOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDictOpfCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsDictOpfCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
  end
  object srcDictOpf: TDataSource
    DataSet = dsDictOpf
    Left = 516
    Top = 281
  end
end
