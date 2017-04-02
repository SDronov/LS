inherited AdviceGridForm: TAdviceGridForm
  Left = 260
  Top = 272
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1091#1095#1072#1089#1090#1085#1080#1082#1091' '#1042#1069#1044
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 104
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Width = 400
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 400
      end
      inherited pnlProgress: TPanel
        Width = 400
        inherited lblProgress: TcxLabel
          Width = 400
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 610
    end
  end
  inherited pnlWorkspace: TPanel
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited Label1: TLabel
          Top = 284
        end
        inherited Label2: TLabel
          Top = 351
        end
        object Label3: TLabel [2]
          Left = 9
          Top = 418
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 514
          TabOrder = 15
        end
        inherited edtName: TcxTextEdit
          Width = 183
        end
        inherited btnSearchClear: TcxButton
          Top = 485
          TabOrder = 14
        end
        inherited edtFromDate: TcxDateEdit
          Top = 303
          TabOrder = 8
        end
        inherited edtToDate: TcxDateEdit
          Top = 327
          TabOrder = 9
        end
        inherited edtSumMin: TcxCurrencyEdit
          Top = 370
          TabOrder = 10
        end
        inherited edtSumMax: TcxCurrencyEdit
          Top = 394
          TabOrder = 11
        end
        object edtFromDateActiveted: TcxDateEdit [14]
          Left = 60
          Top = 437
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 12
          Width = 116
        end
        object edtToDateActiveted: TcxDateEdit [15]
          Left = 60
          Top = 461
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 13
          Width = 116
        end
        object edtDocOsnCustomsCode: TcxTextEdit [16]
          Left = 60
          Top = 190
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 121
        end
        object edtDocOsnDate: TcxDateEdit [17]
          Left = 60
          Top = 217
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 121
        end
        object edtDocOsnNumber: TcxTextEdit [18]
          Left = 60
          Top = 244
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 121
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcgDocOsn: TdxLayoutGroup [5]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            object lciDocOsnCustomsCode: TdxLayoutItem
              Caption = #1050#1086#1076' '#1058#1054
              Control = edtDocOsnCustomsCode
              ControlOptions.ShowBorder = False
            end
            object lciDocOsnDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072
              Control = edtDocOsnDate
              ControlOptions.ShowBorder = False
            end
            object lciDocOsnNumber: TdxLayoutItem
              Caption = #1053#1086#1084#1077#1088
              Control = edtDocOsnNumber
              ControlOptions.ShowBorder = False
            end
          end
          object lcSearchCrtActiveted_date: TdxLayoutItem [12]
            Caption = 'ddd'
            ShowCaption = False
            Control = Label3
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtFromDateActiveted: TdxLayoutItem [13]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDateActiveted
            ControlOptions.ShowBorder = False
          end
          object lcSearchCrtToDateActiveted: TdxLayoutItem [14]
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
              Column = colSumma
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_AVAIL
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_REST
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_TS
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_TS_AVAIL
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA_TS_REST
            end>
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end
            item
              Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1089#1086#1102#1079
            end>
          object grdDataDBBandedTableViewADVICE_STATE: TcxGridDBBandedColumn [5]
            DataBinding.FieldName = 'ADVICE_STATE'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          inherited colDocNumber: TcxGridDBBandedColumn
            Position.ColIndex = 11
          end
          object colCustomName: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'CUSTOM_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn1: TcxGridDBBandedColumn [9]
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumn2: TcxGridDBBandedColumn [10]
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object colSumma: TcxGridDBBandedColumn [11]
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 126
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_AVAIL: TcxGridDBBandedColumn [12]
            DataBinding.FieldName = 'SUMMA_AVAIL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_REST: TcxGridDBBandedColumn [13]
            DataBinding.FieldName = 'SUMMA_REST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 130
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 261
          end
          object grdDataDBBandedTableViewColumnINN: TcxGridDBBandedColumn [15]
            DataBinding.FieldName = 'DECL_INN'
            Width = 103
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewColumnKPP: TcxGridDBBandedColumn [16]
            DataBinding.FieldName = 'DECL_KPP'
            Width = 93
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Position.BandIndex = 1
            Position.ColIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_TS'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_TS_AVAIL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_TS_AVAIL'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_TS_REST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_TS_REST'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 130
            Position.BandIndex = 1
            Position.ColIndex = 3
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
            Item = barCBFilterState
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
    object barCBFilterState: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 2
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = barCBFilterStateChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        #1042#1089#1077
        #1057' '#1088#1077#1096#1077#1085#1080#1077#1084
        #1041#1077#1079' '#1088#1077#1096#1077#1085#1080#1103)
      ItemIndex = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT q.*'
      
        '      ,CASE WHEN summa_rest = 0 THEN '#39#1047#1072#1082#1088#1099#1090#1086#39' ELSE to_char( NUL' +
        'L ) END AS advice_state'
      '      ,p_advice.GetAdviceAvailSum( q.id ) AS summa_avail'
      '      ,p_advice.GetAdviceSum( q.id, '#39'Y'#39' )      AS summa_ts'
      '      ,p_advice.GetAdviceAvailSum( q.id, '#39'Y'#39' ) AS summa_ts_avail'
      '      ,p_advice.GetAdviceRestSum( q.id, '#39'Y'#39' )  AS summa_ts_rest'
      'FROM (  SELECT a.*'
      '              ,p_advice.GetAdviceSum( a.id )      AS summa'
      '              ,p_advice.GetAdviceRestSum( a.id )  AS summa_rest'
      '         FROM fdc_advice_lst  a'
      '         where (:Name is null or upper(NAME) like upper(:Name))'
      '           AND (   (:VM = 0)'
      
        '                OR (:VM = 1 AND state_id = fdc_object_get_bysysn' +
        'ame( '#39'State'#39', '#39'Advice.Decision'#39' ))'
      
        '                OR (:VM = 2 AND state_id = fdc_object_get_bysysn' +
        'ame( '#39'State'#39', '#39'Advice.NoDecision'#39'))'
      '                )'
      '           AND rownum <= :MaxRecordCount'
      '/*$p#decl_name#*/ AND (a.decl_name        LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (a.decl_inn         LIKE :INN)'
      '/*$p#kpp#*/       AND (a.decl_kpp         LIKE :KPP)'
      '/*$p#doc_no#*/    AND (a.doc_number       LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (a.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (a.doc_date  <= :TO_DATE)'
      
        '/*$p#from_date_activeted#*/ AND (:FROM_DATE_ACTIVETED is null or' +
        ' a.activation_date >= :FROM_DATE_ACTIVETED)'
      
        '/*$p#to_date_activeted#*/   AND (:TO_DATE_ACTIVETED is null or a' +
        '.activation_date  <= :TO_DATE_ACTIVETED)'
      '--$s#doc_osn#1*/ AND EXISTS( SELECT 0'
      '--$s#doc_osn#1*/               FROM fdc_advice_charge_lst c'
      '--$s#doc_osn#1*/                   ,fdc_doc_charge_lst    d'
      '--$s#doc_osn#1*/               WHERE c.advice_id = a.id'
      '--$s#doc_osn#1*/                 AND c.decl_id   = d.id'
      
        '/*$p#doc_osn_customs_code#*/     AND d.customs_code LIKE :doc_os' +
        'n_customs_code'
      
        '/*$p#doc_osn_date#*/             AND d.reg_date     =    :doc_os' +
        'n_date'
      
        '/*$p#doc_osn_number#*/           AND d.decl_no      LIKE :doc_os' +
        'n_number'
      '--$s#doc_osn#1*/           )'
      '    ) q'
      'WHERE'
      '  1=1'
      '/*$p#sum_min#*/   AND (q.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (q.summa <= :SUM_MAX)')
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
        DataType = ftInteger
        Name = 'VM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'VM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'VM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
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
        DataType = ftString
        Name = 'doc_osn_customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'doc_osn_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'doc_osn_number'
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
      end>
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataCUSTOMS_ID: TFloatField [18]
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataDECL_OKPO: TStringField [19]
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField [20]
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataCUSTOM_NAME: TStringField [21]
      DisplayLabel = #1058#1072#1084#1086#1078#1085#1103
      DisplayWidth = 50
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataIS_ACTIVE: TStringField [22]
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField [23]
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataCUSTOMS_CODE_8: TStringField [24]
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
    object dsDataSUMMA: TFloatField [25]
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    inherited dsDataIS_TS: TStringField
      Visible = False
    end
    object dsDataSUMMA_AVAIL: TFloatField
      DisplayLabel = #1044#1086#1089#1090#1091#1087#1085#1072#1103' '#1089#1091#1084#1084#1072
      FieldName = 'SUMMA_AVAIL'
    end
    object dsDataSUMMA_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'SUMMA_REST'
    end
    object dsDataSUMMA_TS: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1058#1057
      FieldName = 'SUMMA_TS'
    end
    object dsDataSUMMA_TS_AVAIL: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1058#1057' '#1076#1086#1089#1090#1091#1087#1085#1072#1103
      FieldName = 'SUMMA_TS_AVAIL'
    end
    object dsDataSUMMA_TS_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082' '#1058#1057
      FieldName = 'SUMMA_TS_REST'
    end
    object dsDataADVICE_STATE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'ADVICE_STATE'
      Size = 7
    end
  end
end
