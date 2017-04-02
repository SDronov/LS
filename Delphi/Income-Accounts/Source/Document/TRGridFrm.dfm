inherited TRGridForm: TTRGridForm
  Left = 263
  Top = 288
  Width = 977
  Height = 670
  HelpContext = 442
  Caption = #1057#1087#1080#1089#1086#1082' '#1058#1056
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 610
    Width = 961
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
      Width = 658
      Height = 20
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 658
        Height = 20
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 20
        end
      end
      inherited pnlProgress: TPanel
        Width = 658
        Height = 20
        inherited lblProgress: TcxLabel
          Height = 20
          Width = 658
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 868
      Height = 20
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 607
    Width = 961
  end
  inherited pnlWorkspace: TPanel
    Width = 961
    Height = 579
    inherited splSearchCriteria: TSplitter
      Height = 579
    end
    inherited pnlSearchCriteria: TPanel
      Height = 579
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 559
        inherited btnSearch: TcxButton
          Top = 528
        end
        inherited edtName: TcxTextEdit
          Width = 110
        end
        inherited edtINN: TcxTextEdit
          Width = 79
        end
        inherited edtKPP: TcxTextEdit
          Width = 79
        end
        inherited edtCustomsCode: TcxTextEdit
          Width = 79
        end
        inherited edtFrom: TcxDateEdit
          Width = 79
        end
        inherited edtTo: TcxDateEdit
          Width = 79
        end
        inherited edtNo: TcxTextEdit
          Width = 79
        end
        inherited edtGoodsCode: TcxMaskEdit
          Width = 79
        end
        inherited edtGoodsPref: TcxTextEdit
          Width = 79
        end
        inherited btnSearchClear: TcxButton
          Top = 499
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1058#1056
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 756
      Height = 579
      inherited grdData: TcxGrid
        Width = 756
        Height = 579
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
          inherited grdDataDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn
            MinWidth = 25
            Width = 148
          end
          inherited grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.Nullable = True
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Position.ColIndex = 31
          end
          inherited grdDataDBBandedTableViewNUM_MPO: TcxGridDBBandedColumn
            Position.ColIndex = 19
          end
          inherited grdDataDBBandedTableViewORDER_TYPE: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
          object grdDataDBBandedTableViewDATE_EXEC: TcxGridDBBandedColumn [12]
            Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
            DataBinding.FieldName = 'DATE_EXEC'
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
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
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1040#1085#1085#1091#1083#1080#1088'. /'#1055#1086#1075#1072#1096#1077#1085'.'
            DataBinding.FieldName = 'ANNUL_NAME'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085
              #1055#1086#1075#1072#1096#1077#1085
              #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086)
            Width = 77
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1072#1085#1085#1091#1083'./ '#1087#1086#1075#1072#1096'.'
            DataBinding.FieldName = 'ANNUL_DATE'
            Width = 81
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
          object colgrdDataDBBandedTableViewCarrier_Name: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            DataBinding.FieldName = 'CARRIER_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewCarrier_Inn: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1048#1053#1053
            DataBinding.FieldName = 'CARRIER_INN'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewCarrier_Kpp: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082', '#1050#1055#1055
            DataBinding.FieldName = 'CARRIER_KPP'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHARGED: TcxGridDBBandedColumn
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'CHARGED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYED: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1095#1077#1085#1086
            DataBinding.FieldName = 'PAYED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 102
            Position.BandIndex = 0
            Position.ColIndex = 11
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
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object columnActivationDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object colAnnulReason: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ANNUL_REASON'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewSTYPE: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'sType'
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object colgrdDataDBBandedTableViewsSIGN_CORR: TcxGridDBBandedColumn
            Caption = #1057#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1085#1086
            DataBinding.FieldName = 'sSIGN_CORR'
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
    object dxBarButton1: TdxBarButton
      Caption = #1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1090#1100
      Category = 0
      Visible = ivAlways
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 80
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select /*+ FIRST_ROWS(500)*/ a.*'
      '          ,fdc_decl_charge_get_summ_decl(a.id) charged'
      '          ,fdc_decl_ded_get_summ_decl(a.id) payed'
      #9#9'  ,decode(a.TRTYPE,0,'#39#1054#1073#1099#1095#1085#1072#1103#39',1,'#39#1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103#39') sType'
      #9#9'  ,decode(a.SIGN_CORR,0,'#39#1053#1077#1090#39',1,'#39#1044#1072#39') sSIGN_CORR'
      'from ('
      '      select  t.*'
      
        '          ,t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth_move||decode(' +
        't.SIGN_GENPROV,1,'#39'/'#1043#1054#39',0,'#39#39')  as doc_type'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39','#39#1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#39',decode(t.' +
        'StateSysName,'#39'PayOff'#39','#39#1055#1086#1075#1072#1096#1077#1085#39',decode(t.payoff_date,null,null,'#39 +
        #1055#1086#1075#1072#1096#1077#1085' '#1095#1072#1089#1090#1080#1095#1085#1086#39'))) annul_name'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39',t.ann_date,t.payoff_dat' +
        'e) annul_date'
      
        '          ,(case when (t.err_count=0 and t.errpay_count=1 and t.' +
        'debt_count=0) then 1 else 0 end) in_wait'
      '        from fdc_tr_lst t'
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
        'dateutils.AddWorkDays( TRUNC( SYSDATE, '#39'DD'#39' ), -3 ) ) )'
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
        '< p_dateutils.AddWorkDays( TRUNC( SYSDATE, '#39'DD'#39' ), -3 ) ) )'
      ''
      
        '--$s#viewmode#3*/  and exists( select '#39#39' from fdc_noticepay_char' +
        'ge_lst  x where x.decl_id = t.id and x.summa - x.payed > 0)'
      ''
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
      '/*$p#name#*/       and UPPER(t.decl_name) like upper(:name)'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#doc_type#*/    and (t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth' +
        '_move like :doc_type)'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      ' and (null is null or t.SUBJECT_ID = null)'
      ' and (null is null or null = t.Subject_Id)'
      ' and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID)'
      
        ' and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088#1072#1090#1100 +
        ', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      
        '--        order by t.Customs_Code desc, t.Reg_Date desc, t.Decl_' +
        'No desc'
      '    and rownum <= :MaxRecordCount'
      ') a')
    OnCalcFields = dsDataCalcFields
    Left = 332
    Top = 131
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
      Size = 20
    end
    object dsDataANNUL_DATE: TDateTimeField
      FieldName = 'ANNUL_DATE'
    end
    object dsDataANNUL_NAME: TStringField
      FieldName = 'ANNUL_NAME'
    end
    object dsDataDATE_CREATED: TDateTimeField
      FieldName = 'DATE_CREATED'
    end
    object dsDataIN_WAIT: TIntegerField
      FieldName = 'IN_WAIT'
    end
    object dsDataCARRIER_NAME: TStringField
      FieldName = 'CARRIER_NAME'
      Size = 1500
    end
    object dsDataCARRIER_INN: TStringField
      FieldName = 'CARRIER_INN'
      Size = 12
    end
    object dsDataCARRIER_KPP: TStringField
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
    object dsDataDATE_EXEC: TDateTimeField
      FieldName = 'DATE_EXEC'
    end
    object dsDatasType: TStringField
      FieldName = 'sType'
    end
    object dsDatasSIGN_CORR: TStringField
      FieldName = 'sSIGN_CORR'
    end
  end
  inherited srcData: TDataSource
    Left = 324
  end
end
