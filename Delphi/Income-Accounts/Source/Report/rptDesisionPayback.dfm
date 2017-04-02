inherited DesisionPaybackRpt: TDesisionPaybackRpt
  Left = 362
  Top = 251
  Caption = #1057#1074#1077#1076#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1072#1093'/'#1079#1072#1095#1077#1090#1072#1093' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  ClientWidth = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 416
    inherited btnCancel: TcxButton
      Left = 332
    end
    inherited btnOk: TcxButton
      Left = 251
    end
    inherited edtDateFrom: TcxDBDateEdit
      Enabled = False
      Style.IsFontAssigned = True
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Style.IsFontAssigned = True
      Width = 371
    end
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 15
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
  inherited dsHeader: TfdcQuery
    Left = 24
    Top = 96
  end
  inherited dsData: TfdcQuery
    Left = 64
    Top = 96
  end
  inherited xlReport: TxlReport
    ActiveSheet = 'TMP'
    MacroAfter = 'CopyToData'
    OnAfterBuild = xlReportAfterBuild
    Left = 104
    Top = 96
  end
  inherited dsParam: TdxMemData
    inherited dsParamDATE_TO: TDateField
      OnChange = dsParamDATE_TOChange
    end
  end
end
