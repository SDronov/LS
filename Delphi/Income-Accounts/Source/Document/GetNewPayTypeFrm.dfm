inherited GetNewPayTypeForm: TGetNewPayTypeForm
  Caption = #1053#1086#1074#1099#1081' '#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
  ClientHeight = 152
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 152
    inherited btnCancel: TcxButton
      Top = 120
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Top = 120
      TabOrder = 3
    end
    object edtOldPayType: TcxTextEdit [2]
      Left = 119
      Top = 9
      Enabled = False
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object edtKBK: TcxTextEdit [3]
      Left = 119
      Top = 36
      Enabled = False
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cbNewPayType: TcxDBLookupComboBox [4]
      Left = 119
      Top = 63
      DataBinding.DataField = 'PAY_TYPE_ID'
      DataBinding.DataSource = dsPayType
      ParentFont = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = #1050#1086#1076
          SortOrder = soAscending
          FieldName = 'CODE'
        end
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          FieldName = 'NAME'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListSource = dsList
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 145
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object itemOldPayType: TdxLayoutItem [0]
        Caption = #1057#1090#1072#1088#1099#1081' '#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Enabled = False
        Control = edtOldPayType
        ControlOptions.ShowBorder = False
      end
      object itemKBK: TdxLayoutItem [1]
        Caption = #1050#1041#1050
        Enabled = False
        Control = edtKBK
        ControlOptions.ShowBorder = False
      end
      object itemNewPayType: TdxLayoutItem [2]
        Caption = #1053#1086#1074#1099#1081' '#1074#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Control = cbNewPayType
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
  object dsetPayType: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 88
    Top = 88
    object dsetPayTypePAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
  end
  object dsPayType: TDataSource
    DataSet = dsetPayType
    Left = 160
    Top = 88
  end
  object dsList: TDataSource
    Left = 232
    Top = 88
  end
end
