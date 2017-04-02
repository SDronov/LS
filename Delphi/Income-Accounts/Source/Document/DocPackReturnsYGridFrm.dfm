inherited DocPackReturnsYGridForm: TDocPackReturnsYGridForm
  Caption = #1056#1077#1077#1089#1090#1088#1099' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1093' '#1079#1072#1103#1074#1086#1082' '#1085#1072' '#1074#1086#1079#1074#1088#1072#1090
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
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewCLAIMED_SPENDING
            end>
          inherited grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            Width = 147
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Visible = True
          end
          object grdDataDBBandedTableViewCLAIMED_DOC_COUNT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CLAIMED_DOC_COUNT'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCLAIMED_SPENDING: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CLAIMED_SPENDING'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTINATION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTINATION'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAdd: TAction
      Visible = True
    end
    object actAllPackFormed: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actAllPackFormedExecute
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
    Bars = <
      item
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 679
        FloatTop = 322
        FloatClientWidth = 58
        FloatClientHeight = 182
        ItemLinks = <
          item
            Item = btnSearchOk
            Visible = True
          end
          item
            Item = btnSearchCancel
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = btnAdd
            Visible = True
          end
          item
            Item = btnOpen
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxbcTO
            Visible = True
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
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
    object dxBarButton1: TdxBarButton
      Action = actAllPackFormed
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '      ,s.name AS state_name'
      '  from fdc_doc_pack_returns_y_lst t'
      '  LEFT OUTER JOIN fdc_state_lst s ON s.id = t.state_id'
      ' where (:Name is null or upper(t.NAME) like upper(:Name))'
      
        '   AND (:customs_code = '#39'00000000'#39' OR t.destination = :customs_c' +
        'ode)'
      '/*$p#from_date#*/ and (t.doc_date >= :FROM_DATE)'
      '/*$p#to_date#*/   and (t.doc_date <= :TO_DATE)'
      '/*$p#doc_no#*/    and (t.DOC_NUMBER like :DOC_NO)')
    SourceServerObject = 'FDC_DOC_PACK_RETURNS_Y_LST'
    object dsDataDATE_INCOMING: TDateTimeField [16]
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'DATE_INCOMING'
    end
    object dsDataCLAIMED_DOC_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      FieldName = 'CLAIMED_DOC_COUNT'
    end
    object dsDataCLAIMED_SPENDING: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'CLAIMED_SPENDING'
    end
    object dsDataDESTINATION: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTINATION'
      Size = 8
    end
  end
  object odaSetAdd: TOracleDataSet
    SQL.Strings = (
      'select p_params.CustomLevel  as CustomLevel from dual')
    Left = 261
    Top = 154
  end
end
