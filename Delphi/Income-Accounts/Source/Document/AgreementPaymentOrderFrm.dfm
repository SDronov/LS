inherited AgreementPaymentOrderForm: TAgreementPaymentOrderForm
  Caption = #1057#1086#1074#1086#1082#1091#1087#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          TabOrder = 32
        end
        inherited edtDescript: TcxDBMemo
          Top = 594
          TabOrder = 29
          Height = 36
          Width = 272
        end
        object cmbxAgreementID: TfdcObjectLookupEdit [2]
          Left = 140
          Top = 382
          DataBinding.DataField = 'agreement_id'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DictData.srcAgreements
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 23
          Width = 111
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtPayerINN: TcxDBMaskEdit
          Top = 117
          Width = 119
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Top = 139
          Width = 258
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Top = 316
          Width = 107
        end
        inherited edtExecDate: TcxDBDateEdit
          Top = 404
          TabOrder = 24
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 537
          Top = 316
          Width = 90
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Top = 338
          Width = 258
        end
        inherited cmbxedtCurrID: TfdcObjectLookupEdit
          Top = 289
        end
        inherited edtBankDocNo: TcxDBMaskEdit
          Top = 37
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Top = 37
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Left = 302
          Top = 117
          Width = 109
        end
        inherited btnSaveNew: TcxButton
          TabOrder = 31
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Top = 360
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Top = 360
          Width = 101
        end
        inherited chbxAsOld: TcxCheckBox
          TabOrder = 30
        end
        inherited cmbxPayCode: TfdcObjectLookupEdit
          Top = 289
        end
        inherited edtDescript2: TcxDBMemo
          Top = 559
          TabOrder = 28
          Height = 29
          Width = 258
        end
        inherited edtIncomeDate: TcxDBDateEdit
          Top = 404
          TabOrder = 25
        end
        inherited edtNote: TcxDBMemo
          Top = 533
          TabOrder = 27
          Width = 575
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
          Top = 289
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
          object lciAgreementID: TdxLayoutItem [7]
            Tag = 11
            Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxAgreementID
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
        FloatClientWidth = 127
        FloatClientHeight = 86
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
      
        'select t.*, decode(sign(t.rest_summa - t.locked_summa),1,t.rest_' +
        'summa - t.locked_summa,0) as rest_summa2, ag.AGREEMENT_ID'
      '      ,nn.id payment_order_non_id'
      '  from fdc_Payment_Order_Agg_Lst t, fdc_po_agreement_lst ag'
      '      ,fdc_payment_order_non_id_lst nn'
      ' where t.ID = :ID'
      '  AND ag.ID = t.id'
      
        '  and (((:pf_Subject_id = 0 or :pf_subject_id is null) and t.pf_' +
        'subject_id is null) or t.pf_subject_id = :pf_Subject_Id)'
      '  and t.id = nn.payment_order_id(+)'
      'order by t.is_payment_for DESC')
    object dsDataAGREEMENT_ID: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      FieldName = 'AGREEMENT_ID'
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::=  fdc_Payment_Order_Add('
      '                pObject_Type_SysName => :TypeSysName,'
      '                 pdocno => :doc_no,'
      '                      pdescript => :descript,'
      '                      pdocdate => :doc_date,'
      '                     pdocno2 => :doc_no2,'
      '                      pdocdate2 => :doc_date2,'
      '                      pexecdate => :exec_date,'
      '                      ppayerid => :payer_id,'
      '                      psumma => :summa,'
      '                     pdocsumma => :doc_summa,'
      '                      pcurrencyid => :currency_id,'
      '               pPayTypeId => :pay_type_id,'
      '           PAGREEMENTID => :AGREEMENT_ID'
      '        ,pNote => :Note);'
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
        Name = 'summa'
        ParamType = ptUnknown
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
        DataType = ftFloat
        Name = 'AGREEMENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Note'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_payment_order_upd(pid => :id,'
      '                      pdocno => :doc_no,'
      '                      pdescript => :descript,'
      '                      pdocdate => :doc_date,'
      '                      pdocno2 => :doc_no2,'
      '                      pdocdate2 => :doc_date2,'
      '                      pexecdate => :exec_date,'
      '                      ppayerid => :payer_id,'
      '                      psumma => :summa,'
      '                     pdocsumma => :doc_summa,'
      '                      pcurrencyid => :currency_id,'
      '               pPayTypeId => :pay_type_id,'
      '           PAGREEMENTID => :AGREEMENT_ID'
      '        ,pNote => :Note);'
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
        DataType = ftFloat
        Name = 'AGREEMENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Note'
        ParamType = ptUnknown
      end>
  end
end
