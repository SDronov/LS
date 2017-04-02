inherited qCheckSvedUnionAccForm: TqCheckSvedUnionAccForm
  Left = 494
  Top = 542
  Caption = #1060#1072#1082#1090#1099' '#1086#1073#1098#1077#1076#1080#1085#1077#1085#1080#1103' '#1051#1057
  ClientHeight = 172
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 172
    inherited btnCancel: TcxButton
      Left = 486
      Top = 144
    end
    inherited btnOk: TcxButton
      Left = 405
      Top = 144
    end
    inherited edtDateFrom: TcxDBDateEdit
      Width = 121
    end
    inherited cmbxCurrency: TfdcObjectLookupEdit
      Width = 145
    end
    inherited chbxXML: TcxCheckBox
      Top = 144
    end
    inherited edtDateTo: TcxDBDateEdit
      Width = 381
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lciDateTo: TdxLayoutItem
        Visible = True
      end
      inherited dxLayoutControl1Group1: TdxLayoutGroup
        inherited dxLayoutControl1Group3: TdxLayoutGroup
          inherited lciINN: TdxLayoutItem
            Visible = False
          end
          inherited lciPayType: TdxLayoutItem
            Visible = False
          end
        end
        inherited lciKPP: TdxLayoutItem
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
        DataSet = dsReport
        Alias = 'dsReport'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsMemData
        Alias = 'dsMemData'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
  end
  inherited dsReport: TfdcQuery
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_TO'
        ParamType = ptUnknown
      end>
  end
end
