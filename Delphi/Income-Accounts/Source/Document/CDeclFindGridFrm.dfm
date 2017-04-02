inherited CDeclFindGridForm: TCDeclFindGridForm
  Left = 287
  Top = 204
  Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 127
        end
        inherited edtINN: TcxTextEdit
          Width = 110
        end
        inherited edtKPP: TcxTextEdit
          Width = 110
        end
        inherited edtCustomsCode: TcxTextEdit
          Width = 110
        end
        inherited edtFrom: TcxDateEdit
          Width = 110
        end
        inherited edtTo: TcxDateEdit
          Width = 110
        end
        inherited edtNo: TcxTextEdit
          Width = 110
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
          inherited grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Visible = False
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'select /*+ FIRST_ROWS INDEX_DESC(fdc_custom_decl, FDC_CUSTOM_DEC' +
        'L_AK) */ * from ('
      '            select t.*'
      '                  ,t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      '                  ,fdc_Decl_Has_Error(t.id) as err_count'
      '                  ,fdc_Decl_Has_Debt(t.id) as debt_count'
      '              from fdc_obligation_doc_lst t'
      '                  ,fdc_subject_lst        s'
      
        '--$s#viewmode#2*/ ,(select distinct x.owner_object_id from fdc_C' +
        'ustom_decl_Error_lst x ) ed'
      '             where s.id(+) = t.subject_id'
      
        '                   and Instr('#39';'#39'|| :ObjectNames ||'#39';'#39', '#39';'#39'||t.ty' +
        'pesysname||'#39';'#39') > 0'
      '--$s#viewmode#2*/  and t.id = ed.owner_object_id'
      
        '--$s#viewmode#1*/  and not exists( select '#39#39' from fdc_Custom_dec' +
        'l_Error_lst x where x.owner_object_id = t.id)'
      '/*$ p#cust_code#*/ and t.Customs_Code like NVL(:cust_code, '#39'%'#39')'
      '/*$p#decl_no#*/    and t.Decl_No like :decl_no'
      '/*$p#from_date#*/  and t.Reg_Date >= :from_date'
      '/*$p#to_date#*/    and t.Reg_Date <= :to_date'
      '/*$p#name#*/       and upper(s.name) like upper(:name)'
      '/*$p#inn#*/        and s.INN like :INN'
      '/*$p#kpp#*/        and s.KPP like :KPP'
      
        '/*$p#g_code#*/     and exists (select '#39#39' from fdc_decl_goods_lst' +
        ' x where x.decl_id = t.id and x.goods_code like :g_code)'
      
        '/*$p#g_pref#*/     and exists (select '#39#39' from fdc_decl_goods_lst' +
        ' x where x.decl_id = t.id and x.g36 like :g_pref)'
      
        '                   and (:GL_SUBJECT_ID is null or t.SUBJECT_ID =' +
        ' :GL_SUBJECT_ID)'
      '                   and t.Customs_Code > '#39' '#39
      
        '                   and (:Subj_Id is null or :Subj_Id = t.Subject' +
        '_Id) -- '#1085#1077' '#1091#1073#1080#1088#1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083 +
        #1072#1088#1072#1085#1090#1091
      
        '--               order by t.Customs_Code desc, t.Reg_Date desc, ' +
        't.Decl_No desc'
      ')'
      'where rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftString
        Name = 'ObjectNames'
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
