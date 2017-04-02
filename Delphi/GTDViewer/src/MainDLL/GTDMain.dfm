object GTDMainForm: TGTDMainForm
  Left = 523
  Top = 210
  Width = 292
  Height = 231
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 284
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    DesignSize = (
      284
      41)
    object sbPrint: TSpeedButton
      Left = 131
      Top = 9
      Width = 137
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFF5F5F5F
        5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
        5F5F5F5F5F5F5F5F5F5F0F20D0F0D8C0F0D8C00F20D0F0D8C0F0D8C0F0D8B0F0
        D8B0F0D8B0F0D8B0F0D8B0F0D8C0F0D8B0F0D8B07F78FF5F5F5F0F20D0F0D8C0
        F0D8C00F20D0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8
        C0F0D8C07F78FF5F5F5F0F20D0F0E0C0F0E0C00F20D00F20D00F20D00F20D00F
        20D00F20D00F20D00F20D00F20D00F20D00F20D00F20D05F5F5F0F20D0F0E0C0
        F0E0C00F20D0F0D8C0F0D8C0F0E0C00F20D0F0E0C0F0E0C0F0E0C0F0E0C0F0E0
        C0F0E0C0F0E0C05F5F5F0F20D0F0D8C0F0D8C00F20D0F0D8C0F0D8C0F0E0C00F
        20D0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C0F0D8C05F5F5F0F20D0F0E0CF
        F0E0CF0F20D0F0D8C0F0D8C0F0D8C00F20D0F0E0CFF0E0CFF0E0CFF0E0CFF0E0
        CFF0E0CFF0E0CF5F5F5F0F20D00F20D00F20D00F20D07F78FF7F78FF7F78FF7F
        78FF7F78FF7F78FF7F78FF7F78FF7F78FF7F78FF7F78FF5F5F5F0F20D0F0E0CF
        F0E0CF0F20D0F0D8C0F0D8C0F0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0CFF0E0
        CFF0E0CFF0D8C05F5F5F0F20D0F0E0D0F0E0D00F20D0F0D8C0F0D8C0707070F0
        E0D0707070F0E0D0707070F0E0D0707070F0E0D07070705F5F5F0F20D0F0E0D0
        F0E0D00F20D0F0D8C0F0D8C0F0E0D0F0E8D0F0E8D0F0E8D0F0E8D0F0E8D0F0E0
        D0F0E0D0F0E0D05F5F5F0F20D00F20D00F20D00F20D07F78FF7F78FF7F78FF7F
        78FF7F78FF7F78FF7F78FF7F78FF7F78FF7F78FF7F78FF5F5F5F0F20D0F0E0D0
        F0E0D00F20D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0
        D0F0E0D0F0E0D05F5F5F0F20D0F0D8C0F0D8C00F20D0F0D8C0F0E0D070707070
        7070707070707070F0E0D0707070707070707070F0E0D05F5F5F0F20D0F0E0D0
        F0E0D00F20D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0D0F0E0
        D0F0E0D0F0E0D05F5F5F0F20D00F20D00F20D00F20D00F20D00F20D00F20D00F
        20D00F20D00F20D00F20D00F20D00F20D00F20D00F20D00F20D0}
      OnClick = sbPrintClick
    end
    object BtnLoadScript: TButton
      Left = 8
      Top = 11
      Width = 118
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1082#1088#1080#1087#1090
      TabOrder = 0
      Visible = False
      OnClick = BtnLoadScriptClick
    end
  end
  object vleFilter: TValueListEditor
    Left = 0
    Top = 0
    Width = 284
    Height = 161
    Align = alClient
    BorderStyle = bsNone
    Ctl3D = False
    DisplayOptions = [doAutoColResize, doKeyColFixed]
    ParentCtl3D = False
    Strings.Strings = (
      '=')
    TabOrder = 1
    ColWidths = (
      150
      124)
  end
  object RvProjectGTD: TRvProject
    Engine = RvSystem1
    OnBeforeOpen = RvProjectGTDBeforeOpen
    Left = 16
    Top = 40
  end
  object RvSystem1: TRvSystem
    TitleSetup = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1099#1074#1086#1076#1072
    TitleStatus = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    TitlePreview = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = #1057#1086#1079#1076#1072#1085#1080#1077' '#1089#1090#1088#1072#1085#1080#1094#1099' %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = #1055#1077#1095#1072#1090#1072#1077#1090#1089#1103' '#1089#1090#1088#1072#1085#1080#1094#1072' %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.Units = unCM
    SystemPrinter.UnitsFactor = 2.540000000000000000
    OverridePreview = RvSystem1OverridePreview
    Left = 80
    Top = 40
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'SELECT tp.tpo_number'
      '      ,tp.order_type'
      '      ,tp.ext_list '
      '      ,tp.doc_name'
      '      ,tp.inn'
      '      ,tp.name'
      '      ,tp.kodval'
      '      ,tp.curs_usd'
      '      ,tp.curs_eku'
      '      ,tp.dop_inf1'
      '      ,tp.dop_inf2'
      '      ,tp.dop_inf3'
      '      ,tp.weight_al'
      '      ,tp.tovcost_pl'
      '      ,tp.tovcost_usd'
      '      ,tp.tovcost_eku'
      '      ,tp.sum_rub'
      '      ,tp.sum_usd       '
      '      ,tp.sum_eku'
      '      ,tp.sprub'
      '      ,tp.oplrub'
      '      ,tp.fiotam'
      '      ,tp.fiokas'
      '      ,g.naimenov'
      '      ,g.codtnved'
      '      ,g.weight'
      '      ,g.kolvo'
      '      ,g.cod_plat'
      '      ,g.tovcost_pl AS tovcost0_pl'
      '      ,g.tovcost_al AS tovcost0_usd'
      '      ,g.tovcost_pl * tp.curs_eku AS tovcost0_eku'
      '  FROM ( SELECT s.tpo_number'
      
        '               ,s.REGIM || '#39'/'#39' || s.methmove || '#39'/'#39' || s.vid_tra' +
        'ns AS order_type'
      '               ,ext_list'
      
        '               ,s.kodtam || '#39'/'#39' || TO_CHAR( s.dat_tpo, '#39'ddmmyy'#39' ' +
        ') || '#39'/'#39' || s.tpo_number AS doc_name'
      '               ,c.inn'
      '               ,c.name'
      '               ,s.kodval'
      '               ,s.curs_usd'
      '               ,s.curs_eku'
      '               ,s.dop_inf1'
      '               ,s.dop_inf2'
      '               ,s.dop_inf3'
      '               ,s.weight_al'
      '               ,s.tovcost_pl'
      '               ,s.tovcost_al AS tovcost_usd'
      '               ,s.tovcost_pl * s.curs_eku AS tovcost_eku'
      '               ,s.sum_rub'
      '               ,s.sum_rub * s.curs_usd AS sum_usd       '
      '               ,s.sum_rub * s.curs_eku AS sum_eku'
      '               ,s.sprub'
      '               ,s.oplrub'
      '               ,s.fiotam'
      '               ,s.fiokas'
      '           FROM tpos s'
      '               ,clients c'
      '          WHERE c.idpayer = s.client ) tp'
      '      ,g_s g'
      ' WHERE g.tpo_number = tp.tpo_number'
      '       AND g.prim_plt = '#39'1'#39
      '       AND NVL( g.num_dtpo, 0 ) = 0'
      '       AND NVL( g.pos_dtpo, 0 ) = 0'
      '       AND G_S_TYPE='#39#1058#39)
    StringFieldsOnly = True
    QBEDefinition.QBEFieldDefs = {
      040000001F0000000A00000054504F5F4E554D4245520100000000000A000000
      4F524445525F54595045010000000000080000004558545F4C49535401000000
      000008000000444F435F4E414D4501000000000003000000494E4E0100000000
      00040000004E414D45010000000000060000004B4F4456414C01000000000008
      000000435552535F55534401000000000008000000435552535F454B55010000
      00000008000000444F505F494E463101000000000008000000444F505F494E46
      3201000000000008000000444F505F494E463301000000000009000000574549
      4748545F414C0100000000000A000000544F56434F53545F504C010000000000
      0B000000544F56434F53545F5553440100000000000B000000544F56434F5354
      5F454B550100000000000700000053554D5F5255420100000000000700000053
      554D5F5553440100000000000700000053554D5F454B55010000000000050000
      005350525542010000000000060000004F504C52554201000000000006000000
      46494F54414D0100000000000600000046494F4B415301000000000008000000
      4E41494D454E4F5601000000000008000000434F44544E564544010000000000
      06000000574549474854010000000000050000004B4F4C564F01000000000008
      000000434F445F504C41540100000000000B000000544F56434F5354305F504C
      0100000000000C000000544F56434F5354305F5553440100000000000C000000
      544F56434F5354305F454B55010000000000}
    Session = OracleSession1
    Left = 200
    Top = 40
    object OracleDataSet1TPO_NUMBER: TStringField
      FieldName = 'TPO_NUMBER'
      Required = True
      Size = 10
    end
    object OracleDataSet1ORDER_TYPE: TStringField
      FieldName = 'ORDER_TYPE'
      Size = 8
    end
    object OracleDataSet1EXT_LIST: TStringField
      FieldName = 'EXT_LIST'
      Size = 4
    end
    object OracleDataSet1DOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 26
    end
    object OracleDataSet1INN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object OracleDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 80
    end
    object OracleDataSet1KODVAL: TStringField
      FieldName = 'KODVAL'
      Size = 3
    end
    object OracleDataSet1CURS_USD: TStringField
      FieldName = 'CURS_USD'
      Size = 16
    end
    object OracleDataSet1CURS_EKU: TStringField
      FieldName = 'CURS_EKU'
      Size = 16
    end
    object OracleDataSet1DOP_INF1: TStringField
      FieldName = 'DOP_INF1'
      Size = 48
    end
    object OracleDataSet1DOP_INF2: TStringField
      FieldName = 'DOP_INF2'
      Size = 48
    end
    object OracleDataSet1DOP_INF3: TStringField
      FieldName = 'DOP_INF3'
      Size = 60
    end
    object OracleDataSet1WEIGHT_AL: TStringField
      FieldName = 'WEIGHT_AL'
      Size = 16
    end
    object OracleDataSet1TOVCOST_PL: TStringField
      FieldName = 'TOVCOST_PL'
      Size = 19
    end
    object OracleDataSet1TOVCOST_USD: TStringField
      FieldName = 'TOVCOST_USD'
      Size = 19
    end
    object OracleDataSet1TOVCOST_EKU: TStringField
      FieldName = 'TOVCOST_EKU'
      Size = 39
    end
    object OracleDataSet1SUM_RUB: TStringField
      FieldName = 'SUM_RUB'
      Size = 19
    end
    object OracleDataSet1SUM_USD: TStringField
      FieldName = 'SUM_USD'
      Size = 39
    end
    object OracleDataSet1SUM_EKU: TStringField
      FieldName = 'SUM_EKU'
      Size = 39
    end
    object OracleDataSet1SPRUB: TStringField
      FieldName = 'SPRUB'
      Size = 2
    end
    object OracleDataSet1OPLRUB: TStringField
      FieldName = 'OPLRUB'
      Size = 17
    end
    object OracleDataSet1FIOTAM: TStringField
      FieldName = 'FIOTAM'
      Size = 50
    end
    object OracleDataSet1FIOKAS: TStringField
      FieldName = 'FIOKAS'
      Size = 50
    end
    object OracleDataSet1NAIMENOV: TStringField
      FieldName = 'NAIMENOV'
      Size = 58
    end
    object OracleDataSet1CODTNVED: TStringField
      FieldName = 'CODTNVED'
      Size = 10
    end
    object OracleDataSet1WEIGHT: TStringField
      FieldName = 'WEIGHT'
      Size = 16
    end
    object OracleDataSet1KOLVO: TStringField
      FieldName = 'KOLVO'
      Size = 14
    end
    object OracleDataSet1COD_PLAT: TStringField
      FieldName = 'COD_PLAT'
      Size = 4
    end
    object OracleDataSet1TOVCOST0_PL: TStringField
      FieldName = 'TOVCOST0_PL'
      Size = 19
    end
    object OracleDataSet1TOVCOST0_USD: TStringField
      FieldName = 'TOVCOST0_USD'
      Size = 19
    end
    object OracleDataSet1TOVCOST0_EKU: TStringField
      FieldName = 'TOVCOST0_EKU'
      Size = 39
    end
  end
  object OracleSession1: TOracleSession
    LogonUsername = 'EFZ_ORDER'
    LogonPassword = 'EFZ_ORDER'
    LogonDatabase = 'B4'
    Left = 200
    Top = 96
  end
  object TPO_1: TRvDataSetConnection
    RuntimeVisibility = rtNone
    DataSet = OracleDataSet1
    Left = 120
    Top = 96
  end
end
