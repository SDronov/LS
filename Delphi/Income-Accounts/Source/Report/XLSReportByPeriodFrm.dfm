inherited XLSReportByPeriodForm: TXLSReportByPeriodForm
  Caption = 'XLSReportByPeriodForm'
  ClientHeight = 153
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 153
    inherited btnCancel: TcxButton
      Top = 121
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Top = 121
      TabOrder = 2
    end
    object edtDateFrom: TcxDBDateEdit [2]
      Left = 47
      Top = 40
      DataBinding.DataField = 'DATE_FROM'
      DataBinding.DataSource = srcParam
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsHotFlat
      Style.PopupBorderStyle = epbsSingle
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 336
    end
    inherited edtDateTo: TcxDBDateEdit
      Left = 47
      Top = 68
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 371
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited lgPeriod: TdxLayoutGroup
        Caption = ' '#1055#1077#1088#1080#1086#1076' '
        object liDateFrom: TdxLayoutItem [0]
          Caption = #1089
          CaptionOptions.Width = 25
          Control = edtDateFrom
          ControlOptions.ShowBorder = False
        end
        inherited liDateTo: TdxLayoutItem
          ShowCaption = True
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
  inherited dsParam: TdxMemData
    object dsParamDATE_FROM: TDateField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATE_FROM'
      Required = True
      OnChange = dsParamDATE_FROMChange
    end
  end
end
