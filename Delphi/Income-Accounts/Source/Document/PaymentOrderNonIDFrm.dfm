inherited PaymentOrderNonIDForm: TPaymentOrderNonIDForm
  Left = 540
  Top = 428
  Width = 887
  Height = 537
  ActiveControl = edtName
  Caption = 'PaymentOrderNonIDForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 871
    Height = 499
    ClientRectBottom = 475
    ClientRectRight = 871
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 865
        Height = 444
        inherited edtName: TcxDBTextEdit
          Left = 59
          Width = 706
        end
        inherited edtDescript: TcxDBMemo
          Left = 9
          Top = 703
          DataBinding.DataField = 'NOTE'
          TabOrder = 31
          Height = 91
          Width = 839
        end
        object edtPayerINN: TcxDBTextEdit [2]
          Left = 154
          Top = 165
          DataBinding.DataField = 'INN_P'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.TextColor = clWindowText
          TabOrder = 6
          Width = 201
        end
        object edtPayerKPP: TcxDBTextEdit [3]
          Left = 688
          Top = 165
          DataBinding.DataField = 'KPP_P'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.TextColor = clWindowText
          TabOrder = 7
          Width = 139
        end
        object edtPayerName: TfdcObjectLinkEdit [4]
          Left = 154
          Top = 192
          DataBinding.DataField = 'NAME_P'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAYER_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Subject;Bank'
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
          TabOrder = 8
          OnBeforeAcceptObject = edtPayerNameBeforeAcceptObject
          Width = 121
        end
        object edtCurrency: TfdcObjectLookupEdit [5]
          Left = 154
          Top = 442
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
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 18
          Width = 153
        end
        object edtPayType: TfdcObjectLookupEdit [6]
          Left = 634
          Top = 442
          DataBinding.DataField = 'PAY_TYPE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end>
          Properties.ListSource = DictData.srcPayTypes
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 145
        end
        object edtDocSumma: TcxDBCurrencyEdit [7]
          Left = 154
          Top = 469
          DataBinding.DataField = 'DOC_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 153
        end
        object edtSumma: TcxDBCurrencyEdit [8]
          Left = 505
          Top = 469
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 22
          Width = 155
        end
        object edtExecDate: TcxDBDateEdit [9]
          Left = 505
          Top = 496
          DataBinding.DataField = 'EXEC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 24
          Width = 148
        end
        object edtIncomeDate: TcxDBDateEdit [10]
          Left = 154
          Top = 496
          DataBinding.DataField = 'INCOME_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 23
          Width = 153
        end
        object edtPayTypeName: TcxDBTextEdit [11]
          Left = 154
          Top = 523
          DataBinding.DataField = 'PO_TYPE_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 25
          Width = 121
        end
        object edtKBK: TcxDBTextEdit [12]
          Left = 360
          Top = 442
          DataBinding.DataField = 'KBK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 19
          Width = 200
        end
        object edtPayerBIK: TcxDBTextEdit [13]
          Left = 154
          Top = 219
          DataBinding.DataField = 'BIK_P'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 177
        end
        object edtPayerAccount: TcxDBTextEdit [14]
          Left = 356
          Top = 219
          DataBinding.DataField = 'ACCOUNT_P'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 121
        end
        object edtRecepientINN: TcxDBTextEdit [15]
          Left = 154
          Top = 317
          DataBinding.DataField = 'INN_K'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Width = 121
        end
        object edtRecepientKPP: TcxDBTextEdit [16]
          Left = 688
          Top = 317
          DataBinding.DataField = 'KPP_K'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 139
        end
        object edtRecepientName: TcxDBTextEdit [17]
          Left = 154
          Top = 344
          DataBinding.DataField = 'NAME_K'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 15
          Width = 121
        end
        object edtRecepientBIK: TcxDBTextEdit [18]
          Left = 154
          Top = 371
          DataBinding.DataField = 'BIC_K'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 16
          Width = 177
        end
        object edtRecepientAccount: TcxDBTextEdit [19]
          Left = 356
          Top = 371
          DataBinding.DataField = 'ACCOUNT_K'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 17
          Width = 121
        end
        object edtValPaymentReason: TcxDBTextEdit [20]
          Left = 154
          Top = 594
          DataBinding.DataField = 'VAL_PAYMENT_REASON'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 62
        end
        object edtValPaymentType: TcxDBTextEdit [21]
          Left = 295
          Top = 594
          DataBinding.DataField = 'VAL_PAYMENT_TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 27
          Width = 57
        end
        object edtValDocNumber: TcxDBTextEdit [22]
          Left = 154
          Top = 621
          DataBinding.DataField = 'VAL_DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 28
          Width = 214
        end
        object edtValDocDate: TcxDBDateEdit [23]
          Left = 461
          Top = 621
          DataBinding.DataField = 'VAL_DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 29
          Width = 121
        end
        object edtDestCustomsCode: TfdcObjectLinkEdit [24]
          Left = 154
          Top = 290
          DataBinding.DataField = 'DESTCUSTOMSCODE'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CUSTOMS_ID'
          DataBinding.TypeSysName = 'Customs'
          DataBinding.SearchFormClass = 'TCustomsGridForm'
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
          TabOrder = 11
          OnBeforeAcceptObject = edtDestCustomsCodeBeforeAcceptObject
          OnAfterAcceptObject = edtDestCustomsCodeAfterAcceptObject
          Width = 163
        end
        object edtDestCustomsName: TcxTextEdit [25]
          Left = 323
          Top = 290
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 12
          Width = 121
        end
        object EdtUIN: TcxDBTextEdit [26]
          Left = 154
          Top = 648
          DataBinding.DataField = 'UIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 30
          Width = 214
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 154
          Width = 417
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 706
          Style.IsFontAssigned = True
        end
        object edtUIN2: TcxDBTextEdit [29]
          Left = 59
          Top = 729
          DataBinding.DataField = 'UIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 32
          Width = 682
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
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocNumber: TdxLayoutItem
                Tag = 33
              end
              inherited lciDocDate: TdxLayoutItem
                Tag = 33
              end
            end
          end
          object lcgPayer: TdxLayoutGroup [2]
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciPayerINN: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtPayerINN
                ControlOptions.ShowBorder = False
              end
              object lciPayerKPP: TdxLayoutItem
                Tag = 23
                Caption = #1050#1055#1055
                Control = edtPayerKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciPayerName: TdxLayoutItem
              Tag = 23
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtPayerName
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup9: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciGeneralPayerBIK: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                Caption = #1041#1048#1050' '#1073#1072#1085#1082#1072
                Control = edtPayerBIK
                ControlOptions.ShowBorder = False
              end
              object lciGeneralPayerAccount: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1056'/'#1057
                Control = edtPayerAccount
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgGeneralRecepient: TdxLayoutGroup [3]
            Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
            object lcGeneralGroup10: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcgDestCustomsCode: TdxLayoutGroup
                Caption = 'DestCustomsCode'
                ShowCaption = False
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lciDestCustoms: TdxLayoutItem
                  Tag = 33
                  Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtDestCustomsCode
                  ControlOptions.ShowBorder = False
                end
                object lcGeneralItem1: TdxLayoutItem
                  Tag = 33
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = 'cxTextEdit1'
                  CaptionOptions.AlignHorz = taRightJustify
                  ShowCaption = False
                  Control = edtDestCustomsName
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralGroup14: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lciGeneralRecepientINN: TdxLayoutItem
                  Tag = 23
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1048#1053#1053
                  Control = edtRecepientINN
                  ControlOptions.ShowBorder = False
                end
                object lciGeneralRecepientKPP: TdxLayoutItem
                  Tag = 23
                  AutoAligns = [aaVertical]
                  AlignHorz = ahRight
                  Caption = #1050#1055#1055
                  Control = edtRecepientKPP
                  ControlOptions.ShowBorder = False
                end
              end
            end
            object lciGeneralRecepientName: TdxLayoutItem
              Tag = 23
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtRecepientName
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup11: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciGeneralRecepientBIK: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                Caption = #1041#1048#1050' '#1073#1072#1085#1082#1072
                Control = edtRecepientBIK
                ControlOptions.ShowBorder = False
              end
              object lciGeneralRecepientAccount: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1056'/'#1057
                Control = edtRecepientAccount
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgPay: TdxLayoutGroup [4]
            Caption = #1055#1083#1072#1090#1105#1078
            object lcGeneralGroup4: TdxLayoutGroup
              Tag = 23
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciCurrency: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                Caption = #1042#1072#1083#1102#1090#1072
                Control = edtCurrency
                ControlOptions.ShowBorder = False
              end
              object lciKBK: TdxLayoutItem
                Tag = 33
                Caption = #1050#1041#1050
                Offsets.Left = 25
                Control = edtKBK
                ControlOptions.ShowBorder = False
              end
              object lcyPayType: TdxLayoutItem
                Tag = 23
                Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
                Control = edtPayType
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup5: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup6: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lciDocSumma: TdxLayoutItem
                  Tag = 23
                  AutoAligns = [aaVertical]
                  Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
                  Control = edtDocSumma
                  ControlOptions.ShowBorder = False
                end
                object lciSumma: TdxLayoutItem
                  Tag = 23
                  Caption = #1047#1072#1095#1080#1089#1083#1077#1085#1086
                  Control = edtSumma
                  ControlOptions.ShowBorder = False
                end
              end
              object lcGeneralGroup7: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                ShowBorder = False
                object lcGeneralGroup8: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  LayoutDirection = ldHorizontal
                  ShowBorder = False
                  object lciIncomingDate: TdxLayoutItem
                    Tag = 23
                    Caption = #1055#1086#1089#1090#1091#1087#1080#1083' '#1074' '#1041#1044
                    Control = edtIncomeDate
                    ControlOptions.ShowBorder = False
                  end
                  object lciExecDate: TdxLayoutItem
                    Tag = 23
                    AutoAligns = [aaVertical]
                    Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1073#1072#1085#1082#1086#1084' '#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1102
                    Control = edtExecDate
                    ControlOptions.ShowBorder = False
                  end
                end
                object lciPayTypeName: TdxLayoutItem
                  Tag = 23
                  Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                  Control = edtPayTypeName
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
          object lcgGeneralVals: TdxLayoutGroup [5]
            Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1080
            object lcGeneralGroup12: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciGeneralValPaymentReason: TdxLayoutItem
                Tag = 23
                AutoAligns = [aaVertical]
                Caption = #1086#1089#1085#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
                Control = edtValPaymentReason
                ControlOptions.ShowBorder = False
              end
              object lciGeneralValPaymentType: TdxLayoutItem
                Tag = 23
                Caption = #1090#1080#1087#1072' '#1087#1083#1072#1090#1077#1078#1072
                Control = edtValPaymentType
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup13: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup1: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lciGeneralValDocNumber: TdxLayoutItem
                  Tag = 23
                  AutoAligns = [aaVertical]
                  Caption = #1085#1086#1084#1077#1088#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                  Control = edtValDocNumber
                  ControlOptions.ShowBorder = False
                end
                object lciGeneralValDocDate: TdxLayoutItem
                  Tag = 23
                  Caption = #1076#1072#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                  Control = edtValDocDate
                  ControlOptions.ShowBorder = False
                end
              end
              object lciUIN: TdxLayoutItem
                Tag = 13
                Caption = #1059#1048#1053
                Control = EdtUIN
                ControlOptions.ShowBorder = False
              end
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Tag = 23
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taLeftJustify
            CaptionOptions.Layout = clTop
            CaptionOptions.Width = 130
            Visible = True
          end
          object lcUIN: TdxLayoutItem
            Caption = #1059#1048#1053
            Control = edtUIN2
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 871
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 444
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 472
        Width = 871
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 868
        Height = 444
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 871
        Height = 475
        ClientRectBottom = 451
        ClientRectRight = 871
      end
    end
    object tabDocPack: TcxTabSheet
      Caption = #1056#1077#1077#1089#1090#1088#1099
      ImageIndex = 3
      OnShow = tabDocPackShow
    end
    object tabErrors: TcxTabSheet
      Caption = #1054#1096#1080#1073#1082#1080
      ImageIndex = 2
      OnShow = tabErrorsShow
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    object actCreateSubj: TAction
      Category = 'Object'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1091#1073#1098#1077#1082#1090#1072
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1091#1073#1098#1077#1082#1090#1072
      ImageIndex = 5
      OnExecute = actCreateSubjExecute
      OnUpdate = actCreateSubjUpdate
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
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005FBA64000F9D120010A4
      170010A3180012A41A000FA112000000000000000000DBD1D200B79090009C5A
      4E008F3D3100D2C5C60000000000000000000000000000000000000000000000
      00004A4FA7002B3DAE00192FAF001228AF001427AC00202DA800373DA5005C5C
      A300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004DB0500048DF
      6C0067FF9A0076FFB10011A7180000000000B15D3700C97C4F00E8A67600FFC1
      8900D081580079191500D4C7C9000000000000000000000000003B43AF001331
      B8002C70E1002968DB001E5DD7001C53D200194ACC001440C5001134BC000717
      A8000615A700282BA80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0D2B6001FAE2F0050EB
      780056F083006CFFA20010A7160000000000B8643300FFCD9A00F2B27F00EAA3
      6F00D88C600089200C00A6716D000000000000000000000000003853BF005690
      EC006596ED006C9DEC00457EE300215FD8001A52D0001645C700123AC0000E2F
      B8000B24B100151B9F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000037963C003EDB5C0046E0
      680041D8620017A6200010A5150000000000BA662C00F1AE7D00E69D6A00E190
      5B00DE9366009B3014009D5B5100000000000000000000000000798FD8006C91
      FB005877FB007CB7FB00749BF5005287E400205CD600184BCB001440C4001033
      BA000D28B5003B3EA20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000148F1C0035D34D002CC2
      42005CB05F00C6DFCD001F9D200000000000C36F2E00E4956600E1966800E39D
      7200EDB08900B95A380098493500000000000000000000000000759AEC004690
      FE0055AFFF00459BFE004060FA007095F2004079E0001950CF001543C5001238
      BE00081EAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000308D34002BCC40004CA3
      4E000000000000000000D1E5D80000000000DD934E00EFAC6E00FCC49800F0AC
      7A00E5956100D27B4A00943B20000000000000000000000000003C60F4005BDD
      FE001DE5FF0058EBFE0059ADFA007F9CE600556ACE00205AD6001748C9001133
      BB00494AA6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000085AAAA00067F0C001E4D
      97002233C200272AAC00595CB200BFC4DE0000000000E0B99900C6753300BF75
      4400BA836900C5A29700D7CCCA000000000000000000000000005495EF0055EA
      FD0000CDFF003BEBFF00337EFD006A88F7008496CB00112BB7001329B1005D5E
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000224EF60070C2A5007BC7
      CF0065A2FF002E6DFF000133FF002122A6000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004060E0003F93
      F40060F6FD006AE0FF003676FF007EA8FF0078C2FF004A84D700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007786EF0082BCFA0094D2
      FF005993FF001D54FF000022E7006F72BD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004970
      E1005293FA003D6AFF008BC1FF009BC8FF0079C3FF004FACFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DBE1EE00284FEA00A9E9
      FF005792FF000C46FF001012AF00D8DEE9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008EAEF3009AC1FF000000000097D5FF007BC6FF0064B9FF00488AB0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007A84EE007AB1
      F4005995FF000025E5007A7DC800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000479AC9009AD7FF009BD8FF0091D3FF0079C3FC000A70A600016FA3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCE1EE002C4B
      D8005A9EFF001617B300DEE3EC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001A73A30072BFFC0088CFFF0089D0FF00469AD3000087BA00007FB1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D87
      E3001C3CD4008588D10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A8AA9000271A4002D8DC500278BC200007EB2000099CC002587B2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEE3
      EE003A44BE00E1E7ED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003D81A2000D77A6001379A700167FAB002A82A900000000000000
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
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE0000000000A3787500A3787500A378
      7500A3787500A3787500A3787500A3787500A3787500A3787500A3787500A378
      7500A378750090615E00000000000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000C6A59C00FFEF
      D600F7E7C600F7DEBD00F7DEB500F7D6AD00F7D6A500EFCE9C00EFCE9400EFCE
      9400EFCE9400F7D69C00B584840000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE000000000000000000A67C7600F2E2D300F2E2
      D300FFE8D100EFDFBB00FFE3C500FFDEBD00FFDDBA00FFD8B200FFD6AE00FFD2
      A500FFD2A30093646000000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A000000000000000000C6A59C00FFEF
      D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6A500EFCE9C00EFCE9C00EFCE
      9400EFCE9400EFCE9C00B584840000000000000000000031DE000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE00000000000000000000000000AB807800F3E7DA00F3E7
      DA0001990100AFD8A00071C5700041AA300081BB5E00EFD4A600FFD6AE00FFD2
      A300FFD2A30096676300000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000C6ADA500FFEF
      E700F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6AD00EFCE9C00EFCE
      9C00EFCE9400EFCE9C00B584840000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE0000000000000000000000000000000000B0837A00F4E9DD00F4E9
      DD00019901000199010001990100019901000199010041AA2F00FFD8B200FFD4
      A900FFD4A9009A6A6500000000000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000C6ADA500FFF7
      E700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEB500F7D6B500F7D6AD00EFCE
      9C00EFCE9C00EFCE9400B58484000000000000000000000000000031EF000031
      DE000031DE000031DE00000000000000000000000000000000000031DE000031
      DE000000000000000000000000000000000000000000B6897D00F5EDE400F5ED
      E4000199010001990100119E0E00CFD6A300FFE4C80021A21A00FFD8B200FFD7
      B000FFD7B0009E6D6700000000000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A000000000000000000CEB5AD00FFFF
      F700FFEFE700F7E7D600F7E7D600F7E7CE00F7DEC600F7DEBD00F7D6B500F7D6
      AD00EFCE9C00EFCE9C00B5848400000000000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      00000000000000000000000000000000000000000000BC8E7F00F7EFE800F7EF
      E80001990100019901000199010001990100FFE4C800EFDEBA00FFD8B200FFD7
      B000FFD9B400A2706900000000000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A000000000000000000D6B5AD00FFFF
      FF00FFF7EF00FFEFE700F7E7D600F7E7CE00F7E7C600F7DEC600F7DEBD00F7D6
      AD00F7D6A500F7D6A500B5848400000000000000000000000000000000000000
      0000000000000031DE000031E7000031E7000031E7000031DE00000000000000
      00000000000000000000000000000000000000000000C3958100F8F3EF00F8F3
      EF00F8F3EF00FFF4E800FFF4E800FFF4E800EFE3C400EFE3C400FFE4C800FFDE
      BD00FFDDBB00A5746B00000000000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD5252000000000000000000D6BDB500FFFF
      FF00FFF7F700FFF7EF00FFEFDE00F7E7D600F7E7CE00F7E7C600F7DEC600F7DE
      BD00F7D6B500F7D6AD00B5848400000000000000000000000000000000000000
      000000000000000000000031E7000031E7000031EF0000000000000000000000
      00000000000000000000000000000000000000000000CA9B8400F9F5F200FBFB
      FB00FFF4E800FFF4E800FFF4E800019901000199010001990100FFE8D100FFE3
      C500FFE1C200A8776D00000000000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A000000000000000000D6BDB500FFFF
      FF00FFFFFF00FFF7F700FFF7EF00FFEFE700F7E7D600F7E7CE00F7DEC600F7DE
      BD00F7DEB500F7DEB500B5848400000000000000000000000000000000000000
      0000000000000031DE000031EF000031E7000031EF000031F700000000000000
      00000000000000000000000000000000000000000000D2A18700F9F9F900FBFB
      FB00119F1000AFD8A000FFF4E800AFD8A0000199010001990100FFE8D100FFE4
      C800FFE3C600AC7A6F00000000000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A000000000000000000DEBDB500FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00F7E7D600F7E7CE00F7DE
      C600F7DEC600F7D6B500B5848400000000000000000000000000000000000000
      00000031F7000031EF000031E70000000000000000000031F7000031F7000000
      00000000000000000000000000000000000000000000D9A88A00FBFBFB00FFFF
      FF0071C570000199010001990100019901000199010001990100FFE8D100FFE8
      D100FFE6CE00AE7C7200000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000DEC6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE700FFEFDE00FFEFDE00FFEF
      D600E7DEC600C6BDAD00B5848400000000000000000000000000000000000031
      FF000031EF000031F700000000000000000000000000000000000031FF000031
      F7000000000000000000000000000000000000000000DFAE8C00FCFCFC00FFFF
      FF00FFFFFF0071C570000199010001990100AFD8A00001990100FFE8D100FFC8
      C200FFB0B000B07E7300000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFF7EF00F7E7D600C6A5
      9400B5948C00B58C8400B58484000000000000000000000000000031F7000031
      F7000031FF000000000000000000000000000000000000000000000000000031
      F7000031F70000000000000000000000000000000000E5B38F00FDFDFD00FDFD
      FD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00F4DECE00B280
      7400B2807400B2807400000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700E7CECE00BD8C
      7300EFB57300EFA54A00C6846B0000000000000000000031F7000031F7000031
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000031F700000000000000000000000000EAB89100FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300F5E1D200B280
      7400EDA75500D2A99500000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000EFCEBD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00C694
      7B00FFC67300CE94730000000000000000000031F7000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBC9200FFFFFF00FFFF
      FF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0EDEA00E9DAD000B280
      7400D9B0980000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000E7C6B500FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00E7CECE00C694
      7B00CE9C84000000000000000000000000000031F7000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2BF9400DCA98700DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700B280
      7400000000000000000000000000000000000000000000000000AD524A00CEB5
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
      00000000000000000000000000000000FFFFFFFF000000008183F00F00000000
      C101C003000000008101C003000000008101C003000000008101C00700000000
      8D01C007000000008081C00F0000000080FFC03F0000000080FFE03F00000000
      80FFF21F00000000C1FFF01F00000000C1FFF01F00000000E3FFF01F00000000
      E3FFF83F00000000FFFFFFFF00000000FFFFC001C001FFFC80038000C0019FF9
      80038000C0018FF380038000C00187E780038000C001C3CF80038000C001F11F
      80038000C001F83F80038000C001FC7F80038000C001F83F80038000C001F19F
      80038000C001E3CF80038000C001C7E780038000C0018FFB80038000C0031FFF
      80078000C0073FFF800FC001C00FFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited imglLarge: TImageList
    Bitmap = {
      494C010106000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
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
      0000000000000000000000000000E4EAEC00CDBCBA00A57273007C2C2D00A96F
      7000000000000000000000000000000000000000000000000000000000000000
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
      0000E2E1E100C9A5A000AB63590087251400A0452600C8785000F8B27A007A14
      0700B68382000000000000000000000000000000000000000000000000000000
      000000000000000000004A4FA7002B3DAE002B3DAE00192FAF001228AF001228
      AF001427AC00202DA800202DA800373DA5005C5CA3005C5CA300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D3B1
      A50097360C00BB6B4100E4A47400FFCE9700FCC08A00F1B07B00F3AC75009537
      2200730C0100C196960000000000000000000000000000000000000000003B43
      AF001331B8001331B8002C70E1002968DB002968DB001E5DD7001C53D2001C53
      D200194ACC001440C5001440C5001134BC000717A8000717A8000615A700282B
      A800282BA8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000DA613000DA613000DA613000DA613000DA613000DA613000DA61300CDA2
      9500D3895800FFD5A200FBC28E00F3B78400EFAB7800E9A26F00ECA26C00A84E
      3500871E0D0078120500D7CCCE00000000000000000000000000000000003B43
      AF001331B8001331B8002C70E1002968DB002968DB001E5DD7001C53D2001C53
      D200194ACC001440C5001440C5001134BC000717A8000717A8000615A700282B
      A800282BA8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000083C5870020AE300068FF9D006BFFA10071FFAC007DFFBB0011A51700D2AC
      9B00C97A4400FBC18E00F1B27F00EEAC7900EBA57200E69E6B00E89A6400B763
      460090271100801A0800C4ACAA00000000000000000000000000000000003853
      BF005690EC005690EC006596ED006C9DEC006C9DEC00457EE300215FD800215F
      D8001A52D0001645C7001645C700123AC0000E2FB8000E2FB8000B24B100151B
      9F00151B9F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6D7BC00098709004BE5720059F2860060F9900072FFAB0010A21500D6B4
      A200C8743B00F4B68400EEAA7700EAA57200E79D6A00E3966300E3915C00C478
      5600962D120089230C00B895900000000000000000000000000000000000798F
      D8006C91FB006C91FB005877FB007CB7FB007CB7FB00749BF5005287E4005287
      E400205CD600184BCB00184BCB001440C4001033BA001033BA000D28B5003B3E
      A2003B3EA2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1E1
      D800138C140044DE67004DE7740052EB7C005DF68A006FFFA70010A21500DABB
      A700C8713300EEA97800E89F6C00E59B6800E3956200DF8E5B00DE875200D088
      67009E341700952F1200AF7E770000000000000000000000000000000000798F
      D8006C91FB006C91FB005877FB007CB7FB007CB7FB00749BF5005287E4005287
      E400205CD600184BCB00184BCB001440C4001033BA001033BA000D28B5003B3E
      A2003B3EA2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000061A4
      650029BC3E003FDB600044DE670054EE7C002FC4470058F2860013A51600DFC2
      AE00C96E2B00E89E6D00E3966300E1905C00DD885300D9804A00D9804C00DEA1
      8300A43814009F391900A4685D0000000000000000000000000000000000759A
      EC004690FE004690FE0055AFFF00459BFE00459BFE004060FA007095F2007095
      F2004079E0001950CF001950CF001543C5001238BE001238BE00081EAD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C7D
      1D0034D34E0036D0530044E166001AA8270055AE58001D9E1F0010A01400E0C8
      B400CA6B2300E08E5D00DD8B5A00E5A17900EBB18A00F0BC9900EFBB9400EBAD
      8200CA7E5B00A9411C0098504300000000000000000000000000000000003C60
      F4005BDDFE005BDDFE001DE5FF0058EBFE0058EBFE0059ADFA007F9CE6007F9C
      E600556ACE00205AD600205AD6001748C9001133BB001133BB00494AA6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000F79
      11002DCC430035D1500011981B0078C07C0000000000C9E2D00026A12700E7D3
      C000CA670D00FAC69800FFD1A400F5B98400EEA97600E79F6A00E3945F00E08A
      5600E38F5C00D27C51008F3B2A00000000000000000000000000000000003C60
      F4005BDDFE005BDDFE001DE5FF0058EBFE0058EBFE0059ADFA007F9CE6007F9C
      E600556ACE00205AD600205AD6001748C9001133BB001133BB00494AA6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCE1EE002674
      3B0025C337001DAE2C00216A55005B5DC7007A7DCB00AEB3DD00CAE0D3000000
      0000E8C4A200CA6C1800E4995900F8BB8E00F1AF7F00EEA77600DE8F5C00C86E
      3A00B15120009A340B00A1493200000000000000000000000000000000005495
      EF0055EAFD0055EAFD0000CDFF003BEBFF003BEBFF00337EFD006A88F7006A88
      F7008496CB00112BB700112BB7001329B1005D5EA6005D5EA600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000869DF4000D3BF3002D70
      A1000C8B14000A8A11004788DB003462EF001437DB000212BD001D1EA400B0B5
      E10000000000E6E4DF00D7925A00C8691700BF641D00AA540F00BB6B4000C78D
      7300D1B1A500E0D9D70000000000000000000000000000000000000000004060
      E0003F93F4003F93F40060F6FD006AE0FF006AE0FF003676FF007EA8FF007EA8
      FF0078C2FF004A84D7004A84D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002142F800AFEFFF00AFEF
      FF003C9C6600037B08005A94FF003C76FF001A52FF000036FF000024E4004A4C
      BE00000000000000000000000000E5D1BF00E0D6CA00E6ECEE00000000000000
      0000000000000000000000000000000000000000000000000000000000004060
      E0003F93F4003F93F40060F6FD006AE0FF006AE0FF003676FF007EA8FF007EA8
      FF0078C2FF004A84D7004A84D700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B9EF2004579F700ADED
      FF0093CFFD0038997C005790FF00336CFF000E43FF00002FFD000008AF00A5AA
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004970E1004970E1005293FA003D6AFF003D6AFF008BC1FF009BC8FF009BC8
      FF0079C3FF004FACFC004FACFC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3E9EE00243DEF009FDD
      FE009DDCFF0076B2FF00558DFF002D64FF00053AFF000021E0003F41B4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008EAEF3009AC1FF009AC1FF000000000097D5FF0097D5
      FF007BC6FF0064B9FF0064B9FF00488AB0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009AAAF3003662
      EA00ADEEFF007BB7FF00548DFF00245AFF000033FF000206A500BCC1E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008EAEF3009AC1FF009AC1FF000000000097D5FF0097D5
      FF007BC6FF0064B9FF0064B9FF00488AB0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6ECEE00303F
      E10097D4FC0085C3FF00518AFF00164EFF00001DD900575ABD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000479AC9009AD7FF009AD7FF009BD8FF0091D3FF0091D3
      FF0079C3FC000A70A6000A70A600016FA3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AAB5
      F200294FE10099DBFF004C86FF00073FFF00090AA000CED3E800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001A73A30072BFFC0072BFFC0088CFFF0089D0FF0089D0
      FF00469AD3000087BA000087BA00007FB1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F46E2007EB6F7004986FF00001AD6007073C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001A73A30072BFFC0072BFFC0088CFFF0089D0FF0089D0
      FF00469AD3000087BA000087BA00007FB1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8C0EF001D39D0004282FF001516AA00DBE0EB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A8AA9000271A4000271A4002D8DC500278BC200278B
      C200007EB2000099CC000099CC002587B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004E59D8000D25C500888CD7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003D81A2003D81A2000D77A6001379A7001379
      A700167FAB002A82A9002A82A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C5CCEA00353EC300E3E9ED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003D81A2003D81A2000D77A6001379A7001379
      A700167FAB002A82A9002A82A900000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000AD736B009C52
      52009C4A4A009C5252009C4A4A00A5737300B5B5B500B5B5B500B5B5B500BDB5
      B500BDB5B500B5B5B500B5B5B500B5B5B500B5B5B500A5737300944242009C4A
      4A009C4A4A009C4A4A009C4A4A0000000000000000000000000000000000AD7B
      7B00B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500EFD6AD00F7D6A500EFCE
      9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00C663
      6300C6636300CE636300B55252009C6B6B00B5B5B500CECECE00E7E7DE00EFEF
      EF00F7F7EF00F7F7EF00EFE7E700E7DEDE00DEDEDE00B5737300942929009431
      31009C393900BD5A5A00C66363009C4A4A00000000000000000000000000AD73
      8400EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500F7D6AD00F7D6A500EFCE
      9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE0000000000000000000000000000000000AD7B
      7B00EFDEC600F7E7C600F7DEC600F7DEBD00BDCE8C00E7D6A500E7D6A500EFCE
      A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300BD5A5A009C6B6B00A58C8C00B5848400CEADAD00DECE
      CE00F7F7EF00FFFFF700F7F7F700EFEFE700E7E7E700B5737300942929009431
      31009C393900C65A5A00C66363009C4A4A00000000000000000000000000AD73
      8400EFDEC600F7E7C600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCE
      A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE000031DE0000000000000000000000000000000000AD7B
      7B00F7DECE00F7E7CE00F7DEC600F7DEC600CED69C00009C0000E7D6A5006BB5
      4A0039A5290039A529006BB54A00C6C67B00E7CE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300BD5A5A009C737300A57B7B009C393900B5736B00C69C
      9C00EFE7E700F7F7F700FFF7F700F7F7EF00EFEFEF00BD7B7B00942929009431
      31009C393900C65A5A00C66363009C4A4A00000000000000000000000000AD73
      8400F7DECE00F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6
      AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B5848400000000000000000000000000000000000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      DE000031DE000031DE000000000000000000000000000000000000000000AD7B
      7B00EFE7CE00F7E7D600F7E7CE00F7DEC600EFDEB500009C0000109C1000009C
      0000009C0000009C0000009C0000009C000094BD5A00E7CE9400EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300BD5A5A00A5737300A5848400943131009C424200B573
      7300DEDED600EFEFEF00F7F7F700FFF7F700F7F7F700BD7B7B00942929009431
      31009C393900C65A5A00C66363009C4A4A00000000000000000000000000AD73
      8400F7E7CE00F7E7D600F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6
      AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B5848400000000000000000000000000000000000031DE000031
      DE000031DE000031DE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000031
      DE000031DE00000000000000000000000000000000000000000000000000AD7B
      7B00F7E7D600F7EFDE00F7E7D600F7E7CE00EFDEBD00009C0000009C0000009C
      0000009C0000009C0000009C0000009C0000009C0000C6C67B00EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300BD5A5A00A5737300AD8C8C0094313100943131009C4A
      4A00C6C6C600E7E7DE00EFEFEF00FFF7F700FFFFFF00C67B7B00942929009431
      31009C393900C65A5A00C66363009C4A4A00000000000000000000000000AD73
      8400F7E7D600F7EFDE00F7E7D600F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6
      B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE
      9400EFCE9400B5848400000000000000000000000000000000000031DE000031
      DE000031DE000031DE000031DE00000000000000000000000000000000000000
      0000000000000000000000000000000000000031DE000031DE000031DE000031
      DE0000000000000000000000000000000000000000000000000000000000AD84
      7B00F7E7DE00F7EFDE00F7E7D600F7E7CE00E7DEC600009C0000009C0000009C
      000039AD3100C6CE8C00C6CE8C006BB54A00009C000039A52900EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300B5525200AD7B7B00B58C8C0094292900942929009431
      3100ADA5A500CECECE00E7E7DE00F7EFEF00FFFFFF00C6848400942929009431
      31009C393900C65A5A00C66363009C4A4A00000000000000000000000000AD7B
      8400F7E7DE00F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEC600F7DE
      BD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE9400EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000031
      DE000031DE000031DE000031DE000031DE000000000000000000000000000000
      00000000000000000000000000000031DE000031DE000031DE000031DE000000
      000000000000000000000000000000000000000000000000000000000000AD84
      7B00F7EFE700F7EFE700F7EFDE00F7E7D600EFE7C600009C0000009C0000009C
      000031A52100E7D6AD00E7D6A500E7D6A500A5C67300109C0800EFCE9C00EFCE
      9400EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300B5525200AD7B7B00C6ADAD00A5636300A56363009C63
      63009C9C9C00B5B5B500D6D6D600EFEFEF00FFFFFF00C6848400942929009431
      31009C393900BD5A5A00C66363009C4A4A00000000000000000000000000B57B
      8400F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DE
      BD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE9C00EFCE
      9400EFCE9400B584840000000000000000000000000000000000000000000000
      00000031FF000031DE000031DE000031DE000031DE0000000000000000000000
      000000000000000000000031DE000031DE000031DE000031DE00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      7B00F7EFE700FFF7EF00F7EFE700F7EFDE00EFE7CE00009C0000009C0000009C
      0000009C0000009C0000E7D6AD00EFD6AD00EFD6AD00EFCEA5007BCE7B00EFCE
      9C00EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300BD5A5A00B5737300D6A5A500C69C9C00BD9C9C00BD94
      9400AD8C8C00AD8C8C00C69C9C00D6ADAD00E7C6C600C6737300A5424200AD42
      4200AD4A4A00C6636300C66363009C4A4A00000000000000000000000000B584
      8400F7EFE700FFF7EF00F7EFE700F7EFDE00F7E7D600F7E7D600F7E7CE00F7DE
      C600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE9C00EFCE
      9C00EFCE9400B584840000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE000031DE000031DE00000000000000
      00000031DE000031DE000031DE000031DE000031DE0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8400F7EFEF00FFF7EF00F7EFE700F7EFE700EFE7CE00EFE7CE00E7DEC600E7DE
      C600EFDEBD00EFDEB500E7D6AD00F7D6B500EFD6AD00EFD6AD007BCE7B00EFCE
      9C00EFCE9400B58C7B00000000000000000000000000B5847300C66B6B00CE63
      6300CE636300CE636300CE636300CE636300CE636300CE636300CE636300CE63
      6300CE636300CE636300C6636300C6636300C6636300CE636300CE636300CE63
      6300CE636300CE636300C66363009C4A4A00000000000000000000000000BD84
      8400F7EFEF00FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7
      CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCEA500EFCE
      9C00EFCE9400B584840000000000000000000000000000000000000000000000
      00000000000000000000000000000031DE000031DE000031DE000031DE000031
      DE000031DE000031DE000031DE000031DE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD8C
      8400FFF7F700FFFFF700FFF7EF007BCE7B00F7EFE700F7EFDE00F7E7D600EFE7
      C600E7DEC600EFDEBD00EFDEB500E7D6AD00E7D6AD00E7D6A500EFD6AD00EFCE
      A500EFCE9C00B58C7B00000000000000000000000000B5847300C66B6B00C663
      6300BD5A5A00C6636300C66B6B00CE737300CE737300CE737300CE737300CE73
      7300CE737300CE737300CE737300CE737300CE737300CE737300CE737300CE7B
      7B00CE6B6B00CE636300C66363009C4A4A00000000000000000000000000BD84
      8C00FFF7F700FFFFF700FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7
      CE00F7E7CE00F7DEC600F7DEC600F7DEBD00F7D6B500F7D6AD00F7D6AD00EFCE
      A500EFCE9C00B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000031DE000031DE000031FF000031
      DE000031FF000031DE000031DE00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD94
      8400FFF7F700FFFFFF00FFF7F7007BCE7B00F7EFE700F7EFE700F7EFDE00EFE7
      CE00009C0000009C0000009C0000009C0000009C0000E7D6AD00EFD6AD00EFD6
      AD00EFCEA500B58C7B00000000000000000000000000B5847300C66B6B00AD4A
      4A00A54A4200B56B6B00C68C8C00CEADAD00D6BDBD00D6BDBD00D6BDBD00D6BD
      BD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00D6BDBD00DEC6
      C600CE8C8C00CE636300C66363009C4A4A00000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFF7F700FFF7EF00F7EFE700F7EFE700F7EFDE00F7E7
      D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6AD00F7D6
      AD00EFCEA500B584840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000031
      DE000031FF000031DE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C694
      8400FFF7F700FFFFFF00FFFFFF00FFF7F700109C1000ADD6A500EFEFD600EFE7
      CE00EFE7CE0031AD2900009C0000009C0000009C0000E7D6AD00F7D6B500EFD6
      AD00EFCEA500B58C7B00000000000000000000000000B5847300C66B6B00AD42
      4200CE9C9C00F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00EFE7
      E700CE8C8C00C65A5A00C66363009C4A4A00000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EFE700F7EFE700F7EF
      DE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6B500F7D6
      AD00EFCEA500B584840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000031DE000031DE000031FF000031
      DE000031DE000031FF000031FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C69C
      8400FFF7F700FFFFFF00FFFFFF00FFFFFF0039AD3900009C000073C66B00CEDE
      B500CEDEB50039AD3900009C0000009C0000009C0000EFDEB500F7DEBD00F7D6
      B500EFD6AD00B58C7B00000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFF7F700EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000C68C
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EFE700F7EF
      E700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DEBD00F7D6
      B500F7D6AD00B584840000000000000000000000000000000000000000000000
      00000000000000000000000000000031DE000031DE000031FF000031DE000031
      FF000031FF000031FF000031DE000031FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C69C
      8400FFF7F700FFFFFF00FFFFFF00FFFFFF00CEEFCE00009C0000009C0000009C
      0000009C0000009C0000009C0000009C0000009C0000EFDEBD00F7DEBD00EFDE
      BD00DEC6A5009C847B00000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7F7F700EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000CE94
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7EF00F7EF
      E700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00F7DEC600F7DEBD00F7DE
      BD00DEC6A500A57B840000000000000000000000000000000000000000000000
      000000000000000000000031FF000031FF000031FF000031DE000031FF000000
      0000000000000031FF000031FF000031FF000031FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00F7FFF7009CDE9C00009C0000009C
      0000009C0000009C0000009C0000109C1000009C0000E7DEC600EFDEBD00CEBD
      AD00B5AD94009C847B00000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00E7E7E700CEC6C600CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600E7DEDE00EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000CE94
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFF7
      EF00F7EFE700F7EFE700F7EFDE00F7E7D600F7E7CE00F7E7CE00EFD6BD00CEBD
      AD00B5AD94009C7B840000000000000000000000000000000000000000000000
      0000000000000031FF000031FF000031DE000031FF000031FF00000000000000
      000000000000000000000031FF000031FF000031FF000031FF00000000000000
      000000000000000000000000000000000000000000000000000000000000CEA5
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700CEEFCE0073C6
      6B0039AD390039AD390073C66300EFE7CE00009C0000C6D6AD00CEBDAD00BDB5
      A500B5AD9C009C847B00000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00F7EFEF00EFE7E700EFE7E700EFE7E700EFE7E700EFE7
      E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700F7EFEF00EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000D69C
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFF7EF00F7EFE700F7EFDE00F7EFDE00F7EFDE00E7DECE00CEBDAD00BDB5
      A500B5AD9C009C7B840000000000000000000000000000000000000000000000
      00000031FF000031FF000031FF000031FF000031FF0000000000000000000000
      0000000000000000000000000000000000000031FF000031FF000031FF000000
      000000000000000000000000000000000000000000000000000000000000D6A5
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700E7DEC600AD84730084845A00AD7B7300AD7B
      7300AD7B7300AD847300000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00EFE7E700D6CECE00D6CECE00D6CECE00D6CECE00D6CE
      CE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00CECECE00E7E7E700EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000D69C
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700EFDED600B5847300AD847300AD7B7300AD7B
      7300AD7B7300AD7B730000000000000000000000000000000000000000000031
      FF000031FF000031FF000031FF000031FF000000000000000000000000000000
      000000000000000000000000000000000000000000000031FF000031FF000031
      FF0000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00E7CEC600B5847300E7B58400E7AD6B00EFA5
      5200EFA53900B5848400000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00EFEFE700E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00EFEFEF00EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00E7CEC600B5847300E7B58400E7AD6B00EFA5
      5200EFA53900B5848400000000000000000000000000000000000031FF000031
      FF000031FF000031FF000031FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      FF0000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700E7CEC600B5847300EFC68C00F7BD6B00FFB5
      5200B584840000000000000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00EFEFE700E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00EFEFEF00EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700E7CEC600B5847300EFC68C00F7BD6B00FFB5
      5200B5848400000000000000000000000000000000000031FF000031FF000031
      FF000031FF000031FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00B5847300EFC68C00F7BD6B00B584
      84000000000000000000000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00E7E7E700CECECE00D6CECE00D6CECE00D6CECE00D6CE
      CE00D6CECE00D6CECE00D6CECE00D6CECE00D6CECE00CECECE00E7E7E700EFE7
      E700CE8C8C00BD5A5A00C66363009C4A4A00000000000000000000000000DEA5
      9400FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00B5847300EFC68C00F7BD6B00B584
      840000000000000000000000000000000000000000000031FF000031FF000031
      FF000031FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300EFC68C00B58484000000
      00000000000000000000000000000000000000000000B5847300C66B6B00AD42
      4200CEA5A500FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7
      F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700EFE7
      E700CE8C8C00C65A5A00C66363009C4A4A00000000000000000000000000DEA5
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300EFC68C00B58484000000
      000000000000000000000000000000000000000000000031FF000031FF000031
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400B5847300B5848400000000000000
      00000000000000000000000000000000000000000000B5847300BD6B6B00AD42
      4200CE9C9C00EFEFEF00EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7
      E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFE7E700EFEFE700E7DE
      DE00C68C8C00B5525200BD5A5A009C4A4A00000000000000000000000000DEA5
      8C00E7CEBD00EFD6BD00EFD6BD00EFCEC600E7CEBD00E7CEBD00E7CEBD00E7CE
      BD00DEC6BD00DEC6BD00DEC6BD00CEADA500B5847300B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD736B00A542
      4200B58C8400C6CECE00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600CEC6
      C600B5848400944242009C4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF000000000000FFFE0FFF
      FFFF000000000000FFF007FC003F000000000000FFE003E00007000000000000
      F00001E00007000000000000F00001E00007000000000000F00001E000070000
      00000000E00001E00007000000000000E00001E0001F000000000000E00001E0
      001F000000000000E08001E0001F000000000000C01001E0003F000000000000
      800803E001FF000000000000800E3FE001FF000000000000800FFFF001FF0000
      00000000801FFFFC40FF000000000000C01FFFFC40FF000000000000C03FFFFC
      00FF000000000000E03FFFFC00FF000000000000F07FFFFC00FF000000000000
      F07FFFFC00FF000000000000F8FFFFFE01FF000000000000F8FFFFFE01FF0000
      00000000FFFFFFFFFFFF000000000000E00003C00001E00003FFFFFFE0000380
      0000E00003FFFFF9E00003800000E00003FFFFF1E00003800000E00003C7FFE3
      E00003800000E00003C3FF87E00003800000E00003C1FF0FE00003800000E000
      03E0FE1FE00003800000E00003F07C3FE00003800000E00003FC307FE0000380
      0000E00003FE00FFE00003800000E00003FF01FFE00003800000E00003FF83FF
      E00003800000E00003FF01FFE00003800000E00003FE00FFE00003800000E000
      03FC187FE00003800000E00003F83C3FE00003800000E00003F07F1FE0000380
      0000E00003E0FF8FE00003800000E00003C1FFEFE00007800000E0000783FFFF
      E0000F800000E0000F87FFFFE0001F800000E0001F8FFFFFE0003F800000E000
      3FFFFFFFFFFFFFC00001FFFFFFFFFFFF00000000000000000000000000000000
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
        FloatLeft = 356
        FloatTop = 342
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
            Item = barBtnCreateSubj
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
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
    object barBtnCreateSubj: TdxBarButton
      Action = actCreateSubj
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
        DataType = ftInteger
        Name = 'CUSTOMS_WORKED'
        ParamType = ptUnknown
        Value = 1
        AcceptedSources = []
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.* '
      '       ,ot.NAME AS PO_TYPE_NAME'
      
        '       ,(SELECT max(id) FROM fdc_customs_lst c WHERE c.customs_c' +
        'ode_8 = t.DestCustomsCode)AS Customs_ID'
      '  from fdc_PO_NonID_lst_all t,  fdc_object_type          ot'
      ' where  ot.id (+) = t.PAYMENT_ORDER_TYPE_ID'
      '   AND t.ID = :ID'
      '')
    SourceServerObject = 'fdc_PO_NonID_lst_all'
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
    object dsDataEXEC_DATE: TDateTimeField
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
      OnChange = dsDataChange
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
    end
    object dsDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Size = 25
    end
    object dsDataNAME_K: TStringField
      FieldName = 'NAME_K'
      Size = 80
    end
    object dsDataINN_K: TStringField
      FieldName = 'INN_K'
      Size = 12
    end
    object dsDataKPP_K: TStringField
      FieldName = 'KPP_K'
      Size = 9
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataINCOME_DATE: TDateTimeField
      FieldName = 'INCOME_DATE'
    end
    object dsDataPAYMENT_ORDER_TYPE_ID: TFloatField
      FieldName = 'PAYMENT_ORDER_TYPE_ID'
    end
    object dsDataPAYMENT_ORDER_ID: TFloatField
      FieldName = 'PAYMENT_ORDER_ID'
    end
    object dsDataPO_TYPE_NAME: TStringField
      FieldName = 'PO_TYPE_NAME'
      Size = 1500
    end
    object dsDataNAME_P: TStringField
      FieldName = 'NAME_P'
      Size = 80
    end
    object dsDataINN_P: TStringField
      FieldName = 'INN_P'
      Size = 12
    end
    object dsDataKPP_P: TStringField
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsDataRECIPIENT_ID: TFloatField
      FieldName = 'RECIPIENT_ID'
    end
    object dsDataKBK: TStringField
      FieldName = 'KBK'
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataBIK_P: TStringField
      DisplayLabel = #1041#1048#1050' '#1073#1072#1085#1082#1072' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'BIK_P'
      Size = 9
    end
    object dsDataACCOUNT_P: TStringField
      DisplayLabel = #1056'/'#1057' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'ACCOUNT_P'
    end
    object dsDataBIK_K: TStringField
      DisplayLabel = #1041#1048#1050' '#1073#1072#1085#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'BIC_K'
      Size = 9
    end
    object dsDataACCOUNT_K: TStringField
      DisplayLabel = #1056'/'#1057' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'ACCOUNT_K'
    end
    object dsDataVAL_PAYMENT_REASON: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1086#1089#1085#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'VAL_PAYMENT_REASON'
      Size = 2
    end
    object dsDataVAL_DOC_NUMBER: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1085#1086#1084#1077#1088#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VAL_DOC_NUMBER'
      Size = 15
    end
    object dsDataVAL_DOC_DATE: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1076#1072#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VAL_DOC_DATE'
    end
    object dsDataVAL_PAYMENT_TYPE: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1090#1080#1087#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'VAL_PAYMENT_TYPE'
      Size = 3
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
      OnChange = dsDataChange
    end
    object dsDataUIN: TStringField
      FieldName = 'UIN'
      ReadOnly = True
      Size = 25
    end
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  IF :TYPESYSNAME = '#39'PaymentOrderNonIDDest'#39' THEN'
      '    fdc_PO_NonID_Dest_Identify('
      '        :ID,'
      '        :CUSTOMS_ID'
      '      );  '
      '  ELSE'
      '    fdc_PO_Non_id_Identify('
      '        :ID,'
      '        :PAYER_ID'
      '      );'
      '  END IF;'
      'end;')
    SourceServerObject = 'fdc_PO_Non_id_Identify'
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_ID'
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
      '   AND 0 = 1')
  end
  inherited dsState: TfdcQuery
    AfterOpen = dsStateAfterOpen
  end
end
