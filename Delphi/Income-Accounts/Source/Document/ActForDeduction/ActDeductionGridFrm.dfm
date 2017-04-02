inherited ActDeductionGridForm: TActDeductionGridForm
  Left = 270
  Top = 133
  Width = 1072
  Height = 700
  Caption = #1040#1082#1090#1099' '#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 648
    Width = 1064
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 759
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 759
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 759
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 759
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 972
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 645
    Width = 1064
  end
  inherited pnlWorkspace: TPanel
    Width = 1064
    Height = 619
    inherited splSearchCriteria: TSplitter
      Height = 619
    end
    inherited pnlSearchCriteria: TPanel
      Height = 619
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 599
        inherited btnSearch: TcxButton
          Left = 117
          Top = 568
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 117
          Top = 539
        end
        inherited edtDocDateFrom: TcxDateEdit
          Width = 145
        end
        inherited edtDocDateTo: TcxDateEdit
          Width = 145
        end
        inherited edtDocNumber: TcxMaskEdit
          Width = 183
        end
        inherited cbIsActive: TcxComboBox
          Width = 183
        end
        inherited edtActDateFrom: TcxDateEdit
          Width = 145
        end
        inherited edtActDateTo: TcxDateEdit
          Width = 145
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 859
      Height = 619
      inherited grdData: TcxGrid
        Width = 859
        Height = 619
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          object grdDataDBBandedTableViewStateName: TcxGridDBBandedColumn [5]
            DataBinding.FieldName = 'STATENAME'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SIGN_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCYCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCYCODE'
            MinWidth = 10
            Width = 45
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 75
            Position.BandIndex = 1
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Width = 104
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSubjectName: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECTNAME'
            Width = 183
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'/'#1076#1086#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1099
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'/'#1076#1086#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1072#1082#1090#1099
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT a.*'
      '      ,c.code  AS CurrencyCode'
      '      ,s.INN'
      '      ,s.KPP'
      '      ,s.Name  AS SubjectName'
      '      ,st.Name AS StateName'
      '      ,a.is_ts'
      '  FROM fdc_act_deduction_lst a'
      '      ,fdc_nsi_currency_lst  c'
      '      ,fdc_subject_lst       s'
      '      ,fdc_object_lst        st'
      
        ' WHERE (:Name          IS NULL OR UPPER( a.name       ) LIKE UPP' +
        'ER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( a.doc_number ) LIKE UPP' +
        'ER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR a.doc_date >= :doc_date_from  ' +
        '     )'
      
        '   AND (:doc_date_to   IS NULL OR a.doc_date <= :doc_date_to    ' +
        '     )'
      
        '   AND (:is_active     IS NULL OR a.is_active = :is_active      ' +
        '     )'
      
        '   AND (:act_date_from IS NULL OR a.activation_date >= :act_date' +
        '_from)'
      
        '   AND (:act_date_to   IS NULL OR a.activation_date <= :act_date' +
        '_to  )'
      '   AND c.ID = a.CURRENCY_ID'
      '   AND s.ID = a.SUBJECT_ID'
      '   AND st.id = a.state_id')
    SourceServerObject = 'FDC_ACT_DEDUCTION_LST'
    object dsDataSIGN_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1080
      FieldName = 'SIGN_DATE'
    end
    object dsDataCURRENCYCODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataSUBJECTNAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECTNAME'
      Size = 1500
    end
    object dsDataSTATENAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATENAME'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      DisplayWidth = 20
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 269
    Top = 194
    object sqlGetActPays: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  SELECT a.Id, a.DOC_NUMBER, a.DOC_DATE, a.STATE_ID, S.SYSNAME a' +
          's State, S.NAME AS StateName'
        
          '    INTO :act_id, :doc_number, :doc_date, :state_id, :state, :St' +
          'ateName'
        '    FROM fdc_act_ded_pays_lst a, fdc_state_lst s'
        '   WHERE a.STATE_ID    = s.ID(+)'
        '     AND a.CURRENCY_ID = :CurrencyId'
        '     AND a.SUBJECT_ID  = :SubjectId'
        '     AND a.is_ts       = :IsTS'
        '     AND a.DOC_DATE    = trunc(SYSDATE)'
        '     AND rownum < 2;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :act_id := -1;'
        'END;')
    end
    object sqlCreateNewActPays: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  :result := p_act_ded_pays.Add('
        '      pSubjectId  => :SubjectId'
        '     ,pCurrencyId => :CurrencyId'
        '     ,pIsTS       => :IsTS'
        '    );'
        'END;')
    end
    object sqlAddInActPays: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  p_act_ded_pays.addpays(pactid => :ActId);'
        'END;')
    end
    object sqlGetActDeposit: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  SELECT a.Id, a.DOC_NUMBER, a.DOC_DATE, a.STATE_ID, S.SYSNAME a' +
          's State, S.NAME AS StateName'
        
          '    INTO :act_id, :doc_number, :doc_date, :state_id, :state, :St' +
          'ateName'
        '    FROM fdc_act_ded_deposit_lst a, fdc_state_lst s'
        '   WHERE a.STATE_ID    = s.ID(+)'
        '     AND a.CURRENCY_ID = :CurrencyId'
        '     AND a.SUBJECT_ID  = :SubjectId'
        '     AND a.is_ts       = :IsTS'
        '     AND a.DOC_DATE    = trunc(SYSDATE)'
        '     AND rownum < 2;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :act_id := -1;'
        'END;')
    end
    object sqlCreateNewActDeposit: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  :result := p_act_ded_deposit.Add('
        '      pSubjectId  => :SubjectId'
        '     ,pCurrencyId => :CurrencyId'
        '     ,pIsTS       => :IsTS'
        '    );'
        'END;')
    end
    object sqlAddInActDeposits: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  p_act_ded_deposit.AddDeposits(pactid => :ActId);'
        'END;')
    end
    object sqlGetActOverPay: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  SELECT a.Id, a.DOC_NUMBER, a.DOC_DATE, a.STATE_ID, S.SYSNAME a' +
          's State, S.NAME AS StateName'
        
          '    INTO :act_id, :doc_number, :doc_date, :state_id, :state, :St' +
          'ateName'
        '    FROM fdc_act_ded_overpay_lst a, fdc_state_lst s'
        '   WHERE a.STATE_ID    = s.ID(+)'
        '     AND a.CURRENCY_ID = :CurrencyId'
        '     AND a.SUBJECT_ID  = :SubjectId'
        '     AND a.is_ts       = :IsTS'
        '     AND a.DOC_DATE    = trunc(SYSDATE)'
        '     AND rownum < 2;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :act_id := -1;'
        'END;')
    end
    object sqlCreateNewActOverPay: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  :result := p_act_ded_overpay.Add('
        '      pSubjectId  => :SubjectId'
        '     ,pCurrencyId => :CurrencyId'
        '     ,pIsTS       => :IsTS'
        '    );'
        'END;')
    end
    object sqlAddInActOverPays: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  p_act_ded_overpay.AddOverPays(pactid => :ActId);'
        'END;')
    end
  end
  object ds3yearReserv: TOracleDataSet
    SQL.Strings = (
      'SELECT r.payer_id'
      '      ,r.currency_id'
      '      ,r.curr_code'
      '      ,s.Name AS PayerName'
      '      ,r.is_ts'
      '  FROM fdc_reserved_3year_lst r, fdc_subject_lst s'
      ' WHERE r.edate IS NULL -- '#1074#1089#1077' '#1072#1082#1090#1080#1074#1085#1099#1077' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
      '   AND r.doc_id IS NULL -- '#1085#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074' '#1072#1082#1090#1099
      '   AND r.payer_id = s.ID (+)'
      '   and r.is_ts = '#39'N'#39
      'GROUP BY r.payer_id, r.currency_id, r.curr_code, s.Name, r.is_ts')
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 333
    Top = 194
  end
  object dsDeposit: TOracleDataSet
    SQL.Strings = (
      'SELECT distinct'
      '   po.payer_id    AS payer_id'
      '   ,po.currency_id AS currency_id'
      '   ,c.code         AS curr_code'
      '   ,s.Name         AS PayerName'
      '   ,pd.is_ts'
      ' FROM '
      '   fdc_tr_lst t'
      '   join fdc_payment_deduction_lst pd on pd.decl_id = t.id'
      '   join fdc_payment_order_lst po on po.id = pd.payment_id'
      '   left join fdc_subject_lst s on s.id = po.payer_id'
      '   left join fdc_nsi_currency_lst c on c.id = po.currency_id'
      'WHERE 1 = 1'
      
        '    and add_months( p_tr.GetExecDate( t.id ), 36 ) < trunc( SYSD' +
        'ATE )'
      '    and p_tr.GetRest( t.id ) > 0'
      '    and pd.is_ts = '#39'N'#39
      
        '    and ( '#39'N'#39' = p_params.InExcludedDeductKbk( pd.kbkcode ) )    ' +
        ' ')
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 333
    Top = 242
  end
  object dsOverPay: TOracleDataSet
    SQL.Strings = (
      'select distinct '
      
        ' r.payer_id, r.currency_id, c.code as curr_code, o.name AS Payer' +
        'Name, r.is_ts'
      'from'
      ' fdc_advice_reserve_lst r '
      ' join fdc_object o on o.id = r.payer_id'
      ' left join fdc_nsi_currency_lst c on c.id = r.currency_id '
      ''
      'where 1=1  '
      ' and r.is_ts = '#39'N'#39
      
        ' and ( '#39'N'#39' = p_params.InExcludedDeductKbk( (select code from fdc' +
        '_kbk_dict_lst where id = r.kbkcode_id) ) )'
      ' and r.edate IS NULL'
      
        ' and ( r.state_id is null  or  r.state_id =  fdc_object_get_bysy' +
        'sname('#39'State'#39', '#39'Advice.NoDecision'#39') ) '
      ' and ( r.doc_id is null or '
      
        '       '#39'ActDeductionOverPay'#39' <> (  SELECT d.typesysname FROM fdc' +
        '_document_lst d WHERE d.id = r.doc_id  ) ) '
      ''
      
        ' and ( r.payment_date < add_months( trunc( SYSDATE ) , -36 )   -' +
        '- -36 '#1074#1099#1095#1080#1090#1072#1077#1084' 3 '#1043#1054#1044#1040' '#1086#1090' '#1089#1077#1075#1086#1076#1085#1103
      '       or exists ('
      '          select 1 from fdc_custom_decl_lst cd'
      '           where'
      
        '            cd.ID = r.doc_id and cd.decision_code in ('#39'81'#39', '#39'90'#39 +
        ')'
      
        '            and r.bdate <  add_months( trunc( SYSDATE ), -12 )  ' +
        '-- -12 '#1074#1099#1095#1080#1090#1072#1077#1084' '#1043#1054#1044' '#1086#1090' '#1089#1077#1075#1086#1076#1085#1103
      '          )'
      '       or exists ('
      
        '          select 1 from fdc_payment_deduction_lst d join fdc_dec' +
        'l_charge dc on dc.decl_id = d.decl_id join fdc_type_correction_l' +
        'st tc on tc.id=dc.change_reason_id'
      '          where 1=1'
      '            and tc.CODE = '#39'40'#39
      '            and d.decl_id = r.doc_id'
      '            and '#39'PaymentDeduction.Correct'#39' = d.TypeSysName'
      
        '            and  r.bdate <  add_months( trunc( SYSDATE ), -12 ) ' +
        ') -- -12 '#1074#1099#1095#1080#1090#1072#1077#1084' '#1043#1054#1044' '#1086#1090' '#1089#1077#1075#1086#1076#1085#1103
      '     )')
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 333
    Top = 306
  end
end
