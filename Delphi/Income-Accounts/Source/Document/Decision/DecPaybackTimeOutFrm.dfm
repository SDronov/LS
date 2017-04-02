inherited DecPaybackTimeOutForm: TDecPaybackTimeOutForm
  Left = 14
  Top = 316
  Height = 689
  Caption = 'DecPaybackTimeOutForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 651
    ClientRectBottom = 627
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 596
        inherited edtName: TcxDBTextEdit
          Width = 814
        end
        inherited edtDescript: TcxDBMemo
          Top = 1326
          TabOrder = 52
          Height = 223
        end
        object edtKBK: TfdcObjectLookupEdit [2]
          Left = 60
          Top = 384
          DataBinding.DataField = 'KBKCODE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ClearKey = 16430
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end
            item
              FieldName = 'CODE2'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsKBK
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 145
        end
        inherited edtExcisePay: TcxDBCheckBox
          Top = 891
          Style.IsFontAssigned = True
          TabOrder = 42
        end
        inherited edtDecisionCourt: TcxDBCheckBox
          Top = 837
          Style.IsFontAssigned = True
          TabOrder = 38
        end
        inherited edtDateCourt: TcxDBDateEdit
          Top = 837
          TabOrder = 39
        end
        inherited edtCourtActAttrs: TcxDBTextEdit
          Top = 837
          TabOrder = 40
          Width = 121
        end
        inherited edtCustomsDecAttrs: TcxDBTextEdit
          Top = 864
          TabOrder = 41
          Width = 121
        end
        inherited edtReasonAticle: TcxTextEdit
          Top = 729
          TabOrder = 33
          Text = '147'
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Top = 411
          TabOrder = 21
          Width = 121
        end
        inherited edtDestSubINN: TcxDBTextEdit
          Top = 469
          TabOrder = 22
          Width = 121
        end
        inherited edtDestSubKPP: TcxDBTextEdit
          Top = 469
          TabOrder = 23
        end
        inherited edtDestSubj: TfdcObjectLinkEdit
          Top = 496
          TabOrder = 24
          Width = 121
        end
        inherited edtDestSubName: TcxDBTextEdit
          Top = 523
          TabOrder = 25
          Width = 121
        end
        inherited edtDestSubAddr: TcxDBTextEdit
          Top = 550
          TabOrder = 26
          Width = 121
        end
        inherited edtAccount: TcxDBMaskEdit
          Top = 577
          TabOrder = 27
          Width = 121
        end
        inherited edtBank: TfdcObjectLinkEdit
          Top = 604
          TabOrder = 28
          Width = 121
        end
        inherited edtBIC: TcxDBTextEdit
          Top = 631
          TabOrder = 29
        end
        inherited edtCorrAccount: TcxDBTextEdit
          Top = 631
          TabOrder = 30
          Width = 121
        end
        inherited edtBankAddr: TcxDBTextEdit
          Top = 658
          TabOrder = 31
          Width = 121
        end
        inherited edtCurrency: TfdcObjectLookupEdit
          Width = 145
        end
        inherited cbDecision: TcxComboBox
          Top = 756
          Properties.OnChange = cbDecisionValueChange
          TabOrder = 34
          Width = 1047
        end
        inherited cbBeforeAfter: TcxComboBox
          Top = 756
          TabOrder = 35
        end
        object edtPrevDecision: TfdcObjectLinkEdit [25]
          Left = 147
          Top = 783
          DataBinding.DataField = 'Prev_Decision_Name'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'prev_decision_id'
          DataBinding.TypeSysName = 'DecisionPayback'
          DataBinding.SearchFormClass = 'TDecisionPaybackGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = edtPrevDecisionPropertiesButtonClick
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 36
          OnBeforeAcceptObject = edtPrevDecisionBeforeAcceptObject
          Width = 783
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 527
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 783
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 1259
          TabOrder = 50
          Width = 783
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 1286
          TabOrder = 51
          Width = 783
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 1205
          TabOrder = 48
          Width = 783
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 1232
          TabOrder = 49
          Width = 1298
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Top = 729
          TabOrder = 32
          Width = 767
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 783
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Top = 810
          TabOrder = 37
          Width = 783
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 982
          TabOrder = 43
          Width = 814
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 1067
          TabOrder = 45
          Width = 1328
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 1094
          TabOrder = 46
          Width = 1328
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 1121
          TabOrder = 47
          Width = 1328
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 1009
          TabOrder = 44
          Width = 1298
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 166
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
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
          object lciKBK: TdxLayoutItem [5]
            Caption = #1050#1041#1050
            Control = edtKBK
            ControlOptions.ShowBorder = False
          end
          inherited lcgReason: TdxLayoutGroup
            inherited lcgReasonAticle: TdxLayoutGroup
              inherited lciReasonPayback: TdxLayoutItem
                Tag = 33
              end
            end
            object lciPrevDecision: TdxLayoutItem [2]
              Caption = #1054#1089#1085#1086#1074#1085#1086#1077' '#1088#1077#1096#1077#1085#1080#1077
              Control = edtPrevDecision
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 596
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 624
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 596
      end
    end
    inherited tabPaymentOrders: TcxTabSheet
      TabVisible = False
    end
    inherited tabDocObligations: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 627
        ClientRectBottom = 603
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = True
      Visible = True
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
        FloatClientWidth = 103
        FloatClientHeight = 100
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
            Item = btnPrint
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
            Item = barBtnCancel
            Visible = True
          end
          item
            Item = btGetDebts
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
  inherited dsData: TfdcQuery
    inherited dsDataREASON_ID: TFloatField
      Required = False
    end
    inherited dsDataKBKCODE_ID: TFloatField
      Required = True
    end
    object dsDataPREV_DECISION_ID: TFloatField
      FieldName = 'PREV_DECISION_ID'
    end
    object dsDataPREV_DECISION_NAME: TStringField
      FieldName = 'PREV_DECISION_NAME'
      Size = 250
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_dec_payback_timeout_add('
      '      pdoctype         => :TYPESYSNAME'
      '     ,pdecisionnumber  => :DOC_NUMBER'
      '     ,pdecisiondate    => :DOC_DATE'
      '     ,psubjectid       => :SUBJECT_ID'
      '     ,pappnumber       => :APP_NUMBER'
      '     ,pappdate         => :APP_DATE'
      '     ,pappnumberincome => :APP_NUMBER_INCOME'
      '     ,pappdateincome   => :APP_DATE_INCOME'
      '     ,preasonid        => :REASON_ID'
      '     ,psumma           => :SUMMA'
      '     ,pdestsubid       => :DESTSUB_ID'
      '     ,pcurrencyid      => :CURRENCY_ID'
      '     ,paccount         => :ACCOUNT'
      '     ,pbankid          => :BANK_ID'
      '     ,pkbkid           => :KBKCODE_ID'
      '     ,ppersonalaccount => :PERSONAL_ACCOUNT'
      '     ,pdatelastdoc     => :DATE_LAST_DOC'
      '     ,pdestsubname     => :DECL_NAME_BANK_DEST'
      '     ,pists            => :IS_TS'
      '     ,pexcisepay       => :EXCISE_PAY'
      '     ,pdecisioncourt   => :DECISION_COURT'
      '     ,pdatecourt       => :DATE_COURT'
      '     ,pdocosncode      => :DOC_OSN_CODE'
      '     ,psudreasonid     => :SUD_REASON_ID'
      '     ,pdebtssumma      => :DEBTS_SUMMA'
      '     ,pcourtactattrs   => :COURT_ACT_ATTRS'
      '     ,pcustomsdecattrs => :CUSTOMS_DEC_ATTRS'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      '     ,pPrevDecisionID      => :PREV_DECISION_ID);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DESTSUB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PERSONAL_ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_LAST_DOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECL_NAME_BANK_DEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IS_TS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EXCISE_PAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECISION_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUD_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COURT_ACT_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUSTOMS_DEC_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PREV_DECISION_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_payback_upd('
      '      pid               => :ID'
      '     ,pdecisionnumber   => :DOC_NUMBER'
      '     ,pdecisiondate     => :DOC_DATE'
      '     ,psubjectid        => :SUBJECT_ID'
      '     ,pappnumber        => :APP_NUMBER'
      '     ,pappdate          => :APP_DATE'
      '     ,pappnumberincome  => :APP_NUMBER_INCOME'
      '     ,pappdateincome    => :APP_DATE_INCOME'
      '     ,preasonid         => :REASON_ID'
      '     ,psumma            => :SUMMA'
      '     ,pcurrencyid       => :CURRENCY_ID'
      '     ,pdestsubid        => :DESTSUB_ID'
      '     ,psigndate         => :SIGN_DATE'
      '     ,psignedby         => :SIGNED_BY'
      '     ,psignedbychief    => :SIGNED_BY_CHIEF'
      '     ,psignedbychiefudf => :SIGNED_BY_CHIEF_UDF'
      '     ,paccount          => :ACCOUNT'
      '     ,pbankid           => :BANK_ID'
      '     ,pkbkid            => :KBKCODE_ID'
      '     ,pdatelastdoc     => :DATE_LAST_DOC'
      '     ,pdestsubname     => :DECL_NAME_BANK_DEST'
      '     ,pexcisepay       => :EXCISE_PAY'
      '     ,pdecisioncourt   => :DECISION_COURT'
      '     ,pdatecourt       => :DATE_COURT'
      '     ,pdoccode         => :DOC_CODE'
      '     ,pdocosncode      => :DOC_OSN_CODE'
      '     ,psudreasonid     => :SUD_REASON_ID'
      '     ,pdebtssumma      => :DEBTS_SUMMA'
      '     ,pcourtactattrs   => :COURT_ACT_ATTRS'
      '     ,pcustomsdecattrs => :CUSTOMS_DEC_ATTRS'
      '     ,pDebtPaySumma     => :DEBT_PAY_SUMMA'
      '     ,pDebtPenySumma    => :DEBT_PENY_SUMMA'
      '     ,pDebtProcSumma    => :DEBT_PROC_SUMMA '
      ' ,pPrevDecisionID      => :PREV_DECISION_ID'
      '    );'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'APP_NUMBER_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DESTSUB_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF_UDF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ACCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_LAST_DOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECL_NAME_BANK_DEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'EXCISE_PAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DECISION_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATE_COURT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUD_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COURT_ACT_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUSTOMS_DEC_ATTRS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PAY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PENY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBT_PROC_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PREV_DECISION_ID'
        ParamType = ptUnknown
      end>
  end
  inherited qryGetNameTO: TfdcQuery
    SQL.Strings = (
      
        'SELECT NAME AS NAME_TO, NAME AS CustomsName, fdc_valuestring_sys' +
        '_get( '#39'CustomINN'#39' ) AS CustomsINN, fdc_valuestring_sys_get( '#39'Cus' +
        'tomKPP'#39' ) AS CustomsKPP'
      '  FROM fdc_customs_lst c'
      
        '  WHERE c.customs_code_8 = REPLACE( :customs_code, '#39'KNP'#39', '#39'000'#39' ' +
        ')'
      '')
  end
  inherited qryDetail: TfdcQuery
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END            AS po_type'
      '      ,po.doc_number  AS po_num'
      '      ,po.doc_date    AS po_date'
      '      ,po.doc_summa   AS po_sum'
      '      ,SUM( r.summa ) AS ret_sum'
      '  FROM FDC_REP_DEC_PAYBACK_LST po'
      '      ,fdc_payback_reserve_lst r'
      ' WHERE po.id = r.payment_id'
      '   AND r.decision_id = :ID'
      '   AND 1 = 0'
      
        ' GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_sum' +
        'ma'
      ' ORDER BY po.doc_date, po.doc_number')
  end
  object odsKBK: TOracleDataSet
    SQL.Strings = (
      'SELECT t.id, t.CODE, t.CODE2, t.NAME, t.SDATE, t.EDATE'
      'FROM fdc_kbk_dict_lst t'
      'WHERE'
      '  sysdate between t.sdate and nvl(t.edate,sysdate)')
    QBEDefinition.QBEFieldDefs = {
      040000000600000002000000494401000000000004000000434F444501000000
      000005000000434F444532010000000000040000004E414D4501000000000005
      0000005344415445010000000000050000004544415445010000000000}
    Session = MainData.Session
    Left = 875
    Top = 290
    object odsKBKID: TFloatField
      FieldName = 'ID'
      Required = True
      Visible = False
    end
    object odsKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 80
      FieldName = 'CODE'
      Size = 1500
    end
    object odsKBKCODE2: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 60
      FieldName = 'CODE2'
      Size = 1500
    end
    object odsKBKNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 200
      FieldName = 'NAME'
      Size = 1500
    end
    object odsKBKSDATE: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086
      FieldName = 'SDATE'
      Required = True
    end
    object odsKBKEDATE: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      FieldName = 'EDATE'
    end
  end
  object dsKBK: TDataSource
    DataSet = odsKBK
    Left = 875
    Top = 338
  end
end
