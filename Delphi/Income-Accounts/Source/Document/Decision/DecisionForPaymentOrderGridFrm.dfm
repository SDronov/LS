inherited DecisionForPaymentOrderGridForm: TDecisionForPaymentOrderGridForm
  Left = 308
  Top = 254
  Caption = 'DecisionForPaymentOrderGridForm'
  PixelsPerInch = 96
  TextHeight = 13
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
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 92
        end
        inherited edtNomer: TcxTextEdit
          Width = 92
        end
        inherited edtCurrency: TcxTextEdit
          Width = 92
        end
        inherited edtFromDate: TcxDateEdit
          Width = 92
        end
        inherited edtToDate: TcxDateEdit
          Width = 92
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 92
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 92
        end
        inherited edtKPP: TcxTextEdit
          Width = 92
        end
        inherited edtPayCode: TcxTextEdit
          Width = 92
        end
        inherited edtDescript: TcxMemo
          Width = 161
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.sysname                 AS state_sysname'
      '      ,s.name                    AS state_name'
      '      ,t.REST_SUMMA - t.LOCKED_SUMMA AS AVAIL_SUMMA'
      '      ,0                         AS relation_id'
      '      ,0                         AS ak'
      '      ,'#39'N'#39'                       AS IS_ARCHIVE'
      '  from fdc_Payment_Order_Lst t,'
      '       (select payment_id'
      '        from fdc_reserved_payment r'
      '        where r.doc_id = :ID) v,'
      '       fdc_state_lst s'
      ' where s.ID(+) = t.state_id'
      '   and v.payment_id = t.id'
      
        '   and (:NA is null or (:NA = 1 and PAYER_ID is null) or (:NA = ' +
        ' 2 and SUMMA is null))'
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
      '/*$p#PAY_CODE#*/ and  ((PAY_TYPE_CODE like  :PAY_CODE))'
      'and rownum <=:MaxRecordCount')
  end
  object odsGetSumBlock: TOracleDataSet
    SQL.Strings = (
      'select nvl(sum(l.summa),0) as summa'
      '  from FDC_RESERVED_PAYMENT_LST l'
      ' where l.decision_id = :ID'
      '   and l.edate is null'
      ''
      '/*'
      'select p.summa -'
      '       (select nvl(sum(l.summa),0) summa'
      '        from FDC_RESERVED_PAYMENT_LST l'
      '        where l.doc_id = p.id '
      '          and l.edate is null) '
      '          as summa'
      'FROM fdc_decision_for_lst p'
      '        '
      'WHERE p.Id  = :ID'
      '*/')
    Variables.Data = {0300000001000000030000003A4944030000000000000000000000}
    Session = MainData.Session
    Left = 408
    Top = 306
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 136
    Top = 192
    object sqlUnLockSumPO: TsqlOp
      SQL.Strings = (
        'begin'
        '    for p in (select id '
        '              from fdc_reserved_payment_lst d '
        '              where  d.doc_id=:DECISION_ID '
        '                 and d.payment_id=:pId ) loop'
        '       p_reserve.remove(pid => p.Id);'
        '    end loop;'
        'end;')
    end
    object sqlCreateRel: TsqlOp
      SQL.Strings = (
        'declare'
        'i integer;'
        'begin'
        '   for    '
        '   i := fdc_valueref_add('
        '          pObject_Type_SysName => '#39'ValueRef'#39
        '         ,pName                => '#39#39
        '         ,pSysName             => '#39#39
        '         ,pIsSystem            => 0'
        '         ,pOwner_Object_Id     => :pDecId'
        '         ,pRef_Object_Id       => :pPaymentId'
        '        );'
        'end;')
    end
  end
end
