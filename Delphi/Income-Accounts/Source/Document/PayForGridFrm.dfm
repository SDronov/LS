inherited PayForGridForm: TPayForGridForm
  Left = 364
  Top = 211
  Caption = 'PayForGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsSelection.CellSelect = False
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'subject_name'
            Width = 155
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'subject_inn'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'subject_kpp'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'summa'
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082
            DataBinding.FieldName = 'rest_summa'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actPayFor: TAction
      Category = 'Data'
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
      Enabled = False
      OnExecute = actPayForExecute
      OnUpdate = actPayForUpdate
    end
    object actRetPayFor: TAction
      Category = 'Data'
      Caption = #1042#1077#1088#1085#1091#1090#1100
      Enabled = False
      OnExecute = actRetPayForExecute
      OnUpdate = actRetPayForUpdate
    end
    object actHistory: TAction
      Category = 'Data'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1077#1088#1077#1074#1086#1076#1086#1074
      OnExecute = actHistoryExecute
      OnUpdate = actHistoryUpdate
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
            Item = dxBarButton3
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
    object dxBarButton1: TdxBarButton
      Action = actPayFor
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actRetPayFor
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = actHistory
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select   po.payment_id'
      '        ,po.subject_id'
      '        ,po.summa'
      '        ,po.subject_name'
      '        ,po.subject_inn'
      '        ,po.subject_kpp'
      '        ,po.po_name'
      '        ,po.po_date'
      '        ,po.po_no'
      '        ,po.po_date'
      '        ,po.currency_id'
      '        ,po.curr_code'
      '        ,po.payer_id'
      '        ,0 as rest_summa'
      '        ,0 AS locked_summa'
      'from fdc_payment_for_lst po'
      'where  po.payment_id = :ID'
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDatasubject_id: TIntegerField
      FieldName = 'subject_id'
    end
    object dsDatasubject_name: TStringField
      FieldName = 'subject_name'
      Size = 1500
    end
    object dsDatasubject_inn: TStringField
      FieldName = 'subject_inn'
      Size = 12
    end
    object dsDatasubject_kpp: TStringField
      FieldName = 'subject_kpp'
      Size = 10
    end
    object dsDatasumma: TFloatField
      FieldName = 'summa'
    end
    object dsDatarest_summa: TFloatField
      FieldName = 'rest_summa'
    end
    object dsDatapayment_id: TIntegerField
      FieldName = 'payment_id'
    end
    object dsDataNAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'PO_NAME'
      Size = 1510
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 51
    Top = 164
    object sqlPayFor: TsqlOp
      SQL.Strings = (
        'begin'
        '  :Result:= p_payment_order.MakePaymentFor('
        '    :ID'
        '    ,:SUBJECT_ID'
        '    ,:SUMMA'
        '    ,:DOC_DATE'
        '    ,:DOC_NO'
        '    ,:DOC_NAME'
        '    );'
        'end;')
    end
    object sqlGetRest: TsqlOp
      SQL.Strings = (
        'begin'
        '  :Result:= p_payment_order.GetRestSumma(:Id)'
        '    - p_payment_order.GetLockedSumma(:Id);'
        'end;')
    end
    object sqlGetPO: TsqlOp
      SQL.Strings = (
        'begin'
        'select p.payer_name,p.payer_inn,p.payer_kpp,p.payer_id '
        ' into  :Decl_Name  ,:Decl_INN  ,:Decl_KPP  ,:DECL_ID'
        'from fdc_payment_order_lst p '
        'where id = :ID;'
        'end;')
    end
  end
end
