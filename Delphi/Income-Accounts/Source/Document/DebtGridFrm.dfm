inherited DebtGridForm: TDebtGridForm
  HelpContext = 410
  Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 416
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 416
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 416
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 416
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 629
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited edtINN: TcxTextEdit
          Width = 123
        end
        inherited edtOKPO: TcxTextEdit
          Width = 123
        end
      end
    end
    inherited pnlGrid: TPanel
      inherited grdData: TcxGrid
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDEBT_REST
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDEBT_REST_TS
            end>
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 271
            Position.ColIndex = 7
          end
          inherited grdDataDBBandedTableViewADDRESS_: TcxGridDBBandedColumn
            Width = 396
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewINN_: TcxGridDBBandedColumn
            Position.ColIndex = 17
          end
          inherited grdDataDBBandedTableViewKPP_: TcxGridDBBandedColumn
            Position.ColIndex = 6
          end
          inherited grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
            Position.ColIndex = 9
          end
          object grdDataDBBandedTableViewOGRN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OGRN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOKPO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OKPO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSOATO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SOATO'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPHONE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PHONE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewFAX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'FAX'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEX: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEX'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELEGRAPH: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELEGRAPH'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTELETYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TELETYPE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBT_REST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBT_REST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEBT_REST_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEBT_REST_TS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 5
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
      'SELECT /*+ FIRST_ROWS */'
      ' s.*,'
      ' d.debt_rest,'
      ' d.debt_rest_ts'
      '  FROM fdc_subject_lst s,'
      '       (select n.subject_id,'
      '               sum(case'
      '                     when d.is_ts = '#39'N'#39' then'
      
        '                      nvl(p_noticepay.get_charge_delta(n.id, dc.' +
        'id), 0)'
      '                     else'
      '                      0'
      '                   end) as debt_rest,'
      '               sum(case'
      '                     when d.is_ts = '#39'Y'#39' then'
      
        '                      nvl(p_noticepay.get_charge_delta(n.id, dc.' +
        'id), 0)'
      '                     else'
      '                      0'
      '                   end) as debt_rest_ts'
      '          from fdc_noticepay   n,'
      '               fdc_value       v,'
      '               fdc_object      o,'
      '               fdc_decl_charge dc,'
      '               fdc_document    d'
      '         where n.id = o.owner_object_id'
      '           and o.id = v.id'
      '           and v.ref_object_id = dc.id'
      '           and dc.id = d.id'
      
        '           and (nvl(p_noticepay.get_charge_delta(n.id, dc.id), 0' +
        ') > 0)'
      '         group by n.subject_id) d'
      ' WHERE s.id = d.subject_id'
      '   AND (:Name IS NULL OR upper(s.name) LIKE upper(:Name))'
      '   AND (:INN IS NULL OR s.INN LIKE :INN)'
      '   AND (:KPP IS NULL OR s.KPP LIKE :KPP)'
      '   AND rownum < :MaxRecordCount')
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
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataDEBT_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'DEBT_REST'
    end
    object dsDataDEBT_REST_TS: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1058#1057
      FieldName = 'DEBT_REST_TS'
    end
  end
end
