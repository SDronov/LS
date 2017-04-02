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
      TabOrder = 8
    end
    inherited btnOk: TcxButton
      TabOrder = 7
    end
    inherited edtUserName: TcxButtonEdit
      Top = 68
    end
    inherited edtPassword: TcxTextEdit
      Top = 95
    end
    inherited edtConnectString: TcxTextEdit
      Top = 149
      TabOrder = 5
    end
    inherited lblLanguage: TcxLabel
      Top = 176
    end
    inherited imgKey: TcxImage
      Top = 68
    end
    object edtSchema: TcxTextEdit [9]
      Left = 236
      Top = 122
      Width = 197
      Height = 21
      Style.StyleController = WebEditStyleController
      StyleDisabled.StyleController = WebEditStyleController
      StyleFocused.StyleController = WebEditStyleController
      StyleHot.StyleController = WebEditStyleController
      TabOrder = 4
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
          end
        end
      end
    end
  end
end
