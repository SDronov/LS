inherited repCustomDeclTempNotClosedGridForm: TrepCustomDeclTempNotClosedGridForm
  Left = 94
  Top = 253
  Caption = #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1074#1088#1077#1084#1077#1085#1085#1099#1077' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1080
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
      26
      0)
    inherited cmbxCustCode: TdxBarCombo
      Align = iaLeft
    end
    inherited cmbxViewMode: TdxBarCombo
      Visible = ivNever
      Text = #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1042#1055#1044
      ItemIndex = 10
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select /*+ FIRST_ROWS INDEX_DESC(fdc_custom_decl, FDC_CUSTOM_DEC' +
        'L_AK) */ * from ('
      '      select'
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
      ''
      
        '--$s#enable_order#Y*/  order by t.Customs_Code desc, t.Reg_Date ' +
        'desc, t.Decl_No desc'
      ''
      ')'
      'where rownum <= :MaxRecordCount')
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
      end>
  end
end
