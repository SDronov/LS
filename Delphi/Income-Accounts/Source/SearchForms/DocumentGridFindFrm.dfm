inherited DocumentGridFindForm: TDocumentGridFindForm
  Caption = #1042#1099#1073#1086#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
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
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
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
      26
      0)
    inherited btnSwitchSearchCriteria: TdxBarButton
      Visible = ivNever
    end
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
      '   AND (rownum <= :MaxRecordCount)')
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
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
  end
end
