inherited qSvodOutReportForm: TqSvodOutReportForm
  Left = 515
  Top = 464
  Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1105#1090' '#1087#1086' '#1074#1099#1073#1099#1090#1080#1103#1084
  ClientHeight = 187
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 187
    inherited btnCancel: TcxButton
      Top = 155
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Top = 155
      TabOrder = 5
    end
    inherited edtDateFrom: TcxDBDateEdit
      Top = 71
      TabOrder = 1
      Width = 121
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Top = 125
      TabOrder = 3
      Width = 145
    end
    inherited chbxXML: TcxCheckBox
      Top = 155
      Enabled = False
      TabOrder = 4
    end
    inherited edtDateTo: TcxDBDateEdit
      Top = 98
      TabOrder = 2
      Width = 381
    end
    object rgReportType: TcxRadioGroup [6]
      Left = 9
      Top = 9
      Caption = ' '#1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1076#1072#1090#1077' '
      ParentColor = False
      ParentFont = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = #1088#1077#1077#1089#1090#1088#1072
          Value = '0'
        end
        item
          Caption = #1074#1082#1083#1102#1095#1077#1085#1080#1103' '#1074' '#1086#1073#1097#1080#1081' '#1088#1077#1077#1089#1090#1088
          Value = '1'
        end>
      ItemIndex = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = OfficeEditStyleController
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Height = 56
      Width = 422
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = 'cxRadioGroup1'
        ShowCaption = False
        Control = rgReportType
        ControlOptions.ShowBorder = False
      end
      inherited lciDateFrom: TdxLayoutItem
        Caption = #1044#1072#1090#1072' c'
      end
      inherited lciDateTo: TdxLayoutItem
        Visible = True
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
    object dsMemDataTypeName: TStringField
      FieldName = 'TypeName'
      Size = 50
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
  object dsReportOut: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 296
    Top = 104
  end
end
