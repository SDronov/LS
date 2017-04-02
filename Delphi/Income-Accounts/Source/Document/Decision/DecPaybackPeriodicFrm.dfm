inherited DecPaybackPeriodicForm: TDecPaybackPeriodicForm
  Caption = 'DecPaybackPeriodicForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 814
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
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtDestSubINN: TcxDBTextEdit
          Width = 121
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
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 527
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
        inherited edtDocNumber: TcxDBTextEdit
          Width = 166
        end
        inherited edtDocDate: TcxDBDateEdit
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
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1044#1058
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
  inherited qryDetail: TfdcQuery
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
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
      '           WHEN ( SELECT COUNT ( DISTINCT rel_object_id )'
      '                    FROM fdc_rel_advice_dec_lst r'
      '                    WHERE r.object_id = ra.object_id ) = 1 THEN'
      '             - ad.summa'
      '           ELSE'
      '             NULL'
      '         END )           AS ret_sum'
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
      
        ' GROUP BY po.id, po.TypeSYSNAME, po.doc_number, po.doc_date, po.' +
        'doc_summa, dc.name, pt.code'
      ' ORDER BY po.doc_date, po.doc_number, dc.name')
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
      '  :ID ::= fdc_dec_payback_periodic_add('
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
  object qryPT_SUMS: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = True
    SQL.Strings = (
      'SELECT pt.code'
      '      ,SUM('
      '         CASE'
      '           WHEN ( SELECT COUNT ( DISTINCT rel_object_id )'
      '                    FROM fdc_rel_advice_dec_lst r'
      '                    WHERE r.object_id = ra.object_id ) = 1 THEN'
      '             - ad.summa'
      '           ELSE'
      '             NULL'
      '         END )           AS summa'
      '  FROM fdc_rel_advice_dec_lst   ra'
      '      ,fdc_advice_deduction_lst ad'
      '      ,fdc_dict_lst             pt'
      ' WHERE ra.rel_object_id = :ID'
      '   AND ra.object_id     = ad.advice_id'
      '   AND ad.pay_type_id   = pt.id'
      ' GROUP BY pt.code'
      ' ORDER BY pt.code')
    Left = 203
    Top = 418
    ParamData = <
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
