inherited DecisionForm: TDecisionForm
  Left = 83
  Top = 221
  Width = 1197
  Height = 762
  Caption = #1056#1077#1096#1077#1085#1080#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1181
    Height = 724
    ClientRectBottom = 700
    ClientRectRight = 1181
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1175
        Height = 669
        inherited edtName: TcxDBTextEdit
          Enabled = False
          Width = 880
        end
        inherited edtDescript: TcxDBMemo
          Top = 830
          Enabled = False
          TabOrder = 28
          Height = 223
          Width = 684
        end
        object edtDeclINN: TcxDBMaskEdit [2]
          Left = 145
          Top = 192
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 736
        end
        object edtDeclKPP: TcxDBMaskEdit [3]
          Tag = 13
          Left = 910
          Top = 192
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 227
        end
        object edtDeclName: TfdcObjectLinkEdit [4]
          Left = 145
          Top = 219
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Broker;Subject'
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
          TabOrder = 12
          OnBeforeAcceptObject = edtDeclNameBeforeAcceptObject
          Width = 992
        end
        object edtAppDate: TcxDBDateEdit [5]
          Left = 145
          Top = 290
          DataBinding.DataField = 'APP_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 13
          Width = 121
        end
        object edtAppDateIncome: TcxDBDateEdit [6]
          Left = 394
          Top = 290
          DataBinding.DataField = 'APP_DATE_INCOME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 14
          Width = 121
        end
        object edtAppNumber: TcxDBTextEdit [7]
          Left = 145
          Top = 317
          DataBinding.DataField = 'APP_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 15
          Width = 121
        end
        object edtSignBy: TcxDBTextEdit [8]
          Left = 145
          Top = 763
          DataBinding.DataField = 'SIGNED_BY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 992
        end
        object edtSignDate: TcxDBDateEdit [9]
          Left = 145
          Top = 790
          DataBinding.DataField = 'SIGN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 27
          Width = 992
        end
        object edtSignByChief: TcxDBLookupComboBox [10]
          Left = 145
          Top = 709
          DataBinding.DataField = 'SIGNED_BY_CHIEF'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'NAME'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsGetBoss
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 24
          Width = 992
        end
        object edtSignByChiefUDS: TcxDBLookupComboBox [11]
          Left = 145
          Top = 736
          DataBinding.DataField = 'SIGNED_BY_CHIEF_UDF'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'NAME'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsGetBoss
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 25
          Width = 992
        end
        object cmbxReason: TfdcObjectLookupEdit [12]
          Left = 145
          Top = 388
          DataBinding.DataField = 'REASON_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end
            item
              Fixed = True
              Width = 50
              FieldName = 'CODE2'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcAssetsReason
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 17
          Width = 813
        end
        object edtDocNumberFull: TcxDBTextEdit [13]
          Left = 145
          Top = 67
          DataBinding.DataField = 'DOC_NUMBER_FULL'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaxLength = 50
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 1
          Width = 992
        end
        object edtCustomsCode: TcxDBTextEdit [14]
          Left = 145
          Top = 94
          DataBinding.DataField = 'CUSTOMS_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        object edtDocCode: TcxDBTextEdit [15]
          Left = 394
          Top = 94
          DataBinding.DataField = 'DOC_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 50
        end
        object edtDocOsnCode: TcxDBComboBox [16]
          Left = 543
          Top = 121
          DataBinding.DataField = 'DOC_OSN_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1047
            #1055#1057
            #1055#1055)
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 121
        end
        object edtAppNumberIncome: TcxDBTextEdit [17]
          Left = 394
          Top = 317
          DataBinding.DataField = 'APP_NUMBER_INCOME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 16
          Width = 121
        end
        object edtSudReason: TcxDBLookupComboBox [18]
          Left = 145
          Top = 415
          DataBinding.DataField = 'SUD_REASON_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end
            item
              Fixed = True
              Width = 50
              FieldName = 'CODE'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DictData.srcSudReason
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 18
          Width = 992
        end
        object edtDebtsSumma: TcxDBCurrencyEdit [19]
          Left = 145
          Top = 486
          DataBinding.DataField = 'DEBTS_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = False
          Properties.UseDisplayFormatWhenEditing = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 992
        end
        object edtDebtsPaySumma: TcxDBCurrencyEdit [20]
          Left = 105
          Top = 571
          DataBinding.DataField = 'DEBT_PAY_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Properties.UseDisplayFormatWhenEditing = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 1020
        end
        object edtDebtsProcSumma: TcxDBCurrencyEdit [21]
          Left = 105
          Top = 598
          DataBinding.DataField = 'DEBT_PROC_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Properties.UseDisplayFormatWhenEditing = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 22
          Width = 1020
        end
        object edtDebtsPenySumma: TcxDBCurrencyEdit [22]
          Left = 105
          Top = 625
          DataBinding.DataField = 'DEBT_PENY_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Properties.UseDisplayFormatWhenEditing = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 23
          Width = 1020
        end
        object edtDebtsSummaS: TcxDBCurrencyEdit [23]
          Left = 145
          Top = 513
          DataBinding.DataField = 'DEBTS_SUMMA_S'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Properties.UseDisplayFormatWhenEditing = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 20
          Width = 992
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 549
          Top = 94
          Properties.MaxLength = 10
          Properties.OnChange = Modify
          TabOrder = 5
          Width = 375
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1016
          Top = 94
          Properties.OnChange = Modify
          Style.IsFontAssigned = True
          TabOrder = 3
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 121
          Properties.NullStyle = nssUnchecked
          Style.IsFontAssigned = True
          TabOrder = 6
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 121
          Style.IsFontAssigned = True
          TabOrder = 7
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = 121
          Style.IsFontAssigned = True
          TabOrder = 8
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Tag = 22
            Enabled = False
          end
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1056#1077#1096#1077#1085#1080#1077
            object lciDOC_NUMBER_FULL: TdxLayoutItem [0]
              Tag = 33
              Caption = #1053#1086#1084#1077#1088
              Control = edtDocNumberFull
              ControlOptions.ShowBorder = False
            end
            inherited lcgDocumentNumDate: TdxLayoutGroup
              object lciDecisionCustomsCode: TdxLayoutItem [0]
                Tag = 33
                Caption = #1050#1086#1076' '#1058#1054
                Control = edtCustomsCode
                ControlOptions.ShowBorder = False
              end
              inherited lciDocDate: TdxLayoutItem [1]
              end
              object lciDecisionDocCode: TdxLayoutItem [2]
                Tag = 33
                Caption = #1057#1086#1082#1088#1072#1097#1105#1085#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
                Control = edtDocCode
                ControlOptions.ShowBorder = False
              end
              inherited lciDocNumber: TdxLayoutItem [3]
                Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
              end
            end
            inherited lcgDocumentAttrs: TdxLayoutGroup
              object lciDecisionDocOsnCode: TdxLayoutItem
                Caption = #1044#1086#1082#1091#1084#1077#1085#1090'-'#1086#1089#1085#1086#1074#1072#1085#1080#1077
                Control = edtDocOsnCode
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgDeclarant: TdxLayoutGroup [2]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            object lcgDeclarantINNKPP: TdxLayoutGroup
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclINN: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lciDeclKPP: TdxLayoutItem
                Tag = 33
                Caption = #1050#1055#1055
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclName: TdxLayoutItem
              Tag = 13
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtDeclName
              ControlOptions.ShowBorder = False
            end
          end
          object lcgApp: TdxLayoutGroup [3]
            Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077
            object lcgAppDate: TdxLayoutGroup
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciAppDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072
                Control = edtAppDate
                ControlOptions.ShowBorder = False
              end
              object lciAppDateIncome: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1074#1093#1086#1076#1103#1097#1072#1103
                Control = edtAppDateIncome
                ControlOptions.ShowBorder = False
              end
            end
            object lcgAppNumber: TdxLayoutGroup
              ShowCaption = False
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciAppNumber: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088
                Control = edtAppNumber
                ControlOptions.ShowBorder = False
              end
              object lciAppNumberIncome: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088' '#1074#1093#1086#1076#1103#1097#1080#1081
                Control = edtAppNumberIncome
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgReason: TdxLayoutGroup [4]
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            object lciReason: TdxLayoutItem
              Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
              Control = cmbxReason
              ControlOptions.ShowBorder = False
            end
            object lciSudReason: TdxLayoutItem
              Caption = #1055#1088#1080#1095#1080#1085#1072
              Control = edtSudReason
              ControlOptions.ShowBorder = False
            end
          end
          object lcgDepts: TdxLayoutGroup [5]
            Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
            object lciDebtsSumma: TdxLayoutItem
              Tag = 33
              Caption = #1057#1091#1084#1084#1072
              Control = edtDebtsSumma
              ControlOptions.ShowBorder = False
            end
            object lciDebtsSummaS: TdxLayoutItem
              Caption = #1058#1077#1082#1091#1097#1072#1103' '#1089#1091#1084#1084#1072
              Control = edtDebtsSummaS
              ControlOptions.ShowBorder = False
            end
            object lcgGroupDeptsSumma: TdxLayoutGroup
              Caption = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077
              object lciDeptsPay: TdxLayoutItem
                Tag = 33
                Caption = #1055#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
                Control = edtDebtsPaySumma
                ControlOptions.ShowBorder = False
              end
              object lciDeptsProc: TdxLayoutItem
                Tag = 33
                Caption = #1055#1086' '#1087#1088#1086#1094#1077#1085#1090#1072#1084
                Control = edtDebtsProcSumma
                ControlOptions.ShowBorder = False
              end
              object lciDeptsPeny: TdxLayoutItem
                Tag = 33
                Caption = #1055#1086' '#1087#1077#1085#1103#1084
                Control = edtDebtsPenySumma
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgSign: TdxLayoutGroup [6]
            Caption = #1055#1086#1076#1087#1080#1089#1100
            object lciSignByChief: TdxLayoutItem
              Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082
              Control = edtSignByChief
              ControlOptions.ShowBorder = False
            end
            object lciSignByChiefUDF: TdxLayoutItem
              Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1054#1060#1058#1044' '#1080' '#1059#1044#1057
              Control = edtSignByChiefUDS
              ControlOptions.ShowBorder = False
            end
            object lciSignBy: TdxLayoutItem
              Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
              Control = edtSignBy
              ControlOptions.ShowBorder = False
            end
            object lciSignDate: TdxLayoutItem
              Tag = 31
              Caption = #1044#1072#1090#1072
              Control = edtSignDate
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Tag = 22
            Enabled = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1181
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 669
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 697
        Width = 1181
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1178
        Height = 669
      end
    end
    object tabPaymentOrders: TcxTabSheet [1]
      Caption = #1055#1083#1072#1090#1105#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 1
      OnShow = tabPaymentOrdersShow
    end
    object tabDocObligations: TcxTabSheet [2]
      Caption = #1044#1058', '#1058#1055#1054', '#1058#1056
      ImageIndex = 2
      OnShow = tabDocObligationsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1181
        Height = 700
        ClientRectBottom = 676
        ClientRectRight = 1181
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    object actGetDebts: TAction
      Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      ImageIndex = 6
      OnExecute = actGetDebtsExecute
      OnUpdate = actGetDebtsUpdate
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
  inherited imglAction: TImageList
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00000000000000000000000000848484008484
      84008C8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005ABD6300089C100010A5
      100010A5180010A5180008A510000000000000000000DED6D600B59494009C5A
      4A008C393100D6C6C60000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C00D6CECE009494940039393900525252009C949400C6C6
      C600D6D6D6008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004AB552004ADE
      6B0063FF9C0073FFB50010A5180000000000B55A3100CE7B4A00EFA57300FFC6
      8C00D6845A007B181000D6C6CE000000000000000000000000009C9C9C009C9C
      9C00F7F7F700FFFFFF00D6D6D6009C9C9C004242420021182100211821003131
      310063636300848484008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5D6B50018AD290052EF
      7B0052F784006BFFA50010A5100000000000BD633100FFCE9C00F7B57B00EFA5
      6B00DE8C63008C210800A5736B0000000000948C8C009C9C9C00EFEFEF00FFFF
      FF00EFE7E700C6C6C6009C9C9C008C8C8C009494940084848400636363003939
      3900182121002118210073737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003194390039DE5A0042E7
      6B0042DE630010A5210010A5100000000000BD632900F7AD7B00E79C6B00E794
      5A00DE9463009C3110009C5A5200000000009C9C9C00E7E7E700E7E7E700BDBD
      BD00A5A5A500B5ADAD00C6BDBD00A5A5A50094949400948C8C00949494009C94
      94008C8C8C006B6B6B0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000108C180031D64A0029C6
      42005AB55A00C6DECE00189C210000000000C66B2900E7946300E7946B00E79C
      7300EFB58C00BD5A39009C4A31000000000094949400ADADAD00A5A5A500ADAD
      AD00C6C6C600D6D6D600EFEFEF00EFEFEF00DEDEDE00C6C6C600ADADAD009C9C
      9C00948C8C00949494008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000318C310029CE42004AA5
      4A000000000000000000D6E7DE0000000000DE944A00EFAD6B00FFC69C00F7AD
      7B00E7946300D67B4A009439210000000000948C8C00ADADAD00C6C6C600CECE
      CE00C6C6C600DEDEDE00CECECE00A5ADA500BDBDBD00CECECE00D6D6D600D6D6
      D600C6C6C600B5B5B50094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084ADAD00007B0800184A
      94002131C6002129AD005A5AB500BDC6DE0000000000E7BD9C00C6733100BD73
      4200BD846B00C6A59400D6CECE0000000000000000009C9C9C00CECECE00CECE
      CE00DEDEDE00C6C6C600B5B5B500A5D6A500BDC6BD00C6A5A500ADA5A500A5A5
      A500B5B5B500C6BDBD00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000214AF70073C6A5007BC6
      CE0063A5FF00296BFF000031FF002121A5000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009C9C9C00BDBD
      BD00ADADAD00ADADAD00E7E7E700F7EFEF00EFEFEF00EFE7DE00D6D6D600CECE
      CE00B5B5B5009494940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007384EF0084BDFF0094D6
      FF005A94FF001852FF000021E7006B73BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00D6D6D600CECECE009C9C9C00BDBDBD00D6D6D600D6D6D600D6D6D600C6C6
      C600ADADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEE7EF00294AEF00ADEF
      FF005294FF000842FF001010AD00DEDEEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFE7E700FFDECE00E7C6BD00E7C6BD00E7CEC600DED6CE00CECECE009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B84EF007BB5
      F7005A94FF000021E7007B7BCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500FFAD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DEE7EF00294A
      DE005A9CFF001010B500DEE7EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B84
      E7001839D600848CD60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C9C00FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEE7
      EF003942BD00E7E7EF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      9C00FFE7D600FFDECE00FFCEBD00FFC6AD00FFBDA500F7AD9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      9C00CE9C9C00CE9C9C00CE9C9C00F7AD9C00F7AD9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFDC7FFFF00008183F003FFFF0000
      C101C001C007000081010001E7E7000081010001F3F7000081010001F9F70000
      8D010001FCFF000080818001FE7F000080FFC003FF3F000080FFE007FE7F0000
      80FFF00FFCFF0000C1FFF03FF9F70000C1FFF03FF3F70000E3FFF03FE7E70000
      E3FFE03FC0070000FFFFE07FFFFF0000FFFFC001C001FFFC80038000C0019FF9
      80038000C0018FF380038000C00187E780038000C001C3CF80038000C001F11F
      80038000C001F83F80038000C001FC7F80038000C001F83F80038000C001F19F
      80038000C001E3CF80038000C001C7E780038000C0018FFB80038000C0031FFF
      80078000C0073FFF800FC001C00FFFFF00000000000000000000000000000000
      000000000000}
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
        FloatLeft = 342
        FloatTop = 339
        FloatClientWidth = 104
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
            Item = btGetDebts
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
    object btGetDebts: TdxBarButton
      Action = actGetDebts
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,s.NAME as decl_name'
      '      ,s.inn  as decl_inn'
      '      ,s.kpp  as decl_kpp'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_decision_Lst d, fdc_subject_lst s'
      ' where d.ID = :ID and'
      '       d.subject_id  = s.id(+)')
    SourceServerObject = 'FDC_DECISION_LST'
    AfterInsert = dsDataAfterInsert
    object dsDataDOC_NUMBER_FULL: TStringField [12]
      FieldName = 'DOC_NUMBER_FULL'
      Size = 50
    end
    inherited dsDataDOC_DATE: TDateTimeField
      OnChange = dsDataDOC_DATEChange
    end
    inherited dsDataDOC_NUMBER: TStringField
      DisplayWidth = 10
      Size = 10
    end
    object dsDataREASON_ID: TFloatField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'REASON_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECT_ID'
    end
    object dsDataAPP_NUMBER: TStringField
      DisplayLabel = #8470' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'APP_NUMBER'
      Size = 50
    end
    object dsDataAPP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'APP_DATE'
    end
    object dsDataAPP_DATE_INCOME: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1072#1103')'
      FieldName = 'APP_DATE_INCOME'
    end
    object dsDataAPP_NUMBER_INCOME: TStringField
      FieldName = 'APP_NUMBER_INCOME'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
      FieldName = 'SIGN_DATE'
    end
    object dsDataSIGNED_BY_CHIEF_UDF: TStringField
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100' '#1085#1072#1095#1072#1083#1100#1085#1080#1082#1072
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGNED_BY: TStringField
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataREASON_NAME: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'REASON_NAME'
      LookupDataSet = DictData.dsAssetsReason
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'REASON_ID'
      Size = 1000
      Lookup = True
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'DECL_NAME'
      Required = True
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataDOC_CODE: TStringField
      FieldName = 'DOC_CODE'
      OnChange = dsDataDOC_CODEChange
      Size = 8
    end
    object dsDataDOC_OSN_CODE: TStringField
      FieldName = 'DOC_OSN_CODE'
      Size = 2
    end
    object dsDataSUD_REASON_ID: TFloatField
      FieldName = 'SUD_REASON_ID'
    end
    object dsDataDEBTS_SUMMA: TFloatField
      FieldName = 'DEBTS_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
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
    object dsDataDEBT_PAY_SUMMA: TFloatField
      FieldName = 'DEBT_PAY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDEBT_PENY_SUMMA: TFloatField
      FieldName = 'DEBT_PENY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDEBT_PROC_SUMMA: TFloatField
      FieldName = 'DEBT_PROC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDEBTS_SUMMA_S: TFloatField
      FieldName = 'DEBTS_SUMMA_S'
      DisplayFormat = ',0.00'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      
        '  :result ::= fdc_object_add(pObject_Type_SysName => p_decision.' +
        'c_ClassSysName_Decision);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'result'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_object_upd ( pID => :ID'
      '                  ,pName => NULL'
      '                  ,pShortName => NULL'
      '                  ,pDescript => NULL'
      '                 );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
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
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )'
      ' and 1 = 0')
  end
  object odsGetBoss: TOracleDataSet
    SQL.Strings = (
      
        'select 0 as id, t.NAME  from TABLE(f_get_users_otp2(:ncustomid))' +
        ' t'
      'union'
      ' select 0 as id,:pName as name from dual'
      ' where :pName is not null'
      'union'
      ' select 0 as id,:pNameUDS as name from dual'
      ' where :pNameUDS is not null'
      ' and upper(nvl(:pNameUDS,'#39#39'))<>upper(nvl(:pName,'#39#39'))'
      'order by id')
    Variables.Data = {
      03000000030000000A0000003A4E435553544F4D494403000000000000000000
      0000060000003A504E414D45050000000000000000000000090000003A504E41
      4D45554453050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = MainData.Session
    Left = 787
    Top = 282
    object odsGetBossID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetBossNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsGetBoss: TDataSource
    DataSet = odsGetBoss
    Left = 788
    Top = 331
  end
  object srcAssetsReason: TDataSource
    AutoEdit = False
    DataSet = dsAssetsReason
    Left = 680
    Top = 336
  end
  object dsAssetsReason: TOracleDataSet
    SQL.Strings = (
      
        'SELECT t.id, t.NAME, t.CODE, t.CODE2, CASE WHEN instr( t.code2, ' +
        #39'.'#39' ) > 0 THEN substr( t.code2, 1, instr( t.code2, '#39'.'#39' ) - 1 ) E' +
        'LSE t.code2 END AS code3'
      '  FROM fdc_assets_reason_lst t'
      
        '  WHERE t.id in (select column_value from table(p_decision.GetAs' +
        'setsReason(:doc_code,:doc_date)))'
      '  ORDER BY t.code')
    Variables.Data = {
      0300000002000000090000003A444F435F444154450C00000000000000000000
      00090000003A444F435F434F4445050000000000000000000000}
    Session = MainData.Session
    Left = 675
    Top = 290
  end
  object qryGetNameTO: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'SELECT NAME AS NAME_TO'
      '  FROM fdc_customs_lst c'
      
        '  WHERE c.customs_code_8 = REPLACE( :customs_code, '#39'KNP'#39', '#39'000'#39' ' +
        ')'
      '')
    Left = 371
    Top = 346
    ParamData = <
      item
        DataType = ftString
        Name = 'customs_code'
        ParamType = ptUnknown
      end>
  end
  object qlDecision: TQueryList
    Session = MainData.Session
    Left = 163
    Top = 196
    object sqlGetDebts: TsqlOp
      SQL.Strings = (
        'begin'
        
          '   :result := p_docpack_interactdebt.create_getdebts_message(pdo' +
          'cid => :pdocid);'
        '   IF :result IS NOT NULL THEN'
        '        p_docpack_interact.Send(pPackId => :result);'
        '   END IF;'
        'end;')
    end
  end
  object srcDebtSum: TDataSource
    AutoEdit = False
    DataSet = dsDebtSum
    Left = 590
    Top = 331
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
end
