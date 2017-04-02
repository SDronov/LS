inherited DocReuseForm: TDocReuseForm
  Left = 477
  Top = 123
  Caption = 'DocReuseForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 146
          Width = 1003
        end
        inherited edtDescript: TcxDBMemo
          Left = 146
          Top = 992
          TabOrder = 37
          Height = 223
          Width = 1003
        end
        object edtReuseReason: TcxDBComboBox [2]
          Left = 146
          Top = 455
          DataBinding.DataField = 'REASON'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.Items.Strings = (
            #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
            #1056#1077#1096#1077#1085#1080#1077' '#1074#1099#1096#1077#1089#1090#1086#1103#1097#1077#1075#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1086#1088#1075#1072#1085#1072
            #1044#1083#1103' '#1087#1086#1075#1072#1096#1077#1085#1080#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1074' '#1076#1088#1091#1075#1086#1081' '#1090#1072#1084#1086#1078#1085#1077)
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 19
          Width = 121
        end
        object edtCustonsDecisionAttrs: TcxDBTextEdit [3]
          Left = 146
          Top = 482
          DataBinding.DataField = 'DECISION_ATTR'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 20
          Width = 121
        end
        object edtReuseCustomsCodeOld: TcxDBTextEdit [4]
          Left = 146
          Top = 509
          DataBinding.DataField = 'CUSTOMS_CODE_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 21
          Width = 121
        end
        object edtReuseCustomsNameOld: TcxDBTextEdit [5]
          Left = 273
          Top = 509
          DataBinding.DataField = 'CUSTOMS_NAME_OLD'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 22
          Width = 121
        end
        object edtReuseCustomsCodeNew: TcxDBLookupComboBox [6]
          Left = 146
          Top = 536
          DataBinding.DataField = 'CUSTOMS_NEW_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownWidth = 420
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Fixed = True
              Width = 120
              FieldName = 'CUSTOMS_CODE_8'
            end
            item
              Fixed = True
              Width = 300
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCustoms
          Properties.OnChange = Modify
          Properties.OnCloseUp = cxDBLookupComboBox1PropertiesCloseUp
          Properties.OnInitPopup = cxDBLookupComboBox1PropertiesInitPopup
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 23
          Width = 121
        end
        object edtReuseCustomsNameNew: TcxDBTextEdit [7]
          Left = 273
          Top = 536
          DataBinding.DataField = 'CUSTOMS_NAME_NEW'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 24
          Width = 121
        end
        object edtReuseCurrencyCode: TcxDBLookupComboBox [8]
          Left = 146
          Top = 563
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Fixed = True
              Width = 65
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsCurrency
          Properties.OnChange = Modify
          Properties.OnCloseUp = edtReuseCurrencyCodePropertiesCloseUp
          Properties.OnInitPopup = edtReuseCurrencyCodePropertiesInitPopup
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 25
          Width = 121
        end
        object edtReuseCurrencyName: TcxDBTextEdit [9]
          Left = 273
          Top = 563
          DataBinding.DataField = 'CURRENCY_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 26
          Width = 121
        end
        object edtReuseSumma: TcxDBCurrencyEdit [10]
          Left = 146
          Top = 590
          DataBinding.DataField = 'AMOUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.EditFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 27
          Width = 121
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Width = 527
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          DataBinding.TypeSysName = 'Declarant;Person;Subject;Bank'
          Width = 783
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 925
          TabOrder = 35
          Width = 783
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 952
          TabOrder = 36
          Width = 783
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 871
          TabOrder = 33
          Width = 783
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 898
          TabOrder = 34
          Width = 783
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Width = 813
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 783
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Width = 783
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 648
          TabOrder = 28
          Width = 783
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 733
          TabOrder = 30
          Width = 811
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 760
          TabOrder = 31
          Width = 811
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 787
          TabOrder = 32
          Width = 811
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 675
          TabOrder = 29
          Width = 783
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
            inherited lcgDocumentNumDate: TdxLayoutGroup
              inherited lciDocDate: TdxLayoutItem
                Tag = 13
              end
            end
            inherited lcgDocumentAttrs: TdxLayoutGroup
              inherited lcIs_TS: TdxLayoutItem
                Tag = 13
              end
            end
          end
          inherited lcgReason: TdxLayoutGroup
            Visible = False
          end
          object lciReuseReason: TdxLayoutItem [5]
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            Control = edtReuseReason
            ControlOptions.ShowBorder = False
          end
          object lciReuseDecisionAttrs: TdxLayoutItem [6]
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
            Control = edtCustonsDecisionAttrs
            ControlOptions.ShowBorder = False
          end
          object lcgReuseCustomsOld: TdxLayoutGroup [7]
            Caption = #1057' '#1090#1072#1084#1086#1078#1085#1080
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciReuseCustomsCodeOld: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              Caption = #1057' '#1090#1072#1084#1086#1078#1085#1080
              Control = edtReuseCustomsCodeOld
              ControlOptions.ShowBorder = False
            end
            object lciReuseCustomsNameOld: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'cxDBTextEdit1'
              ShowCaption = False
              Control = edtReuseCustomsNameOld
              ControlOptions.ShowBorder = False
            end
          end
          object lcgReuseCustomsNew: TdxLayoutGroup [8]
            Caption = #1053#1072' '#1090#1072#1084#1086#1078#1085#1102
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciReuseCustomsCodeNew: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1053#1072' '#1090#1072#1084#1086#1078#1085#1102
              Control = edtReuseCustomsCodeNew
              ControlOptions.ShowBorder = False
            end
            object lciReuseCustomsNameNew: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'cxDBTextEdit1'
              ShowCaption = False
              Control = edtReuseCustomsNameNew
              ControlOptions.ShowBorder = False
            end
          end
          object lcgReuseCurrency: TdxLayoutGroup [9]
            Caption = #1042#1072#1083#1102#1090#1072
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciReuseCurrencyCode: TdxLayoutItem
              Tag = 13
              Caption = #1042#1072#1083#1102#1090#1072
              Control = edtReuseCurrencyCode
              ControlOptions.ShowBorder = False
            end
            object lciReuseCurrencyName: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = 'cxDBTextEdit1'
              ShowCaption = False
              Control = edtReuseCurrencyName
              ControlOptions.ShowBorder = False
            end
          end
          object lciReuseSumma: TdxLayoutItem [10]
            Tag = 33
            Caption = #1057#1091#1084#1084#1072
            Control = edtReuseSumma
            ControlOptions.ShowBorder = False
          end
          inherited lcgDepts: TdxLayoutGroup
            Visible = False
          end
        end
      end
    end
    inherited tabDocObligations: TcxTabSheet
      TabVisible = False
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
        DataType = ftBoolean
        Name = 'DeductionsReadOnly'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,s.NAME              AS decl_name'
      '      ,s.inn               AS decl_inn'
      '      ,s.kpp               AS decl_kpp'
      '      ,c.code              AS currency_code'
      '      ,c.name              AS currency_name'
      '      ,cs.name             AS customs_name_old'
      '      ,cr.name             AS customs_name_new'
      '      ,signed_by_chief_otp AS signed_by_chief_udf'
      
        '      ,to_number( NULL )   AS reason_id       -- '#1044#1083#1103' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1086#1089 +
        #1090#1080' '#1089' '#1086#1089#1090#1072#1083#1100#1085#1099#1084#1080' '#1088#1077#1096#1077#1085#1080#1103#1084#1080
      
        '      ,to_number( NULL )   AS sud_reason_id   -- '#1044#1083#1103' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1086#1089 +
        #1090#1080' '#1089' '#1086#1089#1090#1072#1083#1100#1085#1099#1084#1080' '#1088#1077#1096#1077#1085#1080#1103#1084#1080
      
        '      ,to_number( NULL )   AS debts_summa_s   -- '#1044#1083#1103' '#1089#1086#1074#1084#1077#1089#1090#1080#1084#1086#1089 +
        #1090#1080' '#1089' '#1086#1089#1090#1072#1083#1100#1085#1099#1084#1080' '#1088#1077#1096#1077#1085#1080#1103#1084#1080
      '  from fdc_doc_reuse_customs_lst d'
      '      ,fdc_subject_lst           s'
      '      ,fdc_nsi_currency_lst      c'
      '      ,fdc_customs_lst           cs'
      '      ,fdc_customs_lst           cr'
      ' WHERE d.ID = :ID'
      '   AND d.subject_id       = s.id(+)'
      '   AND d.currency_id      = c.id(+)'
      '   AND d.customs_code_old = cs.customs_code_8(+)'
      '   AND d.customs_new_id   = cr.id(+)')
    inherited dsDataAPP_NUMBER_INCOME: TStringField [20]
    end
    inherited dsDataAPP_NUMBER: TStringField [21]
    end
    inherited dsDataAPP_DATE: TDateTimeField [23]
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataCUSTOMS_NEW_ID: TFloatField
      FieldName = 'CUSTOMS_NEW_ID'
      Required = True
    end
    object dsDataCUSTOMS_CODE_OLD: TStringField
      FieldName = 'CUSTOMS_CODE_OLD'
      Size = 8
    end
    object dsDataCUSTOMS_CODE_NEW: TStringField
      FieldName = 'CUSTOMS_CODE_NEW'
      Size = 8
    end
    object dsDataSIGNED_BY_CHIEF_OTP: TStringField
      FieldName = 'SIGNED_BY_CHIEF_OTP'
      Size = 50
    end
    object dsDataREASON: TStringField
      FieldName = 'REASON'
      Size = 150
    end
    object dsDataAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      DisplayFormat = ',0.00;-,0.00'
    end
    object dsDataDECISION_ATTR: TStringField
      FieldName = 'DECISION_ATTR'
      Size = 50
    end
    object dsDataCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataCURRENCY_NAME: TStringField
      FieldName = 'CURRENCY_NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_NAME_OLD: TStringField
      FieldName = 'CUSTOMS_NAME_OLD'
      Size = 1500
    end
    object dsDataCUSTOMS_NAME_NEW: TStringField
      FieldName = 'CUSTOMS_NAME_NEW'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_doc_reuse_customs_add('
      '      pdocdate          => :DOC_DATE'
      '     ,pdocnum           => :DOC_NUMBER'
      '     ,psubjectid        => :SUBJECT_ID'
      '     ,pcurrencyid       => :CURRENCY_ID'
      '     ,pcustomsnewid     => :CUSTOMS_NEW_ID'
      '     ,psignedby         => :SIGNED_BY'
      '     ,psigndate         => :SIGN_DATE'
      '     ,psignedbychief    => :SIGNED_BY_CHIEF'
      '     ,psignedbychiefotp => :SIGNED_BY_CHIEF_UDF'
      '     ,preason           => :REASON'
      '     ,pists             => :IS_TS'
      '     ,pappnumber        => :APP_NUMBER'
      '     ,pappdate          => :APP_DATE'
      '     ,pappnumberincome  => :APP_NUMBER_INCOME'
      '     ,pappdateincome    => :APP_DATE_INCOME'
      '     ,pdocosncode       => :DOC_OSN_CODE'
      '     ,pdebtssumma       => :DEBTS_SUMMA'
      '     ,pdecisionattrs    => :DECISION_ATTR'
      '    );'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CUSTOMS_NEW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY_CHIEF_UDF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'REASON'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IS_TS'
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
        DataType = ftString
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DECISION_ATTR'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_doc_reuse_customs_upd('
      '      pdocid            => :ID'
      '     ,pcustomsnewid     => :CUSTOMS_NEW_ID'
      '     ,psignedby         => :SIGNED_BY'
      '     ,psigndate         => :SIGN_DATE'
      '     ,psignedbychief    => :SIGNED_BY_CHIEF'
      '     ,psignedbychiefotp => :SIGNED_BY_CHIEF_UDF'
      '     ,preason           => :REASON'
      '     ,pappnumber        => :APP_NUMBER'
      '     ,pappdate          => :APP_DATE'
      '     ,pappnumberincome  => :APP_NUMBER_INCOME'
      '     ,pappdateincome    => :APP_DATE_INCOME'
      '     ,pdoccode          => :DOC_CODE'
      '     ,pdocosncode       => :DOC_OSN_CODE'
      '     ,pdebtssumma       => :DEBTS_SUMMA'
      '     ,pdecisionattrs    => :DECISION_ATTR'
      '     ,pDocNum          => :DOC_NUMBER'
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
        DataType = ftUnknown
        Name = 'CUSTOMS_NEW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY_CHIEF_UDF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REASON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_NUMBER_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_OSN_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEBTS_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DECISION_ATTR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )'
      '   AND TR_ACCESS_LEVEL = 1'
      '   AND fdc_check_sql_condition(CONDITION) = 1'
      '   AND 1 = :pVal')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'STATE_SCHEME_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pVal'
        ParamType = ptUnknown
      end>
  end
  inherited dsState: TfdcQuery
    AfterOpen = dsStateAfterOpen
  end
  object dsetCustoms: TOracleDataSet
    SQL.Strings = (
      'select * from ('
      
        'SELECT c.id, c.customs_code_8, c.name, fdc_customs_reuse_check(p' +
        '_params.CustomCode, c.customs_code_8) as available, c.dt_end'
      '  FROM fdc_customs_lst c'
      '  WHERE c.customs_code_8 LIKE '#39'%000'#39
      'union'
      
        'SELECT c.id, c.customs_code_8, c.name, fdc_customs_reuse_check(p' +
        '_params.CustomCode, c.customs_code_8) as available, c.dt_end'
      '  FROM fdc_customs_lst c'
      '  WHERE c.customs_code_8 = p_params.ELSCustomCode'
      '  )'
      'ORDER BY name')
    QBEDefinition.QBEFieldDefs = {
      04000000040000000E000000435553544F4D535F434F44455F38010000000000
      040000004E414D45010000000000020000004944010000000000090000004156
      41494C41424C45010000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Filter = 'DT_END = NULL'
    Left = 792
    Top = 160
    object dsetCustomsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetCustomsCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsetCustomsNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetCustomsAVAILABLE: TFloatField
      FieldName = 'AVAILABLE'
    end
    object dsetCustomsDT_END: TDateField
      FieldName = 'DT_END'
    end
  end
  object dsCustoms: TDataSource
    AutoEdit = False
    DataSet = dsetCustoms
    Left = 792
    Top = 208
  end
  object dsetCurrency: TOracleDataSet
    SQL.Strings = (
      'SELECT * FROM ('
      'SELECT t.id'
      '      ,t.code'
      '      ,t.name'
      '      ,t.acode'
      
        '      ,NVL( (SELECT '#39'Y'#39' FROM fdc_currency_usable_lst cu WHERE cu' +
        '.id = t.id), '#39'N'#39' ) AS is_usable'
      '  FROM fdc_nsi_currency_lst t'
      '  ORDER BY'
      '    CASE t.code'
      '      WHEN '#39'643'#39' THEN '#39'  1'#39
      '      WHEN '#39'840'#39' THEN '#39'  2'#39
      '      WHEN '#39'978'#39' THEN '#39'  3'#39
      '      WHEN '#39'156'#39' THEN '#39'  4'#39
      '      ELSE t.code'
      '    END'
      ')')
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000004000000434F444501000000
      0000040000004E414D450100000000000500000041434F444501000000000009
      00000049535F555341424C45010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Filter = 'IS_USABLE = '#39'Y'#39
    Left = 712
    Top = 160
    object dsetCurrencyID: TFloatField
      FieldName = 'ID'
    end
    object dsetCurrencyCODE: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'CODE'
      Size = 3
    end
    object dsetCurrencyNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 60
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetCurrencyACODE: TStringField
      DisplayLabel = #1041#1091#1082#1074'. '#1050#1086#1076
      FieldName = 'ACODE'
      Size = 3
    end
    object dsetCurrencyIS_USABLE: TStringField
      FieldName = 'IS_USABLE'
      Size = 1
    end
  end
  object dsCurrency: TDataSource
    DataSet = dsetCurrency
    Left = 712
    Top = 208
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'SELECT rc.doc_date,'
      '       rc.doc_number,'
      '       rc.SIGNED_BY as SIGN3,'
      #9#9#9' rc.SIGNED_BY_CHIEF as SIGN1,'
      #9#9#9' rc.SIGNED_BY_CHIEF_OTP as SIGN2,'
      #9#9#9' rc.SIGN_DATE,'
      #9#9#9' rc.CUSTOMS_CODE_OLD AS SRC_CUST_CODE,'
      
        '       p_nsi_customs.GetCustomsFullNameByCode8( rc.CUSTOMS_CODE_' +
        'OLD )'
      '                           AS src_cust_name,'
      #9#9#9' rc.CUSTOMS_CODE_NEW AS DST_CUST_CODE,'
      #9#9#9' t.name              AS DST_CUST_NAME,'
      '       rc.REASON,'
      '       decode(s.name, null, null, s.name || '#39', '#39') AS decl_name,'
      
        '       decode(s.okpo, null, null, '#39#1054#1050#1055#1054' '#39' || s.okpo || '#39', '#39') as ' +
        'decl_okpo,'
      
        '       decode(s.inn, null, null, '#39#1048#1053#1053' '#39' || s.inn || '#39', '#39') as dec' +
        'l_inn,'
      
        '       decode(s.kpp, null, null, '#39#1050#1055#1055' '#39' || s.kpp || '#39', '#39') as dec' +
        'l_kpp,'
      
        '       decode(s.address, null, null, s.address || '#39', '#39') as decl_' +
        'address,'
      '       rc.AMOUNT AS summa,'
      '       rc.typename as cash_assets_name,'
      '       c.shortname AS Currency'
      '  FROM fdc_doc_reuse_customs_lst rc'
      '  LEFT OUTER JOIN fdc_subject_lst      s ON s.id = rc.subject_id'
      
        '  LEFT OUTER JOIN fdc_nsi_currency_lst c ON c.id = rc.currency_i' +
        'd'
      
        #9'LEFT OUTER JOIN fdc_customs_lst      t ON t.ID = rc.customs_new' +
        '_id'
      '  WHERE rc.ID = :ID')
    Left = 488
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsReportDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsReportDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsReportSRC_CUST_CODE: TStringField
      FieldName = 'SRC_CUST_CODE'
      Size = 8
    end
    object dsReportDST_CUST_CODE: TStringField
      FieldName = 'DST_CUST_CODE'
      Size = 8
    end
    object dsReportDST_CUST_NAME: TStringField
      FieldName = 'DST_CUST_NAME'
      Size = 1500
    end
    object dsReportDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1502
    end
    object dsReportDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 17
    end
    object dsReportDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 18
    end
    object dsReportDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 16
    end
    object dsReportDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 202
    end
    object dsReportSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsReportCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Size = 1500
    end
    object dsReportCASH_ASSETS_NAME: TStringField
      FieldName = 'CASH_ASSETS_NAME'
      Size = 1500
    end
    object dsReportSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsReportSIGN3: TStringField
      FieldName = 'SIGN3'
      Size = 50
    end
    object dsReportSIGN1: TStringField
      FieldName = 'SIGN1'
      Size = 50
    end
    object dsReportSIGN2: TStringField
      FieldName = 'SIGN2'
      Size = 50
    end
    object dsReportREASON: TStringField
      FieldName = 'REASON'
      Size = 150
    end
    object dsReportSRC_CUST_NAME: TStringField
      FieldName = 'SRC_CUST_NAME'
      Size = 1500
    end
  end
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT dr.summa ||'#39' '#1088#1091#1073'. '#1087#1086' '#1087#1083#1072#1090#1077#1078#1085#1086#1084#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#8470#39'||po.doc_numb' +
        'er||'
      
        '       '#39' '#1086#1090' '#39'||po.doc_date||'#39' '#1085#1072' '#1089#1091#1084#1084#1091' '#39'||po.summa||'#39' '#1088#1091#1073'.'#39'  as ' +
        'Name'
      ' FROM fdc_deduction_reuse_lst dr'
      
        '  LEFT OUTER JOIN fdc_payment_order_lst po ON po.id = dr.payment' +
        '_id'
      ' where dr.decl_id = :ID and'
      
        '       ((dr.summa > 0 and (select count(1) from fdc_deduction_re' +
        'use_lst t'
      
        '                          where t.charge_curr_id = dr.charge_cur' +
        'r_id and'
      '                                t.payment_id = dr.payment_id and'
      '                                t.decl_id = dr.decl_id and'
      '                                t.kbkcode_id = dr.kbkcode_id and'
      '                                t.summa = -dr.summa)>0) or'
      
        '                          (select count(1) from fdc_deduction_re' +
        'use_lst t'
      
        '                          where t.charge_curr_id = dr.charge_cur' +
        'r_id and'
      '                                t.payment_id = dr.payment_id and'
      '                                t.decl_id = dr.decl_id and'
      '                                t.kbkcode_id = dr.kbkcode_id and'
      '                                t.summa = -dr.summa)=0)')
    Left = 560
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsPaymentOrderListNAME: TStringField
      FieldName = 'NAME'
      Size = 238
    end
  end
  object dsDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select od.name'
      '  from fdc_obligation_doc_lst od,'
      '       fdc_value_lst v'
      ' where v.owner_object_id = :id'
      '   and od.id = v.ref_object_id')
    Left = 640
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDeclListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object qryDetail: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT row_number() over (ORDER BY D.doc_date, D.doc_number) AS ' +
        'pp'
      '      ,CASE D.TypeSYSNAME'
      '         WHEN '#39'CustomCheque'#39'     THEN '#39#1058#1050#39
      '         WHEN '#39'CashOrderBank'#39'    THEN '#39#1055#1050#1054#39
      '         WHEN '#39'CashOrderCustoms'#39' THEN '#39#1055#1050#1054#39
      '         ELSE                         '#39#1087'/'#1087#39
      '       END            AS po_type'
      '      ,D.doc_number  AS po_num'
      '      ,D.doc_date    AS po_date'
      '      ,po.doc_summa   AS po_sum'
      '      ,SUM( r.summa ) AS ret_sum'
      '  FROM fdc_payment_order   po,'
      '       FDC_DOCUMENT_LST D,'
      '       fdc_deduction_reuse_lst r'
      ' WHERE po.id     = r.payment_id'
      '   AND r.decl_id = :ID'
      '   AND D.ID = PO.ID'
      ' GROUP BY D.TypeSYSNAME, D.doc_number, D.doc_date, po.doc_summa'
      ' ORDER BY D.doc_date, D.doc_number')
    Left = 267
    Top = 346
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryDetailPP: TFloatField
      FieldName = 'PP'
    end
    object qryDetailPO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      Size = 3
    end
    object qryDetailPO_NUM: TStringField
      FieldName = 'PO_NUM'
      Size = 100
    end
    object qryDetailPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object qryDetailPO_SUM: TFloatField
      FieldName = 'PO_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
    object qryDetailRET_SUM: TFloatField
      FieldName = 'RET_SUM'
      DisplayFormat = ',0.00;-,0.00'
    end
  end
end
