inherited PaymentOrderDebitForm: TPaymentOrderDebitForm
  Left = 505
  Top = 49
  Caption = 'PaymentOrderDebitForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtDescript: TcxDBMemo
          Top = 648
          Height = 34
          Width = 272
        end
        inherited edtDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtPayerName: TfdcObjectLinkEdit
          Width = 258
        end
        inherited edtDocSumma: TcxDBCurrencyEdit
          Width = 107
        end
        inherited edtSumma: TcxDBCurrencyEdit
          Width = 91
        end
        inherited edtRestSumma: TcxDBCurrencyEdit
          Width = 258
        end
        inherited edtBankDocDate: TcxDBDateEdit
          Width = 106
        end
        inherited edtKPP: TcxDBMaskEdit
          Width = 109
        end
        inherited btnSaveNew: TcxButton
          Top = 674
        end
        inherited cxDBCurrencyEdit1: TcxDBCurrencyEdit
          Width = 96
        end
        inherited cxDBCurrencyEdit2: TcxDBCurrencyEdit
          Width = 101
        end
        inherited chbxAsOld: TcxCheckBox
          Top = 674
        end
        inherited edtDescript2: TcxDBMemo
          Top = 615
          Height = 30
          Width = 258
        end
        inherited edtNote: TcxDBMemo
          Height = 68
          Width = 142
        end
        inherited gbxPaymentFor: TcxGroupBox
          Width = 548
          inherited dxLayoutControl1: TdxLayoutControl
            Width = 544
            inherited edtPFSumma: TcxDBTextEdit
              Width = 93
            end
            inherited edtPFRestSumma: TcxDBTextEdit
              Width = 92
            end
            inherited edtPFLockedSumma: TcxDBTextEdit
              Width = 93
            end
            inherited edtSubjectName: TfdcObjectLinkEdit
              Width = 93
            end
            inherited edtSubjectINN: TcxDBTextEdit
              Width = 93
            end
            inherited edtSubjectKPP: TcxDBTextEdit
              Width = 93
            end
          end
        end
        inherited edtRecipientKPP: TcxDBMaskEdit
          Width = 71
        end
        inherited edtRecipientName: TfdcObjectLinkEdit
          Width = 623
        end
        inherited edtDestCustomsCode: TcxDBMaskEdit
          Width = 121
        end
      end
    end
    inherited tabConfirmation: TcxTabSheet
      inherited lcConfirm: TdxLayoutControl
        inherited edtCnfrmDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmPayerINN: TcxDBTextEdit
          Width = 275
        end
        inherited edtCnfrmPayerName: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmCurrencyName: TcxDBTextEdit
          Width = 121
        end
        inherited edtCnfrmDocSumma: TcxDBCurrencyEdit
          Width = 121
        end
      end
    end
    inherited tabDocPack: TcxTabSheet
      TabVisible = False
    end
    inherited tabBankInfo: TcxTabSheet
      inherited lcBankInfo: TdxLayoutControl
        inherited edtBankInfoPayerName: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoPayerAccount: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoRecepientName: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoRecepientAccount: TcxDBTextEdit
          Width = 121
        end
        inherited edtBankInfoPaymentInfo: TcxDBMemo
          Width = 185
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
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 103
        FloatClientHeight = 119
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton1
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            Item = dxBarButton2
            Visible = True
          end
          item
            Item = btnCancelReserve3Year
            Visible = True
          end
          item
            Item = btnCorrect
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
