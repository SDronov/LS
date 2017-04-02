inherited qKNPKBKForm: TqKNPKBKForm
  Left = 440
  Top = 378
  Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103#1093
  ClientHeight = 108
  ClientWidth = 329
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 329
    Height = 108
    inherited btnCancel: TcxButton
      Left = 245
      Top = 76
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 164
      Top = 76
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
    Left = 136
    Top = 7
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 164
    Top = 7
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 248
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 276
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 192
    Top = 7
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 220
    Top = 7
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1055#1083#1072#1090#1077#1078#1080'.xls'
    DataSources = <
      item
        DataSet = dsMain3
        Alias = 'dsMain2'
        Range = 'rngMain2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsData3
        Alias = 'dsDetail2'
        Range = 'rngDetail2'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsMain2'
      end
      item
        DataSet = dsMain3
        Alias = 'dsMain'
        Range = 'rngMain'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReportDataSources2BeforeDataTransfer
      end
      item
        DataSet = dsData3
        Alias = 'dsDetail'
        Range = 'rngDetail'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsMain'
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
    Left = 8
    Top = 48
  end
  object dsMain3: TOracleDataSet
    SQL.Strings = (
      'select o.name,'
      '       NVL(a0, 0) a0,'
      '       NVL(dturnover, 0) summa,'
      '       NVL(osaldo, 0) total,'
      '       :fdate fdate,'
      '       :edate edate'
      '  from fdc_account_saldo_by_params t, fdc_object_lst o'
      ' where o.typesysname = '#39'CustomsForBigPayer'#39
      '   and p_accounting_engine.SetSaldoParams('#39'152'#1057#39','
      
        '                                          p_nsi_currency.FindByC' +
        'ode('#39'643'#39'),'
      '                                          :FDATE,'
      '                                          :EDATE,'
      '                                          '#39'S'#39','
      '                                          null,'
      '                                          null,'
      '                                          null,'
      '                                          '#39'%'#39','
      '                                          null,'
      '                                          :FYEARSTART) = 1'
      '   and a0(+) = o.id'
      ' order by o.id')
    Variables.Data = {
      0300000003000000060000003A46444154450C00000000000000000000000600
      00003A45444154450C00000000000000000000000B0000003A46594541525354
      4152540C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000040000004E414D450100000000000500000053554D4D4101
      000000000005000000544F54414C010000000000050000004644415445010000
      000000050000004544415445010000000000020000004130010000000000}
    BeforeQuery = dsMainBeforeQuery
    Session = MainData.Session
    DesignActivation = True
    Filter = 'A0 > 0'
    Filtered = True
    Left = 56
    Top = 56
  end
  object dsData3: TOracleDataSet
    SQL.Strings = (
      'with acc as ('
      'select *'
      '  from fdc_account_saldo_by_params t'
      ' where p_accounting_engine.SetSaldoParams('#39'152'#1057#39','
      
        '                                          p_nsi_currency.FindByC' +
        'ode('#39'643'#39'),'
      '                                          :FDATE,'
      '                                           :EDATE,'
      '                                          '#39'G'#39','
      '                                          :CustCode,'
      '                                          null,'
      '                                          null,'
      '                                          '#39'%'#39','
      '                                          null,'
      '                                          :FYEARSTART) = 1'
      ')'
      'select x.fmt_code name, max(id) id, sum(NVL(a0, 0)) a0,'
      'NVL(min(dturnover),0) summa, NVL(min(osaldo),0) total'
      ''
      'from fdc_kbk_dict_lst x , acc , '
      ''
      '(select x.CODE'
      '  from fdc_kbk_dict_lst x'
      ' where x.sdate <= :edate'
      '   and :edate >= x.sdate'
      '   and NVL(x.edate, :edate) <='
      '       :edate'
      '   and NVL(x.edate, :fdate) >='
      '       :fdate'
      ' group by x.CODE, x.fmt_code) now_kbk'
      ''
      ''
      'where '
      'a0(+) = id'
      'and now_kbk.code = x.code'
      'group by x.fmt_code')
    Variables.Data = {
      0300000004000000060000003A46444154450C00000000000000000000000600
      00003A45444154450C00000000000000000000000B0000003A46594541525354
      4152540C0000000000000000000000090000003A43555354434F444505000000
      0000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D450100000000000500000053554D4D4101
      000000000005000000544F54414C010000000000020000004130010000000000}
    Master = dsMain3
    MasterFields = 'FDATE;EDATE;CustCode'
    DetailFields = 'FDATE;EDATE;CustCode'
    Session = MainData.Session
    DesignActivation = True
    Filter = 'A0 > 0'
    Filtered = True
    Left = 104
    Top = 52
  end
end
