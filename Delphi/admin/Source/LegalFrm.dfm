inherited LegalForm: TLegalForm
  Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    ActivePage = tabGeneral
    ClientRectBottom = 357
    ClientRectRight = 580
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Width = 417
          Height = 224
        end
        inherited edtFirstName: TcxDBTextEdit
          Enabled = False
        end
        inherited edtMiddleName: TcxDBTextEdit
          Width = 255
          Enabled = False
        end
        inherited edtBIC: TcxDBTextEdit
          Width = 121
        end
        inherited edtBirthDate: TcxDBDateEdit
          Enabled = False
        end
        inherited edtBirthYear: TcxDBSpinEdit
          Enabled = False
        end
        inherited edtBirthLocation: TcxDBMemo
          Width = 477
          Enabled = False
        end
        inherited cmbxOpfDictID: TcxDBLookupComboBox
          Width = 461
        end
        inherited edtSurName: TcxDBTextEdit
          Width = 121
          Enabled = False
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciSurName: TdxLayoutItem
            Enabled = False
            Visible = False
          end
          inherited lcGeneralGroup2: TdxLayoutGroup
            Enabled = False
            Visible = False
          end
          inherited lcGeneralGroup4: TdxLayoutGroup
            Enabled = False
            Visible = False
          end
          inherited lciBirthLocation: TdxLayoutItem
            Enabled = False
            Visible = False
          end
        end
      end
    end
    inherited tabChars: TcxTabSheet
      inherited pcChars: TcxPageControl
        ClientRectBottom = 334
        ClientRectRight = 580
        ClientRectTop = 0
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 334
        ClientRectRight = 580
        ClientRectTop = 0
      end
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
  end
end
