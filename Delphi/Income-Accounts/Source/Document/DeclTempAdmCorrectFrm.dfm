inherited DeclTempAdmCorrectFrm: TDeclTempAdmCorrectFrm
  Left = 233
  Top = 225
  Caption = 'DeclTempAdmCorrectFrm'
  ClientHeight = 476
  ClientWidth = 772
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 772
    Height = 476
    inherited Bevel1: TBevel
      Top = 436
      Width = 482
    end
    inherited btnCancel: TcxButton
      Left = 688
      Top = 444
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 607
      Top = 444
      TabOrder = 1
    end
    object cxGrid1: TcxGrid [3]
      Left = 9
      Top = 9
      Width = 755
      Height = 377
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsSetGoodsCharge
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'SUMMA'
            Column = cxGrid1DBTableView1SUMMA
          end
          item
            Kind = skSum
            FieldName = 'NEW_SUMMA'
            Column = cxGrid1DBTableView1NEW_SUMMA
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        object cxGrid1DBTableView1DECL_GOODS_ID: TcxGridDBColumn
          DataBinding.FieldName = 'DECL_GOODS_ID'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1GOODS_CODE: TcxGridDBColumn
          DataBinding.FieldName = 'GOODS_CODE'
          GroupIndex = 0
          Options.Editing = False
        end
        object cxGrid1DBTableView1GOODS_NAME: TcxGridDBColumn
          DataBinding.FieldName = 'GOODS_NAME'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1PAY_TYPE_ID: TcxGridDBColumn
          DataBinding.FieldName = 'PAY_TYPE_ID'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1PAY_TYPE_CODE: TcxGridDBColumn
          DataBinding.FieldName = 'PAY_TYPE_CODE'
          Options.Editing = False
        end
        object cxGrid1DBTableView1PAY_MODE_ID: TcxGridDBColumn
          DataBinding.FieldName = 'PAY_MODE_ID'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1CURRENCY_ID: TcxGridDBColumn
          DataBinding.FieldName = 'CURRENCY_ID'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1SUMMA: TcxGridDBColumn
          DataBinding.FieldName = 'SUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          Options.Editing = False
          Width = 211
        end
        object cxGrid1DBTableView1DATE_BEGIN: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_BEGIN'
          Options.Editing = False
        end
        object cxGrid1DBTableView1DATE_END: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_END'
          Options.Editing = False
        end
        object cxGrid1DBTableView1NEW_SUMMA: TcxGridDBColumn
          DataBinding.FieldName = 'NEW_SUMMA'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          Width = 159
        end
        object cxGrid1DBTableView1CHANGE_REASON_ID: TcxGridDBColumn
          DataBinding.FieldName = 'CHANGE_REASON_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = dsReason
          Properties.MaxLength = 300
          Width = 250
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item5: TdxLayoutItem [0]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Control = cxGrid1
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 256
    Top = 39
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 284
    Top = 39
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 368
    Top = 39
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 396
    Top = 39
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 312
    Top = 39
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 340
    Top = 39
  end
  object dsData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 72
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 320
    Top = 72
  end
  object odsSetGoodsCharge: TOracleDataSet
    SQL.Strings = (
      'select '
      '       c.decl_goods_id,'
      '       c.pay_mode_id,'
      '       g.goods_code,'
      '       g.goods_name,'
      '       c.currency_id,'
      '       c.pay_type_id,'
      '       c.pay_type_code,'
      '       c.summa,'
      '       To_number(null) as New_summa,'
      '       c.date_begin,'
      '       c.date_end,'
      '       c.mode_id,'
      '       c.prolong_id,'
      '       to_number(null) change_reason_id'
      
        '  from fdc_decl_goods_lst g, fdc_goods_charge_hist_lst c,fdc_cus' +
        'tom_decl_temp_adm_lst ct'
      ' where ct.id              = :pDeclId'
      '   and g.decl_id          = ct.id'
      '   and c.decl_goods_id(+) = g.ID'
      '   and fdc_Pay_Type_Is_Registration( c.pay_type_code ) = 0'
      '   and c.pay_mode_code = '#39#1059#1056#39
      ' order by g.goods_code,date_begin,date_end')
    Variables.Data = {
      0300000001000000080000003A504445434C4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000E0000000B0000005041595F545950455F49440100000000000D0000
      005041595F545950455F434F44450100000000000500000053554D4D41010000
      000000090000004E45575F53554D4D410100000000000D0000004445434C5F47
      4F4F44535F49440100000000000B0000005041595F4D4F44455F494401000000
      00000B00000043555252454E43595F49440100000000000A000000474F4F4453
      5F434F44450100000000000A000000474F4F44535F4E414D450100000000000A
      000000444154455F424547494E01000000000008000000444154455F454E4401
      0000000000070000004D4F44455F49440100000000000A00000050524F4C4F4E
      475F4944010000000000100000004348414E47455F524541534F4E5F49440100
      00000000}
    OnApplyRecord = odsSetGoodsChargeApplyRecord
    Session = MainData.Session
    Left = 104
    Top = 248
    object odsSetGoodsChargePAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargePAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 15
      FieldName = 'PAY_TYPE_CODE'
      ReadOnly = True
      Size = 1500
    end
    object odsSetGoodsChargeDECL_GOODS_ID: TFloatField
      FieldName = 'DECL_GOODS_ID'
      ReadOnly = True
    end
    object odsSetGoodsChargeGOODS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 20
      FieldName = 'GOODS_CODE'
    end
    object odsSetGoodsChargeGOODS_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'GOODS_NAME'
      Size = 100
    end
    object odsSetGoodsChargePAY_MODE_ID: TFloatField
      FieldName = 'PAY_MODE_ID'
      ReadOnly = True
    end
    object odsSetGoodsChargeCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
    end
    object odsSetGoodsChargeSUMMA: TFloatField
      DisplayLabel = #1059#1089#1083#1086#1074#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086
      DisplayWidth = 30
      FieldName = 'SUMMA'
      ReadOnly = True
    end
    object odsSetGoodsChargeNEW_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      DisplayWidth = 30
      FieldName = 'NEW_SUMMA'
    end
    object odsSetGoodsChargeDATE_BEGIN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'DATE_BEGIN'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargeDATE_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldName = 'DATE_END'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargeMODE_ID: TFloatField
      FieldName = 'MODE_ID'
    end
    object odsSetGoodsChargePROLONG_ID: TFloatField
      FieldName = 'PROLONG_ID'
    end
    object odsSetGoodsChargeCHANGE_REASON_ID: TFloatField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'CHANGE_REASON_ID'
    end
  end
  object dsSetGoodsCharge: TDataSource
    DataSet = odsSetGoodsCharge
    Left = 104
    Top = 296
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 248
    Top = 80
    object sqlAddGoodsCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  if :summa <> 0 or :summa is not null then'
        
          '  :result := p_doc_charge.addgoodscharge(pdeclgoodsid => :decl_g' +
          'oods_id,'
        
          '                                         ppaytypeid   => :pay_ty' +
          'pe_id,'
        
          '                                         ppaymodeid   => fdc_dic' +
          't_get_bycode('#39'PaymentMode'#39','#39#1059#1056#39'),'
        '                                         psumma       => :summa,'
        
          '                                         pcurrencyid  => :curren' +
          'cy_id,'
        
          '                                         pdatebegin   => :date_b' +
          'egin,'
        
          '                                         pdateend     => :date_e' +
          'nd,'
        
          '                                         pModeId      => :mode_i' +
          'd,'
        
          '                                         pPeriodId    => :prolon' +
          'g_id,'
        
          '                                         pReasonId    => :change' +
          '_reason_id);'
        '  end if;'
        'end;')
    end
    object sqlCheckSumma: TsqlOp
      SQL.Strings = (
        'declare'
        
          '  vTaxExemptionPaymentModes fdc_value.stringvalue%TYPE := '#39','#39' ||' +
          ' fdc_valuestring_sys_get(pSysName => '#39'TaxExemptionPaymentModes'#39')' +
          ' || '#39','#39';'
        '  vRunningMonth Date;'
        '  vMonthlySumma NUMBER(22,2);'
        '  vPayTypeCode  fdc_dict.code2%type;'
        '  '
        'begin'
        '  if :psumma < 0 and :psumma is not null then'
        '    vRunningMonth := Trunc(:pDateBegin,'#39'MONTH'#39');'
        '    -- '#1085#1077#1087#1086#1083#1085#1099#1081' '#1084#1077#1089#1103#1094' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
        '    if Trunc(:pDateBegin,'#39'MONTH'#39') < :pDateBegin Then'
        '       vRunningMonth := add_months(vRunningMonth, 1);'
        '    end if;    '
        '    '
        '    while (vRunningMonth <= :pDateEnd)  loop'
        '    select sum(  '
        
          '           case when vRunningMonth =  TRUNC(c.date_begin, '#39'MONTH' +
          #39')'
        '                 and vRunningMonth <> c.date_begin '
        '           then'
        '                NULL '
        '           else     '
        '                c.summa'
        '           end)          '
        '    into vMonthlySumma  '
        '    from fdc_decl_goods_lst g, fdc_goods_charge_hist_lst c'
        '    where g.decl_id       = :pDeclId'
        '      and c.decl_goods_id = g.ID'
        '      and c.pay_type_id   = :pPayTypeId'
        '      and c.pay_mode_code = '#39#1059#1056#39
        '      and ( (     vRunningMonth >= TRUNC(c.date_begin, '#39'MONTH'#39')'
        '              and vRunningMonth <=  TRUNC(c.date_end, '#39'MONTH'#39')'
        '              and c.prolong_id is not null)'
        '           or  '
        '            (     vRunningMonth >= c.date_begin'
        '              and add_months(vRunningMonth, 1)-1 <=c.date_end '
        '              and c.prolong_id is null))'
        '           ;'
        '      If vMonthlySumma < abs(:pSumma) Then'
        
          '          vPayTypeCode := fdc_dict_get_fullcode(pID => :pPayType' +
          'Id);'
        
          '          fdc_util.Abort('#39#1057#1091#1084#1084#1072' '#1087#1086' '#1074#1080#1076#1091' ('#39'||vPayTypeCode||'#39')  '#1085#1072 +
          ' '#1076#1072#1090#1091': '#39'||to_date(vRunningMonth,'#39'dd.mm.yyyy'#39')||'#39', '#1085#1077' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' ' +
          #1073#1086#1083#1100#1096#1077': '#39'||vMonthlySumma);'
        '      end if;    '
        '      vRunningMonth := add_months(vRunningMonth, 1);'
        '    end loop;'
        '  end if;'
        'end;')
    end
  end
  object GridPopupMenu: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <
      item
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
      end>
    AlwaysFireOnPopup = True
    Left = 368
    Top = 83
  end
  object odsGetReason: TOracleDataSet
    SQL.Strings = (
      'SELECT ID'
      '      ,CODE || '#39' '#39' || NAME AS name'
      '  FROM fdc_type_correction_lst'
      '  WHERE code <> '#39'49'#39
      '  ORDER BY code')
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = MainData.Session
    Left = 288
    Top = 192
    object odsGetReasonID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetReasonNAME: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'NAME'
      Size = 3001
    end
  end
  object dsReason: TDataSource
    DataSet = odsGetReason
    Left = 288
    Top = 240
  end
end
