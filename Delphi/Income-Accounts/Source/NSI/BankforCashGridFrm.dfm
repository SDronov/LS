inherited BankforCashGridForm: TBankforCashGridForm
  Left = 247
  Top = 143
  HelpContext = 34
  Caption = #1041#1072#1085#1082#1080', '#1087#1088#1080#1085#1080#1084#1072#1102#1097#1080#1077' '#1085#1072#1083#1080#1095#1085#1099#1077' '#1087#1083#1072#1090#1077#1078#1080
  PixelsPerInch = 115
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 22
      inherited lblRecordCount: TcxLabel
        Width = 100
        Height = 22
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 22
      inherited lblQueryTime: TcxLabel
        Width = 100
        Height = 22
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 22
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 22
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 22
        end
        inherited lblMaxRecordCoundExceeded: TcxLabel
          Width = 265
          Height = 22
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 22
        inherited lblProgress: TcxLabel
          Width = 281
          Height = 22
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 22
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited btnSearch: TcxButton
          Left = 153
          Top = 167
          Anchors = [akRight, akBottom]
          TabOrder = 0
          Layout = blGlyphBottom
        end
        inherited edtName: TcxTextEdit
          Width = 124
          TabOrder = 1
        end
        object cxTextEdit1: TcxTextEdit [2]
          Left = 12
          Top = 78
          Width = 124
          Height = 21
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
        end
        object cxTextEdit2: TcxTextEdit [3]
          Left = 12
          Top = 125
          Width = 124
          Height = 21
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciSearchBtn: TdxLayoutItem [0]
            CaptionOptions.Layout = clTop
          end
          inherited lciName: TdxLayoutItem [1]
            Visible = False
          end
          object lcSearchCriteriaItem1: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1041#1072#1085#1082
            CaptionOptions.Layout = clTop
            Control = cxTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1086#1088#1084#1072#1090#1072' '#1092#1072#1081#1083#1072
            CaptionOptions.Layout = clTop
            Control = cxTextEdit2
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            SortIndex = 0
            SortOrder = soAscending
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            Width = 165
          end
          object grdDataDBBandedTableViewBANK_NAME: TcxGridDBBandedColumn
            Caption = #1041#1072#1085#1082
            DataBinding.FieldName = 'BANK_NAME'
            Width = 256
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BIC'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INN'
            Visible = False
            Hidden = True
            Width = 63
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KPP'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewBANK_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'BANK_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_TO_ORDER_RATIO: TcxGridDBBandedColumn
            Caption = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' "'#1087#1083#1072#1090#1077#1078#1080' - '#1082#1074#1080#1090#1072#1085#1094#1080#1080'"'
            DataBinding.FieldName = 'PAYMENT_TO_ORDER_RATIO'
            Visible = False
            Hidden = True
            Width = 232
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFILE_FORMAT_CODE: TcxGridDBBandedColumn
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1086#1088#1084#1072#1090#1072' '#1092#1072#1081#1083#1072
            DataBinding.FieldName = 'FILE_FORMAT_CODE'
            Width = 125
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_TO_ORDER_RATIO_NAME: TcxGridDBBandedColumn
            Caption = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' "'#1087#1083#1072#1090#1077#1078#1080' - '#1082#1074#1080#1090#1072#1085#1094#1080#1080'"'
            DataBinding.FieldName = 'PAYMENT_TO_ORDER_RATIO_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 280
    Top = 167
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 244
    Top = 223
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
    Left = 328
    Top = 135
    DockControlHeights = (
      0
      0
      29
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 360
    Top = 99
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_bankforcash_Lst b'
      
        ' where (:BANK_NAME is null or upper(b.bank_name) like upper(:BAN' +
        'K_NAME))'
      
        ' and (:FFC is null or upper(b.File_Format_Code) like upper(:FFC)' +
        ')')
    Left = 212
    Top = 155
    ParamData = <
      item
        DataType = ftString
        Name = 'BANK_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BANK_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FFC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FFC'
        ParamType = ptUnknown
      end>
    object dsDataBANK_NAME: TStringField
      FieldName = 'BANK_NAME'
      Size = 1500
    end
    object dsDataBIC: TStringField
      FieldName = 'BIC'
      Size = 10
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object dsDataPAYMENT_TO_ORDER_RATIO: TStringField
      FieldName = 'PAYMENT_TO_ORDER_RATIO'
      Size = 10
    end
    object dsDataFILE_FORMAT_CODE: TStringField
      FieldName = 'FILE_FORMAT_CODE'
    end
    object dsDataPAYMENT_TO_ORDER_RATIO_NAME: TStringField
      FieldName = 'PAYMENT_TO_ORDER_RATIO_NAME'
      Size = 38
    end
  end
  inherited srcData: TDataSource
    Left = 300
    Top = 135
  end
  inherited dlgExportData: TSaveDialog
    Left = 224
    Top = 131
  end
end
