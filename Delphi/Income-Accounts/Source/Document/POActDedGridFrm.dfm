inherited POActDedGridForm: TPOActDedGridForm
  Caption = 'POActDedGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 166
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewStateName: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Position.BandIndex = 0
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            Position.BandIndex = 0
            Position.ColIndex = 5
          end
          inherited grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 0
          end
          inherited grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 1
          end
          inherited grdDataDBBandedTableViewSIGN_DATE: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 2
          end
          inherited grdDataDBBandedTableViewCURRENCYCODE: TcxGridDBBandedColumn
            Position.BandIndex = 0
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Position.BandIndex = 0
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewINN: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 12
          end
          inherited grdDataDBBandedTableViewKPP: TcxGridDBBandedColumn
            Visible = False
            Position.ColIndex = 13
          end
          inherited grdDataDBBandedTableViewSubjectName: TcxGridDBBandedColumn
            Position.ColIndex = 10
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
      28
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT a.*'
      '      ,c.code  AS CurrencyCode'
      '      ,s.INN'
      '      ,s.KPP'
      '      ,s.Name  AS SubjectName'
      '      ,st.Name AS StateName'
      '      ,a.is_ts'
      '  FROM fdc_act_deduction_lst a'
      '      ,fdc_nsi_currency_lst  c'
      '      ,fdc_subject_lst       s'
      '      ,fdc_object_lst        st'
      '      ,fdc_reserved_3year_lst r'
      
        ' WHERE (:Name          IS NULL OR UPPER( a.name       ) LIKE UPP' +
        'ER( :Name       ))'
      
        '   AND (:doc_number    IS NULL OR UPPER( a.doc_number ) LIKE UPP' +
        'ER( :doc_number ))'
      
        '   AND (:doc_date_from IS NULL OR a.doc_date >= :doc_date_from  ' +
        '     )'
      
        '   AND (:doc_date_to   IS NULL OR a.doc_date <= :doc_date_to    ' +
        '     )'
      
        '   AND (:is_active     IS NULL OR a.is_active = :is_active      ' +
        '     )'
      
        '   AND (:act_date_from IS NULL OR a.activation_date >= :act_date' +
        '_from)'
      
        '   AND (:act_date_to   IS NULL OR a.activation_date <= :act_date' +
        '_to  )'
      '   AND c.ID = a.CURRENCY_ID'
      '   AND s.ID = a.SUBJECT_ID'
      '   AND st.id = a.state_id'
      '   AND r.doc_id = a.id'
      '   AND r.payment_id = :ID'
      '')
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
      end>
  end
end
