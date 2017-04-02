inherited qKNPAccForm: TqKNPAccForm
  Left = 440
  Top = 378
  Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090' ('#1087#1086' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1102')'
  ClientHeight = 139
  ClientWidth = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 379
    Height = 139
    inherited btnCancel: TcxButton
      Left = 295
      Top = 107
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 214
      Top = 107
      ModalResult = 0
      TabOrder = 3
    end
    object edtbDate: TcxDBDateEdit [2]
      Left = 74
      Top = 36
      DataBinding.DataField = 'SDATE'
      DataBinding.DataSource = srcParam
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
    object edtEDate: TcxDBDateEdit [3]
      Left = 74
      Top = 60
      DataBinding.DataField = 'EDATE'
      DataBinding.DataSource = srcParam
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
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [4]
      Left = 74
      Top = 9
      DataBinding.DataField = 'AGMT_ID'
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
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
        Control = fdcObjectLookupEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1053#1072#1095'. '#1076#1072#1090#1072
        Control = edtbDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1050#1086#1085#1077#1095'. '#1076#1072#1090#1072
        Control = edtEDate
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 200
    Top = 7
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 228
    Top = 7
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
    Left = 312
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 340
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 256
    Top = 7
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 284
    Top = 7
  end
  object dsData: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      
        '  q.OperDate OPERDATE, nvl(SUM(q.InSum), 0) AS InSum, nvl(SUM(q.' +
        'OutSum), 0) AS OutSum'
      'FROM '
      '  ('
      
        '   SELECT p.Income_Date AS OperDate, p.Summa AS InSum, 0 AS OutS' +
        'um '
      '     FROM fdc_po_lst p '
      '     WHERE p.INCOME_DATE BETWEEN :SDATE AND :EDATE'
      '       AND EXISTS ( SELECT 1'
      '                      FROM fdc_value_lst v'
      '                      WHERE v.OWNER_OBJECT_ID = :AGMT_ID'
      '                        AND v.Ref_Object_ID = p.ID)'
      '   UNION ALL              '
      
        '   SELECT pd.doc_date AS OperDate, 0 AS InSum, pd.summa AS OutSu' +
        'm'
      
        '      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_kn' +
        'p_lst dp, fdc_rel_pack_docs_lst r'
      '      WHERE dp.Agreement_Id = :AGMT_ID'
      '        AND dp.Doc_Date BETWEEN :SDATE AND :EDATE     '
      '        AND r.Object_ID = dp.id'
      '        AND r.Rel_Object_ID = pd.id'
      '   ) q  '
      'GROUP BY q.OperDate'
      'ORDER BY q.OperDate')
    Variables.Data = {
      0300000003000000060000003A53444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000080000003A41474D545F4944
      040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A0000000500000053554D4D41010000000000050000004544415445
      01000000000006000000444F435F4E4F0100000000000A0000005041594D454E
      545F4944010000000000020000005353010000000000060000004453554D4D41
      0100000000000C0000005041594D454E545F49445F3101000000000003000000
      4B424B01000000000005000000534441544501000000000008000000504F5F53
      554D4D41010000000000}
    BeforeQuery = dsDataBeforeQuery
    Session = MainData.Session
    Left = 48
    Top = 48
  end
  object dsDetail: TOracleDataSet
    SQL.Strings = (
      ' SELECT d.fmt_code AS KBK, '
      '        SUM(pd.summa) AS KBKSum'
      
        '      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_kn' +
        'p_lst dp, '
      '           fdc_rel_pack_docs_lst r, fdc_kbk_dict_lst d'
      '      WHERE dp.Agreement_Id = :AGMT_ID'
      '        AND dp.Doc_Date = :OPERDATE'
      '        AND r.Object_ID = dp.id'
      '        AND r.Rel_Object_ID = pd.id'
      '        AND d.id = pd.kbkcode_id'
      'GROUP BY d.fmt_code'
      'ORDER BY d.fmt_code')
    Variables.Data = {
      0300000002000000080000003A41474D545F4944040000000000000000000000
      090000003A4F504552444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000040000004E414D450100000000000500000053554D4D4101
      000000000005000000544F54414C010000000000020000004130010000000000}
    Master = dsData
    BeforeQuery = dsDetailBeforeQuery
    Session = MainData.Session
    Left = 96
    Top = 48
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1083#1080#1094#1089#1095#1077#1090'.xls'
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
      end
      item
        DataSet = dsDetail
        Alias = 'dsDetail'
        Range = 'rngDetail'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
        MasterSourceName = 'dsData'
      end>
    Preview = False
    Params = <>
    Left = 8
    Top = 64
  end
  object dsParam: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    AfterOpen = dsParamAfterOpen
    Left = 256
    Top = 56
    object dsParamAGMT_ID: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      FieldName = 'AGMT_ID'
      Required = True
    end
    object dsParamSDATE: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'SDATE'
      Required = True
    end
    object dsParamEDATE: TDateField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'EDATE'
      Required = True
    end
  end
  object srcParam: TDataSource
    DataSet = dsParam
    Left = 296
    Top = 56
  end
  object dsHeader: TOracleDataSet
    SQL.Strings = (
      
        'SELECT a.doc_no, a.doc_date, a.subj_name, a.subj_inn, a.subj_kpp' +
        ', :SDATE as SDATE, :EDATE as EDATE,'
      '  ( SELECT nvl(SUM(p.SUMMA), 0)'
      '     FROM fdc_po_lst p '
      '     WHERE p.INCOME_DATE < :SDATE'
      '       AND EXISTS ( SELECT 1'
      '                      FROM fdc_value_lst v'
      '                      WHERE v.OWNER_OBJECT_ID = a.ID'
      '                        AND v.Ref_Object_ID = p.ID)'
      '       ) AS InTotal,'
      '  ( SELECT nvl(SUM(pd.summa), 0)'
      
        '      FROM fdc_payment_deduction_all_lst pd, fdc_doc_pack_gtd_kn' +
        'p_lst dp, fdc_rel_pack_docs_lst r'
      '      WHERE dp.AGREEMENT_ID = a.ID'
      '        AND dp.DOC_DATE < :SDATE      '
      '        AND r.Object_ID = dp.id'
      '        AND r.Rel_Object_ID = pd.id'
      '  ) AS OutTotal'
      '     '
      'FROM fdc_bp_agreement_lst a'
      'WHERE '
      '    a.ID = :AGMT_ID ')
    Variables.Data = {
      0300000003000000060000003A53444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000080000003A41474D545F4944
      040000000000000000000000}
    BeforeQuery = dsHeaderBeforeQuery
    Left = 56
  end
end
