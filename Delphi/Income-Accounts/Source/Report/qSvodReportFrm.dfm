inherited qSvodReportForm: TqSvodReportForm
  Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1105#1090' '#1087#1086' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103#1084'/'#1074#1099#1073#1099#1090#1080#1103#1084
  ClientHeight = 140
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 140
    inherited btnCancel: TcxButton
      Left = 331
      Top = 117
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 250
      Top = 117
      TabOrder = 5
    end
    inherited edtDateFrom: TcxDBDateEdit
      Properties.OnChange = edtDateFromPropertiesChange
    end
    inherited chbxXML: TcxCheckBox
      Top = 117
      Enabled = False
      TabOrder = 4
    end
    object chBIsActive: TcxDBCheckBox [6]
      Left = 9
      Top = 90
      Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      DataBinding.DataField = 'Is_TS'
      DataBinding.DataSource = srcMemData
      ParentColor = False
      ParentFont = False
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 'Y'
      Properties.ValueUnchecked = 'N'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 405
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lciDateFrom: TdxLayoutItem
        Caption = #1044#1072#1090#1072' c'
      end
      inherited lciDateTo: TdxLayoutItem
        Visible = True
      end
      object dxLayoutControl1Item1: TdxLayoutItem [3]
        ShowCaption = False
        Control = chBIsActive
        ControlOptions.ShowBorder = False
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        inherited lcichbxXML: TdxLayoutItem
          Visible = False
        end
      end
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
  inherited dsMemData: TdxMemData
    object dsMemDatais_ts: TStringField
      FieldName = 'Is_TS'
      Size = 1
    end
  end
  inherited xlrReport: TxlReport
    DataSources = <
      item
        DataSet = dsReport
        Alias = 'dsReport'
        Range = 'rngData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsMemData
        Alias = 'dsValues'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
  end
end
