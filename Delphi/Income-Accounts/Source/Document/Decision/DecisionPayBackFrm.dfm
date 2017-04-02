inherited DecisionPayBackForm: TDecisionPayBackForm
  Left = 0
  Top = 293
  Width = 1280
  Height = 691
  Caption = 'DecisionPayBackForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1264
    Height = 653
    ClientRectBottom = 629
    ClientRectRight = 1264
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1258
        Height = 598
        inherited edtName: TcxDBTextEdit
          Width = 1397
        end
        inherited edtDescript: TcxDBMemo
          Top = 1272
          TabOrder = 50
          Width = 1172
        end
        object edtDateLastDoc: TcxDBDateEdit [2]
          Left = 671
          Top = 290
          DataBinding.DataField = 'DATE_LAST_DOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 16
          Width = 121
        end
        object edtExcisePay: TcxDBCheckBox [3]
          Left = 21
          Top = 837
          Caption = #1053#1072' '#1087#1086#1082#1091#1087#1082#1091' '#1072#1082#1094#1080#1079#1085#1099#1093' '#1084#1072#1088#1086#1082
          DataBinding.DataField = 'EXCISE_PAY'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 40
          Width = 184
        end
        object edtDecisionCourt: TcxDBCheckBox [4]
          Left = 21
          Top = 783
          Caption = #1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
          DataBinding.DataField = 'DECISION_COURT'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = edtDecisionCourtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 36
          Width = 146
        end
        object edtDateCourt: TcxDBDateEdit [5]
          Left = 332
          Top = 783
          DataBinding.DataField = 'DATE_COURT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 37
          Width = 121
        end
        object edtCourtActAttrs: TcxDBTextEdit [6]
          Left = 599
          Top = 783
          DataBinding.DataField = 'COURT_ACT_ATTRS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 38
          Width = 846
        end
        object edtCustomsDecAttrs: TcxDBTextEdit [7]
          Left = 147
          Top = 810
          DataBinding.DataField = 'CUSTOMS_DEC_ATTRS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 39
          Width = 1298
        end
        object edtReasonAticle: TcxTextEdit [8]
          Left = 1148
          Top = 702
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 32
          Width = 72
        end
        object edtSumma: TcxDBCurrencyEdit [9]
          Left = 60
          Top = 384
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 20
          Width = 1397
        end
        object edtDestSubINN: TcxDBTextEdit [10]
          Left = 147
          Top = 442
          DataBinding.DataField = 'DECL_INN_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 1026
        end
        object edtDestSubKPP: TcxDBTextEdit [11]
          Left = 977
          Top = 442
          DataBinding.DataField = 'DECL_KPP_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 22
          Width = 243
        end
        object edtDestSubj: TfdcObjectLinkEdit [12]
          Left = 147
          Top = 469
          DataBinding.DataField = 'DECL_NAME_DEST'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DESTSUB_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Broker;Subject;Bank'
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
          Style.ButtonStyle = btsHotFlat
          TabOrder = 23
          OnBeforeAcceptObject = edtDestSubjBeforeAcceptObject
          Width = 1298
        end
        object edtDestSubName: TcxDBTextEdit [13]
          Left = 147
          Top = 496
          DataBinding.DataField = 'DECL_NAME_BANK_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 24
          Width = 1298
        end
        object edtDestSubAddr: TcxDBTextEdit [14]
          Left = 147
          Top = 523
          DataBinding.DataField = 'DECL_ADDRESS_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 25
          Width = 1298
        end
        object edtAccount: TcxDBMaskEdit [15]
          Left = 147
          Top = 550
          DataBinding.DataField = 'ACCOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.EditMask = '!99999999999999999999;1;_'
          Properties.MaxLength = 0
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 1298
        end
        object edtBank: TfdcObjectLinkEdit [16]
          Left = 147
          Top = 577
          DataBinding.DataField = 'BANK_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BANK_ID'
          DataBinding.TypeSysName = 'Bank'
          DataBinding.SearchFormClass = 'TBankGridForm'
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
          TabOrder = 27
          OnBeforeAcceptObject = edtBankBeforeAcceptObject
          Width = 1298
        end
        object edtBIC: TcxDBTextEdit [17]
          Left = 147
          Top = 604
          DataBinding.DataField = 'BIC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 28
          Width = 176
        end
        object edtCorrAccount: TcxDBTextEdit [18]
          Left = 386
          Top = 604
          DataBinding.DataField = 'CORR_ACCOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 29
          Width = 1059
        end
        object edtBankAddr: TcxDBTextEdit [19]
          Left = 147
          Top = 631
          DataBinding.DataField = 'DECL_ADR_BANK_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 30
          Width = 1298
        end
        object edtCurrency: TfdcObjectLookupEdit [20]
          Left = 60
          Top = 357
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCurrency
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 19
          Width = 1397
        end
        object cbDecision: TcxComboBox [21]
          Left = 147
          Top = 729
          Enabled = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102' '#1091#1095#1072#1089#1090#1085#1080#1082#1072
            #1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
            #1087#1086' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1084#1091' '#1083#1080#1089#1090#1091
            #1074' '#1087#1086#1088#1103#1076#1082#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1074#1077#1076#1086#1084#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1103
            #1074' '#1089#1074#1103#1079#1080' '#1089' '#1091#1076#1086#1074#1083#1077#1090#1074#1086#1088#1077#1085#1080#1077#1084' '#1078#1072#1083#1086#1073)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 33
          OnClick = cbDecisionPropertiesChange
          Width = 1047
        end
        object cbBeforeAfter: TcxComboBox [22]
          Left = 1099
          Top = 729
          Enabled = False
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1076#1086' '#1074#1099#1087#1091#1089#1082#1072
            #1087#1086#1089#1083#1077' '#1074#1099#1087#1091#1089#1082#1072)
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 34
          OnClick = cbDecisionPropertiesChange
          Width = 121
        end
        object cxDBLabel1: TcxDBLabel [23]
          Left = 717
          Top = 121
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcState
          ParentColor = False
          ParentFont = False
          Style.HotTrack = False
          Height = 21
          Width = 121
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 147
          TabOrder = 11
          Width = 1042
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 993
          TabOrder = 12
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Left = 147
          DataBinding.TypeSysName = 'Declarant;Person;Broker;Subject;Bank'
          TabOrder = 13
          Width = 1298
        end
        inherited edtAppDate: TcxDBDateEdit
          Left = 147
          TabOrder = 14
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Left = 396
          TabOrder = 15
        end
        inherited edtAppNumber: TcxDBTextEdit
          Left = 147
          TabOrder = 17
        end
        inherited edtSignBy: TcxDBTextEdit
          Left = 147
          Top = 1205
          TabOrder = 48
          Width = 1298
        end
        inherited edtSignDate: TcxDBDateEdit
          Left = 147
          Top = 1232
          TabOrder = 49
          Width = 1298
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Left = 147
          Top = 1151
          TabOrder = 46
          Width = 1298
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Left = 147
          Top = 1178
          TabOrder = 47
          Width = 1298
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Left = 147
          Top = 702
          Properties.DropDownListStyle = lsFixedList
          Properties.OnCloseUp = cmbxReasonPropertiesCloseUp
          TabOrder = 31
          Width = 767
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Left = 147
          Width = 1298
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Left = 147
        end
        inherited edtDocCode: TcxDBTextEdit
          Left = 396
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 396
          TabOrder = 18
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Left = 147
          Top = 756
          Properties.DropDownListStyle = lsFixedList
          TabOrder = 35
          Width = 1298
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Left = 147
          Top = 928
          TabOrder = 41
          Width = 1298
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 1013
          Properties.OnChange = nil
          TabOrder = 43
          Width = 1328
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 1040
          Properties.OnChange = nil
          TabOrder = 44
          Width = 1328
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 1067
          Properties.OnChange = nil
          TabOrder = 45
          Width = 1103
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Left = 147
          Top = 955
          TabOrder = 42
          Width = 1298
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 551
          Width = 681
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1099
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentAttrs: TdxLayoutGroup
              object lcGeneralItem1: TdxLayoutItem
                Caption = '   '#1057#1090#1072#1090#1091#1089
                Control = cxDBLabel1
                ControlOptions.ShowBorder = False
              end
            end
          end
          inherited lcgApp: TdxLayoutGroup
            inherited lcgAppDate: TdxLayoutGroup
              object lciDateLastDoc: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                Control = edtDateLastDoc
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lciCurrency: TdxLayoutItem [4]
            Caption = #1042#1072#1083#1102#1090#1072
            Control = edtCurrency
            ControlOptions.ShowBorder = False
          end
          object lciSumma: TdxLayoutItem [5]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          object lcgDestSubject: TdxLayoutGroup [6]
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
            object lcgDestSubINN_KPP: TdxLayoutGroup
              Caption = 'lcgDestSubINN_KPP'
              ShowCaption = False
              Visible = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDestSubINN: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtDestSubINN
                ControlOptions.ShowBorder = False
              end
              object lciDestSubKPP: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1050#1055#1055
                Control = edtDestSubKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDestSubj: TdxLayoutItem
              Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
              Control = edtDestSubj
              ControlOptions.ShowBorder = False
            end
            object lciDestSubName: TdxLayoutItem
              Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1076#1083#1103' '#1073#1072#1085#1082#1072')'
              Control = edtDestSubName
              ControlOptions.ShowBorder = False
            end
            object lciDestSubAddr: TdxLayoutItem
              Tag = 33
              Caption = #1040#1076#1088#1077#1089
              Control = edtDestSubAddr
              ControlOptions.ShowBorder = False
            end
            object lciAccount: TdxLayoutItem
              Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1105#1090
              Control = edtAccount
              ControlOptions.ShowBorder = False
            end
            object lciBank: TdxLayoutItem
              Caption = #1041#1072#1085#1082
              Control = edtBank
              ControlOptions.ShowBorder = False
            end
            object lcgBankAttrs: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciBIC: TdxLayoutItem
                Tag = 33
                Caption = #1041#1048#1050
                Control = edtBIC
                ControlOptions.ShowBorder = False
              end
              object lciCorrAccount: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1086#1088#1088'. '#1089#1095#1105#1090
                Control = edtCorrAccount
                ControlOptions.ShowBorder = False
              end
            end
            object lciBankAddr: TdxLayoutItem
              Tag = 33
              Caption = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072
              Control = edtBankAddr
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgReason: TdxLayoutGroup
            object lcgReasonAticle: TdxLayoutGroup [0]
              Caption = 'lcgReasonAticle'
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciReasonPayback: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
                Control = cmbxReason
                ControlOptions.ShowBorder = False
              end
              object lciReasonAticle: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1057#1090#1072#1090#1100#1103
                Control = edtReasonAticle
                ControlOptions.ShowBorder = False
              end
            end
            object lcgReasonDoc: TdxLayoutGroup [1]
              Enabled = False
              ShowCaption = False
              Visible = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDocBasement: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1086#1082#1091#1084#1077#1085#1090'-'#1086#1089#1085#1086#1074#1072#1085#1080#1077
                Control = cbDecision
                ControlOptions.ShowBorder = False
              end
              object lciBeforeAfter: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
                Caption = #1087#1086' '#1088#1077#1096#1077#1085#1080#1103#1084', '#1087#1088#1080#1085#1103#1090#1099#1084
                Enabled = False
                Visible = False
                Control = cbBeforeAfter
                ControlOptions.ShowBorder = False
              end
            end
            inherited lciSudReason: TdxLayoutItem [2]
            end
            object lcgCourtActAttrs: TdxLayoutGroup [3]
              Caption = 'lcgReasonAttrs'
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDecisionCourt: TdxLayoutItem
                Caption = 'cxDBCheckBox1'
                ShowCaption = False
                Control = edtDecisionCourt
                ControlOptions.ShowBorder = False
              end
              object lciDateCourt: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
                Control = edtDateCourt
                ControlOptions.ShowBorder = False
              end
              object lciCourtActAttrs: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1089#1091#1076#1077#1073#1085#1086#1075#1086' '#1072#1082#1090#1072
                Control = edtCourtActAttrs
                ControlOptions.ShowBorder = False
              end
            end
            object lciCustomsDecAttrs: TdxLayoutItem [4]
              Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1088#1077#1096#1077#1085#1080#1103' '#1058#1054
              Control = edtCustomsDecAttrs
              ControlOptions.ShowBorder = False
            end
            object lciExicePay: TdxLayoutItem [5]
              AutoAligns = [aaVertical]
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = edtExcisePay
              ControlOptions.ShowBorder = False
            end
            inherited lciReason: TdxLayoutItem [6]
              Visible = False
              Control = nil
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1264
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 598
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 626
        Width = 1264
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1261
        Height = 598
      end
    end
    object tabPaymentOrderPayback: TcxTabSheet [3]
      Caption = #1047#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      ImageIndex = 3
      OnShow = tabPaymentOrderPaybackShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1264
        Height = 629
        ClientRectBottom = 605
        ClientRectRight = 1264
      end
    end
    object tabAdvice: TcxTabSheet
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1086#1073' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077
      ImageIndex = 6
      OnShow = tabAdviceShow
    end
    object tabChecks: TcxTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1080' '#1059#1095#1072#1089#1090#1085#1080#1082#1086#1074' '#1042#1069#1044
      ImageIndex = 7
      OnShow = tabChecksShow
    end
  end
  inherited ActionList: TActionList
    object actCancel: TAction
      Category = 'Object'
      Caption = #1054#1090#1082#1072#1079
      Hint = #1054#1090#1082#1072#1079#1072#1090#1100' '#1074' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1080' '#1074#1086#1079#1074#1088#1072#1090#1072
      OnExecute = actCancelExecute
      OnUpdate = actCancelUpdate
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
        FloatLeft = 906
        FloatTop = 352
        FloatClientWidth = 173
        FloatClientHeight = 77
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
            Item = btnPrint
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
            Item = barBtnCancel
            Visible = True
          end
          item
            Item = btGetDebts
            Visible = True
          end
          item
            Visible = True
          end
          item
            Visible = True
          end
          item
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
    object barBtnCancel: TdxBarButton
      Action = actCancel
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end
      item
        DataType = ftInteger
        Name = 'IS_UPDATABLE'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end
      item
        DataType = ftBoolean
        Name = 'PaymentsReadOnly'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select dp.*'
      '  ,CASE '
      '     WHEN dp.decl_inn IS NOT NULL THEN '
      '       '#39#1048#1053#1053' '#39' || dp.decl_inn'
      '     ELSE '#39#39
      '   END AS INN'
      '  ,CASE'
      
        '     WHEN (s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subje' +
        'ct'#39') AND dp.decl_kpp IS NOT NULL THEN'
      '       '#39'/'#1050#1055#1055' '#39' || dp.decl_kpp'
      '     ELSE '#39#39
      '   END AS KPP'
      '      ,nd.name as reason_name'
      '      ,nd.code2 as reason_code'
      
        '      ,dp.debt_pay_summa + dp.debt_peny_summa + dp.debt_proc_sum' +
        'ma'
      '              AS debts_summa_s'
      '      ,Trunc(dp.summa) AS rub'
      
        '      ,TRIM(TO_CHAR(TRUNC ((dp.summa - Trunc(dp.summa))*100), '#39'0' +
        '0'#39')) AS kopp'
      '      ,po.KBKCode as kbk_code'
      
        '      ,UPPER(fdc_valuestring_sys_get( '#39'CustomsName'#39' )) AS Custom' +
        'sName'
      '      ,fdc_valuestring_sys_get( '#39'BossName'#39' )    AS BossName'
      '      ,fdc_valuestring_sys_get( '#39'BossRank'#39' )    AS BossRank'
      '      ,(SELECT max(k.code)'
      '          FROM fdc_payback_reserve_lst p'
      '              ,fdc_kbk_dict_lst k'
      '          WHERE p.decision_id = :id'
      '            AND p.kbkcode_id = k.id) AS kbkcode'
      '  ,CASE '
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN dp.decl_address'
      '   END AS address'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN '
      '        (SELECT '#39#1087#1072#1089#1087#1086#1088#1090' '#39' || p.ser_no || '#39' '#39' || p.doc_no'
      '           FROM fdc_person_lst p'
      '           WHERE p.id = s.ID '
      '             AND p.ser_no IS NOT NULL'
      '             AND p.doc_no IS NOT NULL)'
      '   END AS passport'
      ' from fdc_decision_payback_lst dp'
      
        '    left join fdc_payment_order_payback_lst po on dp.id = po.DEC' +
        '_PAY_ID'
      '    left join fdc_nsi_dict_lst nd on dp.reason_id = nd.id'
      '    left join fdc_subject_lst s on dp.subject_id = s.id'
      ' where dp.id = :ID'
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    inherited dsDataREASON_ID: TFloatField
      Required = True
    end
    inherited dsDataSUBJECT_ID: TFloatField
      Required = True
    end
    inherited dsDataDECL_NAME: TStringField
      Required = False
    end
    inherited dsDataSUD_REASON_ID: TFloatField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072
    end
    object dsDataSUMMA: TFloatField [41]
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsDataBANK_DATE: TDateTimeField [45]
      FieldName = 'BANK_DATE'
    end
    object dsDataCURRENCY_ID: TFloatField [46]
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataDESTSUB_ID: TFloatField [47]
      FieldName = 'DESTSUB_ID'
    end
    object dsDataACCOUNT: TStringField [48]
      FieldName = 'ACCOUNT'
    end
    object dsDataBANK_ID: TFloatField [49]
      FieldName = 'BANK_ID'
    end
    object dsDataBANK_NAME: TStringField [50]
      FieldName = 'BANK_NAME'
      Size = 4000
    end
    object dsDataBANK_BIC: TStringField [51]
      FieldName = 'BANK_BIC'
      Size = 10
    end
    object dsDataDECL_OKPO: TStringField [52]
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField [53]
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataDECL_NAME_DEST: TStringField [54]
      FieldName = 'DECL_NAME_DEST'
      Size = 1500
    end
    object dsDataDECL_INN_DEST: TStringField [55]
      FieldName = 'DECL_INN_DEST'
      Size = 12
    end
    object dsDataDECL_KPP_DEST: TStringField [56]
      FieldName = 'DECL_KPP_DEST'
      Size = 10
    end
    object dsDataDECL_OKPO_DEST: TStringField [57]
      FieldName = 'DECL_OKPO_DEST'
      Size = 10
    end
    object dsDataDECL_ADDRESS_DEST: TStringField [58]
      FieldName = 'DECL_ADDRESS_DEST'
      Size = 200
    end
    object dsDataDECL_BANK_DEST: TStringField [59]
      FieldName = 'DECL_BANK_DEST'
      Size = 4000
    end
    object dsDataDECL_ADR_BANK_DEST: TStringField [60]
      FieldName = 'DECL_ADR_BANK_DEST'
      Size = 200
    end
    object dsDataDECL_NAME_BANK_DEST: TStringField [61]
      FieldName = 'DECL_NAME_BANK_DEST'
      Size = 1500
    end
    object dsDataBIC: TStringField [62]
      FieldName = 'BIC'
      Size = 10
    end
    object dsDataCORR_ACCOUNT: TStringField [63]
      FieldName = 'CORR_ACCOUNT'
    end
    object dsDataKBKCODE_ID: TFloatField [64]
      FieldName = 'KBKCODE_ID'
    end
    object dsDataPERSONAL_ACCOUNT: TStringField [65]
      FieldName = 'PERSONAL_ACCOUNT'
    end
    object dsDataDATE_LAST_DOC: TDateTimeField [66]
      FieldName = 'DATE_LAST_DOC'
    end
    object dsDataCUSTOMSFULLNAME: TStringField [67]
      FieldName = 'CUSTOMSFULLNAME'
      Size = 4000
    end
    object dsDataEXCISE_PAY: TStringField [68]
      FieldName = 'EXCISE_PAY'
      Size = 1
    end
    object dsDataDECISION_COURT: TStringField [69]
      FieldName = 'DECISION_COURT'
      Required = True
      Size = 1
    end
    object dsDataDATE_COURT: TDateTimeField [70]
      FieldName = 'DATE_COURT'
    end
    object dsDataCOURT_ACT_ATTRS: TStringField [71]
      FieldName = 'COURT_ACT_ATTRS'
      Size = 50
    end
    object dsDataCUSTOMS_DEC_ATTRS: TStringField [72]
      FieldName = 'CUSTOMS_DEC_ATTRS'
      Size = 50
    end
    object dsDataREASON_CODE: TStringField [73]
      FieldName = 'REASON_CODE'
      Size = 1500
    end
    object dsDataKBK_CODE: TStringField
      FieldName = 'KBK_CODE'
    end
    object dsDataBOSSNAME: TStringField
      FieldName = 'BOSSNAME'
      Size = 200
    end
    object dsDataKOPP: TStringField
      FieldName = 'KOPP'
      Size = 2
    end
    object dsDataCUSTOMSNAME: TStringField
      FieldName = 'CUSTOMSNAME'
      Size = 300
    end
    object dsDataKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDataADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 300
    end
    object dsDataPASSPORT: TStringField
      FieldName = 'PASSPORT'
      Size = 25
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataBOSSRANK: TStringField
      FieldName = 'BOSSRANK'
      Size = 150
    end
    object dsDataRUB: TFloatField
      FieldName = 'RUB'
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_decision_payback_add('
      '      pdoctype         => :TYPESYSNAME'
      '     ,pdecisionnumber  => :DOC_NUMBER'
      '     ,pdecisiondate    => :DOC_DATE'
      '     ,psubjectid       => :SUBJECT_ID'
      '     ,pappnumber       => :APP_NUMBER'
      '     ,pappdate         => :APP_DATE'
      '     ,pappnumberincome => :APP_NUMBER_INCOME'
      '     ,pappdateincome   => :APP_DATE_INCOME'
      '     ,preasonid        => :REASON_ID'
      '     ,psumma           => :SUMMA'
      '     ,pdestsubid       => :DESTSUB_ID'
      '     ,pDestSubName     => :DECL_NAME_BANK_DEST'
      '     ,pcurrencyid      => :CURRENCY_ID'
      '     ,paccount         => :ACCOUNT'
      '     ,pbankid          => :BANK_ID'
      '     ,pkbkid           => :KBKCODE_ID'
      '     ,ppersonalaccount => :PERSONAL_ACCOUNT'
      '     ,pdatelastdoc     => :DATE_LAST_DOC'
      '     ,pists            => :IS_TS'
      '     ,pexcisepay       => :EXCISE_PAY'
      '     ,pdecisioncourt   => :DECISION_COURT'
      '     ,pdatecourt       => :DATE_COURT'
      '     ,pdoccode         => :DOC_CODE'
      '     ,pdocosncode      => :DOC_OSN_CODE'
      '     ,psudreasonid     => :SUD_REASON_ID'
      '     ,pdebtssumma      => :DEBTS_SUMMA'
      '     ,pcourtactattrs   => :COURT_ACT_ATTRS'
      '     ,pcustomsdecattrs => :CUSTOMS_DEC_ATTRS'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;'
      '')
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
        Name = 'DOC_NUMBER'
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
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DESTSUB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECL_NAME_BANK_DEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PERSONAL_ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_LAST_DOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IS_TS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EXCISE_PAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECISION_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUD_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COURT_ACT_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUSTOMS_DEC_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_payback_upd('
      '      pid               => :ID'
      '     ,pdecisionnumber   => :DOC_NUMBER'
      '     ,pdecisiondate     => :DOC_DATE'
      '     ,psubjectid        => :SUBJECT_ID'
      '     ,pappnumber        => :APP_NUMBER'
      '     ,pappdate          => :APP_DATE'
      '     ,pappnumberincome  => :APP_NUMBER_INCOME'
      '     ,pappdateincome    => :APP_DATE_INCOME'
      '     ,preasonid         => :REASON_ID'
      '     ,psumma            => :SUMMA'
      '     ,pcurrencyid       => :CURRENCY_ID'
      '     ,pdestsubid        => :DESTSUB_ID'
      '     ,psigndate         => :SIGN_DATE'
      '     ,psignedby         => :SIGNED_BY'
      '     ,psignedbychief    => :SIGNED_BY_CHIEF'
      '     ,psignedbychiefudf => :SIGNED_BY_CHIEF_UDF'
      '     ,paccount          => :ACCOUNT'
      '     ,pbankid           => :BANK_ID'
      '     ,pkbkid            => :KBKCODE_ID'
      '     ,pdatelastdoc     => :DATE_LAST_DOC'
      '     ,pdestsubname     => :DECL_NAME_BANK_DEST'
      '     ,pexcisepay       => :EXCISE_PAY'
      '     ,pdecisioncourt   => :DECISION_COURT'
      '     ,pdatecourt       => :DATE_COURT'
      '     ,pdoccode         => :DOC_CODE'
      '     ,pdocosncode      => :DOC_OSN_CODE'
      '     ,psudreasonid     => :SUD_REASON_ID'
      '     ,pdebtssumma      => :DEBTS_SUMMA'
      '     ,pcourtactattrs   => :COURT_ACT_ATTRS'
      '     ,pcustomsdecattrs => :CUSTOMS_DEC_ATTRS'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '    );'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
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
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DESTSUB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF_UDF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_LAST_DOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECL_NAME_BANK_DEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EXCISE_PAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECISION_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUD_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COURT_ACT_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUSTOMS_DEC_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsState: TfdcQuery
    AfterOpen = dsStateAfterOpen
  end
  inherited qryGetNameTO: TfdcQuery
    SQL.Strings = (
      'SELECT NAME AS NAME_TO, NAME AS CustomsName'
      '  FROM fdc_customs_lst c'
      
        '  WHERE c.customs_code_8 = REPLACE( :customs_code, '#39'KNP'#39', '#39'000'#39' ' +
        ')'
      '')
  end
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select po.name'
      '  from fdc_payment_order_lst po,'
      '       FDC_PAYBACK_RESERVE_LST pd'
      ' where pd.doc_id = :id'
      '   and po.id = pd.payment_id')
    Left = 472
    Top = 392
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsPaymentOrderListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsKBK_CODE: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'SELECT DISTINCT k.code'
      '          FROM fdc_payback_reserve_lst p'
      '              ,fdc_kbk_dict_lst k'
      '          WHERE p.decision_id = :id'
      '            AND p.kbkcode_id = k.id')
    Left = 619
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object odsAddCancelDecPayback: TOracleDataSet
    SQL.Strings = (
      'declare'
      ' vDecPayId number;'
      ' vSubjectId number;'
      ' vCustomsName varchar2(150);'
      'begin'
      ''
      '  select name into vCustomsName'
      '  from  fdc_Customs_Lst c'
      '  where c.customs_code_8  = p_params.cCustomCode;'
      ''
      '  select  id ,subject_id'
      '     into vDecPayId,vSubjectId'
      '  from fdc_decision_payback_lst'
      '  where id = :pId;'
      ''
      '  -- Call the function'
      
        '  :Id := fdc_cancel_dec_payback_add(pdoctype   => '#39'CancelDecisio' +
        'nPayback'#39','
      '                                    pdocnumber => null,'
      
        '                                    pdocdate   => trunc(sysdate)' +
        ','
      '                                    psubjectid => vSubjectId,'
      '                                    pdecpayid  => vDecPayId,'
      
        '                                    pIsTS      => p_document.IsT' +
        'S(pDocID => vDecPayId),'
      
        '                                    pCancelLevel => p_params.cCu' +
        'stomCode||'#39' '#39'||vCustomsName);'
      ''
      
        ' p_decision_payback.Cancel(pDecID => vDecPayId,pCancelID => :Id)' +
        ';'
      ''
      ' p_cancel_decision_payback.addreturnn(pdecid => vDecPayId);'
      ''
      'end;')
    Variables.Data = {
      0300000002000000040000003A50494403000000040000000000000000000000
      030000003A494403000000040000000000000000000000}
    Session = MainData.Session
    Left = 107
    Top = 322
  end
  object qryDetail: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END            AS po_type'
      '      ,po.doc_number  AS po_num'
      '      ,po.doc_date    AS po_date'
      '      ,po.doc_summa   AS po_sum'
      '      ,nvl(dp.summa, 0) AS ret_sum'
      '      ,SUM( r.summa ) AS ret_sum_'
      '  FROM FDC_REP_DEC_PAYBACK_LST   po'
      '      ,fdc_payback_reserve_lst r'
      '      ,fdc_decision_payback_lst dp'
      ' WHERE po.id = r.payment_id'
      '   AND r.decision_id = :id'
      '   and dp.ext_id(+) = r.decision_id'
      
        ' GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_sum' +
        'ma, nvl(dp.summa, 0)'
      ' ORDER BY po.doc_date, po.doc_number')
    Left = 147
    Top = 354
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryDetailPP: TFloatField
      FieldName = 'PP'
    end
    object qryDetailPO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      Size = 3
    end
    object qryDetailPO_NUM: TStringField
      FieldName = 'PO_NUM'
      Size = 100
    end
    object qryDetailPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object qryDetailPO_SUM: TFloatField
      FieldName = 'PO_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDetailRET_SUM: TFloatField
      FieldName = 'RET_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object dsArticleList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select a.code2 as name'
      '  from fdc_assets_dict_lst a'
      '      ,fdc_value_lst v'
      ' where v.owner_object_id = :OBJECT_TYPE_ID'
      '   and v.sysname = '#39'AssetsDictCode'#39
      '   and v.stringvalue = a.code'
      'union'
      'select ar.code2'
      '  from fdc_assets_reason_lst ar'
      ' where ar.id = :REASON_ID')
    Left = 56
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'OBJECT_TYPE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end>
    object dsArticleListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select od.name'
      '  from fdc_obligation_doc_lst od,'
      '       fdc_value_lst v'
      ' where v.owner_object_id = :id'
      '   and od.id = v.ref_object_id')
    Left = 552
    Top = 392
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDeclListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsChecks: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'begin'
      ' :Result ::= f_asbc_checks_by_decision(:nSubjectID, :sAccount);'
      'end;')
    Left = 731
    Top = 76
    ParamData = <
      item
        DataType = ftString
        Name = 'Result'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nSubjectID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sAccount'
        ParamType = ptUnknown
      end>
  end
  object dsChecksSendAll: TfdcQuery
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'begin'
      
        ' PKG_ASBC_CHECKS.AddAll(nSubjectID=>:nSubjectID,nDocumentID=> :n' +
        'DocumentID);'
      'end;')
    Left = 731
    Top = 76
    ParamData = <
      item
        DataType = ftFloat
        Name = 'nSubjectID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'nDocumentID'
        ParamType = ptUnknown
      end>
  end
end
