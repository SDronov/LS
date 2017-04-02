inherited CustomDeclForm: TCustomDeclForm
  Left = 211
  Top = 146
  Width = 861
  Height = 589
  HelpContext = 4202
  Caption = 'CustomDecl'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 853
    Height = 562
    ClientRectBottom = 538
    ClientRectRight = 853
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 847
        Height = 509
        inherited edtName: TcxDBTextEdit
          Left = 44
          Top = 111
          TabOrder = 10
          Width = 142
        end
        inherited edtDescript: TcxDBMemo
          Left = 78
          Top = 543
          TabOrder = 27
          Height = 24
          Width = 314
        end
        object edtDeclName: TfdcObjectLinkEdit [2]
          Left = 116
          Top = 202
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Broker'
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
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 13
          OnBeforeAcceptObject = edtDeclNameBeforeAcceptObject
          Width = 259
        end
        object cxDBTextEdit1: TcxDBTextEdit [3]
          Left = 56
          Top = 440
          DataBinding.DataField = 'G444A'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 21
          Width = 91
        end
        object cxDBDateEdit1: TcxDBDateEdit [4]
          Left = 56
          Top = 470
          DataBinding.DataField = 'G444B'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 22
          Width = 91
        end
        object cxDBDateEdit2: TcxDBDateEdit [5]
          Left = 404
          Top = 470
          DataBinding.DataField = 'G447B'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 24
          Width = 93
        end
        object cxDBTextEdit2: TcxDBTextEdit [6]
          Left = 404
          Top = 440
          DataBinding.DataField = 'G447A'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 23
          Width = 145
        end
        object edtFIO: TcxDBTextEdit [7]
          Left = 303
          Top = 513
          DataBinding.DataField = 'K115'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 26
          Width = 172
        end
        object cmbxG011: TfdcObjectLookupEdit [8]
          Left = 78
          Top = 69
          DataBinding.DataField = 'G011'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCustomDir
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 87
        end
        object cmbxCustomMode: TfdcObjectLookupEdit [9]
          Left = 229
          Top = 69
          DataBinding.DataField = 'CUSTOM_MODE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCustomMode
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 54
        end
        object edtCustomsCode: TcxDBMaskEdit [10]
          Left = 78
          Top = 39
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d{5,8}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 87
        end
        object edtRegDate: TcxDBDateEdit [11]
          Left = 171
          Top = 39
          DataBinding.DataField = 'REG_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 82
        end
        object edtDeclNo: TcxDBMaskEdit [12]
          Left = 259
          Top = 39
          DataBinding.DataField = 'DECL_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaskKind = emkRegExpr
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 77
        end
        object edtDeclINN: TcxDBMaskEdit [13]
          Left = 116
          Top = 172
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = edtDeclINNPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 126
        end
        object DeclKPP: TcxDBMaskEdit [14]
          Left = 537
          Top = 172
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = cxDBMaskEdit1PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Width = 111
        end
        object edtGD1: TcxDBDateEdit [15]
          Left = 9
          Top = 513
          TabStop = False
          DataBinding.DataField = 'GD1'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 25
          Width = 92
        end
        object fdcObjectLookupEdit1: TfdcObjectLookupEdit [16]
          Left = 359
          Top = 69
          DataBinding.DataField = 'G0131'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListSource = DictData.srcAdvDeclFeature
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 60
        end
        object edtGTDName: TcxDBMaskEdit [17]
          Left = 78
          Top = 9
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.BeepOnError = True
          Properties.CharCase = ecUpperCase
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = 
            '([0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]) \/ ([012][1-9] | [123' +
            ']0 |31)(0[1-9] |1[012])([0-9][0-9]) \/ ([0-9]|'#1055'|'#1054')([0-9][0-9][0-' +
            '9][0-9][0-9][0-9])'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Properties.OnValidate = edtGTDNamePropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 196
        end
        object cmbxDecision: TfdcObjectLookupEdit [18]
          Left = 471
          Top = 69
          DataBinding.DataField = 'DECISION_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 300
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              MinWidth = 30
              Width = 80
              FieldName = 'CODE'
            end
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              MinWidth = 200
              FieldName = 'Name'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListSource = DictData.srcDecisionQualifier
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          OnEditing = cmbxDecisionEditing
          Width = 53
        end
        object edtPredDecl: TcxDBTextEdit [19]
          Left = 387
          Top = 9
          DataBinding.DataField = 'PRED_DECL'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 210
        end
        object editDeclBrINN: TcxDBMaskEdit [20]
          Left = 116
          Top = 276
          DataBinding.DataField = 'BROKER_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = edtDeclINNPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 14
          Width = 392
        end
        object editDeclBrKpp: TcxDBMaskEdit [21]
          Left = 537
          Top = 276
          DataBinding.DataField = 'BROKER_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = cxDBMaskEdit1PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 273
        end
        object editDeclBrSvDate: TcxDBDateEdit [22]
          Left = 522
          Top = 336
          DataBinding.DataField = 'BROKER_SV_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 18
          Width = 91
        end
        object editDeclBrSvNum: TcxDBTextEdit [23]
          Left = 116
          Top = 336
          DataBinding.DataField = 'BROKER_SV_NUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 17
          Width = 292
        end
        object editDeclBrDgNum: TcxDBTextEdit [24]
          Left = 116
          Top = 366
          DataBinding.DataField = 'BROKER_DG_NUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 292
        end
        object editDeclBrDgDate: TcxDBDateEdit [25]
          Left = 522
          Top = 366
          DataBinding.DataField = 'BROKER_DG_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 91
        end
        object editDeclBrName: TfdcObjectLinkEdit [26]
          Left = 116
          Top = 306
          DataBinding.DataField = 'BROKER_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BROKER_ID'
          DataBinding.TypeSysName = 'Declarant;Subject'
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
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 16
          OnBeforeAcceptObject = editDeclBrNameBeforeAcceptObject
          Width = 813
        end
        object edtDecisionDate: TcxDBDateEdit [27]
          Left = 656
          Top = 69
          DataBinding.DataField = 'DECISION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup10: TdxLayoutGroup [0]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem18: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              Caption = #1053#1086#1084#1077#1088' '#1044#1058
              Control = edtGTDName
              ControlOptions.ShowBorder = False
            end
            object lciTempGTDNo: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1053#1086#1084#1077#1088' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1044#1058
              Control = edtPredDecl
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup8: TdxLayoutGroup [1]
            ShowCaption = False
            Visible = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem12: TdxLayoutItem
              Tag = 13
              Caption = #1053#1086#1084#1077#1088' '#1044#1058
              Control = edtCustomsCode
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem14: TdxLayoutItem
              Tag = 13
              Caption = 'cxDBDateEdit3'
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              ShowCaption = False
              Control = edtRegDate
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem15: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'cxDBMaskEdit2'
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              ShowCaption = False
              Control = edtDeclNo
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup5: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem8: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
              Control = cmbxG011
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem13: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
              Control = cmbxCustomMode
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem17: TdxLayoutItem
              Tag = 13
              Caption = #1044#1086#1087'. '#1087#1088#1080#1079#1085#1072#1082
              Control = fdcObjectLookupEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem19: TdxLayoutItem
              Tag = 11
              Caption = #1056#1077#1096#1077#1085#1080#1077
              Control = cmbxDecision
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem20: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1088#1077#1096#1077#1085#1080#1103
              Control = edtDecisionDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = [aaVertical]
            Caption = ''
            CaptionOptions.AlignVert = tavTop
            ShowCaption = False
            Visible = False
            Control = nil
          end
          inherited lciDescriptEdit: TdxLayoutItem
            ShowCaption = False
            Visible = False
            Control = nil
          end
          object lcGeneralItem10: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1053#1086#1084#1077#1088
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Offsets.Left = 2
            Visible = False
            Control = edtName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup
            Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
            object lcGeneralGroup6: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem16: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem1: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                Control = DeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralItem2: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtDeclName
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroupBrocker: TdxLayoutGroup
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' ('#1073#1088#1086#1082#1077#1088')'
            object lcGeneralGroup9: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup14: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lcGeneralItemBrINN: TdxLayoutItem
                  Tag = 33
                  Caption = #1048#1053#1053
                  Control = editDeclBrINN
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItemBrKPP: TdxLayoutItem
                  Tag = 33
                  Caption = #1050#1055#1055
                  Control = editDeclBrKpp
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralItemBrName: TdxLayoutItem
                Tag = 31
                Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Control = editDeclBrName
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup11: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItemBrSvNum: TdxLayoutItem
                Tag = 33
                Caption = #8470' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = editDeclBrSvNum
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItemBrSvDate: TdxLayoutItem
                Tag = 33
                Caption = #1044#1072#1090#1072' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = editDeclBrSvDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup12: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItemBrDgNum: TdxLayoutItem
                Tag = 33
                Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
                Control = editDeclBrDgNum
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItemBrDgDate: TdxLayoutItem
                Tag = 33
                Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
                Control = editDeclBrDgDate
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralGroup2: TdxLayoutGroup
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1086#1085#1090#1088#1072#1082#1090
              object lcGeneralItem3: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1053#1086#1084#1077#1088
                Offsets.Left = 2
                Control = cxDBTextEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem4: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072
                LookAndFeel = LayoutWebLookAndFeel
                Offsets.Left = 2
                Control = cxDBDateEdit1
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup3: TdxLayoutGroup
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077' '#1086#1090' '#1087#1083#1072#1090#1077#1078#1077#1081
              object lcGeneralItem6: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1053#1086#1084#1077#1088
                Control = cxDBTextEdit2
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem5: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072
                Control = cxDBDateEdit2
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralGroup7: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem7: TdxLayoutItem
              Tag = 11
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              ShowCaption = False
              Visible = False
              Control = edtGD1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem9: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1085#1089#1087#1077#1082#1090#1086#1088
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtFIO
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem11: TdxLayoutItem
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Visible = False
            Control = edtDescript
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 853
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 509
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 535
        Width = 853
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 850
        Height = 509
      end
    end
    object tabRepayment: TcxTabSheet [3]
      Caption = #1054#1090#1089#1088#1086#1095#1082#1080
      ImageIndex = 6
      OnShow = tabRepaymentShow
    end
    object tabControlDoc: TcxTabSheet [5]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1082#1086#1085#1090#1088#1086#1083#1103
      OnShow = tabControlDocShow
      object pcControlDoc: TcxPageControl
        Left = 0
        Top = 0
        Width = 853
        Height = 538
        ActivePage = tabPaymentDoc
        Align = alClient
        Style = 5
        TabOrder = 0
        TabPosition = tpBottom
        ClientRectBottom = 514
        ClientRectRight = 853
        ClientRectTop = 0
        object tabPaymentDoc: TcxTabSheet
          Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
          ImageIndex = 2
          OnShow = tabPaymentDocShow
        end
        object tabIsch: TcxTabSheet
          Caption = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1103' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
          ImageIndex = 3
          OnShow = tabIschShow
        end
        object tabCharge: TcxTabSheet
          Caption = #1050' '#1091#1087#1083#1072#1090#1077
          ImageIndex = 1
          OnShow = tabChargeShow
        end
        object tabOPRP: TcxTabSheet
          Caption = #1054#1090#1089#1088#1086#1095#1082#1080
          ImageIndex = 3
          OnShow = tabOPRPShow
        end
        object tabKTS: TcxTabSheet
          Caption = #1050#1058#1057
          ImageIndex = 4
          OnShow = tabKTSShow
          object pcKTS: TcxPageControl
            Left = 0
            Top = 0
            Width = 853
            Height = 514
            ActivePage = tabKTSTov
            Align = alClient
            Style = 5
            TabOrder = 0
            TabPosition = tpBottom
            ClientRectBottom = 490
            ClientRectRight = 853
            ClientRectTop = 0
            object tabKTSTov: TcxTabSheet
              Caption = #1058#1086#1074#1072#1088#1099
              ImageIndex = 0
              OnShow = tabKTSTovShow
            end
            object tabKTSPlt: TcxTabSheet
              Caption = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1103' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
              ImageIndex = 1
              OnShow = tabKTSPltShow
            end
          end
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 853
        Height = 538
        ClientRectBottom = 514
        ClientRectRight = 853
      end
    end
    object tabCorrect: TcxTabSheet
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      ImageIndex = 8
      OnShow = tabCorrectShow
    end
    object tabNoticeAdvice: TcxTabSheet
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100'/'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      ImageIndex = 10
      OnShow = tabNoticeAdviceShow
    end
    object tabDeclTime: TcxTabSheet
      Caption = #1042#1088#1077#1084#1077#1085#1085#1099#1077' '#1044#1058
      ImageIndex = 11
      OnShow = tabDeclTimeShow
    end
    object tabDeclFull: TcxTabSheet
      Caption = #1055#1086#1083#1085#1099#1077' '#1044#1058
      ImageIndex = 12
      OnShow = tabDeclFullShow
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actPrint: TAction
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1082#1086#1085#1090#1088#1086#1083#1103
      ImageIndex = -1
      Visible = True
      OnExecute = actPrintExecute
      OnUpdate = actPrintUpdate
    end
    object actAddOldPayment: TAction
      Category = 'Object'
      Caption = 'actAddOldPayment'
      ShortCut = 16449
      OnExecute = actAddOldPaymentExecute
    end
    object actOTM: TAction
      Category = 'Object'
      Caption = #1054#1058#1055
      Hint = #1047#1072#1074#1077#1088#1096#1077#1085#1080#1077' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1086#1090#1076#1077#1083#1086#1084' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      OnExecute = actOTMExecute
      OnUpdate = actOTMUpdate
    end
    object actKNP: TAction
      Category = 'Object'
      Caption = #1050#1053#1055
      Hint = #1057#1074#1103#1079#1072#1090#1100' '#1089' '#1088#1072#1089#1087#1086#1088#1103#1078#1077#1085#1080#1077#1084' '#1050#1053#1055
      OnExecute = actKNPExecute
      OnUpdate = actKNPUpdate
    end
    object actPrint1: TAction
      Category = 'Object'
      Caption = #1079#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1044#1058
      OnExecute = actPrint1Execute
    end
    object actPrint2: TAction
      Category = 'Object'
      Caption = #1086#1092#1086#1088#1084#1083#1077#1085#1085#1072#1103' '#1044#1058
      OnExecute = actPrint2Execute
    end
    object actCorrectSubject: TAction
      Category = 'Correction'
      Caption = #1055#1086#1074#1090#1086#1088#1085#1072#1103' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1103' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1072
      OnExecute = actCorrectSubjectExecute
    end
    object actCorrectCCharge: TAction
      Category = 'Correction'
      Caption = #1054#1090#1084#1077#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1081
      OnExecute = actCorrectCChargeExecute
      OnUpdate = actCorrectCChargeUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -13
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
            Item = dxBarButton1
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
          end
          item
            BeginGroup = True
            Item = dxBarSubItem1
            Visible = True
          end
          item
            Item = btnOTM
            Visible = True
          end
          item
            Item = barBtnKNP
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
    object dxBarButton1: TdxBarButton
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Category = 0
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1087#1086#1083#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = PrintPM
      ImageIndex = 5
    end
    object btnOTM: TdxBarButton
      Action = actOTM
      Category = 0
      AllowAllUp = True
    end
    object barBtnKNP: TdxBarButton
      Action = actKNP
      Category = 0
      ButtonStyle = bsChecked
    end
    object dxBarButton3: TdxBarButton
      Action = actPrint1
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actPrint2
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = btnCorrectSubject
          Visible = True
        end
        item
          Item = dxBarButton5
          Visible = True
        end>
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnCorrectSubject: TdxBarButton
      Action = actCorrectSubject
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Action = actCorrectCCharge
      Category = 0
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
        AcceptedSources = [asField]
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
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select'
      '  cd.*'
      '  ,case when (dd.code = '#39#1055#1042#1044#39' or dd.code = '#39#1055#1055#1044#39') AND '
      
        '        p_params.CustomLevel NOT IN ( p_consts.CustomLevel_KNP_F' +
        'TS, p_consts.CustomLevel_KNP_RTU) THEN'
      
        '    ( SELECT fdc_str_agg( d.g40_1 || '#39'\'#39' || to_char(d.g40_2, '#39'dd' +
        'mmyyyy'#39') || '#39'\'#39' || d.g40_3) '
      '       FROM dbf_dclpredd d '
      '       WHERE d.g071 = cd.CUSTOMS_CODE '
      '         AND d.g072 = cd.REG_DATE'
      '         AND d.g073 = cd.DECL_NO'
      '         AND nvl(d.g40_1,'#39'-'#39') <> '#39'-'#39
      '    )'
      '    when (dd.code = '#39#1055#1042#1044#39' or dd.code = '#39#1055#1055#1044#39') AND'
      
        '         p_params.CustomLevel IN ( p_consts.CustomLevel_KNP_FTS,' +
        ' p_consts.CustomLevel_KNP_RTU) THEN'
      
        '    ( SELECT fdc_str_agg(t.customs_code || '#39'\'#39' || to_char(t.reg_' +
        'date, '#39'ddmmyyyy'#39') || '#39'\'#39' || t.decl_no)'
      '       FROM fdc_tmp_time_gtd t, fdc_tmp_gtd g'
      '       WHERE g.ext_source = cd.ext_source'
      '         AND g.ext_typesysname = cd.ext_typesysname'
      '         AND g.ext_id = cd.ext_id'
      '         AND t.decl_id = g.id'
      '         AND nvl(t.customs_code, '#39'-'#39') <> '#39'-'#39
      '     )'
      'else null'
      '  end pred_decl'
      'from '
      '  fdc_Custom_Decl_Lst cd'
      ' ,fdc_dict_lst dd'
      'where cd.ID = :ID'
      '  and dd.id(+) = cd.g0131')
    inherited dsDataNAME: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1043#1058#1044
      Required = True
      OnValidate = dsDataNAMEValidate
    end
    object dsDataMODIFY_DATE: TDateTimeField [11]
      DefaultExpression = '$$DATE$$'
      FieldName = 'MODIFY_DATE'
    end
    object dsDataSUBJECT_ID: TFloatField [12]
      DisplayLabel = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataG011: TStringField [13]
      DefaultExpression = #1048#1052
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'G011'
      Size = 2
    end
    object dsDataOKPO: TStringField [14]
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField [15]
      FieldName = 'INN'
      Size = 12
    end
    object dsDataG12: TFloatField [16]
      DisplayLabel = #1054#1073#1097#1072#1103' '#1090#1072#1084#1086#1078#1077#1085#1085#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
      FieldName = 'G12'
    end
    object dsDataG221: TStringField [17]
      FieldName = 'G221'
      Size = 3
    end
    object dsDataG444A: TStringField [18]
      FieldName = 'G444A'
      Size = 80
    end
    object dsDataG444B: TDateTimeField [19]
      FieldName = 'G444B'
    end
    object dsDataG447A: TStringField [20]
      FieldName = 'G447A'
      Size = 50
    end
    object dsDataG447B: TDateTimeField [21]
      FieldName = 'G447B'
    end
    object dsDataK115: TStringField [22]
      FieldName = 'K115'
    end
    object dsDataG40: TStringField [23]
      FieldName = 'G40'
      Size = 23
    end
    object dsDataDECL_TYPESYSNAME: TStringField [24]
      FieldName = 'DECL_TYPESYSNAME'
      Size = 1500
    end
    object dsDataDECL_KPP: TStringField [25]
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataDECL_INN: TStringField [26]
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_NAME: TStringField [27]
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField [28]
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField [29]
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURRENCY_ID: TFloatField [30]
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCUSTOM_MODE_ID: TFloatField [31]
      DisplayLabel = #1056#1077#1078#1080#1084
      FieldName = 'CUSTOM_MODE_ID'
      Required = True
    end
    object dsDataCUSTOM_MODE_CODE: TStringField [32]
      FieldName = 'CUSTOM_MODE_CODE'
      Size = 1500
    end
    object dsDataCUSTOM_MODE_NAME: TStringField [33]
      FieldName = 'CUSTOM_MODE_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE: TStringField [34]
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'CUSTOMS_CODE'
      Required = True
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField [35]
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      FieldName = 'REG_DATE'
      Required = True
    end
    object dsDataDECL_NO: TStringField [36]
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Required = True
      Size = 7
    end
    object dsDataGD1: TDateTimeField [37]
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
      FieldName = 'GD1'
    end
    object dsDataAS_BIG_PAYER: TFloatField [38]
      FieldName = 'AS_BIG_PAYER'
    end
    object dsDataG0131: TFloatField [39]
      DisplayLabel = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1080#1079#1085#1072#1082
      FieldName = 'G0131'
    end
    object dsDataHAS_DED: TIntegerField
      FieldName = 'HAS_DED'
    end
    object dsDataDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
    end
    object dsDataPRED_DECL: TStringField
      DisplayWidth = 25
      FieldName = 'PRED_DECL'
      Size = 2000
    end
    object dsDataAGGREMENT_ID: TFloatField
      FieldName = 'AGGREMENT_ID'
    end
    object dsDataBROKER_INN: TStringField
      FieldName = 'BROKER_INN'
      Size = 12
    end
    object dsDataBROKER_KPP: TStringField
      FieldName = 'BROKER_KPP'
      Size = 9
    end
    object dsDataBROKER_SV_NUM: TStringField
      FieldName = 'BROKER_SV_NUM'
      Size = 14
    end
    object dsDataBROKER_SV_DATE: TDateTimeField
      FieldName = 'BROKER_SV_DATE'
    end
    object dsDataBROKER_DG_NUM: TStringField
      FieldName = 'BROKER_DG_NUM'
      Size = 50
    end
    object dsDataBROKER_DG_DATE: TDateTimeField
      FieldName = 'BROKER_DG_DATE'
    end
    object dsDataBROKER_NAME: TStringField
      FieldName = 'BROKER_NAME'
      Size = 1500
    end
    object dsDataBROKER_ID: TFloatField
      FieldName = 'BROKER_ID'
    end
    object dsDataDECISION_DATE: TDateTimeField
      FieldName = 'DECISION_DATE'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_custom_decl_add(pcustomscode => :customs_code,'
      '                               pregdate => :reg_date,'
      '                               pdeclno => :decl_no,'
      '       pDescript => :DESCRIPT ,'
      '                               pmodifydate => :modify_date,'
      '                               psubjectid => :subject_id,'
      '                               pg011 => :g011,'
      '                               pCustomModeId => :CUSTOM_MODE_ID,'
      '                               pg12 => :g12,'
      '                               pcurrencyid => :currency_id,'
      '                               pg444a => :g444a,'
      '                               pg444b => :g444b,'
      '                               pg447a => :g447a,'
      '                               pg447b => :g447b,'
      '                               pk115 => :k115,'
      '                               pg40 => :g40,'
      '                        pDecision_Code => :Decision_Code,'
      '                             pgd1  => :gd1,'
      '                         pG0131 =>  :G0131,'
      '                           pAggrementId  => :AGGREMENT_ID);'
      'end;')
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
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'MODIFY_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G011'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOM_MODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'G12'
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
        DataType = ftString
        Name = 'G444A'
        ParamType = ptUnknown
        Size = 81
      end
      item
        DataType = ftDateTime
        Name = 'G444B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G447A'
        ParamType = ptUnknown
        Size = 51
      end
      item
        DataType = ftDateTime
        Name = 'G447B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'K115'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'G40'
        ParamType = ptUnknown
        Size = 24
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'gd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'G0131'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Aggrement_Id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      ' fdc_custom_decl_upd(pid => :id,'
      '                      pcustomscode => :customs_code,'
      '                               pregdate => :reg_date,'
      '                               pdeclno => :decl_no,'
      '       pDescript => :DESCRIPT ,'
      '                               pmodifydate => :modify_date,'
      '                               psubjectid => :subject_id,'
      '                               pg011 => :g011,'
      '                               pCustomModeId => :CUSTOM_MODE_ID,'
      '                               pg12 => :g12,'
      '                               pcurrencyid => :currency_id,'
      '                               pg444a => :g444a,'
      '                               pg444b => :g444b,'
      '                               pg447a => :g447a,'
      '                               pg447b => :g447b,'
      '                               pk115 => :k115,'
      '                               pg40 => :g40,'
      '                               pDecision_Code => :Decision_Code,'
      '                               pDecision_Date => :Decision_Date,'
      '                               pGD1 => :GD1,'
      '                               pAggrementId  => :AGGREMENT_ID);'
      'end;')
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
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'MODIFY_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G011'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOM_MODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'G12'
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
        DataType = ftString
        Name = 'G444A'
        ParamType = ptUnknown
        Size = 81
      end
      item
        DataType = ftDateTime
        Name = 'G444B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G447A'
        ParamType = ptUnknown
        Size = 51
      end
      item
        DataType = ftDateTime
        Name = 'G447B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'K115'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'G40'
        ParamType = ptUnknown
        Size = 24
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GD1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Aggrement_Id'
        ParamType = ptUnknown
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where State_Scheme_ID = :STATE_SCHEME_ID and'
      '       1= 2 and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      
        '       ) and TR_ACCESS_LEVEL = 1 and fdc_check_sql_condition(CON' +
        'DITION) = 1')
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 19
    Top = 108
    object sqlCheckINN: TsqlOp
      SQL.Strings = (
        'begin'
        '  select id, name, inn, kpp '
        '    into :SUBJECT_ID, :DECL_NAME, :DECL_INN, :DECL_KPP    '
        '   from fdc_subject_lst'
        '    where inn = :INN_ and '
        '     (:KPP is null or (:KPP is not null and kpp = :KPP));'
        'exception'
        '  when others then'
        '     :SUBJECT_ID := NULL;'
        '     :DECL_NAME := NULL;'
        'end;')
      DataSet = dsData
    end
    object sqlSetKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_set_knp(:ID,:LIC_ID);'
        'end;')
    end
    object sqlRemoveKNP: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_decl_remove_knp(:ID);'
        'end;')
    end
    object sqlCheckExistsAdviceOrNotice: TsqlOp
      SQL.Strings = (
        'begin'
        '  select count(*) into :Result'
        '  from fdc_document_lst doc'
        '  where doc.id in ( select v.owner_object_id'
        '                      from fdc_decl_charge d'
        '                          ,fdc_value_lst v'
        '                     where d.decl_id = :id'
        '                           and v.ref_object_id = d.id'
        '                )'
        
          '  and ( typesysname in ('#39'NoticePay'#39','#39'AdvicePay'#39','#39'AdvicePayPeriod' +
          'ic'#39','#39'AdvicePayTPO'#39')) '
        '  and rownum <= 1;'
        'end;')
      DataSet = dsData
    end
    object sqlSetBroker: TsqlOp
      SQL.Strings = (
        'begin'
        '  savepoint setbroker; '
        '  p_cdecl_loader_ex.SetBrockerId'
        '   ( '
        '     pDeclId   => :DeclId'
        '    ,pBrokerId => :BrokerId'
        '   );'
        '  commit;'
        'exception'
        '  when others then'
        '    rollback to setbroker;'
        '    raise;'
        'end;')
    end
  end
  object PrintPM: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = bbPrint
        Visible = True
      end
      item
        Item = dxBarButton3
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 531
    Top = 44
  end
  object dsDeduction: TOracleDataSet
    SQL.Strings = (
      'select'
      '  p_correction_gtd.GetDeductionCount(:ID) as Cnt'
      'from'
      '  dual')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000500000053554D4D41010000000000}
    Session = MainData.Session
    Left = 539
    Top = 124
  end
end
