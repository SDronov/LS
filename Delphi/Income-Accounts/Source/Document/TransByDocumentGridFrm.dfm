inherited TransByDocumentGridForm: TTransByDocumentGridForm
  Caption = 'TransByDocumentGridForm'
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
      Width = 275
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 275
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 275
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 275
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 485
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn [4]
            Caption = #1048#1053#1053' '#1089#1091#1073#1098#1077#1082#1090#1072
            DataBinding.FieldName = 'SUBJECT_INN'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn [5]
            Caption = #1050#1055#1055' '#1089#1091#1073#1098#1077#1082#1090#1072
            DataBinding.FieldName = 'SUBJECT_KPP'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCOUNT_CODE: TcxGridDBBandedColumn
            Caption = #1057#1095#1105#1090
            DataBinding.FieldName = 'ACCOUNT_CODE'
            Width = 86
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'OPERATION_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1091#1073#1098#1077#1082#1090#1072
            DataBinding.FieldName = 'SUBJECT'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK_CODE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050
            DataBinding.FieldName = 'KBK_CODE'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_TYPE_CODE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAYMENT_TYPE_CODE'
            Visible = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBIT_SIGN: TcxGridDBBandedColumn
            Caption = #1041'/'#1042' ('#1087#1088#1080#1079#1085#1072#1082' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103'/'#1089#1087#1080#1089#1072#1085#1080#1103')'
            DataBinding.FieldName = 'DEBIT_SIGN'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURRENCY_CODE'
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOPERATION_SUM: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
            DataBinding.FieldName = 'OPERATION_SUM'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_RUR: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
            DataBinding.FieldName = 'SUM_RUR'
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXCH_RATE: TcxGridDBBandedColumn
            Caption = #1050#1091#1088#1089
            DataBinding.FieldName = 'EXCH_RATE'
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1058#1057
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Enabled = False
      Visible = False
    end
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchOk: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearchCancel: TAction
      Enabled = False
      Visible = False
    end
    inherited actSearch: TAction
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'with qr as ( select :ID as id'
      '               from dual'
      '             union all'
      '             select id'
      '               from fdc_decl_charge'
      '              where decl_id = :ID'
      '             union all'
      '             select id'
      '               from fdc_payment_deduction'
      '              where decl_id = :ID'
      '           )'
      'select *'
      'from ('
      '      -- '#1087#1088#1086#1074#1086#1076#1082#1080' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      '      select acct.id'
      '            ,o.name'
      '            ,o.shortname'
      '            ,o.object_type_id'
      '            ,o.state_id'
      '            ,o.accesslevel'
      '            ,o.sysname'
      '            ,o.descript'
      '            ,o.owner_object_id'
      '            ,o.typename'
      '            ,o.typesysname'
      '            ,o.objectkindlist'
      '            ,o.ext_source'
      '            ,o.ext_typesysname'
      '            ,o.ext_id'
      '            ,acct.doc_id'
      '            ,acct.account_id'
      '            ,acct.kbk_id'
      '            ,acct.subject_id'
      '            ,acct.currency_id'
      '            ,acct.payment_type_id'
      '            ,acct.exch_rate'
      
        '            ,( select acc.code from fdc_acc_light_lst acc where ' +
        'acc.id = acct.account_id ) account_code'
      
        '            ,( select kd.code from fdc_dict_lst kd where kd.id =' +
        ' acct.kbk_id ) as kbk_code'
      '            ,sbj.name subject'
      '            ,sbj.inn subject_inn'
      '            ,sbj.kpp subject_kpp'
      
        '            ,( select cur.code from fdc_nsi_currency_lst cur whe' +
        're cur.id = acct.currency_id ) currency_code'
      
        '            ,( select pd.code from fdc_dict_lst pd where pd.id =' +
        ' acct.payment_type_id ) payment_type_code'
      '            ,acct.operation_date'
      '            ,acct.is_debit'
      
        '            ,(case acct.is_debit when '#39'Y'#39' then '#39#1041#39' else '#39#1042#39' end)' +
        ' debit_sign'
      '            ,acct.operation_sum'
      '            ,acct.sum_rur'
      '            ,acct.is_ts'
      '            ,acct.is_current'
      '      from fdc_acc_transaction acct'
      '          ,fdc_object_lst o'
      '          ,fdc_subject_lst sbj'
      '      where ('
      '             acct.doc_id in (select id from qr)'
      '            )'
      '        and acct.id = o.id'
      '        and acct.subject_id = sbj.id'
      '      union all'
      '      -- '#1087#1088#1086#1090#1086#1090#1080#1087#1099' '#1087#1088#1086#1074#1086#1076#1086#1082' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      '      select acct.id'
      '            ,o.name'
      '            ,o.shortname'
      '            ,o.object_type_id'
      '            ,o.state_id'
      '            ,o.accesslevel'
      '            ,o.sysname'
      '            ,o.descript'
      '            ,o.owner_object_id'
      '            ,o.typename'
      '            ,o.typesysname'
      '            ,o.objectkindlist'
      '            ,o.ext_source'
      '            ,o.ext_typesysname'
      '            ,o.ext_id'
      '            ,acct.doc_id'
      '            ,acct.account_id'
      '            ,acct.kbk_id'
      '            ,acct.subject_id'
      '            ,p_nsi_currency.rur_id currency_id'
      '            ,acct.payment_type_id'
      '            ,1 exch_rate'
      
        '            ,( select acc.code from fdc_acc_light_lst acc where ' +
        'acc.id = acct.account_id ) account_code'
      
        '            ,( select kd.code from fdc_dict_lst kd where kd.id =' +
        ' acct.kbk_id ) as kbk_code'
      '            ,sbj.name subject'
      '            ,sbj.inn subject_inn'
      '            ,sbj.kpp subject_kpp'
      
        '            ,( select code from fdc_nsi_currency_lst where id = ' +
        'p_nsi_currency.rur_id ) currency_code'
      
        '            ,( select pd.code from fdc_dict_lst pd where pd.id =' +
        ' acct.payment_type_id ) payment_type_code'
      '            ,acct.activation_date operation_date'
      
        '            ,(case acct.is_debit when '#39#1041#39' then '#39'Y'#39' else '#39'N'#39' end)' +
        ' is_debit'
      '            ,acct.is_debit debit_sign'
      '            ,acct.operation_sum'
      '            ,operation_sum sum_rur'
      '            ,acct.is_ts'
      '            ,1 is_current'
      '      from fdc_actcorrectob_tran_lst acct'
      '          ,fdc_object_lst o'
      '          ,fdc_subject_lst sbj'
      '      where ('
      '             acct.doc_id in (select id from qr)'
      '            )'
      '        and acct.id = o.id'
      '        and acct.subject_id = sbj.id'
      '      )'
      'where (rownum <= :MaxRecordCount)')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataACCOUNT_ID: TFloatField
      FieldName = 'ACCOUNT_ID'
    end
    object dsDataKBK_ID: TFloatField
      FieldName = 'KBK_ID'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataPAYMENT_TYPE_ID: TFloatField
      FieldName = 'PAYMENT_TYPE_ID'
    end
    object dsDataACCOUNT_CODE: TStringField
      FieldName = 'ACCOUNT_CODE'
      Size = 1500
    end
    object dsDataKBK_CODE: TStringField
      FieldName = 'KBK_CODE'
      Size = 1500
    end
    object dsDataSUBJECT: TStringField
      FieldName = 'SUBJECT'
      Size = 1500
    end
    object dsDataCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsDataPAYMENT_TYPE_CODE: TStringField
      FieldName = 'PAYMENT_TYPE_CODE'
      Size = 1500
    end
    object dsDataOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
    object dsDataIS_DEBIT: TStringField
      FieldName = 'IS_DEBIT'
      Size = 1
    end
    object dsDataOPERATION_SUM: TFloatField
      FieldName = 'OPERATION_SUM'
      DisplayFormat = ',0.00'
    end
    object dsDataSUM_RUR: TFloatField
      FieldName = 'SUM_RUR'
      DisplayFormat = ',0.00'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataIS_CURRENT: TIntegerField
      FieldName = 'IS_CURRENT'
    end
    object dsDataSUBJECT_INN: TStringField
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object dsDataDEBIT_SIGN: TStringField
      FieldName = 'DEBIT_SIGN'
      Size = 1
    end
    object dsDataEXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
  end
end
