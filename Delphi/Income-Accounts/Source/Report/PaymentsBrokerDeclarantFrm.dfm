inherited PaymentsBrokerDeclarantForm: TPaymentsBrokerDeclarantForm
  Left = 512
  Top = 212
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited rgQuarts: TcxRadioGroup
      Height = 186
      Width = 492
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited dxLayoutControl1Item1: TdxLayoutItem
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
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
  inherited xlReport: TxlReport
    OnBeforeBuild = xlReportBeforeBuild
    OnAfterBuild = xlReportAfterBuild
    OnBeforeWorkbookSave = xlReportBeforeWorkbookSave
  end
end
