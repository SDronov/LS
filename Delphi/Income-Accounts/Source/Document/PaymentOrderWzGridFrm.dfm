inherited PaymentOrderWzGridForm: TPaymentOrderWzGridForm
  Left = 253
  Top = 199
  Width = 882
  Height = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 508
    Width = 874
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 569
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 569
      end
      inherited pnlProgress: TPanel
        Width = 569
        inherited lblProgress: TcxLabel
          Width = 569
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 782
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 505
    Width = 874
  end
  inherited pnlWorkspace: TPanel
    Width = 874
    Height = 479
    inherited splSearchCriteria: TSplitter
      Height = 479
    end
    inherited pnlSearchCriteria: TPanel
      Height = 479
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 459
        inherited btnSearch: TcxButton
          Left = 96
          Top = 454
        end
        inherited btnSearchClear: TcxButton
          Left = 96
          Top = 425
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 674
      Height = 479
      inherited grdData: TcxGrid
        Width = 674
        Height = 479
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 33
          end
          object grdDataDBBandedTableViewNTR: TcxGridDBBandedColumn [28]
            Caption = #1053#1086#1084#1077#1088' '#1058#1056
            DataBinding.FieldName = 'NTR'
            BestFitMaxWidth = 200
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewAIL_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 28
          end
          inherited grdDataDBBandedTableViewINCOMDE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 29
          end
          inherited columnIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 30
          end
          inherited columnACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 31
          end
          inherited columnIS_ARCHIVE: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          inherited grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Position.ColIndex = 34
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 35
          end
          inherited grdDataDBBandedTableViewUIN: TcxGridDBBandedColumn
            Position.ColIndex = 37
          end
          object grdDataDBBandedTableViewTR_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TR_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actIdentify: TAction
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
      26
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
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'TR_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'declid'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT distinct'
      '       id'
      '      ,name'
      '      ,shortname'
      '      ,object_Type_id'
      '      ,state_id'
      '      ,accesslevel'
      '      ,sysname'
      '      ,descript'
      '      ,note'
      '      ,owner_object_id'
      '      ,typename'
      '      ,typesysname'
      '      ,objectkindlist'
      '      ,doc_no'
      '      ,doc_date'
      '      ,exec_date'
      '      ,payer_id'
      '      ,summa'
      '      ,KBK'
      '      ,currency_id'
      '      ,payer_name'
      '      ,payer_inn'
      '      ,curr_name'
      '      ,curr_code'
      '      ,doc_summa'
      '      ,rest_summa'
      '      ,doc_no2'
      '      ,doc_date2'
      '      ,DestCustomsCode'
      '      ,payer_kpp'
      '      ,income_date coming_date'
      '      ,assure_date'
      '      ,pay_type_code'
      '      ,locked_summa'
      '      ,income_date'
      '      ,subject_id'
      '      ,activation_date'
      '      ,is_active'
      '      ,state_sysname'
      '      ,state_name'
      '      ,AVAIL_SUMMA'
      '      ,is_archive'
      '      ,ak'
      '      ,is_ts'
      '      ,tr_id'
      '      ,ntr'
      '      ,uin'
      'from'
      '( '
      'SELECT /* + FIRST_ROWS */'
      '       t.id'
      '      ,to_char( NULL ) AS name'
      '      ,to_char( NULL ) AS shortname'
      '      ,t.object_Type_id'
      '      ,t.state_id'
      '      ,0 AS accesslevel'
      '      ,to_char( NULL ) AS sysname'
      '      ,t.NOTE AS descript'
      '      ,t.note'
      '      ,to_number( NULL ) AS owner_object_id'
      '      ,t.typename'
      '      ,t.typesysname'
      '      ,to_char( NULL ) AS objectkindlist'
      '      ,t.doc_number AS doc_no'
      '      ,t.doc_date'
      '      ,t.exec_date'
      '      ,t.payer_id'
      '      ,t.summa'
      '      ,t.KBK'
      '      ,t.currency_id'
      '      ,fdc_object_get_name( t.PAYER_ID ) AS payer_name'
      '      ,t.payer_inn'
      '      ,t.curr_name'
      '      ,t.curr_code'
      '      ,t.doc_summa'
      '      ,t.rest_summa'
      '      ,t.doc_no2'
      '      ,t.doc_date2'
      '      ,t.DestCustomsCode'
      '      ,t.payer_kpp'
      '      ,t.income_date coming_date'
      '      ,t.assure_date'
      '      ,t.pay_type_code'
      '      ,t.locked_summa'
      '      ,t.income_date'
      '      ,0 AS subject_id'
      '      ,t.activation_date'
      '      ,decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '      ,(SELECT s.sysname FROM fdc_state_lst s WHERE s.ID = t.sta' +
        'te_id) AS state_sysname'
      
        '      ,(SELECT s.name    FROM fdc_state_lst s WHERE s.ID = t.sta' +
        'te_id) AS state_name'
      '      ,rest_summa - locked_summa AS AVAIL_SUMMA'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,0                         AS ak'
      '      ,t.is_ts'
      '      ,null as tr_id'
      '      ,null as ntr'
      '      ,t.uin'
      '  FROM fdc_po_credit_lst_on t'
      ' WHERE t.rest_summa - t.locked_summa > 0'
      '    AND ( t.payer_id IN ( /*$payer_list$*/ ) )'
      '    AND EXISTS ( SELECT 1'
      '                   FROM fdc_rest_reg r'
      '                       ,fdc_kbk_dict_lst di'
      '                   WHERE r.payment_id = t.id'
      '                     AND di.code      = r.kbk'
      
        '                     AND trunc(sysdate) BETWEEN di.sdate AND nvl' +
        '(di.edate,sysdate)'
      '               )'
      'union'
      'SELECT pd_id id'
      '      ,to_char( NULL ) AS name'
      '      ,to_char( NULL ) AS shortname'
      '      ,t.object_Type_id'
      '      ,t.state_id'
      '      ,0 AS accesslevel'
      '      ,to_char( NULL ) AS sysname'
      '      ,t.NOTE AS descript'
      '      ,t.note'
      '      ,to_number( NULL ) AS owner_object_id'
      '      ,t.typename'
      '      ,t.typesysname'
      '      ,to_char( NULL ) AS objectkindlist'
      '      ,t.doc_number AS doc_no'
      '      ,t.doc_date'
      '      ,t.exec_date'
      '      ,t.payer_id'
      '      ,t.summa'
      '      ,t.KBK'
      '      ,t.currency_id'
      '      ,fdc_object_get_name( t.PAYER_ID ) AS payer_name'
      '      ,t.payer_inn'
      '      ,t.curr_name'
      '      ,t.curr_code'
      '      ,t.doc_summa'
      '      ,t.rest_summa'
      '      ,t.doc_no2'
      '      ,t.doc_date2'
      '      ,t.DestCustomsCode'
      '      ,t.payer_kpp'
      '      ,t.income_date coming_date'
      '      ,t.assure_date'
      '      ,t.pay_type_code'
      '      ,t.locked_summa'
      '      ,t.income_date'
      '      ,0 AS subject_id'
      '      ,t.activation_date'
      '      ,decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '      ,(SELECT s.sysname FROM fdc_state_lst s WHERE s.ID = t.sta' +
        'te_id) AS state_sysname'
      
        '      ,(SELECT s.name    FROM fdc_state_lst s WHERE s.ID = t.sta' +
        'te_id) AS state_name'
      '      , AVAIL_SUMMA'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,1                         AS ak'
      '      ,t.is_ts'
      '      ,tr_id'
      '      ,trl.name ntr'
      '      ,t.uin'
      '  FROM fdc_po_credit_lst_on t'
      '       ,fdc_tr_lst trl'
      '       ,(select po.id'
      '               ,max(pd.id) pd_id'
      '               ,sum(pd.summa) avail_summa'
      '               ,tr.id tr_id'
      '          FROM fdc_po_credit_lst_on po,'
      '               fdc_tr_lst tr,'
      '               fdc_payment_deduction_lst pd'
      '         WHERE po.id = pd.payment_id'
      '               and pd.decl_id = tr.id'
      
        '               and tr.err_count = 0 and errpay_count = 0 and deb' +
        't_count = 0'
      '               AND tr.subject_id IN ( /*$payer_list$*/ )'
      '--               AND po.payer_id IN ( /*$payer_list$*/ )'
      '        group by po.id, tr.id'
      '        having sum(pd.summa) > 0) d'
      ' WHERE t.id = d.id'
      '       and trl.id = d.tr_id'
      ') lst'
      'WHERE'
      '        :acc_id            = :acc_id'
      '    AND :acc_reg_id        = :acc_reg_id'
      '    AND :acc_bdate         = :acc_bdate'
      '    AND :acc_edate         = :acc_edate'
      '    AND :acc_currency_id   = :acc_currency_id'
      '    AND :acc_doc_date_from = :acc_doc_date_from'
      '    AND :acc_doc_date_to   = :acc_doc_date_to'
      ''
      '    AND :NA         = :NA'
      '    AND :DOCPACK_ID = :DOCPACK_ID'
      ''
      '--    AND :NAME  = :NAME'
      '--    AND :INN_E = :INN_E'
      '--    AND :KPP_E = :KPP_E'
      ''
      
        '/*$p#name#*/        AND (upper(lst.payer_name) LIKE upper(:Name)' +
        ' )'
      
        '/*$p#inn#*/         AND (lst.payer_inn         LIKE :INN        ' +
        ' )'
      
        '/*$p#inn_e#*/       AND (lst.payer_inn         = :INN_E         ' +
        ' )'
      
        '/*$p#kpp#*/         AND (lst.payer_kpp         LIKE :KPP        ' +
        ' )'
      
        '/*$p#kpp_e#*/       AND (lst.payer_kpp         = :KPP_E         ' +
        ' )'
      ''
      '    AND :CURRENCY_ID   = :CURRENCY_ID'
      '    AND :REST_SUMMA    = :REST_SUMMA'
      '    AND :AVAIL_SUMMA   = :AVAIL_SUMMA'
      '    AND :GL_SUBJECT_ID = :GL_SUBJECT_ID'
      ''
      
        '/*$p#doc_no#*/      AND (lst.doc_no LIKE :DOC_NO OR lst.doc_no2 ' +
        'LIKE :DOC_NO)'
      '/*$p#curr#*/        AND (lst.curr_code  LIKE :CURR)'
      '/*$p#from_date#*/   AND (lst.doc_date   >= :FROM_DATE)'
      '/*$p#to_date#*/     AND (lst.doc_date   <= :TO_DATE)'
      '/*$p#active_from#*/ AND (lst.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (lst.activation_date  <= :ACTIVE_TO)'
      '/*$p#sum_min#*/     AND (lst.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/     AND (lst.doc_summa <= :SUM_MAX)'
      '/*$p#DESCRIPT#*/    AND (lst.note LIKE :DESCRIPT)'
      '/*$p#PAY_CODE#*/    AND (lst.pay_type_code LIKE :PAY_CODE)'
      ''
      '    AND rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_reg_id'
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
        Value = -36522d
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
        Value = -36522d
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
        Value = -36522d
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
        Value = -36522d
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NA'
        ParamType = ptUnknown
        Value = 0
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
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'DOCPACK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
        Value = '-'
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN_E'
        ParamType = ptUnknown
        Value = '-'
      end
      item
        DataType = ftString
        Name = 'INN_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP_E'
        ParamType = ptUnknown
        Value = '-'
      end
      item
        DataType = ftString
        Name = 'KPP_E'
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
        Name = 'INN_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
        Value = 0.000000000000000000
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
        Value = 0.000000000000000000
      end
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
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
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataTR_ID: TFloatField
      FieldName = 'TR_ID'
    end
    object dsDataNTR: TStringField
      FieldName = 'NTR'
      Size = 1500
    end
  end
  object dsPayerList: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    ReadOnly = False
    SQL.Strings = (
      'select column_value id'
      'from table('
      '           p_payment_helper.getrestsubject'
      '            ('
      '              :payer_id'
      
        '             ,nvl((select doc_date from fdc_document_lst where i' +
        'd = :declid), sysdate)'
      
        '             ,(select nvl(broker_id,0) from fdc_custom_decl_lst ' +
        'where id = :declid)'
      '            )'
      '          )')
    Left = 144
    Top = 182
    ParamData = <
      item
        DataType = ftFloat
        Name = 'payer_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'declid'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'declid'
        ParamType = ptUnknown
      end>
  end
end
