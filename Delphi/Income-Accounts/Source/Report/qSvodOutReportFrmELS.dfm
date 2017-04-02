inherited qSvodOutReportFormELS: TqSvodOutReportFormELS
  Left = 425
  Top = 197
  Caption = #1057#1074#1086#1076#1085#1099#1081' '#1086#1090#1095#1105#1090' '#1087#1086' '#1074#1099#1073#1099#1090#1080#1103#1084' '#1045#1051#1057
  ClientHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 210
    inherited btnCancel: TcxButton
      Top = 178
    end
    inherited btnOk: TcxButton
      Top = 178
    end
    inherited edtDateFrom: TcxDBDateEdit
      Top = 15
      Width = 121
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Top = 69
      Width = 145
    end
    inherited chbxXML: TcxCheckBox
      Top = 178
      Enabled = False
    end
    inherited edtDateTo: TcxDBDateEdit
      Top = 42
      Width = 381
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = 'cxRadioGroup1'
        ShowCaption = False
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
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0500000004000000090009004461746546726F6D00
      040000000900070044617465546F000800000006000700437572724964009001
      000001000900437572724E616D65003200000001000900547970654E616D6500}
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
  inherited dsXML: TfdcQuery
    Left = 368
    Top = 24
  end
  object dsReportOut: TfdcQuery
    DataSource = srcMemData
    ReadOnly = False
    Left = 296
    Top = 104
  end
end
