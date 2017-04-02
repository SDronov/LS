inherited PayForHistForm: TPayForHistForm
  Left = 255
  Top = 242
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1077#1088#1077#1074#1086#1076#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 284
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 284
      end
      inherited pnlProgress: TPanel
        Width = 284
        inherited lblProgress: TcxLabel
          Width = 284
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 497
      Width = 77
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 290
    Height = 3
  end
  inherited pnlWorkspace: TPanel
    Height = 262
    inherited splSearchCriteria: TSplitter
      Height = 262
    end
    inherited pnlSearchCriteria: TPanel
      Height = 262
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 242
        inherited btnSearch: TcxButton
          Top = 210
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 262
      inherited grdData: TcxGrid
        Height = 262
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'summa'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'doc_date'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn3: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'doc_no'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn4: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'doc_name'
            Options.Editing = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
      Visible = False
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
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select * from fdc_payment_for_hist_lst'
      'where payment_id=:payment_id'
      '    and subject_id=:subject_id'
      'order by id')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'payment_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'subject_id'
        ParamType = ptInput
      end>
    object dsDatasumma: TFloatField
      FieldName = 'summa'
    end
    object dsDatadoc_date: TDateTimeField
      FieldName = 'doc_date'
    end
    object dsDatadoc_no: TStringField
      FieldName = 'doc_no'
    end
    object dsDatadoc_name: TStringField
      FieldName = 'doc_name'
      Size = 500
    end
  end
end
