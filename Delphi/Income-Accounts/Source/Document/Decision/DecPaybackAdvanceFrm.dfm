inherited DecPaybackAdvanceForm: TDecPaybackAdvanceForm
  Left = 232
  Top = 664
  Height = 984
  Caption = 'DecPaybackAdvanceForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 946
    ClientRectBottom = 922
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 891
        inherited edtName: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 814
        end
        inherited edtDescript: TcxDBMemo
          Style.StyleController = OfficeEditStyleController
          Height = 223
        end
        inherited edtDateLastDoc: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtExcisePay: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtDecisionCourt: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtDateCourt: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtReasonAticle: TcxTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtDestSubINN: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtDestSubKPP: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtDestSubj: TfdcObjectLinkEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtDestSubName: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtDestSubAddr: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtAccount: TcxDBMaskEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtBank: TfdcObjectLinkEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtCorrAccount: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtBankAddr: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 121
        end
        inherited edtCurrency: TfdcObjectLookupEdit
          Style.StyleController = OfficeEditStyleController
          Width = 145
        end
        inherited cbDecision: TcxComboBox
          Width = 989
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Style.StyleController = OfficeEditStyleController
          Width = 527
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtAppDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtAppNumber: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtSignBy: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtSignDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Style.StyleController = OfficeEditStyleController
          Width = 623
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtDocCode: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Style.StyleController = OfficeEditStyleController
          Width = 783
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 814
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 1144
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 1144
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 1144
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Style.StyleController = OfficeEditStyleController
          Width = 1100
        end
        inherited edtDocNumber: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 166
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentAttrs: TdxLayoutGroup
              inherited lcIs_TS: TdxLayoutItem
                Tag = 13
              end
            end
          end
          inherited lcgReason: TdxLayoutGroup
            inherited lciReason: TdxLayoutItem
              Tag = 22
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 891
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 919
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 891
      end
    end
    inherited tabDocObligations: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 922
        ClientRectBottom = 898
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = True
      Visible = True
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
      '  :ID ::= fdc_dec_payback_advance_add('
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
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END            AS po_type'
      '      ,po.doc_number  AS po_num'
      '      ,po.doc_date    AS po_date'
      '      ,po.doc_summa   AS po_sum'
      '      ,SUM( r.summa ) AS ret_sum'
      '  FROM FDC_REP_DEC_PAYBACK_LST   po'
      '      ,fdc_payback_reserve_lst r'
      ' WHERE po.id = r.payment_id'
      '   AND r.decision_id = :ID'
      
        ' GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_sum' +
        'ma'
      ' UNION'
      
        ' SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) ' +
        'AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END            AS po_type'
      '      ,po.doc_number  AS po_num'
      '      ,po.doc_date    AS po_date'
      '      ,po.doc_summa   AS po_sum'
      '      ,SUM( r.summa ) AS ret_sum'
      '  FROM FDC_REP_DEC_PAYBACK_LST   po'
      '      ,fdc_payment_deduction_lst r'
      ' WHERE po.id = r.payment_id'
      '   AND r.decl_id = :ID'
      '   AND (p_params.CustomLevel in ( 0, 1 ) )'
      
        ' GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_sum' +
        'ma'
      ' ORDER BY po_date, po_num ')
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
      end>
  end
end
