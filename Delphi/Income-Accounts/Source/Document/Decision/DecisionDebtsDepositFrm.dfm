inherited DecisionDebtsDepositForm: TDecisionDebtsDepositForm
  Left = 278
  Top = 207
  Caption = 'DecisionDebtsDepositForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 849
        end
        inherited edtDescript: TcxDBMemo
          Top = 938
          TabOrder = 32
          Height = 223
          Width = 737
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Top = 509
          TabOrder = 21
        end
        inherited cmbxCurrency: TfdcObjectLookupEdit
          Top = 482
          TabOrder = 20
        end
        inherited edtSumRub: TcxDBCurrencyEdit
          Top = 536
          TabOrder = 22
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Top = 219
          TabOrder = 11
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Top = 219
          TabOrder = 12
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Top = 246
          TabOrder = 13
        end
        inherited edtAppDate: TcxDBDateEdit
          Top = 317
          TabOrder = 14
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Top = 317
          TabOrder = 15
        end
        inherited edtAppNumber: TcxDBTextEdit
          Top = 344
          TabOrder = 16
          Width = 121
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 871
          TabOrder = 30
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 898
          TabOrder = 31
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 817
          TabOrder = 28
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 844
          TabOrder = 29
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Top = 415
          TabOrder = 18
          Width = 783
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 351
          Top = 344
          TabOrder = 17
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Top = 442
          TabOrder = 19
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 594
          TabOrder = 23
        end
        object cxDBCheckBox1: TcxDBCheckBox [23]
          Left = 21
          Top = 148
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
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 679
          TabOrder = 25
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 706
          TabOrder = 26
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 733
          TabOrder = 27
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 621
          TabOrder = 24
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
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            object lcGeneralItem1: TdxLayoutItem
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = cxDBCheckBox1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1058#1056
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
        FloatLeft = 630
        FloatTop = 229
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
            Item = btnPrintDoc
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
    inherited btnPrint: TdxBarButton
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      OnClick = actPrintExecute
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_dec_debts_deposit_lst d'
      '  where d.ID = :ID')
    SourceServerObject = 'FDC_DEC_DEBTS_DEPOSIT_LST'
    object dsDataIS_EXTERNAL: TStringField
      FieldName = 'IS_EXTERNAL'
      ReadOnly = True
      Size = 1
    end
  end
  inherited dsNoticeList: TfdcQuery
    SQL.Strings = (
      
        'SELECT DISTINCT md.doc_number || '#39' '#1086#1090' '#39' || TO_CHAR( md.doc_date,' +
        ' '#39'dd.mm.yyyy'#39' ) name'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_object dco'
      '      ,fdc_document md'
      ' WHERE dco.id = :DEC_ID'
      '       AND :mode_view = 0'
      '       AND pd.decision_id = dco.id'
      '       AND md.id = ( SELECT MAX( m.id )'
      '                       FROM fdc_debts_measures_lst m'
      '                      WHERE m.owner_object_id IN'
      '                            ( SELECT id'
      '                                FROM fdc_object_lst n'
      
        '                              CONNECT BY PRIOR n.owner_object_id' +
        ' = n.ID'
      '                               START WITH n.id = pd.notice_id'
      '                            )'
      
        '                            AND m.measures_type in ( '#39'B20'#39', '#39'B27' +
        #39' ) )'
      'UNION ALL'
      
        'SELECT DISTINCT md.doc_number || '#39' '#1086#1090' '#39' || TO_CHAR( md.doc_date,' +
        ' '#39'dd.mm.yyyy'#39' ) name'
      '  FROM fdc_noticepay_ded_reserv_lst pd'
      '      ,fdc_object dco'
      '      ,fdc_document md'
      ' WHERE dco.id = :DEC_ID'
      '       AND :mode_view = 1'
      '       AND pd.decision_id = dco.id '
      '       AND md.id = ( SELECT MAX( m.id ) '
      '                       FROM fdc_debts_measures_lst m'
      '                      WHERE m.owner_object_id IN'
      '                            ( SELECT id'
      '                                FROM fdc_object_lst n'
      
        '                              CONNECT BY PRIOR n.owner_object_id' +
        ' = n.ID'
      '                               START WITH n.id = pd.notice_id '
      '                            )'
      
        '                            AND m.measures_type in ( '#39'B20'#39', '#39'B27' +
        #39' ) )  '
      ''
      '/*'
      'SELECT np.name'
      '  FROM fdc_noticepay_lst np'
      ' WHERE EXISTS ( SELECT 0'
      '                   FROM fdc_ded_paydept_lst pd'
      '                   WHERE pd.decision_id = :DEC_ID'
      '                     AND pd.notice_id = np.id )'
      '   AND :mode_view = 0'
      'UNION all'
      'SELECT np.name'
      '  FROM fdc_noticepay_lst np'
      ' WHERE EXISTS ( SELECT 0'
      '                   FROM fdc_noticepay_ded_reserv_lst r'
      '                   WHERE r.decision_id = :DEC_ID'
      '                     AND r.notice_id = np.id )'
      '   AND :mode_view = 1*/')
  end
  inherited dsReport: TfdcQuery
    DataSource = srcData
    SQL.Strings = (
      'SELECT v.STRINGVALUE AS CustomsName,'
      '  :DecisionType as DecisionType,'
      '  '#39'356'#39' as ARTICLE_LIST,'
      '  '#39' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072' '#39'  as CASH_ASSETS_NAME'
      'FROM fdc_value_lst_sys v'
      'WHERE v.SYSNAME = '#39'CustomsName'#39
      '')
    ParamData = <
      item
        DataType = ftString
        Name = 'DecisionType'
        ParamType = ptInput
      end>
    object dsReportARTICLE_LIST: TStringField
      FieldName = 'ARTICLE_LIST'
      Size = 4000
    end
    object dsReportCASH_ASSETS_NAME: TStringField
      FieldName = 'CASH_ASSETS_NAME'
      Size = 4000
    end
  end
  inherited dsDetail: TfdcQuery
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number, t' +
        '.doc_number) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,t.doc_number    AS tr_num'
      '      ,t.sum_rub       AS tr_sum'
      '      ,SUM( pd.summa ) AS reuse_sum'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_po_credit_lst   po'
      
        '      ,( SELECT DISTINCT tr.name AS doc_number, tr.sum_rub, rp.p' +
        'ayment_id'
      '           FROM fdc_reserved_payment_lst      rp'
      '               ,fdc_payment_deduction_all_lst pd'
      '               ,fdc_tr_lst                    tr'
      '           WHERE rp.doc_id  = :dec_id'
      '             AND rp.id      = pd.charge_id'
      '             AND pd.decl_id = tr.id   ) t'
      '  WHERE pd.decision_id = :DEC_ID'
      '    AND :mode_view     = 0'
      '    AND pd.payment_id  = po.id'
      '    AND pd.payment_id  = t.payment_id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma, t.doc_number, t.sum_rub'
      'UNION ALL'
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number, t' +
        '.doc_number) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,t.doc_number    AS tr_num'
      '      ,t.sum_rub       AS tr_sum'
      '      ,SUM( r.summa )  AS reuse_sum'
      '  FROM fdc_noticepay_ded_reserv_lst r'
      '      ,fdc_po_credit_lst            po'
      
        '      ,( SELECT DISTINCT tr.name AS doc_number, tr.sum_rub, rp.p' +
        'ayment_id'
      '           FROM fdc_reserved_payment_lst      rp'
      '               ,fdc_payment_deduction_all_lst pd'
      '               ,fdc_tr_lst                    tr'
      '           WHERE rp.doc_id  = :dec_id'
      '             AND rp.id      = pd.charge_id'
      '             AND pd.decl_id = tr.id   ) t'
      '  WHERE r.decision_id = :DEC_ID'
      '    AND :mode_view    = 1'
      '    AND r.payment_id  = po.id'
      '    AND r.payment_id  = t.payment_id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma, t.doc_number, t.sum_rub'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'dec_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsDetailTR_NUM: TStringField
      FieldName = 'TR_NUM'
      Size = 100
    end
    object dsDetailTR_SUM: TFloatField
      FieldName = 'TR_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT rr.po_name as Name'
      '  FROM FDC_RESERVED_FOR_REUSE_LST rr'
      ' WHERE rr.doc_id = :ID')
    Left = 80
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end>
    object dsPaymentOrderListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT '#39#1058#1056' '#8470#39' || t.ObjName AS NAME'
      'FROM fdc_rel_tr_dec_lst t'
      'WHERE t.REL_OBJECT_ID = :ID')
    Left = 120
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end>
    object dsDeclListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
end
