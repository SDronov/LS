inherited DecOffsetObligationTRGridForm: TDecOffsetObligationTRGridForm
  Left = 405
  Top = 315
  Caption = 'DecOffsetObligationTRGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
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
        inherited edtDocType: TcxMaskEdit
          Width = 76
        end
      end
    end
  end
  inherited ActionList: TActionList
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
      Visible = ivNever
    end
    inherited cmbxViewMode: TdxBarCombo
      Visible = ivNever
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 112
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select res.*'
      '         ,fdc_decl_charge_get_summ_decl(res.id) charged'
      '         ,fdc_decl_ded_get_summ_decl( res.id ) payed'
      '   '#9#9'  ,decode(res.TRTYPE,0,'#39#1054#1073#1099#1095#1085#1072#1103#39',1,'#39#1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103#39') sType'
      '  '#9#9'  ,decode(res.SIGN_CORR,0,'#39#1053#1077#1090#39',1,'#39#1044#1072#39') sSIGN_CORR'
      '       '
      'from ('
      '      select  t.*'
      
        '          ,t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth_move  as doc_' +
        'type'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39','#39#1040#1085#1085#1091#1083#1080#1088#1086#1074#1072#1085#39',decode(t.' +
        'StateSysName,'#39'PayOff'#39','#39#1055#1086#1075#1072#1096#1077#1085#39',decode(t.payoff_date,null,null,'#39 +
        #1055#1086#1075#1072#1096#1077#1085#1095#1072#1089#1090#1080#1095#1085#1086#39'))) annul_name'
      
        '          ,decode(t.StateSysName,'#39'Annul'#39',t.ann_date,t.payoff_dat' +
        'e) annul_date'
      
        '          ,(case when (t.err_count=0 and t.errpay_count=1 and t.' +
        'debt_count=0) then 1 else 0 end) in_wait'
      '      from fdc_dec_offset_obligation_lst deco'
      '          ,fdc_rel_tr_dec_lst rel'
      '          ,fdc_tr_lst t'
      '      where deco.id = :id'
      '        and deco.id = rel.rel_object_id'
      '        and rel.object_id = t.id'
      '/*$ p#cust_code#*/ and (:cust_code is null)'
      '/*$p#decl_no#*/    and (:decl_no is null)'
      '/*$p#from_date#*/  and (:from_date is null)'
      '/*$p#to_date#*/    and (:to_date is null)'
      '/*$p#name#*/       and (:name is null)'
      '/*$p#inn#*/        and (:INN is null)'
      '/*$p#kpp#*/        and (:KPP is null)'
      '/*$p#doc_type#*/   and (:doc_type is null)'
      '/*$p#g_code#*/     and (:g_code is null)'
      '/*$p#g_pref#*/     and (:g_pref is null)'
      '                   and (:gl_subject_id is null)'
      
        '                   and (:subj_id is null) -- '#1085#1077#1091#1073#1080#1088#1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080 +
        #1084#1086#1076#1083#1103#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081#1087#1086#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      '     ) res'
      'where rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
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
        Name = 'name'
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
        Name = 'gl_subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'subj_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
