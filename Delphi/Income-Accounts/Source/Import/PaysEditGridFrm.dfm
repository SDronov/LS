inherited PaysEditGridForm: TPaysEditGridForm
  Left = 341
  Top = 342
  Width = 898
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072' '#1087#1083#1072#1090#1077#1078#1072
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 890
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 584
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 584
      end
      inherited pnlProgress: TPanel
        Width = 584
        inherited lblProgress: TcxLabel
          Width = 584
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 797
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 890
  end
  inherited pnlWorkspace: TPanel
    Width = 890
    inherited pnlGrid: TPanel
      Width = 622
      inherited grdData: TcxGrid
        Width = 622
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OptionsBehavior.ImmediateEditor = True
          OptionsData.Editing = True
          Preview.MaxLineCount = 4
          object grdDataDBBandedTableViewDAT_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_DOC'
            Width = 66
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_DOC'
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_K'
            Width = 65
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP_K'
            Width = 63
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_K'
            Width = 233
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewT_PL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'T_PL'
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.DropDownAutoSize = True
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.ImmediatePost = True
            Properties.KeyFieldNames = 'CODE'
            Properties.ListColumns = <
              item
                FieldName = 'CODE'
              end
              item
                FieldName = 'NAME'
              end>
            Properties.ListSource = DictData.srcPayTypes
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_DOC'
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKODV: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KODV'
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINFO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INFO'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAutoFilter: TAction
      Checked = True
    end
    inherited actAutoPreview: TAction
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
      28
      0)
  end
  inherited srcData: TDataSource
    DataSet = OracleDataSet1
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'select '
      't.nref'
      ',t.dat_doc'
      ',t.num_doc'
      ',t.inn_k'
      ',t.kpp_k'
      ',t.name_k'
      ',t.sum_doc'
      ',t.kodv'
      ',i.t_pl'
      ',t.info1||t.info2||t.info3||t.info4 info'
      ' from tmp_pays t, '
      ' (select i.nref, max(i.t_pl) t_pl from tmp_infs i '
      '  /* where i.load_id = p_loader.CurrentSession*/'
      '   group by i.nref) i'
      'where'
      '/* t.load_id = p_loader.CurrentSession'
      ' and */'
      ' i.nref = t.nref')
    QBEDefinition.QBEFieldDefs = {
      040000000A000000070000004441545F444F43010000000000070000004E554D
      5F444F4301000000000005000000494E4E5F4B010000000000050000004B5050
      5F4B010000000000060000004E414D455F4B01000000000004000000545F504C
      01000000000004000000494E464F0100000000000700000053554D5F444F4301
      0000000000040000004B4F4456010000000000040000004E5245460100000000
      00}
    LockingMode = lmNone
    OnApplyRecord = OracleDataSet1ApplyRecord
    UpdatingTable = 'dbf_infs'
    CommitOnPost = False
    Session = MainData.Session
    DesignActivation = True
    AfterOpen = OracleDataSet1AfterOpen
    Left = 128
    Top = 166
    object OracleDataSet1DAT_DOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DAT_DOC'
      ReadOnly = True
    end
    object OracleDataSet1NUM_DOC: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM_DOC'
      ReadOnly = True
      Size = 10
    end
    object OracleDataSet1INN_K: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN_K'
      ReadOnly = True
      Size = 12
    end
    object OracleDataSet1KPP_K: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP_K'
      ReadOnly = True
      Size = 9
    end
    object OracleDataSet1NAME_K: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME_K'
      ReadOnly = True
      Size = 80
    end
    object OracleDataSet1T_PL: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083'.'
      FieldName = 'T_PL'
      Required = True
      Size = 2
    end
    object OracleDataSet1INFO: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'INFO'
      ReadOnly = True
      Size = 280
    end
    object OracleDataSet1SUM_DOC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_DOC'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object OracleDataSet1KODV: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'KODV'
      ReadOnly = True
      Size = 3
    end
    object OracleDataSet1NREF: TStringField
      FieldName = 'NREF'
      Required = True
      Visible = False
      Size = 25
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 168
    Top = 174
    object sqlUpd: TsqlOp
      SQL.Strings = (
        'update tmp_infs t set t.t_pl = :t_pl where t.nref = :nref')
      DataSet = OracleDataSet1
    end
  end
end
