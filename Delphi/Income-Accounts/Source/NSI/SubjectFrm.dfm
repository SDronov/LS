inherited SubjectForm: TSubjectForm
  Left = 582
  Top = 254
  Width = 747
  Height = 444
  HelpContext = 32
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 739
    Height = 417
    ActivePage = tabBroker
    ClientRectBottom = 393
    ClientRectRight = 739
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 561
        Height = 1
        Align = alNone
        Visible = False
        inherited edtName: TcxDBTextEdit
          Top = 15
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 42
          Height = 17
          Width = 415
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [0]
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AutoAligns = []
            CaptionOptions.AlignVert = tavCenter
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 739
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 364
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 390
        Width = 739
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 736
        Height = 364
      end
      object lcMain: TdxLayoutControl
        Left = 3
        Top = 26
        Width = 733
        Height = 364
        Align = alClient
        DragMode = dmAutomatic
        ParentBackground = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnStartDrag = tabGeneralStartDrag
        AutoContentSizes = [acsWidth, acsHeight]
        AutoControlTabOrders = False
        LookAndFeel = LayoutWebLookAndFeel
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 59
          Top = 90
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 449
        end
        object edtOKPO: TcxDBMaskEdit
          Left = 319
          Top = 9
          DataBinding.DataField = 'OKPO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,10}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 142
        end
        object edtINN: TcxDBMaskEdit
          Left = 59
          Top = 36
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 141
        end
        object edtOGRN: TcxDBMaskEdit
          Left = 59
          Top = 9
          DataBinding.DataField = 'OGRN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,15}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 63
        end
        object edtAddress: TcxDBTextEdit
          Left = 59
          Top = 117
          DataBinding.DataField = 'ADDRESS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 340
        end
        object edtPhone: TcxDBTextEdit
          Left = 59
          Top = 144
          DataBinding.DataField = 'PHONE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 193
        end
        object edtFax: TcxDBTextEdit
          Left = 319
          Top = 144
          DataBinding.DataField = 'FAX'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 203
        end
        object edtTelex: TcxDBTextEdit
          Left = 59
          Top = 171
          DataBinding.DataField = 'TELEX'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 193
        end
        object edtSOATO: TcxDBMaskEdit
          Left = 319
          Top = 36
          DataBinding.DataField = 'SOATO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,4}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 104
        end
        object edtTeletype: TcxDBTextEdit
          Left = 319
          Top = 171
          DataBinding.DataField = 'TELETYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 10
          Width = 150
        end
        object edtKPP: TcxDBMaskEdit
          Left = 59
          Top = 63
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 193
        end
        object edtTeleGraph: TcxDBTextEdit
          Left = 526
          Top = 171
          DataBinding.DataField = 'TELEGRAPH'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 193
        end
        object dxLayoutGroup3s: TdxLayoutGroup
          AutoAligns = [aaVertical]
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutGroup2s: TdxLayoutGroup
            AutoAligns = [aaHorizontal]
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcMainGroup1s: TdxLayoutGroup
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              ShowCaption = False
              ShowBorder = False
              object lcMainGroup3s: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcMainGroup4s: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcGeneralItem3: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    Caption = #1054#1043#1056#1053
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtOGRN
                    ControlOptions.ShowBorder = False
                  end
                  object lcGeneralItem2: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    AlignmentConstraint = lcMainAlignmentConstraint2
                    Caption = #1048#1053#1053
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtINN
                    ControlOptions.ShowBorder = False
                  end
                  object lcGeneralItem11: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    AlignmentConstraint = dxLayoutAlignmentConstraint1
                    Caption = #1050#1055#1055
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtKPP
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainGroup5s: TdxLayoutGroup
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcGeneralItem1: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    AlignmentConstraint = lcMainAlignmentConstraint2
                    Caption = #1050#1086#1076' '#1054#1050#1055#1054
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtOKPO
                    ControlOptions.ShowBorder = False
                  end
                  object lcGeneralItem9: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    AlignmentConstraint = dxLayoutAlignmentConstraint1
                    Caption = #1050#1086#1076' '#1057#1054#1040#1058#1054
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtSOATO
                    ControlOptions.ShowBorder = False
                  end
                end
              end
              object lciNames: TdxLayoutItem
                AutoAligns = [aaHorizontal]
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                CaptionOptions.AlignHorz = taRightJustify
                LookAndFeel = LayoutWebLookAndFeel
                Control = cxDBTextEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem4: TdxLayoutItem
                AutoAligns = [aaHorizontal]
                Caption = #1040#1076#1088#1077#1089
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtAddress
                ControlOptions.ShowBorder = False
              end
              object lcMainGroup2s: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcMainGroup6s: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcGeneralItem5: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1058#1077#1083#1077#1092#1086#1085
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtPhone
                    ControlOptions.ShowBorder = False
                  end
                  object lcGeneralItem8: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    Caption = #1058#1077#1083#1077#1082#1089
                    CaptionOptions.AlignHorz = taRightJustify
                    LookAndFeel = LayoutWebLookAndFeel
                    Control = edtTelex
                    ControlOptions.ShowBorder = False
                  end
                end
                object lcMainGroup7s: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcGeneralItem6: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    Caption = #1058#1077#1083#1077#1092#1072#1082#1089
                    CaptionOptions.AlignHorz = taRightJustify
                    Control = edtFax
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainGroup8s: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lcGeneralItem10: TdxLayoutItem
                      AutoAligns = [aaVertical]
                      AlignHorz = ahClient
                      Caption = #1058#1077#1083#1077#1090#1072#1081#1087
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = edtTeletype
                      ControlOptions.ShowBorder = False
                    end
                    object lcGeneralItem12: TdxLayoutItem
                      Caption = #1058#1077#1083#1077#1075#1088#1072#1092
                      CaptionOptions.AlignHorz = taRightJustify
                      Control = edtTeleGraph
                      ControlOptions.ShowBorder = False
                    end
                  end
                end
              end
            end
          end
        end
        object dxLayoutAlignmentConstraint1: TdxLayoutAlignmentConstraint
        end
        object lcMainAlignmentConstraint2: TdxLayoutAlignmentConstraint
          Kind = ackRight
        end
      end
    end
    object tabDocList: TcxTabSheet [1]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabDocListShow
      object pcDocList: TcxPageControl
        Left = 0
        Top = 0
        Width = 739
        Height = 393
        Align = alClient
        LookAndFeel.Kind = lfStandard
        TabOrder = 0
        TabPosition = tpBottom
        OnChange = pcDocListChange
        ClientRectBottom = 391
        ClientRectLeft = 2
        ClientRectRight = 737
        ClientRectTop = 2
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 739
        Height = 393
        ClientRectBottom = 369
        ClientRectRight = 739
      end
    end
    object tabBroker: TcxTabSheet
      Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1103
      ImageIndex = 4
      OnShow = tabBrokerShow
    end
    object tabFilial: TcxTabSheet
      Caption = #1060#1080#1083#1080#1072#1083#1099
      ImageIndex = 5
      OnShow = tabFilialShow
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
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Subject_Lst'
      ' where ID = :ID')
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      Required = True
    end
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 200
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataFULL_NAME: TStringField
      DisplayLabel = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      OnValidate = dsDataValidate
      Size = 10
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Required = True
      OnValidate = dsDataValidate
      Size = 12
    end
    object dsDataOGRN: TStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
      OnValidate = dsDataValidate
      Size = 30
    end
    object dsDataSOATO: TStringField
      DisplayLabel = #1057#1054#1040#1058#1054
      FieldName = 'SOATO'
      OnValidate = dsDataValidate
      Size = 8
    end
    object dsDataPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Size = 30
    end
    object dsDataFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      DisplayLabel = #1058#1077#1083#1077#1082#1089
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      DisplayLabel = #1058#1077#1083#1077#1075#1088#1072#1092
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1090#1072#1081#1087
      FieldName = 'TELETYPE'
      Size = 100
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      OnValidate = dsDataValidate
      Size = 10
    end
    object dsDataPARENT_ID: TFloatField
      FieldName = 'PARENT_ID'
    end
  end
end
