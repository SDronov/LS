inherited BPAgreementForm: TBPAgreementForm
  Width = 627
  Height = 560
  Caption = 'BPAgreementForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 611
    Height = 522
    ClientRectBottom = 498
    ClientRectRight = 611
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 605
        Height = 467
        inherited edtName: TcxDBTextEdit
          DataBinding.DataField = 'DOC_NO'
          Enabled = False
          Width = 94
        end
        inherited edtDescript: TcxDBMemo
          Top = 236
          Style.IsFontAssigned = True
          TabOrder = 8
          Height = 222
        end
        object cxDBDateEdit2: TcxDBDateEdit [2]
          Left = 53
          Top = 204
          DataBinding.DataField = 'FROM_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 6
          Width = 150
        end
        object cxDBDateEdit3: TcxDBDateEdit [3]
          Left = 330
          Top = 204
          DataBinding.DataField = 'TO_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 154
        end
        object edtDocNo: TcxDBTextEdit [4]
          Left = 102
          Top = 56
          DataBinding.DataField = 'DOC_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 247
        end
        object edtDocDate: TcxDBDateEdit [5]
          Left = 402
          Top = 56
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 167
        end
        object edtSUBJECT_ID: TfdcObjectLinkEdit [6]
          Left = 102
          Top = 143
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
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.IsFontAssigned = True
          TabOrder = 5
          OnBeforeAcceptObject = edtSUBJECT_IDBeforeAcceptObject
          Width = 484
        end
        object edtINN: TcxDBMaskEdit [7]
          Left = 102
          Top = 116
          DataBinding.DataField = 'SUBJ_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 180
        end
        object edtKPP: TcxDBMaskEdit [8]
          Left = 316
          Top = 116
          DataBinding.DataField = 'SUBJ_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 445
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
              Offsets.Left = 10
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSubject: TdxLayoutGroup [2]
            Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem1: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                Caption = #1048#1053#1053
                Control = edtINN
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem2: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                Offsets.Left = 10
                Control = edtKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciSUBJECT_ID: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Offsets.Top = 5
              Control = edtSUBJECT_ID
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup [3]
            Caption = #1056#1077#1096#1077#1085#1080#1077
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
          end
          object lcGeneralGroup3: TdxLayoutGroup [4]
            Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
            LayoutDirection = ldHorizontal
            object lcGeneralItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = '  '#1089':   '
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBDateEdit2
              ControlOptions.AutoAlignment = False
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem6: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = '  '#1087#1086':  '
              CaptionOptions.AlignHorz = taRightJustify
              Offsets.Left = 10
              Control = cxDBDateEdit3
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 611
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 467
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 495
        Width = 611
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 608
        Height = 467
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 611
        Height = 498
        ClientRectBottom = 474
        ClientRectRight = 611
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
  inherited ParamsHolder: TfdcParamsHolder
    Left = 184
    Top = 335
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_BP_Agreement_Lst'
      ' where ID = :ID')
    Left = 212
    Top = 335
    object dsDataDOC_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NO'
      Required = True
      Size = 10
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
      Required = True
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataSUBJ_NAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
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
    end
  end
  inherited srcData: TDataSource
    Left = 212
    Top = 363
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_bp_Agreement_add(pdocno => :doc_no,'
      '                                pdate => :DOC_DATE,'
      '                                psubjid => :SUBJECT_ID,'
      '                                pfromdate => :FROM_DATE,'
      '                                ptodate => :TO_DATE,'
      '                                pdescript => :descript);'
      'end;')
    Left = 240
    Top = 335
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
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_bp_Agreement_upd(pid => :id,'
      '                     pfromdate => :from_date,'
      '                     ptodate => :to_date,'
      '                pdescript => :descript);'
      'end;')
    Left = 268
    Top = 335
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
        DataType = ftUnknown
        Name = 'descript'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 324
    Top = 363
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 408
    Top = 335
  end
  inherited dsUpdateState: TfdcQuery
    Left = 352
    Top = 335
  end
  inherited srcState: TDataSource
    Left = 296
    Top = 363
  end
  inherited dsTransit: TfdcQuery
    Left = 324
    Top = 335
  end
  inherited dsState: TfdcQuery
    Left = 296
    Top = 335
  end
  inherited srcAccessLevel: TDataSource
    Left = 380
    Top = 363
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 380
    Top = 335
  end
end
