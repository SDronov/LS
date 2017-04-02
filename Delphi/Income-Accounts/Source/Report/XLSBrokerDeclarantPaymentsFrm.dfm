inherited XLSBrokerDeclarantPayments: TXLSBrokerDeclarantPayments
  Left = 496
  Top = 124
  Caption = 'BrokerDeclarantPayments'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited edtDateFrom: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Properties.DateButtons = []
      Style.IsFontAssigned = True
      Width = 371
    end
  end
  inherited ActionList: TActionList
    Top = 63
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
  inherited xlReport: TxlReport
    Options = []
    OnBeforeBuild = xlReportBeforeBuild
    OnAfterBuild = xlReportAfterBuild
    OnBeforeWorkbookSave = xlReportBeforeWorkbookSave
  end
end
