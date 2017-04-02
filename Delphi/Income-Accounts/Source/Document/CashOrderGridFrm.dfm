inherited CashOrderGridForm: TCashOrderGridForm
  Left = 212
  Top = 196
  Height = 552
  Caption = 'CashOrderGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 500
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
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
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 497
  end
  inherited pnlWorkspace: TPanel
    Height = 471
    inherited splSearchCriteria: TSplitter
      Height = 471
    end
    inherited pnlSearchCriteria: TPanel
      Height = 471
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 451
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 80
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited btnSearch: TcxButton
          Top = 420
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
          Height = 0
          Width = 106
        end
        inherited btnSearchClear: TcxButton
          Top = 391
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
      Height = 471
      inherited grdData: TcxGrid
        Height = 471
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
            BeginGroup = True
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 151
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
        DataType = ftString
        Name = 'KBK'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*, s.sysname state_sysname, s.name state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AS AVAIL_SUMMA'
      '      ,0                         AS ak'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      'from fdc_Payment_Order_Lst t,'
      'fdc_object_relation_lst r,'
      'fdc_state_lst s where s.ID(+)=t.state_id'
      
        'and (:NA is null or (:NA = 1 and PAYER_ID is null)or (:NA =  2 a' +
        'nd SUMMA is null))'
      '/*$p#name#*/   and upper(t.name) like upper(:name)'
      '/*$p#INN#*/   and (t.payer_inn like :INN)'
      '/*$p#KPP#*/   and (t.payer_kpp like :KPP)'
      
        '/*$p#DOC_NO#*/   and (t.doc_no like :DOC_NO or t.doc_no2 like :D' +
        'OC_NO)'
      '/*$p#CURR#*/   and (t.curr_code like :CURR)'
      '/*$p#FROM_DATE#*/   and (t.doc_date >= :FROM_DATE)'
      '/*$p#TO_DATE#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#SUM_MIN#*/   and (t.doc_summa >= :SUM_MIN)'
      '/*$p#SUM_MAX#*/   and (t.doc_summa <= :SUM_MAX)'
      '/*$p#CURRENCY_ID#*/   and t.CURRENCY_ID = :CURRENCY_ID'
      '/*$p#DESCRIPT#*/   and t.DESCRIPT like :DESCRIPT'
      '/*$p#PAY_CODE#*/ and  ((PAY_TYPE_CODE like  :PAY_CODE))'
      'and (1=1 or ((:REST_SUMMA is null or REST_SUMMA >=  :REST_SUMMA)'
      'and  REST_SUMMA - LOCKED_SUMMA>= NVL(:AVAIL_SUMMA, 0)))'
      'and rownum <=:MaxRecordCount'
      'and t.id = r.Rel_Object_id and r.Object_ID=:AGGRPAY_ID')
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
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AGGRPAY_ID'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 32
    Top = 126
    object sqlRelAdd: TsqlOp
      SQL.Strings = (
        'declare'
        ' x number;'
        ' rep varchar2(4000);'
        'begin'
        ''
        
          '     x := fdc_paymentorderrelation_add(pObjectID      => :OBJ_ID' +
          ','
        
          '                                            pRelObjectId   => :R' +
          'EL_OBJ_ID,'
        
          '                                            pSumma         => nu' +
          'll,'
        '                                            pErrorOrReport => 1,'
        
          '                                            pReport        => re' +
          'p);'
        ''
        'end;')
    end
    object sqlRelDel: TsqlOp
      SQL.Strings = (
        'declare'
        ' pID integer;'
        ' lv_Sum fdc_payment_order.summa%TYPE;'
        ' lv_Conf NUMBER;'
        'BEGIN'
        '  SELECT p.SUMMA, t.ID'
        '    INTO lv_Sum, lv_Conf '
        '    FROM fdc_po_lst p, fdc_po_confirm_lst t'
        '    WHERE p.id = :OBJ_ID'
        '      AND t.CONFIRMED_PAY_ID(+) = p.id;'
        '  IF lv_Sum IS NOT NULL OR'
        '     lv_Conf IS NOT NULL THEN'
        
          '    fdc_util.Abort('#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086' '#1080#1089#1082#1083#1102#1095#1080#1090#1100' '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1088#1076#1077#1088' '#1080#1079' '#1087#1086#1076#1090#1074 +
          #1077#1088#1078#1076#1077#1085#1085#1086#1075#1086' '#1089#1091#1084#1084#1072#1088#1085#1086#1075#1086' '#1087#1083#1072#1090#1077#1078#1072'!'#39');   '
        '  END IF;       '
        ''
        ' select id'
        ' into pID'
        ' from fdc_object_relation_lst '
        ' where typesysname = '#39'PaymentOrderRelation'#39' and'
        '       object_id = :OBJ_ID and'
        '       rel_object_id = :REL_OBJ_ID and rownum = 1;   '
        ' fdc_Object_Relation_Del(pID);'
        'end;')
    end
  end
end
