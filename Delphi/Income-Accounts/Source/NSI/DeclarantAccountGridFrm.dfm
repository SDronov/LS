inherited DeclarantAccountGridForm: TDeclarantAccountGridForm
  Width = 802
  Height = 376
  Caption = #1057#1095#1077#1090#1072' '#1076#1077#1082#1083#1072#1088#1072#1085#1090#1086#1074
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    Top = 313
    Width = 794
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 100
      inherited lblRecordCount: TcxLabel
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 100
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Width = 489
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 489
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 473
        end
      end
      inherited pnlProgress: TPanel
        Width = 489
        inherited lblProgress: TcxLabel
          Width = 489
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 702
      Width = 75
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 310
    Width = 794
  end
  inherited pnlWorkspace: TPanel
    Width = 794
    Height = 281
    inherited splSearchCriteria: TSplitter
      Height = 281
    end
    inherited pnlSearchCriteria: TPanel
      Height = 281
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 257
        inherited btnSearch: TcxButton
          Top = 217
          TabOrder = 3
        end
        inherited edtName: TcxTextEdit
          Width = 226
        end
        object edtPayAccount: TcxTextEdit [2]
          Left = 12
          Top = 78
          Width = 201
          Height = 21
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtCorrAccount: TcxTextEdit [3]
          Left = 12
          Top = 125
          Width = 201
          Height = 21
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 2
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1054#1050#1055#1054' '#1073#1072#1085#1082#1072
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
            CaptionOptions.Layout = clTop
            Control = edtPayAccount
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1050#1086#1088#1088#1077#1089#1087'. '#1089#1095#1077#1090
            CaptionOptions.Layout = clTop
            Control = edtCorrAccount
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 542
      Height = 281
      inherited grdData: TcxGrid
        Width = 542
        Height = 281
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object grdDataDBBandedTableViewDECLARANT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECLARANT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBANK_OKPO: TcxGridDBBandedColumn
            Caption = #1054#1050#1055#1054' '#1073#1072#1085#1082#1072
            DataBinding.FieldName = 'BANK_OKPO'
            Width = 75
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
            DataBinding.FieldName = 'PAY_ACCOUNT'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCORR_ACCOUNT: TcxGridDBBandedColumn
            Caption = #1050#1086#1088#1088#1077#1089#1087'. '#1089#1095#1077#1090
            DataBinding.FieldName = 'CORR_ACCOUNT'
            Width = 180
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_TYPE'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      29
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftInteger
        Name = 'decl_id'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      
        'SELECT da.*, CASE WHEN account_curr_type = 1 THEN '#39#1056#1091#1073#1083#1077#1074#1099#1081#39' ELS' +
        'E '#39#1042#1072#1083#1102#1090#1085#1099#1081#39' END curr_type'
      'FROM fdc_declarant_account_lst da'
      'WHERE declarant_id = :decl_id '
      
        'and (:BANK_OKPO is null or upper(BANK_OKPO) like upper(:BANK_OKP' +
        'O))'
      
        'and (:Pay_Account is null or upper(Pay_Account) like upper(:Pay_' +
        'Account))'
      
        'and (:Corr_Account is null or upper(Corr_Account) like upper(:Co' +
        'rr_Account))'
      'ORDER BY pay_account, corr_account')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BANK_OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BANK_OKPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Pay_Account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Pay_Account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Corr_Account'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Corr_Account'
        ParamType = ptUnknown
      end>
    object dsDataDECLARANT_ID: TFloatField
      FieldName = 'DECLARANT_ID'
    end
    object dsDataACCOUNT_CURR_TYPE: TIntegerField
      FieldName = 'ACCOUNT_CURR_TYPE'
    end
    object dsDataBANK_OKPO: TStringField
      FieldName = 'BANK_OKPO'
      Size = 10
    end
    object dsDataPAY_ACCOUNT: TStringField
      FieldName = 'PAY_ACCOUNT'
    end
    object dsDataCORR_ACCOUNT: TStringField
      FieldName = 'CORR_ACCOUNT'
    end
    object dsDataCURR_TYPE: TStringField
      FieldName = 'CURR_TYPE'
      Size = 8
    end
  end
end
