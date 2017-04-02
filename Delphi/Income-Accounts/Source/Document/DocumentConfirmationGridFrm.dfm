inherited DocumentConfirmationGridForm: TDocumentConfirmationGridForm
  Width = 788
  Height = 503
  Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103'-'#1082#1074#1080#1090#1072#1085#1094#1080#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 451
    Width = 780
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
      Width = 475
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 475
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 475
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 475
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 688
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 448
    Width = 780
  end
  inherited pnlWorkspace: TPanel
    Width = 780
    Height = 422
    inherited splSearchCriteria: TSplitter
      Height = 422
    end
    inherited pnlSearchCriteria: TPanel
      Height = 422
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 402
        inherited btnSearch: TcxButton
          Left = 117
          Top = 371
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 117
          Top = 342
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
      Width = 575
      Height = 422
      inherited grdData: TcxGrid
        Width = 575
        Height = 422
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 126
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
            Width = 97
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Caption = #8470' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
            Width = 97
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
            Width = 76
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
            Width = 94
          end
          object grdDataDBBandedTableViewCONFIRM_DOC_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CONFIRM_DOC_TYPE'
            Width = 261
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCONFIRM_DOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CONFIRM_DOC_NUMBER'
            Width = 148
            Position.BandIndex = 1
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCONFIRM_DOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CONFIRM_DOC_DATE'
            Width = 141
            Position.BandIndex = 1
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
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
    inherited actSearchOk: TAction
      Visible = False
    end
    inherited actSearchCancel: TAction
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
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        SourceParamName = 'ID'
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT '
      '       dc.confirmed_doc_id AS ID '
      '      ,dc.Name'
      '      ,dc.ShortName'
      '      ,dc.object_type_id'
      '      ,dc.state_id'
      '      ,dc.AccessLevel'
      '      ,dc.SysName'
      '      ,dc.Descript'
      '      ,dc.owner_object_id'
      '      ,dc.TypeName'
      '      ,dc.TypeSysName'
      '      ,dc.ObjectKindList'
      '      ,dc.doc_date'
      '      ,dc.doc_number'
      '      ,dc.is_active'
      '      ,dc.activation_date'
      '      ,dc.ext_source'
      '      ,dc.ext_typesysname'
      '      ,dc.ext_id '
      '      ,dc.confirmed_doc_id'
      '      ,dc.ID AS doc_id'
      '      ,d.typename AS confirm_doc_type, '
      '      d.doc_number AS confirm_doc_number, '
      '      d.doc_date AS confirm_doc_date'
      '  FROM fdc_doc_confirm_lst dc, '
      '       fdc_document_lst d, '
      '       fdc_rel_pack_docs_lst r'
      
        ' WHERE (:Name          IS NULL OR UPPER( dc.name       ) LIKE UP' +
        'PER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( dc.doc_number ) LIKE UP' +
        'PER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR dc.doc_date >= :doc_date_from ' +
        '      )'
      
        '   AND (:doc_date_to   IS NULL OR dc.doc_date <= :doc_date_to   ' +
        '      )'
      
        '   AND (:is_active     IS NULL OR dc.is_active = :is_active     ' +
        '      )'
      
        '   AND (:act_date_from IS NULL OR dc.activation_date >= :act_dat' +
        'e_from)'
      
        '   AND (:act_date_to   IS NULL OR dc.activation_date <= :act_dat' +
        'e_to  )'
      '   AND d.id = dc.confirmed_doc_id'
      '   AND r.Rel_Object_ID = dc.ID'
      '   AND r.Object_ID = :ID')
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
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataCONFIRM_DOC_TYPE: TStringField
      DisplayLabel = #1058#1080#1087' '#1087#1086#1090#1076#1074#1077#1088#1078#1076#1072#1077#1084#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'CONFIRM_DOC_TYPE'
      Size = 1500
    end
    object dsDataCONFIRM_DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1086#1090#1076#1074#1077#1088#1078#1076#1072#1077#1084#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'CONFIRM_DOC_NUMBER'
      Size = 100
    end
    object dsDataCONFIRM_DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1090#1076#1074#1077#1088#1078#1076#1072#1077#1084#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'CONFIRM_DOC_DATE'
    end
    object dsDataCONFIRMED_DOC_ID: TFloatField
      FieldName = 'CONFIRMED_DOC_ID'
    end
  end
end
