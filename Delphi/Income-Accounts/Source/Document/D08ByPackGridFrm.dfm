inherited D08ByPackGridForm: TD08ByPackGridForm
  Caption = #1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1074#1086#1079#1074#1088#1072#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 17
      inherited lblRecordCount: TcxLabel
        Height = 17
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 17
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 285
      Height = 17
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 285
        Height = 17
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 17
        end
      end
      inherited pnlProgress: TPanel
        Width = 285
        Height = 17
        inherited lblProgress: TcxLabel
          Height = 17
          Width = 285
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 498
      Top = 3
      Width = 75
      Height = 17
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewKODT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KODT'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNLS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NLS'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_RTU: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_RTU'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDAT_RTU: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_RTU'
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_RTU: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_RTU'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_V: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_V'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDAT_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_DOC'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_DOC'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_VG: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_VG'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDAT_DOCG: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_DOCG'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNUM_DOCG: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NUM_DOCG'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN_K'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKOD_VP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KOD_VP'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_VP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_VP'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_DOC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_DOC'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDAT_SP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAT_SP'
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME_K'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 16
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
      26
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'SELECT *'
      '  FROM DBF_D08_LST'
      '  WHERE doc_pack_id = :ID')
    SourceServerObject = 'DBF_D08_LST'
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    object dsDataKODT: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'KODT'
      Size = 8
    end
    object dsDataNLS: TStringField
      DisplayLabel = #1057#1095#1105#1090' '#1056#1058#1059
      FieldName = 'NLS'
    end
    object dsDataNUM_RTU: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1079' '#1056#1058#1059' '#1074' '#1060#1058#1057
      FieldName = 'NUM_RTU'
      Size = 10
    end
    object dsDataDAT_RTU: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1079' '#1056#1058#1059' '#1074' '#1060#1058#1057
      FieldName = 'DAT_RTU'
    end
    object dsDataDOC_RTU: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072' '#1080#1079' '#1056#1058#1059' '#1074' '#1060#1058#1057
      FieldName = 'DOC_RTU'
      Size = 10
    end
    object dsDataNUM_V: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072' '#1080#1079' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'NUM_V'
      Size = 10
    end
    object dsDataDAT_DOC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1079' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'DAT_DOC'
    end
    object dsDataNUM_DOC: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1080#1079' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'NUM_DOC'
      Size = 10
    end
    object dsDataNUM_VG: TStringField
      DisplayLabel = #8470' '#1092#1080#1085#1072#1083#1100#1085#1086#1075#1086' '#1088#1077#1077#1089#1090#1088#1072' '#1085#1072' '#1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1080#1077' '#1074' '#1082#1072#1079#1085#1072#1095#1077#1081#1089#1090#1074#1086' '#1074' '#1060#1058#1057
      FieldName = 'NUM_VG'
      Size = 10
    end
    object dsDataDAT_DOCG: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1092#1080#1085#1072#1083#1100#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072' '#1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1080#1077' '#1074' '#1060#1058#1057
      FieldName = 'DAT_DOCG'
    end
    object dsDataNUM_DOCG: TStringField
      DisplayLabel = #8470' '#1092#1080#1085#1072#1083#1100#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072' '#1087#1077#1088#1077#1095#1080#1089#1083#1077#1085#1080#1077' '#1074' '#1060#1058#1057
      FieldName = 'NUM_DOCG'
      Size = 10
    end
    object dsDataINN_K: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'INN_K'
      Size = 12
    end
    object dsDataKOD_VP: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'KOD_VP'
      Size = 3
    end
    object dsDataSUM_VP: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
      FieldName = 'SUM_VP'
    end
    object dsDataSUM_DOC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'SUM_DOC'
    end
    object dsDataDAT_SP: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1073#1072#1085#1082#1086#1084
      FieldName = 'DAT_SP'
    end
    object dsDataNAME_K: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'NAME_K'
      Size = 80
    end
    object dsDataUPD_DATE: TDateTimeField
      FieldName = 'UPD_DATE'
    end
    object dsDataUPD_TIME: TStringField
      FieldName = 'UPD_TIME'
      Size = 8
    end
    object dsDataDOC_PACK_ID: TFloatField
      FieldName = 'DOC_PACK_ID'
    end
  end
end
