inherited CashOrderByBankGridForm: TCashOrderByBankGridForm
  Left = 218
  Caption = #1050#1072#1089#1089#1086#1074#1099#1077' '#1086#1088#1076#1077#1088#1072' '#1080#1079' '#1082#1072#1089#1089' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 609
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 609
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 609
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 609
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 822
      Top = 3
      Width = 75
      Height = 21
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
          Width = 105
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
          Width = 106
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
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
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
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
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAY_TYPE_CODE
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
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'CUSTOM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KBK'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM ('
      ''
      'SELECT'
      '     t.id'
      '    ,t.name'
      '    ,t.shortname'
      '    ,t.object_Type_id'
      '    ,t.state_id'
      '    ,t.accesslevel'
      '    ,t.sysname'
      '    ,t.descript'
      '    ,t.note'
      '    ,t.owner_object_id'
      '    ,t.typename'
      '    ,t.typesysname'
      '    ,t.objectkindlist'
      '    ,t.doc_number AS doc_no'
      '    ,t.doc_date'
      '    ,t.exec_date'
      '    ,t.payer_id'
      '    ,t.summa'
      '    ,t.kbk'
      '    ,t.currency_id'
      '    ,t.payer_name'
      '    ,t.payer_inn'
      '    ,t.curr_name'
      '    ,t.curr_code'
      '    ,t.doc_summa'
      '    ,t.rest_summa'
      '    ,t.doc_no2'
      '    ,t.doc_date2'
      '    ,t.DestCustomsCode'
      '    ,t.payer_kpp'
      '    ,t.coming_date'
      '    ,t.assure_date'
      '    ,t.pay_type_code'
      '    ,t.locked_summa'
      '    ,t.income_date'
      '    ,CAST(NULL AS number) as subject_id'
      '    ,t.activation_date'
      '    ,decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '    ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archiv' +
        'e'
      
        '          ,(select s.sysname from fdc_state_lst s where s.id = t' +
        '.state_id) state_sysname'
      
        '          ,(select s.name from fdc_state_lst s where s.id = t.st' +
        'ate_id) state_name'
      '          ,REST_SUMMA - LOCKED_SUMMA AS AVAIL_SUMMA'
      '          ,0                         AS ak'
      '          ,t.is_ts'
      '  FROM fdc_po_cashorder_lst t'
      '  WHERE (   :NA IS NULL'
      '         OR (    :NA =  1'
      '             AND PAYER_ID IS NULL)'
      '         OR (    :NA =  2'
      '             AND SUMMA IS NULL))'
      '/*$p#name#*/        AND upper(t.payer_name) LIKE upper(:name)'
      '/*$p#INN#*/         AND (t.payer_inn LIKE :INN)'
      '/*$p#KPP#*/         AND (t.payer_kpp LIKE :KPP)'
      
        '/*$p#DOC_NO#*/      AND (t.doc_number LIKE :DOC_NO OR t.doc_no2 ' +
        'LIKE :DOC_NO)'
      '/*$p#CURR#*/        AND (t.curr_code LIKE :CURR)'
      '/*$p#FROM_DATE#*/   AND (t.doc_date >= :FROM_DATE)'
      '/*$p#TO_DATE#*/     AND (t.doc_date <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#SUM_MIN#*/     AND (t.doc_summa >= :SUM_MIN)'
      '/*$p#SUM_MAX#*/     AND (t.doc_summa <= :SUM_MAX)'
      '/*$p#CURRENCY_ID#*/ AND t.CURRENCY_ID = :CURRENCY_ID'
      '/*$p#DESCRIPT#*/    AND t.DESCRIPT LIKE :DESCRIPT'
      '/*$p#PAY_CODE#*/    AND ((PAY_TYPE_CODE LIKE :PAY_CODE))'
      '    AND (:REST_SUMMA IS NULL OR REST_SUMMA >= :REST_SUMMA)'
      '    AND t.TypeSysName <> '#39'AggrPayment'#39
      '    AND t.kbk = :KBK'
      '    AND (   (    :BANK_ID <> :CUSTOM_ID'
      '             AND t.cashdesk_id IN (SELECT cd.id'
      '                                     FROM fdc_cashdesk_lst cd'
      
        '                                     WHERE cd.owner_object_id = ' +
        '(SELECT id FROM fdc_bankforcash_lst bc WHERE bc.bank_id = :BANK_' +
        'ID)'
      '                                   ) )'
      '         OR (    :BANK_ID = :CUSTOM_ID'
      
        '             AND t.cashdesk_id IN (SELECT id FROM fdc_customcash' +
        'desk_lst) )'
      '        )'
      
        '    AND NOT EXISTS(SELECT * FROM fdc_object_relation_lst r WHERE' +
        ' r.typesysname = '#39'PaymentOrderRelation'#39' AND r.Rel_Object_id=t.id' +
        ')'
      ''
      ') WHERE rownum <= :MaxRecordCount')
    ParamData = <
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
        DataType = ftString
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
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KBK'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CUSTOM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CUSTOM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 48
    Top = 198
    object sqlGetCustomID: TsqlOp
      SQL.Strings = (
        'begin'
        
          ':result := p_pays_loader.FindPayer(fdc_ValueString_Sys_Get('#39'Cust' +
          'omINN'#39'),'
        '                  fdc_ValueString_Sys_Get('#39'CustomKPP'#39'));'
        'end;                  ')
    end
  end
end
