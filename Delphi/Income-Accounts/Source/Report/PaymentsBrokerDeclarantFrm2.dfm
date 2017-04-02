inherited PaymentsBrokerDeclarantForm2: TPaymentsBrokerDeclarantForm2
  Left = 360
  Top = 181
  Caption = 'PaymentsBrokerDeclarantForm2'
  ClientHeight = 267
  ClientWidth = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 337
    Height = 267
    inherited btnCancel: TcxButton
      Left = 253
      Top = 235
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 172
      Top = 235
      TabOrder = 1
    end
    object PC: TcxPageControl [2]
      Left = 9
      Top = 9
      Width = 552
      Height = 193
      ActivePage = tsPeriod
      Align = alClient
      TabOrder = 0
      ClientRectBottom = 192
      ClientRectLeft = 1
      ClientRectRight = 551
      ClientRectTop = 21
      object tsPeriod: TcxTabSheet
        Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076
        ImageIndex = 0
        object D1: TcxDateEdit
          Left = 28
          Top = 16
          ParentFont = False
          TabOrder = 0
          Width = 110
        end
        object D2: TcxDateEdit
          Left = 184
          Top = 16
          ParentFont = False
          TabOrder = 1
          Width = 110
        end
        object cxLabel2: TcxLabel
          Left = 14
          Top = 20
          Caption = #1057
          Style.BorderStyle = ebsNone
        end
        object cxLabel3: TcxLabel
          Left = 162
          Top = 20
          Caption = #1055#1054
          Style.BorderStyle = ebsNone
        end
        object cxLabel4: TcxLabel
          Left = 14
          Top = 53
          Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072':'
          Style.BorderStyle = ebsNone
        end
        object cb: TcxComboBox
          Left = 14
          Top = 72
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 10
          Properties.Items.Strings = (
            #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1088#1072#1073#1086#1095#1080#1081' '#1076#1077#1085#1100
            #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1085#1077#1076#1077#1083#1103
            #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
            #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1082#1074#1072#1088#1090#1072#1083
            #1055#1088#1077#1076#1099#1076#1091#1097#1077#1077' '#1087#1086#1083#1091#1075#1086#1076#1080#1077
            #1057' '#1085#1072#1095#1072#1083#1072' '#1090#1077#1082#1091#1097#1077#1081' '#1085#1077#1076#1077#1083#1080
            #1057' '#1085#1072#1095#1072#1083#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072
            #1057' '#1085#1072#1095#1072#1083#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1082#1074#1072#1088#1090#1072#1083#1072
            #1057' '#1085#1072#1095#1072#1083#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1087#1086#1083#1091#1075#1086#1076#1080#1103
            #1057' '#1085#1072#1095#1072#1083#1072' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1075#1086#1076#1072
            #1055#1077#1088#1080#1086#1076' '#1079#1072#1076#1072#1085' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1084)
          TabOrder = 5
          OnClick = cbClick
          Width = 280
        end
      end
      object tsQuart: TcxTabSheet
        Caption = #1047#1072' '#1082#1074#1072#1088#1090#1072#1083
        ImageIndex = 1
        object seYear: TcxSpinEdit
          Left = 50
          Top = 8
          ParentFont = False
          Properties.MinValue = 2014.000000000000000000
          TabOrder = 0
          Value = 2014
          Width = 57
        end
        object rgQuarts: TcxRadioGroup
          Left = 16
          Top = 43
          Caption = #1050#1074#1072#1088#1090#1072#1083#1099
          ParentColor = False
          ParentFont = False
          Properties.Items = <
            item
              Caption = #1055#1077#1088#1074#1099#1081
              Value = 1
              Tag = 1
            end
            item
              Caption = #1042#1090#1086#1088#1086#1081
              Value = 4
              Tag = 4
            end
            item
              Caption = #1058#1088#1077#1090#1080#1081
              Value = 7
              Tag = 7
            end
            item
              Caption = #1063#1077#1090#1074#1077#1088#1090#1099#1081
              Value = 10
              Tag = 10
            end>
          Style.Color = clBtnFace
          TabOrder = 1
          Height = 134
          Width = 225
        end
        object cxLabel1: TcxLabel
          Left = 16
          Top = 12
          Caption = #1043#1086#1076
          ParentColor = False
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Color = clBtnFace
        end
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Control = PC
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 144
    Top = 135
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 172
    Top = 135
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 256
    Top = 135
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 284
    Top = 135
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 200
    Top = 135
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 228
    Top = 135
  end
  inherited dsHeader: TfdcQuery
    Top = 136
  end
  inherited dsData: TfdcQuery
    Left = 64
    Top = 136
  end
  inherited xlReport: TxlReport
    OnBeforeBuild = xlReportBeforeBuild
    Left = 112
    Top = 136
  end
  inherited dsParam: TdxMemData
    Left = 232
    Top = 176
    object dsParamDATE_FROM: TDateField
      FieldName = 'DATE_FROM'
    end
    object dsParamDATE_TO: TDateField
      FieldName = 'DATE_TO'
    end
    object dsParamQUART_FLAG: TIntegerField
      FieldName = 'QUART_FLAG'
    end
  end
  inherited srcParam: TDataSource
    Left = 496
    Top = 248
  end
end
