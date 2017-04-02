inherited qSpecifyTargetKBKReportForm: TqSpecifyTargetKBKReportForm
  Caption = #1054#1090#1095#1105#1090' '#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1094#1077#1083#1077#1074#1086#1075#1086' '#1050#1041#1050
  ClientHeight = 137
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 137
    inherited btnCancel: TcxButton
      Top = 105
    end
    inherited btnOk: TcxButton
      Top = 105
    end
    inherited edtDateFrom: TcxDBDateEdit
      Width = 121
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Width = 145
    end
    inherited chbxXML: TcxCheckBox
      Top = 105
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lciDateTo: TdxLayoutItem
        Visible = True
      end
      inherited lciCurrency: TdxLayoutItem
        Visible = False
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
  inherited xlrReport: TxlReport
    DataSources = <
      item
        DataSet = dsMemData
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsReport
        Alias = 'aReport'
        Range = 'rngReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
  end
  inherited dsValueSys: TOracleDataSet
    SQL.Strings = (
      'select'
      '*'
      'from'
      '  fdc_value_lst_sys'
      'where 0 = 1')
  end
end
