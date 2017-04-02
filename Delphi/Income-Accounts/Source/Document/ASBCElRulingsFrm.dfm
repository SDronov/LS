inherited ASBCElRulingsForm: TASBCElRulingsForm
  Left = 262
  Top = 251
  Width = 871
  Height = 589
  HelpContext = 432
  Caption = #1055#1088#1086#1095#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'-'#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 855
    Height = 551
    ClientRectBottom = 527
    ClientRectRight = 855
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 849
        Height = 496
        inherited edtName: TcxDBTextEdit
          Left = 134
          Top = 373
          Enabled = False
          TabOrder = 21
          Width = 425
        end
        inherited edtDescript: TcxDBMemo
          Left = 134
          Top = 398
          Enabled = False
          TabOrder = 22
          Height = 91
          Width = 409
        end
        object edtPayer: TfdcObjectLinkEdit [2]
          Left = 134
          Top = 169
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Broker;'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          Enabled = False
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
          TabOrder = 12
          Width = 501
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [3]
          Left = 134
          Top = 9
          DataBinding.DataField = 'DOCNUMB'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.BeepOnError = True
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 143
        end
        object cxDBDateEdit1: TcxDBDateEdit [4]
          Left = 339
          Top = 9
          DataBinding.DataField = 'DOCDATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 121
        end
        object cxDBMaskEdit2: TcxDBMaskEdit [5]
          Left = 134
          Top = 115
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Properties.OnValidate = cxDBMaskEdit2PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 143
        end
        object cxLabel1: TcxLabel [6]
          Left = 696
          Top = 9
          Enabled = False
          ParentColor = False
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.HotTrack = False
        end
        object cxDBComboBox2: TcxDBComboBox [7]
          Left = 299
          Top = 142
          DataBinding.DataField = 'METH_MOVE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.Items.Strings = (
            #1057#1041
            #1053#1041
            #1052#1055
            #1058#1056
            #1044#1055
            #1051#1040
            #1043#1056
            #1055#1058)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 70
        end
        object chBIsActive: TcxDBCheckBox [8]
          Left = 21
          Top = 333
          Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
          DataBinding.DataField = 'IS_ACTIVE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 172
        end
        object edtActivationDate: TcxDBDateEdit [9]
          Left = 279
          Top = 333
          DataBinding.DataField = 'ACTIVATION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 146
        end
        object cxDBCurrencyEdit1: TcxDBCurrencyEdit [10]
          Left = 134
          Top = 142
          DataBinding.DataField = 'SUM_RUB'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnValidate = cxDBCurrencyEdit1PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 142
        end
        object edtOverridedTPO: TfdcObjectLinkEdit [11]
          Left = 134
          Top = 61
          DataBinding.DataField = 'ANNUL_DECLNO'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OVERRIDEDDOCID'
          DataBinding.TypeSysName = 'TPO'
          DataBinding.SearchFormClass = 'TTPOGridForm'
          Enabled = False
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
          Style.ButtonStyle = btsHotFlat
          TabOrder = 4
          OnBeforeAcceptObject = edtOverridedTPOBeforeAcceptObject
          Width = 316
        end
        object cxDBCheckBox1: TcxDBCheckBox [12]
          Left = 9
          Top = 194
          Caption = #1070#1088'. '#1083#1080#1094#1086
          DataBinding.DataField = 'SJURPERSON'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentColor = False
          ParentFont = False
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Width = 865
        end
        object cxDBMaskEdit3: TcxDBMaskEdit [13]
          Left = 134
          Top = 221
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 121
        end
        object cxDBMaskEdit4: TcxDBMaskEdit [14]
          Left = 369
          Top = 221
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 16
          Width = 121
        end
        object cxDBTextEdit1: TcxDBTextEdit [15]
          Left = 540
          Top = 221
          DataBinding.DataField = 'SPASSPORT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 17
          Width = 201
        end
        object cxDBDateEdit3: TcxDBDateEdit [16]
          Left = 134
          Top = 34
          DataBinding.DataField = 'REG_DATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 121
        end
        object edtEXP: TcxDBDateEdit [17]
          Left = 369
          Top = 34
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 121
        end
        object edtvaldocnumb: TcxDBTextEdit [18]
          Left = 134
          Top = 88
          DataBinding.DataField = 'VALDOC_NUMB'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 121
        end
        object edtvaldocdate: TcxDBDateEdit [19]
          Left = 369
          Top = 88
          DataBinding.DataField = 'VALDOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 321
        end
        object edtstatusforall: TcxDBTextEdit [20]
          Left = 339
          Top = 115
          DataBinding.DataField = 'SSTATUS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        object edtUIN: TcxDBTextEdit [21]
          Left = 134
          Top = 248
          DataBinding.DataField = 'UIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 15
          Width = 121
        end
        object edtNUIN: TcxDBTextEdit [22]
          Left = 134
          Top = 275
          DataBinding.DataField = 'UIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 18
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [0]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup3: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItem5: TdxLayoutItem
                  Tag = 13
                  Caption = #1053#1086#1084#1077#1088
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Control = cxDBMaskEdit1
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItem3: TdxLayoutItem
                  Tag = 13
                  Caption = #1044#1072#1090#1072
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Control = cxDBDateEdit1
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralGroup7: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItem19: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  Caption = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Control = cxDBDateEdit3
                  ControlOptions.ShowBorder = False
                end
                object lciEXP: TdxLayoutItem
                  Caption = 'cxDBDateEdit2'
                  CaptionOptions.AlignHorz = taRightJustify
                  Visible = False
                  Control = edtEXP
                  ControlOptions.ShowBorder = False
                end
              end
              object lcOverrideTPOItem: TdxLayoutItem
                Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1058#1055#1054
                CaptionOptions.AlignHorz = taRightJustify
                Visible = False
                Control = edtOverridedTPO
                ControlOptions.ShowBorder = False
              end
              object lcgvaldoc: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcivaldocnumb: TdxLayoutItem
                  Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtvaldocnumb
                  ControlOptions.ShowBorder = False
                end
                object lcivaldocdate: TdxLayoutItem
                  Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtvaldocdate
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralGroup4: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItem2: TdxLayoutItem
                  Tag = 13
                  AutoAligns = [aaVertical]
                  Caption = #1058#1072#1084#1086#1078#1085#1103
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Control = cxDBMaskEdit2
                  ControlOptions.ShowBorder = False
                end
                object lcistatusforall: TdxLayoutItem
                  Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtstatusforall
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralGroup6: TdxLayoutGroup
                ShowCaption = False
                Visible = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItem12: TdxLayoutItem
                  Caption = #1057#1091#1084#1084#1072
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Visible = False
                  Control = cxDBCurrencyEdit1
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItem4: TdxLayoutItem
                  Tag = 13
                  AutoAligns = [aaVertical]
                  Caption = #1052#1055
                  CaptionOptions.AlignHorz = taRightJustify
                  Enabled = False
                  Visible = False
                  Control = cxDBComboBox2
                  ControlOptions.ShowBorder = False
                end
              end
            end
            object lcGeneralGroup5: TdxLayoutGroup
              Caption = 'New Group'
              ShowCaption = False
              ShowBorder = False
              object lcGeneralItem7: TdxLayoutItem
                Caption = 'cxLabel1'
                CaptionOptions.AlignHorz = taRightJustify
                Enabled = False
                ShowCaption = False
                Control = cxLabel1
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralItem1: TdxLayoutItem [1]
            Tag = 13
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Enabled = False
            Control = edtPayer
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem9: TdxLayoutItem [2]
            Caption = 'cxDBCheckBox1'
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Enabled = False
            ShowCaption = False
            Control = cxDBCheckBox1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroupINN: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralGroup9: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralItem14: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                CaptionOptions.AlignVert = tavTop
                Enabled = False
                Control = cxDBMaskEdit3
                ControlOptions.ShowBorder = False
              end
              object lciUIN: TdxLayoutItem
                Caption = #1059#1048#1053#1082#1088#1080#1074#1086#1081
                CaptionOptions.AlignHorz = taRightJustify
                CaptionOptions.AlignVert = tavTop
                Visible = False
                Control = edtUIN
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem15: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Enabled = False
              Control = cxDBMaskEdit4
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem10: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1055#1072#1089#1087#1086#1088#1090
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Enabled = False
              Control = cxDBTextEdit1
              ControlOptions.ShowBorder = False
            end
          end
          object lciNUIN: TdxLayoutItem [4]
            Caption = #1059#1048#1053
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtNUIN
            ControlOptions.ShowBorder = False
          end
          object lcgActivation: TdxLayoutGroup [5]
            Caption = #1055#1088#1086#1074#1086#1076#1082#1072
            LayoutDirection = ldHorizontal
            object lciIsActive: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = 'cxDBCheckBox1'
              Enabled = False
              ShowCaption = False
              Control = chBIsActive
              ControlOptions.ShowBorder = False
            end
            object lciActivationDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
              Enabled = False
              Control = edtActivationDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = []
            AlignVert = avBottom
            CaptionOptions.AlignVert = tavTop
            Enabled = False
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AlignVert = avBottom
            Enabled = False
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 855
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 496
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 524
        Width = 855
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 852
        Height = 496
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 855
        Height = 527
        ClientRectBottom = 503
        ClientRectRight = 855
      end
    end
    object tabCorrection: TcxTabSheet
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      ImageIndex = 6
      OnShow = tabCorrectionShow
    end
  end
  inherited ActionList: TActionList
    Left = 720
    Top = 323
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSave: TAction
      Visible = False
    end
    inherited actChangeState: TAction
      Visible = False
    end
    inherited actCreateActCorrOB: TAction
      Visible = False
    end
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
    object actAnnul: TAction
      Caption = 'actAnnul'
      Visible = False
      OnExecute = actAnnulExecute
      OnUpdate = actAnnulUpdate
    end
    object actPayOff: TAction
      Caption = #1055#1086#1075#1072#1089#1080#1090#1100
      Visible = False
      OnExecute = actPayOffExecute
      OnUpdate = actPayOffUpdate
    end
    object actPayIncome: TAction
      Caption = #1055#1083#1072#1090#1077#1078' '#1087#1086#1089#1090#1091#1087#1080#1083
      Visible = False
      OnExecute = actPayIncomeExecute
      OnUpdate = actPayIncomeUpdate
    end
    object actKNP: TAction
      Category = 'Object'
      Caption = #1050#1053#1055
      Hint = #1057#1074#1103#1079#1072#1090#1100' '#1089' '#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1077#1084' '#1050#1053#1055
      Visible = False
      OnExecute = actKNPExecute
      OnUpdate = actKNPUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 660
    Top = 147
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 524
    Top = 115
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
    Left = 552
    Top = 115
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 708
    Top = 147
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 496
    Top = 115
  end
  inherited imglAction: TImageList
    Left = 532
    Top = 83
  end
  inherited imglLarge: TImageList
    Left = 488
    Top = 91
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
        FloatLeft = 237
        FloatTop = 492
        FloatClientWidth = 127
        FloatClientHeight = 50
        ItemLinks = <
          item
            Item = btnRefresh
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
    Left = 688
    Top = 395
    DockControlHeights = (
      0
      0
      0
      0)
    inherited btnStateTransit: TdxBarSubItem
      Visible = ivNever
    end
    object dxBarButton1: TdxBarButton
      Action = actAnnul
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actPayOff
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = actPayIncome
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actKNP
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton5: TdxBarButton
      Caption = #1055#1086#1074#1090#1086#1088#1085#1072#1103' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
      Category = 0
      Visible = ivAlways
      OnClick = actCorrectSubjectExecute
    end
    object dxBarButton6: TdxBarButton
      Caption = #1054#1090#1084#1077#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      Category = 0
      Visible = ivAlways
      OnClick = actCorrectCChargeExecute
    end
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
        Name = 'DECL_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end
      item
        DataType = ftString
        Name = 'DECL_NO'
        ParamType = ptUnknown
        SourceField = dsDataNAME
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataSUBJECT_ID
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'pDocID'
        ParamType = ptUnknown
      end
      item
        DataType = ftBoolean
        Name = 'AnnulOnly'
        ParamType = ptUnknown
        Value = True
        AcceptedSources = [asParam]
      end>
    Left = 640
    Top = 103
  end
  inherited dsData: TfdcQuery
    DataSource = ObjectForm.srcData
    SQL.Strings = (
      'select t.*,'
      '---------------- '#1044#1083#1103' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1075#1086' '#1072#1085#1094#1077#1089#1090#1086#1088#1072'-------------------'
      '          0 NUM_MPO,'
      '          0 SUM_RUB,'
      '          '#39#39' REGIM,'
      '          '#39#39' METH_MOVE,'
      
        '----------------------------------------------------------------' +
        '--------------------'
      '       r.REL_OBJECT_ID AS OverridedDocId,'
      '       (SELECT cd.decl_no '
      '          FROM fdc_doc_charge_lst cd '
      '          WHERE cd.id = r.REL_OBJECT_ID ) AS Annul_DeclNo'
      '  from asbc_elrulings_lst t, fdc_rel_override_doc_lst r'
      ' where t.ID = :ID AND'
      '       t.id = r.OBJECT_ID(+)     ')
    Left = 428
    Top = 23
    object dsDataNUM_MPO: TStringField
      FieldName = 'NUM_MPO'
      Size = 12
    end
    object dsDataREGIM: TStringField
      DisplayLabel = #1056#1077#1078#1080#1084
      FieldName = 'REGIM'
      Required = True
      Size = 2
    end
    object dsDataMETH_MOVE: TStringField
      DisplayLabel = #1052#1055
      FieldName = 'METH_MOVE'
      Required = True
      Size = 2
    end
    object dsDataSUM_RUB: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_RUB'
      Required = True
      DisplayFormat = ',0.00'
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      FieldName = 'CUSTOMS_CODE'
      Required = True
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'REG_DATE'
      Required = True
    end
    object dsDataDECL_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1058#1055#1054
      FieldName = 'DECL_NO'
      Required = True
      Size = 10
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCUSTOM_MODE_ID: TFloatField
      DisplayLabel = #1056#1077#1078#1080#1084'2'
      FieldName = 'CUSTOM_MODE_ID'
    end
    object dsDataERRPAY_COUNT: TIntegerField
      FieldName = 'ERRPAY_COUNT'
    end
    object dsDataPAYTIME_FINISHED: TIntegerField
      FieldName = 'PAYTIME_FINISHED'
    end
    object dsDataAS_BIG_PAYER: TIntegerField
      FieldName = 'AS_BIG_PAYER'
    end
    object dsDataHAS_DED: TIntegerField
      FieldName = 'HAS_DED'
    end
    object dsDataDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
    end
    object dsDataCARRIER_ID: TFloatField
      FieldName = 'CARRIER_ID'
    end
    object dsDataCARRIER_NAME: TStringField
      FieldName = 'CARRIER_NAME'
      Size = 1500
    end
    object dsDataCARRIER_INN: TStringField
      FieldName = 'CARRIER_INN'
      Size = 12
    end
    object dsDataCARRIER_KPP: TStringField
      FieldName = 'CARRIER_KPP'
      Size = 10
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataOVERRIDEDDOCID: TFloatField
      DisplayLabel = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'OVERRIDEDDOCID'
    end
    object dsDataANNUL_DECLNO: TStringField
      FieldName = 'ANNUL_DECLNO'
      Size = 10
    end
    object dsDataAGGREMENT_ID: TFloatField
      FieldName = 'AGGREMENT_ID'
    end
    object dsDataEXPIRYDATE: TDateTimeField
      FieldName = 'EXPIRYDATE'
    end
    object dsDataVALDOC_NUMB: TStringField
      FieldName = 'VALDOC_NUMB'
    end
    object dsDataSJURPERSON: TStringField
      FieldName = 'SJURPERSON'
    end
    object dsDataSPERSON_NAME: TStringField
      FieldName = 'SPERSON_NAME'
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
    end
    object dsDataSPASSPORT: TStringField
      FieldName = 'SPASSPORT'
    end
    object dsDataSKBK: TStringField
      FieldName = 'SKBK'
    end
    object dsDataNDECL_SUM: TFloatField
      FieldName = 'NDECL_SUM'
    end
    object dsDataSPAYMENT: TStringField
      FieldName = 'SPAYMENT'
    end
    object dsDataVALDOC_DATE: TDateTimeField
      FieldName = 'VALDOC_DATE'
    end
    object dsDataRULING_TYPE: TIntegerField
      FieldName = 'RULINGTYPE'
    end
    object dsDataINVESTIGATORPOST: TStringField
      FieldName = 'INVESTIGATORPOST'
    end
    object dsDataINVESTIGATORNAME: TStringField
      FieldName = 'INVESTIGATORNAME'
    end
    object dsDataDOCNUMB: TStringField
      FieldName = 'DOCNUMB'
    end
    object dsDataDOCDATE: TDateTimeField
      FieldName = 'DOCDATE'
    end
    object dsDataSSTATUS: TStringField
      FieldName = 'SSTATUS'
      Size = 30
    end
    object dsDataUIN: TStringField
      FieldName = 'UIN'
      Size = 36
    end
  end
  inherited srcData: TDataSource
    Left = 644
    Top = 395
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_tpo_add(pcustomscode => :customs_code,'
      '                  pregdate => :reg_date,'
      '                  pdeclno => :decl_no,'
      '                  psubjectid => :subject_id,'
      '                  pcurrencyid => :currency_id,'
      '                  pcustommodeid => :custom_mode_id,'
      '                  pnummpo => :num_mpo,'
      '                  pregim => :regim,'
      '                  pmethmove => :meth_move,'
      '                  pordertype => :order_type,'
      '                  psumrub => :sum_rub,'
      '                  pDecision_Code => :Decision_Code,'
      '                  pCarrier_ID => :Carrier_ID,'
      '                  pOverrided_TPO_id => :OVERRIDEDDOCID,'
      '                  pAggrementId  => :AGGREMENT_ID'
      '                  );'
      'end;')
    Left = 568
    Top = 167
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'custom_mode_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_mpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'regim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'meth_move'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'order_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sum_rub'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Carrier_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OVERRIDEDDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGGREMENT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      ' fdc_tpo_upd(pid => :id,'
      '              pcustomscode => :customs_code,'
      '              pregdate => :reg_date,'
      '              pdeclno => :decl_no,'
      '              psubjectid => :subject_id,'
      '              pcurrencyid => :currency_id,'
      '              pcustommodeid => :custom_mode_id,'
      '              pnummpo => :num_mpo,'
      '              pregim => :regim,'
      '              pmethmove => :meth_move,'
      '              pordertype => :order_type,'
      '              psumrub => :sum_rub,'
      '              pDecision_Code => :Decision_Code,'
      '              pCarrier_ID => :Carrier_ID,'
      '              pOverrided_TPO_id => :OVERRIDEDDOCID,'
      '              pAggrementId  => :AGGREMENT_ID);'
      'end;')
    Left = 572
    Top = 143
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOM_MODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'num_mpo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'regim'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'meth_move'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'order_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sum_rub'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Carrier_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OVERRIDEDDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGGREMENT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 724
    Top = 395
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 752
    Top = 239
  end
  inherited dsUpdateState: TfdcQuery
    Left = 704
    Top = 95
  end
  inherited srcState: TDataSource
    Left = 640
    Top = 403
  end
  inherited dsTransit: TfdcQuery
    Left = 628
    Top = 183
  end
  inherited dsState: TfdcQuery
    Left = 616
    Top = 167
  end
  inherited srcAccessLevel: TDataSource
    Left = 668
    Top = 403
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 692
    Top = 207
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 763
    Top = 402
    object sqlSetAnnul: TsqlOp
      SQL.Strings = (
        'begin'
        '  Fdc_set_tr_state_Annul_w_adv(:ID,:NOTE);'
        'end;')
    end
    object sqlHasCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  select decode(nvl(sum(summa),0),0,0,1) into :Result'
        '    from fdc_decl_charge_lst'
        '   where decl_id=:Id;'
        'end;')
    end
    object sqlHasPayment: TsqlOp
      SQL.Strings = (
        'begin'
        '  select decode(nvl(sum(summa),0),0,0,1) into :Result'
        '    from fdc_payment_deduction_lst'
        '   where decl_id=:Id;'
        'end;')
    end
    object sqlSubjHasDebt: TsqlOp
      SQL.Strings = (
        'begin'
        '  if fdc_subject_debt_get_rest( :SUBJECT_ID ) > 0 then'
        '    :Result := 1;'
        '  else'
        '    :Result := 0;'
        '  end if;'
        'end;')
      DataSet = dsData
    end
    object sqlSetPayOff: TsqlOp
      SQL.Strings = (
        'begin'
        '  Fdc_set_tr_state_payoff(:ID,:NOTE);'
        'end;')
    end
    object sqlSetKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_set_knp(:ID,:LIC_ID);'
        '  -- '#1055#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.DoActivateBuffer;'
        'end;')
    end
    object sqlRemoveKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_remove_knp(:ID);'
        '  -- '#1055#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.DoActivateBuffer;'
        'end;')
    end
    object sqlTPOHasNoticePay: TsqlOp
      SQL.Strings = (
        'begin'
        '  select decode(nvl(sum(summa)-sum(payed),0),0,0,1) '
        '    into :Result'
        '    from fdc_noticepay_charge_lst '
        '   where decl_id = :ID;'
        'exception'
        '  when NO_DATA_FOUND then '
        '    :Result := 0;'
        'end;')
    end
  end
  object dsDeduction: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p_correction_tpo.GetDeductionCount(:ID) as Cnt'
      'from'
      '  dual')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    Session = MainData.Session
    Left = 787
    Top = 388
  end
end
