inherited qBudgetPaysForm: TqBudgetPaysForm
  Caption = #1055#1083#1072#1090#1077#1078#1080' '#1074' '#1073#1102#1076#1078#1077#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited edtDateTo: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 394
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
  object qList: TQueryList
    Left = 264
    Top = 32
    object qSum_TPO: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT to_char(nvl(SUM(bp.summa), 0),:fmt)'
        '   into :Result'
        '  FROM fdc_rep_budget_pays_lst bp, fdc_tpo_lst t'
        '  WHERE t.id = bp.decl_id'
        '    AND bp.code = '#39'1010'#39
        
          '    AND bp.payment_date BETWEEN trunc(:DATE_TO, '#39'YYYY'#39') AND :DAT' +
          'E_TO'
        '    AND t.regim = :REGIM;'
        'END;')
    end
    object qSum_Decl: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT to_char(nvl(SUM(bp.summa), 0),:fmt)'
        '    into :Result'
        '  FROM fdc_rep_budget_pays_lst bp, fdc_custom_decl t'
        '  WHERE t.id = bp.decl_id'
        '    AND bp.code = '#39'1010'#39
        
          '    AND bp.payment_date BETWEEN trunc(:DATE_TO, '#39'YYYY'#39') AND :DAT' +
          'E_TO'
        '    AND t.g011 = :REGIM;'
        'END;')
    end
    object qSum_PayType: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT to_char(nvl(SUM(bp.summa), 0),:fmt)'
        '    into :Result'
        '  FROM fdc_rep_budget_pays_lst bp'
        
          '  WHERE bp.payment_date BETWEEN trunc(:DATE_TO, '#39'YYYY'#39') AND :DAT' +
          'E_TO'
        '    AND bp.code = :PAY_TYPE;'
        'END;')
    end
  end
end
