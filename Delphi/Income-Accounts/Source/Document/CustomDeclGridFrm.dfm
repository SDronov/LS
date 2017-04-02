inherited CustomDeclGridForm: TCustomDeclGridForm
  Left = 361
  Top = 312
  Width = 1109
  Height = 570
  Caption = #1057#1087#1080#1089#1086#1082' '#1044#1058
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 507
    Width = 1093
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 790
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 790
      end
      inherited pnlProgress: TPanel
        Width = 790
        inherited lblProgress: TcxLabel
          Width = 790
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 1000
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 504
    Width = 1093
  end
  inherited pnlWorkspace: TPanel
    Width = 1093
    Height = 476
    inherited splSearchCriteria: TSplitter
      Height = 476
    end
    inherited pnlSearchCriteria: TPanel
      Height = 476
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 456
        inherited btnSearch: TcxButton
          Top = 425
        end
        inherited edtName: TcxTextEdit
          Width = 111
        end
        inherited edtINN: TcxTextEdit
          Width = 111
        end
        inherited edtKPP: TcxTextEdit
          Width = 111
        end
        inherited edtCustomsCode: TcxTextEdit
          Width = 111
        end
        inherited edtFrom: TcxDateEdit
          Width = 111
        end
        inherited edtTo: TcxDateEdit
          Width = 111
        end
        inherited edtNo: TcxTextEdit
          Width = 111
        end
        inherited edtGoodsCode: TcxMaskEdit
          Width = 69
        end
        inherited edtGoodsPref: TcxTextEdit
          Width = 69
        end
        inherited btnSearchClear: TcxButton
          Top = 396
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1044#1058
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 888
      Height = 476
      inherited grdData: TcxGrid
        Width = 888
        Height = 476
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewColumn1
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewColumn3
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn [5]
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'charged'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn [6]
            Caption = #1054#1087#1083#1072#1095#1077#1085#1086
            DataBinding.FieldName = 'payed'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 114
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Position.ColIndex = 23
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Width = 86
            Position.ColIndex = 17
          end
          inherited colERR_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 18
          end
          inherited grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewREG_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewDECL_NO: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          inherited grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 24
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOM_MODE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOM_MODE_CODE'
            Width = 73
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_MODE: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1044#1058
            DataBinding.FieldName = 'DECL_MODE'
            Width = 86
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERR_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAS_BIG_PAYER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AS_BIG_PAYER'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewG0131_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'G0131_CODE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJKINDLABEL'
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewGD1: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
            DataBinding.FieldName = 'GD1'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECISION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1088#1077#1096#1077#1085#1080#1103
            DataBinding.FieldName = 'DECISION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object colIsClosed: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_CLOSED'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object columnIS_ARCHIVE: TcxGridDBBandedColumn
            Caption = #1040#1088#1093#1080#1074#1085#1099#1081
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_CORR: TcxGridDBBandedColumn
            Caption = #1055#1088'. '#1050#1086#1088#1088#1077#1082#1090'.'
            DataBinding.FieldName = 'IS_CORR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ReadOnly = True
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNotPrivileges: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NotPrivileges'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueGrayed = '2'
            Properties.ValueUnchecked = '0'
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAdvicePrivileges: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AdvicePrivileges'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueGrayed = 2
            Properties.ValueUnchecked = 0
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
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
            Item = btnCorrect
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 92
            Visible = True
          end>
        Name = 'barTools'
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
      Items.Strings = (
        #1042#1089#1077
        #1041#1077#1079' '#1086#1096#1080#1073#1086#1082
        #1057' '#1086#1096#1080#1073#1082#1072#1084#1080
        #1057' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100#1102
        #1053#1077#1086#1087#1083#1072#1095#1077#1085#1085#1099#1077
        #1041#1077#1079' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1082#1086#1085#1090#1088#1086#1083#1103
        #1047#1072#1082#1088#1099#1090#1099#1077' '#1042#1055#1044
        #1050#1053#1055
        #1053#1077#1087#1088'. '#1087#1088#1080#1084#1077#1085#1077#1085#1072' '#1083#1100#1075#1086#1090#1072
        #1042#1099#1103#1074#1083#1077#1085#1086' '#1087#1088#1072#1074#1086' '#1085#1072' '#1083#1100#1075#1086#1090#1091
        #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1042#1055#1044)
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        '--$s#enable_order#Y*/ select /*+ FIRST_ROWS  INDEX_DESC(fdc_cust' +
        'om_decl, FDC_CUSTOM_DECL_AK) */ * from ('
      '      select /*+ FIRST_ROWS(500)*/'
      't.id'
      ',t.name'
      ',t.shortname'
      ',t.object_type_id'
      ',t.state_id'
      ',t.accesslevel'
      ',t.sysname'
      ',t.descript'
      ',t.owner_object_id'
      ',t.typename'
      ',t.typesysname'
      ',t.objectkindlist'
      ',t.decl_inn'
      ',t.decl_name'
      ',t.decl_kpp'
      ',t.err_count'
      ',t.customs_code'
      ',t.reg_date'
      ',t.decl_no'
      ',t.debt_count'
      '--,t.OBJKINDLABEL'
      ',t.operation_date'
      ',t.g011'
      ',t.curr_code'
      ',t.custom_mode_code'
      ',t.as_big_payer'
      ',t.g0131_code'
      ',decision_date'
      ',t.gd1'
      ',t.is_closed'
      ',t.NotPrivileges'
      ',t.AdvicePrivileges'
      ',t.is_corr'
      ',t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      ',fdc_decl_charge_get_summ_decl ( t.id ) charged'
      ',fdc_decl_ded_get_summ_decl( t.id )     payed'
      ',CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archive'
      
        ',CASE WHEN t.is_active = '#39'A'#39' THEN '#39'N'#39' ELSE t.is_active END is_ac' +
        'tive'
      'FROM fdc_Custom_Decl_Lst t'
      'WHERE 1 = 1'
      
        '--$s#viewmode#2*/  and EXISTS (select 1 from fdc_Custom_decl_Err' +
        'or_lst x where t.id = x.owner_object_id )'
      
        '--$s#viewmode#1*/  and not exists( select 1 from fdc_Custom_decl' +
        '_Error_lst x where x.owner_object_id = t.id)'
      
        '--$s#viewmode#3*/  and exists (select 1 from fdc_noticepay_charg' +
        'e_lst x where x.decl_id = t.id and x.summa - x.payed > 0)'
      ''
      
        '--$s#viewmode#4*/  and not exists( select 1 from fdc_kind_lst r ' +
        'where r.owner_Object_ID = t.id and r.sysname = '#39'BigPayer'#39' )'
      ''
      '--t.as_big_payer <> 1'
      ''
      
        '--$s#viewmode#4*/  and exists (select 0 from fdc_decl_charge_lst' +
        ' dc1 WHERE dc1.decl_id = t.id AND dc1.charge_rest > 0 )'
      
        '--$s#viewmode#4*/  and fdc_decl_charge_get_summ_decl ( t.id ) !=' +
        '  fdc_decl_ded_get_summ_decl( t.id )'
      ''
      '--$s#viewmode#5*/  and not exists (select 1 from dbf_dk1 dk1'
      
        '--$s#viewmode#5*/    where dk1.g071 = t.customs_code and dk1.g07' +
        '2 = t.reg_date and dk1.g073 = t.decl_no)'
      '--$s#viewmode#5*/  and not exists (select 1 from dbf_dk_pp dkp'
      
        '--$s#viewmode#5*/    where dkp.g071 = t.customs_code and dkp.g07' +
        '2 = t.reg_date and dkp.g073 = t.decl_no)'
      '--$s#viewmode#5*/  and not exists (select 1 from dbf_dkisch dki'
      
        '--$s#viewmode#5*/    where dki.g071 = t.customs_code and dki.g07' +
        '2 = t.reg_date and dki.g073 = t.decl_no)'
      '--$s#viewmode#5*/  and not exists (select 1 from dbf_dkkupl dku'
      
        '--$s#viewmode#5*/    where dku.g071 = t.customs_code and dku.g07' +
        '2 = t.reg_date and dku.g073 = t.decl_no)'
      ''
      
        '--$s#viewmode#6*/ and exists( select 1 from fdc_obj_kind_lst r w' +
        'here r.Object_ID = t.id and r.kind_sysname = '#39'decl.close'#39' and r.' +
        'DATE_CANCEL is null )'
      ''
      '--and t.is_closed = 1'
      ''
      
        '--$s#viewmode#7*/ and exists( select 1 from fdc_kind_lst r where' +
        ' r.owner_Object_ID = t.id and r.sysname = '#39'BigPayer'#39' )'
      ''
      '--and t.as_big_payer = 1'
      ''
      
        '--$s#viewmode#8*/ and exists( select 1 from fdc_obj_kind_lst r w' +
        'here r.Object_ID = t.id and r.kind_sysname = '#39'Kind.NotPrivileges' +
        #39' and r.DATE_CANCEL is null )'
      ''
      '--and t.NotPrivileges = 1'
      ''
      
        '--$s#viewmode#9*/ and exists( select 1 from fdc_obj_kind_lst r w' +
        'here r.Object_ID = t.id and r.kind_sysname = '#39'Kind.AdvicePrivile' +
        'ges'#39' and r.DATE_CANCEL is null )'
      ''
      '--t.AdvicePrivileges = 1'
      ''
      
        '--$s#viewmode#10*/ and t.object_type_id = (SELECT id from fdc_ob' +
        'ject_type_lst where sysname = '#39'CustomDeclTime'#39' )'
      
        '--$s#viewmode#10*/ and not exists( select 1 from fdc_obj_kind_ls' +
        't r where r.Object_ID = t.id and r.kind_sysname = '#39'decl.close'#39' a' +
        'nd r.DATE_CANCEL is null )'
      ''
      '--and t.typesysname = '#39'CustomDeclTime'#39
      
        '--and and not exists( select 1 from fdc_obj_kind_lst r where r.O' +
        'bject_ID = t.id and r.kind_sysname = '#39'decl.close'#39' and r.DATE_CAN' +
        'CEL is null ) -- t.is_closed = 0'
      ''
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      
        '/*$  p#cust_code#*/  AND (:cust_code is null or t.Customs_Code=:' +
        'cust_code)'
      '/*$p#decl_no#*/    and t.decl_no like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#g_code#*/ and exists (select 1 from fdc_decl_goods_lst x wh' +
        'ere x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select 1 from fdc_decl_goods_lst x wh' +
        'ere x.decl_id = t.id and x.g36 like :g_pref)'
      
        '    AND (:GL_SUBJECT_ID IS NULL OR :GL_SUBJECT_ID = t.SUBJECT_ID' +
        ')'
      '    and t.Customs_Code > '#39' '#39
      
        '    and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088 +
        #1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      '--$s#enable_order#N*/ AND rownum <= :MaxRecordCount'
      
        '--$s#enable_order#Y*/  order by t.Customs_Code desc, t.Reg_Date ' +
        'desc, t.Decl_No desc'
      ''
      '--$s#enable_order#Y*/ ) where rownum <= :MaxRecordCount')
    BeforeRefresh = dsDataBeforeOpen
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
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
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataG011: TStringField
      FieldName = 'G011'
      Size = 2
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCUSTOM_MODE_CODE: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072
      FieldName = 'CUSTOM_MODE_CODE'
      Size = 15
    end
    object dsDataAS_BIG_PAYER: TFloatField
      FieldName = 'AS_BIG_PAYER'
    end
    object dsDataG0131_CODE: TStringField
      DisplayLabel = #1044#1086#1087'. '#1087#1088#1080#1079#1085#1072#1082
      FieldName = 'G0131_CODE'
      Size = 150
    end
    object dsDataDECL_MODE: TStringField
      DisplayLabel = #1058#1080#1087' '#1043#1058#1044
      FieldName = 'DECL_MODE'
      Size = 150
    end
    object dsDatacharged: TFloatField
      FieldName = 'charged'
    end
    object dsDatapayed: TFloatField
      FieldName = 'payed'
    end
    object dsDataGD1: TDateTimeField
      FieldName = 'GD1'
      Visible = False
    end
    object dsDataDECISION_DATE: TDateTimeField
      FieldName = 'DECISION_DATE'
    end
    object dsDataIS_CLOSED: TFloatField
      FieldName = 'IS_CLOSED'
    end
    object dsDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      ReadOnly = True
      Size = 1
    end
    object dsDataIS_CORR: TStringField
      FieldName = 'IS_CORR'
      Size = 1
    end
    object dsDataNotPrivileges: TIntegerField
      DisplayLabel = #1053#1077#1090' '#1083#1100#1075#1086#1090#1099
      FieldName = 'NotPrivileges'
    end
    object dsDataAdvicePrivileges: TIntegerField
      DisplayLabel = #1042#1099#1103#1074#1083#1077#1085#1086' '#1087#1088#1072#1074#1086' '#1085#1072' '#1083#1100#1075#1086#1090#1091
      FieldName = 'AdvicePrivileges'
    end
  end
end
