inherited ControlPaymentGridForm: TControlPaymentGridForm
  Width = 596
  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 588
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 283
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 283
      end
      inherited pnlProgress: TPanel
        Width = 283
        inherited lblProgress: TcxLabel
          Width = 283
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 496
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 588
  end
  inherited pnlWorkspace: TPanel
    Width = 588
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 383
      inherited grdData: TcxGrid
        Width = 383
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object colOKPO: TcxGridDBBandedColumn
            Caption = #1054#1050#1055#1054
            DataBinding.FieldName = 'OKPO'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object colINN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'INN'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object colKPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055
            DataBinding.FieldName = 'KPP'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colPaymentDocNumber: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087
            DataBinding.FieldName = 'K92'
            Width = 78
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object colPaymentDocDate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087'/'#1087
            DataBinding.FieldName = 'K93'
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object colChargeSum: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103
            DataBinding.FieldName = 'K94'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object colPaymentSum: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1087'/'#1087
            DataBinding.FieldName = 'K95'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object colPaymentDate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1076#1077#1085#1077#1075
            DataBinding.FieldName = 'K96'
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object colK_VAL: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
            DataBinding.FieldName = 'K_VAL'
            Width = 54
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object colSP: TcxGridDBBandedColumn
            Caption = #1057#1087#1086#1089#1086#1073' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'SP'
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object colPRIZ: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PRIZ'
            Width = 41
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object colWHO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'WHO'
            Width = 41
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object colCRYPT: TcxGridDBBandedColumn
            Caption = #1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'CRYPT'
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object colCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CODE'
            Width = 47
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object colBANK_ID: TcxGridDBBandedColumn
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1073#1072#1085#1082#1072
            DataBinding.FieldName = 'BANK_ID'
            Width = 102
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object colVP: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'VP'
            Width = 61
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object colBK: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1076#1086#1093#1086#1076#1072
            DataBinding.FieldName = 'BK'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object colIRET: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1089#1088#1077#1076#1089#1090#1074
            DataBinding.FieldName = 'IRET'
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object colNblKtc: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NBLKTC1'
            Width = 105
            Position.BandIndex = 0
            Position.ColIndex = 23
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
      '  dbf_dk_pp d,'
      '  fdc_custom_decl_lst cd'
      'where'
      
        '  d.g071 = cd.customs_code and d.g072 = cd.reg_date and d.g073 =' +
        ' cd.decl_no'
      '  and cd.id = :id')
    ParamData = <
      item
        DataType = ftFloat
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
    object dsDataOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 9
    end
    object dsDataK92: TStringField
      FieldName = 'K92'
      Size = 50
    end
    object dsDataK93: TDateTimeField
      FieldName = 'K93'
    end
    object dsDataK94: TFloatField
      FieldName = 'K94'
      DisplayFormat = ',0.00'
    end
    object dsDataK95: TFloatField
      FieldName = 'K95'
      DisplayFormat = ',0.00'
    end
    object dsDataK96: TDateTimeField
      FieldName = 'K96'
    end
    object dsDataK_VAL: TStringField
      FieldName = 'K_VAL'
      Size = 3
    end
    object dsDataPRIZ: TStringField
      FieldName = 'PRIZ'
      Size = 3
    end
    object dsDataWHO: TStringField
      FieldName = 'WHO'
      Size = 1
    end
    object dsDataSP: TStringField
      FieldName = 'SP'
      Size = 2
    end
    object dsDataCRYPT: TStringField
      FieldName = 'CRYPT'
      Size = 10
    end
    object dsDataCODE: TStringField
      FieldName = 'CODE'
    end
    object dsDataBANK_ID: TStringField
      FieldName = 'BANK_ID'
    end
    object dsDataVP: TStringField
      FieldName = 'VP'
      Size = 4
    end
    object dsDataBK: TStringField
      FieldName = 'BK'
      Size = 7
    end
    object dsDataIRET: TIntegerField
      FieldName = 'IRET'
    end
    object dsDataNBLKTC1: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1073#1083#1072#1085#1082#1072' '#1050#1058#1057
      FieldName = 'NBLKTC1'
      Size = 8
    end
  end
end
