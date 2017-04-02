inherited BPLicenceForm: TBPLicenceForm
  Left = 362
  Top = 205
  Width = 588
  Height = 559
  Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 572
    Height = 521
    ClientRectBottom = 497
    ClientRectRight = 572
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 566
        Height = 466
        inherited edtName: TcxDBTextEdit
          Left = 116
          DataBinding.DataField = 'DOC_NO'
          Enabled = False
          Width = 94
        end
        inherited edtDescript: TcxDBMemo
          Left = 116
          Top = 298
          TabOrder = 11
          Height = 159
        end
        object edtAGRMT_DATE: TcxDBDateEdit [2]
          Left = 358
          Top = 113
          DataBinding.DataField = 'AGRMT_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 99
        end
        object edtPayerINN: TcxDBMaskEdit [3]
          Left = 102
          Top = 170
          DataBinding.DataField = 'SUBJ_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 131
        end
        object edtKPP: TcxDBMaskEdit [4]
          Left = 339
          Top = 170
          DataBinding.DataField = 'SUBJ_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 136
        end
        object edtPayerName: TfdcObjectLinkEdit [5]
          Left = 102
          Top = 189
          DataBinding.DataField = 'SUBJ_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Broker;Bank'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
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
          TabOrder = 7
          OnBeforeAcceptObject = edtPayerNameBeforeAcceptObject
          Width = 354
        end
        object cxDBDateEdit2: TcxDBDateEdit [6]
          Left = 102
          Top = 247
          DataBinding.DataField = 'FROM_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 129
        end
        object cxDBDateEdit3: TcxDBDateEdit [7]
          Left = 345
          Top = 247
          DataBinding.DataField = 'TO_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 127
        end
        object edtDocNo: TcxDBTextEdit [8]
          Left = 102
          Top = 56
          DataBinding.DataField = 'DOC_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Properties.OnEditValueChanged = edtDocNoPropertiesEditValueChanged
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 159
        end
        object edtDocDate: TcxDBDateEdit [9]
          Left = 350
          Top = 56
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Properties.OnEditValueChanged = edtDocDatePropertiesEditValueChanged
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 145
        end
        object edtAGRMT_NO: TcxDBTextEdit [10]
          Left = 102
          Top = 113
          DataBinding.DataField = 'AGRMT_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 108
        end
        object lcbLevels: TfdcObjectLookupEdit [11]
          Left = 116
          Top = 276
          DataBinding.DataField = 'LEVEL_MARK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'Id'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Properties.ListOptions.ColumnSorting = False
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcLevelMark
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 449
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = #1053#1086#1084#1077#1088
            Enabled = False
            Visible = False
          end
          object lcGeneralGroup6: TdxLayoutGroup [1]
            Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
            LayoutDirection = ldHorizontal
            object lcGeneralItem7: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1086#1084#1077#1088
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocNo
              ControlOptions.AutoColor = True
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem8: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1076#1072#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup [2]
            Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
            Visible = False
            LayoutDirection = ldHorizontal
            object lcGeneralItem9: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1086#1084#1077#1088
              Control = edtAGRMT_NO
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem1: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1076#1072#1090#1072
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtAGRMT_DATE
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSubject: TdxLayoutGroup [3]
            Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem2: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                CaptionOptions.AlignVert = tavTop
                Control = edtPayerINN
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem3: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                CaptionOptions.AlignVert = tavTop
                Control = edtKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem4: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = edtPayerName
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup [4]
            Caption = #1056#1077#1096#1077#1085#1080#1077
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
          end
          object lcGeneralGroup3: TdxLayoutGroup [5]
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
            LayoutDirection = ldHorizontal
            object lcGeneralItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1089' '
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBDateEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem6: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = ' '#1087#1086
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBDateEdit3
              ControlOptions.ShowBorder = False
            end
          end
          object lcLevelMark: TdxLayoutItem [6]
            Tag = 13
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1091#1088#1086#1074#1085#1103' '#1050#1053#1055
            CaptionOptions.AlignHorz = taRightJustify
            Control = lcbLevels
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 572
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 466
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 494
        Width = 572
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 569
        Height = 466
      end
    end
    object tabBroker: TcxTabSheet [1]
      Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1077' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1080
      ImageIndex = 2
      OnShow = tabBrokerShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 572
        Height = 497
        ClientRectBottom = 473
        ClientRectRight = 572
      end
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 268
    Top = 59
    inherited LayoutWebLookAndFeel: TdxLayoutWebLookAndFeel
      Offsets.ItemOffset = 1
      Offsets.ItemsAreaOffsetHorz = 4
      Offsets.ItemsAreaOffsetVert = 2
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited imglLarge: TImageList
    Top = 67
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
        FloatClientWidth = 127
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
    SQL.Strings = (
      'select *'
      '  from fdc_BP_Licence_Lst'
      ' where ID = :ID')
    object dsDataDOC_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1103
      FieldName = 'DOC_NO'
      Required = True
      Size = 10
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1103
      FieldName = 'DOC_DATE'
      Required = True
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataSUBJ_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      FieldName = 'SUBJ_NAME'
      Required = True
      Size = 1500
    end
    object dsDataSUBJ_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJ_INN'
      Size = 12
    end
    object dsDataSUBJ_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJ_KPP'
      Size = 10
    end
    object dsDataFROM_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089
      FieldName = 'FROM_DATE'
      Required = True
    end
    object dsDataTO_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086
      FieldName = 'TO_DATE'
      Required = True
    end
    object dsDataAGRMT_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
      FieldName = 'AGRMT_NO'
      Required = True
      Size = 10
    end
    object dsDataAGRMT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
      FieldName = 'AGRMT_DATE'
      Required = True
    end
    object dsDataLEVEL_MARK: TIntegerField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1091#1088#1086#1074#1085#1103' '#1050#1053#1055
      FieldName = 'LEVEL_MARK'
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_bp_licence_add( pdocno => :doc_no,'
      '                              pdate => :DOC_DATE,'
      '                              psubjid => :SUBJECT_ID,'
      '                              pfromdate => :FROM_DATE,'
      '                              ptodate => :TO_DATE,'
      '                              pdescript => :descript,'
      '                              pAgrmtNo => :doc_no,'
      '                              pAgrmDate => :DOC_DATE,'
      '                              pLevelMark => :LEVEL_MARK );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LEVEL_MARK'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_bp_licence_upd(pid => :id,'
      '                     pfromdate => :from_date,'
      '                     ptodate => :to_date,'
      '                     pdescript => :descript);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object dsLevelMark: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300496400320000000100
      05004E616D650001000000000103000000D4D2D101010000000103000000D0D2
      D3}
    SortOptions = []
    Left = 315
    Top = 370
    object dsLevelMarkId: TIntegerField
      FieldName = 'Id'
    end
    object dsLevelMarkName: TStringField
      FieldName = 'Name'
      Size = 50
    end
  end
  object srcLevelMark: TDataSource
    DataSet = dsLevelMark
    Left = 395
    Top = 370
  end
end
