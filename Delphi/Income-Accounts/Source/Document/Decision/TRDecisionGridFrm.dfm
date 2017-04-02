inherited TRDecisionGridForm: TTRDecisionGridForm
  Left = 244
  Top = 253
  Caption = #1056#1077#1096#1077#1085#1080#1103' '#1086' '#1079#1072#1095#1077#1090#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 604
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 604
      end
      inherited pnlProgress: TPanel
        Width = 604
        inherited lblProgress: TcxLabel
          Width = 604
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 814
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        inherited lblActiveDate: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 167
        end
        inherited edtDeclName: TcxTextEdit
          Width = 167
        end
        inherited edtINN: TcxTextEdit
          Width = 116
        end
        inherited edtKPP: TcxTextEdit
          Width = 116
        end
        inherited edtNomer: TcxTextEdit
          Width = 116
        end
        inherited edtFromDate: TcxDateEdit
          Width = 116
        end
        inherited edtToDate: TcxDateEdit
          Width = 116
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 116
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 116
        end
        inherited edtActiveFrom: TcxDateEdit
          Width = 132
        end
        inherited edtActiveTo: TcxDateEdit
          Width = 132
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
          inherited colDocNumber: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
          inherited colDocDate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 228
            Position.ColIndex = 9
          end
          inherited colAppDate: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 10
          end
          inherited colAppDateIncome: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 11
          end
          inherited colSumma: TcxGridDBBandedColumn
            Position.ColIndex = 7
          end
          object colState: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATENAME'
            Width = 82
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
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
            Item = cmbDocType
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
    object cmbDocType: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1077' '#1090#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = cmbDocTypeChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077
        #1056#1077#1096#1077#1085#1080#1103
        #1040#1082#1090#1099)
      ItemIndex = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      'FROM ('
      
        '      SELECT d.id, d.NAME, d.shortname, d.object_type_id, d.stat' +
        'e_id, d.accesslevel, d.sysname, d.descript, d.owner_object_id,'
      
        '             d.typename, d.typesysname, d.objectkindlist, d.doc_' +
        'date, d.doc_number, d.subject_id,d.decl_name, d.decl_inn,d.decl_' +
        'kpp,'
      
        '             d.app_number, d.app_date, d.app_date_income, d.reas' +
        'on_id, d.summa,'
      
        '             ( SELECT s.NAME FROM fdc_state_lst s WHERE s.ID = d' +
        '.state_id)AS StateName,d.is_ts'
      '        FROM fdc_dec_debts_deposit_lst d'
      '       WHERE ( :doc_type in ( 0, 1 ) )'
      '               AND d.id IN ( SELECT rt.REL_OBJECT_ID'
      '                               FROM fdc_rel_tr_dec_lst rt'
      '                              WHERE rt.OBJECT_ID = :ID )'
      ''
      '      UNION ALL'
      ''
      
        '      SELECT d.id, d.NAME, d.shortname, d.object_type_id, d.stat' +
        'e_id, d.accesslevel, d.sysname, d.descript, d.owner_object_id,'
      
        '             d.typename, d.typesysname, d.objectkindlist, d.doc_' +
        'date, d.doc_number, d.subject_id,d.decl_name, d.decl_inn,d.decl_' +
        'kpp,'
      
        '             d.app_number, d.app_date, d.app_date_income, d.reas' +
        'on_id, d.summa,'
      
        '             ( SELECT s.NAME FROM fdc_state_lst s WHERE s.ID = d' +
        '.state_id)AS StateName,d.is_ts'
      '        FROM fdc_dec_payment_deposit_lst d'
      '       WHERE ( :doc_type in ( 0, 1 ) )'
      '               AND d.id IN ( SELECT rt.REL_OBJECT_ID'
      '                               FROM fdc_rel_tr_dec_lst rt'
      '                              WHERE rt.OBJECT_ID = :ID )'
      ''
      '      UNION ALL'
      ''
      
        '      SELECT d.id, d.NAME, d.shortname, d.object_type_id, d.stat' +
        'e_id, d.accesslevel, d.sysname, d.descript, d.owner_object_id,'
      
        '             d.typename, d.typesysname, d.objectkindlist, d.doc_' +
        'date, d.doc_number, d.subject_id,d.decl_name, d.decl_inn,d.decl_' +
        'kpp,'
      
        '             d.app_number, d.app_date, d.app_date_income, d.reas' +
        'on_id, d.summa,'
      
        '             ( SELECT s.NAME FROM fdc_state_lst s WHERE s.ID = d' +
        '.state_id)AS StateName,d.is_ts'
      '        FROM fdc_dec_payback_deposit_lst d, fdc_value_lst v'
      '       WHERE ( :doc_type in ( 0, 1 ) )'
      
        '              AND v.OWNER_OBJECT_ID = d.id AND v.Ref_Object_ID =' +
        ' :ID'
      ''
      '      UNION ALL'
      ''
      
        '      SELECT d.id, d.NAME, d.shortname, d.object_type_id, d.stat' +
        'e_id, d.accesslevel, d.sysname, d.descript, d.owner_object_id,'
      
        '             d.typename, d.typesysname, d.objectkindlist, d.doc_' +
        'date, d.doc_number, d.subject_id,d.decl_name, d.decl_inn,d.decl_' +
        'kpp,'
      
        '             d.app_number, d.app_date, d.app_date_income, d.reas' +
        'on_id, d.summa,'
      
        '             ( SELECT s.NAME FROM fdc_state_lst s WHERE s.ID = d' +
        '.state_id)AS StateName,d.is_ts'
      '        FROM fdc_dec_offset_obligation_lst d'
      '       WHERE ( :doc_type in ( 0, 1 ) )'
      '               AND d.id IN ( SELECT rt.REL_OBJECT_ID'
      '                               FROM fdc_rel_tr_dec_lst rt'
      '                              WHERE rt.OBJECT_ID = :ID)'
      ''
      '      UNION ALL'
      ''
      
        '      SELECT a.id, a.NAME, a.shortname, a.object_type_id, a.stat' +
        'e_id, a.accesslevel, a.sysname, a.descript, a.owner_object_id,'
      
        '             a.typename, a.typesysname, a.objectkindlist, a.doc_' +
        'date, a.doc_number, a.subject_id, sb.Name decl_name, sb.INN decl' +
        '_inn, sb.kpp decl_kpp,'
      
        '             null app_number, null app_date, null app_date_incom' +
        'e, null reason_id, a.summa,'
      
        '             ( SELECT s.NAME FROM fdc_state_lst s WHERE s.ID = a' +
        '.state_id)AS StateName,a.is_ts'
      '        FROM fdc_act_ded_deposit_lst a, fdc_subject_lst sb'
      '       WHERE ( :doc_type in ( 0, 2 ) )'
      '             AND sb.id = a.SUBJECT_ID'
      '             AND a.id IN ( SELECT rt.OBJECT_ID'
      
        '                             FROM fdc_rel_act_ded_deduction_lst ' +
        'rt, fdc_payment_deduction_all_lst ded'
      '                            WHERE rt.REL_OBJECT_ID = ded.id'
      '                                  AND ded.decl_id = :ID)'
      '     )'
      ' WHERE (:Name is null or upper(NAME) like upper(:Name))'
      '   AND rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'doc_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
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
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataSTATENAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 150
      FieldName = 'STATENAME'
      Size = 1500
    end
  end
end
