inherited ActChangeOstKBKInPackGridForm: TActChangeOstKBKInPackGridForm
  Caption = 'ActChangeOstKBKInPackGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
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
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = False
    end
    inherited actDelete: TAction
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
    SQL.Strings = (
      'SELECT a.*'
      '      ,c.code  AS CurrencyCode'
      '  FROM FDC_ACT_CHANGE_OST_KBK_LST a'
      '      ,fdc_nsi_currency_lst  c'
      '      ,fdc_object_relation_lst rr'
      
        ' WHERE (:Name          IS NULL OR UPPER( a.name       ) LIKE UPP' +
        'ER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( a.doc_number ) LIKE UPP' +
        'ER( :doc_number ))'
      
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
      '   AND c.ID (+) = a.CURRENCY_ID'
      '   AND a.id = rr.rel_object_id'
      '   AND rr.object_id = :ID'
      '   AND rownum <= :MaxRecordCount')
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
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
