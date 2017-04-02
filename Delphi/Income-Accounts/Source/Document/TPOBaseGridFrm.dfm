inherited TPOBaseGridForm: TTPOBaseGridForm
  Left = 265
  Top = 316
  Caption = 'TPOBaseGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          TabOrder = 11
        end
        inherited edtName: TcxTextEdit
          Left = 81
          Top = 200
          TabOrder = 5
        end
        inherited edtINN: TcxTextEdit
          Left = 81
          Top = 218
          TabOrder = 6
        end
        inherited edtKPP: TcxTextEdit
          Left = 81
          Top = 236
          TabOrder = 7
        end
        inherited edtCustomsCode: TcxTextEdit
          Left = 81
          Top = 78
          TabOrder = 1
        end
        inherited edtFrom: TcxDateEdit
          Left = 81
          Top = 96
          TabOrder = 2
        end
        inherited edtTo: TcxDateEdit
          Left = 81
          Top = 114
          TabOrder = 3
        end
        inherited edtNo: TcxTextEdit
          Left = 81
          Top = 132
          TabOrder = 4
        end
        inherited edtGoodsCode: TcxMaskEdit
          Left = 81
          Top = 304
          TabOrder = 8
        end
        inherited edtGoodsPref: TcxTextEdit
          Left = 81
          Top = 322
          TabOrder = 9
        end
        object edtDocType: TcxMaskEdit [10]
          Left = 81
          Top = 60
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 76
        end
        inherited btnSearchClear: TcxButton
          TabOrder = 10
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lcgDocument: TdxLayoutGroup
            object lcSearchCriteriaItem10: TdxLayoutItem [0]
              Caption = #1058#1080#1087' '#1086#1088#1076#1077#1088#1072
              Control = edtDocType
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewDOC_TYPE: TcxGridDBBandedColumn [4]
            DataBinding.FieldName = 'DOC_TYPE'
            Width = 117
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_RUB: TcxGridDBBandedColumn [5]
            DataBinding.FieldName = 'SUM_RUB'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 104
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Width = 174
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Width = 49
            Position.ColIndex = 13
          end
          object grdDataDBBandedTableViewNUM_MPO: TcxGridDBBandedColumn [10]
            DataBinding.FieldName = 'NUM_MPO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewORDER_TYPE: TcxGridDBBandedColumn [11]
            DataBinding.FieldName = 'DOC_TYPE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          inherited colERR_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 14
          end
          inherited grdDataDBBandedTableViewDEBT_COUNT: TcxGridDBBandedColumn
            Position.ColIndex = 21
          end
          inherited grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Width = 58
          end
          object grdDataDBBandedTableViewOBJKINDLABEL: TcxGridDBBandedColumn [18]
            DataBinding.FieldName = 'OBJKINDLABEL'
            Visible = False
            Width = 372
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREGIM: TcxGridDBBandedColumn [19]
            DataBinding.FieldName = 'REGIM'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            Position.ColIndex = 20
          end
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
      '      select  t.*'
      
        '          ,t.order_type||'#39'/'#39'||t.regim||'#39'/'#39'||t.meth_move  as doc_' +
        'type'
      '        from fdc_tpo_lst t'
      
        '--$s#viewmode#2*/,(select distinct x.owner_object_id from fdc_Cu' +
        'stom_decl_Error_lst x ) ed'
      '       where t.Customs_Code > '#39' '#39
      '--$s#viewmode#2*/  and   t.id = ed.owner_object_id'
      
        '--$s#viewmode#1*/  and not exists( select '#39#39' from fdc_Custom_dec' +
        'l_Error_lst x where x.owner_object_id = t.id)'
      
        '--$s#viewmode#3*/  and exists( select '#39#39' from fdc_noticepay_char' +
        'ge_lst  x where x.decl_id = t.id AND x.summa - x.payed > 0)'
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
      
        '    and (:GL_SUBJECT_ID is null or t.SUBJECT_ID = :GL_SUBJECT_ID' +
        ')'
      
        '    and (:Subj_Id is null or :Subj_Id = t.Subject_Id) -- '#1085#1077' '#1091#1073#1080#1088 +
        #1072#1090#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1081' '#1087#1086' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1091
      
        '--        order by t.Customs_Code desc, t.Reg_Date desc, t.Decl_' +
        'No desc'
      ')'
      'where rownum <= :MaxRecordCount')
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
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataNUM_MPO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1052#1055#1054
      FieldName = 'NUM_MPO'
      Size = 12
    end
    object dsDataSUM_RUB: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' ('#1088#1091#1073')'
      FieldName = 'SUM_RUB'
      DisplayFormat = ',0.00'
    end
    object dsDataREGIM: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072
      FieldName = 'REGIM'
      Size = 2
    end
    object dsDataMETH_MOVE: TStringField
      DisplayLabel = #1052#1077#1090#1086#1076' '#1087#1077#1088#1077#1076#1074#1080#1078#1077#1085#1080#1103
      FieldName = 'METH_MOVE'
      Size = 2
    end
    object dsDataDOC_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_TYPE'
      Size = 7
    end
  end
end
