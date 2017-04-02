inherited PaymentOrderRestCustomsForm: TPaymentOrderRestCustomsForm
  Left = 306
  Top = 100
  Caption = 'PaymentOrderRestCustomsForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          TabOrder = 32
        end
        inherited edtDescript: TcxDBMemo
          Left = 197
          Top = 625
          TabOrder = 29
        end
        inherited edtDocNo: TcxDBMaskEdit
          Left = 197
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 350
        end
        inherited edtPayerINN: TcxDBMaskEdit
          Top = 148
          TabOrder = 8
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Top = 173
          TabOrder = 10
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Left = 197
          Top = 359
          TabOrder = 19
        end
        inherited edtExecDate: TcxDBDateEdit
          Left = 385
          Top = 434
          TabOrder = 24
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 562
          Top = 359
          TabOrder = 20
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Left = 197
          Top = 384
          TabOrder = 21
        end
        inherited cmbxedtCurrID: TfdcObjectLookupEdit
          Left = 197
          Top = 332
          TabOrder = 16
        end
        inherited edtBankDocNo: TcxDBMaskEdit
          Left = 197
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Left = 350
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 148
          TabOrder = 9
        end
        inherited btnSaveNew: TcxButton
          Left = 588
          Top = 651
          TabOrder = 31
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Left = 197
          Top = 409
          TabOrder = 22
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Left = 544
          Top = 409
          TabOrder = 23
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 651
          TabOrder = 30
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Left = 669
          Top = 332
          TabOrder = 18
        end
        inherited edtDescript2: TcxDBMemo
          Left = 197
          Top = 592
          TabOrder = 28
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Left = 656
          Top = 434
          TabOrder = 25
        end
        inherited edtNote: TcxDBMemo
          Left = 197
          Top = 566
          TabOrder = 27
        end
        inherited gbxPaymentFor: TcxGroupBox
          Top = 459
          TabOrder = 26
          inherited dxLayoutControl1: TdxLayoutControl
            inherited edtPFRestSumma: TcxDBTextEdit
              Left = 319
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Left = 564
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Left = 439
            end
          end
        end
        inherited edtRecipientINN: TcxDBMaskEdit
          Top = 242
          TabOrder = 11
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Top = 242
          TabOrder = 12
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Top = 267
          TabOrder = 13
        end
        object edtLastUse: TcxDBDateEdit [26]
          Left = 197
          Top = 92
          DataBinding.DataField = 'LAST_USE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 473
        end
        inherited edtKBK: TcxDBTextEdit
          Left = 304
          Top = 332
          TabOrder = 17
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Top = 292
          TabOrder = 14
        end
        inherited edtCustomsName: TcxDBTextEdit
          Top = 292
          TabOrder = 15
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciedtLastUse: TdxLayoutItem [2]
            Tag = 21
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1076'/'#1089
            Control = edtLastUse
            ControlOptions.ShowBorder = False
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
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 104
        FloatClientHeight = 141
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
      'select t.*'
      
        '      ,decode(sign(t.rest_summa - t.locked_summa),1,t.rest_summa' +
        ' - t.locked_summa,0) as rest_summa2'
      '      ,nn.id payment_order_non_id'
      '      ,erp.last_use'
      
        '      ,(case when (erp.new_id is null) then 0 else 1 end) last_u' +
        'se_present'
      '  from fdc_Payment_Order_Agg_Lst t'
      '      ,fdc_payment_order_non_id_lst nn'
      '      ,exp_rest_pays erp'
      ' where t.ID = :ID'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      '  and t.id = erp.new_id(+) '
      'order by t.is_payment_for desc')
    object dsDataLAST_USE: TDateTimeField
      FieldName = 'LAST_USE'
    end
    object dsDataLAST_USE_PRESENT: TFloatField
      FieldName = 'LAST_USE_PRESENT'
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_payment_order_upd('
      '        pid => :id,'
      '        pdocno => :doc_no,'
      '        pdescript => :descript,'
      '        pdocdate => :doc_date,'
      '        pdocno2 => :doc_no2,'
      '        pdocdate2 => :doc_date2,'
      '        pexecdate => :exec_date,'
      '        ppayerid => :payer_id,'
      '        psumma => :summa,'
      '        pdocsumma => :doc_summa,'
      '        pcurrencyid => :currency_id,'
      '        pPayTypeId => :pay_type_id,'
      '        pNote => :Note);'
      '  if (:last_use_present = 1) then'
      '    update exp_rest_pays set last_use = :last_use'
      '    where new_id = :id;'
      '  end if;'
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
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
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
        DataType = ftDateTime
        Name = 'EXEC_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
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
        Name = 'DOC_SUMMA'
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
        Name = 'last_use_present'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'last_use'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
