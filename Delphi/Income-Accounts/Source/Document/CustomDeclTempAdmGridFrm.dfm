inherited CustomDeclTempAdmGridForm: TCustomDeclTempAdmGridForm
  Left = 254
  Top = 336
  Height = 462
  HelpContext = 49
  Caption = #1044#1058' '#1074' '#1088#1077#1078#1080#1084#1077' "'#1074#1088#1077#1084#1077#1085#1085#1099#1081' '#1074#1074#1086#1079'"'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 399
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Height = 19
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      inherited ProgressBar: TcxProgressBar
        Height = 18
      end
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 396
  end
  inherited pnlWorkspace: TPanel
    Height = 368
    inherited splSearchCriteria: TSplitter
      Height = 368
    end
    inherited pnlSearchCriteria: TPanel
      Height = 368
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 348
        inherited btnSearch: TcxButton
          Left = 100
          Top = 370
        end
        inherited edtName: TcxTextEdit
          Width = 113
        end
        inherited edtINN: TcxTextEdit
          Width = 113
        end
        inherited edtKPP: TcxTextEdit
          Width = 113
        end
        inherited edtCustomsCode: TcxTextEdit
          Width = 113
        end
        inherited edtFrom: TcxDateEdit
          Width = 113
        end
        inherited edtTo: TcxDateEdit
          Width = 113
        end
        inherited edtNo: TcxTextEdit
          Width = 113
        end
        inherited edtGoodsCode: TcxMaskEdit
          Width = 69
        end
        inherited edtGoodsPref: TcxTextEdit
          Width = 69
        end
        inherited btnSearchClear: TcxButton
          Left = 100
          Top = 341
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 368
      inherited grdData: TcxGrid
        Height = 368
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSTATE_ID
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewOPERATION_DATE
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 49
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Width = 36
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Width = 77
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Width = 34
          end
          inherited grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn [17]
            Width = 56
          end
          inherited grdDataDBBandedTableViewCUSTOM_MODE_CODE: TcxGridDBBandedColumn [18]
          end
          inherited grdDataDBBandedTableViewDECL_MODE: TcxGridDBBandedColumn [19]
          end
          inherited grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn [20]
          end
          inherited grdDataDBBandedTableViewAS_BIG_PAYER: TcxGridDBBandedColumn [21]
          end
          inherited grdDataDBBandedTableViewG0131_CODE: TcxGridDBBandedColumn [22]
          end
          inherited grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn [23]
          end
          inherited grdDataDBBandedTableViewGD1: TcxGridDBBandedColumn [24]
            Position.ColIndex = 24
          end
          inherited colIsClosed: TcxGridDBBandedColumn [25]
            Position.ColIndex = 25
          end
          object grdDataDBBandedTableViewEXPORT_DATE: TcxGridDBBandedColumn [26]
            Caption = #1044#1072#1090#1072' '#1074#1099#1074#1086#1079#1072
            DataBinding.FieldName = 'EXPORT_DATE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED_MONTHS: TcxGridDBBandedColumn [27]
            Caption = #1063#1080#1089#1083#1086' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
            DataBinding.FieldName = 'REALLY_PAYED_MONTHS'
            Width = 186
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLAST_PAYED_MONTH: TcxGridDBBandedColumn [28]
            Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1087#1086
            DataBinding.FieldName = 'LAST_PAYED_MONTH_STRING'
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object colProcedure: TcxGridDBBandedColumn [29]
            DataBinding.FieldName = 'G37'
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn [30]
            DataBinding.FieldName = 'IS_CLOSED'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          inherited columnIS_ARCHIVE: TcxGridDBBandedColumn [31]
            Position.ColIndex = 31
          end
          object colIS_ACTIVE: TcxGridDBBandedColumn [32]
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn [33]
            Position.ColIndex = 33
          end
          inherited grdDataDBBandedTableViewDECISION_DATE: TcxGridDBBandedColumn [34]
            Position.ColIndex = 40
          end
          object grdDataDBBandedTableViewTAX_EXEMPTION_STRING: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TAX_EXEMPTION_STRING'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_PROLONG'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueUnchecked = '0'
            Position.BandIndex = 0
            Position.ColIndex = 38
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTODAY_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TODAY_SUMMA'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = True
      Visible = True
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmbxCustCode
            Visible = True
          end
          item
            Item = cmbxViewMode
            Visible = True
          end>
        Name = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      28
      0)
    inherited cmbxViewMode: TdxBarCombo
      Text = #1042#1088'. '#1074#1074#1086#1079' '#1085#1077' '#1079#1072#1074#1077#1088#1096#1077#1085
      Width = 130
      Items.Strings = (
        #1042#1089#1077
        #1042#1088'. '#1074#1074#1086#1079' '#1085#1077' '#1079#1072#1074#1077#1088#1096#1077#1085
        #1058#1086#1083#1100#1082#1086' '#1093#1086#1088#1086#1096#1080#1077
        #1058#1086#1083#1100#1082#1086' '#1089' '#1086#1096#1080#1073#1082#1072#1084#1080
        #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077
        #1047#1072#1082#1088#1099#1090#1099#1077
        #1055#1086#1083#1085#1086#1077' '#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077
        #1063#1072#1089#1090#1080#1095#1085#1086#1077' '#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077
        #1055#1088#1086#1076#1083#1077#1085#1080#1077' '#1089#1088#1086#1082#1072' '#1074#1099#1074#1086#1079#1072)
      ItemIndex = 1
    end
  end
  inherited dsData: TfdcQuery
    AutoCalcFields = False
    SQL.Strings = (
      'select /*+ FIRST_ROWS(500) */ a.*'
      '        ,fdc_decl_charge_get_summ_decl ( a.id ) charged'
      '        ,fdc_decl_ded_get_summ_decl( a.id )     payed'
      ''
      'from ('
      '      select '
      '             t.id'
      '            ,t.name'
      '            ,t.shortname'
      '            ,t.object_type_id'
      '            ,t.state_id'
      '            ,t.accesslevel'
      '            ,t.sysname'
      '            ,t.descript'
      '            ,t.owner_object_id'
      '            ,t.typename'
      '            ,t.typesysname'
      '            ,t.objectkindlist'
      '            ,t.activation_date'
      '            ,t.customs_code'
      '            ,t.reg_date'
      '            ,t.decl_no'
      '            ,t.modify_date'
      '            ,t.subject_id'
      '            ,t.g011'
      '            ,t.custom_mode_id'
      '            ,t.okpo'
      '            ,t.inn'
      '            ,t.g12'
      '            ,t.currency_id'
      '            ,t.g221'
      '            ,t.g444a'
      '            ,t.g444b'
      '            ,t.g447a'
      '            ,t.g447b'
      '            ,t.k115'
      '            ,t.g40'
      '            ,t.gd1'
      '            ,t.g0131'
      '            ,t.export_date'
      '            ,t.tax_exemption'
      '            ,t.payed_months'
      '            ,t.next_pay_month'
      '            ,t.decision_code'
      '            ,t.last_payed_month'
      '            ,t.decl_typesysname'
      '            ,t.decl_kpp'
      '            ,t.decl_inn'
      '            ,t.decl_name'
      '            ,t.curr_code'
      '            ,t.curr_name'
      '            ,t.custom_mode_code'
      '            ,t.custom_mode_name'
      '            ,t.as_big_payer'
      '            ,t.g0131_code'
      '            ,t.g01321_name'
      '            ,t.err_count'
      '            ,t.debt_count'
      '            ,t.g37'
      '            ,t.really_payed_months'
      '            ,t.has_ded'
      '            ,t.operation_date'
      '            ,t.is_closed'
      '            ,t.NotPrivileges'
      '            ,t.AdvicePrivileges'
      '            ,t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      '            ,( SELECT sum(summa)'
      
        '                 FROM TABLE(fdc_get_periodic_by_month(CAST(t.id ' +
        'AS NUMBER),0))'
      
        '                WHERE month <= trunc(sysdate,'#39'MONTH'#39') ) today_su' +
        'mma'
      
        '        ,decode(t.tax_exemption, 1, '#39#1055#1086#1083#1085#1086#1077#39', '#39#1063#1072#1089#1090#1080#1095#1085#1086#1077#39') tax_e' +
        'xemption_string'
      
        '        ,INITCAP(TO_CHAR(t.last_payed_month, '#39'MONTH YYYY'#39', '#39'NLS_' +
        'DATE_LANGUAGE=RUSSIAN'#39')) last_payed_month_string'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'N'#39' ELSE t.is_active END ' +
        'is_active'
      '     ,t.is_corr'
      '     ,t.is_prolong'
      ' ,t.decision_date'
      '        from fdc_custom_decl_temp_adm_lst t'
      
        '--$s#viewmode#3*/,(select distinct x.owner_object_id from fdc_Cu' +
        'stom_decl_Error_lst x ) ed'
      '        where 1 = 1'
      '--$s#viewmode#3*/  and t.id = ed.owner_object_id'
      ''
      
        '--$s#viewmode#1*/  and (t.export_date >= sysdate or last_day(t.l' +
        'ast_payed_month) < t.export_date)'
      '--$s#viewmode#1*/  and t.really_payed_months < :MAX_MONTHS'
      ''
      
        '--$s#viewmode#2*/  and not exists( select 1 from fdc_Custom_decl' +
        '_Error_lst x where x.owner_object_id = t.id)'
      ''
      '--$s#viewmode#4*/  and ( SELECT sum(summa)'
      
        '--$s#viewmode#4*/          FROM TABLE(fdc_get_periodic_by_month(' +
        'CAST(t.id AS NUMBER),0))'
      
        '--$s#viewmode#4*/         WHERE month <= trunc(sysdate,'#39'MONTH'#39') ' +
        ') != 0'
      ''
      '/*  and  last_day( nvl( ( select max(t2.month)'
      
        '                       from TABLE(FDC_GET_PERIODIC_BY_MONTH(CAST' +
        '(t.id AS NUMBER),0)) t2'
      '                        where t2.is_payed = 2'
      
        '                               and t2.month > t.last_payed_month' +
        '), t.last_payed_month ) ) <'
      '                                 CASE'
      
        '                                   WHEN trunc(sysdate, '#39'MONTH'#39') ' +
        '< t.export_date THEN'
      '                                     trunc(sysdate, '#39'MONTH'#39')'
      '                                   ELSE t.export_date'
      '                                 END'
      
        '                               and decode(t.next_pay_month,NULL ' +
        ',t.payed_months,ceil(months_between(t.next_pay_month, nvl(t.gd1,' +
        ' t.reg_date)))) != 34*/'
      ''
      '--$s#viewmode#5*/ and t.is_closed = 1'
      ''
      '--$s#viewmode#6*/  and t.tax_exemption = 1'
      ''
      '--$s#viewmode#7*/  and t.tax_exemption = 0'
      ''
      '--$s#viewmode#8*/  AND EXISTS ( SELECT 1'
      
        '--$s#viewmode#8*/                 FROM fdc_decl_period_prolong p' +
        'p'
      
        '--$s#viewmode#8*/                WHERE pp.decl_id = t.id )     -' +
        '- and t.is_prolong = 1'
      ''
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      
        '/*$p#cust_code#*/  AND :cust_code is not null and t.Customs_Code' +
        '=:cust_code'
      '/*$p#decl_no#*/    and t.decl_no like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      ''
      
        '         and 0 < :MAX_MONTHS  -- '#1095#1090#1086#1073#1099' '#1087#1072#1088#1072#1084#1077#1090#1088' MAX_MONTHS '#1074#1089#1077#1075#1076 +
        #1072' '#1073#1099#1083' '#1074' '#1079#1072#1087#1088#1086#1089#1077
      
        '--         and (:cust_code IS NULL OR t.Customs_Code like :cust_' +
        'code)'
      '--         and t.Customs_Code like NVL(:cust_code,'#39'%'#39')'
      '--         and t.Customs_Code >  '#39' '#39
      
        '         and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJE' +
        'CT_ID)'
      
        '         and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077 +
        ' '#1091#1073#1080#1088#1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      '         and rownum <= :MaxRecordCount'
      '       union all'
      '         select '
      '             t.id'
      '            ,t.name'
      '            ,t.shortname'
      '            ,t.object_type_id'
      '            ,t.state_id'
      '            ,t.accesslevel'
      '            ,t.sysname'
      '            ,t.descript'
      '            ,t.owner_object_id'
      '            ,t.typename'
      '            ,t.typesysname'
      '            ,t.objectkindlist'
      '            ,t.activation_date'
      '            ,t.customs_code'
      '            ,t.reg_date'
      '            ,t.decl_no'
      '            ,t.modify_date'
      '            ,t.subject_id'
      '            ,t.g011'
      '            ,t.custom_mode_id'
      '            ,t.okpo'
      '            ,t.inn'
      '            ,t.g12'
      '            ,t.currency_id'
      '            ,t.g221'
      '            ,t.g444a'
      '            ,t.g444b'
      '            ,t.g447a'
      '            ,t.g447b'
      '            ,t.k115'
      '            ,t.g40'
      '            ,t.gd1'
      '            ,t.g0131'
      '            ,t.export_date'
      '            ,t.tax_exemption'
      '            ,t.payed_months'
      '            ,t.next_pay_month'
      '            ,t.decision_code'
      '            ,t.last_payed_month'
      '            ,t.decl_typesysname'
      '            ,t.decl_kpp'
      '            ,t.decl_inn'
      '            ,t.decl_name'
      '            ,t.curr_code'
      '            ,t.curr_name'
      '            ,t.custom_mode_code'
      '            ,t.custom_mode_name'
      '            ,t.as_big_payer'
      '            ,t.g0131_code'
      '            ,t.g01321_name'
      '            ,t.err_count'
      '            ,t.debt_count'
      '            ,t.g37'
      '            ,t.really_payed_months'
      '            ,t.has_ded'
      '            ,t.operation_date'
      '            ,t.is_closed'
      '            ,t.NotPrivileges'
      '            ,t.AdvicePrivileges'
      '            ,t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      '            ,( SELECT sum(summa)'
      
        '                 FROM TABLE(fdc_get_periodic_by_month(CAST(t.id ' +
        'AS NUMBER),0))'
      
        '                WHERE month <= trunc(sysdate,'#39'MONTH'#39') ) today_su' +
        'mma'
      
        '        ,decode(t.tax_exemption, 1, '#39#1055#1086#1083#1085#1086#1077#39', '#39#1063#1072#1089#1090#1080#1095#1085#1086#1077#39') tax_e' +
        'xemption_string'
      
        '        ,INITCAP(TO_CHAR(t.last_payed_month, '#39'MONTH YYYY'#39', '#39'NLS_' +
        'DATE_LANGUAGE=RUSSIAN'#39')) last_payed_month_string'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'N'#39' ELSE t.is_active END ' +
        'is_active'
      '     ,t.is_corr'
      '     ,t.is_prolong'
      ' ,t.decision_date'
      '        from fdc_custom_decl_temp_adm_lst t'
      
        '--$s#viewmode#3*/,(select distinct x.owner_object_id from fdc_Cu' +
        'stom_decl_Error_lst x ) ed'
      '        where 1 = 1'
      '--$s#viewmode#3*/  and t.id = ed.owner_object_id'
      ''
      
        '--$s#viewmode#1*/  and (t.export_date >= sysdate or last_day(t.l' +
        'ast_payed_month) < t.export_date)'
      '--$s#viewmode#1*/  and t.really_payed_months < :MAX_MONTHS'
      ''
      
        '--$s#viewmode#2*/  and not exists( select 1 from fdc_Custom_decl' +
        '_Error_lst x where x.owner_object_id = t.id)'
      ''
      '--$s#viewmode#4*/  and ( SELECT sum(summa)'
      
        '--$s#viewmode#4*/          FROM TABLE(fdc_get_periodic_by_month(' +
        'CAST(t.id AS NUMBER),0))'
      
        '--$s#viewmode#4*/         WHERE month <= trunc(sysdate,'#39'MONTH'#39') ' +
        ') != 0'
      ''
      '/*  and  last_day( nvl( ( select max(t2.month)'
      
        '                       from TABLE(FDC_GET_PERIODIC_BY_MONTH(CAST' +
        '(t.id AS NUMBER),0)) t2'
      '                        where t2.is_payed = 2'
      
        '                               and t2.month > t.last_payed_month' +
        '), t.last_payed_month ) ) <'
      '                                 CASE'
      
        '                                   WHEN trunc(sysdate, '#39'MONTH'#39') ' +
        '< t.export_date THEN'
      '                                     trunc(sysdate, '#39'MONTH'#39')'
      '                                   ELSE t.export_date'
      '                                 END'
      
        '                               and decode(t.next_pay_month,NULL ' +
        ',t.payed_months,ceil(months_between(t.next_pay_month, nvl(t.gd1,' +
        ' t.reg_date)))) != 34*/'
      ''
      '--$s#viewmode#5*/ and t.is_closed = 1'
      ''
      '--$s#viewmode#6*/  and t.tax_exemption = 1'
      ''
      '--$s#viewmode#7*/  and t.tax_exemption = 0'
      ''
      '--$s#viewmode#8*/  AND EXISTS ( SELECT 1'
      
        '--$s#viewmode#8*/                 FROM fdc_decl_period_prolong p' +
        'p'
      
        '--$s#viewmode#8*/                WHERE pp.decl_id = t.id )     -' +
        '- and t.is_prolong = 1'
      ''
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      '/*$p#cust_code#*/  AND :cust_code is null'
      '/*$p#decl_no#*/    and t.decl_no like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      ''
      
        '         and 0 < :MAX_MONTHS  -- '#1095#1090#1086#1073#1099' '#1087#1072#1088#1072#1084#1077#1090#1088' MAX_MONTHS '#1074#1089#1077#1075#1076 +
        #1072' '#1073#1099#1083' '#1074' '#1079#1072#1087#1088#1086#1089#1077
      
        '--         and (:cust_code IS NULL OR t.Customs_Code like :cust_' +
        'code)'
      '--         and t.Customs_Code like NVL(:cust_code,'#39'%'#39')'
      '--         and t.Customs_Code >  '#39' '#39
      
        '         and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJE' +
        'CT_ID)'
      
        '         and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077 +
        ' '#1091#1073#1080#1088#1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      '         and rownum <= :MaxRecordCount'
      ') a'
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MAX_MONTHS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_pref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MAX_MONTHS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MAX_MONTHS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'from_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'to_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'g_pref'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MAX_MONTHS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cust_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Subj_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataEXPORT_DATE: TDateTimeField
      FieldName = 'EXPORT_DATE'
    end
    object dsDataPAYED_MONTHS: TIntegerField
      FieldName = 'PAYED_MONTHS'
    end
    object dsDataTAX_EXEMPTION: TIntegerField
      FieldName = 'TAX_EXEMPTION'
    end
    object dsDataTAX_EXEMPTION_STRING: TStringField
      DisplayLabel = #1054#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077' '#1086#1090' '#1091#1087#1083#1072#1090#1099
      FieldName = 'TAX_EXEMPTION_STRING'
      Size = 9
    end
    object dsDataLAST_PAYED_MONTH: TDateTimeField
      FieldName = 'LAST_PAYED_MONTH'
    end
    object dsDataLAST_PAYED_MONTH_STRING: TStringField
      FieldName = 'LAST_PAYED_MONTH_STRING'
      Size = 13
    end
    object dsDataREALLY_PAYED_MONTHS: TFloatField
      FieldName = 'REALLY_PAYED_MONTHS'
    end
    object dsDataG37: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072
      DisplayWidth = 10
      FieldName = 'G37'
      Size = 4000
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_PROLONG: TIntegerField
      DisplayLabel = #1055#1088#1086#1076#1083#1077#1085#1080#1077
      FieldName = 'IS_PROLONG'
    end
    object dsDataTODAY_SUMMA: TFloatField
      FieldName = 'TODAY_SUMMA'
    end
  end
  object QL: TQueryList
    Session = MainData.Session
    Left = 320
    Top = 96
    object sqlGetMaxMonths: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  :result := ceil(100 / fdc_valuenumber_sys_get(pSysName => '#39'Tem' +
          'pAdmPercent'#39'));'
        'end;')
    end
  end
end
