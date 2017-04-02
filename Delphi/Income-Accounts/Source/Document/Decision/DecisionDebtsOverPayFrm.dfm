inherited DecisionDebtsOverPayForm: TDecisionDebtsOverPayForm
  Left = 315
  Top = 203
  Height = 427
  Caption = 'DecisionDebtsOverPayForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 400
    ClientRectBottom = 376
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 347
        inherited edtName: TcxDBTextEdit
          Left = 90
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Left = 90
          Height = 75
          Width = 652
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Left = 90
          Width = 652
        end
        inherited cmbxCurrency: TfdcObjectLookupEdit
          Left = 90
          Width = 652
        end
        inherited edtSumRub: TcxDBCurrencyEdit
          Left = 90
          Width = 652
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 209
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 121
        end
        inherited edtAppNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtSignBy: TcxDBTextEdit
          Width = 121
        end
        inherited edtSignDate: TcxDBDateEdit
          Width = 121
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Width = 714
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Width = 714
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 813
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 850
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 351
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Width = 850
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Width = 739
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Width = 783
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 368
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
          inherited lcGeneralItem2: TdxLayoutItem
            Visible = False
          end
          inherited lciSumma: TdxLayoutItem
            Caption = #1057#1091#1084#1084#1072
          end
          inherited lcGeneralItem3: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 347
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 373
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 347
      end
    end
    inherited tabDocObligations: TcxTabSheet
      Caption = #1044#1058', '#1058#1055#1054
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 376
        ClientRectBottom = 352
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
        FloatLeft = 379
        FloatTop = 312
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
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
        SourceField = DecisionDebtsForm.dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_dec_debts_overpay_lst d'
      '  where d.ID = :ID')
    SourceServerObject = 'FDC_DEC_DEBTS_OVERPAY_LST'
  end
  inherited dsReport: TfdcQuery
    DataSource = srcData
    SQL.Strings = (
      'select'
      '  fdc_dec_debts_overpay_get_art(:id, 0) as ARTICLE_LIST,'
      '  fdc_dec_debts_overpay_get_art(:id, 1) as CASH_ASSETS_NAME,'
      '  '#39#39' as DEBTS_NAME,'
      
        '  (SELECT v.STRINGVALUE FROM fdc_value_lst_sys v WHERE v.SYSNAME' +
        ' = '#39'CustomsName'#39' AND ROWNUM <= 1) as CUSTOMSNAME,'
      '  :DecisionType as DECISIONTYPE'
      'from dual')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end
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
    object dsReportDEBTS_NAME: TStringField
      FieldName = 'DEBTS_NAME'
      Size = 0
    end
  end
  inherited dsDetail: TfdcQuery
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number, t' +
        '.od_num) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,t.od_num        AS od_num'
      '      ,t.od_pt         AS od_pt'
      '      ,t.od_cor        AS od_cor'
      '      ,SUM( pd.summa ) AS reuse_sum'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_po_credit_lst   po'
      
        '      ,( SELECT dc.name AS od_num, pt.code AS od_pt, pd.payment_' +
        'id, SUM( - pd.summa ) AS od_cor'
      '           FROM fdc_advice_deduction_lst pd'
      '               ,fdc_rel_advice_dec_lst   rel'
      '               ,fdc_doc_charge_lst       dc'
      '               ,fdc_dict_lst             pt'
      '           WHERE rel.rel_object_id = :dec_id'
      '             AND rel.object_id     = pd.advice_id'
      '             AND pd.decl_id        = dc.id'
      '             AND pd.pay_type_id    = pt.id(+)'
      '--             AND pd.is_ts = p_document.ists(:DEC_ID)'
      '           GROUP BY dc.name, pt.code, pd.payment_id ) t'
      '  WHERE pd.decision_id = :DEC_ID'
      '    AND :mode_view     = 0'
      '    AND pd.payment_id  = po.id'
      '    AND pd.payment_id  = t.payment_id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma, t.od_num, t.od_pt, t.od_cor'
      'UNION ALL'
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number, t' +
        '.od_num) AS pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,t.od_num        AS od_num'
      '      ,t.od_pt         AS od_pt'
      '      ,t.od_cor        AS od_cor'
      '      ,SUM( r.summa )  AS reuse_sum'
      '  FROM fdc_noticepay_ded_reserv_lst r'
      '      ,fdc_po_credit_lst            po'
      
        '      ,( SELECT dc.name AS od_num, pt.code AS od_pt, pd.payment_' +
        'id, SUM( - pd.summa ) AS od_cor'
      '           FROM fdc_advice_deduction_lst pd'
      '               ,fdc_rel_advice_dec_lst   rel'
      '               ,fdc_doc_charge_lst       dc'
      '               ,fdc_dict_lst             pt'
      '           WHERE rel.rel_object_id = :dec_id'
      '             AND rel.object_id     = pd.advice_id'
      '             AND pd.decl_id        = dc.id'
      '             AND pd.pay_type_id    = pt.id(+)'
      '--             AND pd.is_ts = p_document.ists(:DEC_ID)'
      '           GROUP BY dc.name, pt.code, pd.payment_id ) t'
      '  WHERE r.decision_id = :DEC_ID'
      '    AND :mode_view    = 1'
      '    AND r.payment_id  = po.id'
      '    AND r.payment_id  = t.payment_id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma, t.od_num, t.od_pt, t.od_cor')
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
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsDetailOD_NUM: TStringField
      FieldName = 'OD_NUM'
      Size = 1500
    end
    object dsDetailOD_PT: TStringField
      FieldName = 'OD_PT'
      Size = 1500
    end
    object dsDetailOD_COR: TFloatField
      FieldName = 'OD_COR'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object dsDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select '#39#1043#1058#1044' '#8470#39' || t.Name as Name  --|| '#39','#39
      '  from fdc_obligation_doc_lst t'
      '      ,(select distinct ac.decl_id, ac.advice_id as object_id'
      '          from fdc_advice_charge_lst ac'
      '        union'
      '        select distinct nc.decl_id, nc.noticepay_id as object_id'
      '          from fdc_noticepay_charge_lst nc'
      '        ) v,'
      '        fdc_rel_advice_dec_lst ra'
      ' where t.id = v.decl_id'
      '   and ra.OBJECT_ID = v.object_id'
      '   and ra.REL_OBJECT_ID = :id')
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
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT t.po_name AS name'
      '  FROM fdc_reserved_payment_Lst t'
      ' WHERE t.doc_id = :id')
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
  object dsDetailPT: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT pd.pay_type_code AS pt_code'
      '      ,SUM( pd.summa )  AS pt_summa'
      '  FROM fdc_ded_paydept_lst pd'
      '  WHERE pd.decision_id = :DEC_ID'
      '    AND :mode_view     = 0'
      '  GROUP BY pd.pay_type_code'
      'UNION ALL'
      'SELECT r.pay_type_code  AS pt_code'
      '      ,SUM( r.summa )   AS pt_summa'
      '  FROM fdc_noticepay_ded_reserv_lst r'
      '  WHERE r.decision_id = :DEC_ID'
      '    AND :mode_view    = 1'
      '  GROUP BY r.pay_type_code')
    BeforeOpen = dsNoticeListBeforeOpen
    Left = 443
    Top = 322
    ParamData = <
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
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsDetailPTPT_CODE: TStringField
      FieldName = 'PT_CODE'
      Size = 1500
    end
    object dsDetailPTPT_SUMMA: TFloatField
      FieldName = 'PT_SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
end
