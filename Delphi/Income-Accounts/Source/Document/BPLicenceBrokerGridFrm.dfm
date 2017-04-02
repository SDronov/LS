inherited BPLicenceBrokerGridForm: TBPLicenceBrokerGridForm
  Caption = 'BPLicenceBrokerGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
      end
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
            Caption = #1041#1088#1086#1082#1077#1088
            Width = 269
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'INN'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'KPP'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFROM_DATE: TcxGridDBBandedColumn
            Caption = #1053#1072#1095#1072#1083#1086' '#1076#1077#1081#1089#1090#1074#1080#1103
            DataBinding.FieldName = 'FROM_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTO_DATE: TcxGridDBBandedColumn
            Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
            DataBinding.FieldName = 'TO_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 8
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
      'select *'
      '  from fdc_bp_licence_broker_lst t'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      'and t.licence_id = :id')
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
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataLICENCE_ID: TFloatField
      FieldName = 'LICENCE_ID'
    end
    object dsDataFROM_DATE: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086
      FieldName = 'FROM_DATE'
    end
    object dsDataTO_DATE: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      FieldName = 'TO_DATE'
    end
    object dsDataBROKER_ID: TFloatField
      FieldName = 'BROKER_ID'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 64
    Top = 140
    object sqlAdd: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  -- Call the procedure'
        '  fdc_bp_licence_broker_add(plicenceid => :lid'
        '                           ,pbrokerid  => :bid'
        '                           ,pFromDate  => :bdate'
        '                           ,pToDate    => :edate);'
        'END;')
    end
    object sqlDel: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  fdc_bp_licence_broker_del(plicenceid => :licence_id,'
        '                            pbrokerid => :id);'
        'end;')
      DataSet = dsData
    end
    object sqlModify: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  -- Call the procedure'
        '  fdc_bp_licence_broker_upd(plicenceid => :lid'
        '                           ,pbrokerid  => :bid'
        '                           ,pFromDate  => :bdate'
        '                           ,pToDate    => :edate);'
        'END;')
    end
  end
end
