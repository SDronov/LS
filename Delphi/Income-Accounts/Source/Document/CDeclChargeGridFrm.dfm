inherited CDeclChargeGridForm: TCDeclChargeGridForm
  Left = 245
  Top = 278
  Width = 968
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 952
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 649
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 649
      end
      inherited pnlProgress: TPanel
        Width = 649
        inherited lblProgress: TcxLabel
          Width = 649
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 859
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 952
  end
  inherited pnlWorkspace: TPanel
    Width = 952
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 747
      inherited grdData: TcxGrid
        Width = 747
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsData.Editing = True
          inherited grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewPAYMENT_NAME: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewCHARGE_REST: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited grdDataDBBandedTableViewKBKCODE_CODE: TcxGridDBBandedColumn
            Options.Editing = False
          end
          inherited colChargeMonth: TcxGridDBBandedColumn
            Options.Editing = False
          end
          object columnIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Options.Editing = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object columnACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object columnIS_ARCHIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ImmediatePost = True
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Properties.OnEditValueChanged = columnIS_ARCHIVEPropertiesEditValueChanged
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actCloseDecl: TAction [24]
      Category = 'Object'
      Caption = #1047#1072#1082#1088#1099#1090#1100'...'
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1044#1058' ('#1086#1090#1084#1077#1085#1080#1090#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1080' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1088#1077#1079#1072#1095#1077#1090')'
      OnExecute = actCloseDeclExecute
    end
    object actOpenDecl: TAction [25]
      Category = 'Object'
      Caption = #1042#1077#1088#1085#1091#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1044#1058
      OnExecute = actOpenDeclExecute
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
            BeginGroup = True
            Item = btnChargeHistory
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnCloseGTD
            Visible = True
          end
          item
            Item = btnReturnGTD
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
    object btnCloseGTD: TdxBarButton
      Action = actCloseDecl
      Category = 0
    end
    object btnReturnGTD: TdxBarButton
      Action = actOpenDecl
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select'
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
      ',t.pay_type_id'
      ',t.summa'
      ',t.currency_id'
      ',t.decl_id'
      ',t.payment_code'
      ',t.payment_name'
      ',t.curr_code'
      ',t.curr_name'
      ',t.charge_rest'
      ',t.kbkcode_code'
      ',t.kbkcode_id'
      ',t.charge_month'
      '--,t.is_active'
      ',decode(t.is_active, '#39'A'#39', '#39'N'#39', t.is_active) is_active'
      ',t.activation_date'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      ',t.is_ts'
      ',p_nsi_kbk.IsKbkSalvage(t.kbkcode_code) IS_SALVAGE'
      '  from fdc_decl_charge_lst t'
      ' where'
      '(:Name is null )'
      'and DECL_ID = :DECL_ID')
    object dsDataIS_ACTIVE: TStringField [23]
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField [24]
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_ARCHIVE: TStringField [25]
      DisplayLabel = #1040#1088#1093#1080#1074#1085#1099#1081
      FieldName = 'IS_ARCHIVE'
      ReadOnly = True
      Size = 1
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 200
    Top = 140
    object sqlCloseDeclWithAdvice: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  :advice_id := fdc_custom_decl_close_w_advice(pdeclid => :decl_' +
          'id);'
        '  commit;'
        'end;')
    end
    object sqlReOpen: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_custom_decl_undo_close(pdeclid => :decl_id);'
        '  commit;'
        'end;')
    end
    object sqlSetArchive: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  FOR r IN ( SELECT ID'
        '               FROM fdc_decl_charge_hist_lst dc'
        
          '               WHERE ( dc.decl_id, dc.pay_type_id, dc.currency_i' +
          'd, dc.kbkcode_id) IN'
        
          '                 ( SELECT decl_id, pay_type_id, currency_id, kbk' +
          'code_id'
        '                     FROM fdc_decl_charge_lst'
        '                     WHERE ID = :ID ) ) LOOP'
        '    p_document.DoArchive( r.id );'
        '  END LOOP;'
        'END;')
    end
    object sqlSetDeArchive: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  FOR r IN ( SELECT ID'
        '               FROM fdc_decl_charge_hist_lst dc'
        
          '               WHERE ( dc.decl_id, dc.pay_type_id, dc.currency_i' +
          'd, dc.kbkcode_id) IN'
        
          '                 ( SELECT decl_id, pay_type_id, currency_id, kbk' +
          'code_id'
        '                     FROM fdc_decl_charge_lst'
        '                     WHERE ID = :ID ) ) LOOP'
        '    p_document.DoDeArchive( r.id );'
        '  END LOOP;'
        'END;')
    end
    object sqlCloseDecl: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_custom_decl_close(pdeclid => :decl_id);'
        '  commit;'
        'end;')
    end
    object sqlIsBigPayer: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT as_big_payer'
        '    INTO :result'
        '    FROM fdc_custom_decl_lst'
        '    WHERE id = :decl_id;'
        'END;')
    end
  end
  object dsAdvices: TOracleDataSet
    SQL.Strings = (
      'SELECT DISTINCT c.advice_id'
      '  FROM fdc_advice_charge_lst c'
      '  WHERE c.DECL_ID = :decl_id'
      '    AND c.advice_id > :advice_id')
    Variables.Data = {
      0300000002000000080000003A4445434C5F4944040000000000000000000000
      0A0000003A4144564943455F4944040000000000000000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 525
    Top = 162
  end
end
