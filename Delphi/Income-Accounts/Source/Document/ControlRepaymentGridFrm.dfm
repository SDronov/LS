inherited ControlRepaymentGridForm: TControlRepaymentGridForm
  Caption = #1054#1090#1089#1088#1086#1095#1082#1080
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
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object colGB0: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'GB0'
            Width = 62
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object colPaymentType: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'GB1'
            Width = 63
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object colPaymentSubType: TcxGridDBBandedColumn
            Caption = #1055#1086#1076#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'GB1_1'
            Width = 64
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colSum: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'GB2'
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object colCurrencyCode: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'GB3'
            Width = 55
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object colGB5: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1080#1076#1072' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'GB5'
            Width = 84
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object colNDOC: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'NDOC'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object colSTAV: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1074#1082#1072' '#1082#1088#1077#1076#1080#1090#1072
            DataBinding.FieldName = 'STAV'
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object colPRCS: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1094#1077#1085#1090#1086#1074
            DataBinding.FieldName = 'PRCS'
            Width = 75
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object colG48: TcxGridDBBandedColumn
            Caption = #1057#1088#1086#1082' '#1091#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'G48'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOpen: TAction
      Visible = False
    end
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    inherited actSearchOk: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
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
      'select'
      '  d.*'
      'from'
      '  dbf_dkoprp d,'
      '  fdc_custom_decl_lst cd'
      'where'
      
        '  d.g071 = cd.customs_code and d.g072 = cd.reg_date and d.g073 =' +
        ' cd.decl_no'
      '  and cd.id = :id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    inherited dsDataNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataG071: TStringField
      FieldName = 'G071'
      Size = 8
    end
    object dsDataG072: TDateTimeField
      FieldName = 'G072'
    end
    object dsDataG073: TStringField
      FieldName = 'G073'
      Size = 7
    end
    object dsDataGB0: TStringField
      FieldName = 'GB0'
      Size = 1
    end
    object dsDataGB1: TStringField
      FieldName = 'GB1'
      Size = 4
    end
    object dsDataGB1_1: TStringField
      FieldName = 'GB1_1'
      Size = 1
    end
    object dsDataGB2: TFloatField
      FieldName = 'GB2'
      DisplayFormat = ',0.00'
    end
    object dsDataGB3: TStringField
      FieldName = 'GB3'
      Size = 3
    end
    object dsDataGB5: TStringField
      FieldName = 'GB5'
      Size = 2
    end
    object dsDataNDOC: TStringField
      FieldName = 'NDOC'
      Size = 15
    end
    object dsDataSTAV: TFloatField
      FieldName = 'STAV'
    end
    object dsDataPRCS: TFloatField
      FieldName = 'PRCS'
    end
    object dsDataG48: TDateTimeField
      FieldName = 'G48'
    end
  end
end
