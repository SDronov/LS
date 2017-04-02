inherited TPOGridForm: TTPOGridForm
  Left = 423
  Top = 406
  Width = 809
  Height = 477
  HelpContext = 432
  Caption = #1057#1087#1080#1089#1086#1082' '#1058#1055#1054
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 417
    Width = 793
    Height = 22
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 20
      inherited lblRecordCount: TcxLabel
        Height = 20
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 20
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 490
      Height = 20
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 490
        Height = 20
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 20
        end
      end
      inherited pnlProgress: TPanel
        Width = 490
        Height = 20
        inherited lblProgress: TcxLabel
          Height = 20
          Width = 490
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 700
      Height = 20
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 414
    Width = 793
  end
  inherited pnlWorkspace: TPanel
    Width = 793
    Height = 386
    inherited splSearchCriteria: TSplitter
      Height = 386
    end
    inherited pnlSearchCriteria: TPanel
      Height = 386
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 366
        inherited btnSearch: TcxButton
          Left = 100
          Top = 363
        end
        inherited edtName: TcxTextEdit
          Top = 175
          Width = 183
        end
        inherited edtINN: TcxTextEdit
          Top = 193
          Width = 111
        end
        inherited edtKPP: TcxTextEdit
          Top = 211
          Width = 111
        end
        inherited edtCustomsCode: TcxTextEdit
          Top = 53
          Width = 111
        end
        inherited edtFrom: TcxDateEdit
          Top = 71
          Width = 111
        end
        inherited edtTo: TcxDateEdit
          Top = 89
          Width = 111
        end
        inherited edtNo: TcxTextEdit
          Top = 107
          Width = 111
        end
        inherited edtGoodsCode: TcxMaskEdit
          Top = 279
          Width = 102
        end
        inherited edtGoodsPref: TcxTextEdit
          Top = 297
          Width = 102
        end
        inherited edtDocType: TcxMaskEdit
          Top = 35
          Width = 76
        end
        inherited btnSearchClear: TcxButton
          Left = 100
          Top = 334
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1058#1055#1054
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 588
      Height = 386
      inherited grdData: TcxGrid
        Width = 588
        Height = 386
        inherited grdDataDBTableView: TcxGridDBTableView
          object grdDataDBTableViewID1: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
          end
          object grdDataDBTableViewNAME1: TcxGridDBColumn
            DataBinding.FieldName = 'NAME'
          end
          object grdDataDBTableViewSHORTNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SHORTNAME'
          end
          object grdDataDBTableViewOBJECT_TYPE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
          end
          object grdDataDBTableViewSTATE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'STATE_ID'
          end
          object grdDataDBTableViewACCESSLEVEL: TcxGridDBColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
          end
          object grdDataDBTableViewSYSNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SYSNAME'
          end
          object grdDataDBTableViewDESCRIPT1: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPT'
          end
          object grdDataDBTableViewOWNER_OBJECT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
          end
          object grdDataDBTableViewTYPENAME1: TcxGridDBColumn
            DataBinding.FieldName = 'TYPENAME'
          end
          object grdDataDBTableViewTYPESYSNAME1: TcxGridDBColumn
            DataBinding.FieldName = 'TYPESYSNAME'
          end
          object grdDataDBTableViewMODIFY_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'MODIFY_DATE'
          end
          object grdDataDBTableViewG011: TcxGridDBColumn
            DataBinding.FieldName = 'G011'
          end
          object grdDataDBTableViewCUSTOM_MODE_ID: TcxGridDBColumn
            DataBinding.FieldName = 'CUSTOM_MODE_ID'
          end
          object grdDataDBTableViewOKPO: TcxGridDBColumn
            DataBinding.FieldName = 'OKPO'
          end
          object grdDataDBTableViewINN: TcxGridDBColumn
            DataBinding.FieldName = 'INN'
          end
          object grdDataDBTableViewG12: TcxGridDBColumn
            DataBinding.FieldName = 'G12'
          end
          object grdDataDBTableViewCURRENCY_ID: TcxGridDBColumn
            DataBinding.FieldName = 'CURRENCY_ID'
          end
          object grdDataDBTableViewG444A: TcxGridDBColumn
            DataBinding.FieldName = 'G444A'
          end
          object grdDataDBTableViewG444B: TcxGridDBColumn
            DataBinding.FieldName = 'G444B'
          end
          object grdDataDBTableViewG447A: TcxGridDBColumn
            DataBinding.FieldName = 'G447A'
          end
          object grdDataDBTableViewG447B: TcxGridDBColumn
            DataBinding.FieldName = 'G447B'
          end
          object grdDataDBTableViewK115: TcxGridDBColumn
            DataBinding.FieldName = 'K115'
          end
          object grdDataDBTableViewG40: TcxGridDBColumn
            DataBinding.FieldName = 'G40'
          end
          object grdDataDBTableViewSUBJECT_ID: TcxGridDBColumn
            DataBinding.FieldName = 'SUBJECT_ID'
          end
          object grdDataDBTableViewG221: TcxGridDBColumn
            DataBinding.FieldName = 'G221'
          end
          object grdDataDBTableViewCUSTOMS_CODE: TcxGridDBColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
          end
          object grdDataDBTableViewREG_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'REG_DATE'
          end
          object grdDataDBTableViewDECL_NO: TcxGridDBColumn
            DataBinding.FieldName = 'DECL_NO'
          end
          object grdDataDBTableViewACT_NO: TcxGridDBColumn
            DataBinding.FieldName = 'ACT_NO'
          end
          object grdDataDBTableViewGD1: TcxGridDBColumn
            DataBinding.FieldName = 'GD1'
          end
          object grdDataDBTableViewEXPORT_DATE: TcxGridDBColumn
            DataBinding.FieldName = 'EXPORT_DATE'
          end
          object grdDataDBTableViewTAX_EXEMPTION: TcxGridDBColumn
            DataBinding.FieldName = 'TAX_EXEMPTION'
          end
          object grdDataDBTableViewPAYED_MONTHS: TcxGridDBColumn
            DataBinding.FieldName = 'PAYED_MONTHS'
          end
          object grdDataDBTableViewNEXT_PAY_MONTH: TcxGridDBColumn
            DataBinding.FieldName = 'NEXT_PAY_MONTH'
          end
        end
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUM_RUB
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewCHARGED
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPAYED
            end>
          inherited grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.Nullable = True
          end
          object grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn [6]
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'CHARGED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn [7]
            Caption = #1054#1087#1083#1072#1095#1077#1085#1086
            DataBinding.FieldName = 'PAYED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Width = 50
            Position.ColIndex = 15
          end
          inherited grdDataDBBandedTableViewNUM_MPO: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewORDER_TYPE: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          inherited colERR_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 16
          end
          inherited grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 17
          end
          inherited grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn
            Position.ColIndex = 18
          end
          inherited grdDataDBBandedTableViewREGIM: TcxGridDBBandedColumn
            Position.ColIndex = 21
          end
          inherited grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            Position.ColIndex = 22
          end
          inherited grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 32
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1040#1085#1085#1091#1083#1080#1088'./ '#1055#1086#1075#1072#1096#1077#1085'.'
            DataBinding.FieldName = 'ANNUL_NAME'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085
              #1055#1086#1075#1072#1096#1077#1085
              #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086)
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1072#1085#1085#1091#1083'./ '#1087#1086#1075#1072#1096'.'
            DataBinding.FieldName = 'ANNUL_DATE'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1076#1077#1085#1080#1103
            DataBinding.FieldName = 'DATE_CREATED'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object colIN_WAIT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IN_WAIT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAS_BIG_PAYER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AS_BIG_PAYER'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object colCarrier_Name: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'CARRIER_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object colCarrier_INN: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1048#1053#1053
            DataBinding.FieldName = 'CARRIER_INN'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object colCarrier_KPP: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1050#1055#1055
            DataBinding.FieldName = 'CARRIER_KPP'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object columnIsActive: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object columnActivationDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object colAnnulReason: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ANNUL_REASON'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewERR_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ERR_COUNT'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Position.BandIndex = 0
            Position.ColIndex = 36
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
    inherited cmbxCustCode: TdxBarCombo
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1058#1055#1054' '#1090#1086#1083#1100#1082#1086' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084' '#1082#1086#1076#1086#1084' '#1090#1072#1084#1086#1078#1085#1080
    end
    inherited cmbxViewMode: TdxBarCombo
      Items.Strings = (
        #1042#1089#1077
        #1041#1077#1079' '#1086#1096#1080#1073#1086#1082
        #1057' '#1086#1096#1080#1073#1082#1072#1084#1080
        #1057' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100#1102
        #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085
        #1055#1086#1075#1072#1096#1077#1085
        #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086
        #1042' '#1086#1078#1080#1076#1072#1085#1080#1080' '#1086#1087#1083#1072#1090#1099)
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 80
    Top = 67
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select /*+ FIRST_ROWS(500)*/ a.*'
      '         ,p_doc_charge.GetDocChargeSum( a.id ) charged'
      '         ,p_doc_charge.GetDocDeductionSum( a.id ) payed'
      'from ('
      '      select  t.*'
      '          ,CASE '
      '             WHEN t.blank_version = 1 THEN'
      '               t.regim||'#39'/'#39'||t.meth_move||'#39'/'#39'||t.vid_trans  '
      '             ELSE'
      '               t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth_move  '
      '           END AS doc_type'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39','#39#1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#39',decode(t.' +
        'StateSysName,'#39'PayOff'#39','#39#1055#1086#1075#1072#1096#1077#1085#39',decode(t.payoff_date,null,null,'#39 +
        #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086#39'))) annul_name'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39',t.ann_date,t.payoff_dat' +
        'e) annul_date'
      
        '          ,nvl((select 1 from dual where t.err_count=0 and t.err' +
        'pay_count=1 and t.debt_count=0),0) in_wait'
      
        '         ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_a' +
        'rchive'
      '        from fdc_tpo_lst t'
      '       where t.Customs_Code > '#39' '#39
      ''
      '--$s#viewmode#2*/   AND EXISTS ( SELECT 1'
      
        '--$s#viewmode#2*/                  FROM fdc_custom_decl_error x_' +
        ', fdc_object o_, fdc_object_type ot_'
      
        '--$s#viewmode#2*/                 WHERE o_.owner_object_id = t.i' +
        'd'
      '--$s#viewmode#2*/                       AND x_.id = o_.id'
      
        '--$s#viewmode#2*/                       AND o_.object_type_id = ' +
        'ot_.id'
      
        '--$s#viewmode#2*/                       AND ( ot_.sysname NOT IN' +
        ' ( '#39'BadPayOrderError'#39', '#39'BadPayOrderErrorTPO'#39','
      
        '--$s#viewmode#2*/                                               ' +
        '   '#39'BadPayOrderErrorTPONotFound'#39','
      
        '--$s#viewmode#2*/                                               ' +
        '   '#39'BadPayOrderErrorTPONotFullPayed'#39' )'
      
        '--$s#viewmode#2*/                             OR t.reg_date < p_' +
        'dateutils.AddWorkDays( TRUNC( SYSDATE, '#39'DD'#39' ), -5 ) ) )'
      ''
      '--$s#viewmode#1*/   AND NOT EXISTS ( SELECT 1'
      
        '--$s#viewmode#1*/                      FROM fdc_custom_decl_erro' +
        'r x_, fdc_object o_, fdc_object_type ot_'
      
        '--$s#viewmode#1*/                     WHERE o_.owner_object_id =' +
        ' t.id'
      '--$s#viewmode#1*/                           AND x_.id = o_.id'
      
        '--$s#viewmode#1*/                           AND o_.object_type_i' +
        'd = ot_.id'
      
        '--$s#viewmode#1*/                           AND ( ot_.sysname NO' +
        'T IN ( '#39'BadPayOrderError'#39', '#39'BadPayOrderErrorTPO'#39','
      
        '--$s#viewmode#1*/                                               ' +
        '       '#39'BadPayOrderErrorTPONotFound'#39','
      
        '--$s#viewmode#1*/                                               ' +
        '       '#39'BadPayOrderErrorTPONotFullPayed'#39' )'
      
        '--$s#viewmode#1*/                                 OR t.reg_date ' +
        '< p_dateutils.AddWorkDays( TRUNC( SYSDATE, '#39'DD'#39' ), -5 ) ) )'
      ''
      
        '--$s#viewmode#3*/  and exists( select '#39#39' from fdc_noticepay_char' +
        'ge_lst  x where x.decl_id = t.id and x.summa - x.payed > 0)'
      '--$s#viewmode#4*/  and t.StateSysName='#39'Annul'#39
      '--$s#viewmode#5*/  and t.StateSysName='#39'PayOff'#39
      
        '--$s#viewmode#6*/  and (t.StateSysName not in ('#39'Annul'#39','#39'PayOff'#39')' +
        ' or t.StateSysName is null) and t.payoff_date is not null'
      
        '--$s#viewmode#7*/  and t.err_count=0 and t.errpay_count=1 and t.' +
        'debt_count=0'
      '/*$ p#cust_code#*/ and t.Customs_Code like NVL(:cust_code, '#39'%'#39')'
      '/*$p#decl_no#*/    and t.Decl_No like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#doc_type#*/    and (t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth' +
        '_move like :doc_type)'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      '    and (null is null or t.SUBJECT_ID = null)'
      '    and (null is null or null = t.Subject_Id) '
      
        '    and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID' +
        ')'
      
        '    and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088 +
        #1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      
        '--        order by t.Customs_Code desc, t.Reg_Date desc, t.Decl_' +
        'No desc'
      '    and rownum <= :MaxRecordCount'
      ') a')
    Left = 316
    Top = 83
    ParamData = <
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
        Name = 'Name'
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
        Name = 'doc_type'
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
        DataType = ftUnknown
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataDOC_TYPE: TStringField
      DisplayWidth = 8
      Size = 8
    end
    object dsDataANNUL_NAME: TStringField
      FieldName = 'ANNUL_NAME'
      Size = 16
    end
    object dsDataANNUL_DATE: TDateTimeField
      FieldName = 'ANNUL_DATE'
    end
    object dsDataDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsDataIN_WAIT: TIntegerField
      FieldName = 'IN_WAIT'
    end
    object dsDataAS_BIG_PAYER: TIntegerField
      FieldName = 'AS_BIG_PAYER'
    end
    object dsDataCARRIER_NAME: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'CARRIER_NAME'
      Size = 1500
    end
    object dsDataCARRIER_INN: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1048#1053#1053
      FieldName = 'CARRIER_INN'
      Size = 12
    end
    object dsDataCARRIER_KPP: TStringField
      DisplayLabel = #1086#1090#1074'. '#1083#1080#1094#1086', '#1050#1055#1055
      FieldName = 'CARRIER_KPP'
      Size = 10
    end
    object dsDataCARRIER_ID: TFloatField
      FieldName = 'CARRIER_ID'
    end
    object dsDataCHARGED: TFloatField
      FieldName = 'CHARGED'
    end
    object dsDataPAYED: TFloatField
      FieldName = 'PAYED'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataANNUL_REASON: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1072#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#1080#1103
      FieldName = 'ANNUL_REASON'
      Size = 4000
    end
    object dsDataIS_ARCHIVE: TStringField
      DisplayLabel = #1040#1088#1093#1080#1074#1085#1099#1081
      DisplayWidth = 20
      FieldName = 'IS_ARCHIVE'
    end
  end
  inherited srcData: TDataSource
    Left = 276
    Top = 127
  end
end
