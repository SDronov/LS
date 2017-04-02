inherited ResFDeclGridForm: TResFDeclGridForm
  Left = 307
  Top = 239
  Caption = 'ResFDeclGridForm'
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
          OptionsView.CellAutoHeight = True
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'bdate'
            Width = 86
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'summa'
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
            DataBinding.FieldName = 'customs_code'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'reg_date'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn5: TcxGridDBBandedColumn
            Caption = #1044#1077#1082#1083#1072#1088#1072#1085#1090
            DataBinding.FieldName = 'subject_name'
            Width = 173
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn6: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'subject_inn'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn7: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'subject_kpp'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object colNote: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NOTE'
            OnGetDisplayText = colNoteGetDisplayText
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn8: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'decl_no'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn10: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
            DataBinding.FieldName = 'edate'
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBKCODE'
            Width = 205
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actUnLock: TAction
      Category = 'Data'
      Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actUnLockExecute
      OnUpdate = actUnLockUpdate
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
            Item = dxBarButton2
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
    object dxBarButton2: TdxBarButton
      Action = actUnLock
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      '  from fdc_reserved_for_decl_lst'
      'where payment_id=:ID')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataid: TIntegerField
      FieldName = 'id'
    end
    object dsDatacustoms_code: TStringField
      FieldName = 'customs_code'
      Size = 8
    end
    object dsDatareg_date: TDateTimeField
      FieldName = 'reg_date'
    end
    object dsDatadecl_no: TStringField
      FieldName = 'decl_no'
      Size = 10
    end
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
    object dsDatabdate: TDateTimeField
      FieldName = 'bdate'
    end
    object dsDatasumma: TFloatField
      FieldName = 'summa'
    end
    object dsDataNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 40
      FieldName = 'NOTE'
      Size = 1000
    end
    object dsDataedate: TDateTimeField
      FieldName = 'edate'
    end
    object dsDataKBKCODE_ID: TFloatField
      FieldName = 'KBKCODE_ID'
      Visible = False
    end
    object dsDataKBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 150
      FieldName = 'KBKCODE'
      Size = 1500
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 19
    Top = 108
    object sqlUnlock: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_payment_order.CancelReserve('
        '    :ID'
        '    );'
        'end;')
    end
  end
end
