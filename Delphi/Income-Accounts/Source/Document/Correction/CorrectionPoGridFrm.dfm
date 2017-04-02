inherited CorrectionPoGridForm: TCorrectionPoGridForm
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1082#1086#1088#1088#1077#1082#1094#1080#1080' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 597
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 597
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 597
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 597
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 810
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
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
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          object grdDataDBBandedTableViewREASON_CORRECT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_CORRECT'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object colDescript: TcxGridDBBandedColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Width = 200
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT c.*'
      '  FROM fdc_correction_po_Lst c'
      
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
      '   AND ('
      '        c.doc_id = nvl(:pDocId,c.doc_id)'
      '        or'
      '        ('
      '         c.typesysname = '#39'CorrectPOCustomCode'#39
      '         and'
      
        '         c.doc_id = (select id from fdc_payment_order_non_id_lst' +
        ' where payment_order_id = :pDocId)'
      '        )'
      '       )'
      ' ORDER BY c.id')
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
        DataType = ftInteger
        Name = 'pDocId'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pDocId'
        ParamType = ptUnknown
      end>
    object dsDataREASON_CORRECT: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      FieldName = 'REASON_CORRECT'
      Size = 1500
    end
  end
end
