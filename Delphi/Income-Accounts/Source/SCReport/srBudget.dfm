inherited srBudgetGridForm: TsrBudgetGridForm
  Width = 714
  Caption = #1054#1090#1087#1088#1072#1074#1082#1080' '#1074' '#1073#1102#1076#1078#1077#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 706
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 400
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 400
      end
      inherited pnlProgress: TPanel
        Width = 400
        inherited lblProgress: TcxLabel
          Width = 400
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 613
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 290
    Width = 706
    Height = 3
  end
  inherited pnlWorkspace: TPanel
    Width = 706
    Height = 262
    inherited splSearchCriteria: TSplitter
      Left = 62
      Height = 262
    end
    inherited pnlSearchCriteria: TPanel
      Width = 62
      Height = 262
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 62
        Height = 242
        inherited btnSearch: TcxButton
          Left = 9
          Top = 193
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 62
      end
    end
    inherited pnlGrid: TPanel
      Left = 67
      Width = 639
      Height = 262
      inherited grdData: TcxGrid
        Width = 639
        Height = 262
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView643
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView840
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView978
            end>
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupRowStyle = grsStandard
          OnCustomDrawGroupCell = grdDataDBBandedTableViewCustomDrawGroupCell
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
            DataBinding.FieldName = 'DOC_DATE'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'ACC_DATE'
            Width = 119
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Visible = False
            Hidden = True
            Width = 58
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Visible = False
            Hidden = True
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView643: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' ('#1088#1091#1073#1083#1080')'
            DataBinding.FieldName = 'S643'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView840: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' ('#1076#1086#1083#1083#1072#1088#1099')'
            DataBinding.FieldName = 'S840'
            Width = 117
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView978: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' ('#1077#1074#1088#1086')'
            DataBinding.FieldName = 'S978'
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
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
    Bars = <
      item
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = edtFrom
            UserDefine = [udWidth]
            UserWidth = 121
            Visible = True
          end
          item
            Item = edtTo
            UserDefine = [udWidth]
            UserWidth = 112
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
    object edtFrom: TdxBarDateCombo
      Caption = #1044#1072#1090#1072' '#1089
      Category = 0
      Hint = #1044#1072#1090#1072' '#1089
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
      ShowDayText = False
    end
    object edtTo: TdxBarDateCombo
      Caption = #1087#1086
      Category = 0
      Hint = #1087#1086
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
      ShowDayText = False
    end
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select NVL(b.doc_date, to_date('#39'10101000'#39', '#39'ddmmyyyy'#39')) doc_date'
      '--      ,t.name'
      '--      ,t.typename'
      '--      ,t.doc_name'
      '--      ,t.payment_code'
      '      ,sum(t.summa) s'
      '      ,t.curr_code'
      '--      ,t.budget_id'
      '      ,t.acc_date'
      '--      ,t.payment_date'
      '  from fdc_budget_payment_details_lst t'
      '      ,fdc_budget_payment_lst         b'
      ' where NVL(b.doc_date'
      '          ,trunc(sysdate)) between :F_DATE and :TO_DATE'
      '   and t.budget_id = b.id'
      'group by   b.doc_date'
      '      ,t.curr_code'
      '      ,t.acc_date')
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'F_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end>
    object dsDatadoc_date: TDateTimeField
      FieldName = 'doc_date'
    end
    object dsDataacc_date: TDateTimeField
      FieldName = 'acc_date'
    end
    object dsDatacurr_code: TStringField
      FieldName = 'curr_code'
      Size = 1500
    end
    object dsDatas: TFloatField
      FieldName = 's'
      DisplayFormat = ',0.00'
    end
  end
  inherited srcData: TDataSource
    DataSet = dxMemData1
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 183
    Top = 172
  end
end
