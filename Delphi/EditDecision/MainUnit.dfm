object MainForm: TMainForm
  Left = 217
  Top = 202
  Width = 870
  Height = 500
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 862
    Height = 41
    Align = alBottom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 752
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 26
    Width = 862
    Height = 406
    Align = alClient
    TabOrder = 1
    object cxGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGetDecision
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGridDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'OBJECT_TYPE_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSTATE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'STATE_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewACCESSLEVEL: TcxGridDBColumn
        DataBinding.FieldName = 'ACCESSLEVEL'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSYSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SYSNAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'OWNER_OBJECT_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewTYPENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TYPENAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewTYPESYSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TYPESYSNAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewOBJECTKINDLIST: TcxGridDBColumn
        DataBinding.FieldName = 'OBJECTKINDLIST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDOC_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'DOC_DATE'
        Options.Editing = False
      end
      object cxGridDBTableViewDOC_NUMBER: TcxGridDBColumn
        DataBinding.FieldName = 'DOC_NUMBER'
        Options.Editing = False
      end
      object cxGridDBTableViewIS_ACTIVE: TcxGridDBColumn
        DataBinding.FieldName = 'IS_ACTIVE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewACTIVATION_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVATION_DATE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewEXT_SOURCE: TcxGridDBColumn
        DataBinding.FieldName = 'EXT_SOURCE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewEXT_TYPESYSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EXT_TYPESYSNAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewEXT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'EXT_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewREASON_ID: TcxGridDBColumn
        DataBinding.FieldName = 'REASON_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewREASON_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'REASON_NAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSUBJECT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'SUBJECT_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewAPP_NUMBER: TcxGridDBColumn
        DataBinding.FieldName = 'APP_NUMBER'
        Options.Editing = False
      end
      object cxGridDBTableViewAPP_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'APP_DATE'
        Options.Editing = False
      end
      object cxGridDBTableViewAPP_NUMBER_INCOME: TcxGridDBColumn
        DataBinding.FieldName = 'APP_NUMBER_INCOME'
        Options.Editing = False
      end
      object cxGridDBTableViewAPP_DATE_INCOME: TcxGridDBColumn
        DataBinding.FieldName = 'APP_DATE_INCOME'
        Options.Editing = False
      end
      object cxGridDBTableViewSIGN_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'SIGN_DATE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSIGNED_BY: TcxGridDBColumn
        DataBinding.FieldName = 'SIGNED_BY'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSIGNED_BY_CHIEF: TcxGridDBColumn
        DataBinding.FieldName = 'SIGNED_BY_CHIEF'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSIGNED_BY_CHIEF_UDF: TcxGridDBColumn
        DataBinding.FieldName = 'SIGNED_BY_CHIEF_UDF'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewSUMMA: TcxGridDBColumn
        DataBinding.FieldName = 'SUMMA'
        Options.Editing = False
      end
      object cxGridDBTableViewBANK_DATE: TcxGridDBColumn
        DataBinding.FieldName = 'BANK_DATE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewCURRENCY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCY_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDESTSUB_ID: TcxGridDBColumn
        DataBinding.FieldName = 'DESTSUB_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewACCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'ACCOUNT'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewBANK_ID: TcxGridDBColumn
        DataBinding.FieldName = 'BANK_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewBANK_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'BANK_NAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewBANK_BIC: TcxGridDBColumn
        DataBinding.FieldName = 'BANK_BIC'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_NAME'
        Options.Editing = False
        Width = 248
      end
      object cxGridDBTableViewDECL_INN: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_INN'
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_KPP: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_KPP'
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_OKPO: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_OKPO'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_ADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_ADDRESS'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_NAME_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_NAME_DEST'
        Options.Editing = False
        Width = 291
      end
      object cxGridDBTableViewDECL_INN_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_INN_DEST'
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_KPP_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_KPP_DEST'
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_OKPO_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_OKPO_DEST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_ADDRESS_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_ADDRESS_DEST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_BANK_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_BANK_DEST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_ADR_BANK_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_ADR_BANK_DEST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECL_NAME_BANK_DEST: TcxGridDBColumn
        DataBinding.FieldName = 'DECL_NAME_BANK_DEST'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewBIC: TcxGridDBColumn
        DataBinding.FieldName = 'BIC'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewCORR_ACCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'CORR_ACCOUNT'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewKBKCODE_ID: TcxGridDBColumn
        DataBinding.FieldName = 'KBKCODE_ID'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewKBKCODE: TcxGridDBColumn
        DataBinding.FieldName = 'KBKCODE'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewPERSONAL_ACCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'PERSONAL_ACCOUNT'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDATE_LAST_DOC: TcxGridDBColumn
        DataBinding.FieldName = 'DATE_LAST_DOC'
        Options.Editing = False
      end
      object cxGridDBTableViewCUSTOMSFULLNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTOMSFULLNAME'
        Visible = False
        Options.Editing = False
      end
      object cxGridDBTableViewDECISION_COURT: TcxGridDBColumn
        DataBinding.FieldName = 'DECISION_COURT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = #1044#1072
        Properties.DisplayUnchecked = #1053#1077#1090
        Properties.DisplayGrayed = #1053#1077#1090
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        Width = 88
      end
      object cxGridDBTableViewDATE_COURT: TcxGridDBColumn
        DataBinding.FieldName = 'DATE_COURT'
        PropertiesClassName = 'TcxDateEditProperties'
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object OracleLogon: TOracleLogon
    Session = OracleSession
    Options = [ldAuto, ldDatabase, ldDatabaseList, ldLogonHistory, ldConnectAs]
    Left = 200
    Top = 152
  end
  object OracleSession: TOracleSession
    Left = 200
    Top = 216
  end
  object odsGetDecision: TOracleDataSet
    SQL.Strings = (
      'select * from fdc_decision_payback_lst '
      'where '
      '        doc_date < to_date('#39'01012011'#39','#39'ddmmyyyy'#39')')
    ReadBuffer = 500
    QBEDefinition.QBEFieldDefs = {
      040000003D000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C49535401000000000008000000444F435F444154450100000000
      000A000000444F435F4E554D4245520100000000000900000049535F41435449
      56450100000000000F00000041435449564154494F4E5F444154450100000000
      000A0000004558545F534F555243450100000000000F0000004558545F545950
      455359534E414D45010000000000060000004558545F49440100000000000900
      0000524541534F4E5F49440100000000000B000000524541534F4E5F4E414D45
      0100000000000A0000005355424A4543545F49440100000000000A0000004150
      505F4E554D424552010000000000080000004150505F44415445010000000000
      110000004150505F4E554D4245525F494E434F4D450100000000000F00000041
      50505F444154455F494E434F4D45010000000000090000005349474E5F444154
      45010000000000090000005349474E45445F42590100000000000F0000005349
      474E45445F42595F4348494546010000000000130000005349474E45445F4259
      5F43484945465F5544460100000000000500000053554D4D4101000000000009
      00000042414E4B5F444154450100000000000B00000043555252454E43595F49
      440100000000000A000000444553545355425F49440100000000000700000041
      43434F554E540100000000000700000042414E4B5F4944010000000000090000
      0042414E4B5F4E414D450100000000000800000042414E4B5F42494301000000
      0000090000004445434C5F4E414D45010000000000080000004445434C5F494E
      4E010000000000080000004445434C5F4B505001000000000009000000444543
      4C5F4F4B504F0100000000000C0000004445434C5F4144445245535301000000
      00000E0000004445434C5F4E414D455F444553540100000000000D0000004445
      434C5F494E4E5F444553540100000000000D0000004445434C5F4B50505F4445
      53540100000000000E0000004445434C5F4F4B504F5F44455354010000000000
      110000004445434C5F414444524553535F444553540100000000000E00000044
      45434C5F42414E4B5F44455354010000000000120000004445434C5F4144525F
      42414E4B5F44455354010000000000130000004445434C5F4E414D455F42414E
      4B5F44455354010000000000030000004249430100000000000C000000434F52
      525F4143434F554E540100000000000A0000004B424B434F44455F4944010000
      000000070000004B424B434F444501000000000010000000504552534F4E414C
      5F4143434F554E540100000000000D000000444154455F4C4153545F444F4301
      00000000000F000000435553544F4D5346554C4C4E414D450100000000000A00
      00004558434953455F5041590100000000000E0000004445434953494F4E5F43
      4F5552540100000000000A000000444154455F434F555254010000000000}
    QueryAllRecords = False
    CountAllRecords = True
    OnApplyRecord = odsGetDecisionApplyRecord
    Session = OracleSession
    Left = 200
    Top = 272
    object odsGetDecisionID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object odsGetDecisionNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object odsGetDecisionSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionSYSNAME: TStringField
      FieldName = 'SYSNAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionTYPENAME: TStringField
      FieldName = 'TYPENAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      ReadOnly = True
      Visible = False
      Size = 4000
    end
    object odsGetDecisionDOC_DATE: TDateTimeField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'DOC_DATE'
      ReadOnly = True
    end
    object odsGetDecisionDOC_NUMBER: TStringField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'DOC_NUMBER'
      ReadOnly = True
      Size = 100
    end
    object odsGetDecisionIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      ReadOnly = True
      Required = True
      Visible = False
      Size = 1
    end
    object odsGetDecisionACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      ReadOnly = True
      Visible = False
      Size = 8
    end
    object odsGetDecisionEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionEXT_ID: TFloatField
      FieldName = 'EXT_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionREASON_ID: TFloatField
      FieldName = 'REASON_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionREASON_NAME: TStringField
      FieldName = 'REASON_NAME'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionAPP_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'APP_NUMBER'
      ReadOnly = True
      Size = 50
    end
    object odsGetDecisionAPP_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
      FieldName = 'APP_DATE'
      ReadOnly = True
    end
    object odsGetDecisionAPP_NUMBER_INCOME: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1072#1103')'
      DisplayWidth = 10
      FieldName = 'APP_NUMBER_INCOME'
      ReadOnly = True
      Size = 50
    end
    object odsGetDecisionAPP_DATE_INCOME: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1072#1103')'
      FieldName = 'APP_DATE_INCOME'
      ReadOnly = True
    end
    object odsGetDecisionSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object odsGetDecisionSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object odsGetDecisionSIGNED_BY_CHIEF_UDF: TStringField
      FieldName = 'SIGNED_BY_CHIEF_UDF'
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object odsGetDecisionSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      ReadOnly = True
    end
    object odsGetDecisionBANK_DATE: TDateTimeField
      FieldName = 'BANK_DATE'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionDESTSUB_ID: TFloatField
      FieldName = 'DESTSUB_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionACCOUNT: TStringField
      FieldName = 'ACCOUNT'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionBANK_ID: TFloatField
      FieldName = 'BANK_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionBANK_NAME: TStringField
      DisplayLabel = #1041#1072#1085#1082
      DisplayWidth = 50
      FieldName = 'BANK_NAME'
      ReadOnly = True
      Visible = False
      Size = 4000
    end
    object odsGetDecisionBANK_BIC: TStringField
      DisplayLabel = #1041#1048#1050
      FieldName = 'BANK_BIC'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object odsGetDecisionDECL_NAME: TStringField
      DisplayLabel = #1044#1077#1082#1083#1072#1088#1072#1085#1090
      DisplayWidth = 100
      FieldName = 'DECL_NAME'
      ReadOnly = True
      Size = 1500
    end
    object odsGetDecisionDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN'
      ReadOnly = True
      Size = 12
    end
    object odsGetDecisionDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      ReadOnly = True
      Size = 10
    end
    object odsGetDecisionDECL_OKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'DECL_OKPO'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object odsGetDecisionDECL_ADDRESS: TStringField
      DisplayWidth = 50
      FieldName = 'DECL_ADDRESS'
      ReadOnly = True
      Visible = False
      Size = 200
    end
    object odsGetDecisionDECL_NAME_DEST: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 100
      FieldName = 'DECL_NAME_DEST'
      ReadOnly = True
      Size = 1500
    end
    object odsGetDecisionDECL_INN_DEST: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DECL_INN_DEST'
      ReadOnly = True
      Size = 12
    end
    object odsGetDecisionDECL_KPP_DEST: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DECL_KPP_DEST'
      ReadOnly = True
      Size = 10
    end
    object odsGetDecisionDECL_OKPO_DEST: TStringField
      FieldName = 'DECL_OKPO_DEST'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object odsGetDecisionDECL_ADDRESS_DEST: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 50
      FieldName = 'DECL_ADDRESS_DEST'
      ReadOnly = True
      Visible = False
      Size = 200
    end
    object odsGetDecisionDECL_BANK_DEST: TStringField
      DisplayLabel = #1041#1072#1085#1082' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 100
      FieldName = 'DECL_BANK_DEST'
      ReadOnly = True
      Visible = False
      Size = 4000
    end
    object odsGetDecisionDECL_ADR_BANK_DEST: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 50
      FieldName = 'DECL_ADR_BANK_DEST'
      ReadOnly = True
      Visible = False
      Size = 200
    end
    object odsGetDecisionDECL_NAME_BANK_DEST: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1073#1072#1085#1082#1072' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 100
      FieldName = 'DECL_NAME_BANK_DEST'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionBIC: TStringField
      FieldName = 'BIC'
      ReadOnly = True
      Visible = False
      Size = 10
    end
    object odsGetDecisionCORR_ACCOUNT: TStringField
      FieldName = 'CORR_ACCOUNT'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 20
      FieldName = 'KBKCODE'
      ReadOnly = True
      Visible = False
      Size = 1500
    end
    object odsGetDecisionPERSONAL_ACCOUNT: TStringField
      FieldName = 'PERSONAL_ACCOUNT'
      ReadOnly = True
      Visible = False
    end
    object odsGetDecisionDATE_LAST_DOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DATE_LAST_DOC'
      ReadOnly = True
    end
    object odsGetDecisionCUSTOMSFULLNAME: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      DisplayWidth = 100
      FieldName = 'CUSTOMSFULLNAME'
      ReadOnly = True
      Size = 4000
    end
    object odsGetDecisionDECISION_COURT: TStringField
      DisplayLabel = #1055#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
      FieldName = 'DECISION_COURT'
      Size = 1
    end
    object odsGetDecisionDATE_COURT: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072' '#1074' '#1090#1072#1084#1086#1078#1085#1102
      FieldName = 'DATE_COURT'
    end
  end
  object dsGetDecision: TDataSource
    DataSet = odsGetDecision
    Left = 280
    Top = 272
  end
  object oqUpdateDecision: TOracleQuery
    SQL.Strings = (
      'update fdc_decision_payback'
      '  set DATE_COURT = :date_court'
      '     ,DECISION_COURT = :decision_court'
      'where'
      '  id = :id     ')
    Session = OracleSession
    Variables.Data = {
      03000000030000000B0000003A444154455F434F5552540C0000000000000000
      0000000F0000003A4445434953494F4E5F434F55525405000000020000003100
      00000000030000003A4944030000000000000000000000}
    Left = 200
    Top = 328
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 404
        FloatTop = 229
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dxBarButton3
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = ImageList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 96
    Top = 96
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarButton1: TdxBarButton
      Action = aRefresh
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Action = aSave
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Action = aLoad
      Category = 0
      PaintStyle = psCaptionGlyph
    end
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 352
    Top = 176
    object aRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 4
      OnExecute = aRefreshExecute
    end
    object aLoad: TAction
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      ImageIndex = 1
      OnExecute = aLoadExecute
    end
    object aSave: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
      ImageIndex = 2
      OnExecute = aSaveExecute
    end
  end
  object ImageList: TImageList
    Left = 408
    Top = 176
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A3787500A3787500A378
      7500A3787500A3787500A3787500A3787500A3787500A3787500A3787500A378
      7500A378750090615E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A67C7600F2E2D300F2E2
      D300FFE8D100EFDFBB00FFE3C500FFDEBD00FFDDBA00FFD8B200FFD6AE00FFD2
      A500FFD2A3009364600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB807800F3E7DA00F3E7
      DA0001990100AFD8A00071C5700041AA300081BB5E00EFD4A600FFD6AE00FFD2
      A300FFD2A3009667630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0837A00F4E9DD00F4E9
      DD00019901000199010001990100019901000199010041AA2F00FFD8B200FFD4
      A900FFD4A9009A6A650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6897D00F5EDE400F5ED
      E4000199010001990100119E0E00CFD6A300FFE4C80021A21A00FFD8B200FFD7
      B000FFD7B0009E6D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC8E7F00F7EFE800F7EF
      E80001990100019901000199010001990100FFE4C800EFDEBA00FFD8B200FFD7
      B000FFD9B400A270690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3958100F8F3EF00F8F3
      EF00F8F3EF00FFF4E800FFF4E800FFF4E800EFE3C400EFE3C400FFE4C800FFDE
      BD00FFDDBB00A5746B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA9B8400F9F5F200FBFB
      FB00FFF4E800FFF4E800FFF4E800019901000199010001990100FFE8D100FFE3
      C500FFE1C200A8776D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2A18700F9F9F900FBFB
      FB00119F1000AFD8A000FFF4E800AFD8A0000199010001990100FFE8D100FFE4
      C800FFE3C600AC7A6F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9A88A00FBFBFB00FFFF
      FF0071C570000199010001990100019901000199010001990100FFE8D100FFE8
      D100FFE6CE00AE7C720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFAE8C00FCFCFC00FFFF
      FF00FFFFFF0071C570000199010001990100AFD8A00001990100FFE8D100FFC8
      C200FFB0B000B07E730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5B38F00FDFDFD00FDFD
      FD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00F4DECE00B280
      7400B2807400B280740000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAB89100FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300F5E1D200B280
      7400EDA75500D2A9950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBC9200FFFFFF00FFFF
      FF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0EDEA00E9DAD000B280
      7400D9B098000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2BF9400DCA98700DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700B280
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000000000000000
      000000000000000000000000000000000000DEE7E700946B6B009C7B7B00CEC6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A000000000000000000000000000000
      00000000000000000000A5A5A5007B7B7B007B737B00D6ADAD009C6B6B008C5A
      5A0094636300BDADAD00E7E7EF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000000000000000
      00000000000000000000847B84006B736B008CB59C00DEB5B500A56B6B00A573
      7300A57373008C5A5A00635A5A000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A000000000000000000000000000000
      00000000000031A53900BDBDBD005A73630000A52900CEB5AD00A5737300A573
      7300A5737300AD7373005A5252000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A000000000000000000000000000000
      000000000000008C0000429C4200A5B5AD00008C1000D6B5AD00AD737300A573
      7300AD737300AD737300635A5A000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF0000000000BFBFBF00000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A000000000008940800089408000894
      08001094100029C64A00109C1800399C39007BB57B00D6B5AD00AD8C8C009C8C
      8C00AD737300AD7B7B00635A5A000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD52520000000000089408004AE784004AE7
      84004AE784004AE784004AE77B00109C180031AD3900EFDEDE00CEB5B500CEC6
      C600AD7B7B00B57B7B006B6363000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A00000000000894080052EF8C0052EF
      8C0052EF8C0052EF8C0052EF840010A5210039A53900F7DEDE00B57B7B00B57B
      7B00B5848400B58484006B6363000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00000000000000000000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A0000000000189C1800109C1800109C
      1800109C180031CE520010A51800319C3100FFFFFF00EFC6C600B5848400B584
      8400B5848400BD848400736B6B000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000BFBFBF00FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      000000000000008C000042A54200C6BDBD00FFF7E700EFC6C600CE949400D6AD
      AD00C6949400BD848400736B6B000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00000000000042A54200CECECE008C847B00FFEFCE00EFC6C600D6ADAD00FFFF
      FF00FFEFEF00E7B5B500736B6B000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00000000000000000000A5A5A5008C847B00FFE7B500EFCECE00C6949400D6AD
      AD00DEB5B500D69C9C007B6B73000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00000000000000000000ADADAD008484840084848400C6A5A500C6A5A500C69C
      9C00C6949400C68C8C007B737300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      00000000000000000000ADADAD00ADADAD00A5A5A5009C9C9C00949494008C94
      9400848C8C00848484009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF0000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8003000000000000800300000000000080030000000000008003000000000000
      8007000000000000800F000000000000FFDFFFFFC001FFFFFFCFFC008000FF0F
      FFC7FC008000FC010003FC008000FC010001FC008000F8010000EC008000F801
      0001E400800080010003E000800080010007000080008001000F000180008001
      001F00038000F801007F00078000F80100FF000F8000FC0101FFE3FF8000FC01
      03FFE7FF8000FC01FFFFEFFFC001FFFF00000000000000000000000000000000
      000000000000}
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = cxGrid
    PopupMenus = <>
    Left = 776
    Top = 96
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'exp'
    Filter = '*.exp|*.exp'
    Left = 640
    Top = 96
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'exp'
    Filter = '*.exp|*.exp'
    Left = 648
    Top = 152
  end
  object oqLoad: TOracleQuery
    SQL.Strings = (
      'declare'
      '  str     varchar2(500) := :pStr;'
      '  r_Dec   fdc_decision_payback_lst%rowtype;'
      '  p       Integer;'
      '  p1      Integer;'
      'begin'
      '   '
      '   p   :=  InStr(STR2 => '#39';'#39',STR1 => str,POS => 1);'
      
        '   r_Dec.EXT_SOURCE       :=   SubStr(STR1 => str,POS => 1,LEN =' +
        '> p-1);'
      
        '   dbms_output.put_line(SubStr(STR1 => str,POS => 1,LEN => p-1))' +
        ';'
      '   '
      '   p1 :=   p;'
      '   p  :=   InStr(STR2 => '#39';'#39',STR1 => str,POS => p1+1);'
      
        '   r_Dec.EXT_TYPESYSNAME  := SubStr(STR1 => str,POS => p1+1,LEN ' +
        '=> p-p1-1);'
      '   dbms_output.put_line(r_Dec.EXT_TYPESYSNAME);'
      '   '
      '   p1 :=   p;'
      '   p  :=   InStr(STR2 => '#39';'#39',STR1 => str,POS => p1+1);'
      
        '   r_Dec.EXT_ID           := SubStr(STR1 => str,POS => p1+1,LEN ' +
        '=> p-p1-1);'
      '   dbms_output.put_line(r_Dec.EXT_ID);'
      ''
      '   p1 :=   p;'
      '   p  :=   InStr(STR2 => '#39';'#39',STR1 => str,POS => p1+1);'
      
        '   r_Dec.decision_court   := SubStr(STR1 => str,POS => p1+1,LEN ' +
        '=> p-p1-1);'
      '   dbms_output.put_line(r_Dec.decision_court);'
      ''
      '   p1 :=   p;'
      '   p  :=   InStr(STR2 => '#39';'#39',STR1 => str,POS => p1+1);'
      
        '   r_Dec.date_court   := to_date(SubStr(STR1 => str,POS => p1+1,' +
        'LEN => p-p1-1),'#39'dd.mm.yyyy'#39');'
      '   dbms_output.put_line(r_Dec.date_court);'
      ''
      '   update fdc_decision_payback'
      '      set decision_court = r_Dec.decision_court'
      '         ,date_court     = r_Dec.date_court '
      '   where '
      '      id = (select id from fdc_object o '
      '            where o.ext_source      = r_Dec.EXT_SOURCE'
      '              and o.ext_typesysname = r_Dec.EXT_TYPESYSNAME'
      '              and o.ext_id          = r_Dec.EXT_ID);'
      '   '
      'end;')
    Session = OracleSession
    Variables.Data = {0300000001000000050000003A50535452050000000000000000000000}
    Left = 328
    Top = 328
  end
end
