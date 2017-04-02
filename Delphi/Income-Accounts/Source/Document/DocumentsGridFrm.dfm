inherited DocumentsGridForm: TDocumentsGridForm
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  PixelsPerInch = 120
  TextHeight = 16
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 27
      inherited lblRecordCount: TcxLabel
        Height = 27
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 27
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 281
      Height = 27
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 281
        Height = 27
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 27
        end
      end
      inherited pnlProgress: TPanel
        Width = 281
        Height = 27
        inherited lblProgress: TcxLabel
          Height = 27
          Width = 281
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 494
      Top = 3
      Width = 75
      Height = 27
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 224
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = columnOPERATION_SUM
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <
                item
                  Column = grdDataDBBandedTableViewTYPENAME
                end
                item
                  Column = grdDataDBBandedTableViewNAME
                end>
              SummaryItems = <
                item
                  Format = #1057#1091#1084#1084#1072': ,0.00;'#1057#1091#1084#1084#1072': -,0.00'
                  Kind = skSum
                  Column = columnOPERATION_SUM
                end>
            end>
          OptionsView.GroupByBox = True
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            GroupIndex = 0
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            GroupIndex = 1
            Width = 180
          end
          object columnDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object columnDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object columnACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object columnOPERATION_SUM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OPERATION_SUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
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
      27
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      ' SELECT d.*'
      '       ,act.operation_sum'
      '  FROM fdc_acc_transaction_lst act'
      '  LEFT OUTER JOIN fdc_document_lst d ON d.id = act.doc_id'
      '  WHERE (:Name is null or upper(d.NAME) like upper(:Name))'
      '-- where_section'
      ''
      '-- order_section'
      '')
    SourceServerObject = 'FDC_ACC_TRANSACTION_LST'
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataOPERATION_SUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'OPERATION_SUM'
    end
  end
end
