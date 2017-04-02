inherited PaymentOrderPaybackControlGridForm: TPaymentOrderPaybackControlGridForm
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 601
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 601
      end
      inherited pnlProgress: TPanel
        Width = 601
        inherited lblProgress: TcxLabel
          Width = 601
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 814
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
          Width = 109
        end
        inherited edtINN: TcxTextEdit
          Width = 109
        end
        inherited edtNomer: TcxTextEdit
          Width = 109
        end
        inherited edtCurrency: TcxTextEdit
          Width = 109
        end
        inherited edtFromDate: TcxDateEdit
          Width = 109
        end
        inherited edtToDate: TcxDateEdit
          Width = 109
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 109
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 109
        end
        inherited edtKPP: TcxTextEdit
          Width = 109
        end
        inherited edtPayCode: TcxTextEdit
          Width = 109
        end
        inherited edtDescript: TcxMemo
          Width = 178
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 109
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 109
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
              Column = grdDataDBBandedTableViewPAYER_ID
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewEXEC_DATE
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
              Column = grdDataDBBandedTableViewASSURE_DATE
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_DATE2
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewEXEC_DATE
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAYER_ID
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end>
          inherited grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewCUSTOMSFULLNAME: TcxGridDBBandedColumn
            Position.ColIndex = 38
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 47
          end
          inherited grdDataDBBandedTableViewPO_INN: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewPO_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewPO_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          inherited grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            Position.ColIndex = 29
          end
          inherited grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            Position.ColIndex = 17
          end
          inherited grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 39
          end
          inherited grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            Position.ColIndex = 41
          end
          inherited grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewDECISION_BIC: TcxGridDBBandedColumn
            Position.ColIndex = 36
          end
          inherited grdDataDBBandedTableViewDECISION_BANK_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 33
          end
          inherited grdDataDBBandedTableViewDECISION_CORR_ACCOUNT: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewDECISION_ACCOUNT: TcxGridDBBandedColumn
            Position.ColIndex = 30
          end
          inherited grdDataDBBandedTableViewLAST_DAYS: TcxGridDBBandedColumn
            Position.ColIndex = 40
          end
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          inherited grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 23
          end
          inherited grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            Position.ColIndex = 37
          end
          inherited grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 44
          end
          inherited grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            Position.ColIndex = 46
          end
          inherited grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            Position.ColIndex = 18
          end
          inherited grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          inherited grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 21
          end
          inherited grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 22
          end
          inherited grdDataDBBandedTableViewAIL_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 24
          end
          inherited grdDataDBBandedTableViewINCOMDE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 25
          end
          inherited columnIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 26
          end
          object grdDataDBBandedTableViewACTIVATION_DATE_Y: TcxGridDBBandedColumn [41]
            DataBinding.FieldName = 'ACTIVATION_DATE_Y'
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_LAST_DOC: TcxGridDBBandedColumn [42]
            DataBinding.FieldName = 'DATE_LAST_DOC'
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREG_RET_DOC_SEND: TcxGridDBBandedColumn [43]
            DataBinding.FieldName = 'REG_RET_DOC_SEND'
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          inherited colKBK: TcxGridDBBandedColumn
            Position.ColIndex = 54
          end
          inherited columnACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 27
          end
          inherited columnIS_ARCHIVE: TcxGridDBBandedColumn
            Position.ColIndex = 28
          end
          inherited grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Position.ColIndex = 42
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 51
          end
          inherited grdDataDBBandedTableViewDEBTS_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 53
          end
          inherited grdDataDBBandedTableViewDEBT_PAY_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 52
          end
          object grdDataDBBandedTableViewDATE_COURT: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
            DataBinding.FieldName = 'DATE_COURT'
            Position.BandIndex = 0
            Position.ColIndex = 50
            Position.RowIndex = 0
          end
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
            Item = btnDelete
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            Item = barEdtDays
            Visible = True
          end>
        Name = 'barTools'
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
      26
      0)
    inherited cmbxViewMode: TdxBarCombo
      Text = #1042#1089#1077
    end
    object barEdtDays: TdxBarSpinEdit
      Align = iaRight
      Caption = #1044#1085#1077#1081
      Category = 0
      Hint = #1044#1085#1077#1081
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      MaxValue = 30.000000000000000000
      MinValue = 1.000000000000000000
      Value = 5.000000000000000000
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select * from ('
      'select /*+ FIRST_ROWS */'
      '   t.ID'
      '  ,t.NAME'
      '  ,t.shortname'
      '  ,t.object_type_id'
      '  ,t.state_id'
      '  ,t.accesslevel'
      '  ,t.sysname'
      '  ,t.descript'
      '  ,t.owner_object_id'
      '  ,t.typename'
      '  ,t.typesysname'
      '  ,t.objectkindlist'
      '  ,t.operate_date'
      '  ,t.doc_number'
      '  ,t.is_active'
      '  ,t.activation_date'
      '  ,t.doc_no'
      '  ,t.doc_date'
      '  ,t.doc_no2'
      '  ,t.doc_date2'
      '  ,t.exec_date'
      '  ,t.payer_id'
      '  ,t.doc_summa'
      '  ,t.summa'
      '  ,t.KBKCode AS kbk'
      '  ,t.currency_id'
      '  ,t.cashdesk_id'
      '  ,t.cardnum'
      '  ,t.pay_type_id'
      '  ,t.agreement_id'
      '  ,t.pay_type_code'
      '  ,t.income_date'
      '  ,t.note'
      '  ,t.nref'
      '  ,t.payer_name'
      '  ,t.payer_inn'
      '  ,t.payer_kpp'
      '  ,t.cashdesk_name'
      '  ,t.curr_name'
      '  ,t.curr_code'
      '  ,t.rest_summa'
      '  ,t.locked_summa'
      '  ,t.COMING_DATE'
      '  ,t.ASSURE_DATE'
      '  ,t.descript2'
      '  ,t.SUBJECT_ID'
      '  ,t.po_name'
      '  ,t.po_inn'
      '  ,t.po_kpp'
      '  ,t.s_name'
      '  ,t.s_inn'
      '  ,t.s_kpp'
      '  ,s.sysname state_sysname'
      '  ,s.name state_name'
      '  ,REST_SUMMA - LOCKED_SUMMA AVAIL_SUMMA'
      '  ,0 AS ak'
      '  ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archive'
      '  ,t.dec_pay_id'
      '  ,t.decision_doc_no'
      '  ,t.decision_doc_date'
      '  ,t.decision_bic'
      '  ,t.decision_bank_name'
      '  ,t.decision_corr_account'
      '  ,t.decision_account'
      '  ,t.decision_personal_account'
      '  ,t.reg_ret_doc_no'
      '  ,t.reg_ret_doc_date'
      '  ,t.KBKCode'
      '  ,t.DestCustomsCode'
      '  ,t.CustomsFullName'
      '  ,TRUNC( COALESCE( t.decision_date_last_doc'
      '                   ,t.decision_app_date_income'
      '                   ,t.decision_app_date'
      
        '                   ,t.decision_doc_date ) ) + 30 - trunc( SYSDAT' +
        'E ) AS last_days'
      '  ,t.decision_date_last_doc AS date_last_doc'
      '  ,t.reg_ret_doc_send'
      '  ,t.activation_date_y'
      '  ,t.is_ts'
      '  ,t.debts_summa'
      '  ,t.debt_pay_summa'
      '  ,t.debt_peny_summa'
      '  ,t.debt_proc_summa'
      '  ,t.date_court'
      '  from fdc_payment_order_payback_lst t,'
      '       fdc_state_lst s'
      '  where s.ID  = t.state_id'
      
        '    AND nvl(:pDecId, 0)       = nvl(:pDecId, 0)       -- '#1048#1089#1087#1086#1083#1100#1079 +
        #1091#1077#1090#1089#1103' '#1074' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1081' '#1092#1086#1088#1084#1077
      
        '    AND nvl(:pack_id, 0)      = nvl(:pack_id, 0)      -- '#1048#1089#1087#1086#1083#1100#1079 +
        #1091#1077#1090#1089#1103' '#1074' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1081' '#1092#1086#1088#1084#1077
      
        '    AND nvl(:pTo, '#39'00000000'#39') = nvl(:pTo, '#39'00000000'#39') -- '#1048#1089#1087#1086#1083#1100#1079 +
        #1091#1077#1090#1089#1103' '#1074' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1081' '#1092#1086#1088#1084#1077
      
        '    AND nvl(:NA, 0)           = nvl(:NA, 0)           -- '#1048#1089#1087#1086#1083#1100#1079 +
        #1091#1077#1090#1089#1103' '#1074' '#1088#1086#1076#1080#1090#1077#1083#1100#1089#1082#1086#1081' '#1092#1086#1088#1084#1077
      
        '--    AND trunc( nvl(t.date_court,nvl( t.decision_date_last_doc,' +
        ' nvl(t.decision_app_date_income,nvl(t.decision_app_date,decision' +
        '_doc_date)) )) + 30 - trunc( SYSDATE ) ) <= :days'
      
        '    AND s.SysName NOT IN ( '#39'State.PayBack.Denial'#39', '#39'State.PayBac' +
        'k.Confirm'#39' )'
      '/*$p#name#*/      and (upper(t.payer_name) like upper(:Name))'
      '/*$p#inn#*/       and (t.payer_inn like :INN)'
      '/*$p#kpp#*/       and (t.payer_kpp like :KPP)'
      
        '/*$p#doc_no#*/    and (t.doc_no like :DOC_NO or t.doc_no2 like :' +
        'DOC_NO)'
      '/*$p#curr#*/      and (t.curr_code like :CURR)'
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#sum_min#*/   and (t.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   and (t.doc_summa <= :SUM_MAX)'
      
        '                  and (:CURRENCY_ID is null or t.CURRENCY_ID = :' +
        'CURRENCY_ID)'
      '/*$p#DESCRIPT#*/  and (t.DESCRIPT like :DESCRIPT)'
      
        '                  AND (:GL_SUBJECT_ID IS NULL OR t.PAYER_ID = :G' +
        'L_SUBJECT_ID)'
      ') where last_days <= :days AND rownum <= :MaxRecordCount'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pDecId'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pDecId'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pack_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pack_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'days'
        ParamType = ptInputOutput
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
        Name = 'CURRENCY_ID'
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
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'days'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataDATE_LAST_DOC: TDateTimeField [53]
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DATE_LAST_DOC'
    end
    object dsDataREG_RET_DOC_SEND: TDateTimeField [54]
      DisplayLabel = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
      FieldName = 'REG_RET_DOC_SEND'
    end
    object dsDataACTIVATION_DATE_Y: TDateTimeField [55]
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'ACTIVATION_DATE_Y'
    end
    object dsDataDATE_COURT: TDateTimeField
      FieldName = 'DATE_COURT'
      DisplayFormat = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
    end
  end
  inherited xlrReestr: TxlReport
    DataSources = <
      item
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
  end
end
