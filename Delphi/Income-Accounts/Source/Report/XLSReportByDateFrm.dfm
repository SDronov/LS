inherited XLSReportByDateForm: TXLSReportByDateForm
  Caption = 'XLS-'#1086#1090#1095#1077#1090' '#1085#1072' '#1076#1072#1090#1091
  ClientHeight = 123
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 415
    Height = 123
    LookAndFeel = LayoutWebLookAndFeel
    inherited btnCancel: TcxButton
      Left = 331
      Top = 91
      TabOrder = 2
    end
    inherited btnOk: TcxButton
      Left = 250
      Top = 91
      TabOrder = 1
    end
    object edtDateTo: TcxDBDateEdit [2]
      Left = 21
      Top = 40
      DataBinding.DataField = 'DATE_TO'
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
      Width = 394
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object lgPeriod: TdxLayoutGroup [0]
        AutoAligns = [aaVertical]
        AlignHorz = ahClient
        Caption = ' '#1085#1072' '#1076#1072#1090#1091' '
        object liDateTo: TdxLayoutItem
          Caption = #1087#1086
          CaptionOptions.Width = 25
          ShowCaption = False
          Control = edtDateTo
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 56
    Top = 47
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
    Left = 8
    Top = 80
  end
  inherited dsData: TfdcQuery
    Left = 96
    Top = 80
  end
  inherited xlReport: TxlReport
    Left = 152
    Top = 80
  end
  inherited dsParam: TdxMemData
    object dsParamDATE_TO: TDateField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      FieldName = 'DATE_TO'
      Required = True
    end
  end
end
