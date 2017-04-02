inherited DecPaybackPayForm: TDecPaybackPayForm
  Left = 234
  Top = 69
  Width = 1292
  Height = 879
  Caption = 'DecPaybackPayForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1276
    Height = 841
    ClientRectBottom = 817
    ClientRectRight = 1276
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1270
        Height = 786
        inherited edtName: TcxDBTextEdit
          Width = 814
        end
        inherited edtDescript: TcxDBMemo
          Height = 223
          Width = 1260
        end
        inherited edtExcisePay: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtDecisionCourt: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Width = 121
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Width = 121
        end
        inherited edtReasonAticle: TcxTextEdit
          Left = 1160
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtDestSubINN: TcxDBTextEdit
          Width = 121
        end
        inherited edtDestSubKPP: TcxDBTextEdit
          Left = 989
        end
        inherited edtDestSubj: TfdcObjectLinkEdit
          Width = 121
        end
        inherited edtDestSubName: TcxDBTextEdit
          Width = 121
        end
        inherited edtDestSubAddr: TcxDBTextEdit
          Width = 121
        end
        inherited edtAccount: TcxDBMaskEdit
          Width = 121
        end
        inherited edtBank: TfdcObjectLinkEdit
          Width = 121
        end
        inherited edtCorrAccount: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankAddr: TcxDBTextEdit
          Width = 121
        end
        inherited edtCurrency: TfdcObjectLookupEdit
          Width = 145
        end
        inherited cbDecision: TcxComboBox
          Width = 989
        end
        inherited cbBeforeAfter: TcxComboBox
          Left = 1111
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 527
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 1005
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 783
        end
        inherited edtSignBy: TcxDBTextEdit
          Width = 783
        end
        inherited edtSignDate: TcxDBDateEdit
          Width = 783
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 783
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Width = 783
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 767
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 783
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Width = 783
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Width = 814
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Width = 1144
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Width = 1144
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Width = 1144
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Width = 1100
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 166
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1111
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
          inherited lciCurrency: TdxLayoutItem
            Tag = 33
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1276
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 786
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 814
        Width = 1276
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1273
        Height = 786
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1044#1058
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1276
        Height = 817
        ClientRectBottom = 793
        ClientRectRight = 1276
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
        FloatLeft = 342
        FloatTop = 339
        FloatClientWidth = 103
        FloatClientHeight = 100
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
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_dec_payback_pay_add('
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
      '     ,pcurrencyid      => :CURRENCY_ID'
      '     ,paccount         => :ACCOUNT'
      '     ,pbankid          => :BANK_ID'
      '     ,pkbkid           => :KBKCODE_ID'
      '     ,ppersonalaccount => :PERSONAL_ACCOUNT'
      '     ,pdatelastdoc     => :DATE_LAST_DOC'
      '     ,pdestsubname     => :DECL_NAME_BANK_DEST'
      '     ,pists            => :IS_TS'
      '     ,pexcisepay       => :EXCISE_PAY'
      '     ,pdecisioncourt   => :DECISION_COURT'
      '     ,pdatecourt       => :DATE_COURT'
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
        Name = 'DECL_NAME_BANK_DEST'
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
  inherited qryDetail: TfdcQuery
    SQL.Strings = (
      'SELECT row_number() over (ORDER BY po_date, po_num) AS pp'
      '      ,po_type'
      '      ,po_num'
      '      ,po_date'
      '      ,po_sum'
      '      ,od_num'
      '      ,od_pt'
      '      ,od_cor'
      '      ,ret_sum'
      'FROM ('
      'SELECT DISTINCT'
      '       CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END               AS po_type'
      '      ,po.doc_number     AS po_num'
      '      ,po.doc_date       AS po_date'
      '      ,po.doc_summa      AS po_sum'
      '      ,dc.name           AS od_num'
      '      ,pt.code           AS od_pt'
      '      ,SUM( - ad.summa ) AS od_cor'
      '      ,SUM('
      '         CASE'
      
        '          WHEN  ( SELECT COUNT(DISTINCT to_char(v.payment_id) ||' +
        ' to_char(v.summa) )'
      '                    FROM fdc_po_credit_lst_all t,'
      '                         (SELECT DISTINCT pr.summa summa'
      '                                ,pr.payment_id'
      '                                ,pr.doc_id'
      '                            FROM FDC_PAYBACK_RESERVE_LST pr'
      '                            WHERE pr.decision_id = :ID'
      '                              AND pr.edate IS NULL ) v'
      '                   WHERE t.id = v.payment_id'
      '                     AND t.id = po.ID'
      '                     AND v.doc_id = dc.id ) = 1 THEN'
      '                ( SELECT v.summa'
      '                    FROM fdc_po_credit_lst_all t,'
      '                         (SELECT pr.summa summa'
      '                                ,pr.payment_id'
      '                                ,pr.doc_id'
      '                            FROM FDC_PAYBACK_RESERVE_LST pr'
      '                            WHERE pr.decision_id = :ID'
      '                              AND pr.edate IS NULL ) v'
      '                   WHERE t.id = v.payment_id'
      '                     AND t.id = po.ID'
      '                     AND v.doc_id = dc.id )'
      
        '           WHEN ( SELECT COUNT( DISTINCT to_char(p.payment_id) |' +
        '| to_char(p.summa) )'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = po.ID'
      '                      AND p.summa = - ad.summa ) = 1 THEN'
      '                ( SELECT DISTINCT p.summa'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = po.ID'
      '                      AND p.summa = - ad.summa )'
      '           WHEN ( SELECT COUNT( DISTINCT to_char(p.payment_id) )'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = po.ID ) = 1 THEN'
      '                ( SELECT SUM( p.summa )'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = po.ID )'
      '           ELSE'
      '             NULL'
      '         END ) AS ret_sum'
      '  FROM FDC_REP_DEC_PAYBACK_LST  po'
      '      ,fdc_rel_advice_dec_lst   ra'
      '      ,fdc_advice_deduction_lst ad'
      '      ,fdc_doc_charge_lst       dc'
      '      ,fdc_dict_lst             pt'
      ' WHERE ad.payment_id    = po.id'
      '   AND ra.rel_object_id = :ID'
      '   AND ra.object_id     = ad.advice_id'
      '   AND ad.decl_id       = dc.id'
      '   AND ad.pay_type_id   = pt.id'
      '   AND ad.is_ts = p_document.ists(:ID)'
      
        ' GROUP BY po.id, po.TypeSYSNAME, po.doc_number, po.doc_date, po.' +
        'doc_summa, dc.name, pt.code'
      ' ORDER BY po.doc_date, po.doc_number, dc.name'
      ')'
      'WHERE ret_sum IS NOT NULL'
      'ORDER BY pp'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryDetailOD_NUM: TStringField
      FieldName = 'OD_NUM'
      Size = 1500
    end
    object qryDetailOD_PT: TStringField
      FieldName = 'OD_PT'
      Size = 1500
    end
    object qryDetailOD_COR: TFloatField
      FieldName = 'OD_COR'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object qryPT_SUMS: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = True
    SQL.Strings = (
      'SELECT pt.code'
      '      ,SUM('
      '         CASE'
      
        '           WHEN ( SELECT COUNT( DISTINCT to_char(rp1.payment_id)' +
        ' || to_char(rp1.summa) )'
      '                    FROM fdc_reserved_payment_lst rp1'
      '                        ,fdc_value_lst v1'
      '                    WHERE v1.OWNER_OBJECT_ID = :ID'
      '                      AND v1.Ref_Object_ID = rp1.id'
      '                      AND rp1.payment_id = ad.payment_id '
      '                      AND rp1.doc_id = ad.decl_id ) = 1 THEN'
      '                ( SELECT DISTINCT rp1.summa'
      '                    FROM fdc_reserved_payment_lst rp1'
      '                        ,fdc_value_lst v1'
      '                    WHERE v1.OWNER_OBJECT_ID = :ID'
      '                      AND v1.Ref_Object_ID = rp1.id'
      '                      AND rp1.payment_id = ad.payment_id '
      '                      AND rp1.doc_id = ad.decl_id )'
      
        '           WHEN ( SELECT COUNT( DISTINCT to_char(p.payment_id) |' +
        '| to_char(p.summa) )'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = ad.payment_id'
      '                      AND p.summa = - ad.summa ) = 1 THEN'
      '                ( SELECT DISTINCT p.summa'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = ad.payment_id'
      '                      AND p.summa = - ad.summa )'
      
        '           WHEN ( SELECT COUNT( DISTINCT to_char(p.payment_id) |' +
        '| to_char(p.summa) )'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      
        '                      AND p.payment_id = ad.payment_id ) = 1 THE' +
        'N'
      '                ( SELECT DISTINCT p.summa'
      '                    FROM fdc_payment_deduction_lst p'
      '                    WHERE p.decl_id = :ID'
      '                      AND p.payment_id = ad.payment_id )'
      '           ELSE'
      '             NULL'
      '         END )  AS summa'
      '  FROM fdc_rel_advice_dec_lst   ra'
      '      ,fdc_advice_deduction_lst ad'
      '      ,fdc_dict_lst             pt'
      ' WHERE ra.rel_object_id = :ID'
      '   AND ra.object_id     = ad.advice_id'
      '   AND ad.pay_type_id   = pt.id'
      '   AND ad.is_ts = p_document.ists(:ID)'
      ' GROUP BY pt.code'
      ' ORDER BY pt.code')
    Left = 203
    Top = 418
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryPT_SUMSCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object qryPT_SUMSSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
end
