inherited TRForm: TTRForm
  Left = 232
  Top = 152
  Width = 951
  Height = 665
  HelpContext = 442
  Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1072#1103' '#1088#1072#1089#1087#1080#1089#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 943
    Height = 638
    ActivePage = tabGeneral
    ClientRectBottom = 614
    ClientRectRight = 943
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 937
        Height = 585
        inherited edtName: TcxDBTextEdit
          Left = 144
          Top = 557
          TabOrder = 24
          Width = 416
        end
        inherited edtDescript: TcxDBMemo
          Left = 144
          Top = 490
          Style.Font.Height = -13
          Style.IsFontAssigned = True
          TabOrder = 33
          Height = 99
          Width = 697
        end
        object edtDeclarant: TfdcObjectLinkEdit [2]
          Left = 144
          Top = 138
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
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 14
          Width = 416
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [3]
          Left = 144
          Top = 9
          DataBinding.DataField = 'DECL_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 138
        end
        object cxDBDateEdit1: TcxDBDateEdit [4]
          Left = 334
          Top = 9
          DataBinding.DataField = 'REG_DATE'
          DataBinding.DataSource = srcData
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
          Left = 144
          Top = 61
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
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
          TabOrder = 5
          Width = 138
        end
        object cxLabel1: TcxLabel [6]
          Left = 0
          Top = 0
          ParentColor = False
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.HotTrack = False
        end
        object cxDBTextEdit1: TcxDBTextEdit [7]
          Left = 253
          Top = 113
          DataBinding.DataField = 'SUM_RUB'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnValidate = cxDBTextEdit1PropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Width = 138
        end
        object cxDBComboBox1: TcxDBComboBox [8]
          Left = 144
          Top = 88
          DataBinding.DataField = 'REGIM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1054#1055
            #1059#1042
            #1055#1061
            #1055#1051)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 70
        end
        object cxDBComboBox2: TcxDBComboBox [9]
          Left = 334
          Top = 88
          DataBinding.DataField = 'METH_MOVE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1041#1056
            #1057#1042#1061
            #1058#1055)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 66
        end
        object cxDBComboBox3: TcxDBComboBox [10]
          Left = 417
          Top = 113
          DataBinding.DataField = 'ORDER_TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1060
            #1054)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 13
          Width = 66
        end
        object cmbxDecision: TfdcObjectLookupEdit [11]
          Left = 334
          Top = 61
          DataBinding.DataField = 'DECISION_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 600
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              Width = 50
              FieldName = 'CODE'
            end
            item
              Caption = #1056#1077#1096#1077#1085#1080#1077
              Width = 550
              FieldName = 'NAME'
            end>
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 121
        end
        object edtCarrier: TfdcObjectLinkEdit [12]
          Left = 144
          Top = 165
          DataBinding.DataField = 'CARRIER_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CARRIER_ID'
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
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 17
          Width = 416
        end
        object chBIsActive: TcxDBCheckBox [13]
          Left = 21
          Top = 450
          Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
          DataBinding.DataField = 'IS_ACTIVE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentColor = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 31
          Width = 164
        end
        object edtActivationDate: TcxDBDateEdit [14]
          Left = 271
          Top = 450
          DataBinding.DataField = 'ACTIVATION_DATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 32
          Width = 146
        end
        object ceRest: TcxDBCurrencyEdit [15]
          Left = 124
          Top = 325
          DataBinding.DataField = 'RESTSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 25
          Width = 275
        end
        object ceLocked: TcxDBCurrencyEdit [16]
          Left = 124
          Top = 352
          DataBinding.DataField = 'LOCKEDSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 275
        end
        object ceAvailable: TcxDBCurrencyEdit [17]
          Left = 124
          Top = 379
          DataBinding.DataField = 'AVAILRESTSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 27
          Width = 275
        end
        object edtOverridedTR: TfdcObjectLinkEdit [18]
          Left = 144
          Top = 34
          DataBinding.DataField = 'ANNUL_DECLNO'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OVERRIDEDDOCID'
          DataBinding.TypeSysName = 'TR'
          DataBinding.SearchFormClass = 'TTRGridForm'
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
          OnBeforeAcceptObject = edtOverridedTRBeforeAcceptObject
          Width = 745
        end
        object cxDBDateEdit2: TcxDBDateEdit [19]
          Left = 551
          Top = 9
          DataBinding.DataField = 'DATE_EXEC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 121
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [20]
          Left = 144
          Top = 113
          DataBinding.DataField = 'CURRENCY_ID'
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
          Properties.ListSource = DictData.srcCurrency
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 70
        end
        object edtSumTSRest: TcxDBCurrencyEdit [21]
          Left = 532
          Top = 325
          DataBinding.DataField = 'RESTSUM_TS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 28
          Width = 345
        end
        object edtSumTSLocked: TcxDBCurrencyEdit [22]
          Left = 532
          Top = 352
          DataBinding.DataField = 'LOCKEDSUM_TS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 29
          Width = 345
        end
        object edtSumTSAvailable: TcxDBCurrencyEdit [23]
          Left = 532
          Top = 379
          DataBinding.DataField = 'RESTSUM_Y'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 30
          Width = 345
        end
        object edtDeclINN: TcxDBTextEdit [24]
          Left = 657
          Top = 138
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 15
          Width = 121
        end
        object edtDeclKPP: TcxDBTextEdit [25]
          Left = 807
          Top = 138
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 16
          Width = 121
        end
        object edtCarrierINN: TcxDBTextEdit [26]
          Left = 657
          Top = 165
          DataBinding.DataField = 'CARRIER_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 18
          Width = 121
        end
        object edtCarrierKPP: TcxDBTextEdit [27]
          Left = 807
          Top = 165
          DataBinding.DataField = 'CARRIER_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 121
        end
        object editSignDuplicate: TcxDBCheckBox [28]
          Left = 144
          Top = 217
          DataBinding.DataField = 'SIGN_DUPLICATE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 49
        end
        object editAnnulTR: TfdcObjectLinkEdit [29]
          Left = 144
          Top = 244
          DataBinding.DataField = 'ANNUL_TR_DOC_NUMBER'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'ANNUL_TR_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 22
          Width = 323
        end
        object editDuplicateTr: TfdcObjectLinkEdit [30]
          Left = 144
          Top = 269
          DataBinding.DataField = 'DUPLICATE_TR_DOC_NUMBER'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DUPLICATE_TR_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 23
          Width = 574
        end
        object cxDBLabel1: TcxDBLabel [31]
          Left = 551
          Top = 61
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcState
          ParentColor = False
          ParentFont = False
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        object cxDBComboBox4: TcxDBComboBox [32]
          Left = 698
          Top = 9
          DataBinding.DataField = 'STRTYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1054#1073#1099#1095#1085#1072#1103
            #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103)
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 121
        end
        object cxDBComboBox5: TcxDBComboBox [33]
          Left = 698
          Top = 61
          DataBinding.DataField = 'SSIGN_GENPROV'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1044#1072
            #1053#1077#1090)
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 121
        end
        object cxDBComboBox6: TcxDBComboBox [34]
          Left = 144
          Top = 192
          DataBinding.DataField = 'SSIGN_CORR'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Items.Strings = (
            #1044#1072
            #1053#1077#1090)
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [0]
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
                Control = cxDBMaskEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem4: TdxLayoutItem
                Tag = 13
                Caption = #1044#1072#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBDateEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem12: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBDateEdit2
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem11: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                Caption = #1058#1080#1087
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBComboBox4
                ControlOptions.ShowBorder = False
              end
            end
            object lcOverrideTRItem: TdxLayoutItem
              Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1058#1056
              Enabled = False
              Visible = False
              Control = edtOverridedTR
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup5: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem2: TdxLayoutItem
                Tag = 13
                Caption = #1058#1072#1084#1086#1078#1085#1103
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBMaskEdit2
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem6: TdxLayoutItem
                Caption = #1056#1077#1096#1077#1085#1080#1077
                CaptionOptions.AlignHorz = taRightJustify
                Control = cmbxDecision
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem7: TdxLayoutItem
                Caption = #1057#1090#1072#1090#1091#1089
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBLabel1
                ControlOptions.ShowBorder = False
              end
              object lciGenSign: TdxLayoutItem
                Caption = #1043#1054
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBComboBox5
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup7: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem8: TdxLayoutItem
                Tag = 13
                Caption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBComboBox1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem3: TdxLayoutItem
                Tag = 13
                Caption = #1052#1055
                CaptionOptions.AlignHorz = taRightJustify
                Offsets.Left = 97
                Control = cxDBComboBox2
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup6: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem13: TdxLayoutItem
                Tag = 13
                Caption = #1042#1072#1083#1102#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cmbxedtCurrID
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem9: TdxLayoutItem
                Tag = 13
                Caption = #1057#1091#1084#1084#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBTextEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem10: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                Caption = #1058#1080#1087
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBComboBox3
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgDecl: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDeclarant
              ControlOptions.ShowBorder = False
            end
            object lciDeclINN: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1048#1053#1053
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDeclINN
              ControlOptions.ShowBorder = False
            end
            object lciDeclKPP: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDeclKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcgCarrier: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralGroup2: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciCarrierName: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtCarrier
                ControlOptions.ShowBorder = False
              end
              object lciCarrierINN: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtCarrierINN
                ControlOptions.ShowBorder = False
              end
              object lciCarrierKPP: TdxLayoutItem
                Tag = 13
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtCarrierKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciCorrectedSign: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1085#1086
              Control = cxDBComboBox6
              ControlOptions.ShowBorder = False
            end
            object lcieditSignDuplicate: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              Caption = #1055#1088#1080#1079#1085#1072#1082' '#1076#1091#1073#1083#1080#1082#1072#1090#1072
              Control = editSignDuplicate
              ControlOptions.ShowBorder = False
            end
            object lcieditAnnulTR: TdxLayoutItem
              Tag = 33
              Caption = #1053#1086#1084#1077#1088' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1085#1086#1081' '#1058#1056
              Control = editAnnulTR
              ControlOptions.ShowBorder = False
            end
            object lcieditDuplicateTr: TdxLayoutItem
              Tag = 33
              Caption = #1053#1086#1084#1077#1088' '#1076#1091#1073#1083#1080#1082#1072#1090#1072' '#1058#1056
              Control = editDuplicateTr
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = []
            AlignVert = avBottom
            Visible = False
          end
          object lcgSum: TdxLayoutGroup [4]
            Caption = #1057#1091#1084#1084#1099
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcgSumCommon: TdxLayoutGroup
              AutoAligns = [aaVertical]
              Caption = #1055#1086#1075#1072#1096#1077#1085#1080#1077
              object itemRest: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1054#1089#1090#1072#1090#1086#1082
                CaptionOptions.AlignHorz = taRightJustify
                Control = ceRest
                ControlOptions.ShowBorder = False
              end
              object itemLocked: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
                CaptionOptions.AlignHorz = taRightJustify
                Control = ceLocked
                ControlOptions.ShowBorder = False
              end
              object itemAvailable: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
                CaptionOptions.AlignHorz = taRightJustify
                Control = ceAvailable
                ControlOptions.ShowBorder = False
              end
            end
            object lcgSumTS: TdxLayoutGroup
              AutoAligns = []
              AlignHorz = ahClient
              AlignVert = avClient
              Caption = #1055#1086#1075#1072#1096#1077#1085#1080#1077' '#1087#1086#1096#1083#1080#1085#1099' '#1058#1057
              object lciSumTSRest: TdxLayoutItem
                Tag = 33
                Caption = #1054#1089#1090#1072#1090#1086#1082
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSumTSRest
                ControlOptions.ShowBorder = False
              end
              object lciSumTSLocked: TdxLayoutItem
                Tag = 33
                Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSumTSLocked
                ControlOptions.ShowBorder = False
              end
              object lciSumTSAvailable: TdxLayoutItem
                Tag = 33
                Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtSumTSAvailable
                ControlOptions.ShowBorder = False
              end
            end
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
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 943
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 585
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 611
        Width = 943
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 940
        Height = 585
      end
    end
    object tabDecisions: TcxTabSheet [5]
      Caption = #1056#1077#1096#1077#1085#1080#1103'/'#1040#1082#1090#1099
      ImageIndex = 6
      OnShow = tabDecisionsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 943
        Height = 614
        ClientRectBottom = 590
        ClientRectRight = 943
      end
    end
  end
  inherited ActionList: TActionList
    Left = 472
    Top = 243
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actPrint: TAction
      Visible = True
      OnExecute = actPrintExecute
    end
    object actAnnul: TAction
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actAnnulExecute
      OnUpdate = actAnnulUpdate
    end
    object actPayOff: TAction
      Caption = #1055#1086#1075#1072#1089#1080#1090#1100
      OnExecute = actPayOffExecute
      OnUpdate = actPayOffUpdate
    end
    object actPayIncome: TAction
      Caption = #1055#1083#1072#1090#1077#1078' '#1087#1086#1089#1090#1091#1087#1080#1083
      OnExecute = actPayIncomeExecute
      OnUpdate = actPayIncomeUpdate
    end
    object actPayOffRet: TAction
      Category = 'Decisions'
      Caption = #1074#1077#1088#1085#1091#1090#1100
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
      ImageIndex = 6
      OnExecute = actPayOffRetExecute
      OnUpdate = actPayOffRetUpdate
    end
    object actPayOffRetY: TAction
      Category = 'Decisions'
      Caption = #1074#1077#1088#1085#1091#1090#1100' '#1087#1086' '#1058#1057
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077' '#1087#1086' '#1058#1057
      ImageIndex = 6
      OnExecute = actPayOffRetYExecute
      OnUpdate = actPayOffRetYUpdate
    end
    object actPayOffReuse: TAction
      Category = 'Decisions'
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1074' '#1089#1095#1077#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      ImageIndex = 7
      OnExecute = actPayOffReuseExecute
      OnUpdate = actPayOffRetUpdate
    end
    object actPayOffReuseY: TAction
      Category = 'Decisions'
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1074' '#1089#1095#1077#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1087#1086' '#1058#1057
      ImageIndex = 7
      OnExecute = actPayOffReuseYExecute
      OnUpdate = actPayOffRetYUpdate
    end
    object actPayOffDebt: TAction
      Tag = 1
      Category = 'Decisions'
      Caption = #1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1074' '#1089#1095#1077#1090' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      ImageIndex = 8
      OnExecute = actPayOffDebtExecute
      OnUpdate = actPayOffRetUpdate
    end
    object actPayOffDebtTS: TAction
      Tag = 2
      Category = 'Decisions'
      Caption = #1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1087#1086' '#1058#1057
      Hint = 
        #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077' '#1074' '#1089#1095#1077#1090' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1087#1086' ' +
        #1074#1074#1086#1079#1085#1086#1081' '#1087#1086#1096#1083#1080#1085#1077' '#1058#1057
      ImageIndex = 8
      OnExecute = actPayOffDebtExecute
      OnUpdate = actPayOffDebtTSUpdate
    end
    object actDecOffsetObligation: TAction
      Category = 'Decisions'
      Caption = #1055#1083#1072#1090#1077#1078#1077#1081
      OnExecute = actDecOffsetObligationExecute
    end
    object actDecDebtOffset: TAction
      Tag = 1
      Category = 'Decisions'
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081
      Hint = #1087#1083#1072#1090#1077#1078#1077#1081
      ImageIndex = 8
      OnExecute = actDecDebtOffsetExecute
      OnUpdate = actPayOffRetUpdate
    end
    object actDecDebtOffsetTS: TAction
      Tag = 2
      Category = 'Decisions'
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
      ImageIndex = 8
      OnExecute = actDecDebtOffsetExecute
      OnUpdate = actPayOffDebtTSUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 284
    Top = 107
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 556
    Top = 107
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
    Left = 592
    Top = 107
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 500
    Top = 115
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 528
    Top = 107
  end
  inherited imglAction: TImageList
    Left = 108
    Top = 403
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFF700EFEFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6CEF7004A52EF001829EF000818EF000818EF001829EF004A52EF00C6CE
      F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00636B
      EF001021EF001021EF004252EF007B84EF007B84EF004A52EF001829EF001021
      EF00636BE700FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00636BE7001021
      EF00394AE700EFEFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5EF002131
      EF001829EF00636BE700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00BDBDF7001021EF00424A
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7F7001829E7002931
      EF004A5AEF001021EF00BDBDEF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF003942E7001021EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002131EF002129FF00D6DE
      F700FFFFFF001829EF003942EF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF001021EF00636BF700B5B5
      A5004A4A4A00BDBDBD00E7E7E7006B6B5A00394AE7001829F70021296B00FFFF
      FF0063635200525AE7001021EF00F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6F7001021EF00A5ADFF004A4A
      4200D6D6D600000000005A5239003139C6001021EF00212994007B7B6B007373
      730042423900A5ADFF001021EF00D6D6F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6D6F7001021EF00A5ADFF004A4A
      420073737300100800008C94F7000818E7006B73FF00080800007B7B7B00B5B5
      B500080000009494EF001021EF00D6D6F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7F7FF001021EF005A63F700EFEF
      D600BDBDAD009CA5E7001821F700394AE700FFFFFF00C6BDBD00FFFFFF00FFFF
      FF00FFFFF7005A63F7001021E700F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF003942E7001021EF00FFFF
      FF00DEDEFF001821EF002131E700FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001021EF003942EF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00B5BDEF001021EF004A5A
      EF002931EF001829EF00E7EFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00424AE7001021EF00BDBDEF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF005A6BE7001829
      EF002131EF00B5B5EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFF700394A
      EF001021EF00636BEF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00636B
      E7001021EF001829EF004A52EF007B84EF007B84EF004A52EF001021EF001021
      EF00636BE700FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CECEF7004252EF001829EF000818EF000818EF001829EF004A52EF00C6CE
      EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFF700EFEFF700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5636B00A563
      6B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
      6B00A5636B00A5636B00A5636B00000000000000000000000000000000000000
      00000000000000000000000000000000000021842900398C4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000108CBD001894C60000639400000000000000
      000000000000000000000000000000000000000000005ABD6300089C100010A5
      100010A5180010A5180008A510000000000000000000DED6D600B59494009C5A
      4A008C393100D6C6C600000000000000000000000000000000004A526300FFEF
      C600F7D6B500EFD6AD00EFCE9C00EFCE9400EFC68C00EFBD8400EFBD7B00EFBD
      8400EFBD8400EFC68400A5636B00000000000000000000000000000000000000
      0000000000000000000000000000000000006BA57300298C3900000000000000
      000000000000000000000000000000000000000000000000000000000000108C
      BD00108CBD00085A84000884B500109CCE00189CCE000873A500085A84002994
      BD002194BD0000000000000000000000000000000000000000004AB552004ADE
      6B0063FF9C0073FFB50010A5180000000000B55A3100CE7B4A00EFA57300FFC6
      8C00D6845A007B181000D6C6CE000000000000000000636B8400186BC600636B
      8400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC68C00EFBD8400EFBD
      7B00EFBD7B00EFC68400A5636B00000000000000000000000000000000000000
      000000000000000000000000000000000000319C390063F78C00319C3900639C
      6B0000000000000000000000000000000000000000000000000000000000188C
      BD0021A5D600089CCE00085A840008B5EF0029CEF700188CBD0042ADD6004AB5
      D600218CB50000000000000000000000000000000000B5D6B50018AD290052EF
      7B0052F784006BFFA50010A5100000000000BD633100FFCE9C00F7B57B00EFA5
      6B00DE8C63008C210800A5736B0000000000000000000000000031A5FF001073
      D6006B6B8400F7DEBD00EFD6B500EFCEA500EFCE9C00EFC69400EFC68C00EFBD
      8400EFBD7B00EFC68400A5636B00000000000000000000000000000000000000
      00000000000000000000000000000000000031A54A005AF784005ADE7B001873
      210000000000000000000000000000000000000000001073A500085A840031A5
      CE006BD6EF0031ADD60021BDE70008CEFF0021D6FF0042C6EF005AB5D6009CD6
      E70073BDD600085A84000000000000000000000000003194390039DE5A0042E7
      6B0042DE630010A5210010A5100000000000BD632900F7AD7B00E79C6B00E794
      5A00DE9463009C3110009C5A5200000000000000000000000000A5635A0031A5
      FF001073D6005A638400F7DEBD00EFD6AD00EFCEA500EFCE9C00EFC69400EFC6
      8C00EFBD8400EFC68400A5636B00000000000000000063A56300217B29000000
      0000000000000000000000000000000000006BA573005AEF84005AF7840052DE
      73004A8C4A000000000000000000000000000000000042A5CE00299CC60039AD
      D6007BE7FF0073EFFF0039DEFF0010CEFF0008CEFF0039DEFF005AE7FF0063E7
      FF000884BD00108CC600188CBD000000000000000000108C180031D64A0029C6
      42005AB55A00C6DECE00189C210000000000C66B2900E7946300E7946B00E79C
      7300EFB58C00BD5A39009C4A3100000000000000000000000000A5736B00FFF7
      EF0031A5FF00427BAD008C635A00AD7B730094635A00AD7B6B00CEA58400EFC6
      9400EFC68C00EFC68400A5636B00000000000000000063A5630039BD5A002184
      3100000000000000000000000000398C4A0052DE7B005AEF84005AEF84005AF7
      8400297B310000000000000000000000000000000000007BAD000884BD0031B5
      E70063D6F7007BEFFF0052C6E70042A5BD00319CBD0010B5E70000C6FF0000C6
      FF0000C6FF0000BDF70000A5D6000000000000000000318C310029CE42004AA5
      4A000000000000000000D6E7DE0000000000DE944A00EFAD6B00FFC69C00F7AD
      7B00E7946300D67B4A0094392100000000000000000000000000A5736B00FFFF
      FF00F7EFE700AD8C8C00B58C8400DEBDA500EFD6B500D6B59C00B58C7300CEA5
      8400EFC69400EFC68C00A5636B00000000000000000063A5630039BD5A0039BD
      63002184310000000000217B290039BD630052DE7B0052DE7B005AEF84005AEF
      8400297B3100000000000000000000000000000000000873A500109CD60021AD
      DE0052CEF7007BB5C6007B7B7B007B7B7B007B7B7B007B7B7B0029ADCE0000C6
      FF0008C6FF000884BD000084BD00000000000000000084ADAD00007B0800184A
      94002131C6002129AD005A5AB500BDC6DE0000000000E7BD9C00C6733100BD73
      4200BD846B00C6A59400D6CECE00000000000000000000000000BD846B00FFFF
      FF00FFF7EF00AD847B00DEC6B500F7E7CE00F7E7C600FFFFF700D6B59C00AD7B
      6B00EFCE9C00EFCE9400A5636B00000000000000000063A5630039BD5A0039BD
      5A0039B55A00186B180039B552004AD673004ADE730052DE7B0052DE7B0052DE
      7B00297B310000000000000000000000000000000000087BAD00109CD60018A5
      DE0039C6F7007B7B7B00E7DEDE009C9C9C00948C8C00D6A5A5007B7B7B0039D6
      FF0084EFFF00A5EFFF002184AD000000000000000000214AF70073C6A5007BC6
      CE0063A5FF00296BFF000031FF002121A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD846B00FFFF
      FF00FFFFFF0094636300F7EFDE00F7EFDE00F7E7CE00FFFFEF00EFD6B5009463
      5A00EFCEA500F7D6A500A5636B00000000000000000063A5630031B54A0031BD
      520039BD5A0039BD630039CE6B0039CE6B004AD673004AD6730052DE7B00319C
      39004A8C4A00000000000000000000000000000000000873A5000884BD001094
      D60029B5EF007B7B7B00E7DED6009C9C9C00948C8C00D6A5A5007B7B7B0063DE
      FF0094E7F70073BDD600298CB50000000000000000007384EF0084BDFF0094D6
      FF005A94FF001852FF000021E7006B73BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00B58C8400DEC6C600F7EFE700F7EFDE00FFFFD600DEBDA500AD7B
      7300F7D6AD00EFCEA500A5636B00000000000000000063A5630031B54A0031B5
      4A0039BD5A0039BD5A0039CE6B0039CE6B0039D66B004AD6730039BD6300217B
      290000000000000000000000000000000000000000000000000000639400108C
      C60021ADE7007B7B7B00E7DED6009C9C9C00948C8C00D6A5A5007B7B7B004AD6
      FF004ABDDE00005A8C00000000000000000000000000DEE7EF00294AEF00ADEF
      FF005294FF000842FF001010AD00DEDEEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6946B00FFFF
      FF00FFFFFF00D6BDBD00BD949400DEC6C600F7EFDE00DEC6B500B58C8400B58C
      7B00DECEB500B5AD9400A5636B00000000000000000063A5630029AD390029B5
      390031B54A0031BD520039BD5A0039BD630039CE6B0039CE6B00297B31000000
      000000000000000000000000000000000000000000000000000000000000006B
      A5000073AD007B7B7B00E7DEDE009C9C9C00948C8C00D6A5A5007B7B7B000884
      AD00107BA50000000000000000000000000000000000000000007B84EF007BB5
      F7005A94FF000021E7007B7BCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00D6BDBD00B58C840094636300AD847B00CEA59C00A56B
      5A00A56B5A00A56B5A00A5636B00000000000000000063A5630029AD390029AD
      390031B54A0031B54A0039BD5A0039BD5A0039CE630031A54A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00DEDEDE009C9C9C00948C8C00CEA5A5007B7B7B000000
      0000000000000000000000000000000000000000000000000000DEE7EF00294A
      DE005A9CFF001010B500DEE7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DE9C7300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700D6BDBD00A56B
      5A00E79C5200E78C3100B56B4A00000000000000000063A5630021A5290021AD
      310029AD390029B5390031B54A0031BD520039BD5A0039BD6300187321000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B009C9C9C008C8C8C00847B7B00948C8C007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000007B84
      E7001839D600848CD60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEC6C600A56B
      5A00FFB55A00BD7B5A0000000000000000000000000063A5630021A5290021A5
      290029AD390029AD390031B54A0031B54A0031BD520039BD5A00299C3900297B
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00D6D6D600B5B5B5008C8C8C009C8C8C007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000DEE7
      EF003942BD00E7E7EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00F7F7
      EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00D6BDBD00A56B
      5A00BD846B000000000000000000000000000000000063A56300189C180018A5
      210021A5290021AD310029AD390029B5390031B54A0031BD520039BD5A0039BD
      5A00297B31000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00DEDEDE00E7E7E700ADADAD008C8484007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD7B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00A56B
      5A00000000000000000000000000000000000000000063A56300188418001884
      18001884210018842100218C2900218C2900218C3100218C3100299C3900299C
      3900217B29002173290000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE0000000000A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B730094635A00000000000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B584840000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE000000000000000000A57B7300F7E7D600F7E7
      D600FFEFD600EFDEBD00FFE7C600FFDEBD00FFDEBD00FFDEB500FFD6AD00FFD6
      A500FFD6A50094636300000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B584840000000000000000000031DE000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE00000000000000000000000000AD847B00F7E7DE00F7E7
      DE00009C0000ADDEA50073C6730042AD310084BD5A00EFD6A500FFD6AD00FFD6
      A500FFD6A50094636300000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B584840000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE0000000000000000000000000000000000B5847B00F7EFDE00F7EF
      DE00009C0000009C0000009C0000009C0000009C000042AD2900FFDEB500FFD6
      AD00FFD6AD009C6B6300000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000000000000031EF000031
      DE000031DE000031DE00000000000000000000000000000000000031DE000031
      DE000000000000000000000000000000000000000000B58C7B00F7EFE700F7EF
      E700009C0000009C0000109C0800CED6A500FFE7CE0021A51800FFDEB500FFD6
      B500FFD6B5009C6B6300000000000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      00000000000000000000000000000000000000000000BD8C7B00F7EFEF00F7EF
      EF00009C0000009C0000009C0000009C0000FFE7CE00EFDEBD00FFDEB500FFD6
      B500FFDEB500A5736B00000000000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000000000000000
      0000000000000031DE000031E7000031E7000031E7000031DE00000000000000
      00000000000000000000000000000000000000000000C6948400FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00EFE7C600EFE7C600FFE7CE00FFDE
      BD00FFDEBD00A5736B00000000000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD5252000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000000000000000000000000
      000000000000000000000031E7000031E7000031EF0000000000000000000000
      00000000000000000000000000000000000000000000CE9C8400FFF7F700FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00009C0000009C0000009C0000FFEFD600FFE7
      C600FFE7C600AD736B00000000000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000000000000000000000000
      0000000000000031DE000031EF000031E7000031EF000031F700000000000000
      00000000000000000000000000000000000000000000D6A58400FFFFFF00FFFF
      FF00109C1000ADDEA500FFF7EF00ADDEA500009C0000009C0000FFEFD600FFE7
      CE00FFE7C600AD7B6B00000000000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000000000000000
      00000031F7000031EF000031E70000000000000000000031F7000031F7000000
      00000000000000000000000000000000000000000000DEAD8C00FFFFFF00FFFF
      FF0073C67300009C0000009C0000009C0000009C0000009C0000FFEFD600FFEF
      D600FFE7CE00AD7B7300000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000000000000031
      FF000031EF000031F700000000000000000000000000000000000031FF000031
      F7000000000000000000000000000000000000000000DEAD8C00FFFFFF00FFFF
      FF00FFFFFF0073C67300009C0000009C0000ADDEA500009C0000FFEFD600FFCE
      C600FFB5B500B57B7300000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000000000000031F7000031
      F7000031FF000000000000000000000000000000000000000000000000000031
      F7000031F70000000000000000000000000000000000E7B58C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00F7DECE00B584
      7300B5847300B5847300000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000000000000031F7000031F7000031
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000031F700000000000000000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7E7D600B584
      7300EFA55200D6AD9400000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000031F7000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7EFEF00EFDED600B584
      7300DEB59C0000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000031F7000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7BD9400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B584
      7300000000000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000E7C6B500EFCE
      B500EFCEB500EFCEB500EFCEB500E7C6B500E7C6B500EFCEB500D6BDB500BD84
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000000000000000FFFFC001FF3FFE3F8183C001FF3FE007
      C1018001FF0FE0078101C001FF0F80038101C0019F0780018101C0018E078001
      8D01C001840780018081C0018007800180FFC0018007800180FFC001800FC003
      80FFC001801FE007C1FFC001803FF81FC1FFC001801FF81FE3FFC003800FF81F
      E3FFC0078007F81FFFFFC00F8003FC3FFFFFC001C001FFFC80038000C0019FF9
      80038000C0018FF380038000C00187E780038000C001C3CF80038000C001F11F
      80038000C001F83F80038000C001FC7F80038000C001F83F80038000C001F19F
      80038000C001E3CF80038000C001C7E780038000C0018FFB80038000C0031FFF
      80078000C0073FFF800FC001C00FFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited imglLarge: TImageList
    Left = 184
    Top = 371
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
            Item = bbPrint
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
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = barSubIPayOff
            Visible = True
          end
          item
            Item = dxBarButton3
            Visible = True
          end
          item
            Item = btnCreateActCorrOB
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      #1054#1089#1085#1086#1074#1085#1086#1077
      #1042#1080#1076
      #1056#1077#1096#1077#1085#1080#1103)
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    Left = 344
    Top = 195
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarButton1: TdxBarButton
      Action = actAnnul
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
    object barSubIPayOff: TdxBarSubItem
      Caption = #1055#1086#1075#1072#1089#1080#1090#1100
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = barBtnPayback
          Visible = True
        end
        item
          Item = barSubReuse
          Visible = True
        end>
    end
    object barBtnPayback: TdxBarSubItem
      Caption = #1042#1077#1088#1085#1091#1090#1100
      Category = 2
      Visible = ivAlways
      ImageIndex = 6
      ItemLinks = <
        item
          Item = barBtnDecisionPayback
          Visible = True
        end
        item
          Item = barBtnDecisionPaybackY
          Visible = True
        end>
    end
    object barBtnDecisionPayback: TdxBarButton
      Action = actPayOffRet
      Category = 2
    end
    object barBtnDecisionPaybackY: TdxBarButton
      Action = actPayOffRetY
      Category = 2
    end
    object barSubReuse: TdxBarSubItem
      Caption = #1047#1072#1095#1077#1090' '#1074' '#1089#1095#1077#1090
      Category = 2
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1105#1090#1077
      Visible = ivAlways
      ImageIndex = 7
      ItemLinks = <
        item
          Item = barBtnReuse
          Visible = True
        end
        item
          Item = bsiPayDebts
          Visible = True
        end
        item
          Item = BarSubItemDecOffsetObligation
          Visible = True
        end
        item
          Item = BarSubItemDecDebtOffset
          Visible = True
        end>
    end
    object barBtnReuse: TdxBarSubItem
      Caption = #1073#1091#1076#1091#1097#1080#1093
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = barBtnDecisionReuse
          Visible = True
        end
        item
          Item = dxBarButton4
          Visible = True
        end>
    end
    object barBtnDecisionReuse: TdxBarButton
      Action = actPayOffReuse
      Category = 2
    end
    object dxBarButton4: TdxBarButton
      Action = actPayOffReuseY
      Category = 2
    end
    object bsiPayDebts: TdxBarSubItem
      Caption = #1087#1086#1075#1072#1096#1077#1085#1080#1103
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = barBtnPaydebt
          Visible = True
        end
        item
          Item = barBtnPaydebtTS
          Visible = True
        end>
    end
    object barBtnPaydebt: TdxBarButton
      Action = actPayOffDebt
      Category = 2
    end
    object barBtnPaydebtTS: TdxBarButton
      Action = actPayOffDebtTS
      Category = 2
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object BarSubItemDecOffsetObligation: TdxBarSubItem
      Caption = #1091#1087#1083'. '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081' ('#1089#1090'. 145)'
      Category = 0
      Description = #1091#1087#1083'. '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081' ('#1089#1090'. 145)'
      Visible = ivAlways
      ItemLinks = <
        item
          Item = BarBtnDecOffsetObligation
          Visible = True
        end
        item
          Item = BarBtnDecOffsetObligationTS
          Visible = True
        end>
    end
    object BarBtnDecOffsetObligation: TdxBarButton
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081
      Category = 0
      Description = #1055#1083#1072#1090#1077#1078#1077#1081
      Hint = #1087#1083#1072#1090#1077#1078#1077#1081
      Visible = ivAlways
      OnClick = actDecOffsetObligationExecute
    end
    object BarBtnDecOffsetObligationTS: TdxBarButton
      Tag = 1
      Caption = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
      Category = 0
      Description = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
      Hint = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
      Visible = ivAlways
      OnClick = actDecOffsetObligationExecute
    end
    object BarSubItemDecDebtOffset: TdxBarSubItem
      Caption = #1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1073#1103#1079#1072#1085#1085#1086#1089#1090#1080' '#1087#1086' '#1091#1087#1083'. ('#1089#1090'. 154)'
      Category = 0
      Description = #1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1073#1103#1079#1072#1085#1085#1086#1089#1090#1080' '#1087#1086' '#1091#1087#1083'. ('#1089#1090'. 154)'
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton5
          Visible = True
        end
        item
          Item = dxBarButton6
          Visible = True
        end>
    end
    object dxBarButton5: TdxBarButton
      Action = actDecDebtOffset
      Category = 0
      Description = #1087#1083#1072#1090#1077#1078#1077#1081
    end
    object dxBarButton6: TdxBarButton
      Action = actDecDebtOffsetTS
      Category = 0
      Description = #1087#1083#1072#1090#1077#1078#1077#1081' '#1058#1057
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
        DataType = ftBoolean
        Name = 'AnnulOnly'
        ParamType = ptUnknown
        Value = True
        AcceptedSources = [asParam]
      end>
    Left = 240
    Top = 111
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT t.*,'
      '       decode(t.TRTYPE,0,'#39#1054#1073#1099#1095#1085#1072#1103#39',1,'#39#1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103#39') sTRTYPE,'
      '       decode(t.SIGN_CORR,0,'#39#1053#1077#1090#39',1,'#39#1044#1072#39') sSIGN_CORR,'
      '       decode(t.SIGN_GENPROV,0,'#39#1053#1077#1090#39',1,'#39#1044#1072#39') sSIGN_GENPROV,'
      '       fdc_decl_ded_get_summ_decl( t.id ) AS AvailRestSum,'
      '       p_tr.getlockedsum(t.id) AS LockedSum,'
      
        '       fdc_decl_ded_get_summ_decl( t.id )+ p_tr.getlockedsum(t.i' +
        'd) AS restsum,'
      '       fdc_decl_ded_get_summ_decl( t.id,'#39'N'#39' ) AS restsum_n,'
      '       fdc_decl_ded_get_summ_decl( t.id,'#39'Y'#39' ) AS restsum_y,'
      
        '       fdc_decl_ded_get_summ_decl( t.id,'#39'Y'#39' ) + p_tr.getlockedsu' +
        'm(t.id, '#39'Y'#39') AS restsum_ts,'
      '       p_tr.getlockedsum(t.id, '#39'Y'#39') AS LockedSum_TS,'
      '       p_tr.GetOverridedDoc(t.id) AS OverridedDocId,'
      '       (CASE'
      '          WHEN p_tr.GetOverridedDoc(t.id) IS NOT NULL THEN'
      '           (SELECT cd.name'
      '              FROM fdc_object_lst cd'
      '              WHERE cd.id = p_tr.GetOverridedDoc(t.id) )'
      '         ELSE NULL'
      '       END) AS Annul_DeclNo,'
      '       p_tr.IsDecReuse(t.id,'#39'N'#39') as IsDecReuse,'
      '       p_tr.IsDecPayback(t.id,'#39'N'#39') as IsDecPayback,'
      '       p_tr.IsActDeduction(t.id) as IsActDeduction,'
      '       '#39'01 - '#1044#1077#1085#1077#1078#1085#1099#1077' '#1089#1088#1077#1076#1089#1090#1074#1072' ('#1076#1077#1085#1100#1075#1080')'#39' col2,'
      '       decode(t.SIGN_GENPROV,0,'#39#39',1,'#39#1043#1054#39') COL3,'
      '       decode(t.SIGN_CORR,0,'#39#39',1,'#39'X'#39') SIGN_CORR_Y,'
      '       decode(t.SIGN_CORR,1,'#39#39',0,'#39'X'#39') SIGN_CORR_N,'
      '       F_ASBC_TRELFORM_SUBJECT(t.SUBJECT_ID) as SDECL_NAME_REP,'
      
        '       F_ASBC_TRELFORM_SUBJECT(case when t.SUBJECT_ID = t.CARRIE' +
        'R_ID then null else t.CARRIER_ID end) as SCARRIER_NAME_REP,'
      '       '#39#39' sGARANT,'
      
        '       (select sum(ch.CHARGE_REST) from fdc_decl_charge_lst ch w' +
        'here ch.decl_id = t.id) as sum_ost'
      'from fdc_tr_Lst t'
      'where t.ID = :ID')
    AfterInsert = dsDataAfterInsert
    Left = 364
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataNUM_MPO: TStringField
      FieldName = 'NUM_MPO'
      ReadOnly = True
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
      Size = 3
    end
    object dsDataORDER_TYPE: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'ORDER_TYPE'
      Required = True
      Size = 1
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
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Required = True
      Size = 10
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataDECL_NAME: TStringField
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
    object dsDataCUSTOM_MODE_ID: TFloatField
      DisplayLabel = #1056#1077#1078#1080#1084'2'
      FieldName = 'CUSTOM_MODE_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataERRPAY_COUNT: TIntegerField
      FieldName = 'ERRPAY_COUNT'
    end
    object dsDataPAYTIME_FINISHED: TIntegerField
      FieldName = 'PAYTIME_FINISHED'
    end
    object dsDataDECISION_CODE: TStringField
      FieldName = 'DECISION_CODE'
      Size = 2
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
    object dsDataCARRIER_ID: TFloatField
      FieldName = 'CARRIER_ID'
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDEBT_COUNT: TFloatField
      FieldName = 'DEBT_COUNT'
    end
    object dsDataANN_DATE: TDateTimeField
      FieldName = 'ANN_DATE'
    end
    object dsDataPAYOFF_DATE: TDateTimeField
      FieldName = 'PAYOFF_DATE'
    end
    object dsDataDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsDataSTATESYSNAME: TStringField
      FieldName = 'STATESYSNAME'
      Size = 1500
    end
    object dsDataOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
    object dsDataAVAILRESTSUM: TFloatField
      DisplayLabel = #1044#1086#1089#1090#1091#1087#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'AVAILRESTSUM'
      DisplayFormat = ',0.00'
    end
    object dsDataLOCKEDSUM: TFloatField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
      FieldName = 'LOCKEDSUM'
      DisplayFormat = ',0.00'
    end
    object dsDataRESTSUM: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'RESTSUM'
      DisplayFormat = ',0.00'
    end
    object dsDataOVERRIDEDDOCID: TFloatField
      FieldName = 'OVERRIDEDDOCID'
    end
    object dsDataANNUL_DECLNO: TStringField
      FieldName = 'ANNUL_DECLNO'
      Size = 1500
    end
    object dsDataDATE_EXEC: TDateTimeField
      FieldName = 'DATE_EXEC'
    end
    object dsDataRESTSUM_N: TFloatField
      FieldName = 'RESTSUM_N'
      currency = True
    end
    object dsDataRESTSUM_Y: TFloatField
      FieldName = 'RESTSUM_Y'
      currency = True
    end
    object dsDataISDECREUSE: TStringField
      FieldName = 'ISDECREUSE'
      Size = 4000
    end
    object dsDataISDECPAYBACK: TStringField
      FieldName = 'ISDECPAYBACK'
      Size = 4000
    end
    object dsDataSUM_OST: TFloatField
      FieldName = 'SUM_OST'
    end
    object dsDataRESTSUM_TS: TFloatField
      FieldName = 'RESTSUM_TS'
    end
    object dsDataLOCKEDSUM_TS: TFloatField
      FieldName = 'LOCKEDSUM_TS'
    end
    object dsDataMODIFY_DATE: TDateTimeField
      FieldName = 'MODIFY_DATE'
    end
    object dsDataANNUL_REASON: TStringField
      FieldName = 'ANNUL_REASON'
      Size = 4000
    end
    object dsDataSIGN_DUPLICATE: TStringField
      FieldName = 'SIGN_DUPLICATE'
      Size = 1
    end
    object dsDataANNUL_TR_ID: TFloatField
      FieldName = 'ANNUL_TR_ID'
    end
    object dsDataANNUL_TR_DOC_NUMBER: TStringField
      FieldName = 'ANNUL_TR_DOC_NUMBER'
      Size = 100
    end
    object dsDataDUPLICATE_TR_ID: TFloatField
      FieldName = 'DUPLICATE_TR_ID'
    end
    object dsDataDUPLICATE_TR_DOC_NUMBER: TStringField
      FieldName = 'DUPLICATE_TR_DOC_NUMBER'
      Size = 100
    end
    object dsDataISACTDEDUCTION: TStringField
      FieldName = 'ISACTDEDUCTION'
      Size = 4000
    end
    object dsDataSTRTYPE: TStringField
      FieldName = 'STRTYPE'
    end
    object dsDataSSIGN_GENPROV: TStringField
      FieldName = 'SSIGN_GENPROV'
    end
    object dsDataSSIGN_CORR: TStringField
      FieldName = 'SSIGN_CORR'
    end
    object dsDataTRTYPE: TIntegerField
      FieldName = 'TRTYPE'
    end
    object dsDataCOL2: TStringField
      FieldName = 'COL2'
      Size = 50
    end
    object dsDataCOL3: TStringField
      FieldName = 'COL3'
    end
    object dsDataSGARANT: TStringField
      FieldName = 'SGARANT'
    end
    object dsDataSIGN_CORR_Y: TStringField
      FieldName = 'SIGN_CORR_Y'
    end
    object dsDataSIGN_CORR_N: TStringField
      FieldName = 'SIGN_CORR_N'
    end
    object dsDataSDECL_NAME_REP: TStringField
      FieldName = 'SDECL_NAME_REP'
      Size = 1500
    end
    object dsDataSCARRIER_NAME_REP: TStringField
      FieldName = 'SCARRIER_NAME_REP'
      Size = 1500
    end
  end
  inherited srcData: TDataSource
    Left = 368
    Top = 355
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_tr_add(pcustomscode => :customs_code,'
      '                 pregdate => :reg_date,'
      '                 pdeclno => :decl_no,'
      '                 psubjectid => :subject_id,'
      '                 pcurrencyid => :currency_id,'
      '                 pcustommodeid => :custom_mode_id,'
      '                 pnummpo => :num_mpo,'
      '                 pregim => :regim,'
      '                 pmethmove => :meth_move,'
      '                 pordertype => :order_type,'
      '                 psumrub => :sum_rub,'
      '                 pdescript => :descript,'
      '                 pDecision_Code => :Decision_Code,'
      '                 pCarrier_ID => :Carrier_Id,'
      '                 pOverrided_tr_id => :OVERRIDEDDOCID,'
      '                 pDateExec  => :DATE_EXEC'
      '    );'
      'end;')
    Left = 496
    Top = 103
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
        Name = 'descript'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Carrier_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OVERRIDEDDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_EXEC'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_tr.SetExecDate('
      '      pID       => :ID'
      '     ,pDateExec => :DATE_EXEC'
      '    );'
      'end;')
    Left = 484
    Top = 151
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'DATE_EXEC'
        ParamType = ptUnknown
      end>
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 784
    Top = 215
  end
  inherited dsUpdateState: TfdcQuery
    Left = 544
    Top = 79
  end
  inherited dsTransit: TfdcQuery
    Left = 596
    Top = 143
  end
  inherited dsState: TfdcQuery
    Left = 488
    Top = 79
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 700
    Top = 231
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 154
    Top = 440
    object sqlSetAnnul: TsqlOp
      SQL.Strings = (
        'begin'
        '  Fdc_set_tr_state_Annul(:ID,:NOTE);'
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
        '  Fdc_set_tr_state_payoff(:ID,:NOTE,:RESERVESUM);'
        'end;')
    end
    object sqlCreateDecisionPayback: TsqlOp
      SQL.Strings = (
        ' begin'
        '  :result := fdc_create_payback_deposit(pIdTr      =>  :id'
        '                                       ,pIdDec     => :DecId'
        '                                       ,pIsTS      => :is_ts'
        '                                       ,pSubjectId => :payer_id'
        '                                       ,pDebtSum   => :debt_sum'
        
          '                                       ,pDebtPaySumma  => :DebtP' +
          'aySumma'
        
          '                                       ,pDebtPenySumma => :DebtP' +
          'enySumma'
        
          '                                       ,pDebtProcSumma => :DebtP' +
          'rocSumma'
        ' );'
        'end;')
    end
    object sqlCreateDecisionReuse: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  :result := p_decision_payment.CreateForDeposit(pDepositID => :' +
          'id'
        
          '                                                ,pDecId     => :' +
          'dec_id'
        
          '                                                ,pIsTS      => :' +
          'is_ts '
        
          '                                                ,pSubjectId => :' +
          'payer_id'
        
          '                                                ,pDebtSum   => :' +
          'debt_sum'
        
          '                                                ,pDebtPaySumma  ' +
          '=> :DebtPaySumma'
        
          '                                                ,pDebtPenySumma ' +
          '=> :DebtPenySumma'
        
          '                                                ,pDebtProcSumma ' +
          '=> :DebtProcSumma'
        ''
        ' );'
        'end;')
    end
    object sqlIsPayed: TsqlOp
      SQL.Strings = (
        'begin'
        '  select to_number( NVL( sum(s), 0 ) )'
        '    into :result'
        '    from ( select + nvl(sum(summa),0) as s'
        '             from fdc_decl_charge_lst'
        '             where decl_id = :Id'
        '           union all'
        '           select - nvl(sum(summa),0) as s'
        '             from fdc_payment_deduction_lst'
        '             where decl_id = :Id )'
        '    ;'
        'end;')
    end
    object sqlCreateDecisionDebt: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_decision_debts.CreateForDeposit'
        '                     ( :id'
        '                      ,:pSumma'
        '                      ,:is_ts'
        
          '                      ,p_decision_debts.c_ClassSysName_DecDebtsD' +
          'eposit'
        '                     );'
        'end;')
    end
    object sqlExistUnSignedDec: TsqlOp
      SQL.Strings = (
        'begin'
        '  SELECT SUM ( i.dec_sum ) INTO :Result FROM'
        '  ('
        
          '  SELECT NVL(SUM(decode( is_object_in_state(r.REL_OBJECT_ID, '#39'St' +
          'ate.DecisionDebts.Created'#39'), '#39'Y'#39', 1, 0)), 0) as dec_sum'
        '    FROM fdc_rel_tr_dec_lst r'
        '    WHERE r.OBJECT_ID = :id'
        '  UNION ALL'
        
          '  SELECT NVL(SUM(decode( is_object_in_state(r.REL_OBJECT_ID, '#39'St' +
          'ate.DecOffsetObligation.Create'#39'), '#39'Y'#39', 1, 0)), 0) as dec_sum'
        '    FROM fdc_rel_tr_dec_lst r'
        '    WHERE r.OBJECT_ID = :id'
        '   )  i;'
        'end;')
    end
    object sqlGetMaxAmount: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  :TR_Amount := p_decision_debts.GetAvailAmountForDeposit( :pID,' +
          ' :is_ts );'
        '  :RESULT := least( :TR_Amount,'
        
          '                p_decision_debts.GetAmountDebt(:pSubjId, NULL, :' +
          'is_ts) - p_decision_debts.GetLockedAmount(:pSubjId, NULL, :is_ts' +
          ')'
        '              );'
        'END;')
    end
    object sqlCreateDecOffsetObligation: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_dec_offset_obligation.createdecision'
        '   ('
        '      pdepositid  => :depositid'
        '     ,psubjectid  => :subjectid'
        '     ,pcurrencyid => :currencyid'
        '     ,psumma      => :summa'
        '     ,pdecisionid => :decisionid'
        '     ,pists       => :is_ts'
        '   );'
        'end;')
    end
    object sqlCreateDecisionDebtOffset: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := p_decision_debts.CreateForDeposit'
        '                     ( :id'
        '                      ,:pSumma'
        '                      ,:is_ts'
        
          '                      ,p_decision_debts.c_ClassSysName_DecDebtsD' +
          'epOff'
        '                     );'
        'end;')
    end
    object sqlUpdateStatus: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_tr.SetTRStatePayOff(:id);'
        'end;')
    end
    object sqlGetAvailAmountForDeposit: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  :result := p_decision_debts.GetAvailAmountForDeposit(:pId, :pI' +
          'sTS);'
        'end;')
    end
    object sqlSetStatusTR: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_TR.SetTRStatePayOff(:idTr);'
        'end;')
    end
  end
  object qryIsPayed: TOracleQuery
    SQL.Strings = (
      'BEGIN'
      '  SELECT - nvl(sum(summa),0) AS s'
      '    INTO :result'
      '    FROM fdc_payment_deduction_lst'
      '    WHERE decl_id = :Id;'
      ''
      '  :result := :result + fdc_decl_charge_get_summ_decl ( :Id );'
      'END;')
    Session = MainData.Session
    Variables.Data = {
      0300000002000000070000003A524553554C5404000000000000000000000003
      0000003A4944040000000000000000000000}
    Cursor = crSQLWait
    BeforeQuery = qryIsPayedBeforeQuery
    Left = 251
    Top = 274
  end
  object odsGetDecisionId: TOracleDataSet
    SQL.Strings = (
      '                 select d.id '
      '                 from fdc_decision_payment_lst d'
      '                 where exists ( SELECT 1'
      '                                FROM fdc_object_relation rr'
      '                                WHERE rr.object_id     = :pTrID'
      '                                  AND rr.rel_object_id = d.id)'
      '                union all'
      '                select d.id'
      '                from fdc_dec_payback_deposit_lst d,'
      '                     fdc_value_lst v'
      '                where v.ref_object_id = :pTrID'
      '                  and d.id            = v.OWNER_OBJECT_ID')
    Variables.Data = {0300000001000000060000003A5054524944030000000000000000000000}
    Left = 483
    Top = 332
  end
  object dsDebtSum: TOracleDataSet
    SQL.Strings = (
      
        'SELECT nvl(sum(np.duty_summa), 0) + nvl(sum(np.customs_fees), 0)' +
        ' + '
      
        '       nvl(sum(np.excise), 0) + nvl(sum(np.nds), 0) as pay_summa' +
        ','
      '       nvl(sum(np.percent), 0) as proc_summa,'
      '       nvl(sum(np.penalty_summa), 0) as peny_summa'
      'FROM fdc_noticepay_lst np'
      'WHERE np.decl_inn = :DECL_INN'
      
        '  and (:DECL_KPP is null or (:DECL_KPP is not null and np.decl_k' +
        'pp = :DECL_KPP))'
      '  and nvl(np.summa_payed, 0) = 0')
    Variables.Data = {
      0300000002000000090000003A4445434C5F494E4E0500000000000000000000
      00090000003A4445434C5F4B5050050000000000000000000000}
    Session = MainData.Session
    Left = 558
    Top = 331
  end
  object dsetGetAvailSum: TOracleDataSet
    SQL.Strings = (
      'SELECT nvl(SUM(summa), 0) as AvailSum'
      'FROM fdc_payment_deduction_lst'
      'WHERE decl_id = :pDepositId'
      '--AND is_ts = '#39)
    Variables.Data = {
      03000000010000000B0000003A504445504F5349544944030000000000000000
      000000}
    Session = MainData.Session
    Left = 486
    Top = 387
  end
  object RvDataSetConnection1: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dsData
    Left = 843
    Top = 228
  end
end
