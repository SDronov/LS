inherited AggrPaymentForm: TAggrPaymentForm
  Left = 408
  Top = 18
  Caption = 'AggrPaymentForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtDescript: TcxDBMemo
          Top = 640
          Height = 39
          Width = 272
        end
        inherited edtCashDesk: TfdcObjectLinkEdit
          Width = 258
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          DataBinding.TypeSysName = 'Bank;Customs'
          Width = 258
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Width = 258
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 376
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 685
          Width = 15
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Width = 258
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Width = 109
        end
        inherited btnSaveNew: TcxButton
          Left = 579
          Top = 666
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 500
          Width = 101
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 666
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Left = 660
        end
        inherited edtDescript2: TcxDBMemo
          Top = 607
          Height = 30
          Width = 258
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 647
        end
        inherited edtNote: TcxDBMemo
          Height = 68
          Width = 141
        end
        inherited gbxPaymentFor: TcxGroupBox
          Width = 548
          inherited dxLayoutControl1: TdxLayoutControl
            Width = 544
            inherited edtPFSumma: TcxDBTextEdit
              Width = 93
            end
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 208
              Width = 228
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 496
              Width = 222
            end
            inherited edtSubjectName: TfdcObjectLinkEdit
              Width = 93
            end
            inherited edtSubjectINN: TcxDBTextEdit
              Width = 93
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 200
              Width = 552
            end
          end
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Width = 71
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Width = 623
        end
        inherited edtCustomsName: TcxDBTextEdit
          Width = 570
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup3: TdxLayoutGroup
            inherited lcGeneralGroup6: TdxLayoutGroup
              inherited lciKBK: TdxLayoutItem
                Tag = 13
              end
            end
          end
        end
      end
    end
    inherited tabDeduction: TcxTabSheet
      TabVisible = False
    end
    object cxTabSheet1: TcxTabSheet [2]
      Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1080
      ImageIndex = 3
      OnShow = cxTabSheet1Show
    end
    inherited tabLock: TcxTabSheet
      TabVisible = False
    end
    inherited tabPayFor: TcxTabSheet
      TabVisible = False
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
    inherited tabDocPack: TcxTabSheet
      TabVisible = False
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
        FloatLeft = 311
        FloatTop = 280
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
        DataType = ftUnknown
        Name = 'AGGRPAY_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end
      item
        DataType = ftUnknown
        Name = 'BANK_ID'
        ParamType = ptUnknown
        SourceField = dsDataPAYER_ID
      end
      item
        DataType = ftFloat
        Name = 'pDocId'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select t.*, decode(sign(t.rest_summa - t.locked_summa),1,t.rest_' +
        'summa - t.locked_summa,0) as rest_summa2, co.CASHDESK_ID'
      
        '  , (SELECT cl.NAME FROM fdc_cashdesk_lst cl WHERE cl.id = co.CA' +
        'SHDESK_ID) AS CASHDESK_NAME     '
      '      ,nn.id payment_order_non_id'
      '  from fdc_Payment_Order_Agg_Lst t, fdc_po_aggr_lst co'
      '      ,fdc_payment_order_non_id_lst nn'
      ' where t.ID = :ID'
      '  AND t.id = co.ID'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      'order by t.is_payment_for desc')
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'BEGIN'
      '  :ID ::= fdc_PO_AggrOrder_Add(pDocNo               => :doc_no'
      '                              ,pDocDate             => :doc_date'
      '                              ,pDescript            => :descript'
      
        '                              ,pPAY_TYPE_ID         => :pay_type' +
        '_id'
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
        Name = 'payer_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'payer_inn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'payer_kpp'
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
        Name = 'CashDesk_id'
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
      '                      ,pPAY_TYPE_ID  => :pay_type_id'
      '                      ,pKBK          => :kbk'
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
        Name = 'CashDesk_id'
        ParamType = ptUnknown
      end>
  end
end
