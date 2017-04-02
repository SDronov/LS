inherited DocPackActChangeOstKBKGridForm: TDocPackActChangeOstKBKGridForm
  Left = 306
  Top = 332
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1072#1082#1090#1086#1074' '#1086' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1089' '#1079#1072#1082#1088#1099#1090#1099#1093' '#1050#1041#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 501
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 501
      end
      inherited pnlProgress: TPanel
        Width = 501
        inherited lblProgress: TcxLabel
          Width = 501
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 711
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtFromDate: TcxDateEdit
          Width = 109
        end
        inherited edtToDate: TcxDateEdit
          Width = 109
        end
        inherited edtNomer: TcxTextEdit
          Width = 109
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          object grdDataDBBandedTableViewCUSTOMS_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CLAIMED_DOC_COUNT'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_FORM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_FORM'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDATE_SEND: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DATE_SEND'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTINATION'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTINATION_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTINATION_NAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_TYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_TYPESYSNAME'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
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
    inherited btnAdd: TdxBarButton
      Visible = ivAlways
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.name AS state_name'
      '  from fdc_doc_pack_actchostkbk_lst t'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = t.state_id'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.ext_source = :customs_co' +
        'de) '
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)'
      '')
    SourceServerObject = 'FDC_DOC_PACK_ACTCHOSTKBK_LST'
    object dsDataCUSTOMS_NAME: TStringField
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
    object dsDataCLAIMED_DOC_COUNT: TFloatField
      FieldName = 'CLAIMED_DOC_COUNT'
    end
    object dsDataDATE_FORM: TDateTimeField
      FieldName = 'DATE_FORM'
    end
    object dsDataDATE_SEND: TDateTimeField
      FieldName = 'DATE_SEND'
    end
    object dsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 8
    end
    object dsDataDESTINATION_NAME: TStringField
      FieldName = 'DESTINATION_NAME'
      Size = 1500
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
  end
end
