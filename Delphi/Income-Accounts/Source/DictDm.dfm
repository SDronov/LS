object DictData: TDictData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 301
  Top = 288
  Height = 696
  Width = 518
  object dsCurrency: TOracleDataSet
    SQL.Strings = (
      'SELECT -1           AS id'
      '      ,'#39#1042#1089#1077#39'        AS code'
      '      ,'#39#1042#1089#1077' '#1074#1072#1083#1102#1090#1099#39' AS name'
      '      ,'#39#1042#1089#1077#39'        AS acode'
      '      ,'#39'N'#39'          AS is_usable'
      '  FROM dual'
      ''
      'UNION ALL'
      ''
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
    AfterOpen = dsCurrencyAfterOpen
    AfterRefresh = dsCurrencyAfterOpen
    Left = 32
    Top = 8
    object dsCurrencyID: TFloatField
      FieldName = 'ID'
    end
    object dsCurrencyCODE: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'CODE'
      Size = 3
    end
    object dsCurrencyNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 60
      FieldName = 'NAME'
      Size = 1500
    end
    object dsCurrencyACODE: TStringField
      DisplayLabel = #1041#1091#1082#1074'. '#1050#1086#1076
      FieldName = 'ACODE'
      Size = 3
    end
    object dsCurrencyIS_USABLE: TStringField
      FieldName = 'IS_USABLE'
      Size = 1
    end
  end
  object srcCurrency: TDataSource
    DataSet = dsCurrency
    Left = 104
    Top = 8
  end
  object dsCustomMode: TOracleDataSet
    SQL.Strings = (
      'select '
      't.id, t.code, t.name'
      ', t.sdate, nvl(t.edate, to_date('#39'31123000'#39', '#39'ddmmyyyy'#39')) edate'
      'from fdc_custom_mode_lst t  '
      '--where t.code <> '#39'31'#39
      'order by t.code')
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000004000000434F444501000000
      0000040000004E414D4501000000000005000000534441544501000000000005
      0000004544415445010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    OnFilterRecord = dsCustomModeFilterRecord
    Left = 32
    Top = 64
    object dsCustomModeID: TFloatField
      FieldName = 'ID'
    end
    object dsCustomModeCODE: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'CODE'
      Size = 1500
    end
    object dsCustomModeNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 1500
    end
    object dsCustomModeSDATE: TDateTimeField
      FieldName = 'SDATE'
      Required = True
    end
    object dsCustomModeEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcCustomMode: TDataSource
    DataSet = dsCustomMode
    Left = 112
    Top = 64
  end
  object srcCustomDir: TDataSource
    AutoEdit = False
    DataSet = dsCustomDir
    Left = 120
    Top = 120
  end
  object dsCustomDir: TdxMemData
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F020000000300000001000500434F44450015000000
      010005004E414D450003000000C8CC0007000000C8ECEFEEF0F20003000000DD
      CA0008000000DDEAF1EFEEF0F200}
    SortOptions = []
    Left = 32
    Top = 120
    object dsCustomDirCODE: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 6
      FieldName = 'CODE'
      Size = 2
    end
    object dsCustomDirNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
    end
  end
  object LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 204
    Top = 27
    object LayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = DEFAULT_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -11
      GroupOptions.CaptionOptions.Font.Name = 'MS Sans Serif'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      ItemOptions.CaptionOptions.HotTrackStyles = []
      ItemOptions.ControlBorderStyle = lbsFlat
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = RUSSIAN_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -13
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = [fsBold]
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      ItemOptions.CaptionOptions.HotTrackStyles = []
      ItemOptions.ControlBorderStyle = lbsFlat
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutWebLookAndFeel: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.Font.Charset = RUSSIAN_CHARSET
      GroupOptions.CaptionOptions.Font.Color = clWindowText
      GroupOptions.CaptionOptions.Font.Height = -13
      GroupOptions.CaptionOptions.Font.Name = 'Tahoma'
      GroupOptions.CaptionOptions.Font.Style = []
      GroupOptions.CaptionOptions.HotTrack = True
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.UseDefaultFont = False
      GroupOptions.CaptionOptions.Color = clBtnFace
      GroupOptions.Color = clWindow
      GroupOptions.FrameColor = clBtnFace
      ItemOptions.CaptionOptions.Font.Charset = RUSSIAN_CHARSET
      ItemOptions.CaptionOptions.Font.Color = clWindowText
      ItemOptions.CaptionOptions.Font.Height = -13
      ItemOptions.CaptionOptions.Font.Name = 'Tahoma'
      ItemOptions.CaptionOptions.Font.Style = []
      ItemOptions.CaptionOptions.HotTrack = True
      ItemOptions.CaptionOptions.UseDefaultFont = False
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
    object LayoutWebToolLookAndFeel: TdxLayoutWebLookAndFeel
      GroupOptions.CaptionOptions.HotTrackStyles = []
      GroupOptions.CaptionOptions.Color = 15313283
      GroupOptions.Color = 16311512
      GroupOptions.FrameColor = 15313283
      Offsets.ControlOffsetHorz = 1
      Offsets.ControlOffsetVert = 1
      Offsets.ItemsAreaOffsetVert = 4
      Offsets.RootItemsAreaOffsetHorz = 6
      Offsets.RootItemsAreaOffsetVert = 6
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 216
    Top = 96
    object cxCurrentField: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Courier New'
      Font.Style = []
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object styleOddContent: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object cxRedStyle: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clRed
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxInfoBkStyle: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
    object ssTreeList: TcxTreeListStyleSheet
      Styles.Content = cxStyle1
      BuiltIn = True
    end
  end
  object cxEditRepository: TcxEditRepository
    Left = 208
    Top = 160
    object repCurrencyItem: TcxEditRepositoryCurrencyItem
      Properties.AssignedValues.EditFormat = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.UseDisplayFormatWhenEditing = True
      Properties.UseThousandSeparator = True
    end
  end
  object dsPayTypes: TOracleDataSet
    SQL.Strings = (
      'select '
      
        't.id, t.code, t.name, t.sdate, nvl(t.edate, to_date('#39'31123000'#39', ' +
        #39'ddmmyyyy'#39')) edate'
      'from fdc_payment_type_lst t  '
      '--where NVL(t.edate, SYSDATE) >= SYSDATE and t.sdate < sysdate'
      'order by t.code')
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000004000000434F444501000000
      0000040000004E414D4501000000000005000000534441544501000000000005
      0000004544415445010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    OnFilterRecord = dsPayTypesFilterRecord
    Left = 24
    Top = 176
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'CODE'
      Size = 1500
    end
    object StringField2: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 1500
    end
    object dsPayTypesSDATE: TDateTimeField
      FieldName = 'SDATE'
      Required = True
    end
    object dsPayTypesEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcPayTypes: TDataSource
    DataSet = dsPayTypes
    Left = 112
    Top = 176
  end
  object DefaultEditStyleController: TcxDefaultEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = RUSSIAN_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 212
    Top = 65535
  end
  object OfficeEditStyleController: TcxEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsFlat
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Left = 256
    Top = 65535
  end
  object WebEditStyleController: TcxEditStyleController
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebsOffice11
    Style.Color = clWindow
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.HotTrack = False
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = False
    Style.TransparentBorder = True
    Style.ButtonStyle = btsOffice11
    Style.ButtonTransparency = ebtNone
    Style.PopupBorderStyle = epbsDefault
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 316
    Top = 65535
  end
  object dsAdvDeclFeature: TOracleDataSet
    SQL.Strings = (
      'select '
      't.id, t.code, t.name'
      ', t.sdate, nvl(t.edate, to_date('#39'31123000'#39', '#39'ddmmyyyy'#39')) edate'
      'from fdc_adv_decl_feature_lst t  '
      'order by t.code')
    QBEDefinition.QBEFieldDefs = {
      040000000500000002000000494401000000000004000000434F444501000000
      0000040000004E414D4501000000000005000000534441544501000000000005
      0000004544415445010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    OnFilterRecord = dsAdvDeclFeatureFilterRecord
    Left = 288
    Top = 80
    object FloatField2: TFloatField
      FieldName = 'ID'
    end
    object StringField3: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 8
      FieldName = 'CODE'
      Size = 1500
    end
    object StringField4: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NAME'
      Size = 1500
    end
    object dsAdvDeclFeatureSDATE: TDateTimeField
      FieldName = 'SDATE'
      Required = True
    end
    object dsAdvDeclFeatureEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcAdvDeclFeature: TDataSource
    DataSet = dsAdvDeclFeature
    Left = 400
    Top = 80
  end
  object dsAgreements: TOracleDataSet
    SQL.Strings = (
      'select id, name from fdc_bp_agreement_lst'
      'order by doc_date desc')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 32
    Top = 240
    object FloatField3: TFloatField
      FieldName = 'ID'
    end
    object StringField6: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 60
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object srcAgreements: TDataSource
    DataSet = dsAgreements
    Left = 120
    Top = 240
  end
  object dsPassportType: TOracleDataSet
    SQL.Strings = (
      'select id, name, code, code2 from fdc_passport_type_lst')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000020000004944010000000000040000004E414D4501000000
      000004000000434F444501000000000005000000434F444532010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 280
    Top = 200
    object dsPassportTypeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsPassportTypeNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object dsPassportTypeCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Size = 1500
    end
    object dsPassportTypeCODE2: TStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'CODE2'
      Size = 1500
    end
  end
  object dsCountryCode: TOracleDataSet
    SQL.Strings = (
      'select '
      't.id, t.code, t.name, t.code2'
      ', t.sdate, nvl(t.edate, to_date('#39'31123000'#39', '#39'ddmmyyyy'#39')) edate'
      'from fdc_country_code_lst t'
      'where NVL(t.edate, SYSDATE) >= SYSDATE and t.sdate < sysdate'
      'order by t.code')
    QBEDefinition.QBEFieldDefs = {
      040000000600000002000000494401000000000004000000434F444501000000
      0000040000004E414D4501000000000005000000434F44453201000000000005
      0000005344415445010000000000050000004544415445010000000000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 280
    Top = 264
    object dsCountryCodeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsCountryCodeCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Size = 1500
    end
    object dsCountryCodeNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object dsCountryCodeCODE2: TStringField
      DisplayLabel = #1057#1080#1084#1074#1086#1083#1100#1085#1099#1081' '#1082#1086#1076
      FieldName = 'CODE2'
      Size = 1500
    end
    object dsCountryCodeSDATE: TDateTimeField
      FieldName = 'SDATE'
      Required = True
    end
    object dsCountryCodeEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcPassportType: TDataSource
    DataSet = dsPassportType
    Left = 392
    Top = 200
  end
  object srcCountryCode: TDataSource
    DataSet = dsCountryCode
    Left = 392
    Top = 264
  end
  object dsDecisionQualifier: TOracleDataSet
    SQL.Strings = (
      'select * from fdc_decision_qualifier2_lst'
      'where'
      '  sdate IS NULL '
      
        '  OR SYSDATE BETWEEN sdate AND NVL(edate, TO_DATE('#39'31123000'#39', '#39'd' +
        'dmmyyyy'#39'))')
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D4501000000000004000000434F44450100
      0000000005000000534441544501000000000005000000454441544501000000
      0000}
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 280
    Top = 336
    object dsDecisionQualifierCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsDecisionQualifierNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDecisionQualifierSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object dsDecisionQualifierEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
  end
  object srcDecisionQualifier: TDataSource
    DataSet = dsDecisionQualifier
    Left = 392
    Top = 336
  end
  object dsDebtTypes: TOracleDataSet
    SQL.Strings = (
      'select '
      't.*'
      'from fdc_debt_types_lst t'
      'order by t.code')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 56
    Top = 352
  end
  object dsDebtReason: TOracleDataSet
    SQL.Strings = (
      'SELECT t.*'
      '  FROM fdc_dict_lst t'
      ' WHERE typesysname = '#39'DebtReason'#39
      ' ORDER BY t.code'
      '/*'
      'select'
      't.*'
      'from fdc_debts_dic_occurreasons_lst t'
      'order by t.code'
      '*/')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 56
    Top = 408
  end
  object dsAssetsDict: TOracleDataSet
    SQL.Strings = (
      'select'
      't.*'
      'from fdc_assets_dict_lst t'
      'order by t.code')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 56
    Top = 464
  end
  object dsAssetsReason: TOracleDataSet
    SQL.Strings = (
      'select'
      't.*'
      'from fdc_assets_reason_lst t'
      'order by t.code')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 56
    Top = 520
  end
  object srcDebtTypes: TDataSource
    DataSet = dsDebtTypes
    Left = 168
    Top = 352
  end
  object srcDebtReason: TDataSource
    DataSet = dsDebtReason
    Left = 168
    Top = 408
  end
  object srcAssetsDict: TDataSource
    DataSet = dsAssetsDict
    Left = 168
    Top = 464
  end
  object srcAssetsReason: TDataSource
    DataSet = dsAssetsReason
    Left = 168
    Top = 520
  end
  object dsAssetsDecision: TOracleDataSet
    SQL.Strings = (
      'select t.* from fdc_assets_decision_lst t'
      'order by t.code')
    ReadOnly = True
    CommitOnPost = False
    Session = MainData.Session
    Left = 56
    Top = 576
  end
  object srcAssetsDecision: TDataSource
    DataSet = dsAssetsDecision
    Left = 168
    Top = 576
  end
  object dsSudReason: TOracleDataSet
    SQL.Strings = (
      'select *'
      '  from fdc_dict_sud_reason_lst'
      '  order by code')
    Session = MainData.Session
    Left = 272
    Top = 416
  end
  object srcSudReason: TDataSource
    AutoEdit = False
    DataSet = dsSudReason
    Left = 392
    Top = 408
  end
end
