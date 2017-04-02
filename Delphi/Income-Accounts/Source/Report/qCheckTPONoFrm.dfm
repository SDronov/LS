inherited qCheckTPONoForm: TqCheckTPONoForm
  Left = 440
  Top = 378
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1085#1086#1084#1077#1088#1086#1074' T'#1055'O'
  ClientHeight = 170
  ClientWidth = 246
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 246
    Height = 170
    inherited btnCancel: TcxButton
      Left = 162
      Top = 138
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 81
      Top = 138
      ModalResult = 0
      TabOrder = 5
    end
    object edtCC: TcxTextEdit [2]
      Left = 94
      Top = 9
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 258
    end
    object edtbDate: TcxDateEdit [3]
      Left = 94
      Top = 33
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 258
    end
    object edtEDate: TcxDateEdit [4]
      Left = 94
      Top = 57
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 258
    end
    object edtMinNo: TcxMaskEdit [5]
      Left = 94
      Top = 81
      ParentFont = False
      Properties.MaxLength = 7
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Width = 146
    end
    object edtMaxNo: TcxMaskEdit [6]
      Left = 94
      Top = 105
      ParentFont = False
      Properties.MaxLength = 7
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 4
      Width = 146
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1050#1086#1076' '#1090#1072#1084'. '#1086#1088#1075#1072#1085#1072
        Control = edtCC
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1053#1072#1095'. '#1076#1072#1090#1072' *'
        Control = edtbDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1050#1086#1085#1077#1095'. '#1076#1072#1090#1072' *'
        Control = edtEDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1053#1072#1095'. '#1085#1086#1084#1077#1088' *'
        Control = edtMinNo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [4]
        Caption = #1050#1086#1085#1077#1095'. '#1085#1086#1084#1077#1088' *'
        Control = edtMaxNo
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 15
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object xlReport: TxlReport
    DataExportMode = xdmCSV
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = 'report\'#1050#1086#1085#1090#1088#1086#1083#1100' '#1085#1086#1084#1077#1088#1086#1074' '#1058#1055#1054'.xls'
    DataSources = <
      item
        DataSet = dsData
        Alias = 'dsData'
        Range = 'rData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsDetail
        Alias = 'dsDetail'
        Range = 'rDetail'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsData'
      end>
    Preview = True
    Params = <
      item
        Name = 'BDate'
      end
      item
        Name = 'EDate'
      end>
    OnBeforeBuild = xlReportBeforeBuild
    Left = 176
    Top = 96
  end
  object dsData: TOracleDataSet
    SQL.Strings = (
      'select d.customs_code C_C, '
      '       '#39#1042#1041'-'#39'||lpad(:MinNo,7,'#39'0'#39') M_N, '
      '       '#39#1042#1041'-'#39'||lpad(:MaxNo,7,'#39'0'#39') M_X'
      'from fdc_tpo_lst d'
      
        'where d.reg_date between NVL(:fdate, d.reg_date) and NVL(:edate,' +
        ' d.reg_date)'
      '  and d.customs_code like NVL(:customs_code, '#39'%'#39')'
      'group by d.customs_code'
      'order by d.customs_code')
    Variables.Data = {
      0300000005000000060000003A46444154450C00000000000000000000000600
      00003A45444154450C00000000000000000000000D0000003A435553544F4D53
      5F434F4445050000000000000000000000060000003A4D494E4E4F0500000000
      00000000000000060000003A4D41584E4F050000000000000000000000}
    BeforeQuery = dsDataBeforeQuery
    Left = 10
    Top = 64
  end
  object dsDetail: TOracleDataSet
    SQL.Strings = (
      'select c.C_C'
      '      ,n.column_value decl_no'
      
        'from table(fdc_number_list_gen(to_number(substr(:MinNo,greatest(' +
        'length(:MinNo)-6,1),7)),substr(:MaxNo,greatest(length(:MaxNo)-6,' +
        '1),7),7)) n'
      '    ,('
      '      select d.customs_code C_C '
      '      from fdc_tpo_lst d'
      
        '      where d.reg_date between NVL(:fdate, d.reg_date) and NVL(:' +
        'edate, d.reg_date)'
      '        and d.customs_code like NVL(:customs_code, '#39'%'#39')'
      '      group by d.customs_code'
      '      order by d.customs_code'
      '     ) c'
      'minus'
      'select C_C'
      '      ,decl_no'
      'from ('
      '      select d.customs_code C_C '
      
        '            ,substr(d.decl_no,greatest(length(d.decl_no)-6,1),7)' +
        ' decl_no'
      '      from fdc_tpo_lst d'
      
        '      where d.reg_date between NVL(:fdate, d.reg_date) and NVL(:' +
        'edate, d.reg_date)'
      '        and d.customs_code like NVL(:customs_code, '#39'%'#39')'
      
        '        and substr(d.decl_no,greatest(length(d.decl_no)-6,1),7) ' +
        'between lpad(substr(:MinNo,greatest(length(:MinNo)-6,1),7),7 ,'#39'0' +
        #39')'
      
        '                                                                ' +
        '                               and'
      
        '                                                                ' +
        '                               lpad(substr(:MaxNo,greatest(lengt' +
        'h(:MaxNo)-6,1),7),7,'#39'0'#39')'
      '      order by d.customs_code'
      '     )'
      '')
    Variables.Data = {
      03000000050000000D0000003A435553544F4D535F434F444505000000000000
      0000000000060000003A46444154450C0000000000000000000000060000003A
      45444154450C0000000000000000000000060000003A4D494E4E4F0500000000
      00000000000000060000003A4D41584E4F050000000000000000000000}
    Master = dsData
    MasterFields = 'C_C'
    DetailFields = 'CUSTOMS_CODE'
    BeforeQuery = dsDetailBeforeQuery
    Left = 80
    Top = 64
  end
end
