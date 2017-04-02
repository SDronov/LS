inherited DeclTempAdmStopForm: TDeclTempAdmStopForm
  Left = 270
  Top = 210
  Caption = 'DeclTempAdmStopForm'
  ClientHeight = 425
  ClientWidth = 739
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 739
    Height = 425
    inherited Bevel1: TBevel
      Top = 385
      Width = 482
    end
    inherited btnCancel: TcxButton
      Left = 655
      Top = 393
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 574
      Top = 393
      TabOrder = 5
    end
    object edtDateBegin: TcxDBDateEdit [3]
      Left = 186
      Top = 147
      DataBinding.DataField = 'Date_begin'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 544
    end
    object edtDateEnd: TcxDBDateEdit [4]
      Left = 186
      Top = 174
      DataBinding.DataField = 'Date_end'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 3
      Width = 544
    end
    object rgTovar: TcxRadioGroup [5]
      Left = 9
      Top = 36
      ParentColor = False
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1086' '#1095#1072#1089#1090#1080' '#1090#1086#1074#1072#1088#1086#1074
        end
        item
          Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1086' '#1074#1089#1077#1084' '#1090#1086#1074#1072#1088#1072#1084
        end>
      Properties.OnEditValueChanged = rgTovarPropertiesEditValueChanged
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Height = 105
      Width = 185
    end
    object edtMode: TcxDBLookupComboBox [6]
      Left = 186
      Top = 9
      DataBinding.DataField = 'mode_id'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CODE'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListSource = dsGetMode
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 544
    end
    object cxGrid1: TcxGrid [7]
      Left = 9
      Top = 201
      Width = 250
      Height = 200
      TabOrder = 4
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
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        object cxGrid1DBTableView1GOODS_NAME: TcxGridDBColumn
          DataBinding.FieldName = 'GOODS_NAME'
          Visible = False
        end
        object cxGrid1DBTableView1GOODS_CODE: TcxGridDBColumn
          DataBinding.FieldName = 'GOODS_CODE'
          GroupIndex = 0
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
        object cxGrid1DBTableView1DECL_GOODS_ID: TcxGridDBColumn
          DataBinding.FieldName = 'DECL_GOODS_ID'
          Visible = False
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
          Caption = #1059#1089#1083#1086#1074#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086
          DataBinding.FieldName = 'SUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          Options.Editing = False
          Width = 221
        end
        object cxGrid1DBTableView1NEW_SUMMA: TcxGridDBColumn
          DataBinding.FieldName = 'NEW_SUMMA'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          Width = 194
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item4: TdxLayoutItem [0]
        Caption = #1053#1086#1074#1072#1103' '#1090#1072#1084#1086#1078#1077#1085#1085#1072#1103' '#1087#1088#1086#1094#1077#1076#1091#1088#1072
        Control = edtMode
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = 'cxRadioGroup1'
        ShowCaption = False
        Control = rgTovar
        ControlOptions.ShowBorder = False
      end
      object lciDate: TdxLayoutItem [2]
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
        Control = edtDateBegin
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [3]
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103
        Control = edtDateEnd
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [4]
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
        
          '                                         psumma       => -:summa' +
          ','
        
          '                                         pcurrencyid  => :curren' +
          'cy_id,'
        
          '                                         pdatebegin   => :date_b' +
          'egin,'
        
          '                                         pdateend     => :date_e' +
          'nd,'
        
          '                                         pModeId      => :mode_i' +
          'd);'
        '  end if;'
        'end;')
    end
    object sqlGetExportDate: TsqlOp
      SQL.Strings = (
        'begin'
        '   select export_date into :pDate '
        '   from fdc_custom_decl_temp_adm_lst'
        '   where id = :pDeclId;'
        'end;')
    end
    object sqlCheckSumma: TsqlOp
      SQL.Strings = (
        'declare'
        
          '  vRegistrationChargeCodes  fdc_value.stringvalue%TYPE := '#39','#39' ||' +
          ' fdc_valuestring_sys_get( '#39'RegistrationChargeCodes'#39' ) || '#39','#39';'
        
          '  vTaxExemptionPaymentModes fdc_value.stringvalue%TYPE := '#39','#39' ||' +
          ' fdc_valuestring_sys_get(pSysName => '#39'TaxExemptionPaymentModes'#39')' +
          ' || '#39','#39';'
        '  vRunningMonth Date;'
        '  vMonthlySumma NUMBER(22,2);'
        '  vPayTypeCode  fdc_dict.code2%type;'
        '  '
        'begin'
        '  if :psumma <> 0 or :psumma is not null then'
        '    vRunningMonth := Trunc(:pDateBegin,'#39'MONTH'#39');'
        '    -- '#1085#1077#1087#1086#1083#1085#1099#1081' '#1084#1077#1089#1103#1094' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
        '    if Trunc(:pDateBegin,'#39'MONTH'#39') < :pDateBegin Then'
        '       vRunningMonth := add_months(vRunningMonth, 1);'
        '    end if;    '
        '    '
        '    while (vRunningMonth <= :pDateEnd)  loop'
        '    select nvl(sum(  '
        
          '           case when vRunningMonth =  TRUNC(c.date_begin, '#39'MONTH' +
          #39')'
        '                 and vRunningMonth <> c.date_begin '
        '           then'
        '                NULL '
        '           else     '
        '                c.summa'
        '           end),0)          '
        '    into vMonthlySumma  '
        '    from fdc_decl_goods_lst g, fdc_goods_charge_lst c'
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
  object dsData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 288
    Top = 72
    object dsDataDate_begin: TDateField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'Date_begin'
      Required = True
    end
    object dsDataDate_end: TDateField
      FieldName = 'Date_end'
    end
    object dsDatapay_mode_id: TIntegerField
      FieldName = 'mode_id'
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 320
    Top = 72
  end
  object odsGetMode: TOracleDataSet
    SQL.Strings = (
      'select id,name,code'
      '  from fdc_Custom_Mode_Lst t'
      
        ' where sysdate between t.sdate and NVL(t.edate, to_date('#39'3112300' +
        '0'#39','#39'ddmmyyyy'#39'))')
    QBEDefinition.QBEFieldDefs = {
      0400000003000000020000004944010000000000040000004E414D4501000000
      000004000000434F4445010000000000}
    Session = MainData.Session
    Left = 80
    object odsGetModeID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetModeNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'NAME'
      Size = 100
    end
    object odsGetModeCODE: TStringField
      DisplayLabel = #1050#1086#1076
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 10
    end
  end
  object dsGetMode: TDataSource
    DataSet = odsGetMode
    Left = 152
  end
  object odsSetGoodsCharge: TOracleDataSet
    SQL.Strings = (
      'select c.decl_goods_id,'
      '       c.pay_mode_id,'
      '       g.goods_code,'
      '       g.goods_name,'
      '       c.currency_id,'
      '       c.pay_type_id,'
      '       c.pay_type_code,'
      '       sum(c.summa) as summa,'
      '       To_number(null) as New_summa'
      
        '  from fdc_decl_goods_lst g, fdc_goods_charge_hist_lst c,fdc_cus' +
        'tom_decl_temp_adm_lst ct'
      ' where ct.id              = :pDeclId'
      '   and g.decl_id          = ct.id'
      '   and c.decl_goods_id(+) = g.ID'
      '   and fdc_Pay_Type_Is_Registration( c.pay_type_code ) = 0'
      '   AND c.pay_mode_code = '#39#1059#1056#39
      
        '   and c.mode_id = p_nsi_dict.GetIDByCode('#39'CustomMode'#39','#39'53'#39',c.da' +
        'te_begin)'
      '   and sysdate between c.date_begin and c.date_end'
      ' group by c.decl_goods_id,'
      '          c.pay_mode_id,'
      '          g.goods_code,'
      '          g.goods_name,'
      '          c.currency_id,'
      '          c.pay_type_id,'
      '          c.pay_type_code'
      '')
    Variables.Data = {
      0300000001000000080000003A504445434C4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000B0000005041595F545950455F49440100000000000D0000
      005041595F545950455F434F44450100000000000500000053554D4D41010000
      000000090000004E45575F53554D4D410100000000000D0000004445434C5F47
      4F4F44535F49440100000000000B0000005041595F4D4F44455F494401000000
      00000B00000043555252454E43595F49440100000000000A000000474F4F4453
      5F434F44450100000000000A000000474F4F44535F4E414D45010000000000}
    OnApplyRecord = odsSetGoodsChargeApplyRecord
    Session = MainData.Session
    Left = 104
    Top = 248
    object odsSetGoodsChargeGOODS_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 100
      FieldName = 'GOODS_NAME'
      Visible = False
      Size = 1500
    end
    object odsSetGoodsChargeGOODS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'GOODS_CODE'
      Size = 1500
    end
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
    object odsSetGoodsChargePAY_MODE_ID: TFloatField
      FieldName = 'PAY_MODE_ID'
      ReadOnly = True
    end
    object odsSetGoodsChargeCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
    end
    object odsSetGoodsChargeSUMMA: TFloatField
      DisplayLabel = #1045#1078#1077#1084#1077#1089#1103#1095#1085#1099#1077' '#1087#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
      DisplayWidth = 30
      FieldName = 'SUMMA'
      ReadOnly = True
    end
    object odsSetGoodsChargeNEW_SUMMA: TFloatField
      DisplayLabel = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1088#1077#1078#1080#1084#1072' ('#1089#1091#1084#1084#1072')'
      DisplayWidth = 30
      FieldName = 'NEW_SUMMA'
    end
  end
  object dsSetGoodsCharge: TDataSource
    DataSet = odsSetGoodsCharge
    Left = 104
    Top = 296
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
end
