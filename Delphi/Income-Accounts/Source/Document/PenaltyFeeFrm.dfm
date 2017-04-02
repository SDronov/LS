inherited PenaltyFeeForm: TPenaltyFeeForm
  Width = 413
  Height = 125
  BorderStyle = bsSizeable
  Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090' '#1076#1083#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1077#1085#1077#1081
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 405
    Height = 85
    inherited btnCancel: TcxButton
      Left = 376
      Top = 41
      TabOrder = 3
    end
    inherited btnOk: TcxButton
      Left = 271
      Top = 41
      TabOrder = 2
    end
    object edtBeginDate: TcxDateEdit [2]
      Left = 132
      Top = 9
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      OnExit = edtBeginDateExit
      Width = 158
    end
    object edtEndDate: TcxDateEdit [3]
      Left = 316
      Top = 9
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      OnExit = edtEndDateExit
      Width = 158
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Group1: TdxLayoutGroup [0]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Caption = 'New Group'
        ShowCaption = False
        LayoutDirection = ldHorizontal
        ShowBorder = False
        object dxLayoutControl1Item1: TdxLayoutItem
          Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1087#1077#1085#1080' '#1089' '
          Control = edtBeginDate
          ControlOptions.ShowBorder = False
        end
        object dxLayoutControl1Item2: TdxLayoutItem
          Caption = #1087#1086
          Control = edtEndDate
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 55
    inherited actOk: TAction
      OnUpdate = actOkUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 36
    Top = 55
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Left = 120
    Top = 55
  end
  inherited WebEditStyleController: TcxEditStyleController
    Left = 148
    Top = 55
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 64
    Top = 55
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Left = 92
    Top = 55
  end
end
