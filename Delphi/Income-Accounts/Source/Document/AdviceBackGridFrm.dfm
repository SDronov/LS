inherited AdviceBackGridForm: TAdviceBackGridForm
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        inherited edtName: TcxTextEdit
          Width = 182
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_advice_back_lst'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '/*$STATE_EXPRESSION$*/'
      '   and rownum <= :MaxRecordCount')
  end
end
