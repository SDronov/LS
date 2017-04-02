inherited RManDecisionGridForm: TRManDecisionGridForm
  Left = 333
  Top = 237
  Width = 923
  Height = 526
  Caption = 'RManDecisionGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 467
    Width = 915
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 609
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 609
      end
      inherited pnlProgress: TPanel
        Width = 609
        inherited lblProgress: TcxLabel
          Width = 609
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 822
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 464
    Width = 915
  end
  inherited pnlWorkspace: TPanel
    Width = 915
    Height = 436
    inherited splSearchCriteria: TSplitter
      Height = 436
    end
    inherited pnlSearchCriteria: TPanel
      Height = 436
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 416
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
            Caption = 'C'
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
      Width = 710
      Height = 436
      inherited grdData: TcxGrid
        Width = 710
        Height = 436
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Visible = True
          end
          object colAppDate: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'APP_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object colAppDateIncome: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1079#1072#1103#1074#1083#1077#1085#1080#1103' ('#1074#1093#1086#1076#1103#1097#1072#1103')'
            DataBinding.FieldName = 'APP_DATE_INCOME'
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object colSumma: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
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
      'select d.*'
      '  from fdc_decision_lst d'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (d.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (d.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (d.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (d.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (d.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (d.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (d.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (d.summa <= :SUM_MAX)'
      '/*$p#active_from#*/ AND (d.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (d.activation_date  <= :ACTIVE_TO)'
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
    inherited dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1085#1103#1090#1080#1103' '#1088#1077#1096#1077#1085#1080#1103
    end
    inherited dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1088#1077#1096#1077#1085#1080#1103
    end
    object dsDataAPP_NUMBER: TStringField
      DisplayWidth = 100
      FieldName = 'APP_NUMBER'
    end
    object dsDataAPP_DATE: TDateTimeField
      FieldName = 'APP_DATE'
    end
    object dsDataAPP_DATE_INCOME: TDateTimeField
      FieldName = 'APP_DATE_INCOME'
    end
    object dsDataREASON_ID: TFloatField
      FieldName = 'REASON_ID'
    end
    object dsDataSUMMA: TFloatField
      DisplayWidth = 15
      FieldName = 'SUMMA'
    end
  end
end
