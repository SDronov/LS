inherited SelectNoticePayGridForm: TSelectNoticePayGridForm
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1091#1095#1077#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' ...'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited splSearchCriteria: TSplitter
      Left = 0
      Width = 0
      Visible = False
    end
    inherited pnlSearchCriteria: TPanel
      Width = 0
      Enabled = False
      Visible = False
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 0
        inherited btnSearch: TcxButton
          Left = 9
          Top = 197
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
        inherited btnSearchClear: TcxButton
          Left = 9
          Top = 168
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 0
      end
    end
    inherited pnlGrid: TPanel
      Left = 0
      Width = 586
      inherited grdData: TcxGrid
        Width = 586
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSumma
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
            Width = 110
          end
          object grdDataDBBandedTableViewSumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 132
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCurCode: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUR_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
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
    inherited actSwitchSearchCriteria: TAction
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
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT'
      
        'np.ID, np.NAME, np.SHORTNAME,np.OBJECT_TYPE_ID,np.STATE_ID,np.AC' +
        'CESSLEVEL,np.SYSNAME,np.DESCRIPT,np.OWNER_OBJECT_ID,np.TYPENAME,' +
        'np.TYPESYSNAME'
      
        ',np.OBJECTKINDLIST, np.summa, np.currency_id, cu.CODE AS Cur_Cod' +
        'e, np.DOC_NUMBER, np.DOC_DATE,np.IS_TS'
      ' FROM fdc_notice_pay_lst np,'
      '      fdc_currency_usable_lst cu'
      ' WHERE np.subject_id = :SUBJECT_ID'
      '   AND cu.ID (+) = np.currency_id'
      '   AND np.is_ts  = Nvl(:IS_TS,'#39'N'#39')'
      '/*UNION ALL'
      'SELECT *'
      'FROM ('
      '       SELECT'
      
        '         -1 as ID,'#39#1041#1077#1079' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#39' as NAME, NULL as SHORTNAME, ' +
        'NULL as OBJECT_TYPE_ID, NULL as STATE_ID, NULL as ACCESSLEVEL,NU' +
        'LL as SYSNAME,'
      
        '         NULL as DESCRIPT,NULL as OWNER_OBJECT_ID,NULL as TYPENA' +
        'ME,NULL as TYPESYSNAME,NULL as OBJECTKINDLIST,'
      
        '         p_decision_debts.GetAmountDebt(:SUBJECT_ID) AS summa, p' +
        '_nsi_currency.findbycode('#39'643'#39') AS currency_id, '#39'643'#39' AS Cur_Cod' +
        'e'
      '       FROM dual'
      '     )'
      ' WHERE summa > 0'
      '*/')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IS_TS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptInput
      end>
    inherited dsDataID: TFloatField
      Visible = False
    end
    inherited dsDataSHORTNAME: TStringField
      Visible = False
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      Visible = False
    end
    inherited dsDataSTATE_ID: TFloatField
      Visible = False
    end
    inherited dsDataACCESSLEVEL: TFloatField
      Visible = False
    end
    inherited dsDataSYSNAME: TStringField
      Visible = False
    end
    inherited dsDataDESCRIPT: TStringField
      Visible = False
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Visible = False
    end
    inherited dsDataTYPENAME: TStringField
      Visible = False
    end
    inherited dsDataTYPESYSNAME: TStringField
      Visible = False
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 25
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataCUR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      DisplayWidth = 15
      FieldName = 'CUR_CODE'
      Size = 3
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
end
