inherited CancelDecisionPaybackForm: TCancelDecisionPaybackForm
  Width = 901
  Height = 455
  Caption = #1054#1090#1084#1077#1085#1072' '#1088#1077#1096#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 893
    Height = 421
    ClientRectBottom = 397
    ClientRectRight = 893
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 887
        Height = 366
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 384
          TabOrder = 15
          Height = 91
          Width = 417
        end
        object edtDecisionDocNumber: TcxDBTextEdit [2]
          Left = 112
          Top = 219
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = dsGetDecision
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 157
        end
        object edtDecisionDocDate: TcxDBDateEdit [3]
          Left = 361
          Top = 219
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = dsGetDecision
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 267
        end
        object edtSumma: TcxDBCurrencyEdit [4]
          Left = 112
          Top = 246
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = dsGetDecision
          Enabled = False
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 11
          Width = 813
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [5]
          Left = 112
          Top = 273
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = dsGetDecision
          Enabled = False
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
          TabOrder = 12
          Width = 813
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 100
        end
        inherited edtDeclarant: TfdcObjectLinkEdit
          Left = 112
          Top = 148
          Enabled = False
          Width = 377
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 112
          Top = 121
          Enabled = False
          Width = 200
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 600
          Top = 121
          Enabled = False
          Width = 121
        end
        object edtCancelReason: TcxDBMemo [11]
          Left = 100
          Top = 340
          DataBinding.DataField = 'CANCELREASON'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.ScrollBars = ssVertical
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 14
          Height = 38
          Width = 778
        end
        object edtCancelLevel: TcxDBTextEdit [12]
          Left = 100
          Top = 313
          DataBinding.DataField = 'CANCELLEVEL'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 13
          Width = 157
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Left = 751
          Style.IsFontAssigned = True
        end
        inherited edtIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcgDeclarant: TdxLayoutGroup
            ShowCaption = True
            Hidden = False
            ShowBorder = True
          end
          object lcGeneralGroup2: TdxLayoutGroup [3]
            Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDecDocNumber: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDecisionDocNumber
                ControlOptions.ShowBorder = False
              end
              object lciDecDocData: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDecisionDocDate
                ControlOptions.ShowBorder = False
              end
            end
            object lciDecSumma: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lciCurrent: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxedtCurrID
              ControlOptions.ShowBorder = False
            end
          end
          object lciCancelLevel: TdxLayoutItem [4]
            Caption = #1059#1088#1086#1074#1077#1085#1100
            Control = edtCancelLevel
            ControlOptions.ShowBorder = False
          end
          object lciCancelReason: TdxLayoutItem [5]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1072#1079#1072
            Control = edtCancelReason
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 893
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 366
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 394
        Width = 893
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 890
        Height = 366
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 893
        Height = 397
        ClientRectBottom = 373
        ClientRectRight = 893
      end
    end
    object tabPaymentOrderPayBack: TcxTabSheet
      Caption = #1047#1072#1103#1074#1082#1080' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
      ImageIndex = 4
      OnShow = tabPaymentOrderPayBackShow
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
        FloatLeft = 376
        FloatTop = 201
        FloatClientWidth = 103
        FloatClientHeight = 72
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
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataSUBJECT_ID
      end
      item
        DataType = ftUnknown
        Name = 'Form'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DEC_ID'
        ParamType = ptUnknown
        SourceField = dsDataDEC_PAY_ID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from FDC_CANCEL_DEC_PAYBACK_LST'
      'where id = :id')
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataDEC_PAY_ID: TFloatField
      FieldName = 'DEC_PAY_ID'
    end
    object dsDataDEC_DATE: TDateTimeField
      FieldName = 'DEC_DATE'
    end
    object dsDataDEC_NUMBER: TStringField
      FieldName = 'DEC_NUMBER'
      Size = 100
    end
    object dsDataDEC_SUMMA: TFloatField
      FieldName = 'DEC_SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDEC_CURR_CODE: TStringField
      FieldName = 'DEC_CURR_CODE'
      Size = 3
    end
    object dsDataDEC_CURR_NAME: TStringField
      FieldName = 'DEC_CURR_NAME'
      Size = 1500
    end
    object dsDataCANCELLEVEL: TStringField
      FieldName = 'CANCELLEVEL'
      Size = 150
    end
    object dsDataCANCELREASON: TStringField
      FieldName = 'CANCELREASON'
      Size = 1500
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID := fdc_cancel_dec_payback_add(pdoctype   => :TYPESYSNAME,'
      '                                    pdocnumber => :doc_number,'
      '                                    pdocdate   => :doc_date,'
      '                                    psubjectid => :subject_id,'
      '                                    pdecpayid  => :dec_pay_id,'
      
        '                                    pcancellevel => :cancellevel' +
        ','
      
        '                                   pcancelreason => :cancelreaso' +
        'n);'
      ''
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = '='
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dec_pay_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cancellevel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cancelreason'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_cancel_dec_payback_upd(pid => :id,'
      '                             pdocnumber => :doc_number,'
      '                             pdocdate => :doc_date,'
      '                             pcancelreason => :cancelreason);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'doc_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cancelreason'
        ParamType = ptUnknown
      end>
  end
  inherited dsReport: TfdcQuery
    Top = 288
  end
  object OdsGetDecision: TOracleDataSet
    SQL.Strings = (
      'select * from fdc_decision_payback_lst where id = :pId')
    Variables.Data = {
      0300000001000000040000003A50494403000000040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000002E000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C49535401000000000008000000444F435F444154450100000000
      000A000000444F435F4E554D4245520100000000000900000049535F41435449
      56450100000000000F00000041435449564154494F4E5F444154450100000000
      0009000000524541534F4E5F49440100000000000A0000005355424A4543545F
      49440100000000000A0000004150505F4E554D42455201000000000008000000
      4150505F444154450100000000000F0000004150505F444154455F494E434F4D
      450100000000000500000053554D4D410100000000000900000042414E4B5F44
      4154450100000000000B00000043555252454E43595F49440100000000000A00
      0000444553545355425F4944010000000000070000004143434F554E54010000
      0000000700000042414E4B5F4944010000000000090000005349474E5F444154
      45010000000000090000005349474E45445F42590100000000000F0000005349
      474E45445F42595F4348494546010000000000130000005349474E45445F4259
      5F43484945465F554446010000000000090000004445434C5F4E414D45010000
      000000080000004445434C5F494E4E010000000000080000004445434C5F4B50
      50010000000000090000004445434C5F4F4B504F0100000000000C0000004445
      434C5F414444524553530100000000000E0000004445434C5F4E414D455F4445
      53540100000000000D0000004445434C5F494E4E5F444553540100000000000D
      0000004445434C5F4B50505F444553540100000000000E0000004445434C5F4F
      4B504F5F44455354010000000000110000004445434C5F414444524553535F44
      4553540100000000000E0000004445434C5F42414E4B5F444553540100000000
      00120000004445434C5F4144525F42414E4B5F44455354010000000000030000
      004249430100000000000A0000004B424B434F44455F49440100000000000700
      00004B424B434F4445010000000000}
    Session = MainData.Session
    Left = 163
    Top = 266
    object OdsGetDecisionID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object OdsGetDecisionNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object OdsGetDecisionSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object OdsGetDecisionOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
      Required = True
    end
    object OdsGetDecisionSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object OdsGetDecisionACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object OdsGetDecisionSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object OdsGetDecisionDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object OdsGetDecisionOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object OdsGetDecisionTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Required = True
      Size = 1500
    end
    object OdsGetDecisionTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Required = True
      Size = 1500
    end
    object OdsGetDecisionOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object OdsGetDecisionDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object OdsGetDecisionDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object OdsGetDecisionIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Required = True
      Size = 1
    end
    object OdsGetDecisionACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
    object OdsGetDecisionREASON_ID: TFloatField
      FieldName = 'REASON_ID'
    end
    object OdsGetDecisionSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object OdsGetDecisionAPP_NUMBER: TStringField
      FieldName = 'APP_NUMBER'
      Size = 100
    end
    object OdsGetDecisionAPP_DATE: TDateTimeField
      FieldName = 'APP_DATE'
    end
    object OdsGetDecisionAPP_DATE_INCOME: TDateTimeField
      FieldName = 'APP_DATE_INCOME'
    end
    object OdsGetDecisionSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object OdsGetDecisionBANK_DATE: TDateTimeField
      FieldName = 'BANK_DATE'
    end
    object OdsGetDecisionCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object OdsGetDecisionDESTSUB_ID: TFloatField
      FieldName = 'DESTSUB_ID'
    end
    object OdsGetDecisionACCOUNT: TStringField
      FieldName = 'ACCOUNT'
    end
    object OdsGetDecisionBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object OdsGetDecisionSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object OdsGetDecisionSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object OdsGetDecisionSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object OdsGetDecisionSIGNED_BY_CHIEF_UDF: TStringField
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      Size = 50
    end
    object OdsGetDecisionDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object OdsGetDecisionDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object OdsGetDecisionDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object OdsGetDecisionDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object OdsGetDecisionDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object OdsGetDecisionDECL_NAME_DEST: TStringField
      FieldName = 'DECL_NAME_DEST'
      Size = 1500
    end
    object OdsGetDecisionDECL_INN_DEST: TStringField
      FieldName = 'DECL_INN_DEST'
      Size = 12
    end
    object OdsGetDecisionDECL_KPP_DEST: TStringField
      FieldName = 'DECL_KPP_DEST'
      Size = 10
    end
    object OdsGetDecisionDECL_OKPO_DEST: TStringField
      FieldName = 'DECL_OKPO_DEST'
      Size = 10
    end
    object OdsGetDecisionDECL_ADDRESS_DEST: TStringField
      FieldName = 'DECL_ADDRESS_DEST'
      Size = 200
    end
    object OdsGetDecisionDECL_BANK_DEST: TStringField
      FieldName = 'DECL_BANK_DEST'
      Size = 4000
    end
    object OdsGetDecisionDECL_ADR_BANK_DEST: TStringField
      FieldName = 'DECL_ADR_BANK_DEST'
      Size = 200
    end
    object OdsGetDecisionBIC: TStringField
      FieldName = 'BIC'
      Size = 10
    end
    object OdsGetDecisionKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object OdsGetDecisionKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
  end
  object dsGetDecision: TDataSource
    DataSet = OdsGetDecision
    Left = 163
    Top = 314
  end
end
