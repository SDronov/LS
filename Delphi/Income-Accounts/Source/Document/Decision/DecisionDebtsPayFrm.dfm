inherited DecisionDebtsPaysForm: TDecisionDebtsPaysForm
  Left = 310
  Top = 92
  Height = 630
  Caption = 'DecisionDebtsPayForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 603
    ClientRectBottom = 579
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 550
        inherited edtName: TcxDBTextEdit
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Height = 223
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Properties.AssignedValues.MaxValue = True
          Properties.UseThousandSeparator = True
          Properties.ValidateOnEnter = False
        end
        inherited cmbxCurrency: TfdcObjectLookupEdit
          Properties.PostPopupValueOnTab = True
          Properties.OnChange = nil
          Properties.OnEditValueChanged = CurrencyOrDateChange
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 813
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Width = 737
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Width = 811
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Width = 783
        end
        inherited edtDocDate: TcxDBDateEdit
          Properties.ImmediatePost = True
          Properties.OnChange = nil
          Properties.OnEditValueChanged = CurrencyOrDateChange
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Properties.OnChange = Modify
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentAttrs: TdxLayoutGroup
              inherited lcIs_TS: TdxLayoutItem
                Tag = 13
              end
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 550
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 576
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 550
      end
    end
    inherited tabDocObligations: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 579
        ClientRectBottom = 555
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
        FloatLeft = 342
        FloatTop = 339
        FloatClientWidth = 104
        FloatClientHeight = 86
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
            Item = btnPrintDoc
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
            Item = btnCreateActCorrOB
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
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftBoolean
        Name = 'DeductionsReadOnly'
        ParamType = ptUnknown
        Value = False
      end
      item
        DataType = ftCurrency
        Name = 'SUMMA'
        ParamType = ptUnknown
        Value = 0c
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_dec_debts_pays_lst d'
      '  where d.ID = :ID')
    SourceServerObject = 'FDC_DEC_DEBTS_PAYS_LST'
  end
  inherited dsState: TfdcQuery
    AfterOpen = dsStateAfterOpen
  end
  inherited dsReport: TfdcQuery
    DataSource = srcData
    SQL.Strings = (
      
        'SELECT v.STRINGVALUE AS CustomsName, '#39#39' as DECL_LIST, :DecisionT' +
        'ype as DecisionType,'
      '  --fdc_dec_debts_overpay_get_art(pid, 0) as ARTICLE_LIST,'
      '  '#39'355'#39' as ARTICLE_LIST,'
      '  --fdc_dec_debts_overpay_get_art(pid, 1) as CASH_ASSETS_NAME,'
      '  '#39' '#1072#1074#1072#1085#1089#1086#1074#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081' '#39'  as CASH_ASSETS_NAME'
      'FROM fdc_value_lst_sys v'
      'WHERE v.SYSNAME = '#39'CustomsName'#39' ')
    object dsReportDECL_LIST: TStringField
      FieldName = 'DECL_LIST'
      Size = 7
    end
    object dsReportARTICLE_LIST: TStringField
      FieldName = 'ARTICLE_LIST'
      Size = 4000
    end
    object dsReportCASH_ASSETS_NAME: TStringField
      FieldName = 'CASH_ASSETS_NAME'
      Size = 4000
    end
  end
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT rr.po_name as Name'
      '  FROM FDC_RESERVED_FOR_REUSE_LST rr'
      ' WHERE rr.doc_id = :ID'
      '')
    Left = 88
    Top = 264
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptInput
      end>
    object dsPaymentOrderListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
end
