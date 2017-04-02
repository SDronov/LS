inherited ControlIschGridForm: TControlIschGridForm
  Caption = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1103' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
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
          object colGoodNumber: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
            DataBinding.FieldName = 'G32'
            Width = 49
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object colG470: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'G470'
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object colPaymentType: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'G471'
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colPaymentSubType: TcxGridDBBandedColumn
            Caption = #1055#1086#1076#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'G471_1'
            Width = 57
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object colG472: TcxGridDBBandedColumn
            Caption = #1054#1089#1085#1086#1074#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'G472'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object colRate: TcxGridDBBandedColumn
            Caption = #1057#1090#1072#1074#1082#1072
            DataBinding.FieldName = 'G473'
            FooterAlignmentHorz = taRightJustify
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object colG4731: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1089#1090#1072#1074#1082#1080
            DataBinding.FieldName = 'G4731'
            Width = 59
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object colRateCurrency: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072' '#1089#1090#1072#1074#1082#1080
            DataBinding.FieldName = 'G4732'
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object colG4733: TcxGridDBBandedColumn
            Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1089#1090#1072#1074#1082#1080
            DataBinding.FieldName = 'G4733'
            Width = 118
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object colSum: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'G474'
            Width = 106
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object colSumCurrency: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072' '#1089#1091#1084#1084#1099
            DataBinding.FieldName = 'G4741'
            Width = 54
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object colPaymentMethod: TcxGridDBBandedColumn
            Caption = #1057#1087#1086#1089#1086#1073' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'G475'
            Width = 58
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object colReserve: TcxGridDBBandedColumn
            Caption = #1056#1077#1079#1077#1088#1074
            DataBinding.FieldName = 'NPP'
            Width = 55
            Position.BandIndex = 0
            Position.ColIndex = 17
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
      '  dbf_dkisch d,'
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
    object dsDataG32: TFloatField
      FieldName = 'G32'
    end
    object dsDataG470: TStringField
      FieldName = 'G470'
      Size = 1
    end
    object dsDataG471: TStringField
      FieldName = 'G471'
      Size = 4
    end
    object dsDataG471_1: TStringField
      FieldName = 'G471_1'
      Size = 1
    end
    object dsDataG472: TFloatField
      FieldName = 'G472'
      DisplayFormat = ',0.00'
    end
    object dsDataG473: TFloatField
      FieldName = 'G473'
    end
    object dsDataG4731: TStringField
      FieldName = 'G4731'
      Size = 1
    end
    object dsDataG4732: TStringField
      FieldName = 'G4732'
      Size = 3
    end
    object dsDataG4733: TStringField
      FieldName = 'G4733'
      Size = 3
    end
    object dsDataG474: TFloatField
      FieldName = 'G474'
      DisplayFormat = ',0.00'
    end
    object dsDataG4741: TStringField
      FieldName = 'G4741'
      Size = 3
    end
    object dsDataG475: TStringField
      FieldName = 'G475'
      Size = 2
    end
    object dsDataNPP: TFloatField
      FieldName = 'NPP'
    end
  end
end
