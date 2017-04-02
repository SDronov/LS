inherited qKNPDedAllForm: TqKNPDedAllForm
  Left = 440
  Top = 378
  Caption = #1048#1090#1086#1075' '#1087#1086' '#1088#1077#1077#1089#1090#1088#1072#1084
  ClientHeight = 112
  ClientWidth = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 372
    Height = 112
    inherited btnCancel: TcxButton
      Left = 288
      Top = 80
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 207
      Top = 80
      ModalResult = 0
      TabOrder = 2
    end
    object edtbDate: TcxDateEdit [2]
      Left = 74
      Top = 9
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 259
    end
    object edtEDate: TcxDateEdit [3]
      Left = 74
      Top = 33
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 259
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1053#1072#1095'. '#1076#1072#1090#1072
        Control = edtbDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1095'. '#1076#1072#1090#1072
        Control = edtEDate
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 104
    Top = 65535
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 132
    Top = 65535
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 216
    Top = 65535
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 244
    Top = 65535
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 160
    Top = 65535
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 65535
  end
  object dsMain: TOracleDataSet
    SQL.Strings = (
      'with  xx as'
      '('
      'select pd.payment_id, po.payer_id, po.agreement_id,'
      '        case '
      
        '        when kbk.code is null then '#39'00000000000000000000'#39'||'#39'_'#39'||' +
        #39#1042#1086#1079#1074#1088#1072#1090#39
      '         else kbk.code||'#39'_'#39'||kbk.shortname end kbk,'
      '--       pt.code pay_type,'
      '       sum(pd.summa) summa,'
      '       :sdate sdate,'
      '       :edate edate'
      '  from fdc_account_entry     ae,'
      '       fdc_payment_deduction pd,'
      '       fdc_account           a,'
      '       fdc_payment_order     po,'
      '       fdc_dict              pt,'
      '       fdc_dict_lst              kbk'
      ' where ae.item_date between :sdate and :edate'
      '   and pd.id = ae.operation_id'
      '   and a.hier_name = '#39'100'#39
      '   and a.id = ae.debet_id'
      '   and po.id = pd.payment_id'
      '   and pt.id(+) = pd.pay_type_id'
      '   and kbk.id(+) = pd.kbkcode_id'
      '--   and po.agreement_id = :knp_id'
      '--   and pd.charge_id is null'
      '--   and pd.summa > 0'
      '--   and po.payer_id = :payer_id'
      ' group by pd.payment_id, po.payer_id, po.agreement_id,'
      '        case '
      
        '        when kbk.code is null then '#39'00000000000000000000'#39'||'#39'_'#39'||' +
        #39#1042#1086#1079#1074#1088#1072#1090#39
      '         else kbk.code||'#39'_'#39'||kbk.shortname end '
      ' )'
      ''
      'select '
      'py.name || '#39'('#39'|| py.INN ||'#39')'#39' pay_name,'
      'a.subj_name|| '#39'('#39'|| a.subj_inn ||'#39')'#39' knp_name,'
      'po.summa po_summa,'
      'y.*, xx.* from '
      'xx'
      ', '
      '('
      
        'select  payment_id, p_payment_order.GetRestSumma(payment_id, sda' +
        'te) ss, 0 dsumma'
      
        'from ( select payment_id, sdate, sum(summa) dsumma from xx group' +
        ' by payment_id, sdate) '
      ') y'
      ',fdc_subject_lst py'
      ',fdc_payment_order po'
      ',fdc_bp_agreement_lst a '
      'where'
      'y.payment_id = xx.payment_id'
      'and po.id(+) = y.payment_id'
      'and py.id(+) = po.payer_id'
      'and a.id(+) = po.agreement_id')
    Variables.Data = {
      0300000002000000060000003A53444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000D0000000500000053554D4D41010000000000050000004544415445
      0100000000000A0000005041594D454E545F4944010000000000020000005353
      010000000000060000004453554D4D410100000000000C0000005041594D454E
      545F49445F31010000000000030000004B424B01000000000005000000534441
      544501000000000008000000504F5F53554D4D41010000000000080000005041
      595F4E414D45010000000000080000004B4E505F4E414D450100000000000800
      000050415945525F49440100000000000C00000041475245454D454E545F4944
      010000000000}
    BeforeQuery = dsMainBeforeQuery
    Session = MainData.Session
    DesignActivation = True
    Left = 88
    Top = 32
  end
  object dsTotal: TOracleDataSet
    SQL.Strings = (
      
        'select fmt_code name, NVL(a0, 0) a0, NVL(dturnover,0) summa, NVL' +
        '(osaldo,0) total '
      
        'from (select x.fmt_code, min(id) id from fdc_kbk_dict_lst x grou' +
        'p by x.fmt_code)'
      'fdc_kbk_dict_lst '
      ',fdc_account_saldo_by_params t'
      
        'where p_accounting_engine.SetSaldoParams('#39'152'#1057#39', p_nsi_currency.' +
        'FindByCode('#39'643'#39'),'
      ':FDATE, :EDATE, '#39'G'#39', :A0) =1'
      'and a0(+) = id')
    Variables.Data = {
      0300000003000000030000003A4130040000000000000000000000060000003A
      46444154450C0000000000000000000000060000003A45444154450C00000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D450100000000000500000053554D4D4101
      000000000005000000544F54414C010000000000020000004130010000000000}
    Master = dsMain
    Session = MainData.Session
    Filter = 'A0 > 0'
    Filtered = True
    Left = 128
    Top = 32
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1048#1090#1086#1075#1056#1077#1077#1089#1090#1088#1099'.xls'
    DataSources = <
      item
        DataSet = dsData
        Alias = 'dsData'
        Range = 'rngData'
        Options = []
        Tag = 0
        OnBeforeDataTransfer = xlReportDataSources1BeforeDataTransfer
      end>
    Preview = False
    Params = <
      item
        Name = 'SDATE'
      end
      item
        Name = 'EDATE'
      end>
    OnBeforeBuild = xlReportBeforeBuild
    Left = 32
    Top = 32
  end
  object dsParam: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 176
    Top = 32
    object dsParamKNP_ID: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      FieldName = 'KNP_ID'
    end
    object dsParamSUBJ_ID: TFloatField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'SUBJ_ID'
    end
    object dsParamSUBJ_NAME: TStringField
      FieldName = 'SUBJ_NAME'
      Size = 300
    end
  end
  object srcParam: TDataSource
    DataSet = dsParam
    Left = 224
    Top = 32
  end
  object dsData: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 272
    Top = 32
  end
  object srcPayerList: TDataSource
    Left = 312
    Top = 32
  end
end
