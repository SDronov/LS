inherited DeclTempAdmProlongForm: TDeclTempAdmProlongForm
  Left = 247
  Top = 231
  Caption = 'DeclTempAdmProlongForm'
  ClientHeight = 476
  ClientWidth = 791
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 791
    Height = 476
    inherited Bevel1: TBevel
      Top = 436
      Width = 482
    end
    inherited btnCancel: TcxButton
      Left = 707
      Top = 444
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 626
      Top = 444
      TabOrder = 4
    end
    object cxGrid1: TcxGrid [3]
      Left = 9
      Top = 36
      Width = 755
      Height = 377
      TabOrder = 3
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsSetGoodsCharge
        DataController.DetailKeyFieldNames = 'PROLONG_ID'
        DataController.KeyFieldNames = 'ROWNUM'
        DataController.MasterKeyFieldNames = 'ID'
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
          end
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
          Width = 143
        end
        object cxGrid1DBTableView1DATE_BEGIN: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_BEGIN'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1DATE_END: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_END'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1NEW_SUMMA: TcxGridDBColumn
          DataBinding.FieldName = 'NEW_SUMMA'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.UseThousandSeparator = True
          Width = 159
        end
        object cxGrid1DBTableView1DATE_END_NEW: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_END_NEW'
          PropertiesClassName = 'TcxDateEditProperties'
          Visible = False
          Options.Editing = False
        end
        object cxGrid1DBTableView1PROLONG_ID: TcxGridDBColumn
          DataBinding.FieldName = 'PROLONG_ID'
          Visible = False
        end
        object cxGrid1DBTableView1ROWNUM: TcxGridDBColumn
          DataBinding.FieldName = 'ROWNUM'
          Visible = False
          Options.Editing = False
        end
      end
      object cxGrid1DBTableView2: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsGetPeriodProlong
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView2ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object cxGrid1DBTableView2DECL_ID: TcxGridDBColumn
          DataBinding.FieldName = 'DECL_ID'
          Visible = False
        end
        object cxGrid1DBTableView2DATE_BEGIN: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_BEGIN'
        end
        object cxGrid1DBTableView2DATE_END: TcxGridDBColumn
          DataBinding.FieldName = 'DATE_END'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView2
        object cxGrid1Level2: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object edtDateBegin: TcxDBDateEdit [4]
      Tag = 33
      Left = 134
      Top = 9
      DataBinding.DataField = 'Date_begin'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 200
    end
    object edtDateEnd: TcxDBDateEdit [5]
      Tag = 33
      Left = 497
      Top = 9
      DataBinding.DataField = 'Date_end'
      DataBinding.DataSource = srcData
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 200
    end
    object cxButton1: TcxButton [6]
      Left = 703
      Top = 9
      Width = 75
      Height = 21
      Caption = #1080#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = cxButton1Click
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Group1: TdxLayoutGroup [0]
        ShowCaption = False
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item1: TdxLayoutItem
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
          Control = edtDateBegin
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item3: TdxLayoutItem
          Caption = #1053#1086#1074#1099#1081' '#1089#1088#1086#1082' '#1086#1073#1088#1072#1090#1085#1086#1075#1086' '#1074#1099#1074#1086#1079#1072
          Control = edtDateEnd
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item4: TdxLayoutItem
          Caption = 'cxButton1'
          ShowCaption = False
          Control = cxButton1
          ControlOptions.ShowBorder = False
        end
      end
      object dxLayoutControl1Item5: TdxLayoutItem [1]
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
    object dsDataDATE_BEGIN: TDateField
      FieldName = 'DATE_BEGIN'
      ReadOnly = True
    end
    object dsDataDATE_END: TDateField
      FieldName = 'DATE_END'
      ReadOnly = True
    end
    object dsDataprolong_id: TIntegerField
      FieldName = 'prolong_id'
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 320
    Top = 72
  end
  object odsSetGoodsCharge: TOracleDataSet
    SQL.Strings = (
      'select'
      '       rownum,'
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
      '       to_date(null) as date_end_new,'
      '       c.prolong_id'
      
        '  from fdc_decl_goods_lst g, fdc_goods_charge_hist_lst c,fdc_cus' +
        'tom_decl_temp_adm_lst ct'
      ' where ct.id              = :pDeclId'
      '   and g.decl_id          = ct.id'
      '   and c.decl_goods_id(+) = g.ID'
      '   and fdc_Pay_Type_Is_Registration( c.pay_type_code ) = 0'
      '   AND c.pay_mode_code = '#39#1059#1056#39
      
        '   and c.mode_id = p_nsi_dict.GetIDByCode('#39'CustomMode'#39','#39'53'#39',c.da' +
        'te_begin)'
      ' order by c.prolong_id, g.goods_code, date_begin, date_end')
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
      00000000000C000000444154455F454E445F4E45570100000000000A00000050
      524F4C4F4E475F494401000000000006000000524F574E554D010000000000}
    OnApplyRecord = odsSetGoodsChargeApplyRecord
    Session = MainData.Session
    AfterOpen = odsSetGoodsChargeAfterOpen
    AfterPost = odsSetGoodsChargeAfterPost
    AfterScroll = odsSetGoodsChargeAfterScroll
    AfterRefresh = odsSetGoodsChargeAfterOpen
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
      DisplayLabel = #1059#1089#1083#1086#1074#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086' '#1087#1086' '#1089#1090#1072#1088#1086#1084#1091' '#1089#1088#1086#1082#1091
      DisplayWidth = 30
      FieldName = 'SUMMA'
      ReadOnly = True
    end
    object odsSetGoodsChargeNEW_SUMMA: TFloatField
      DisplayLabel = #1059#1089#1083#1086#1074#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1086' '#1087#1086' '#1085#1086#1074#1086#1084#1091' '#1089#1088#1086#1082#1091
      DisplayWidth = 30
      FieldName = 'NEW_SUMMA'
    end
    object odsSetGoodsChargeDATE_BEGIN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      FieldName = 'DATE_BEGIN'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargeDATE_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      FieldName = 'DATE_END'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargeDATE_END_NEW: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103
      FieldName = 'DATE_END_NEW'
      ReadOnly = True
      Visible = False
    end
    object odsSetGoodsChargePROLONG_ID: TFloatField
      FieldName = 'PROLONG_ID'
    end
    object odsSetGoodsChargeROWNUM: TFloatField
      FieldName = 'ROWNUM'
      ReadOnly = True
      Visible = False
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
          'g_id);'
        '  end if;'
        'end;')
    end
    object sqlGetExportDate: TsqlOp
      SQL.Strings = (
        'begin'
        '   select to_char(export_date,'#39'dd.mm.yyyy'#39') into :pDate '
        '   from fdc_custom_decl_temp_adm_lst'
        '   where id = :pDeclId;'
        'end;')
    end
    object sqlSetExportDate: TsqlOp
      SQL.Strings = (
        'begin'
        '   update fdc_custom_decl '
        '     set export_date = :pDate '
        '     where id = :pDeclId;'
        'end;')
    end
    object sqlGetMaxSumma: TsqlOp
      SQL.Strings = (
        'begin'
        
          ' select sum(case when :pdateend  >= c.date_begin and :pdateend  ' +
          '<= c.date_end then'
        '               -c.summa'
        '           else'
        '                c.summa '
        '           end) as summa '
        ' into :pSum    '
        '  from fdc_decl_goods_lst g, fdc_goods_charge_hist_lst c'
        ' where g.decl_id          = :pDeclId'
        '   and c.decl_goods_id(+) = g.ID'
        
          '   and c.mode_id = p_nsi_dict.GetIDByCode('#39'CustomMode'#39','#39'53'#39',c.da' +
          'te_begin)'
        '   and pay_type_id = :pPayTypeId'
        '   and pay_mode_code = '#39#1059#1056#39
        '   and (   :pdatebegin between c.date_begin and c.date_end'
        '        or :pdateend   between c.date_begin and c.date_end);'
        'end; ')
    end
    object sqlGetPeriodPrologn: TsqlOp
      SQL.Strings = (
        'begin'
        '  select p.date_begin,p.date_end,p.id'
        '  into :date_begin,:date_end,:prolong_id '
        '  from fdc_decl_period_prolong p'
        '  where p.id = (select max(id) '
        '                from fdc_decl_period_prolong'
        '                where decl_id = :pDeclId);'
        'end;')
    end
    object sqlSetPeriodPrologn: TsqlOp
      SQL.Strings = (
        'begin'
        
          '   insert into fdc_decl_period_prolong(id,date_begin,date_end,de' +
          'cl_id)'
        
          '   values (FDC_DECL_PERIOD_PROLONG_KEY_SQ.NEXTVAL,:date_begin,:d' +
          'ate_end,:decl_id)'
        '   returning id into :prolong_id;'
        'end;')
    end
    object sqlSetTaxExemtion: TsqlOp
      SQL.Strings = (
        'begin'
        '  update fdc_custom_decl_temp t'
        '     set t.tax_exemption = 0'
        '  where id = :ID'
        '    and tax_exemption <> 0;'
        'end;')
    end
  end
  object odsGetPeriodProlong: TOracleDataSet
    SQL.Strings = (
      'select id, date_begin, date_end, decl_id'
      '  from fdc_decl_period_prolong'
      '  where decl_id = :pdeclid'
      '  order by date_begin,date_end')
    Variables.Data = {
      0300000001000000080000003A504445434C4944030000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000004000000070000004445434C5F49440100000000000A000000444154
      455F424547494E01000000000008000000444154455F454E4401000000000002
      0000004944010000000000}
    Session = MainData.Session
    Left = 272
    Top = 184
    object odsGetPeriodProlongID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetPeriodProlongDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object odsGetPeriodProlongDATE_BEGIN: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1087#1083#1072#1090#1099
      FieldName = 'DATE_BEGIN'
    end
    object odsGetPeriodProlongDATE_END: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1087#1083#1072#1090#1099
      FieldName = 'DATE_END'
    end
  end
  object dsGetPeriodProlong: TDataSource
    DataSet = odsGetPeriodProlong
    Left = 272
    Top = 224
  end
  object GridPopupMenu: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <
      item
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
      end>
    AlwaysFireOnPopup = True
    Left = 360
    Top = 83
  end
end
