inherited DocReuseAmountDlgForm: TDocReuseAmountDlgForm
  Left = 538
  Top = 254
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1087#1077#1088#1077#1079#1072#1095#1105#1090#1072
  ClientHeight = 98
  ClientWidth = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 392
    Height = 98
    inherited btnCancel: TcxButton
      Left = 308
      Top = 66
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 227
      Top = 66
      TabOrder = 2
    end
    object ceReuseAmount: TcxDBCurrencyEdit [2]
      Left = 63
      Top = 36
      DataBinding.DataField = 'AMOUNT'
      DataBinding.DataSource = dsParams
      ParentFont = False
      Properties.OnChange = ceReuseAmountPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object ceMaxSum: TcxCurrencyEdit [3]
      Left = 63
      Top = 9
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 0
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object itemMax: TdxLayoutItem [0]
        Caption = #1052#1072#1082#1089#1080#1084#1091#1084' '
        Visible = False
        Control = ceMaxSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [1]
        Caption = #1057#1091#1084#1084#1072
        Control = ceReuseAmount
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Top = 55
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 55
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 55
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Top = 55
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Top = 55
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Top = 55
  end
  object dsetParams: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 264
    Top = 40
    object dsetParamsAMOUNT: TCurrencyField
      FieldName = 'AMOUNT'
    end
  end
  object dsParams: TDataSource
    DataSet = dsetParams
    Left = 328
    Top = 40
  end
end
