inherited QuartalReportForm: TQuartalReportForm
  Left = 536
  Top = 199
  Caption = #1042#1099#1073#1086#1088' '#1082#1074#1072#1088#1090#1072#1083#1072
  ClientHeight = 211
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 349
    Height = 211
    inherited btnCancel: TcxButton
      Left = 265
      Top = 179
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 184
      Top = 179
      TabOrder = 2
    end
    object seYear: TcxSpinEdit [2]
      Left = 124
      Top = 9
      ParentFont = False
      Properties.MinValue = 2014.000000000000000000
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      TabOrder = 0
      Value = 2014
      Width = 121
    end
    object rgQuarts: TcxRadioGroup [3]
      Left = 9
      Top = 36
      Caption = #1050#1074#1072#1088#1090#1072#1083#1099':'
      ParentColor = False
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1087#1077#1088#1074#1099#1081
          Value = 0
        end
        item
          Caption = #1074#1090#1086#1088#1086#1081
          Value = 1
        end
        item
          Caption = #1090#1088#1077#1090#1080#1081
          Value = 2
        end
        item
          Caption = #1095#1077#1090#1074#1077#1088#1090#1099#1081
          Value = 3
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Height = 105
      Width = 492
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item2: TdxLayoutItem [0]
        AutoAligns = [aaVertical]
        AlignHorz = ahCenter
        Caption = #1043#1086#1076
        Control = seYear
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = 'cxRadioGroup1'
        ShowCaption = False
        Control = rgQuarts
        ControlOptions.ShowBorder = False
      end
      inherited dxLayoutControl1Group8: TdxLayoutGroup
        AutoAligns = []
      end
    end
  end
  inherited ActionList: TActionList
    Left = 104
    Top = 47
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 132
    Top = 47
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 216
    Top = 47
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 244
    Top = 47
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 160
    Top = 47
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 188
    Top = 47
  end
  inherited dsHeader: TfdcQuery
    Left = 104
    Top = 88
  end
  inherited dsData: TfdcQuery
    Left = 136
    Top = 88
  end
  inherited xlReport: TxlReport
    Left = 168
    Top = 88
  end
  inherited dsParam: TdxMemData
    Left = 240
    Top = 88
    object dsParamDATE_FROM: TDateField
      FieldName = 'DATE_FROM'
    end
    object dsParamDATE_TO: TDateField
      FieldName = 'DATE_TO'
    end
  end
  inherited srcParam: TDataSource
    Left = 288
    Top = 88
  end
end
