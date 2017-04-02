inherited DecisionPaybackDlgForm: TDecisionPaybackDlgForm
  Left = 535
  Top = 290
  ActiveControl = btnOk
  Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1088#1077#1096#1077#1085#1080#1103' '#1089' '#1091#1095#1105#1090#1086#1084' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  ClientHeight = 206
  ClientWidth = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 425
    Height = 206
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BevelKind = bkFlat
    inherited btnCancel: TcxButton
      Left = 327
      Top = 170
      Cancel = True
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 246
      Top = 170
      TabOrder = 5
      OnClick = nil
    end
    object ceDecisionSum: TcxCurrencyEdit [2]
      Left = 129
      Top = 9
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.Nullable = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = 15329769
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 0
      Width = 320
    end
    object ceDebtSum: TcxCurrencyEdit [3]
      Left = 129
      Top = 33
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.Nullable = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = 15329769
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 1
      Width = 327
    end
    object ceDebtPaySum: TcxCurrencyEdit [4]
      Left = 129
      Top = 57
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.Nullable = False
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = ceDebtSumPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clWindow
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 2
      Width = 324
    end
    object ceDebtProcSum: TcxCurrencyEdit [5]
      Left = 129
      Top = 81
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.Nullable = False
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = ceDebtSumPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clWindow
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 3
      Width = 422
    end
    object ceDebtPenySum: TcxCurrencyEdit [6]
      Left = 129
      Top = 105
      BeepOnEnter = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00  ;-,0.00  '
      Properties.Nullable = False
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = ceDebtSumPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clWindow
      Style.HotTrack = False
      StyleDisabled.BorderStyle = ebsUltraFlat
      StyleDisabled.TextColor = clWindowText
      TabOrder = 4
      Width = 324
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        Caption = #1057#1091#1084#1084#1072' '#1088#1077#1096#1077#1085#1080#1103
        Offsets.Left = 5
        Offsets.Right = 10
        Control = ceDecisionSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = #1057#1091#1084#1084#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        Offsets.Left = 5
        Offsets.Right = 10
        Control = ceDebtSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1055#1086' '#1087#1083#1072#1090#1077#1078#1072#1084
        Offsets.Left = 5
        Offsets.Right = 10
        Control = ceDebtPaySum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1055#1086' '#1087#1088#1086#1094#1077#1085#1090#1072#1084
        Offsets.Left = 5
        Offsets.Right = 10
        Control = ceDebtProcSum
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [4]
        Caption = #1055#1086' '#1087#1077#1085#1103#1084
        Offsets.Left = 5
        Offsets.Right = 10
        Control = ceDebtPenySum
        ControlOptions.ShowBorder = False
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        Caption = ''
        Offsets.Left = 5
        Offsets.Right = 10
      end
    end
    object dxLayoutControl1Group1: TdxLayoutGroup
      AutoAligns = [aaHorizontal]
      AlignVert = avBottom
      Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      LayoutDirection = ldHorizontal
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
