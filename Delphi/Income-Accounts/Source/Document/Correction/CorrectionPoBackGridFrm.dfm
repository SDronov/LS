inherited CorrectionPoBackGridForm: TCorrectionPoBackGridForm
  Caption = 
    #1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1082#1086#1088#1088#1077#1082#1094#1080#1080' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1087#1086#1088#1091#1095#1077#1085#1080#1081' '#1087#1088#1080' '#1074#1086#1079#1074#1088#1072#1090#1077' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088 +
    #1077#1076#1089#1090#1074
  PixelsPerInch = 96
  TextHeight = 13
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
          object grdDataDBBandedTableViewREASON_BACK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REASON_BACK'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_INN'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_KPP'
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUBJECT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
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
    Active = True
    SQL.Strings = (
      'SELECT c.*'
      '  FROM fdc_correction_po_back_Lst c'
      
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
      '   AND c.doc_id =nvl(:pDocId,c.doc_id)'
      '')
    object dsDataREASON_BACK: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      FieldName = 'REASON_BACK'
      Size = 1500
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
      Visible = False
    end
    object dsDataSUBJECT_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataSUBJECT_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object dsDataSUBJECT_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
  end
end
