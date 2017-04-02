inherited DecPaybackDepositForm: TDecPaybackDepositForm
  Left = 88
  Top = 23
  Width = 1443
  Caption = 'DecPaybackDepositForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1435
    ClientRectRight = 1435
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1429
        inherited edtName: TcxDBTextEdit
          Width = 1344
        end
        inherited edtDescript: TcxDBMemo
          Height = 223
          Width = 1344
        end
        inherited edtExcisePay: TcxDBCheckBox
          Style.IsFontAssigned = True
          Width = 121
        end
        inherited edtDecisionCourt: TcxDBCheckBox
          Style.IsFontAssigned = True
          Width = 121
        end
        inherited edtDateCourt: TcxDBDateEdit
          Left = 307
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Left = 574
          Width = 818
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Width = 1245
        end
        inherited edtReasonAticle: TcxTextEdit
          Left = 1320
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Properties.ReadOnly = True
          Properties.OnChange = nil
          Width = 1344
        end
        inherited edtDestSubINN: TcxDBTextEdit
          Width = 973
        end
        inherited edtDestSubKPP: TcxDBTextEdit
          Left = 1149
        end
        inherited edtDestSubj: TfdcObjectLinkEdit
          Width = 1245
        end
        inherited edtDestSubName: TcxDBTextEdit
          Width = 1245
        end
        inherited edtDestSubAddr: TcxDBTextEdit
          Width = 1245
        end
        inherited edtAccount: TcxDBMaskEdit
          Width = 1245
        end
        inherited edtBank: TfdcObjectLinkEdit
          Width = 1245
        end
        inherited edtCorrAccount: TcxDBTextEdit
          Width = 1006
        end
        inherited edtBankAddr: TcxDBTextEdit
          Width = 1245
        end
        inherited edtCurrency: TfdcObjectLookupEdit
          Width = 1344
        end
        inherited cbDecision: TcxComboBox
          Width = 994
        end
        inherited cbBeforeAfter: TcxComboBox
          Left = 1271
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 989
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 1165
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 1245
        end
        inherited edtSignBy: TcxDBTextEdit
          Width = 1245
        end
        inherited edtSignDate: TcxDBDateEdit
          Width = 1245
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 1245
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Width = 1245
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 1128
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 1245
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Left = 726
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Width = 1245
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Properties.AssignedValues.MaxValue = True
          Properties.ReadOnly = True
          Properties.OnChange = nil
          Width = 1245
        end
        inherited cxDBLabel1: TcxDBLabel
          Left = 900
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Width = 1275
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Width = 1275
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Width = 1275
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Width = 1245
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 583
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 1226
          Style.IsFontAssigned = True
          Width = 166
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
          Width = 166
        end
        inherited edtActivationDate: TcxDBDateEdit
          Left = 273
          Style.IsFontAssigned = True
          Width = 166
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Left = 445
          Style.IsFontAssigned = True
          Width = 166
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1435
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Width = 1435
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1432
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1058#1056
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1435
        ClientRectRight = 1435
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select dp.*'
      '  ,CASE '
      '     WHEN dp.decl_inn IS NOT NULL THEN '
      '       '#39#1048#1053#1053' '#39' || dp.decl_inn'
      '     ELSE '#39#39
      '   END AS INN'
      '  ,CASE'
      
        '     WHEN (s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subje' +
        'ct'#39') AND dp.decl_kpp IS NOT NULL THEN'
      '       '#39'/'#1050#1055#1055' '#39' || dp.decl_kpp'
      '     ELSE '#39#39
      '   END AS KPP'
      '      ,nd.name as reason_name'
      '      ,nd.code2 as reason_code'
      
        '      ,dp.debt_pay_summa + dp.debt_peny_summa + dp.debt_proc_sum' +
        'ma'
      '              AS debts_summa_s'
      '      ,Trunc(dp.summa) AS rub'
      
        '      ,TRIM(TO_CHAR(TRUNC ((dp.summa - Trunc(dp.summa))*100), '#39'0' +
        '0'#39')) AS kopp'
      '      ,po.KBKCode as kbk_code'
      
        '      ,UPPER(fdc_valuestring_sys_get( '#39'CustomsName'#39' )) AS Custom' +
        'sName'
      '      ,fdc_valuestring_sys_get( '#39'BossName'#39' )    AS BossName'
      '      ,fdc_valuestring_sys_get( '#39'BossRank'#39' )    AS BossRank'
      '      ,(SELECT max(k.code)'
      '          FROM fdc_payback_reserve_lst p'
      '              ,fdc_kbk_dict_lst k'
      '          WHERE p.decision_id = :id'
      '            AND p.kbkcode_id = k.id) AS kbkcode'
      '  ,CASE '
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN dp.decl_address'
      '   END AS address'
      '  ,CASE'
      
        '     WHEN s.TypeSysName = '#39'Declarant'#39' OR s.TypeSysName = '#39'Subjec' +
        't'#39' THEN '#39#39
      '     WHEN s.TypeSysName = '#39'Person'#39' THEN '
      '        (SELECT '#39#1087#1072#1089#1087#1086#1088#1090' '#39' || p.ser_no || '#39' '#39' || p.doc_no'
      '           FROM fdc_person_lst p'
      '           WHERE p.id = s.ID '
      '             AND p.ser_no IS NOT NULL'
      '             AND p.doc_no IS NOT NULL)'
      '   END AS passport'
      ' from fdc_decision_payback_lst dp'
      
        '      left join fdc_payment_order_payback_lst po on dp.id = po.D' +
        'EC_PAY_ID'
      '      left join fdc_nsi_dict_lst nd on dp.reason_id = nd.id'
      '      left join fdc_subject_lst s on dp.subject_id = s.id'
      ' where dp.id = :ID')
    object dsDataSUMMA_BASE: TFloatField
      FieldName = 'SUMMA_BASE'
      Visible = False
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_dec_payback_deposit_add('
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
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA'
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
      '      ,dc.name        AS od_num'
      '      ,dc.sum_rub     AS od_sum'
      '--      ,nvl(dp.summa, 0) AS ret_sum'
      '      ,SUM( - pd.summa ) AS ret_sum'
      '  FROM FDC_REP_DEC_PAYBACK_LST       po'
      '      ,fdc_value_lst                 r'
      '      ,fdc_payment_deduction_all_lst pd'
      '      ,fdc_tr_lst                    dc'
      '      ,fdc_decision_payback_lst      dp'
      ' WHERE pd.payment_id     = po.id'
      '   AND r.ref_object_id   = pd.id'
      '   AND r.owner_object_id = :ID'
      '   AND pd.decl_id        = dc.id'
      '   and dp.ext_id(+) = r.owner_object_id'
      
        ' GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_sum' +
        'ma, dc.name, dc.sum_rub, nvl(dp.summa, 0)'
      ' ORDER BY po.doc_date, po.doc_number, dc.name'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryDetailOD_NUM: TStringField
      FieldName = 'OD_NUM'
      Size = 1500
    end
    object qryDetailOD_SUM: TFloatField
      FieldName = 'OD_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  inherited dsDeclList: TfdcQuery
    Left = 553
  end
end
