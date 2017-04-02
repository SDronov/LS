inherited CustomDeclErrorGridForm: TCustomDeclErrorGridForm
  Width = 686
  Caption = 'CustomDeclErrorGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 678
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 373
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 373
      end
      inherited pnlProgress: TPanel
        Width = 373
        inherited lblProgress: TcxLabel
          Width = 373
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 586
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 678
  end
  inherited pnlWorkspace: TPanel
    Width = 678
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 473
      inherited grdData: TcxGrid
        Width = 473
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction [3]
      Visible = False
    end
    inherited actSaveToFile: TAction [4]
    end
    inherited actCopySelection: TAction [5]
    end
    inherited actCopyAll: TAction [6]
    end
    inherited actFilterByCell: TAction [7]
    end
    inherited actFilterExcludeCell: TAction [8]
    end
    inherited actClearFilter: TAction [9]
    end
    inherited actOpen: TAction [10]
    end
    inherited actAdd: TAction [11]
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actDebt: TAction
      Category = 'Object'
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      Hint = #1055#1077#1088#1077#1074#1077#1089#1090#1080' '#1074' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
    end
    object actExecute: TAction
      Category = 'Object'
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
      OnExecute = actExecuteExecute
      OnUpdate = actExecuteUpdate
    end
    object actPay: TAction
      Caption = #1054#1087#1083#1072#1090#1080#1090#1100'...'
      OnExecute = actPayExecute
      OnUpdate = actPayUpdate
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
            Item = btnPay
            Visible = True
          end
          item
            Item = btnExecute
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
    object btnExecute: TdxBarButton
      Action = actExecute
      Category = 0
    end
    object btnPay: TdxBarButton
      Action = actPay
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Filtered = True
    SQL.Strings = (
      'select *'
      '  from fdc_custom_decl_error_lst t'
      ' where t.owner_object_id =  :ID')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 184
    Top = 140
    object sqlReparse: TsqlOp
      SQL.Strings = (
        'declare '
        '  vNTRCnt number := 0;'
        'begin'
        '  select count(ntr)'
        '    into vNTRCnt'
        '    from dbf_pp_plt_lst'
        '   where id = :sysname; '
        '  if vNTRCnt > 0 then'
        '    -- '#1044#1086#1073#1072#1074#1083#1103#1077#1084' '#1074' '#1089#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1074#1085#1077' '#1094#1080#1082#1083#1072
        '    p_cdecl_loader_ex.AddPaymentToReParseList(pid => :sysname);'
        '  else'
        '    -- Call the procedure'
        
          '    p_cdecl_loader_ex.reparsepayments(pdeclid => :OWNER_OBJECT_I' +
          'D,'
        '                                      pid => :sysname);'
        '    -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '    p_document.doactivatebuffer;'
        '    commit;'
        '  end if;'
        'end;')
      DataSet = dsData
    end
    object sqlStartPay: TsqlOp
      SQL.Strings = (
        'begin'
        '  :result := fdc_decl_prepare_payment(pdeclid => :decl_id,'
        '                                      pcurrid => :currency_id,'
        '                                      pKbkId  => :kbkcode_Id);'
        'end;')
      DataSet = dsRestList
    end
    object sqlCheckPayments: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  if fdc_object_get_typesysname(pID => :owner_object_id) <> '#39'Sub' +
          'jectFeeFine'#39' then'
        '    fdc_decl_check_payments(pdeclid => :owner_object_id);'
        '  end if;'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
    object sqlReparseReg: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_argmt_loader.reparse(pid => :OWNER_OBJECT_ID);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
    object sqlReparseTempAdm: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_cdecl_loader_ex.ReparseTempAdm('
        '    pdeclid => :OWNER_OBJECT_ID,'
        '    pid => :sysname    '
        '    );'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        'end;')
      DataSet = dsData
    end
    object sqlGetSubject: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_RegDate date;'
        '  r_Tr       fdc_tr_lst%rowtype;'
        'begin'
        
          '  If fdc_object_get_typesysname(:DECL_ID) not in ('#39'TR'#39','#39'TrDuplic' +
          'ate'#39') THEN'
        '   select subject_id into :result'
        '    from fdc_obligation_doc_lst'
        '   where id=:DECL_ID;'
        '  else'
        '   select * into r_Tr from fdc_tr_lst where id = :DECL_ID; '
        '   if r_tr.reg_date >=to_date('#39'01012011'#39','#39'ddmmyyyy'#39') then'
        '      :result := r_TR.carrier_id;'
        '   else'
        '      :result := r_TR.subject_id;'
        '   end if; '
        '  end if; '
        'end;'
        '')
    end
    object sqlReparsePaymentTPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_tpo_loader.reparsepayments(pTPOID => :OWNER_OBJECT_ID,'
        '                               pID    => :sysname);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
    object sqlReIdentGTD: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_cdecl_loader_ex.ReIdentCustomDecl(pId => :OWNER_OBJECT_ID,'
        '                                    pErrorId => :ID);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
    object sqlReIdentTPO: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_tpo_loader.ReIdentTPO(pId => :OWNER_OBJECT_ID,'
        '                                    pErrorId => :ID);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
    object sqlActivateBuffer: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_document.doactivatebuffer;'
        'end;')
    end
    object sqlAddForReparse: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_cdecl_loader_ex.AddPaymentToReParseList(pid => :sysname);'
        'end;')
      DataSet = dsData
    end
    object sqlReparsePaymentsList: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  p_cdecl_loader_ex.reparsepaymentslist(pdeclid => :OWNER_OBJECT' +
          '_ID);'
        '  -- '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        '  p_document.doactivatebuffer;'
        '  --'
        '  commit;'
        'end;')
      DataSet = dsData
    end
  end
  object dsRestList: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT decl_id'
      '      ,currency_id'
      '      ,kbkcode_id'
      '      ,SUM( summ ) AS summ'
      '      ,rate_date'
      '  FROM ('
      '    SELECT t.decl_id'
      '          ,t.currency_id'
      '          ,t.kbkcode_id'
      '          ,t.charge_rest summ'
      '          ,fdc_decl_get_rate_date(t.decl_id) rate_date'
      '      FROM fdc_decl_charge_lst t'
      '      WHERE t.decl_id = :id'
      '    UNION ALL'
      '    SELECT nc.decl_id'
      '          ,nc.currency_id'
      '          ,nc.kbkcode_id'
      '          ,- ( nc.summa - nc.payed - nc.reserved_pay ) AS summ'
      '          ,fdc_decl_get_rate_date(nc.decl_id) rate_date'
      '      FROM fdc_noticepay_charge_lst nc'
      '      WHERE nc.decl_id = :id'
      '    )'
      '  GROUP BY decl_id, currency_id, kbkcode_id, rate_date '
      '  HAVING SUM( summ ) > 0')
    Left = 96
    Top = 172
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
