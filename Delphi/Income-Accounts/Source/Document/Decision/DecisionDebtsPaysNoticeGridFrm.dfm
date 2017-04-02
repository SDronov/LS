inherited DecisionDebtsPaysNoticeGridForm: TDecisionDebtsPaysNoticeGridForm
  Left = 374
  Top = 238
  Caption = 'DecisionDebtsPaysNoticeGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 400
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 400
      end
      inherited pnlProgress: TPanel
        Width = 400
        inherited lblProgress: TcxLabel
          Width = 400
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 610
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        inherited Label3: TLabel
          Width = 77
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtDeclName: TcxTextEdit
          Width = 167
        end
        inherited edtINN: TcxTextEdit
          Width = 113
        end
        inherited edtKPP: TcxTextEdit
          Width = 113
        end
        inherited edtNomer: TcxTextEdit
          Width = 113
        end
        inherited edtFromDate: TcxDateEdit
          Width = 113
        end
        inherited edtToDate: TcxDateEdit
          Width = 113
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 113
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 113
        end
        inherited edtFromDateActiveted: TcxDateEdit
          Width = 116
        end
        inherited edtToDateActiveted: TcxDateEdit
          Width = 116
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
      28
      0)
  end
  inherited QueryList: TQueryList
    object qryGenerateReserve: TsqlOp
      SQL.Strings = (
        'begin'
        
          '  p_decision_debts.createreserveforpays(pdecisionid => :decision' +
          '_id);'
        'end;')
    end
  end
end
