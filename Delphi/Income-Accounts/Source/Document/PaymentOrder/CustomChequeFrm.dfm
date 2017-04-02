inherited CustomChequeForm: TCustomChequeForm
  Left = 258
  Top = 59
  Width = 1383
  Height = 855
  Caption = 'CustomChequeForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1375
    Height = 828
    ActivePage = tabGeneral
    ClientRectBottom = 804
    ClientRectRight = 1375
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1369
        Height = 775
        inherited edtName: TcxDBTextEdit
          TabOrder = 35
        end
        inherited edtDescript: TcxDBMemo
          Left = 191
          Top = 656
          TabOrder = 32
          Height = 34
          Width = 272
        end
        object edtPaySysName: TcxDBMaskEdit [2]
          Left = 191
          Top = 92
          DataBinding.DataField = 'PAYSYSNAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 121
        end
        object edtCardNum: TcxDBMaskEdit [3]
          Left = 191
          Top = 119
          DataBinding.DataField = 'CARDNUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 8
          Width = 121
        end
        inherited edtDocNo: TcxDBMaskEdit
          Left = 191
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 344
          Width = 106
        end
        inherited edtPayerINN: TcxDBMaskEdit
          Top = 177
          TabOrder = 9
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Top = 202
          TabOrder = 11
          Width = 670
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Left = 191
          Top = 415
          TabOrder = 21
          Width = 107
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 995
          Top = 490
          TabOrder = 26
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 964
          Top = 415
          TabOrder = 22
          Width = 91
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Left = 191
          Top = 440
          TabOrder = 23
          Width = 258
        end
        inherited cmbxedtCurrID: TfdcObjectLookupEdit
          Left = 191
          Top = 388
          TabOrder = 18
        end
        inherited edtBankDocNo: TcxDBMaskEdit
          Left = 191
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Left = 344
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 177
          TabOrder = 10
          Width = 381
        end
        inherited btnSaveNew: TcxButton
          Left = 1198
          Top = 745
          TabOrder = 34
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Left = 191
          Top = 465
          TabOrder = 24
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 933
          Top = 465
          TabOrder = 25
          Width = 101
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 745
          TabOrder = 33
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Left = 1279
          Top = 388
          TabOrder = 20
        end
        inherited edtDescript2: TcxDBMemo
          Left = 191
          Top = 577
          TabOrder = 31
          Height = 30
          Width = 258
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 1266
          Top = 490
          TabOrder = 27
        end
        inherited edtNote: TcxDBMemo
          Left = 191
          Top = 524
          DataBinding.DataField = 'TK_ID'
          TabOrder = 29
          Width = 575
        end
        inherited gbxPaymentFor: TcxGroupBox
          Top = 515
          TabOrder = 28
          Height = 3
          Width = 827
          inherited dxLayoutControl1: TdxLayoutControl
            Width = 823
            inherited edtPFSumma: TcxDBTextEdit
              Width = 187
            end
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 505
              Width = 206
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 976
              Width = 193
            end
            inherited edtSubjectName: TfdcObjectLinkEdit
              Width = 751
            end
            inherited edtSubjectINN: TcxDBTextEdit
              Width = 397
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 784
              Width = 327
            end
          end
        end
        inherited edtRecipientINN: TcxDBMaskEdit
          Top = 271
          TabOrder = 12
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Top = 271
          TabOrder = 13
          Width = 381
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Top = 296
          TabOrder = 14
          Width = 670
        end
        inherited edtKBK: TcxDBTextEdit
          Left = 298
          Top = 388
          TabOrder = 19
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Top = 321
          TabOrder = 15
        end
        object showDT_NUMBER: TcxDBTextEdit [32]
          Left = 191
          Top = 361
          TabStop = False
          DataBinding.DataField = 'DT_NUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = False
          TabOrder = 17
          Width = 121
        end
        inherited edtCustomsName: TcxDBTextEdit
          Top = 321
          TabOrder = 16
          Width = 422
        end
        inherited edtUIN: TcxDBTextEdit
          Left = 191
          Top = 550
          TabOrder = 30
          Width = 849
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem3: TdxLayoutItem [2]
            Tag = 33
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099' '
            Control = edtPaySysName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem [3]
            Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1099
            Control = edtCardNum
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem5: TdxLayoutItem [6]
            Caption = #1053#1086#1084#1077#1088' '#1044#1058
            CaptionOptions.AlignHorz = taRightJustify
            Control = showDT_NUMBER
            ControlOptions.MinHeight = 19
            ControlOptions.ShowBorder = False
          end
          inherited lcGeneralGroup9: TdxLayoutGroup
            inherited lciExecDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1375
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 775
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 801
        Width = 1375
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1372
        Height = 775
      end
    end
    inherited tabConfirmation: TcxTabSheet
      inherited lcConfirm: TdxLayoutControl
        Width = 1375
        Height = 804
        inherited edtCnfrmDocNumber: TcxDBTextEdit
          Width = 552
        end
        inherited edtCnfrmDocDate: TcxDBDateEdit
          Left = 1181
        end
        inherited edtCnfrmPayerINN: TcxDBTextEdit
          Width = 543
        end
        inherited edtCnfrmPayerKPP: TcxDBTextEdit
          Left = 1167
        end
        inherited edtCnfrmPayerName: TcxDBTextEdit
          Width = 759
        end
        inherited edtCnfrmCurrencyName: TcxDBTextEdit
          Width = 695
        end
        inherited edtCnfrmDocSumma: TcxDBCurrencyEdit
          Width = 759
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1375
        Height = 804
        ClientRectBottom = 780
        ClientRectRight = 1375
      end
    end
    inherited tabBankInfo: TcxTabSheet
      inherited lcBankInfo: TdxLayoutControl
        Width = 1375
        Height = 804
        inherited edtBankInfoPayerName: TcxDBTextEdit
          Width = 723
        end
        inherited edtBankInfoPayerAccount: TcxDBTextEdit
          Width = 537
        end
        inherited edtBankInfoRecepientName: TcxDBTextEdit
          Width = 723
        end
        inherited edtBankInfoRecepientAccount: TcxDBTextEdit
          Width = 537
        end
        inherited edtBankInfoPaymentInfo: TcxDBMemo
          Width = 849
        end
        inherited edtDestOld: TcxDBTextEdit
          Width = 121
        end
        inherited edtKBKOld: TcxDBTextEdit
          Width = 350
        end
        inherited edtUIN2: TcxDBTextEdit
          Width = 1442
        end
      end
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
        FloatLeft = 650
        FloatTop = 199
        FloatClientWidth = 103
        FloatClientHeight = 119
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
            Item = btnCancelReserve3Year
            Visible = True
          end
          item
            Item = btnCorrect
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select'
      
        ' t.*, decode(sign(t.rest_summa - t.locked_summa),1,t.rest_summa ' +
        '- t.locked_summa,0) as rest_summa2,'
      ' c.PaySysName,  c.cardnum, c.TK_ID'
      ' ,nn.id payment_order_non_id'
      
        ' ,t.destcustomscode||'#39'/'#39'|| to_char(t.val_doc_date, '#39'ddmmyy'#39') ||'#39 +
        '/'#39'|| t.val_doc_number DT_NUM'
      ''
      'from fdc_Payment_Order_Agg_Lst t, fdc_payment_order_cheque c'
      '      ,fdc_payment_order_non_id_lst nn'
      ' where t.ID = :ID'
      '  AND c.id = t.ID'
      
        '  AND (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      'ORDER BY t.is_payment_for DESC')
    object dsDataPAYSYSNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1099
      FieldName = 'PAYSYSNAME'
      Size = 70
    end
    object dsDataCARDNUM: TStringField
      DisplayLabel = #8470' '#1082#1072#1088#1090#1099
      FieldName = 'CARDNUM'
      Size = 19
    end
    object dsDataTK_ID: TStringField
      FieldName = 'TK_ID'
      OnGetText = dsDataTK_IDGetText
      Size = 24
    end
    object dsDataDT_NUM: TStringField
      DisplayWidth = 30
      FieldName = 'DT_NUM'
      ReadOnly = True
      Size = 30
    end
  end
end
