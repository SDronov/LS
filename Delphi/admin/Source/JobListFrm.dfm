inherited JobListForm: TJobListForm
  Top = 228
  Height = 402
  ActiveControl = edtName
  Caption = 'JobListForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 375
    ClientRectBottom = 351
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 322
        inherited edtName: TcxDBTextEdit
          Left = 233
          Width = 315
        end
        inherited edtDescript: TcxDBMemo
          Left = 233
          Top = 171
          TabOrder = 7
          Height = 89
          Width = 185
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 233
          Top = 36
          DataBinding.DataField = 'JOB_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'JOB_ID'
          DataBinding.TypeSysName = 'Job'
          DataBinding.SearchFormClass = 'TJobGridForm'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 293
        end
        object cxDBDateEdit1: TcxDBDateEdit [3]
          Left = 233
          Top = 117
          DataBinding.DataField = 'WHEN'
          DataBinding.DataSource = srcData
          Properties.Kind = ckDateTime
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 129
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox [4]
          Left = 233
          Top = 63
          DataBinding.DataField = 'DIR'
          DataBinding.DataSource = srcData
          Properties.KeyFieldNames = 'DIRECTORY_NAME'
          Properties.ListColumns = <
            item
              Width = 1000
              FieldName = 'DIRECTORY_NAME'
            end
            item
              Width = 1000
              FieldName = 'DIRECTORY_PATH'
            end>
          Properties.ListSource = srcOraDirectories
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 293
        end
        object cxDBLookupComboBox2: TcxDBLookupComboBox [5]
          Left = 319
          Top = 144
          DataBinding.DataField = 'INTERVAL_UNITS'
          DataBinding.DataSource = srcData
          Properties.KeyFieldNames = 'TIMEUNIT_CODE'
          Properties.ListColumns = <
            item
              FieldName = 'TIMEUNIT_NAME'
            end>
          Properties.ListSource = srcTimeUnits
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 81
        end
        object cxDBTextEdit1: TcxDBTextEdit [6]
          Left = 233
          Top = 144
          DataBinding.DataField = 'INTERVAL'
          DataBinding.DataSource = srcData
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 80
        end
        object cxDBDateEdit2: TcxDBDateEdit [7]
          Left = 233
          Top = 90
          DataBinding.DataField = 'WHEN_LAST'
          DataBinding.DataSource = srcData
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavTop
            Visible = False
          end
          object lcGeneralItem9: TdxLayoutItem [1]
            Caption = #1058#1080#1087' '#1079#1072#1076#1072#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [2]
            Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBLookupComboBox1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem [3]
            Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBDateEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem1: TdxLayoutItem [4]
            Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1085#1086#1075#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBDateEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [5]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem3: TdxLayoutItem
              Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cxDBTextEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem5: TdxLayoutItem
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cxDBLookupComboBox2
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 322
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 348
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 322
      end
    end
    object cxTabSheet1: TcxTabSheet [1]
      Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1103
      ImageIndex = 1
      OnShow = cxTabSheet1Show
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 351
        ActivePage = tabChildObjects
        ClientRectBottom = 327
        ClientRectRight = 492
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 251
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 100
    Top = 251
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Left = 212
    Top = 251
  end
  inherited WebEditStyleController: TcxEditStyleController
    Left = 240
    Top = 251
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 156
    Top = 251
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Left = 184
    Top = 251
  end
  inherited imglAction: TImageList
    Left = 44
    Top = 251
  end
  inherited imglLarge: TImageList
    Left = 72
    Top = 251
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
    Left = 128
    Top = 251
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
        DataType = ftInteger
        Name = 'JOBLIST_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end>
    Left = 16
    Top = 279
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      '  from fdc_Job_List_Lst'
      ' where ID = :ID')
    Left = 44
    Top = 279
    object dsDataJOB_ID: TFloatField
      FieldName = 'JOB_ID'
    end
    object dsDataJOB_PARAMS: TBlobField
      FieldName = 'JOB_PARAMS'
    end
    object dsDataWHEN: TDateTimeField
      FieldName = 'WHEN'
    end
    object dsDataJOB_SUBMIT_ID: TFloatField
      FieldName = 'JOB_SUBMIT_ID'
    end
    object dsDataSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 4000
    end
    object dsDataDIR: TStringField
      FieldName = 'DIR'
      Size = 4000
    end
    object dsDataJOB_NAME: TStringField
      FieldName = 'JOB_NAME'
      Size = 250
    end
    object dsDataINTERVAL: TFloatField
      FieldName = 'INTERVAL'
    end
    object dsDataINTERVAL_UNITS: TStringField
      FieldName = 'INTERVAL_UNITS'
      Size = 4
    end
    object dsDataWHEN_LAST: TDateTimeField
      FieldName = 'WHEN_LAST'
    end
  end
  inherited srcData: TDataSource
    Left = 44
    Top = 307
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_JobList_Add('
      '    :JOB_ID,'
      '    :DIR,'
      '    :WHEN,'
      '    :INTERVAL,'
      '    :INTERVAL_UNITS);'
      'end;')
    Left = 72
    Top = 279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JOB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WHEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERVAL_UNITS'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_JobList_Upd('
      '    :ID,'
      '    :JOB_ID,'
      '    :DIR,'
      '    :WHEN,'
      '    :INTERVAL,'
      '    :INTERVAL_UNITS);'
      'end;')
    Left = 100
    Top = 279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'JOB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WHEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERVAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTERVAL_UNITS'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 156
    Top = 307
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 240
    Top = 279
  end
  inherited dsUpdateState: TfdcQuery
    Left = 184
    Top = 279
  end
  inherited srcState: TDataSource
    Left = 128
    Top = 307
  end
  inherited dsTransit: TfdcQuery
    Left = 156
    Top = 279
  end
  inherited dsState: TfdcQuery
    Left = 128
    Top = 279
  end
  inherited srcAccessLevel: TDataSource
    Left = 212
    Top = 307
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 212
    Top = 279
  end
  object dsOraDirectories: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select *'
      'from fdc_ora_directories')
    Left = 235
    Top = 210
    object dsOraDirectoriesOWNER: TStringField
      FieldName = 'OWNER'
      Size = 30
    end
    object dsOraDirectoriesDIRECTORY_NAME: TStringField
      FieldName = 'DIRECTORY_NAME'
      Size = 30
    end
    object dsOraDirectoriesDIRECTORY_PATH: TStringField
      FieldName = 'DIRECTORY_PATH'
      Size = 4000
    end
  end
  object srcOraDirectories: TDataSource
    DataSet = dsOraDirectories
    Left = 275
    Top = 210
  end
  object dsTimeUnits: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select '#39'SS'#39' timeunit_code,'#39#1057#1077#1082'.'#39' timeunit_name from dual'
      'union'
      'select '#39'MI'#39'  timeunit_code,'#39#1052#1080#1085'.'#39' timeunit_name from dual'
      'union '
      'select '#39'HH24'#39'  timeunit_code,'#39#1063#1072#1089'.'#39' timeunit_name from dual')
    Left = 355
    Top = 218
  end
  object srcTimeUnits: TDataSource
    DataSet = dsTimeUnits
    Left = 403
    Top = 218
  end
end
