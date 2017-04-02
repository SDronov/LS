inherited DecisionDebtsNoticeGridForm: TDecisionDebtsNoticeGridForm
  Caption = 'DecisionDebtsNoticeGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        inherited Label3: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtINN: TcxTextEdit
          Width = 113
        end
        inherited edtKPP: TcxTextEdit
          Width = 113
        end
        inherited edtNomer: TcxTextEdit
          Width = 113
        end
        inherited edtFromDate: TcxDateEdit
          Width = 113
        end
        inherited edtToDate: TcxDateEdit
          Width = 113
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 113
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 113
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.KeyFieldNames = 'ID'
        end
        object grdDataDBBandedTableViewDetail: TcxGridDBBandedTableView [2]
          OnDblClick = grdDataDBBandedTableViewDetailDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcPays
          DataController.DetailKeyFieldNames = 'NOTICE_ID'
          DataController.KeyFieldNames = 'ID'
          DataController.MasterKeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDetailCHARGE_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDetailSUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsBehavior.NavigatorHints = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.CellEndEllipsis = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.HeaderAutoHeight = True
          OptionsView.HeaderEndEllipsis = True
          OptionsView.Indicator = True
          OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
          OptionsView.BandHeaderEndEllipsis = True
          Bands = <
            item
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              FixedKind = fkLeft
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
            end
            item
              Caption = #1057#1087#1080#1089#1072#1085#1080#1077
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
          object grdDataDBBandedTableViewDetailPAYMENT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPAY_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHARGE_CURR_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_CURR_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailNOTICE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NOTICE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailDECISION_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECISION_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPO_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PO_NAME'
            Width = 160
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHARGE_CURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_CURR_CODE'
            Visible = False
            Hidden = True
            Width = 90
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHARGE_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailCHARGE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBKCODE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBKCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE'
            Width = 180
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBKCODE1_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE1_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailKBKCODE1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE1'
            Width = 180
            Position.BandIndex = 1
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 110
            Position.BandIndex = 1
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailPAYMENT_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.ShowTime = False
            Position.BandIndex = 1
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 120
            Position.BandIndex = 1
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Position.BandIndex = 1
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDetailBUDGET_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BUDGET_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.SaveTime = False
            Position.BandIndex = 1
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
        end
        inherited grdDataLevel: TcxGridLevel
          object grdDataLevelDetail: TcxGridLevel
            Caption = #1042#1080#1076#1099' '#1087#1083#1072#1090#1077#1078#1072
            GridView = grdDataDBBandedTableViewDetail
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = True
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT *'
      '  FROM ('
      'SELECT np.*'
      '      ,0 AS is_not_ready'
      '  FROM fdc_noticepay_lst np'
      ' WHERE (:Name is null or upper(np.NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (np.decl_name        LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (np.decl_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (np.decl_kpp         LIKE :KPP)'
      '/*$p#doc_no#*/    AND (np.doc_number       LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (np.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (np.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (np.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (np.summa <= :SUM_MAX)'
      
        '/*$p#from_date_activeted#*/ AND (:FROM_DATE_ACTIVETED is null or' +
        ' np.activation_date >= :FROM_DATE_ACTIVETED)'
      
        '/*$p#to_date_activeted#*/   AND (:TO_DATE_ACTIVETED is null or n' +
        'p.activation_date  <= :TO_DATE_ACTIVETED)'
      '   AND EXISTS ( SELECT 0'
      '                   FROM fdc_ded_paydept_lst pd'
      '                   WHERE pd.decision_id = :DEC_ID'
      '                     AND pd.notice_id = np.id )'
      '   AND :mode_view = 0'
      'UNION all'
      'SELECT np.*'
      '      ,0 AS is_not_ready'
      '  FROM fdc_noticepay_lst np'
      ' WHERE (:Name is null or upper(np.NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (np.decl_name        LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (np.decl_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (np.decl_kpp         LIKE :KPP)'
      '/*$p#doc_no#*/    AND (np.doc_number       LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (np.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (np.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (np.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (np.summa <= :SUM_MAX)'
      
        '/*$p#from_date_activeted#*/ AND (:FROM_DATE_ACTIVETED is null or' +
        ' np.activation_date >= :FROM_DATE_ACTIVETED)'
      
        '/*$p#to_date_activeted#*/   AND (:TO_DATE_ACTIVETED is null or n' +
        'p.activation_date  <= :TO_DATE_ACTIVETED)'
      '   AND EXISTS ( SELECT 0'
      '                   FROM fdc_noticepay_ded_reserv_lst r'
      '                   WHERE r.decision_id = :DEC_ID'
      '                     AND r.notice_id = np.id )'
      '   AND :mode_view = 1'
      ')'
      'WHERE rownum <= :MaxRecordCount')
    ParamData = <
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
        DataType = ftString
        Name = 'DECL_NAME'
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
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'mode_view'
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
        DataType = ftString
        Name = 'DECL_NAME'
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
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 144
    Top = 190
    object qryGetMode: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  SELECT CASE WHEN s.SYSNAME = '#39'State.DecisionDebts.Created'#39' THE' +
          'N 1 ELSE 0 END'
        '    INTO :result'
        '    FROM fdc_decision_debts_lst dd'
        '        ,fdc_state_lst          s'
        '    WHERE dd.id = :id'
        '      AND s.id  = dd.state_id;'
        'EXCEPTION'
        '  WHEN OTHERS THEN'
        '    :result := -1;'
        'END;')
    end
    object qryRemoveReserve: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  p_decision_debts.removenoticereserve('
        '      pdecisionid   => :decision_id'
        '     ,pnoticeid     => :notice_id'
        '     ,pdeclid       => :decl_id'
        '     ,ppayorderid   => :payment_id'
        '     ,ppaytypeid    => :pay_type_id'
        '     ,pchargecurrid => :charge_curr_id'
        '    );'
        'END;')
      DataSet = dsPays
    end
  end
  object dsPays: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      
        'SELECT pd.id, pd.decl_id, pd.payment_id, fdc_object_get_name( pd' +
        '.payment_id ) AS po_name, pd.pay_type_id, pd.pay_type_code, pd.c' +
        'harge_curr_id, pd.charge_curr_code, pd.charge_summa, pd.charge_i' +
        'd, pd.kbkcode_id, pd.kbkcode, pd.kbkcode1_id, pd.kbkcode1, pd.su' +
        'mma, pd.notice_id, pd.decision_id, pd.payment_date, pd.is_active' +
        ', pd.activation_date, pd.budget_date'
      '  FROM fdc_ded_paydept_lst   pd'
      '  WHERE pd.decision_id = :DEC_ID'
      '    AND :mode_view     = 0'
      'UNION ALL'
      
        'SELECT rownum AS id, r.decl_id, r.payment_id, fdc_object_get_nam' +
        'e( r.payment_id ) AS po_name, r.pay_type_id, r.pay_type_code, r.' +
        'charge_curr_id, r.charge_curr_code, r.charge_summa, r.charge_id,' +
        ' r.kbkcode_id, r.kbkcode, r.kbkcode1_id, r.kbkcode1, r.summa, r.' +
        'notice_id, r.decision_id, to_date( NULL ) AS payment_date, '#39'N'#39' A' +
        'S is_active, to_date( NULL ) AS activation_date, to_date( NULL )' +
        ' AS budget_date'
      '  FROM fdc_noticepay_ded_reserv_lst r'
      '  WHERE r.decision_id = :DEC_ID'
      '    AND :mode_view    = 1')
    Left = 80
    Top = 190
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEC_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'mode_view'
        ParamType = ptUnknown
      end>
    object dsPaysID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsPaysDECL_ID: TFloatField
      FieldName = 'DECL_ID'
      Visible = False
    end
    object dsPaysPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
      Visible = False
    end
    object dsPaysPO_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1105#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'PO_NAME'
      Size = 4000
    end
    object dsPaysPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsPaysPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsPaysCHARGE_CURR_ID: TFloatField
      FieldName = 'CHARGE_CURR_ID'
      Visible = False
    end
    object dsPaysCHARGE_CURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'CHARGE_CURR_CODE'
      Size = 3
    end
    object dsPaysCHARGE_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'CHARGE_SUMMA'
    end
    object dsPaysCHARGE_ID: TFloatField
      FieldName = 'CHARGE_ID'
      Visible = False
    end
    object dsPaysKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
      Visible = False
    end
    object dsPaysKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsPaysKBKCODE1_ID: TFloatField
      FieldName = 'KBKCODE1_ID'
      Visible = False
    end
    object dsPaysKBKCODE1: TStringField
      DisplayLabel = #1050#1041#1050' '#1087#1083#1072#1090#1105#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'KBKCODE1'
      Size = 1500
    end
    object dsPaysSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsPaysNOTICE_ID: TFloatField
      FieldName = 'NOTICE_ID'
      Visible = False
    end
    object dsPaysDECISION_ID: TFloatField
      FieldName = 'DECISION_ID'
      Visible = False
    end
    object dsPaysPAYMENT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_DATE'
    end
    object dsPaysIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsPaysACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsPaysBUDGET_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1073#1102#1076#1078#1077#1090#1072
      FieldName = 'BUDGET_DATE'
    end
  end
  object srcPays: TDataSource
    DataSet = dsPays
    Left = 80
    Top = 238
  end
end
