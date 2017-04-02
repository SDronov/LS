inherited CancelDecisionPaybackGridForm: TCancelDecisionPaybackGridForm
  Left = 245
  Top = 200
  Width = 860
  Height = 544
  Caption = #1054#1090#1084#1077#1085#1072' '#1088#1077#1096#1077#1085#1080#1103' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 492
    Width = 852
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 547
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 547
      end
      inherited pnlProgress: TPanel
        Width = 547
        inherited lblProgress: TcxLabel
          Width = 547
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 760
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 489
    Width = 852
  end
  inherited pnlWorkspace: TPanel
    Width = 852
    Height = 463
    inherited splSearchCriteria: TSplitter
      Height = 463
    end
    inherited pnlSearchCriteria: TPanel
      Height = 463
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 443
        inherited Label1: TLabel
          Width = 29
        end
        inherited Label2: TLabel
          Width = 34
        end
        object lblActiveDate: TLabel [2]
          Left = 9
          Top = 293
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Left = 117
          Top = 412
          TabOrder = 12
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Left = 117
          Top = 383
          TabOrder = 11
        end
        inherited edtINN: TcxTextEdit
          Width = 113
        end
        inherited edtKPP: TcxTextEdit
          Width = 113
        end
        inherited edtNomer: TcxTextEdit
          Width = 113
        end
        inherited edtFromDate: TcxDateEdit
          Width = 113
        end
        inherited edtToDate: TcxDateEdit
          Width = 113
        end
        inherited edtSumMin: TcxCurrencyEdit
          Width = 113
        end
        inherited edtSumMax: TcxCurrencyEdit
          Width = 113
        end
        object edtActiveFrom: TcxDateEdit [14]
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
          Width = 132
        end
        object edtActiveTo: TcxDateEdit [15]
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
          Width = 132
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lciActiveDate: TdxLayoutItem [11]
            ShowCaption = False
            Control = lblActiveDate
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciActiveFrom: TdxLayoutItem [12]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtActiveFrom
            ControlOptions.ShowBorder = False
          end
          object lciActiveTo: TdxLayoutItem [13]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtActiveTo
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 647
      Height = 463
      inherited grdData: TcxGrid
        Width = 647
        Height = 463
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDEC_SUMMA
            end>
          Styles.OnGetContentStyle = grdDataDBBandedTableViewStylesGetContentStyle
          inherited colDocNumber: TcxGridDBBandedColumn
            Width = 112
          end
          inherited colDocDate: TcxGridDBBandedColumn
            Width = 103
          end
          object colDeclInn: TcxGridDBBandedColumn [7]
            DataBinding.FieldName = 'DECL_INN'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object colDeclKpp: TcxGridDBBandedColumn [8]
            DataBinding.FieldName = 'DECL_KPP'
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          inherited colDeclName: TcxGridDBBandedColumn
            Width = 246
          end
          object grdDataDBBandedTableViewDEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_DATE'
            Width = 96
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_NUMBER'
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 123
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEC_CURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_CURR_CODE'
            Width = 75
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDEC_CURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DEC_CURR_NAME'
            Width = 132
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXT_SOURCE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXT_SOURCE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Width = 112
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 81
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
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
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from FDC_CANCEL_DEC_PAYBACK_LST DP'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (dp.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (dp.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (dp.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (dp.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (dp.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (dp.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (dp.dec_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (dp.dec_summa <= :SUM_MAX)'
      '/*$p#active_from#*/ AND (dp.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (dp.activation_date  <= :ACTIVE_TO)'
      '   and rownum <= :MaxRecordCount  ')
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
        Name = 'ACTIVE_FROM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ACTIVE_TO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataDECL_NAME: TStringField
      Size = 1500
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      DisplayWidth = 30
      FieldName = 'IS_ACTIVE'
      Size = 30
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataDEC_PAY_ID: TFloatField
      FieldName = 'DEC_PAY_ID'
      Visible = False
    end
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1059#1095#1072#1089#1090#1085#1080#1082#1072' '#1042#1069#1044
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataDEC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'DEC_DATE'
    end
    object dsDataDEC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'DEC_NUMBER'
      Size = 100
    end
    object dsDataDEC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1088#1077#1096#1077#1085#1080#1103
      FieldName = 'DEC_SUMMA'
    end
    object dsDataDEC_CURR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'DEC_CURR_CODE'
      Size = 3
    end
    object dsDataDEC_CURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'DEC_CURR_NAME'
      Size = 1500
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataEXT_SOURCE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
  end
end
