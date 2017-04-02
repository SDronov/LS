inherited DocPackConfirmationsGridForm: TDocPackConfirmationsGridForm
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1082#1074#1080#1090#1072#1085#1094#1080#1081' '#1086' '#1087#1086#1083#1091#1095#1077#1085#1080#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
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
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 10
          end
          inherited grdDataDBBandedTableViewIS_RECIEVED: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewRECIEVE_DATE: TcxGridDBBandedColumn
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 13
          end
          object grdDataDBBandedTableViewDEST_CUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 102
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.name AS state_name'
      '  from FDC_REESTR_CONFIRMATION_LST t'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = t.state_id'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.ext_source = :customs_co' +
        'de) '
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)'
      '')
    SourceServerObject = 'FDC_REESTR_CONFIRMATION_LST'
    inherited dsDataIS_TS: TStringField
      Visible = False
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
  end
end
