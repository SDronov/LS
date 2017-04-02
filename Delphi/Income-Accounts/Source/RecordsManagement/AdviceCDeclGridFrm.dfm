inherited AdviceCDeclGridForm: TAdviceCDeclGridForm
  Caption = 'AdviceCDeclGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Top = 2
      Width = 77
      Height = 23
    end
  end
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
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = True
          end
          inherited grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            Visible = False
          end
        end
        object grdDataDBBandedTableViewDetail: TcxGridDBBandedTableView [2]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcCharges
          DataController.DetailKeyFieldNames = 'DECL_ID'
          DataController.KeyFieldNames = 'ID'
          DataController.MasterKeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDetailSUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellEndEllipsis = True
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          Bands = <
            item
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              FixedKind = fkLeft
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
            end
            item
              Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077
            end>
          object grdDataDBBandedTableViewDetailID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailDECL_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPAY_TYPE_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Options.Moving = False
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 80
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCURR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Width = 90
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHANGE_REASON_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHANGE_REASON_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHANGE_DESC: TcxGridDBBandedColumn
            Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            DataBinding.FieldName = 'CHANGE_DESC'
            Visible = False
            Width = 120
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailREASON_NAME: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'REASON_NAME'
            Width = 190
            Position.BandIndex = 1
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHANGE_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'CHANGE_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBKCODE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBK: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBK'
            Width = 160
            Position.BandIndex = 1
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHARGE_MONTH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_MONTH'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
        inherited grdDataLevel: TcxGridLevel
          object grdDataLevelPayTypes: TcxGridLevel
            GridView = grdDataDBBandedTableViewDetail
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
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
      'SELECT * from ('
      '                select t.*'
      '                      ,t.G011 || t.CUSTOM_MODE_CODE DECL_MODE'
      '                      ,fdc_Decl_Has_Error(t.id) as err_count'
      '                      ,fdc_Decl_Has_Debt(t.id) as debt_count'
      '                  from fdc_obligation_doc_lst t'
      '                      ,fdc_subject_lst        s'
      '                      ,(select distinct ac.decl_id'
      '                          from fdc_advice_charge_lst ac'
      '                         where ac.advice_id = :ID'
      '                        union'
      '                        select distinct nc.decl_id'
      '                          from fdc_noticepay_charge_lst nc'
      '                         where nc.noticepay_id = :ID'
      '                        ) v'
      
        '--$s#viewmode#2*/     ,(select distinct x.owner_object_id from f' +
        'dc_Custom_decl_Error_lst x ) ed'
      '                 where s.id(+) = t.subject_id'
      '                   and t.id = v.decl_id'
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
      'where rownum <= :MaxRecordCount'
      '')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
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
  object dsCharges: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT ac.ID'
      '     , ac.DECL_ID'
      '     , ac.PAY_TYPE_ID'
      '     , pt.CODE AS pay_type_code'
      '     , ac.SUMMA'
      '     , ac.CURRENCY_ID'
      '     , c.code AS curr_code'
      '     , ac.CHANGE_REASON_ID'
      
        '     , ( SELECT CODE || '#39' '#39' || NAME FROM fdc_type_correction_lst' +
        ' WHERE id = ac.CHANGE_REASON_ID ) REASON_NAME'
      '     , ac.CHANGE_DESC'
      '     , ac.CHANGE_DATE'
      '     , ac.KBKCODE_ID'
      '     , k.code AS KBK'
      '     , ac.CHARGE_MONTH'
      '  FROM fdc_advice_charge_lst ac'
      '      ,fdc_payment_type_lst  pt'
      '      ,fdc_kbk_dict_lst      k'
      '      ,fdc_nsi_currency_lst  c'
      '  WHERE ac.advice_id   = :ID'
      '    AND ac.pay_type_id = pt.id'
      '    AND ac.kbkcode_id  = k.id'
      '    AND ac.currency_id = c.id'
      'UNION ALL'
      'SELECT nc.ID'
      '     , nc.DECL_ID'
      '     , nc.PAY_TYPE_ID'
      '     , pt.CODE AS pay_type_code'
      '     , nc.SUMMA'
      '     , nc.CURRENCY_ID'
      '     , c.code AS curr_code'
      '     , nc.CHANGE_REASON_ID'
      
        '     , ( SELECT CODE || '#39' '#39' || NAME FROM fdc_type_correction_lst' +
        ' WHERE id = nc.CHANGE_REASON_ID ) REASON_NAME'
      '     , nc.CHANGE_DESC'
      '     , nc.CHANGE_DATE'
      '     , nc.KBKCODE_ID'
      '     , k.code AS KBK'
      '     , nc.CHARGE_MONTH'
      '  FROM fdc_noticepay_charge_lst nc'
      '      ,fdc_payment_type_lst  pt'
      '      ,fdc_kbk_dict_lst      k'
      '      ,fdc_nsi_currency_lst  c'
      '  WHERE nc.noticepay_id = :ID'
      '    AND nc.pay_type_id = pt.id'
      '    AND nc.kbkcode_id  = k.id'
      '    AND nc.currency_id = c.id')
    Left = 144
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsChargesID: TFloatField
      FieldName = 'ID'
    end
    object dsChargesDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsChargesPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsChargesPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsChargesSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsChargesCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsChargesCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsChargesCHANGE_REASON_ID: TFloatField
      FieldName = 'CHANGE_REASON_ID'
    end
    object dsChargesCHANGE_DESC: TStringField
      FieldName = 'CHANGE_DESC'
      Size = 2000
    end
    object dsChargesCHANGE_DATE: TDateTimeField
      FieldName = 'CHANGE_DATE'
    end
    object dsChargesKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsChargesKBK: TStringField
      FieldName = 'KBK'
      Size = 1500
    end
    object dsChargesCHARGE_MONTH: TDateTimeField
      FieldName = 'CHARGE_MONTH'
    end
    object dsChargesREASON_NAME: TStringField
      FieldName = 'REASON_NAME'
      Size = 3001
    end
  end
  object srcCharges: TDataSource
    AutoEdit = False
    DataSet = dsCharges
    Left = 144
    Top = 254
  end
end
