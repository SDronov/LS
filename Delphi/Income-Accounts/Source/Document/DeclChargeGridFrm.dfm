inherited DeclChargeGridForm: TDeclChargeGridForm
  Left = 202
  Top = 401
  Width = 1012
  Caption = #1050' '#1091#1087#1083#1072#1090#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 996
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
      Width = 693
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 693
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 693
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 693
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 903
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 996
  end
  inherited pnlWorkspace: TPanel
    Width = 996
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 791
      inherited grdData: TcxGrid
        Width = 791
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Width = 20
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Position.ColIndex = 4
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            Width = 101
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_NAME'
            Visible = False
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 190
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCHARGE_REST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_REST'
            PropertiesClassName = 'TcxCalcEditProperties'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE_CODE'
            Width = 161
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colChargeMonth: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CHARGE_MONTH'
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072' '
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actHistory: TAction
      Category = 'Object'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnExecute = actHistoryExecute
      OnUpdate = actHistoryUpdate
    end
    object actDeleteCharge: TAction
      Category = 'Object'
      Caption = #1054#1090#1084#1077#1085#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      OnExecute = C
    end
    object actSalvageChargeReturn: TAction
      Category = 'Object'
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1091#1090#1080#1083#1080#1079#1072#1094#1080#1086#1085#1085#1099#1093' '#1089#1073#1086#1088#1086#1074
      OnExecute = actSalvageChargeReturnExecute
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
            Item = btnChargeHistory
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
            Item = btnDeclChargeCancel
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
    object btnChargeHistory: TdxBarButton
      Action = actHistory
      Category = 0
    end
    object btnDeclChargeCancel: TdxBarButton
      Action = actDeleteCharge
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = actSalvageChargeReturn
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select dc.*'
      '      ,p_nsi_kbk.IsKbkSalvage(dc.kbkcode_code) IS_SALVAGE'
      '  from fdc_decl_charge_lst dc'
      ' where '
      '(:Name is null )'
      'and DECL_ID = :DECL_ID')
    AfterRefresh = dsDataAfterOpen
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
      DisplayFormat = ',0.00'
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
      Visible = False
    end
    object dsDataPAYMENT_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072' ('#1085#1072#1080#1084'.)'
      DisplayWidth = 300
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' ('#1085#1072#1080#1084'.)'
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCHARGE_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'CHARGE_REST'
      DisplayFormat = ',0.00'
    end
    object dsDataKBKCODE_CODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE_CODE'
      Size = 1500
    end
    object dsDataCHARGE_MONTH: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1079#1072' '#1084#1077#1089#1103#1094
      FieldName = 'CHARGE_MONTH'
      DisplayFormat = 'mmm yyyy'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataIS_SALVAGE: TStringField
      FieldName = 'IS_SALVAGE'
      Size = 4000
    end
  end
  inherited srcData: TDataSource
    OnDataChange = srcDataDataChange
  end
  object qryGetErrorCount: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select COUNT( * ) AS C'
      '  from fdc_Object_Lst t'
      ' where t.object_type_id in'
      '       (select id'
      '          from fdc_object_type_lst o'
      '         start with o.sysname = '#39'CustomDeclError'#39
      '        connect by o.parent_object_type_id = prior o.id)'
      '  and t.owner_object_id =  :DECL_ID'
      '')
    Left = 229
    Top = 186
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptInput
      end>
  end
  object qryDeclGetDedSum: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select sum(t.summa) as summ'
      'from fdc_payment_deduction_lst t'
      'where t.decl_id = :DECL_ID and'
      '      t.pay_type_id = :PAY_TYPE_ID and'
      '      t.charge_curr_id = :CURRENCY_ID and'
      '      t.kbkcode_id = :KBKCODE_ID')
    Left = 429
    Top = 138
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PAY_TYPE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptInput
      end>
    object qryDeclGetDedSumSUMM: TFloatField
      FieldName = 'SUMM'
    end
  end
  object qryDeclChargeCancel: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'begin'
      '  :ID ::= p_decl_charge_cancel.add( pdeclid => :DECL_ID,'
      '                                    ppaytypeid => :PAY_TYPE_ID,'
      '                                    psumma => -(:SUMMA),'
      '                                    pcurrencyid => :CURRENCY_ID,'
      '                                    pkbkcodeid => :KBKCODE_ID,'
      
        '                                    pchargemonth => :CHARGE_MONT' +
        'H,'
      
        '                                    ptypesysname => :TYPESYSNAME' +
        ');'
      'end;')
    Left = 429
    Top = 194
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PAY_TYPE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KBKCODE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'CHARGE_MONTH'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptInput
      end>
  end
  object qlCharges: TQueryList
    Session = MainData.Session
    Left = 80
    Top = 174
    object qryIsDocChargeActive: TsqlOp
      SQL.Strings = (
        'BEGIN'
        
          '  if not fdc_object_get_typesysname(:decl_id) in ('#39'SubjectFeeDeb' +
          't'#39','#39'SubjectFeeFine'#39')'
        '  then'
        '  SELECT 1'
        '    INTO :result'
        '    FROM fdc_decl_charge_hist_lst'
        '    WHERE decl_id = :decl_id'
        '      AND is_active = '#39'Y'#39
        '      AND activation_date < trunc( sysdate )'
        '      AND rownum = 1;'
        '  else'
        '  SELECT 1'
        '    INTO :result'
        '    FROM fdc_decl_charge_hist_lst'
        '    WHERE decl_id = :decl_id'
        '      AND is_active = '#39'Y'#39
        '      AND rownum = 1;'
        '  end if;    '
        'EXCEPTION'
        '  WHEN no_data_found THEN'
        '    :result := 0;'
        ''
        '  WHEN OTHERS THEN'
        '    raise;'
        'END;')
    end
    object sqlRegInOutherSystem: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_decl_is_reg_in_ext_sys(:decl_id);'
        'exception '
        '  when OTHERS then '
        '    :result := '#39'Y'#39';'
        'end;')
    end
  end
end
