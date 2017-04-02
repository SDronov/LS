inherited CustomDeclBDTByFullGridForm: TCustomDeclBDTByFullGridForm
  Caption = 'CustomDeclBDTByFullGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
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
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actCopySelection: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    inherited actSearchOk: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
      Visible = False
    end
    inherited actSearch: TAction
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
      26
      0)
    inherited cmbxCustCode: TdxBarCombo
      Enabled = False
      Visible = ivNever
    end
    inherited cmbxViewMode: TdxBarCombo
      Enabled = False
      Visible = ivNever
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      '--$s#enable_order#Y*/ select  * from ('
      
        '      select /*+ FIRST_ROWS INDEX_DESC(fdc_custom_decl, FDC_CUST' +
        'OM_DECL_AK) */'
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
      ',t.decision_date'
      'FROM fdc_Custom_Decl_Lst t'
      '    ,fdc_custom_decl_full f'
      'WHERE f.id = :ID'
      '  and f.decl_id = t.id'
      
        '--$s#viewmode#2*/  and  EXISTS (select 0 from fdc_Custom_decl_Er' +
        'ror_lst x where t.id = x.owner_object_id )'
      
        '--$s#viewmode#1*/  and not exists( select '#39#39' from fdc_Custom_dec' +
        'l_Error_lst x where x.owner_object_id = t.id)'
      
        '--$s#viewmode#3*/  and exists (select '#39#39' from fdc_noticepay_char' +
        'ge_lst x where x.decl_id = t.id and x.summa - x.payed > 0)'
      ''
      '--$s#viewmode#4*/  and t.as_big_payer <> 1'
      
        '--$s#viewmode#4*/  and exists (select 0 from fdc_decl_charge_lst' +
        ' dc1 WHERE dc1.decl_id = t.id AND dc1.charge_rest > 0 )'
      
        '--$s#viewmode#4*/  and fdc_decl_charge_get_summ_decl ( t.id ) !=' +
        '  fdc_decl_ded_get_summ_decl( t.id )'
      ''
      
        '--$s#viewmode#5*/  and not exists (select '#39#39' from dbf_dk1 dk1, d' +
        'bf_dk_pp dkp, dbf_dkisch dki, dbf_dkkupl dku'
      
        '--$s#viewmode#5*/    where dk1.g071 = t.customs_code and dk1.g07' +
        '2 = t.reg_date and dk1.g073 = t.decl_no'
      
        '--$s#viewmode#5*/    and dkp.g071 = t.customs_code and dkp.g072 ' +
        '= t.reg_date and dkp.g073 = t.decl_no'
      
        '--$s#viewmode#5*/    and dki.g071 = t.customs_code and dki.g072 ' +
        '= t.reg_date and dki.g073 = t.decl_no'
      
        '--$s#viewmode#5*/    and dku.g071 = t.customs_code and dku.g072 ' +
        '= t.reg_date and dku.g073 = t.decl_no)'
      ''
      '--$s#viewmode#6*/ and t.is_closed = 1'
      ''
      '--$s#viewmode#7*/ and t.as_big_payer = 1'
      ''
      '--$s#viewmode#8*/ and t.NotPrivileges = 1'
      ''
      '--$s#viewmode#9*/ and t.AdvicePrivileges = 1'
      ''
      
        '--$s#viewmode#10*/ and t.typesysname = '#39'CustomDeclTime'#39' and t.is' +
        '_closed = 0'
      ''
      '/*$p#name#*/       and upper(t.decl_name) like upper(:name)'
      
        '/*$  p#cust_code#*/  AND (:cust_code is null or t.Customs_Code=:' +
        'cust_code)'
      '/*$p#decl_no#*/    and t.decl_no like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#inn#*/        and t.decl_INN like :INN'
      '/*$p#kpp#*/        and t.decl_KPP like :KPP'
      
        '/*$p#g_code#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/ and exists (select '#39#39' from fdc_decl_goods_lst x w' +
        'here x.decl_id = t.id and x.g36 like :g_pref)'
      
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
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
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
  end
end
