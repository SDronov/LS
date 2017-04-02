inherited AdviceBackForm: TAdviceBackForm
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
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
        inherited edtLockSum: TcxDBCurrencyEdit
          Width = 217
        end
        inherited edtAvailSum: TcxDBCurrencyEdit
          Width = 209
        end
        inherited edtRestSum: TcxDBCurrencyEdit
          Width = 177
        end
        inherited edtTSSumma: TcxDBCurrencyEdit
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 291
        end
        inherited edtDeclarant: TfdcObjectLinkEdit
          Width = 540
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 200
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 419
          Width = 175
        end
        inherited edtDocNUmber: TcxDBTextEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
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
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 478
        FloatTop = 282
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
    inherited bsiDecisionReuse: TdxBarSubItem
      Enabled = False
      Visible = ivNever
    end
    inherited btnDecisionReuse: TdxBarButton
      Enabled = False
    end
    inherited btnDecisionDebt: TdxBarButton
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
      '  from fdc_advice_lst a'
      '  where id = :id')
  end
end
