inherited qKNPPlusMinusForm: TqKNPPlusMinusForm
  Left = 436
  Top = 310
  Caption = #1055#1083#1102#1089#1099' '#1052#1080#1085#1091#1089#1099' '#1087#1086' '#1056#1077#1077#1089#1090#1088#1072#1084
  ClientHeight = 134
  ClientWidth = 326
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 326
    Height = 134
    inherited btnCancel: TcxButton
      Left = 242
      Top = 102
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 161
      Top = 102
      TabOrder = 3
    end
    object fdcObjectLookupEdit1: TfdcObjectLookupEdit [2]
      Left = 74
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
      Width = 247
    end
    object edtbDate: TcxDBDateEdit [3]
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
      Width = 629
    end
    object edtEDate: TcxDBDateEdit [4]
      Left = 74
      Top = 63
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
      Width = 312
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Group3: TdxLayoutGroup [0]
        ShowCaption = False
        Hidden = True
        ShowBorder = False
        object dxLayoutControl1Item2: TdxLayoutItem
          Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
          Control = fdcObjectLookupEdit1
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Group1: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object dxLayoutControl1Item1: TdxLayoutItem
            Caption = #1053#1072#1095'. '#1076#1072#1090#1072
            Control = edtbDate
            ControlOptions.ShowBorder = False
          end
          object dxLayoutControl1Item3: TdxLayoutItem
            Caption = #1050#1086#1085#1077#1095'. '#1076#1072#1090#1072
            Control = edtEDate
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 72
    Top = 7
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 108
    Top = 7
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 224
    Top = 7
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 260
    Top = 7
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 152
    Top = 7
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 7
  end
  object srcParam: TDataSource
    DataSet = dsParam
    Left = 128
    Top = 56
  end
  object dsParam: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    AfterOpen = dsParamAfterOpen
    Left = 80
    Top = 56
    object dsParamKNP_ID: TFloatField
      DisplayLabel = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
      FieldName = 'KNP_ID'
      Required = True
    end
    object dsParamSUBJ_ID: TFloatField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'SUBJ_ID'
    end
    object dsParamSUBJ_NAME: TStringField
      FieldName = 'SUBJ_NAME'
      Size = 300
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
  object dsMain: TOracleDataSet
    SQL.Strings = (
      'SELECT q.CustomsCode, '
      '       c.Name AS CustomsName ,'
      '       cd.g0131_code AS DeclType,'
      '       cd.Name AS DeclFullNumber, '
      '       SUM(q.SumSbor) AS SumSbor, '
      '       SUM(q.SumPlus) AS SumPlus, '
      '       SUM(q.SumMinus) AS SumMinus'
      'FROM  (  '
      #9#9#9#9'SELECT '
      #9#9#9#9#9' dp.EXT_SOURCE AS CustomsCode,'
      #9#9#9#9#9' pd.decl_id,'
      
        #9#9#9#9#9' CASE WHEN pt.code = '#39'100'#39' THEN pd.summa ELSE 0 END AS SumS' +
        'bor,'
      
        #9#9#9#9#9' CASE WHEN pt.code <> '#39'100'#39' AND pd.summa > 0 THEN pd.summa ' +
        'ELSE 0 END AS SumPlus,  '
      
        #9#9#9#9#9' CASE WHEN pt.code <> '#39'100'#39' AND pd.summa < 0 THEN pd.summa ' +
        'ELSE 0 END AS SumMinus'
      
        #9#9#9#9'FROM fdc_doc_pack_gtd_knp_lst dp, fdc_rel_pack_docs_lst r, f' +
        'dc_payment_deduction_all_lst pd, fdc_dict_lst pt  '
      #9#9#9#9'WHERE dp.DOC_DATE BETWEEN :SDATE AND :EDATE'
      #9#9#9#9#9'AND dp.AGREEMENT_ID = :AGMT_ID'
      #9#9#9#9#9'AND r.Object_ID = dp.ID'
      #9#9#9#9#9'AND r.Rel_Object_ID = pd.ID'
      #9#9#9#9#9'AND pt.id(+) = pd.pay_type_id'
      '     ) q, fdc_custom_decl_lst cd, fdc_customs_lst c'
      'WHERE cd.id = q.decl_id     '
      '  AND c.customs_code_8 = q.CustomsCode'
      'GROUP BY q.CustomsCode, '
      '       c.Name, '
      '       cd.g0131_code,'
      '       cd.Name,'
      '       cd.reg_date, '
      '       cd.decl_no'
      'ORDER BY q.CustomsCode, cd.reg_date, cd.decl_no')
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
    BeforeQuery = dsMainBeforeQuery
    Session = MainData.Session
    Left = 192
    Top = 56
  end
  object xlReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1053#1055'_'#1087#1083#1102#1089'-'#1084#1080#1085#1091#1089'.xls'
    DataSources = <
      item
        DataSet = dsMain
        Alias = 'dsData'
        Range = 'rngData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsPayerList
        Alias = 'dsBegin'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 24
    Top = 80
  end
  object dsPayerList: TOracleDataSet
    SQL.Strings = (
      
        'select doc_no, doc_date, :sdate sdate, :edate edate from fdc_bp_' +
        'agreement where id = :id')
    Variables.Data = {
      0300000003000000030000003A4944040000000000000000000000060000003A
      53444154450C0000000000000000000000060000003A45444154450C00000000
      00000000000000}
    BeforeQuery = dsPayerListBeforeQuery
    Left = 248
    Top = 56
  end
end
