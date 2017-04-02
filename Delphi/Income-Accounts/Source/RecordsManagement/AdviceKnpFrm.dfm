inherited AdviceKnpForm: TAdviceKnpForm
  Left = 299
  Top = 234
  Caption = 'AdviceKnpForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Height = 235
          Width = 525
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 528
        end
        inherited edtLockSum: TcxDBCurrencyEdit
          Width = 537
        end
        inherited edtAvailSum: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtRestSum: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtTSSumma: TcxDBCurrencyEdit
          Left = 748
          Width = 121
        end
        inherited edtTSSummaRest: TcxDBCurrencyEdit
          Left = 830
        end
        inherited edtTSSummaLocked: TcxDBCurrencyEdit
          Left = 830
        end
        inherited edtTSSummaAvailable: TcxDBCurrencyEdit
          Left = 830
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 100
        end
        inherited edtDeclarant: TfdcObjectLinkEdit
          Width = 377
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 200
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 597
          Width = 121
        end
        inherited edtDocNUmber: TcxDBTextEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Left = 764
          Style.IsFontAssigned = True
        end
        inherited edtIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDecisionReturn: TAction
      Enabled = False
      Visible = False
    end
    inherited actDecisionReuse: TAction
      Enabled = False
      Visible = False
    end
    inherited actDecisionDebt: TAction
      Enabled = False
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
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 683
        FloatTop = 160
        FloatClientWidth = 103
        FloatClientHeight = 91
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
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = btnPrint
            Visible = True
          end
          item
            Item = bsiDecision
            Visible = True
          end
          item
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
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited bsiDecision: TdxBarSubItem
      Enabled = False
    end
    inherited bsiDecisionReuse: TdxBarSubItem
      Enabled = False
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select a.*'
      '      ,p_advice.GetAdviceSum( a.id )           AS summa'
      '      ,p_advice.GetAdviceRestSum( a.id )       AS RestSum'
      '      ,p_advice.GetAdviceLockedSum( a.id )     AS LockSum'
      '      ,p_advice.GetAdviceAvailSum( a.id )      AS AvailSum'
      '      ,p_advice.GetAdviceAvailSum( a.id, '#39'N'#39' ) AS summa_ts_n'
      '      ,p_advice.GetAdviceAvailSum( a.id, '#39'Y'#39' ) AS summa_ts_y'
      '      -- '#1058#1057
      '      ,p_advice.GetAdviceSum( a.id, '#39'Y'#39' )           AS ts_summa'
      
        '      ,p_advice.GetAdviceRestSum( a.id, '#39'Y'#39' )       AS ts_RestSu' +
        'm'
      
        '      ,p_advice.GetAdviceLockedSum( a.id, '#39'Y'#39' )     AS ts_LockSu' +
        'm'
      
        '      ,p_advice.GetAdviceAvailSum( a.id, '#39'Y'#39' )      AS ts_AvailS' +
        'um'
      'from fdc_advice_knp_lst a'
      '  where id = :id'
      '/*select a.*'
      
        '      ,- ( SELECT SUM( ad.summa ) FROM fdc_advice_deduction_lst ' +
        'ad WHERE ad.advice_id = a.id ) AS summa'
      
        '      ,- ( SELECT SUM( ad.summa ) FROM fdc_advice_deduction_lst ' +
        'ad WHERE ad.advice_id = a.id and ad.is_ts = '#39'N'#39')'
      '       - NVL(( SELECT SUM( d.summa ) '
      '               FROM  fdc_decision_payback_lst d,'
      '                     fdc_rel_advice_dec_lst   r'
      '               WHERE d.id = r.REL_OBJECT_ID'
      '                 AND d.is_ts = '#39'N'#39
      '                 AND r.OBJECT_ID = a.id),0) AS summa_ts_n'
      
        '      ,- ( SELECT SUM( ad.summa ) FROM fdc_advice_deduction_lst ' +
        'ad WHERE ad.advice_id = a.id and ad.is_ts = '#39'Y'#39') '
      '       - nvl(( SELECT SUM( d.summa ) '
      '               FROM  fdc_decision_payback_lst d,'
      '                     fdc_rel_advice_dec_lst   r'
      '               WHERE d.id = r.REL_OBJECT_ID'
      '                 AND d.is_ts = '#39'Y'#39
      '                 AND r.OBJECT_ID = a.id),0) AS summa_ts_y '
      '  from fdc_advice_knp_lst a'
      '  where id = :id */')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_advice_knp_add(pDocType        => :TYPESYSNAME,'
      '                         pDocNumber      => :DOC_NUMBER,'
      '                         pDocDate        => :DOC_DATE,'
      '                         pSubjectId      => :SUBJECT_ID);'
      'end;')
  end
end
