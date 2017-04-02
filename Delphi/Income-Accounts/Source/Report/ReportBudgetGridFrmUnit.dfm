inherited ReportBudgetGridForm: TReportBudgetGridForm
  Top = 181
  Height = 395
  Caption = #1041#1102#1076#1078#1077#1090#1085#1099#1077' '#1086#1090#1095#1105#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 343
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 340
  end
  inherited pnlWorkspace: TPanel
    Height = 314
    inherited splSearchCriteria: TSplitter
      Height = 314
    end
    inherited pnlSearchCriteria: TPanel
      Height = 314
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 294
        object labItogoSumma: TLabel [0]
          Left = 9
          Top = 72
          Width = 123
          Height = 13
          Caption = #1048#1090#1086#1075#1086#1074#1072#1103' '#1089#1091#1084#1084#1072' '#1086#1090#1095#1105#1090#1072':'
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Top = 263
          TabOrder = 8
        end
        inherited edtName: TcxTextEdit
          Top = 205
          TabOrder = 6
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 234
          TabOrder = 7
        end
        inherited edtRepDate: TcxDateEdit
          Width = 140
        end
        inherited chkIsTs: TcxCheckBox
          Top = 163
          TabOrder = 5
        end
        object edtCurrency: TcxTextEdit [7]
          Left = 76
          Top = 139
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 109
        end
        object edtSumMin: TcxCurrencyEdit [8]
          Left = 76
          Top = 91
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 183
        end
        object edtSumMax: TcxCurrencyEdit [9]
          Left = 76
          Top = 115
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 109
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciItogoSumma: TdxLayoutItem [2]
            ShowCaption = False
            Control = labItogoSumma
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciSumMin: TdxLayoutItem [3]
            Caption = '>='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMin
            ControlOptions.ShowBorder = False
          end
          object lciSumMax: TdxLayoutItem [4]
            Caption = '<='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMax
            ControlOptions.ShowBorder = False
          end
          object lciCurrency: TdxLayoutItem [5]
            Caption = #1042#1072#1083#1102#1090#1072':'
            Control = edtCurrency
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 314
      inherited grdData: TcxGrid
        Height = 314
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
          end
          object grdDataDBBandedTableViewREP_NUMBER: TcxGridDBBandedColumn
            Caption = #1053#1086#1084#1077#1088' '#1086#1090#1095#1105#1090#1072
            DataBinding.FieldName = 'REP_NUMBER'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREP_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1090#1095#1105#1090#1072
            DataBinding.FieldName = 'REP_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREPTYPE_NAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087' '#1086#1090#1095#1105#1090#1072
            DataBinding.FieldName = 'REPTYPE_NAME'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_NAME'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewITOG_SUMMA: TcxGridDBBandedColumn
            Caption = #1048#1090#1086#1075#1086#1074#1072#1103' '#1089#1091#1084#1084#1072
            DataBinding.FieldName = 'ITOG_SUMMA'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1089#1086#1102#1079#1072
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 10
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
            Item = dxBarComboShowData
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
      26
      0)
    object dxBarComboShow: TCustomdxBarCombo
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Description = #1055#1086#1082#1072#1079#1072#1090#1100
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      ReadOnly = True
      ShowCaption = True
      Width = 100
    end
    object dxBarComboShowData: TdxBarCombo
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 0
      Description = #1055#1086#1082#1072#1079#1072#1090#1100
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100
      Visible = ivAlways
      Text = #1042#1089#1077
      OnChange = dxBarComboShowDataChange
      ShowCaption = True
      Width = 100
      Items.Strings = (
        #1042#1089#1077
        #1058#1086#1083#1100#1082#1086' '#1058#1057
        #1048#1089#1082#1083#1102#1095#1072#1103' '#1058#1057)
      ItemIndex = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'REPORT_TYPE_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_report_budget_Lst'
      'where report_type_id = :report_type_id'
      
        '  and (:repnumber is null or upper(rep_number) like upper(:repnu' +
        'mber))'
      '  and (:repdate is null or :repdate = rep_date)'
      '  and (:sum_min is null or :sum_min <= itog_summa)'
      '  and (:sum_max is null or :sum_max >= itog_summa)'
      '  and (:ists is null or :ists = is_ts)'
      '  and (:currcode is null or :currcode = curr_code)'
      '  and (case :show'
      '            when 1 then is_ts'
      
        '            when 2 then (case is_ts when '#39'N'#39' then '#39'Y'#39' else '#39'N'#39' e' +
        'nd)'
      '            else '#39'Y'#39' '
      '         end) = '#39'Y'#39
      '  and (rownum <= :MaxRecordCount)')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'report_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'repnumber'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'repnumber'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'repdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'repdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'sum_min'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'sum_min'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'sum_max'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'sum_max'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ists'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'currcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'currcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'show'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
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
    object dsDataREP_NUMBER: TStringField
      FieldName = 'REP_NUMBER'
      Size = 255
    end
    object dsDataREP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataREPORT_TYPE_ID: TFloatField
      FieldName = 'REPORT_TYPE_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataITOG_SUMMA: TFloatField
      FieldName = 'ITOG_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataREPTYPE_NAME: TStringField
      FieldName = 'REPTYPE_NAME'
      Size = 1500
    end
    object dsDataREPTYPE_SYSNAME: TStringField
      FieldName = 'REPTYPE_SYSNAME'
      Size = 1500
    end
    object dsDataREPTYPE_TEMPLATE_NAME: TStringField
      FieldName = 'REPTYPE_TEMPLATE_NAME'
      Size = 400
    end
  end
end
