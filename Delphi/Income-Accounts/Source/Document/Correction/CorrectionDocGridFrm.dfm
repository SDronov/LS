inherited CorrectionDocGridForm: TCorrectionDocGridForm
  Width = 910
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1091#1102#1097#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Width = 902
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 596
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 596
      end
      inherited pnlProgress: TPanel
        Width = 596
        inherited lblProgress: TcxLabel
          Width = 596
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 809
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 902
  end
  inherited pnlWorkspace: TPanel
    Width = 902
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 183
        end
        inherited edtDocDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtDocDateTo: TcxDateEdit
          Width = 121
        end
        inherited edtDocNumber: TcxMaskEdit
          Width = 121
        end
        inherited cbIsActive: TcxComboBox
          Width = 121
        end
        inherited edtActDateFrom: TcxDateEdit
          Width = 121
        end
        inherited edtActDateTo: TcxDateEdit
          Width = 121
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 697
      inherited grdData: TcxGrid
        Width = 697
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            Width = 80
          end
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            MinWidth = 80
            Width = 80
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Width = 120
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Width = 120
          end
          object grdDataDBBandedTableViewDOC_SOURCE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SOURCE_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 5
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
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'pDocId'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT c.*'
      '  FROM fdc_correction_doc_Lst c'
      
        ' WHERE  (:Name          IS NULL OR UPPER( c.name       ) LIKE UP' +
        'PER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( c.doc_number ) LIKE UPP' +
        'ER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR c.doc_date >= :doc_date_from  ' +
        '     )'
      
        '   AND (:doc_date_to   IS NULL OR c.doc_date <= :doc_date_to    ' +
        '     )'
      
        '   AND (:is_active     IS NULL OR c.is_active = :is_active      ' +
        '     )'
      
        '   AND (:act_date_from IS NULL OR c.activation_date >= :act_date' +
        '_from)'
      
        '   AND (:act_date_to   IS NULL OR c.activation_date <= :act_date' +
        '_to  )'
      '   AND c.doc_id =nvl(:pDocId,c.doc_id)')
    ParamData = <
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
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'doc_number'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'is_active'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'act_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pDocId'
        ParamType = ptUnknown
      end>
    object dsDataDOC_ID: TFloatField
      FieldName = 'DOC_ID'
    end
    object dsDataDOC_SOURCE_NAME: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090'-'#1086#1089#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'DOC_SOURCE_NAME'
      Size = 1500
    end
  end
end
