inherited RestByPOGridForm: TRestByPOGridForm
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074' '#1085#1072' '#1055#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUM
            end
            item
              Kind = skSum
              Column = grdDataDBBandedTableViewLOCK_SUM
            end
            item
              Kind = skSum
              Column = grdDataDBBandedTableViewAVAIL_SUM
            end>
          OptionsView.Footer = True
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBK'
            Width = 222
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 153
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOCK_SUM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOCK_SUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 189
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAVAIL_SUM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AVAIL_SUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 167
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPREPAYMENTORREUSE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PREPAYMENTORREUSE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ReadOnly = False
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Width = 72
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 5
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
    object actLock: TAction
      Category = 'Data'
      Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      Hint = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1089#1088#1077#1076#1089#1090#1074#1072' '#1087#1086' '#1080#1079#1073#1088#1072#1085#1085#1086#1084#1091' '#1050#1041#1050' '
      OnExecute = actLockExecute
      OnUpdate = actLockUpdate
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
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = btnLock
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
    object btnLock: TdxBarButton
      Action = actLock
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'SELECT r.kbk'
      '      ,p_nsi_kbk.GetIdByCode(r.kbk) AS kbk_id'
      '      ,r.reg_sum AS Rest_Sum'
      '      ,(SELECT nvl(SUM(res.summa), 0)'
      '         FROM fdc_reserved_payment_lst res'
      '        WHERE res.payment_id = r.payment_id'
      '          AND res.kbkcode = r.kbk'
      '          AND res.edate IS NULL) AS Lock_Sum'
      '      ,r.reg_sum - (SELECT nvl(SUM(res.summa), 0)'
      '                      FROM fdc_reserved_payment_lst res'
      '                     WHERE res.payment_id = r.payment_id'
      '                       AND res.kbkcode = r.kbk'
      '                       AND res.edate IS NULL) AS Avail_Sum'
      
        '      ,CASE WHEN  p_nsi_kbk.GetPrePaymentKbkIs(  p_nsi_kbk.GetId' +
        'ByCode(r.kbk) ) = '#39'Y'#39' OR'
      
        '                  p_payment_order.GetDeductionReuseIs(r.payment_' +
        'id) = 1 THEN 1 ELSE 0 END PrepaymentOrReuse'
      '      ,p_nsi_kbk.IsKbkTS(r.kbk) AS is_ts'
      '  FROM fdc_rest_reg r'
      ' WHERE r.payment_id = :ID'
      '   AND r.reg_sum > 0')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataKBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
    object dsDataKBK_ID: TFloatField
      FieldName = 'KBK_ID'
      Visible = False
    end
    object dsDataREST_SUM: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 50
      FieldName = 'REST_SUM'
    end
    object dsDataLOCK_SUM: TFloatField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
      DisplayWidth = 50
      FieldName = 'LOCK_SUM'
    end
    object dsDataAVAIL_SUM: TFloatField
      DisplayLabel = #1044#1086#1089#1090#1091#1087#1085#1086
      DisplayWidth = 50
      FieldName = 'AVAIL_SUM'
    end
    object dsDataPREPAYMENTORREUSE: TFloatField
      DisplayLabel = #1040#1074#1072#1085#1089'/'#1047#1072#1095#1105#1090
      FieldName = 'PREPAYMENTORREUSE'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 19
    Top = 108
    object sqlLock: TsqlOp
      SQL.Strings = (
        'begin'
        '  :Result:= FDC_MakeReserveForDecl_Rights('
        '    :CUSTOMS_CODE'
        '    ,:REG_DATE'
        '    ,:DECL_NO'
        '    ,:SUBJECT_ID'
        '    ,:ID'
        '    ,:SUMMA'
        '    ,'#39'D'#39
        '    ,sysdate'
        '    ,pNote => :Note'
        '    ,pKBKCODE_ID => :KBK'
        '    );'
        'end;')
    end
  end
end
