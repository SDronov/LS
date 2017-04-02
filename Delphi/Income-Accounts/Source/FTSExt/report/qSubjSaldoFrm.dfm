inherited qSubjSaldoForm: TqSubjSaldoForm
  Left = 440
  Top = 378
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1050#1053#1055
  ClientHeight = 104
  ClientWidth = 301
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 301
    Height = 104
    inherited btnCancel: TcxButton
      Left = 217
      Top = 72
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 136
      Top = 72
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
      'select :fdate sdate'
      '      ,:edate edate'
      
        '      ,nvl(sum((case when (reg.reg_date < :fdate) then reg.reg_s' +
        'um_rur else 0 end)),0) isaldo'
      '      ,nvl(sum(reg.reg_sum_rur),0) osaldo'
      
        '      ,nvl(sum((case WHEN reg.reg_date < :fdate OR acc.code = '#39'0' +
        '6.01.01'#39' then reg.reg_sum_rur else 0 end)),0) inc_s'
      
        '      ,nvl(-sum((case when (reg.reg_date >= :fdate and acc.code ' +
        '<> '#39'06.01.01'#39') then reg.reg_sum_rur else 0 end)),0) dec_s'
      '      ,reg.subject_id subj_id'
      '      ,sl.name'
      'from fdc_acc_reg_subject reg'
      '    ,('
      '      select id, code'
      '      from fdc_acc_light_lst'
      '      start with code = '#39'06.00.00'#39
      '      connect by prior id = parent_id'
      '     ) acc'
      '    ,fdc_subject_lst sl'
      'where reg.reg_date <= :edate'
      '  and reg.account_id = acc.id'
      '  and reg.subject_id = sl.id'
      'group by reg.subject_id, sl.name'
      'order by sl.name')
    Variables.Data = {
      0300000002000000060000003A46444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000050000005344415445010000000000050000004544415445
      010000000000060000004953414C444F010000000000060000004F53414C444F
      01000000000005000000494E435F53010000000000050000004445435F530100
      00000000070000005355424A5F4944010000000000040000004E414D45010000
      000000}
    BeforeQuery = dsMainBeforeQuery
    Session = MainData.Session
    Left = 120
    Top = 40
  end
  object dsData: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from ('
      '      select reg.reg_date item_date'
      
        '            ,nvl(sum((case when (reg.is_debit = '#39'Y'#39' and acc.code' +
        ' = '#39'06.01.01'#39') then reg.reg_sum_rur else 0 end)),0) i_s'
      
        '            ,nvl(-sum((case when (reg.is_debit = '#39'N'#39' or (reg.is_' +
        'debit = '#39'Y'#39' and acc.code != '#39'06.01.01'#39')) then reg.reg_sum_rur el' +
        'se 0 end)),0) o_s'
      '      from fdc_acc_reg_subject reg'
      '          ,('
      '            select id, code'
      '            from fdc_acc_light_lst'
      '            start with code = '#39'06.00.00'#39
      '            connect by prior id = parent_id'
      '           ) acc'
      '      where (reg.reg_date between :sdate and :edate)'
      '        and reg.subject_id= :subj_id'
      '        and reg.account_id = acc.id'
      '      group by reg.reg_date'
      '     )'
      'where i_s != 0'
      '   or o_s != 0'
      'order by item_date')
    Variables.Data = {
      0300000003000000080000003A5355424A5F4944040000000800000000000000
      3DA2334100000000060000003A53444154450C00000007000000786B01120101
      0100000000060000003A45444154450C00000007000000786B01120101010000
      0000}
    QBEDefinition.QBEFieldDefs = {
      0400000003000000090000004954454D5F444154450100000000000300000049
      5F53010000000000030000004F5F53010000000000}
    Master = dsMain
    MasterFields = 'SDATE;EDATE;SUBJ_ID'
    DetailFields = 'SDATE;EDATE;SUBJ_ID'
    Session = MainData.Session
    Left = 184
    Top = 40
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1054#1089#1090#1072#1090#1082#1080'.xls'
    DataSources = <
      item
        DataSet = dsMain
        Alias = 'dsMain'
        Range = 'rngMain'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsData
        Alias = 'dsData'
        Range = 'rngData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsMain'
      end>
    Preview = False
    Params = <>
    Left = 80
    Top = 40
  end
end
