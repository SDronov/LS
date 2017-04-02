inherited PaymentOrderBySubjectGridForm: TPaymentOrderBySubjectGridForm
  Left = 227
  Top = 74
  Caption = #1055#1083#1072#1090#1077#1078#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
      end
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 80
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtINN: TcxTextEdit
          Width = 105
        end
        inherited edtNomer: TcxTextEdit
          Width = 105
        end
        inherited edtCurrency: TcxTextEdit
          Width = 105
        end
        inherited edtFromDate: TcxDateEdit
          Width = 105
        end
        inherited edtToDate: TcxDateEdit
          Width = 105
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 105
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 105
        end
        inherited edtKPP: TcxTextEdit
          Width = 105
        end
        inherited edtPayCode: TcxTextEdit
          Width = 106
        end
        inherited edtDescript: TcxMemo
          Height = 0
          Width = 106
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaItem1: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaItem10: TdxLayoutItem
            Visible = False
          end
          inherited lcSearchCriteriaItem3: TdxLayoutItem
            Visible = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewREST_SUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUMMA
            end>
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
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            Item = dxbbAssure
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 151
            Visible = True
          end>
        Name = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      28
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      'FROM ('
      'SELECT /* + FIRST_ROWS */ '
      't.id'
      ',t.name'
      ',t.shortname'
      ',t.object_Type_id'
      ',t.state_id'
      ',t.accesslevel'
      ',t.sysname'
      ',t.descript'
      ',t.note'
      ',t.owner_object_id'
      ',t.typename'
      ',t.typesysname'
      ',t.objectkindlist'
      ',t.doc_number AS doc_no'
      ',t.doc_date'
      ',t.exec_date'
      ',t.payer_id'
      ',t.summa'
      ',t.KBK'
      ',t.currency_id'
      ',t.payer_name'
      ',t.payer_inn'
      ',t.curr_name'
      ',t.curr_code'
      ',t.doc_summa'
      ',t.rest_summa'
      ',t.doc_no2'
      ',t.doc_date2'
      ',t.DestCustomsCode'
      ',t.payer_kpp'
      ',t.coming_date'
      ',t.assure_date'
      ',t.pay_type_code'
      ',t.locked_summa'
      ',t.income_date'
      ',0 AS subject_id'
      ',t.activation_date'
      ',decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '     ,(SELECT s.sysname FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_sysname'
      
        '     ,(SELECT s.name    FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_name'
      '     ,rest_summa - locked_summa AS AVAIL_SUMMA'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      '     ,0                         AS ak'
      '     ,t.is_ts'
      '  FROM fdc_po_credit_lst t'
      '  WHERE (t.payer_id = :SUBJECT_ID or :Subject_Id is null)'
      '    AND t.TypeSysName NOT IN ( '#39'PaymentOrderConfirm'#39' )'
      ''
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1053#1072#1095#1072#1083#1086
      
        '    AND NVL(:acc_id, -1)                                        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_reg_id, -1)                                    ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_bdate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_edate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_currency_id, 0)                                ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_from, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_to,   to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      '--$s#viewmode#0*/ AND NOT EXISTS ( SELECT 0'
      
        '--$s#viewmode#0*/                    FROM fdc_rel_pack_docs_lst ' +
        'r'
      
        '--$s#viewmode#0*/                    WHERE r.rel_object_id = t.i' +
        'd )'
      '--$s#viewmode#0*/ AND EXISTS ( SELECT 0'
      '--$s#viewmode#0*/                FROM fdc_acc_transaction act'
      '--$s#viewmode#0*/                WHERE (   act.doc_id = t.id'
      
        '--$s#viewmode#0*/                       OR (SELECT np.payment_or' +
        'der_id FROM fdc_payment_order_non_id_lst np WHERE np.id = act.do' +
        'c_id) = t.id)'
      '--$s#viewmode#0*/                  AND act.account_id  = :acc_id'
      
        '--$s#viewmode#0*/                  AND act.currency_id = :acc_cu' +
        'rrency_id'
      
        '--$s#viewmode#0*/                  AND act.operation_date BETWEE' +
        'N :acc_bdate AND :acc_edate )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_from IS NULL OR t.doc_date' +
        ' >= :acc_doc_date_from )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_to   IS NULL OR t.doc_date' +
        ' <= :acc_doc_date_to   )'
      '--$s#viewmode#1*/ AND (   (    EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                         FROM fdc_rel_pack_docs' +
        '_lst r'
      
        '--$s#viewmode#1*/                         WHERE r.object_id = :a' +
        'cc_reg_id'
      
        '--$s#viewmode#1*/                           AND r.rel_object_id ' +
        '= t.id )'
      '--$s#viewmode#1*/          AND (   EXISTS ( SELECT  0'
      
        '--$s#viewmode#1*/                            FROM fdc_acc_transa' +
        'ction act'
      
        '--$s#viewmode#1*/                            WHERE act.doc_id = ' +
        't.id'
      
        '--$s#viewmode#1*/                              AND act.account_i' +
        'd  = :acc_id'
      
        '--$s#viewmode#1*/                              AND act.currency_' +
        'id = :acc_currency_id )'
      ''
      '--$s#viewmode#1*/               OR EXISTS ( SELECT  0'
      
        '--$s#viewmode#1*/                             FROM fdc_payment_o' +
        'rder_non_id_lst ni'
      
        '--$s#viewmode#1*/                             WHERE ni.payment_o' +
        'rder_id = t.id'
      
        '--$s#viewmode#1*/                               AND EXISTS ( SEL' +
        'ECT  0'
      
        '--$s#viewmode#1*/                                              F' +
        'ROM fdc_acc_transaction act'
      
        '--$s#viewmode#1*/                                             WH' +
        'ERE act.doc_id = ni.id'
      
        '--$s#viewmode#1*/                                               ' +
        'AND act.account_id  = :acc_id'
      
        '--$s#viewmode#1*/                                               ' +
        'AND act.currency_id = :acc_currency_id ) ) ) )'
      ''
      
        '--$s#viewmode#1*/      OR ( t.id IN ( SELECT poc.confirmed_pay_i' +
        'd'
      
        '--$s#viewmode#1*/                       FROM fdc_payment_order_c' +
        'nfrm_lst poc'
      '--$s#viewmode#1*/                       WHERE EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_rel_pack_docs_lst r'
      
        '--$s#viewmode#1*/                                        WHERE r' +
        '.object_id = :acc_reg_id'
      
        '--$s#viewmode#1*/                                          AND r' +
        '.rel_object_id = poc.id )'
      '--$s#viewmode#1*/                         AND EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_acc_transaction act'
      
        '--$s#viewmode#1*/                                       WHERE ac' +
        't.doc_id = poc.id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.account_id  = :acc_id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.currency_id = :acc_currency_id )'
      '--$s#viewmode#1*/  ) ) )'
      '--  $s#viewmode#1*/ AND t.is_active = '#39'Y'#39
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1050#1086#1085#1077#1094
      ''
      '                  AND (   (:NA IS NULL)'
      '                       OR (:NA = 1 AND t.payer_id IS     NULL)'
      '                       OR (:NA = 2 AND t.summa    IS     NULL)'
      '                       OR (:NA = 3 AND t.summa    IS NOT NULL)'
      
        '                       OR (:NA = 4 AND t.exec_date <= add_months' +
        '(current_date, -36) AND t.rest_summa > 0)'
      
        '                       OR (:NA = 5 AND t.id IN (SELECT rr.rel_ob' +
        'ject_id FROM fdc_rel_pack_docs_lst rr WHERE rr.object_id = :DOCP' +
        'ACK_ID) )'
      
        '                       OR (:NA = 6 AND NOT EXISTS ( SELECT 0 FRO' +
        'M fdc_payment_order_non_id n WHERE t.ID = n.ID AND n.payment_ord' +
        'er_id IS NOT NULL ) )'
      '                      )'
      '/*$p#name#*/      AND (upper(t.payer_name) LIKE upper(:Name)'
      '/*$p#name#*/           or '
      
        '/*$p#name#*/           exists (select 1 from fdc_broker_contract' +
        '_lst b where upper(b.subject_name) like upper(:Name) and b.broke' +
        'r_id = t.payer_id and b.is_authorize = '#39'Y'#39'))'
      '/*$p#inn#*/       AND (t.payer_inn         LIKE :INN'
      '/*$p#inn#*/            or '
      
        '/*$p#inn#*/            exists (select 1 from fdc_broker_contract' +
        '_lst b where b.subject_inn like :INN and b.broker_id = t.payer_i' +
        'd and b.is_authorize = '#39'Y'#39'))'
      '/*$p#kpp#*/       AND (t.payer_kpp         LIKE :KPP'
      '/*$p#kpp#*/            or '
      
        '/*$p#kpp#*/            exists (select 1 from fdc_broker_contract' +
        '_lst b where b.subject_kpp like :KPP and b.broker_id = t.payer_i' +
        'd and b.is_authorize = '#39'Y'#39'))'
      
        '/*$p#doc_no#*/    AND (t.doc_number         LIKE :DOC_NO OR t.do' +
        'c_no2 LIKE :DOC_NO)'
      '/*$p#curr#*/      AND (t.curr_code      LIKE :CURR)'
      '/*$p#from_date#*/ AND (t.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (t.doc_date  <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#sum_min#*/   AND (t.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (t.doc_summa <= :SUM_MAX)'
      
        '                  AND (:CURRENCY_ID IS NULL OR t.currency_id = :' +
        'CURRENCY_ID)'
      '/*$p#DESCRIPT#*/  AND (t.descript like :DESCRIPT)'
      
        '                  AND (:REST_SUMMA IS NULL OR t.rest_summa >= :R' +
        'EST_SUMMA)'
      
        '                  AND (1=1 OR t.rest_summa - t.locked_summa >= N' +
        'VL(:AVAIL_SUMMA, 0))'
      '/*$p#PAY_CODE#*/  AND ((t.pay_type_code LIKE :PAY_CODE))'
      
        '                  AND (:GL_SUBJECT_ID IS NULL OR t.PAYER_ID = :G' +
        'L_SUBJECT_ID)'
      ''
      '  )'
      'WHERE rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subject_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_reg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_reg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_reg_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DOCPACK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
