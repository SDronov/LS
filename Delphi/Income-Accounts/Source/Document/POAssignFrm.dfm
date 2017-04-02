inherited POAssignForm: TPOAssignForm
  Left = 463
  Top = 385
  Caption = #1056#1072#1079#1073#1080#1074#1082#1072' '#1087#1086' '#1087#1083#1072#1090#1077#1078#1082#1072#1084
  ClientHeight = 145
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 145
    inherited btnCancel: TcxButton
      Top = 113
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Top = 113
      ModalResult = 0
      TabOrder = 4
    end
    object edtPODeduct: TcxCurrencyEdit [2]
      Left = 105
      Top = 57
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = OfficeEditStyleController
      TabOrder = 2
      Width = 223
    end
    object edtSumma: TcxCurrencyEdit [3]
      Left = 105
      Top = 81
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Width = 223
    end
    object edtLimit: TcxCurrencyEdit [4]
      Left = 105
      Top = 9
      ParentFont = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.EditFormat = ',0.00;-,0.00'
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clSilver
      Style.StyleController = OfficeEditStyleController
      TabOrder = 0
      Width = 222
    end
    object cmbxPO: TcxLookupComboBox [5]
      Left = 105
      Top = 33
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 450
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 150
          FieldName = 'NAME'
        end
        item
          Width = 180
          FieldName = 'KBKCODE'
        end
        item
          RepositoryItem = cxEditRepository1CurrencyItem1
          Width = 120
          FieldName = 'SUMMA'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = srcData
      Properties.OnChange = cmbxPOPropertiesChange
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 222
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item4: TdxLayoutItem [0]
        Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1074#1077#1088#1085#1091#1090#1100
        Control = edtLimit
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [1]
        Caption = #1055#1083#1072#1090'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
        Control = cmbxPO
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = #1057#1091#1084#1084#1072' '#1091#1087#1083#1072#1095#1077#1085#1085#1072#1103
        Control = edtPODeduct
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [3]
        Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
        Control = edtSumma
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    inherited actOk: TAction
      OnUpdate = actOkUpdate
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  object srcData: TDataSource
    Left = 24
    Top = 128
  end
  object cxEditRepository1: TcxEditRepository
    Left = 64
    Top = 96
    object cxEditRepository1CurrencyItem1: TcxEditRepositoryCurrencyItem
      Properties.DisplayFormat = ',0.00;-,0.00'
    end
  end
end
