inherited qKTSForm: TqKTSForm
  Caption = 'qKTSForm'
  ClientHeight = 306
  ClientWidth = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 432
    Height = 306
    LookAndFeel = LayoutWebLookAndFeel
    inherited btnCancel: TcxButton
      Left = 348
      Top = 274
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Left = 267
      Top = 274
      TabOrder = 4
    end
    inherited edtDateFrom: TcxDBDateEdit
      Left = 47
      Top = 109
      Style.BorderStyle = ebsSingle
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Left = 47
      Top = 137
      Style.BorderStyle = ebsSingle
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 394
    end
    object rgTypeRep: TcxDBRadioGroup [4]
      Left = 9
      Top = 9
      Caption = ' '#1054#1090#1095#1077#1090' '#1087#1086' '#1050#1058#1057', '#1086#1092#1086#1088#1084#1083#1077#1085#1085#1099#1084' '#1074' '
      DataBinding.DataField = 'RTYPE'
      DataBinding.DataSource = srcParam
      ParentColor = False
      ParentFont = False
      Properties.DefaultCaption = #1086#1092#1086#1088#1084#1083#1077#1085#1085#1099#1084' '#1074' '#1086#1090#1095#1077#1090#1085#1086#1084' '#1087#1077#1088#1080#1086#1076#1077
      Properties.DefaultValue = 0
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = #1086#1090#1095#1077#1090#1085#1086#1084' '#1087#1077#1088#1080#1086#1076#1077
          Value = 0
        end
        item
          Caption = #1087#1088#1077#1076#1099#1076#1091#1097#1077#1084' '#1087#1077#1088#1080#1086#1076#1077
          Value = 1
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      TabOrder = 0
      Height = 63
      Width = 397
    end
    object rgTS: TcxDBRadioGroup [5]
      Left = 9
      Top = 178
      Caption = ' '#1055#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1100' '#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1084#1091' '#1089#1086#1102#1079#1091' '
      DataBinding.DataField = 'TS'
      DataBinding.DataSource = srcParam
      ParentColor = False
      ParentFont = False
      Properties.DefaultCaption = #1042#1089#1077
      Properties.DefaultValue = 0
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = #1042#1089#1077
          Value = 0
        end
        item
          Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090' '#1058#1057
          Value = 1
        end
        item
          Caption = #1053#1077' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090' '#1058#1057
          Value = -1
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      TabOrder = 3
      Height = 85
      Width = 414
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = 'cxDBRadioGroup1'
        ShowCaption = False
        Control = rgTypeRep
        ControlOptions.ShowBorder = False
      end
      inherited lgPeriod: TdxLayoutGroup
        LookAndFeel = LayoutWebLookAndFeel
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = 'cxDBRadioGroup1'
        ShowCaption = False
        Control = rgTS
        ControlOptions.ShowBorder = False
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
    MacroAfter = 'SetSummaryBold'
  end
  inherited dsParam: TdxMemData
    object dsParamRTYPE: TIntegerField
      DisplayLabel = #1042#1080#1076' '#1086#1090#1095#1077#1090#1072
      FieldName = 'RTYPE'
    end
    object dsParamTS: TIntegerField
      FieldName = 'TS'
    end
  end
end
