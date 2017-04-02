inherited SubjectFindGridForm: TSubjectFindGridForm
  Left = 337
  Top = 229
  Width = 874
  Height = 482
  Caption = #1042#1099#1073#1086#1088' '#1089#1091#1073#1098#1077#1082#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 419
    Width = 858
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      inherited edtMaxRecordCount: TcxSpinEdit
        Width = 81
      end
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 555
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 555
      end
      inherited pnlProgress: TPanel
        Width = 555
        inherited lblProgress: TcxLabel
          Width = 555
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 765
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 416
    Width = 858
  end
  inherited pnlWorkspace: TPanel
    Width = 858
    Height = 388
    inherited splSearchCriteria: TSplitter
      Height = 388
    end
    inherited pnlSearchCriteria: TPanel
      Height = 388
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 368
        inherited btnSearch: TcxButton
          Top = 337
          TabOrder = 6
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited edtINN: TcxTextEdit
          Width = 123
        end
        inherited edtOKPO: TcxTextEdit
          Width = 123
        end
        inherited btnSearchClear: TcxButton
          Top = 308
          TabOrder = 5
        end
        object edtBIC: TcxTextEdit [5]
          Left = 9
          Top = 141
          ParentFont = False
          Properties.MaxLength = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object edtCorrAcc: TcxTextEdit [6]
          Left = 9
          Top = 183
          ParentFont = False
          Properties.MaxLength = 20
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 121
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem3: TdxLayoutItem [3]
            Caption = #1041#1048#1050
            CaptionOptions.Layout = clTop
            Control = edtBIC
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [4]
            Caption = #1050#1086#1088#1088'.'#1089#1095#1105#1090' '#1073#1072#1085#1082#1072
            CaptionOptions.Layout = clTop
            Control = edtCorrAcc
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 653
      Height = 388
      inherited grdData: TcxGrid
        Width = 653
        Height = 388
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn
            Width = 404
          end
          object grdDataDBBandedTableViewBIC: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'BIC'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCORR_ACCOUNT: TcxGridDBBandedColumn [9]
            DataBinding.FieldName = 'CORR_ACCOUNT'
            Width = 191
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
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
      28
      0)
    object CustomdxBarCombo1: TCustomdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object dxBarListItem1: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
    end
    object dxBarLookupCombo1: TdxBarLookupCombo
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDD000000000000000D0FFFF0FFFFFFFF0D0F77F0F777777F0D0CCCC0CCCCCC
        CC0D0C77C0C777777C0D0CCCC0CCCCCCCC0D0F77F0F777777F0D0FFFF0FFFFFF
        FF0D0F77F0F777777F0D0FFFF0FFFFFFFF0D000000000000000D0FFFCCCCFFF0
        DDDD0F777777FFF0DDDD0FFFCCCCFFF0DDDD000000000000DDDD}
      Width = 100
      RowCount = 7
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
      ItemIndex = -1
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*, b.BIC, b.corr_account'
      ' from fdc_Subject_Lst t, fdc_bank b'
      
        'where Instr('#39';'#39'|| :ObjectNames ||'#39';'#39', '#39';'#39'||t.typesysname||'#39';'#39') >' +
        ' 0'
      'AND b.id(+) = t.ID'
      'and (:Name is null or upper(NAME) like upper(:Name))'
      'and (:INN is null or INN like :INN)'
      'and (:KPP is null or KPP like :KPP)'
      'and (:BIC is null OR b.BIC like :BIC)'
      'and (:CORR_ACC is null or b.CORR_ACCOUNT like :CORR_ACC)'
      'and rownum <= :MaxRecordCount')
    ParamData = <
      item
        DataType = ftString
        Name = 'ObjectNames'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'BIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CORR_ACC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CORR_ACC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataBIC: TStringField
      DisplayLabel = #1041#1048#1050
      FieldName = 'BIC'
      Size = 10
    end
    object dsDataCORR_ACCOUNT: TStringField
      DisplayLabel = #1050#1086#1088#1088'.'#1089#1095#1105#1090' '#1073#1072#1085#1082#1072
      FieldName = 'CORR_ACCOUNT'
    end
  end
end
