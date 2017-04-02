inherited qReportControlTimeBackForm: TqReportControlTimeBackForm
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1089#1088#1086#1082#1086#1074' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  ClientHeight = 151
  ClientWidth = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 601
    Height = 151
    inherited btnCancel: TcxButton
      Left = 517
      Top = 119
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 436
      Top = 119
      TabOrder = 4
    end
    object cmbxCustomsTU: TfdcObjectLookupEdit [2]
      Left = 136
      Top = 63
      DataBinding.DataField = 'CodeTU'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.KeyFieldNames = 'CODE'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsGetCustomsTU
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 431
    end
    object cmbxCustoms: TfdcObjectLookupEdit [3]
      Left = 136
      Top = 90
      DataBinding.DataField = 'Code'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Properties.KeyFieldNames = 'CODE'
      Properties.ListColumns = <
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsGetCustoms
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 304
    end
    object edtDateFrom: TcxDBDateEdit [4]
      Left = 136
      Top = 9
      DataBinding.DataField = 'Date_From'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 337
    end
    object edtDateTo: TcxDBDateEdit [5]
      Left = 136
      Top = 36
      DataBinding.DataField = 'Date_To'
      DataBinding.DataSource = srcMain
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 337
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateFrom
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [1]
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Control = edtDateTo
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1086#1077' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Control = cmbxCustomsTU
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1058#1072#1084#1086#1078#1085#1103
        Control = cmbxCustoms
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 95
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 95
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 95
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 95
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 95
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 95
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ParamCheck = False
    ReadOnly = False
    SQL.Strings = (
      'select'
      
        '      (select Name from fdc_customs_lst c where c.customs_code_8' +
        '  = :pCustomsCode) customsname'
      
        '     ,(select to_char(:pDateBegin,'#39'dd.mm.yyyy'#39') from dual ) date' +
        '_begin'
      
        '     ,(select to_char(:pDateEnd,'#39'dd.mm.yyyy'#39') from dual ) date_e' +
        'nd'
      'from dual'
      '')
    Left = 360
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptInput
      end>
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ParamCheck = False
    ReadOnly = False
    SQL.Strings = (
      'SELECT DISTINCT'
      '      pb.doc_no '
      '     ,to_char(pb.doc_date,'#39'dd.mm.yyyy'#39') as doc_date '
      '     ,pb.summa'
      
        '     ,(select to_char(e.Moment,'#39'dd.mm.yyyy'#39') from fdc_event_lst ' +
        'e where e.object_id = dpr.id  and e.typesysname = '#39'EventAdd'#39' ) d' +
        'ate_post'
      
        '     ,pb.ext_source||'#39' '#39'||p_nsi_customs.GetCustomsFullNameByCode' +
        '8(pb.ext_source) as payer_name'
      '     ,pb.KBKCode'
      
        '     ,trim(pb.po_inn||'#39' '#39'||pb.po_name)                      as r' +
        'ecipient_name'
      
        '     ,(select code2 from fdc_dict where id = dp.reason_id ) as r' +
        'eason_code'
      
        '     ,dp.DOC_NUMBER                                         as D' +
        'EC_NUMBER'
      
        '     ,to_char(dp.DOC_DATE,'#39'dd.mm.yyyy'#39')                     as D' +
        'EC_DATE'
      
        '     ,Trim(dp.APP_NUMBER||'#39' '#39'||to_char(dp.APP_DATE,'#39'dd.mm.yyyy'#39')' +
        ') as APP_DOC'
      
        '     ,to_char(dp.date_last_doc,'#39'dd.mm.yyyy'#39')                as d' +
        'ate_last_doc'
      
        '     ,to_char(pby.doc_date,'#39'dd.mm.yyyy'#39')                    as d' +
        'ate_confirm'
      
        '     ,trunc( pb.doc_date)-trunc(nvl(dp.date_last_doc,nvl(dp.APP_' +
        'DATE_INCOME,dp.DOC_DATE)))-30  as days'
      '     ,pb.ext_source'
      'FROM fdc_rel_pack_docs_lst rel'
      '    ,fdc_payment_order_payback_lst pb'
      '    ,fdc_decision_payback_lst dp'
      '    ,fdc_doc_pack_returns dpr'
      '    ,fdc_doc_confirm_lst pby'
      'WHERE rel.Rel_Object_ID = pb.id'
      '  AND pb.dec_pay_id = dp.ID'
      '  AND dpr.id = rel.Object_ID'
      '  AND pby.confirmed_doc_id(+) = pb.id '
      '  AND pb.doc_date between :pDateBegin and nvl(:pDateEnd,sysdate)'
      '  AND (    (pb.ext_source like substr(:pCustomsCode,0,3)||'#39'%'#39
      '            and :pCustomsCode like '#39'10_00000'#39')'
      '        or (pb.ext_source like substr(:pCustomsCode,0,5)||'#39'%'#39
      '            and not :pCustomsCode like '#39'10_00000'#39')'
      '        or :pCustomsCode = '#39'10000000'#39')'
      
        '  AND trunc( pb.doc_date)-trunc(nvl(dp.date_last_doc,nvl(dp.APP_' +
        'DATE_INCOME,dp.DOC_DATE)))-30 > 0'
      'ORDER BY pb.ext_source    ')
    Left = 360
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pCustomsCode'
        ParamType = ptInput
      end>
  end
  object xlrReport: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen]
    XLSTemplate = '\report\'#1050#1086#1085#1090#1088#1086#1083#1100' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1089#1088#1086#1082#1086#1074'.xls'
    DataSources = <
      item
        DataSet = dsReport
        Alias = 'dsReport'
        Range = 'rngBody'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsHeader
        Alias = 'dsHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 288
    Top = 24
  end
  object qryCheckReport: TOracleQuery
    SQL.Strings = (
      'begin'
      '  fdc_nsi_report_check(:DateFrom);'
      'end;')
    Session = MainData.Session
    Variables.Data = {
      0300000001000000090000003A4441544546524F4D0C00000000000000000000
      00}
    Left = 288
    Top = 72
  end
  object dsGetCustomsTU: TDataSource
    DataSet = qGetCustomsTU
    Left = 192
    Top = 8
  end
  object dsGetCustoms: TDataSource
    DataSet = qGetCustoms
    Left = 192
    Top = 56
  end
  object qGetCustomsTU: TOracleDataSet
    SQL.Strings = (
      
        'select c.customs_code_8 as code,c.customs_code_8||'#39'  '#39'||name as ' +
        'name'
      'from fdc_customs_lst c '
      'where fdc_getparentcustomslevel(c.customs_code_8) = 0 '
      'and c.customs_code_8 like '#39'10_00000'#39
      'and nvl(c.dt_end,sysdate) >= sysdate'
      'order by c.customs_code_8')
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C49535401000000000004000000434F4445010000000000050000
      00434F444532010000000000090000004F574E45524E414D450100000000000C
      0000004F574E45525359534E414D450100000000000D0000004F574E45525459
      50454E414D45010000000000100000004F574E4552545950455359534E414D45
      0100000000000500000053444154450100000000000500000045444154450100
      0000000009000000444154424547444F43010000000000090000004E554D4245
      47444F4301000000000009000000444154454E44444F43010000000000090000
      004E554D454E44444F430100000000000D00000054454D504C4154455F4E414D
      45010000000000}
    Session = MainData.Session
    Left = 88
    Top = 8
  end
  object qGetCustoms: TOracleDataSet
    SQL.Strings = (
      
        'select c.customs_code_8 as code,c.customs_code_8||'#39'  '#39'||name as ' +
        'name'
      'from fdc_customs_lst c '
      
        'where fdc_getparentcustomscode(c.customs_code_8) = nvl(:pCustoms' +
        'Code,'#39'00000000'#39')'
      '  and c.customs_code_8 like '#39'10___000'#39
      '  and nvl(c.dt_end,sysdate) >= sysdate'
      'order by c.customs_code_8')
    Variables.Data = {
      03000000010000000D0000003A50435553544F4D53434F444505000000030000
      002D310000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000019000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C49535401000000000004000000434F4445010000000000050000
      00434F444532010000000000090000004F574E45524E414D450100000000000C
      0000004F574E45525359534E414D450100000000000D0000004F574E45525459
      50454E414D45010000000000100000004F574E4552545950455359534E414D45
      0100000000000500000053444154450100000000000500000045444154450100
      0000000009000000444154424547444F43010000000000090000004E554D4245
      47444F4301000000000009000000444154454E44444F43010000000000090000
      004E554D454E44444F430100000000000D00000054454D504C4154455F4E414D
      45010000000000}
    Session = MainData.Session
    Left = 88
    Top = 48
  end
  object dxMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 12
    object dxMemDataDate_From: TDateField
      FieldName = 'Date_From'
    end
    object dxMemDataDate_To: TDateField
      FieldName = 'Date_To'
    end
    object dxMemDataCustomsName: TStringField
      FieldName = 'Name'
      Size = 400
    end
    object dxMemDataCodeTU: TStringField
      FieldName = 'CodeTU'
      OnChange = dxMemDataCodeTUChange
    end
    object dxMemDataCode: TStringField
      FieldName = 'Code'
      Size = 8
    end
    object dxMemDataid: TIntegerField
      FieldName = 'Id'
    end
  end
  object srcMain: TDataSource
    DataSet = dxMemData
    Left = 8
    Top = 52
  end
end
