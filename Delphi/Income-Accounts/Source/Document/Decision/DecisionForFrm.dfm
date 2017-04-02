inherited DecisionForForm: TDecisionForForm
  Left = 442
  Top = 156
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1074#1086#1076#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 858
        end
        inherited edtDescript: TcxDBMemo
          Top = 1099
          TabOrder = 34
        end
        object edtDeclINNDest: TcxDBMaskEdit [2]
          Left = 145
          Top = 290
          AutoSize = False
          DataBinding.DataField = 'SUB_INN_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Height = 21
          Width = 321
        end
        object edtDeclKppDest: TcxDBMaskEdit [3]
          Tag = 13
          Left = 495
          Top = 290
          DataBinding.DataField = 'SUB_KPP_DEST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 14
          Width = 227
        end
        object edtDeclNameDest: TfdcObjectLinkEdit [4]
          Left = 145
          Top = 317
          DataBinding.DataField = 'SUB_NAME_DEST'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUB_ID_DEST'
          DataBinding.TypeSysName = 'Declarant;Person;Broker;Subject'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 15
          OnBeforeAcceptObject = edtDeclNameDestBeforeAcceptObject
          Width = 577
        end
        object edtSumma: TcxDBCurrencyEdit [5]
          Left = 145
          Top = 586
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 22
          Width = 813
        end
        object edtCurrID: TfdcObjectLookupEdit [6]
          Left = 145
          Top = 559
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCurrency
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 21
          Width = 813
        end
        object cxDBRadioGroup1: TcxDBRadioGroup [7]
          Left = 21
          Top = 388
          DataBinding.DataField = 'REASON'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.Columns = 2
          Properties.DefaultValue = 0
          Properties.Items = <
            item
              Caption = #1047#1072#1103#1074#1083#1077#1085#1080#1077' '#1091#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
              Value = 0
            end
            item
              Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
              Value = 1
            end>
          Properties.OnChange = cxDBRadioGroup1PropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          TabOrder = 16
          Height = 40
          Width = 701
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Enabled = False
          Width = 536
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 710
          Enabled = False
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Width = 792
        end
        inherited edtAppDate: TcxDBDateEdit
          Top = 434
          TabOrder = 17
          Width = 577
        end
        inherited edtAppDateIncome: TcxDBDateEdit
          Left = 145
          Top = 461
          TabOrder = 18
          Width = 577
        end
        inherited edtAppNumber: TcxDBTextEdit
          Top = 488
          TabOrder = 19
          Width = 577
        end
        inherited edtSignBy: TcxDBTextEdit
          Top = 1032
          Enabled = False
          TabOrder = 32
          Width = 577
        end
        inherited edtSignDate: TcxDBDateEdit
          Top = 1059
          Enabled = False
          TabOrder = 33
          Width = 577
        end
        inherited edtSignByChief: TcxDBLookupComboBox
          Top = 978
          TabOrder = 30
          Width = 577
        end
        inherited edtSignByChiefUDS: TcxDBLookupComboBox
          Top = 1005
          TabOrder = 31
          Width = 577
        end
        inherited cmbxReason: TfdcObjectLookupEdit
          Top = 657
          TabOrder = 23
        end
        inherited edtDocNumberFull: TcxDBTextEdit
          Width = 792
        end
        inherited edtAppNumberIncome: TcxDBTextEdit
          Left = 816
          Top = 488
          TabOrder = 20
        end
        inherited edtSudReason: TcxDBLookupComboBox
          Top = 684
          TabOrder = 24
          Width = 792
        end
        inherited edtDebtsSumma: TcxDBCurrencyEdit
          Top = 755
          TabOrder = 25
          Width = 792
        end
        inherited edtDebtsPaySumma: TcxDBCurrencyEdit
          Top = 840
          TabOrder = 27
        end
        inherited edtDebtsProcSumma: TcxDBCurrencyEdit
          Top = 867
          TabOrder = 28
        end
        inherited edtDebtsPenySumma: TcxDBCurrencyEdit
          Top = 894
          TabOrder = 29
        end
        inherited edtDebtsSummaS: TcxDBCurrencyEdit
          Top = 782
          TabOrder = 26
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 175
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 816
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
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' - '#1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1074#1086#1076#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
          end
          inherited lcgDeclarant: TdxLayoutGroup
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' ('#1055#1083#1072#1090#1077#1083#1100#1097#1080#1082')'
          end
          object lcgDeclarantDest: TdxLayoutGroup [3]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' ('#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100')'
            object lcGeneralGroup6: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclInnDest: TdxLayoutItem
                AutoAligns = []
                Caption = #1048#1053#1053
                Control = edtDeclINNDest
                ControlOptions.ShowBorder = False
              end
              object lciDeclKppDest: TdxLayoutItem
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclKppDest
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclNameDest: TdxLayoutItem
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Control = edtDeclNameDest
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgApp: TdxLayoutGroup
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1074#1086#1076#1072' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
            object lcGeneralItem3: TdxLayoutItem [0]
              Caption = 'cxDBRadioGroup1'
              ShowCaption = False
              Control = cxDBRadioGroup1
              ControlOptions.ShowBorder = False
            end
            inherited lcgAppDate: TdxLayoutGroup
              LayoutDirection = ldVertical
            end
          end
          object lcgSumma: TdxLayoutGroup [5]
            Caption = #1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1074#1086#1076#1072
            object lciCurrency: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              Control = edtCurrID
              ControlOptions.ShowBorder = False
            end
            object lciSumma: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcgReason: TdxLayoutGroup
            inherited lciReason: TdxLayoutItem
              Visible = False
            end
          end
          inherited lcgDepts: TdxLayoutGroup
            Visible = False
          end
          inherited lcgSign: TdxLayoutGroup
            inherited lciSignByChiefUDF: TdxLayoutItem
              Visible = False
            end
          end
        end
      end
    end
    object tabPaymentOrder1: TcxTabSheet [1]
      Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
      ImageIndex = 2
      OnShow = tabPaymentOrder1Show
    end
  end
  inherited ActionList: TActionList
    inherited actPrint: TAction
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
        FloatLeft = 487
        FloatTop = 166
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
        DataType = ftInteger
        Name = 'Form'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pDecId'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PO_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select     D.ID,'
      '              D.REASON, '
      '              D.NAME, '
      '              D.SHORTNAME, '
      '              D.OBJECT_TYPE_ID, '
      '              D.STATE_ID, '
      '              D.ACCESSLEVEL, '
      '              D.SYSNAME, '
      '              D.DESCRIPT, '
      '              D.OWNER_OBJECT_ID, '
      '              D.TypeNAME, '
      '              D.TypeSYSNAME, '
      '              D.ObjectKindList, '
      '              D.DOC_DATE, '
      '              D.DOC_NUMBER, '
      '              D.IS_ACTIVE, '
      '              D.ACTIVATION_DATE, '
      '              D.REASON_ID,'
      '              D.APP_NUMBER, '
      '              D.APP_DATE, '
      '              D.APP_DATE_INCOME, '
      '              D.SIGNED_BY, '
      '              D.SIGN_DATE, '
      '              D.SIGNED_BY_CHIEF, '
      '              D.SIGNED_BY_CHIEF_UDF, '
      '              D.SUB_ID   AS SUBJECT_ID,'
      '              D.SUB_NAME AS DECL_NAME,'
      '              D.SUB_INN  AS DECL_INN,'
      '              D.SUB_KPP AS DECL_KPP,'
      '              D.SUB_ID_DEST,'
      '              D.SUB_NAME_DEST,'
      '              D.SUB_INN_DEST,'
      '              D.SUB_KPP_DEST,'
      '              D.SUMMA,'
      '              D.CURRENCY_ID'
      ''
      '  from fdc_decision_for_Lst d'
      ' where d.ID = :ID')
    inherited dsDataSUBJECT_ID: TFloatField
      Required = True
    end
    object dsDataREASON: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1087#1077#1088#1077#1074#1086#1076#1072' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
      FieldName = 'REASON'
      Required = True
    end
    object dsDataSUB_ID_DEST: TFloatField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'SUB_ID_DEST'
      Required = True
    end
    object dsDataSUB_NAME_DEST: TStringField
      FieldName = 'SUB_NAME_DEST'
      Size = 4000
    end
    object dsDataSUB_INN_DEST: TStringField
      FieldName = 'SUB_INN_DEST'
      Size = 12
    end
    object dsDataSUB_KPP_DEST: TStringField
      FieldName = 'SUB_KPP_DEST'
      Size = 10
    end
    object dsDataCURRENCY_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the function'
      '  :ID ::= fdc_decision_for_add(pDocType        => :TYPESYSNAME,'
      
        '                                   pdecisionnumber => :DOC_NUMBE' +
        'R,'
      '                                   pdecisiondate   => :DOC_DATE,'
      
        '                                   psubjectid      => :SUBJECT_I' +
        'D,'
      
        '                                   pappnumber      => :APP_NUMBE' +
        'R,'
      '                                   pappdate        => :APP_DATE,'
      
        '                                   pappdateincome  => :APP_DATE_' +
        'INCOME,'
      
        '                                   preasonid       => :REASON_ID' +
        ','
      '                                   preason         => :REASON,'
      
        '                                   psubjectdestid  => :SUB_ID_DE' +
        'ST,'
      
        '                                   psignedbychief  => :SIGNED_BY' +
        '_CHIEF,'
      '                                   pgendocnum      => NULL,'
      '                                   psumma          => :SUMMA,'
      
        '                                   pcurrencyid     => :CURRENCY_' +
        'ID,'
      '                                   pPoId             => :PO_ID);'
      'end;'
      '')
    AfterPost = dsInsertAfterPost
    ParamData = <
      item
        DataType = ftUnknown
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
        DataType = ftInteger
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
        DataType = ftInteger
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'REASON'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUB_ID_DEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PO_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      ' fdc_decision_for_UPD(pid             => :ID,'
      '                      pdecisionnumber => :DOC_NUMBER,'
      '                      pdecisiondate   => :DOC_DATE,'
      '                      psubjectid      => :SUBJECT_ID,'
      '                      pappnumber      => :APP_NUMBER,'
      '                      pappdate        => :APP_DATE,'
      '                      pappdateincome  => :APP_DATE_INCOME,'
      '                      preasonid       => :REASON_ID,'
      '                      preason         => :REASON,'
      '                      psubjectiddest  => :SUB_ID_DEST,'
      '                      psignedby       => :SIGNED_BY,'
      '                      psignedbychief  => :SIGNED_BY_CHIEF,'
      '                      psigndate       => :SIGN_DATE,'
      '                      psumma          => :SUMMA,'
      '                      pcurrencyid     => :CURRENCY_ID);'
      ''
      'end;')
    ParamData = <
      item
        DataType = ftInteger
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
        DataType = ftInteger
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
        DataType = ftUnknown
        Name = 'APP_DATE_INCOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'REASON'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SUB_ID_DEST'
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
        DataType = ftUnknown
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end>
  end
  inherited srcAccessLevel: TDataSource
    Left = 508
  end
end
