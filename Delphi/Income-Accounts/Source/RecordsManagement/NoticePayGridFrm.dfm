inherited NoticePayGridForm: TNoticePayGridForm
  Left = 543
  Top = 218
  Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1091#1095#1077#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        object Label3: TLabel [2]
          Left = 9
          Top = 293
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 389
          TabOrder = 12
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 360
          TabOrder = 11
        end
        inherited edtDeclName: TcxTextEdit
          Width = 167
        end
        object edtFromDateActiveted: TcxDateEdit [14]
          Left = 60
          Top = 312
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 116
        end
        object edtToDateActiveted: TcxDateEdit [15]
          Left = 60
          Top = 336
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 116
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem11: TdxLayoutItem [11]
            ShowCaption = False
            Control = Label3
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtFromDateActiveted: TdxLayoutItem [12]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDateActiveted
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtToDateActiveted: TdxLayoutItem [13]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDateActiveted
            ControlOptions.ShowBorder = False
          end
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
              Column = colDutySumma
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colExcise
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colNDS
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colCustomsFees
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colPercents
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colPenaltySumma
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = colSumma
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_PAYED
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewPENALTY_SUMMA_PAYED
            end>
          inherited colDocNumber: TcxGridDBBandedColumn
            Width = 104
            Position.ColIndex = 6
          end
          inherited colDocDate: TcxGridDBBandedColumn
            Width = 85
            Position.ColIndex = 7
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 191
            Position.ColIndex = 8
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.ColIndex = 23
          end
          object grdDataDBBandedTableViewColumnDeclINN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN'
            Width = 105
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumnDeclKPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP'
            Width = 92
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object colDutySumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DUTY_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 121
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object colExcise: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXCISE'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object colNDS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NDS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object colCustomsFees: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_FEES'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            MinWidth = 75
            Width = 87
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object colPercents: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERCENT'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object colPaymentDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object colPenaltySumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PENALTY_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 75
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPENALTY_SUMMA_PAYED: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PENALTY_SUMMA_PAYED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object colExecutionDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXECUTION_DATE'
            MinWidth = 100
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object colSumma: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_PAYED: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_PAYED'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object colASD_Doc_Number: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASD_DOC_NUMBER'
            Width = 164
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1086#1074#1077#1076#1077#1085
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 22
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
      Enabled = False
      Visible = False
    end
    inherited actSwitchSearchCriteria: TAction
      Visible = True
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
      'SELECT np.*'
      '  FROM fdc_noticepay_lst_rights np'
      ' WHERE (:Name is null or upper(np.NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (np.decl_name        LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (np.decl_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (np.decl_kpp         LIKE :KPP)'
      '/*$p#doc_no#*/    AND (np.doc_number       LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (np.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (np.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (np.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (np.summa <= :SUM_MAX)'
      
        '/*$p#from_date_activeted#*/ AND (:FROM_DATE_ACTIVETED is null or' +
        ' np.activation_date >= :FROM_DATE_ACTIVETED)'
      
        '/*$p#to_date_activeted#*/   AND (:TO_DATE_ACTIVETED is null or n' +
        'p.activation_date  <= :TO_DATE_ACTIVETED)'
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
        Name = 'DECL_NAME'
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
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUM_MAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'FROM_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TO_DATE_ACTIVETED'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataIS_TS: TStringField
      Visible = False
    end
    object dsDataDEBTS_REASON_ID: TFloatField
      FieldName = 'DEBTS_REASON_ID'
    end
    object dsDataDUTY_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1087#1086#1096#1083#1080#1085#1099
      FieldName = 'DUTY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataEXCISE: TFloatField
      DisplayLabel = #1040#1082#1094#1080#1079
      FieldName = 'EXCISE'
      DisplayFormat = ',0.00'
    end
    object dsDataNDS: TFloatField
      DisplayLabel = #1053#1044#1057
      FieldName = 'NDS'
      DisplayFormat = ',0.00'
    end
    object dsDataCUSTOMS_FEES: TFloatField
      DisplayLabel = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1077' '#1089#1073#1086#1088#1099
      FieldName = 'CUSTOMS_FEES'
      DisplayFormat = ',0.00'
    end
    object dsDataPERCENT: TFloatField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090#1099
      FieldName = 'PERCENT'
      DisplayFormat = ',0.00'
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      DisplayLabel = #1057#1088#1086#1082' '#1091#1087#1083#1072#1090#1099
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataPENALTY_SDATE: TDateTimeField
      DisplayLabel = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1077#1085#1077#1081' '#1089
      FieldName = 'PENALTY_SDATE'
    end
    object dsDataPENALTY_EDATE: TDateTimeField
      DisplayLabel = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1077' '#1087#1077#1085#1077#1081' '#1087#1086
      FieldName = 'PENALTY_EDATE'
    end
    object dsDataPENALTY_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1077#1085#1077#1081
      FieldName = 'PENALTY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataEXECUTION_DATE: TDateTimeField
      DisplayLabel = #1057#1088#1086#1082' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
      FieldName = 'EXECUTION_DATE'
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsDataASD_DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      FieldName = 'ASD_DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataSUMMA_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SUMMA_PAYED'
    end
    object dsDataPENALTY_SUMMA_PAYED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086' '#1087#1077#1085#1080
      FieldName = 'PENALTY_SUMMA_PAYED'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 445
    Top = 114
    object stlNotReadyNotice: TcxStyle
      AssignedValues = [svColor]
      Color = 7895295
    end
    object stlNotDecisionForced: TcxStyle
      AssignedValues = [svColor]
      Color = 11652863
    end
  end
end
