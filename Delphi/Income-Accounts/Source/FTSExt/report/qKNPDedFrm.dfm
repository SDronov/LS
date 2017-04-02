inherited qKNPDedForm: TqKNPDedForm
  Left = 542
  Top = 380
  Caption = #1056#1072#1089#1093#1086#1076#1086#1074#1072#1085#1080#1077' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 177
  ClientWidth = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 327
    Height = 177
    inherited btnCancel: TcxButton
      Left = 243
      Top = 145
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 162
      Top = 145
      ModalResult = 0
      TabOrder = 4
    end
    object edtbDate: TcxDateEdit [2]
      Left = 75
      Top = 63
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 259
    end
    object edtEDate: TcxDateEdit [3]
      Left = 75
      Top = 87
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 259
    end
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [4]
      Left = 75
      Top = 9
      DataBinding.DataField = 'KNP_ID'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = DictData.srcAgreements
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 111
    end
    object fdcObjectLookupEdit2: TfdcObjectLookupEdit [5]
      Left = 75
      Top = 36
      DataBinding.DataField = 'SUBJ_ID'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.ShowHeader = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 111
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
        Control = fdcObjectLookupEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [1]
        Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
        Visible = False
        Control = fdcObjectLookupEdit2
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = #1053#1072#1095'. '#1076#1072#1090#1072
        Control = edtbDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [3]
        Caption = #1050#1086#1085#1077#1095'. '#1076#1072#1090#1072
        Control = edtEDate
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 48
    Top = 65535
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 76
    Top = 65535
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 160
    Top = 65535
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 65535
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 104
    Top = 65535
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 132
    Top = 65535
  end
  object dsMain: TOracleDataSet
    SQL.Strings = (
      'select '
      
        'po.doc_no||'#39'('#39'||po.doc_no2||'#39') '#1086#1090' '#39'||to_char(po.doc_date, '#39'dd.mm' +
        '.yyyy'#39') doc_no'
      ',po.doc_summa'
      ',po.summa po_summa'
      ',        case '
      
        '        when kbk.code is null then '#39'00000000000000000000'#39'||'#39'_'#39'||' +
        #39#1042#1086#1079#1074#1088#1072#1090#39
      '         else kbk.code||'#39'_'#39'||kbk.descript end kbk,'
      '--       pt.code pay_type,'
      '       sum(pd.summa) summa,'
      '       :sdate sdate,'
      '       :edate edate'
      '  from '
      '       fdc_payment_deduction pd,'
      '       fdc_payment_order     po,'
      '       fdc_dict              pt,'
      '       fdc_dict_lst              kbk'
      ' where po.doc_date between :sdate and :edate'
      '   and po.id = pd.payment_id'
      '   and po.agreement_id = :knp_id'
      '   and pt.id(+) = pd.pay_type_id'
      '   and kbk.id(+) = pd.kbkcode_id'
      '   and po.agreement_id = :knp_id'
      ' group by po.doc_no,po.doc_no2,po.doc_date '
      ',po.doc_summa'
      ',po.summa'
      '        ,case '
      
        '        when kbk.code is null then '#39'00000000000000000000'#39'||'#39'_'#39'||' +
        #39#1042#1086#1079#1074#1088#1072#1090#39
      '         else kbk.code||'#39'_'#39'||kbk.descript end')
    Variables.Data = {
      0300000003000000060000003A53444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000070000003A4B4E505F494404
      0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000500000053554D4D41010000000000050000004544415445
      01000000000006000000444F435F4E4F0100000000000A0000005041594D454E
      545F4944010000000000020000005353010000000000060000004453554D4D41
      0100000000000C0000005041594D454E545F49445F3101000000000003000000
      4B424B01000000000005000000534441544501000000000008000000504F5F53
      554D4D41010000000000}
    BeforeQuery = dsMainBeforeQuery
    Session = MainData.Session
    Left = 80
    Top = 40
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
    Top = 40
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1056#1072#1089#1093#1086#1076'.xls'
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'dsHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsData
        Alias = 'dsData'
        Range = 'rngData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        OnBeforeDataTransfer = xlReportDataSources1BeforeDataTransfer
      end
      item
        Alias = 'dsTotal'
        Range = 'rngTotal'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Enabled = False
        Tag = 0
        OnBeforeDataTransfer = xlReportDataSources2BeforeDataTransfer
      end>
    Preview = False
    Params = <>
    Left = 8
    Top = 80
  end
  object dsParam: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 128
    Top = 88
    object dsParamKNP_ID: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      FieldName = 'KNP_ID'
      Required = True
      OnValidate = dsParamKNP_IDValidate
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
    Left = 80
    Top = 88
  end
  object dsPayerList: TOracleDataSet
    SQL.Strings = (
      'select t.id, t.name'
      'from fdc_bp_agreement_subject_lst t where t.agreement_Id = :id'
      'union'
      'select x.subject_id id,  x.subj_name name'
      'from fdc_bp_agreement_lst x where x.Id = :id'
      'union'
      'select x.broker_id id,  x.broker_name name'
      'from fdc_bp_agreement_lst x where x.Id = :id')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    BeforeQuery = dsPayerListBeforeQuery
    Left = 240
    Top = 40
  end
  object dsData: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    OnFilterRecord = dsDataFilterRecord
    Left = 184
    Top = 88
  end
  object dsHeader: TOracleDataSet
    SQL.Strings = (
      
        'select distinct a.subj_name || '#39'('#1048#1053#1053' '#39' || a.subj_inn || '#39')'#39' knp_' +
        'name,'
      '       a.doc_no,'
      '       a.doc_date,'
      '--       s.name || '#39'('#1048#1053#1053' '#39' || s.inn || '#39')'#39' payer_name,'
      '       :sdate sdate,'
      '       :edate edate'
      '  from fdc_bp_agreement_lst a '
      '/*'
      ',(  select t.id, t.name, t.inn'
      
        'from fdc_bp_agreement_subject_lst t where t.agreement_Id = :aid ' +
        'and t.id = :sid'
      'union'
      'select x.subject_id id,  x.subj_name, x.subj_inn name'
      
        'from fdc_bp_agreement_lst x where x.Id = :aid and x.subject_id =' +
        ' :sid'
      'union'
      'select x.broker_id id,  x.broker_name, x.broker_inn name'
      
        'from fdc_bp_agreement_lst x where x.Id = :aid and x.broker_id = ' +
        ':sid'
      ') s'
      '*/'
      ' where a.id = :aid')
    Variables.Data = {
      0300000003000000060000003A53444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000040000003A41494404000000
      0000000000000000}
    BeforeQuery = dsHeaderBeforeQuery
    Left = 184
    Top = 40
  end
  object srcPayerList: TDataSource
    DataSet = dsPayerList
    Left = 232
    Top = 88
  end
end
