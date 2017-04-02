inherited fdcOraLogOnForm: TfdcOraLogOnForm
  Left = 381
  Top = 237
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    inherited Bevel1: TBevel
      Width = 482
    end
    inherited btnCancel: TcxButton
      TabOrder = 9
    end
    inherited btnOk: TcxButton
      TabOrder = 8
    end
    inherited edtUserName: TcxButtonEdit
      Top = 62
      Width = 121
      Height = 18
    end
    inherited edtPassword: TcxTextEdit
      Top = 86
      Width = 121
      Height = 18
    end
    inherited edtConnectString: TcxTextEdit
      Top = 134
      Width = 121
      Height = 18
      TabOrder = 5
    end
    inherited lblLanguage: TcxLabel
      Top = 178
    end
    inherited imgKey: TcxImage
      Top = 62
    end
    inherited lblGreetings: TcxLabel
      Width = 424
      Height = 14
      ParentFont = False
      Style.StyleController = WebEditStyleController
    end
    object edtSchema: TcxTextEdit [9]
      Left = 236
      Top = 110
      Width = 196
      Height = 18
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsSingle
      Style.StyleController = WebEditStyleController
      TabOrder = 4
    end
    object cxLabel1: TcxLabel [10]
      Left = 343
      Top = 158
      Width = 88
      Height = 14
      Cursor = crHandPoint
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.BorderStyle = ebsNone
      Style.StyleController = WebEditStyleController
      Style.TextColor = clHighlight
      Style.TextStyle = [fsUnderline]
      OnClick = cxLabel1Click
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      inherited dxLayoutControl1Group2: TdxLayoutGroup
        inherited dxLayoutControl1Group3: TdxLayoutGroup
          inherited dxLayoutControl1Group1: TdxLayoutGroup
            object lciSchema: TdxLayoutItem [2]
              Caption = #1057#1093#1077#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSchema
              ControlOptions.ShowBorder = False
            end
            object lciShowAll: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              CaptionOptions.AlignHorz = taRightJustify
              ShowCaption = False
              Control = cxLabel1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
    end
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
  end
end
