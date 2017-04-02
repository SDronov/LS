inherited DecOffsetObligationForm: TDecOffsetObligationForm
  Left = 386
  Top = 199
  Caption = 'DecOffsetObligationForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Top = -211
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Top = 640
          TabOrder = 31
          Height = 223
          Width = 684
        end
        object cmbxCurrency: TfdcObjectLookupEdit [2]
          Left = 60
          Top = 244
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
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 1089
        end
        object edtSumma: TcxDBCurrencyEdit [3]
          Left = 60
          Top = 268
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 1089
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Top = -4
          TabOrder = 11
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Top = -4
          TabOrder = 12
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Top = 20
          TabOrder = 13
        end
        inherited edtAppDate: TcxDBDateEdit
          Top = 88
          TabOrder = 14
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Top = 88
          TabOrder = 15
        end
        inherited edtAppNumber: TcxDBTextEdit
          Top = 112
          TabOrder = 16
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 579
          TabOrder = 29
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 603
          TabOrder = 30
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 531
          TabOrder = 27
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 555
          TabOrder = 28
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Top = 180
          TabOrder = 18
          Width = 813
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Top = -153
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Top = -129
        end
        inherited edtDocCode: TcxDBTextEdit
          Top = -129
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Top = -102
        end
        object cxDBCheckBox1: TcxDBCheckBox [19]
          Left = 21
          Top = -75
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1087#1088#1080#1085#1103#1090#1086' '#1085#1072' '#1087#1086#1089#1090#1091
          DataBinding.DataField = 'IS_EXTERNAL'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 121
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Top = 112
          TabOrder = 17
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Top = 207
          TabOrder = 19
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 323
          TabOrder = 22
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 402
          TabOrder = 24
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 426
          TabOrder = 25
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 450
          TabOrder = 26
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 347
          TabOrder = 23
        end
        inherited edtDocNumber: TcxDBTextEdit
          Top = -129
        end
        inherited edtDocDate: TcxDBDateEdit
          Top = -129
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = -102
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = -102
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = -102
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            object lcGeneralItem1: TdxLayoutItem
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = cxDBCheckBox1
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgApp: TdxLayoutGroup
            Visible = False
          end
          inherited lcgReason: TdxLayoutGroup
            Visible = False
          end
          object lcicmbxCurrency: TdxLayoutItem [5]
            Tag = 33
            Caption = #1042#1072#1083#1102#1090#1072
            Control = cmbxCurrency
            ControlOptions.ShowBorder = False
          end
          object lciedtSumma: TdxLayoutItem [6]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          inherited lcgDepts: TdxLayoutGroup
            Visible = False
          end
        end
      end
    end
    object tabDeclTpoPay: TcxTabSheet [1]
      Caption = #1044#1058'/'#1058#1055#1054
      OnShow = tabDeclTpoPayShow
    end
    inherited tabPaymentOrders: TcxTabSheet
      ImageIndex = -1
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1058#1056
      ImageIndex = -1
    end
  end
  inherited ActionList: TActionList
    inherited actPrint: TAction
      Enabled = False
      Visible = False
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
        FloatLeft = 342
        FloatTop = 339
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
      'select d.*'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_dec_offset_obligation_lst d'
      '  where d.id = :id')
    SourceServerObject = 'FDC_DEC_OFFSET_OBLIGATION_LST'
    inherited dsDataDEBTS_SUMMA: TFloatField
      currency = True
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
      currency = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataIS_EXTERNAL: TStringField
      FieldName = 'IS_EXTERNAL'
      ReadOnly = True
      Size = 1
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :result ::= null;'
      'end;'
      '')
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_dec_offset_obligation.modify'
      '    ('
      '      pid                         => :id'
      '     ,pdecisionnumber   => :doc_number'
      '     ,pdecisiondate        => :doc_date'
      '     ,psignedby              => :signed_by'
      '     ,psignedbychief      => :signed_by_chief'
      '     ,psignedbychiefudf => :signed_by_chief_udf'
      '     ,psigndate              => :sign_date'
      '     ,pdoccode             => :doc_code'
      '     ,pdocosncode        => :doc_osn_code'
      '     ,pdebtssumma        => :debts_summa'
      '     ,psumma                => :summa'
      '     ,pCheckUnpaidDecl   => '#39'Y'#39
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by_chief'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'signed_by_chief_udf'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sign_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_osn_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'debts_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'summa'
        ParamType = ptUnknown
      end>
  end
  object dsPayDetail: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select dtr.decl_id'
      '      ,decl_doc.name decl_doc_name'
      '      ,decl_doc.doc_date decl_date'
      '      ,dtr.pay_type_code'
      '      ,ch.summa payable_summa'
      '      ,dtr.summa pay_summa'
      'from fdc_decision_tmp_reserv_lst dtr'
      '    ,fdc_decl_charge_lst ch'
      '    ,fdc_document_lst decl_doc'
      'where dtr.decision_id = :id'
      '  and dtr.charge_id = ch.id'
      '  and dtr.decl_id = decl_doc.id'
      'union all'
      'select pd.decl_id'
      '      ,decl_doc.name decl_doc_name'
      '      ,decl_doc.doc_date decl_date'
      '      ,pt.code  pay_type_code'
      '      ,ch.summa payable_summa'
      '      ,pd.summa pay_summa'
      'from fdc_dec_offset_obligation_lst deco'
      '    ,fdc_value_lst v'
      '    ,fdc_payment_deduction_lst pd'
      '    ,fdc_decl_charge_lst ch'
      '    ,fdc_payment_type_lst pt'
      '    ,fdc_document_lst decl_doc'
      'where deco.id = :id'
      '  and v.owner_object_id = :id'
      '  and deco.id = v.owner_object_id'
      '  and v.ref_object_id = pd.id'
      '  and pd.charge_id = ch.id'
      '  and pd.pay_type_id = pt.id'
      '  and pd.decl_id = decl_doc.id')
    BeforeOpen = dsPayDetailBeforeOpen
    Left = 147
    Top = 370
    ParamData = <
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
      end>
    object dsPayDetailDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsPayDetailDECL_DOC_NAME: TStringField
      FieldName = 'DECL_DOC_NAME'
      Size = 1500
    end
    object dsPayDetailDECL_DATE: TDateTimeField
      FieldName = 'DECL_DATE'
    end
    object dsPayDetailPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsPayDetailPAYABLE_SUMMA: TFloatField
      FieldName = 'PAYABLE_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsPayDetailPAY_SUMMA: TFloatField
      FieldName = 'PAY_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 336
    Top = 38
    object sqlOpGetPaySumm: TsqlOp
      SQL.Strings = (
        'begin'
        '  select sum(pay_summa) into :result'
        '  from ('
        '        select dtr.summa pay_summa'
        '        from fdc_decision_tmp_reserv_lst dtr'
        '        where dtr.decision_id = :id'
        '        union all'
        '        select pd.summa pay_summa'
        '        from fdc_dec_offset_obligation_lst deco'
        '            ,fdc_value_lst v'
        '            ,fdc_payment_deduction_lst pd'
        '        where deco.id = :id'
        '          and v.owner_object_id = :id'
        '          and deco.id = v.owner_object_id'
        '          and v.ref_object_id = pd.id'
        '       );'
        'end;')
    end
  end
  object dsDetail: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select row_number() over(order by d_tr_name) d_pp'
      '      ,data.*'
      'from ('
      
        '      select (select pt.shortname from fdc_object_type pt where ' +
        'pt.id = po.object_type_id) d_po_type'
      '            ,po.doc_number d_po_doc_number'
      '            ,po.doc_date d_po_doc_date'
      '            ,po.doc_summa d_po_doc_summa'
      '            ,t.name d_tr_name'
      '            ,t.sum_rub d_tr_summ'
      '            ,rs.summa d_pay_summa'
      '      from fdc_dec_offset_obligation_lst deco'
      '          ,fdc_rel_tr_dec_lst rel'
      '          ,fdc_tr_lst t'
      '          ,fdc_payment_deduction_all_lst pd'
      '          ,fdc_reserved_for_reuse_lst rs'
      '          ,fdc_po_credit_lst po'
      '      where deco.id = :id'
      '        and rel.rel_object_id = :id'
      '        and deco.id = rel.rel_object_id'
      '        and rel.object_id = t.id'
      '        and t.id = pd.decl_id'
      '        and pd.charge_id = rs.id'
      '        and rs.doc_id = :id'
      '        and rs.doc_id = deco.id'
      '        and rs.payment_id = po.id'
      '     ) data')
    BeforeOpen = dsPayDetailBeforeOpen
    Left = 99
    Top = 330
    ParamData = <
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
      end>
    object dsDetailD_PP: TFloatField
      FieldName = 'D_PP'
    end
    object dsDetailD_PO_TYPE: TStringField
      FieldName = 'D_PO_TYPE'
      Size = 0
    end
    object dsDetailD_PO_DOC_NUMBER: TStringField
      FieldName = 'D_PO_DOC_NUMBER'
      Size = 100
    end
    object dsDetailD_PO_DOC_DATE: TDateTimeField
      FieldName = 'D_PO_DOC_DATE'
    end
    object dsDetailD_PO_DOC_SUMMA: TFloatField
      FieldName = 'D_PO_DOC_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsDetailD_TR_NAME: TStringField
      FieldName = 'D_TR_NAME'
      Size = 1500
    end
    object dsDetailD_TR_SUMM: TFloatField
      FieldName = 'D_TR_SUMM'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsDetailD_PAY_SUMMA: TFloatField
      FieldName = 'D_PAY_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
end
