inherited PaybackPaymentOrderGridForm: TPaybackPaymentOrderGridForm
  Left = 397
  Top = 168
  Caption = 'PaybackPaymentOrderGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
        inherited edtDescript: TcxMemo
          Width = 83
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
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
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAYMENT_SUMMA
            end>
          inherited grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            Position.ColIndex = 36
          end
          inherited grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          object grdDataDBBandedTableViewPAYMENT_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Styles.Content = MainData.stlSumByDoc
            Styles.Footer = MainData.stlSumByDoc
            Styles.Header = MainData.stlSumByDoc
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
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
    inherited cmbxViewMode: TdxBarCombo
      Text = #1042#1089#1077
      ItemIndex = 1
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        SourceParamName = 'CURRENCY_ID'
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
        DataType = ftInteger
        Name = 'IS_UPDATABLE'
        ParamType = ptUnknown
        SourceParamName = 'IS_UPDATABLE'
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        SourceParamName = 'ID'
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,t.doc_number AS doc_no'
      '      ,to_number(null)/*t.payer_id*/   AS subject_id'
      '      ,s.sysname state_sysname'
      '      ,s.name state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AVAIL_SUMMA'
      '      ,to_number(null) as relation_id'
      '      ,v.summa as payment_summa'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,0 AS ak'
      '  from fdc_po_credit_lst_all t,'
      '       (select sum(charge_summa) summa,'
      '               payment_id'
      '          from fdc_payment_deduction_lst'
      '         where decl_id = :ID'
      '         group by payment_id) v,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and t.id = v.payment_id'
      
        '   and (:NA is null or (:NA = 1 and t.PAYER_ID is null) or (:NA ' +
        '=  2 and t.SUMMA is null))'
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
      '/*$p#DESCRIPT#*/   and t.DESCRIPT like :DESCRIPT'
      '/*$p#PAY_CODE#*/ and  ((t.PAY_TYPE_CODE like  :PAY_CODE))'
      'and rownum <=:MaxRecordCount'
      'union all'
      'select t.*'
      '      ,t.doc_number AS doc_no'
      '      ,to_number(null)/*t.payer_id*/   AS subject_id'
      '      ,s.sysname state_sysname'
      '      ,s.name state_name'
      '      ,REST_SUMMA - LOCKED_SUMMA AVAIL_SUMMA'
      '      ,to_number(null) as relation_id'
      '      ,v.summa as payment_summa'
      
        '      ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_arch' +
        'ive'
      '      ,0 AS ak'
      '  from fdc_po_credit_lst_all t,'
      '       (select sum(l.summa) summa,'
      '               l.payment_id'
      '          FROM FDC_PAYBACK_RESERVE_LST l'
      '          WHERE l.decision_id = :ID'
      '           and  l.edate is null  '
      '         group by payment_id) v,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and t.id = v.payment_id'
      
        '   and (:NA is null or (:NA = 1 and t.PAYER_ID is null) or (:NA ' +
        '=  2 and t.SUMMA is null))'
      '/*$p#name#*/   and upper(t.name) like upper(:name)'
      '/*$p#INN#*/   and (t.payer_inn like :INN)'
      '/*$p#KPP#*/   and (t.payer_kpp like :KPP)'
      
        '/*$p#DOC_NO#*/   and (t.doc_no like :DOC_NO or t.doc_no2 like :D' +
        'OC_NO)'
      '/*$p#CURR#*/   and (t.curr_code like :CURR)'
      '/*$p#FROM_DATE#*/   and (t.doc_date >= :FROM_DATE)'
      '/*$p#TO_DATE#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#SUM_MIN#*/   and (t.doc_summa >= :SUM_MIN)'
      '/*$p#SUM_MAX#*/   and (t.doc_summa <= :SUM_MAX)'
      '/*$p#DESCRIPT#*/   and t.DESCRIPT like :DESCRIPT'
      '/*$p#PAY_CODE#*/ and  ((t.PAY_TYPE_CODE like  :PAY_CODE))'
      'and rownum <=:MaxRecordCount')
    Left = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
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
      end
      item
        DataType = ftFloat
        Name = 'ID'
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
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
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
    object dsDataPAYMENT_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'PAYMENT_SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  inherited srcData: TDataSource
    Top = 127
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 64
    Top = 192
    object sqlAddCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_payment_helper.AddCharge(pDocId         => :PAYBACK_ID'
        
          '                            ,pPayObjectType => '#39'DecPaybackPaymen' +
          't'#39
        '                            ,pPayTypeId     => null'
        '                            ,pCurrId        => :CURR_ID'
        '                            ,pSumma         => :SUMMA);'
        'end;')
    end
    object sqlGetCurrency: TsqlOp
      SQL.Strings = (
        'declare'
        '  vcode number;'
        'begin'
        
          '  select id into vcode from fdc_nsi_currency_lst where code = :C' +
          'ODE;'
        '  :Result := vcode;'
        'end;')
    end
    object sqlDelCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '    fdc_dec_payback_payments_del(pId => :DECISION_ID);'
        '    '
        ''
        'end;')
    end
    object sqlUpdSumma: TsqlOp
      SQL.Strings = (
        'begin'
        '  update'
        '    fdc_decision_payback f'
        '  set'
        '    f.Summa = (select sum(charge_summa) summa'
        '               from fdc_payment_deduction_lst'
        '              where decl_id = :DECISION_ID)'
        '  where'
        '   f.id = :DECISION_ID;'
        'end;')
      DataSet = dsData
    end
    object sqlLockSumPO: TsqlOp
      SQL.Strings = (
        'declare'
        'i number;'
        'begin'
        
          '  for p in (select  nvl(sum(d.charge_summa),0)-nvl(sum(r.summa),' +
          '0) summa,'
        '                   d.payment_id'
        '            from fdc_payment_deduction_lst d'
        
          '            left outer join fdc_reserved_payment r on r.doc_id =' +
          ' d.decl_id and r.edate is null'
        '            where d.decl_id = :DECISION_ID'
        '            group by d.payment_id'
        
          '            having nvl(sum(d.charge_summa),0)-nvl(sum(r.summa),0' +
          ')>0'
        '            ) loop   '
        
          '  i := p_reserve.add(   pdoctypesysname => '#39'ReservedPayment.Retu' +
          'rn'#39','
        '                           pdocnumber => null,'
        '                           pdocdate => null,'
        '                           ppaymentid => p.payment_id,'
        '                           psumma => p.summa,'
        '                           ppaymentdate => sysdate,'
        '                           preasoncode => '#39'L'#39','
        '                           pdocid => :DECISION_ID,'
        '                           pdockey => null,'
        '                           pbegindate => sysdate,'
        '                           penddate => null,'
        '                           pprevid => null);'
        '  end loop;'
        'end;')
    end
    object sqlUnLockSumPO: TsqlOp
      SQL.Strings = (
        'begin'
        '    for p in (select id '
        '              from fdc_reserved_payment_lst d '
        '              where  d.doc_id=:DECISION_ID '
        '                 and d.payment_id=:pId ) loop'
        '       p_reserve.remove(pid => p.Id);'
        '    end loop;'
        
          '/*    for p in (select id from fdc_reserved_payment_lst d where ' +
          ' d.doc_id=:DECISION_ID) loop'
        '       p_reserve.unlock(pid => p.id,'
        '                        penddate => sysdate);'
        '    end loop;*/'
        'end;')
    end
    object sqlStartPay: TsqlOp
      SQL.Strings = (
        'begin'
        
          '    p_payment_helper.prepare( pPayObjectType => '#39'DecPaybackPayme' +
          'nt'#39' );'
        'end;')
    end
    object sqlSetReserveSumma: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  UPDATE fdc_decision_payback d'
        '     SET d.summa = ( select nvl(sum(l.summa),0) '
        '                       from FDC_PAYBACK_RESERVE_LST l'
        '                      where l.decision_id = :DECISION_ID'
        '                            and l.edate is null )'
        '   WHERE d.id = :DECISION_ID;'
        'END;')
    end
  end
  object odsGetSumBlock: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(l.summa),0) as summa'
      '  from FDC_PAYBACK_RESERVE_LST l'
      ' where l.decision_id = :ID'
      '   and l.edate is null'
      ''
      '/*'
      'select p.summa -'
      '       (select nvl(sum(l.summa),0) summa'
      '        from FDC_PAYBACK_RESERVE_LST l'
      '        where l.decision_id = p.id'
      '          and l.edate is null)'
      '          as summa'
      'FROM fdc_decision_payback_lst p'
      ''
      'WHERE p.Id  = :ID'
      '*/')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {04000000010000000500000053554D4D41010000000000}
    Session = MainData.Session
    Left = 408
    Top = 306
    object odsGetSumBlockSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
  end
end
