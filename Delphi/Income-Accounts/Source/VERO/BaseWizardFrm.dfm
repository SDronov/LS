inherited BaseWizardForm: TBaseWizardForm
  BorderStyle = bsSizeable
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited PageControl: TcxPageControl
      Width = 330
      Height = 249
      ClientRectBottom = 248
      ClientRectRight = 329
      inherited tabGeneral: TcxTabSheet
        inherited dxLayoutControl2: TdxLayoutControl
          Width = 328
          Height = 227
          inherited cxLabel1: TcxLabel
            Style.IsFontAssigned = True
          end
        end
      end
    end
  end
  inherited Panel1: TPanel
    ParentBackground = True
  end
  inherited ActionList: TActionList
    inherited actNext: TAction
      Caption = #1044#1072#1083#1077#1077' >'
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
end
