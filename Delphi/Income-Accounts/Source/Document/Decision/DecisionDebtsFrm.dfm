inherited DecisionDebtsForm: TDecisionDebtsForm
  Left = 441
  Top = 286
  Width = 869
  Height = 535
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1077#1090#1077' '#1074' '#1089#1095#1077#1090' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 853
    Height = 497
    ClientRectBottom = 473
    ClientRectRight = 853
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 847
        Height = 442
        inherited edtName: TcxDBTextEdit
          Left = 93
          Top = -489
          Width = 678
        end
        inherited edtDescript: TcxDBMemo
          Left = 93
          Top = 413
          TabOrder = 31
          Height = 223
          Width = 728
        end
        object edtSumma: TcxDBCurrencyEdit [2]
          Left = 93
          Top = -16
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 20
          Width = 728
        end
        object cmbxCurrency: TfdcObjectLookupEdit [3]
          Left = 93
          Top = -43
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCurrency
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 19
          Width = 728
        end
        object edtSumRub: TcxDBCurrencyEdit [4]
          Left = 93
          Top = 11
          DataBinding.DataField = 'SUM_RUB'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 728
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 102
          Top = -306
          Width = 451
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 582
          Top = -306
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Left = 102
          Top = -279
          DataBinding.TypeSysName = 'Declarant;Person;Subject'
          Width = 707
        end
        inherited edtAppDate: TcxDBDateEdit
          Left = 102
          Top = -208
          Enabled = False
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Left = 351
          Top = -208
          Enabled = False
        end
        inherited edtAppNumber: TcxDBTextEdit
          Left = 102
          Top = -181
          Enabled = False
          Width = 123
        end
        inherited edtSignBy: TcxDBTextEdit
          Left = 102
          Top = 346
          TabOrder = 29
          Width = 707
        end
        inherited edtSignDate: TcxDBDateEdit
          Left = 102
          Top = 373
          TabOrder = 30
          Width = 707
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Left = 102
          Top = 292
          TabOrder = 27
          Width = 707
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Left = 102
          Top = 319
          TabOrder = 28
          Width = 707
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Left = 102
          Top = -110
          Enabled = False
          Width = 813
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Left = 102
          Top = -431
          Width = 707
        end
        inherited edtCustomsCode: TcxDBTextEdit
          Left = 102
          Top = -404
        end
        inherited edtDocCode: TcxDBTextEdit
          Left = 351
          Top = -404
        end
        inherited edtDocOsnCode: TcxDBComboBox
          Top = -377
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 319
          Top = -181
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Left = 102
          Top = -83
          Width = 707
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Left = 102
          Top = 69
          TabOrder = 22
          Width = 707
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 154
          TabOrder = 24
          Width = 692
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 181
          TabOrder = 25
          Width = 692
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 208
          TabOrder = 26
          Width = 692
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Left = 102
          Top = 96
          TabOrder = 23
          Width = 707
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 506
          Top = -404
          Width = 90
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 688
          Top = -404
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = -377
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = -377
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = -377
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocDate: TdxLayoutItem
                Tag = 11
              end
              inherited lciDocNumber: TdxLayoutItem
                Tag = 11
              end
            end
          end
          inherited lcgDeclarant: TdxLayoutGroup
            inherited lcgDeclarantINNKPP: TdxLayoutGroup
              inherited lciDeclKPP: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahRight
              end
            end
          end
          inherited lcgApp: TdxLayoutGroup
            Visible = False
          end
          inherited lcgReason: TdxLayoutGroup
            Visible = False
            inherited lciReason: TdxLayoutItem
              Visible = False
            end
          end
          object lcGeneralItem2: TdxLayoutItem [5]
            Tag = 13
            Caption = #1042#1072#1083#1102#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxCurrency
            ControlOptions.ShowBorder = False
          end
          object lciSumma: TdxLayoutItem [6]
            Tag = 13
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem [7]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSumRub
            ControlOptions.ShowBorder = False
          end
          inherited lcgDepts: TdxLayoutGroup
            Visible = False
          end
          inherited lcgSign: TdxLayoutGroup
            inherited lciSignByChiefUDF: TdxLayoutItem
              Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1054#1058#1055
            end
            inherited lciSignBy: TdxLayoutItem
              Tag = 31
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 853
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 442
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 470
        Width = 853
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 850
        Height = 442
      end
    end
    object tabNoticePays: TcxTabSheet [1]
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      ImageIndex = 2
      OnShow = tabNoticePaysShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 853
        Height = 473
        ActivePage = tabAccess
        ClientRectBottom = 449
        ClientRectRight = 853
      end
    end
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 131
    object actPrintAdvice: TAction
      Category = 'Object'
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      Hint = #1055#1077#1095#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044
      OnExecute = actPrintExecute
      OnUpdate = actPrintUpdate
    end
    object actPrintDecision: TAction
      Tag = 1
      Category = 'Object'
      Caption = #1056#1077#1096#1077#1085#1080#1077
      Hint = #1055#1077#1095#1072#1090#1100' '#1088#1077#1096#1077#1085#1080#1103
      OnExecute = actPrintExecute
      OnUpdate = actPrintUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 500
    Top = 131
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 612
    Top = 131
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 640
    Top = 131
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 556
    Top = 131
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 584
    Top = 131
  end
  inherited imglAction: TImageList
    Left = 444
    Top = 131
  end
  inherited imglLarge: TImageList
    Left = 472
    Top = 131
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
        FloatClientHeight = 78
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
    Left = 528
    Top = 131
    DockControlHeights = (
      0
      0
      0
      0)
    inherited btnPrint: TdxBarButton
      Action = nil
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      OnClick = nil
    end
    object btnPrintAdvice: TdxBarButton
      Action = actPrintAdvice
      Category = 0
    end
    object btnPrintDecision: TdxBarButton
      Action = actPrintDecision
      Category = 0
    end
    object btnPrintDoc: TdxBarSubItem
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Visible = ivAlways
      ImageIndex = 5
      ItemLinks = <
        item
          Item = btnPrintDecision
          Visible = True
        end
        item
          Item = btnPrintAdvice
          Visible = True
        end>
    end
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
      end>
    Left = 416
    Top = 159
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,d.debt_pay_summa + d.debt_peny_summa + d.debt_proc_summa'
      '              AS debts_summa_s'
      '  from fdc_decision_Debts_Lst d'
      '  where d.ID = :ID')
    SourceServerObject = 'FDC_DECISION_DEBTS_LST'
    Left = 444
    Top = 159
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
      FieldName = 'SUMMA'
      Required = True
      DisplayFormat = ',0.00;-,0.00'
      currency = True
    end
    object dsDataDEBT_TYPE_ID: TFloatField
      FieldName = 'DEBT_TYPE_ID'
    end
    object dsDataDEBT_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      DisplayWidth = 100
      FieldKind = fkLookup
      FieldName = 'DEBT_TYPE'
      LookupDataSet = DictData.dsDebtTypes
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DEBT_TYPE_ID'
      Size = 1000
      Lookup = True
    end
    object dsDataDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataCURRENCY_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataSUM_RUB: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
      FieldName = 'SUM_RUB'
    end
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
  end
  inherited srcData: TDataSource
    Left = 444
    Top = 187
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_decision_debts_add('
      '      pDocType          => :TYPESYSNAME'
      '     ,pDecisionNumber   => :DOC_NUMBER'
      '     ,pDecisionDate     => :DOC_DATE'
      '     ,pSubjectId        => :SUBJECT_ID'
      '     ,pAppNumber        => :APP_NUMBER'
      '     ,pAppDate          => :APP_DATE'
      '     ,pAppDateIncome    => :APP_DATE_INCOME'
      '     ,pReasonId         => :REASON_ID'
      '     ,pDebtTypeId       => :DEBT_TYPE_ID'
      '     ,pSumma            => :SUMMA'
      '     ,pCurrencyId       => :CURRENCY_ID'
      '     ,pSignedByChief    => :SIGNED_BY_CHIEF'
      '     ,pSignedByChiefUDF => :SIGNED_BY_CHIEF_UDF'
      '     ,pIsTS             => :IS_TS'
      '     ,pDocCode          => :DOC_CODE'
      '     ,pDocOsnCode       => :DOC_OSN_CODE'
      '     ,pDebtsSumma       => :DEBTS_SUMMA'
      '    );'
      'end;')
    SourceServerObject = 'FDC_DECISION_DEBTS_ADD'
    Left = 472
    Top = 159
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
        Name = 'DEBT_TYPE_ID'
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
        Name = 'IS_TS'
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
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_decision_debts_upd('
      '      pId               => :ID'
      '     ,pDecisionNumber   => :DOC_NUMBER'
      '     ,pDecisionDate     => :DOC_DATE'
      '     ,pAppNumber        => :APP_NUMBER'
      '     ,pAppDate          => :APP_DATE'
      '     ,pAppDateIncome    => :APP_DATE_INCOME'
      '     ,pReasonId         => :REASON_ID'
      '     ,pSignedBy         => :SIGNED_BY'
      '     ,pSignedByChief    => :SIGNED_BY_CHIEF'
      '     ,pSignedByChiefUDF => :SIGNED_BY_CHIEF_UDF'
      '     ,pSignDate         => :SIGN_DATE'
      '     ,pDebtTypeId       => :DEBT_TYPE_ID'
      '     ,pDocCode          => :DOC_CODE'
      '     ,pDocOsnCode       => :DOC_OSN_CODE'
      '     ,pDebtsSumma       => :DEBTS_SUMMA'
      '    );'
      'end;')
    SourceServerObject = 'FDC_DECISION_DEBTS_UPD'
    Left = 500
    Top = 159
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
        DataType = ftDate
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBT_TYPE_ID'
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
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 556
    Top = 187
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 640
    Top = 159
  end
  inherited dsUpdateState: TfdcQuery
    Left = 584
    Top = 159
  end
  inherited srcState: TDataSource
    Left = 528
    Top = 187
  end
  inherited dsTransit: TfdcQuery
    Left = 556
    Top = 159
  end
  inherited dsState: TfdcQuery
    Left = 528
    Top = 159
  end
  inherited srcAccessLevel: TDataSource
    Left = 612
    Top = 187
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 612
    Top = 159
  end
  inherited odsGetBoss: TOracleDataSet
    Left = 619
    Top = 274
  end
  inherited dsGetBoss: TDataSource
    Left = 620
    Top = 323
  end
  object dsNoticeList: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT DISTINCT md.name'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_object dco'
      '      ,fdc_object md'
      ' WHERE dco.id = :DEC_ID'
      '       AND :mode_view = 0'
      '       AND pd.decision_id = dco.id '
      '       AND md.id = ( SELECT MAX( m.id ) '
      '                       FROM fdc_debts_measures_lst m'
      '                      WHERE m.owner_object_id IN'
      '                            ( SELECT id'
      '                                FROM fdc_object_lst n'
      
        '                              CONNECT BY PRIOR n.owner_object_id' +
        ' = n.ID'
      '                               START WITH n.id = pd.notice_id '
      '                            )'
      
        '                            AND m.measures_type in ( '#39'B20'#39', '#39'B27' +
        #39' ) )  '
      'UNION ALL '
      'SELECT DISTINCT md.name'
      '  FROM fdc_noticepay_ded_reserv_lst pd'
      '      ,fdc_object dco'
      '      ,fdc_object md'
      ' WHERE dco.id = :DEC_ID'
      '       AND :mode_view = 1'
      '       AND pd.decision_id = dco.id '
      '       AND md.id = ( SELECT MAX( m.id ) '
      '                       FROM fdc_debts_measures_lst m'
      '                      WHERE m.owner_object_id IN'
      '                            ( SELECT id'
      '                                FROM fdc_object_lst n'
      
        '                              CONNECT BY PRIOR n.owner_object_id' +
        ' = n.ID'
      '                               START WITH n.id = pd.notice_id '
      '                            )'
      
        '                            AND m.measures_type in ( '#39'B20'#39', '#39'B27' +
        #39' ) )  '
      ''
      '/*'
      'SELECT np.name'
      '  FROM fdc_noticepay_lst np'
      ' WHERE EXISTS ( SELECT 0'
      '                   FROM fdc_ded_paydept_lst pd'
      '                   WHERE pd.decision_id = :DEC_ID'
      '                     AND pd.notice_id = np.id )'
      '   AND :mode_view = 0'
      'UNION all'
      'SELECT np.name'
      '  FROM fdc_noticepay_lst np'
      ' WHERE EXISTS ( SELECT 0'
      '                   FROM fdc_noticepay_ded_reserv_lst r'
      '                   WHERE r.decision_id = :DEC_ID'
      '                     AND r.notice_id = np.id )'
      '   AND :mode_view = 1*/')
    BeforeOpen = dsNoticeListBeforeOpen
    Left = 171
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT v.STRINGVALUE AS CustomsName, :DecisionType as DecisionTy' +
        'pe'
      'FROM fdc_value_lst_sys v '
      'WHERE v.SYSNAME = '#39'CustomsName'#39' ')
    Left = 83
    Top = 314
    ParamData = <
      item
        DataType = ftString
        Name = 'DecisionType'
        ParamType = ptUnknown
        Value = ''
      end>
    object dsReportCUSTOMSNAME: TStringField
      FieldName = 'CUSTOMSNAME'
      Size = 1500
    end
    object dsReportDECISIONTYPE: TStringField
      FieldName = 'DECISIONTYPE'
      Size = 4000
    end
  end
  object PrintPopupMenu: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = btnPrintDecision
        Visible = True
      end
      item
        Item = btnPrintAdvice
        Visible = True
      end>
    UseOwnFont = False
    Left = 531
    Top = 82
  end
  object dsNoticePT: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT ( SELECT md.doc_number'
      '           FROM fdc_document md'
      '          WHERE md.id = ( SELECT MAX( m.id )'
      '                            FROM fdc_debts_measures_lst m'
      '                           WHERE m.owner_object_id IN'
      '                                 ( SELECT id'
      '                                     FROM fdc_object_lst n'
      
        '                                   CONNECT BY PRIOR n.owner_obje' +
        'ct_id = n.ID'
      
        '                                    START WITH n.id = p.notice_i' +
        'd'
      '                                 )'
      
        '                                 AND m.measures_type in ( '#39'B20'#39',' +
        ' '#39'B27'#39' ) ) ) AS doc_number'
      '      ,( SELECT md.doc_date'
      '           FROM fdc_document md'
      '          WHERE md.id = ( SELECT MAX( m.id )'
      '                            FROM fdc_debts_measures_lst m'
      '                           WHERE m.owner_object_id IN'
      '                                 ( SELECT id'
      '                                     FROM fdc_object_lst n'
      
        '                                   CONNECT BY PRIOR n.owner_obje' +
        'ct_id = n.ID'
      
        '                                    START WITH n.id = p.notice_i' +
        'd'
      '                                 )'
      
        '                                 AND m.measures_type in ( '#39'B20'#39',' +
        ' '#39'B27'#39' ) ) ) AS doc_date'
      '      ,p.pay_type_code'
      '      ,p.summa'
      '  FROM ( SELECT pd.notice_id'
      '               ,pd.pay_type_code'
      '               ,SUM( pd.summa ) AS summa'
      '           FROM fdc_ded_paydept_lst pd'
      '               ,fdc_object dco'
      '          WHERE dco.id = :DEC_ID'
      
        '                AND dco.object_type_id != fdc_object_type_get_by' +
        'sysname ('#39'DecisionDebtsDepositOffset'#39')'
      '                AND pd.decision_id = dco.id'
      '                AND :mode_view = 0'
      '          GROUP BY pd.notice_id, pd.pay_type_code ) p'
      'UNION ALL'
      'SELECT ( SELECT md.doc_number '
      '           FROM fdc_document md '
      '          WHERE md.id = ( SELECT MAX( m.id )'
      '                            FROM fdc_debts_measures_lst m'
      '                           WHERE m.owner_object_id IN'
      '                                 ( SELECT id'
      '                                     FROM fdc_object_lst n'
      
        '                                   CONNECT BY PRIOR n.owner_obje' +
        'ct_id = n.ID'
      
        '                                    START WITH n.id = p.notice_i' +
        'd '
      '                                 )'
      
        '                                 AND m.measures_type in ( '#39'B20'#39',' +
        ' '#39'B27'#39' ) ) ) AS doc_number'
      '      ,( SELECT md.doc_date '
      '           FROM fdc_document md '
      '          WHERE md.id = ( SELECT MAX( m.id ) '
      '                            FROM fdc_debts_measures_lst m'
      '                           WHERE m.owner_object_id IN'
      '                                 ( SELECT id'
      '                                     FROM fdc_object_lst n'
      
        '                                   CONNECT BY PRIOR n.owner_obje' +
        'ct_id = n.ID'
      
        '                                    START WITH n.id = p.notice_i' +
        'd '
      '                                 )'
      
        '                                 AND m.measures_type in ( '#39'B20'#39',' +
        ' '#39'B27'#39' ) ) ) AS doc_date'
      '      ,p.pay_type_code'
      '      ,p.summa'
      '  FROM ( SELECT pd.notice_id'
      '               ,pd.pay_type_code'
      '               ,SUM( pd.summa ) AS summa'
      '           FROM fdc_noticepay_ded_reserv_lst pd'
      '               ,fdc_object dco'
      '          WHERE dco.id = :DEC_ID'
      
        '                AND dco.object_type_id != fdc_object_type_get_by' +
        'sysname ('#39'DecisionDebtsDepositOffset'#39')'
      '                AND pd.decision_id = dco.id'
      '                AND :mode_view = 1'
      '          GROUP BY pd.notice_id, pd.pay_type_code '
      '       ) p'
      'UNION ALL'
      'SELECT do.name AS doc_number'
      '      ,TO_DATE( NULL ) AS doc_date'
      '      ,pd.pay_type_code'
      '      ,SUM( pd.summa ) AS summa'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_object do'
      '      ,fdc_object dco'
      ' WHERE dco.id = :DEC_ID'
      
        '       AND dco.object_type_id = fdc_object_type_get_bysysname ('#39 +
        'DecisionDebtsDepositOffset'#39')'
      '       AND pd.decision_id = dco.id'
      '       AND pd.decl_id = do.id'
      '       AND :mode_view = 0'
      ' GROUP BY do.name, pd.notice_id, pd.pay_type_code'
      'UNION ALL'
      'SELECT do.name AS doc_number'
      '      ,TO_DATE( NULL ) AS doc_date'
      '      ,pd.pay_type_code'
      '      ,SUM( pd.summa ) AS summa'
      '  FROM fdc_noticepay_ded_reserv_lst pd'
      '      ,fdc_object do'
      '      ,fdc_object dco'
      ' WHERE dco.id = :DEC_ID'
      
        '       AND dco.object_type_id = fdc_object_type_get_bysysname ('#39 +
        'DecisionDebtsDepositOffset'#39')'
      '       AND pd.decision_id = dco.id'
      '       AND pd.decl_id = do.id'
      '       AND :mode_view = 1'
      ' GROUP BY do.name, pd.notice_id, pd.pay_type_code          '
      ''
      '/* '#1052#1077#1088' '#1084#1086#1078#1077#1090' '#1085#1077' '#1073#1099#1090#1100' '#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1077#1089#1090#1100' '#1074#1089#1077#1075#1076#1072' !! */'
      ''
      '')
    BeforeOpen = dsNoticeListBeforeOpen
    Left = 243
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsNoticePTDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsNoticePTDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsNoticePTPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsNoticePTSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
  object dsDetail: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,SUM( pd.summa ) AS reuse_sum'
      '  FROM fdc_ded_paydept_lst pd'
      '      ,fdc_po_credit_lst   po'
      '  WHERE pd.decision_id = :DEC_ID'
      '    AND :mode_view     = 0'
      '    AND pd.payment_id  = po.id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma'
      'UNION ALL'
      
        'SELECT row_number() over (ORDER BY po.doc_date, po.doc_number) A' +
        'S pp'
      '      ,CASE po.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END             AS po_type'
      '      ,po.doc_number   AS po_num'
      '      ,po.doc_date     AS po_date'
      '      ,po.doc_summa    AS po_sum'
      '      ,SUM( r.summa )  AS reuse_sum'
      '  FROM fdc_noticepay_ded_reserv_lst r'
      '      ,fdc_po_credit_lst            po'
      '  WHERE r.decision_id = :DEC_ID'
      '    AND :mode_view    = 1'
      '    AND r.payment_id  = po.id'
      
        '  GROUP BY po.TypeSYSNAME, po.doc_number, po.doc_date, po.doc_su' +
        'mma')
    BeforeOpen = dsNoticeListBeforeOpen
    Left = 315
    Top = 322
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsDetailPP: TFloatField
      FieldName = 'PP'
    end
    object dsDetailPO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      Size = 3
    end
    object dsDetailPO_NUM: TStringField
      FieldName = 'PO_NUM'
      Size = 100
    end
    object dsDetailPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object dsDetailPO_SUM: TFloatField
      FieldName = 'PO_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsDetailREUSE_SUM: TFloatField
      FieldName = 'REUSE_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
end
