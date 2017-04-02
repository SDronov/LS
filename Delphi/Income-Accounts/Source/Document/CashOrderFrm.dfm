inherited CashOrderForm: TCashOrderForm
  Left = 372
  Caption = #1053#1086#1074#1099#1081' '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1088#1076#1077#1088
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          TabOrder = 32
        end
        inherited edtDescript: TcxDBMemo
          Top = 592
          TabOrder = 29
          Height = 39
          Width = 272
        end
        object edtCashDesk: TfdcObjectLinkEdit [2]
          Left = 140
          Top = 404
          DataBinding.DataField = 'CASHDESK_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CASHDESK_ID'
          DataBinding.TypeSysName = 'CashDesk'
          DataBinding.SearchFormClass = 'TCashDeskGridForm'
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
          TabOrder = 25
          Width = 258
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtPayerINN: TcxDBMaskEdit
          Top = 117
          Width = 121
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Top = 139
          Width = 258
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Top = 316
          Width = 258
        end
        inherited edtExecDate: TcxDBDateEdit
          Top = 382
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 486
          Top = 316
          Width = 258
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Top = 338
          Width = 258
        end
        inherited cmbxedtCurrID: TfdcObjectLookupEdit
          Top = 289
          Width = 55
        end
        inherited edtBankDocNo: TcxDBMaskEdit
          Top = 37
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Top = 37
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Left = 373
          Top = 117
          Width = 110
        end
        inherited btnSaveNew: TcxButton
          TabOrder = 31
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Top = 360
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 402
          Top = 360
          Width = 231
        end
        inherited chbxAsOld: TcxCheckBox
          TabOrder = 30
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Top = 289
          TabOrder = 16
        end
        inherited edtDescript2: TcxDBMemo
          Top = 559
          TabOrder = 28
          Height = 27
          Width = 258
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Top = 382
        end
        inherited edtNote: TcxDBMemo
          Top = 533
          TabOrder = 27
          Width = 142
        end
        inherited gbxPaymentFor: TcxGroupBox
          Top = 426
          TabOrder = 26
          Width = 548
          inherited dxLayoutControl1: TdxLayoutControl
            Top = 11
            Width = 544
            Height = 88
            inherited edtPFSumma: TcxDBTextEdit
              Left = 47
              Top = 44
              Width = 93
            end
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 298
              Top = 44
              Width = 92
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 553
              Top = 44
              Width = 93
            end
            inherited edtSubjectName: TfdcObjectLinkEdit
              Left = 47
              Top = 25
              Width = 93
            end
            inherited edtSubjectINN: TcxDBTextEdit
              Left = 47
              Top = 6
              Width = 93
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 432
              Top = 6
              Width = 93
            end
          end
        end
        inherited edtRecipientINN: TcxDBMaskEdit
          Top = 205
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Top = 205
          Width = 71
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Top = 227
          Width = 623
        end
        inherited edtKBK: TcxDBTextEdit
          Left = 248
          Top = 289
          TabOrder = 17
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Top = 249
        end
        inherited chBIS_ACTIVE: TcxDBCheckBox
          Top = 59
        end
        inherited edtACTIVATION_DATE: TcxDBDateEdit
          Top = 59
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = 59
        end
        inherited edtCustomsName: TcxDBTextEdit
          Top = 249
          Width = 570
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup11: TdxLayoutGroup
            inherited lcgCustoms: TdxLayoutGroup
              inherited lciDestCustomsCode: TdxLayoutItem
                Tag = 22
                Visible = False
              end
              inherited lciCustomsName: TdxLayoutItem
                Tag = 22
                Visible = False
              end
            end
          end
          inherited lcGeneralGroup3: TdxLayoutGroup
            inherited lcGeneralGroup6: TdxLayoutGroup
              inherited lciPayTypeCode: TdxLayoutItem [1]
                Tag = 13
              end
              inherited lciKBK: TdxLayoutItem [2]
                Tag = 33
              end
            end
          end
          object lcGeneralItem13: TdxLayoutItem [8]
            Caption = #1050#1072#1089#1089#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCashDesk
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
    end
    inherited tabConfirmation: TcxTabSheet
      inherited lcConfirm: TdxLayoutControl
        inherited edtCnfrmDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmPayerINN: TcxDBTextEdit
          Width = 275
        end
        inherited edtCnfrmPayerName: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmCurrencyName: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmDocSumma: TcxDBCurrencyEdit
          Width = 121
        end
      end
    end
    inherited tabBankInfo: TcxTabSheet
      inherited lcBankInfo: TdxLayoutControl
        inherited edtBankInfoPayerName: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoPayerAccount: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoRecepientName: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoRecepientAccount: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoPaymentInfo: TcxDBMemo
          Width = 185
        end
        inherited edtDestOld: TcxDBTextEdit
          Width = 121
        end
        inherited edtKBKOld: TcxDBTextEdit
          Width = 350
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actAggrPayment: TAction
      Category = 'Object'
      Caption = #1057#1091#1084#1084#1072#1088#1085#1099#1081' '#1087#1083#1072#1090#1105#1078':'
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1084#1091' '#1087#1083#1072#1090#1077#1078#1091
      OnExecute = actAggrPaymentExecute
      OnUpdate = actAggrPaymentUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -7
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
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = barBtnAggrPayment
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
    object barBtnAggrPayment: TdxBarButton
      Action = actAggrPayment
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select t.*, decode(sign(t.rest_summa - t.locked_summa),1,t.rest_' +
        'summa - t.locked_summa,0) as rest_summa2, co.CASHDESK_ID'
      
        '  , (SELECT cl.NAME FROM fdc_cashdesk_lst cl WHERE cl.id = co.CA' +
        'SHDESK_ID) AS CASHDESK_NAME     '
      '      ,nn.id payment_order_non_id'
      '  from fdc_Payment_Order_Agg_Lst t, fdc_po_cashorder_lst co'
      '      ,fdc_payment_order_non_id_lst nn'
      ' where t.ID = :ID'
      '  AND t.id = co.ID'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      'order by t.is_payment_for desc')
    AfterInsert = dsDataAfterInsert
    object dsDataCASHDESK_ID: TFloatField
      FieldName = 'CASHDESK_ID'
      OnChange = dsDataCASHDESK_IDChange
    end
    object dsDataCASHDESK_NAME: TStringField
      DisplayLabel = #1050#1072#1089#1089#1072
      FieldName = 'CASHDESK_NAME'
      Required = True
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'BEGIN'
      
        '  :ID ::= fdc_PO_CashOrder_Add(pObject_Type_SysName => :TypeSysN' +
        'ame'
      '                              ,pDocNo               => :doc_no'
      '                              ,pDocDate             => :doc_date'
      '                              ,pDescript            => :descript'
      
        '                              ,pPAY_TYPE_ID         => :pay_type' +
        '_id'
      '                              ,pKBK                 => :kbk'
      '                              ,pNOTE                => :Note'
      '                              ,pPAYER_ID            => :payer_id'
      
        '                              ,pNAME_P              => :payer_na' +
        'me'
      
        '                              ,pINN_P               => :payer_in' +
        'n'
      
        '                              ,pKPP_P               => :payer_kp' +
        'p'
      
        '                              ,pRECIPIENT_ID        => :RECIPIEN' +
        'T_ID'
      
        '                              ,pNAME_K              => :RECIPIEN' +
        'T_NAME'
      
        '                              ,pINN_K               => :RECIPIEN' +
        'T_INN'
      
        '                              ,pKPP_K               => :RECIPIEN' +
        'T_KPP'
      
        '                              ,pEXEC_DATE           => :exec_dat' +
        'e'
      
        '                              ,pCURRENCY_ID         => :currency' +
        '_id'
      
        '                              ,pDOC_SUMMA           => :doc_summ' +
        'a'
      '                              ,pDOC_NO2             => :doc_no2'
      
        '                              ,pDOC_DATE2           => :doc_date' +
        '2'
      
        '                              ,pCASHDESK_ID         => :CASHDESK' +
        '_ID'
      '                              ,pIsTS                => :IS_TS);'
      'END;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
        Size = 1501
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
        DataType = ftString
        Name = 'kbk'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
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
        DataType = ftString
        Name = 'payer_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'payer_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'payer_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'RECIPIENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECIPIENT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECIPIENT_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
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
        DataType = ftFloat
        Name = 'cashdesk_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IS_TS'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'BEGIN'
      '  fdc_PO_CashOrder_Upd(pID           => :ID'
      '                      ,pDocNo        => :doc_no'
      '                      ,pDocDate      => :doc_date'
      '                      ,pDescript     => :descript'
      '                      ,pNOTE         => :Note'
      '                      ,pPAYER_ID     => :payer_id'
      '                      ,pNAME_P       => :payer_name'
      '                      ,pINN_P        => :payer_inn'
      '                      ,pKPP_P        => :payer_kpp'
      '                      ,pRECIPIENT_ID => :RECIPIENT_ID'
      '                      ,pNAME_K       => :RECIPIENT_NAME'
      '                      ,pINN_K        => :RECIPIENT_INN'
      '                      ,pKPP_K        => :RECIPIENT_KPP'
      '                      ,pEXEC_DATE    => :exec_date'
      '                      ,pSUMMA        => :summa'
      '                      ,pCURRENCY_ID  => :currency_id'
      '                      ,pDOC_SUMMA    => :doc_summa'
      '                      ,pDOC_NO2      => :doc_no2'
      '                      ,pDOC_DATE2    => :doc_date2'
      '                      ,pCASHDESK_ID  => :cashdesk_id);'
      'END;')
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
        DataType = ftString
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
        DataType = ftString
        Name = 'payer_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'payer_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'payer_kpp'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'RECIPIENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECIPIENT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECIPIENT_INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
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
        DataType = ftFloat
        Name = 'cashdesk_id'
        ParamType = ptUnknown
      end>
  end
  inherited QueryList1: TQueryList
    object sqlGetBank: TsqlOp
      SQL.Strings = (
        'begin'
        'select l.inn,l.kpp,l.bank_name, l.Payment_To_Order_Ratio'
        '  into :pBankInn,:pBankKpp,:pBankName,:pRatio'
        '  from fdc_BankforCash_Lst l'
        
          ' where l.ID = (select k.OWNER_OBJECT_ID  from fdc_cashdesk_lst k' +
          ' where k.id = :pId);'
        'exception'
        '  when others then'
        '   :pBankInn:=null;'
        '   :pBankKpp:=null;'
        '   :pBankName:=null;'
        '   :pRatio:=null;'
        'end;')
    end
    object sqlActivate: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_document.DoActivate( :id );'
        'end;')
      DataSet = dsData
    end
  end
  object dsetInAggrOrder: TOracleDataSet
    SQL.Strings = (
      'SELECT *'
      '  FROM fdc_object_relation_lst r'
      '  WHERE r.Rel_Object_ID = :ID'
      '    AND r.TYPESYSNAME   = '#39'PaymentOrderRelation'#39)
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 379
    Top = 290
  end
end
