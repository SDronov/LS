inherited DocumentGridFindForActForm: TDocumentGridFindForActForm
  Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1076#1083#1103' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1091#1102#1097#1077#1081' '#1087#1088#1086#1074#1086#1076#1082#1080
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
      'SELECT *'
      '  FROM fdc_Document_Lst'
      
        ' WHERE (:Name          IS NULL OR UPPER( name       ) LIKE UPPER' +
        '( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( doc_number ) LIKE UPPER' +
        '( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR doc_date >= :doc_date_from    ' +
        '   )'
      
        '   AND (:doc_date_to   IS NULL OR doc_date <= :doc_date_to      ' +
        '   )'
      
        '   AND (:is_active     IS NULL OR is_active = :is_active        ' +
        '   )'
      
        '   AND (:act_date_from IS NULL OR activation_date >= :act_date_f' +
        'rom)'
      
        '   AND (:act_date_to   IS NULL OR activation_date <= :act_date_t' +
        'o  )'
      '   AND (rownum <= :MaxRecordCount)'
      '   AND (typesysname not in ('
      '                                           select sysname'
      '                                           from fdc_object_type'
      
        '                                           start with sysname = ' +
        #39'DeclCharge'#39
      
        '                                           connect by prior id =' +
        ' parent_object_type_id'
      '                                           union all'
      '                                           select sysname'
      '                                           from fdc_object_type'
      
        '                                           start with sysname = ' +
        #39'PaymentDeduction'#39
      
        '                                           connect by prior id =' +
        ' parent_object_type_id'
      '                                           )'
      '      )')
  end
end
