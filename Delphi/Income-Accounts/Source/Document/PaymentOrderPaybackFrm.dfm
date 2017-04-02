inherited Payment_Order_PaybackForm: TPayment_Order_PaybackForm
  Left = 302
  Top = 143
  Width = 886
  Height = 719
  Caption = #1047#1072#1103#1074#1082#1072' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 878
    Height = 692
    ActivePage = tabGeneral
    ClientRectBottom = 668
    ClientRectRight = 878
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 872
        Height = 639
        inherited edtName: TcxDBTextEdit
          TabOrder = 40
        end
        inherited edtDescript: TcxDBMemo
          Top = 835
          TabOrder = 37
          Width = 707
        end
        object edtSeqPayment: TcxDBMaskEdit [2]
          Left = 140
          Top = 92
          DataBinding.DataField = 'SEQ_PAYMENT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 121
        end
        object edtKindPayment: TcxDBMaskEdit [3]
          Left = 335
          Top = 92
          DataBinding.DataField = 'KIND_PAYMENT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        object fdcBank: TfdcObjectLinkEdit [4]
          Tag = 33
          Left = 154
          Top = 534
          DataBinding.DataField = 'DECISION_BANK_NAME'
          DataBinding.DataSource = dsDecision
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
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 31
          Width = 728
        end
        object edtAccount: TcxDBMaskEdit [5]
          Tag = 33
          Left = 154
          Top = 509
          DataBinding.DataField = 'DECISION_ACCOUNT'
          DataBinding.DataSource = dsDecision
          ParentFont = False
          Properties.EditMask = '!99999999999999999999;1;_'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 29
          Width = 350
        end
        object edtBic: TcxDBMaskEdit [6]
          Tag = 33
          Left = 532
          Top = 509
          DataBinding.DataField = 'DECISION_BIC'
          DataBinding.DataSource = dsDecision
          ParentFont = False
          Properties.EditMask = '!999999999;1;_'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 30
          Width = 200
        end
        object edtCorrAccount: TcxDBMaskEdit [7]
          Tag = 33
          Left = 154
          Top = 559
          DataBinding.DataField = 'DECISION_CORR_ACCOUNT'
          DataBinding.DataSource = dsDecision
          ParentFont = False
          Properties.EditMask = '!99999999999999999999;1;_'
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 32
          Width = 728
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [9]
          Tag = 33
          Left = 140
          Top = 116
          DataBinding.DataField = 'DOC_NUMBER_UFK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 119
        end
        object cxDBDateEdit2: TcxDBDateEdit [10]
          Tag = 33
          Left = 327
          Top = 116
          DataBinding.DataField = 'DOC_DATE_UFK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 520
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 327
          Width = 106
        end
        inherited edtPayerINN: TcxDBMaskEdit
          Top = 172
          TabOrder = 11
          Width = 119
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Top = 197
          TabOrder = 13
          Width = 258
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Top = 378
          TabOrder = 22
          Width = 107
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 482
          Top = 453
          TabOrder = 27
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 586
          Top = 378
          TabOrder = 23
          Width = 91
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Top = 403
          TabOrder = 24
          Width = 258
        end
        inherited cmbxedtCurrID: TfdcObjectLookupEdit
          Top = 353
          TabOrder = 19
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Left = 327
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Left = 302
          Top = 172
          TabOrder = 12
          Width = 109
        end
        inherited btnSaveNew: TcxButton
          Left = 685
          Top = 861
          TabOrder = 39
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Top = 428
          TabOrder = 25
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 563
          Top = 428
          TabOrder = 26
          Width = 101
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 861
          TabOrder = 38
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Left = 766
          Top = 353
          TabOrder = 21
        end
        inherited edtDescript2: TcxDBMemo
          Top = 802
          TabOrder = 36
          Height = 30
          Width = 673
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 753
          Top = 453
          TabOrder = 28
        end
        inherited edtNote: TcxDBMemo
          Top = 704
          Properties.MaxLength = 210
          TabOrder = 34
          Width = 673
        end
        inherited gbxPaymentFor: TcxGroupBox
          Top = 597
          TabOrder = 33
          Width = 827
          inherited dxLayoutControl1: TdxLayoutControl
            Width = 823
            inherited edtPFSumma: TcxDBTextEdit
              Width = 93
            end
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 348
              Width = 92
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 629
              Width = 93
            end
            inherited edtSubjectName: TfdcObjectLinkEdit
              Width = 93
            end
            inherited edtSubjectINN: TcxDBTextEdit
              Width = 93
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 494
              Width = 93
            end
          end
        end
        inherited edtRecipientINN: TcxDBMaskEdit
          Top = 266
          TabOrder = 14
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Top = 266
          TabOrder = 15
          Width = 71
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Top = 291
          DataBinding.DataField = 'RECIPIENT_NAME_BANK'
          TabOrder = 16
          Width = 20
        end
        inherited edtKBK: TcxDBTextEdit
          Top = 353
          TabOrder = 20
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Top = 316
          TabOrder = 17
        end
        inherited edtCustomsName: TcxDBTextEdit
          Top = 316
          TabOrder = 18
          Width = 462
        end
        inherited edtUIN: TcxDBTextEdit
          Top = 778
          TabOrder = 35
          Width = 707
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup1: TdxLayoutGroup
            inherited lcGeneralGroup8: TdxLayoutGroup
              inherited lciDocNumber: TdxLayoutItem
                Tag = 13
                Caption = #1053#1086#1084#1077#1088
              end
            end
            inherited lcGeneralGroup7: TdxLayoutGroup
              inherited lcGrpBank: TdxLayoutGroup
                Visible = False
                inherited lciBankDocNo: TdxLayoutItem
                  Visible = False
                end
                inherited lciBankDocDate: TdxLayoutItem
                  Visible = False
                end
              end
            end
          end
          object lcGeneralGroup13: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralGroup15: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem9: TdxLayoutItem
                Caption = #1054#1095#1077#1088#1077#1076#1085#1086#1089#1090#1100' '#1087#1083#1072#1090#1077#1078#1072
                Visible = False
                Control = edtSeqPayment
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem11: TdxLayoutItem
                Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
                Visible = False
                Control = edtKindPayment
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup16: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem3: TdxLayoutItem
                Tag = 33
                Caption = #1053#1086#1084#1077#1088' '#1074' '#1059#1060#1050
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBMaskEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem4: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1074' '#1059#1060#1050
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBDateEdit2
                ControlOptions.ShowBorder = False
              end
            end
          end
          inherited lcGeneralGroup11: TdxLayoutGroup
            inherited lciName_R: TdxLayoutItem
              CaptionOptions.AlignHorz = taRightJustify
            end
          end
          inherited lcGeneralGroup3: TdxLayoutGroup
            inherited lcGeneralGroup6: TdxLayoutGroup
              inherited lciPayTypeCode: TdxLayoutItem
                Visible = False
              end
            end
            inherited lcGeneralGroup5: TdxLayoutGroup
              inherited lciSumma: TdxLayoutItem
                Visible = False
              end
            end
          end
          inherited lciRestSum: TdxLayoutItem
            Visible = False
          end
          inherited lcGeneralGroup2: TdxLayoutGroup
            Visible = False
            inherited lciRestXSum: TdxLayoutItem
              Visible = False
            end
            inherited lciLockSum: TdxLayoutItem
              Visible = False
            end
          end
          object lciBank: TdxLayoutGroup [9]
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1073#1072#1085#1082#1072
            object lcGeneralGroup14: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcAccount: TdxLayoutItem
                Tag = 33
                Caption = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1077#1090
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtAccount
                ControlOptions.ShowBorder = False
              end
              object lcBic: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1041#1048#1050
                Control = edtBic
                ControlOptions.ShowBorder = False
              end
            end
            object lcBank: TdxLayoutItem
              Tag = 33
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcBank
              ControlOptions.ShowBorder = False
            end
            object lcCorrAccount: TdxLayoutItem
              Tag = 33
              Caption = #1050#1086#1088#1088'. '#1089#1095#1077#1090
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtCorrAccount
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNoteEdt: TdxLayoutItem
            Tag = 0
          end
          inherited lciDescript2: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 878
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 639
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 665
        Width = 878
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 875
        Height = 639
      end
    end
    inherited tabConfirmation: TcxTabSheet
      inherited lcConfirm: TdxLayoutControl
        Width = 878
        Height = 668
        inherited edtCnfrmDocNumber: TcxDBTextEdit
          Width = 563
        end
        inherited edtCnfrmDocDate: TcxDBDateEdit
          Left = 684
        end
        inherited edtCnfrmPayerINN: TcxDBTextEdit
          Width = 554
        end
        inherited edtCnfrmPayerKPP: TcxDBTextEdit
          Left = 670
        end
        inherited edtCnfrmPayerName: TcxDBTextEdit
          Width = 770
        end
        inherited edtCnfrmCurrencyName: TcxDBTextEdit
          Width = 706
        end
        inherited edtCnfrmDocSumma: TcxDBCurrencyEdit
          Width = 770
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 878
        Height = 668
        ClientRectBottom = 644
        ClientRectRight = 878
      end
    end
    inherited tabBankInfo: TcxTabSheet
      inherited lcBankInfo: TdxLayoutControl
        Width = 878
        Height = 668
        inherited edtBankInfoPayerName: TcxDBTextEdit
          Width = 734
        end
        inherited edtBankInfoPayerAccount: TcxDBTextEdit
          Width = 548
        end
        inherited edtBankInfoRecepientName: TcxDBTextEdit
          Width = 734
        end
        inherited edtBankInfoRecepientAccount: TcxDBTextEdit
          Width = 548
        end
        inherited edtBankInfoPaymentInfo: TcxDBMemo
          Width = 185
        end
        inherited edtUIN2: TcxDBTextEdit
          Width = 837
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
      ShortCut = 0
      Visible = False
      OnExecute = nil
      OnUpdate = nil
    end
    object actOpenDecision: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1088#1077#1096#1077#1085#1080#1077
      OnExecute = actOpenDecisionExecute
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
        FloatLeft = 240
        FloatTop = 278
        FloatClientWidth = 103
        FloatClientHeight = 78
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
            Item = dxBarButton1
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = dxBarButton6
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
    inherited btnDelete: TdxBarButton
      Enabled = False
    end
    inherited dxBarButton2: TdxBarButton
      Enabled = False
    end
    object dxBarButton6: TdxBarButton
      Action = actOpenDecision
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select t.*, decode(sign(t.rest_summa - t.locked_summa),1,t.rest_' +
        'summa - t.locked_summa,0) as rest_summa2,'
      
        '       (SELECT Seq_Payment FROM fdc_payment_order_payback pb WHE' +
        'RE pb.ID = :id) as Seq_Payment,'
      
        '       (SELECT Kind_Payment FROM fdc_payment_order_payback pb WH' +
        'ERE pb.ID = :id) as Kind_Payment,'
      
        '       (SELECT doc_date_ufk FROM fdc_payment_order_payback pb WH' +
        'ERE pb.ID = :id) as doc_date_ufk,'
      
        '       (SELECT doc_number_ufk FROM fdc_payment_order_payback pb ' +
        'WHERE pb.ID = :id) as doc_number_ufk,'
      
        '       (SELECT pb.DEC_PAY_ID FROM fdc_payment_order_payback pb W' +
        'HERE pb.ID = :id) as DEC_PAY_ID,'
      '       nvl(po.name_k,t.recipient_name) as recipient_name_bank'
      '  from fdc_Payment_Order_Agg_Lst t,fdc_payment_order po'
      ' where t.ID = :ID'
      '  and po.id = t.id'
      
        '  AND EXISTS (SELECT 1 FROM fdc_payment_order_payback pb WHERE p' +
        'b.ID = :id)'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      'order by t.is_payment_for desc')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pf_Subject_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pf_Subject_Id'
        ParamType = ptUnknown
      end>
    inherited dsDataDESCRIPT2: TStringField
      Size = 0
    end
    object dsDataSEQ_PAYMENT: TStringField
      FieldName = 'SEQ_PAYMENT'
      Size = 1
    end
    object dsDataKIND_PAYMENT: TStringField
      FieldName = 'KIND_PAYMENT'
      Size = 1
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataNLS: TStringField
      FieldName = 'NLS'
    end
    object dsDataDEC_PAY_ID: TFloatField
      FieldName = 'DEC_PAY_ID'
    end
    object dsDataRECIPIENT_NAME_BANK: TStringField
      FieldName = 'RECIPIENT_NAME_BANK'
      Size = 1500
    end
    object dsDataDOC_DATE_UFK: TDateTimeField
      FieldName = 'DOC_DATE_UFK'
    end
    object dsDataDOC_NUMBER_UFK: TStringField
      FieldName = 'DOC_NUMBER_UFK'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '   :ID ::= p_po_payback.add(  pdocno                => :DOC_NO,'
      
        '                              pdocdate              => :DOC_DATE' +
        ','
      
        '                              pdescript             => :DESCRIPT' +
        ','
      
        '                              ppay_type_id          => :PAY_TYPE' +
        '_ID,'
      '                              pnote                 => :NOTE,'
      '                              pnls                  => null,'
      '                              pkbkid                => null,'
      
        '                              ppayer_id             => :PAYER_ID' +
        ','
      
        '                              pname_p               => :PAYER_NA' +
        'ME,'
      
        '                              pinn_p                => :PAYER_IN' +
        'N,'
      
        '                              pkpp_p                => :PAYER_KP' +
        'P,'
      '                              pbik_p                => null,'
      '                              paccount_p            => null,'
      
        '                              precipient_id         => :RECIPIEN' +
        'T_ID,'
      
        '                              pname_k               => :RECIPIEN' +
        'T_NAME,'
      
        '                              pinn_k                => :RECIPIEN' +
        'T_INN,'
      
        '                              pkpp_k                => :RECIPIEN' +
        'T_KPP,'
      '                              pbic_k                => null,'
      '                              paccount_k            => null,'
      
        '                              pexec_date            => :EXEC_DAT' +
        'E,'
      '                              psumma                => :SUMMA,'
      
        '                              pcurrency_id          => :CURRENCY' +
        '_ID,'
      
        '                              pdoc_summa            => :DOC_SUMM' +
        'A,'
      '                              pdoc_no2              => :DOC_NO2,'
      
        '                              pdoc_date2            => :DOC_DATE' +
        '2,'
      '                              pnref                 => null,'
      '                              pextsource            => null,'
      '                              pexttypesysname       => null,'
      '                              pextid                => null,'
      '                              pdecpay_id            => null,'
      
        '                              pSeqPayment           => :SEQ_PAYM' +
        'ENT,'
      
        '                              pKindPayment          => :KIND_PAY' +
        'MENT);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftFloat
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Note'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EXEC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'DOC_SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO2'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE2'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'Seq_Payment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Kind_Payment'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_payment_order_payback_upd(pid           => :ID,'
      '                                pdocno        => :DOC_NO,'
      '                                pdocdate      => :DOC_DATE,'
      '                                pdescript     => :DESCRIPT,'
      '                                ppay_type_id  => :PAY_TYPE_ID,'
      '                                pnote         => :NOTE,'
      '                                pnls          => :NLS,'
      '                                pkbkid        => :KBKCODE_ID,'
      '                                pkbk          => :KBK,'
      '                                ppayer_id     => :PAYER_ID,'
      '                                pname_p       => :PAYER_NAME,'
      '                                pinn_p        => :PAYER_INN,'
      '                                pkpp_p        => :PAYER_KPP,'
      '                                pbik_p        => :BIK_P,'
      '                                paccount_p    => :ACCOUNT_P,'
      '                                precipient_id => :RECIPIENT_ID,'
      
        '                                pname_k       => :RECIPIENT_NAME' +
        ','
      '                                pinn_k        => :RECIPIENT_INN,'
      '                                pkpp_k        => :RECIPIENT_KPP,'
      '                                pbic_k        => :BIC_K,'
      '                                paccount_k    => :ACCOUNT_K,'
      '                                pexec_date    => :EXEC_DATE,'
      '                                psumma        => :SUMMA,'
      '                                pcurrency_id  => :CURRENCY_ID,'
      '                                pdoc_summa    => :DOC_SUMMA,'
      '                                pdoc_no2      => :DOC_NO2,'
      '                                pdoc_date2    => :DOC_DATE2,'
      '                                pdecpay_id    => :DEC_PAY_ID,'
      '                                pSeqPayment   => :SEQ_PAYMENT,'
      '                                pKindPayment  => :KIND_PAYMENT);'
      ''
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftFloat
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Note'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NLS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KBKCODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KBK'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYER_KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIK_P'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACCOUNT_P'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RECIPIENT_KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIC_K'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACCOUNT_K'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EXEC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
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
        DataType = ftFloat
        Name = 'DOC_SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NO2'
        ParamType = ptUnknown
        Size = 11
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE2'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'DEC_PAY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Seq_Payment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Kind_Payment'
        ParamType = ptUnknown
      end>
  end
  inherited QueryList1: TQueryList
    object sqlGetSysName: TsqlOp
      SQL.Strings = (
        'begin'
        ' begin'
        '  '
        '  select o.TYPESYSNAME'
        '  into :sysname '
        '  from fdc_object_lst o '
        
          '  where id = (select b.dec_pay_id  from fdc_payment_order_paybac' +
          'k_lst b where b.id = :id);'
        '  exception'
        ' when others then'
        '   :sysname:='#39#39';'
        ' end; '
        'end;')
    end
  end
  object dsDecision: TDataSource
    DataSet = sqlDecision
    Left = 411
    Top = 354
  end
  object sqlDecision: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select dp.bank_id'
      '      ,dp.bic                                  AS decision_bic'
      
        '      ,dp.bank_name                            AS decision_bank_' +
        'name'
      
        '      ,dp.corr_account                         AS decision_corr_' +
        'account'
      
        '      ,dp.account                              AS decision_accou' +
        'nt'
      
        '      ,dp.personal_account                     AS decision_perso' +
        'nal_account'
      'from   fdc_decision_payback_lst  dp'
      'where '
      '   id = :pId')
    Left = 411
    Top = 306
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pId'
        ParamType = ptUnknown
      end>
    object sqlDecisionBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object sqlDecisionDECISION_BIC: TStringField
      FieldName = 'DECISION_BIC'
      ReadOnly = True
      Required = True
      Size = 10
    end
    object sqlDecisionDECISION_BANK_NAME: TStringField
      FieldName = 'DECISION_BANK_NAME'
      Size = 4000
    end
    object sqlDecisionDECISION_CORR_ACCOUNT: TStringField
      FieldName = 'DECISION_CORR_ACCOUNT'
      ReadOnly = True
      Required = True
    end
    object sqlDecisionDECISION_ACCOUNT: TStringField
      FieldName = 'DECISION_ACCOUNT'
      ReadOnly = True
      Required = True
    end
    object sqlDecisionDECISION_PERSONAL_ACCOUNT: TStringField
      FieldName = 'DECISION_PERSONAL_ACCOUNT'
      ReadOnly = True
      Required = True
    end
  end
end
