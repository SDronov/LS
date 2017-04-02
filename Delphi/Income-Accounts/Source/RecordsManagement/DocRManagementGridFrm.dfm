inherited DocRManagementGridForm: TDocRManagementGridForm
  Width = 719
  Height = 435
  Caption = 'DocRManagementGridForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 376
    Width = 711
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 0
      Top = 2
      Width = 102
      Height = 23
      inherited lblRecordCount: TcxLabel
        Height = 23
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Top = 2
      Width = 405
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 405
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 405
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 405
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 618
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 373
    Width = 711
  end
  inherited pnlWorkspace: TPanel
    Width = 711
    Height = 345
    inherited splSearchCriteria: TSplitter
      Height = 345
    end
    inherited pnlSearchCriteria: TPanel
      Height = 345
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 325
        object Label1: TLabel [0]
          Left = 9
          Top = 159
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072' '
          Color = 16311512
          ParentColor = False
        end
        object Label2: TLabel [1]
          Left = 9
          Top = 226
          Width = 34
          Height = 13
          Caption = #1057#1091#1084#1084#1072
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Left = 100
          Top = 322
          TabOrder = 10
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Left = 100
          Top = 293
          TabOrder = 9
        end
        object edtDeclName: TcxTextEdit [5]
          Left = 9
          Top = 63
          Hint = #1044#1083#1103' '#1079#1072#1076#1072#1085#1080#1103' '#1096#1072#1073#1083#1086#1085#1072' '#1087#1086#1080#1089#1082#1072' '#1080#1089#1087#1086#1083#1100#1079#1091#1081#1090#1077' '#1089#1080#1084#1074#1086#1083#1099' "%" '#1080' "_"'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          OnKeyDown = edtSearchKeyDown
          Width = 167
        end
        object edtINN: TcxTextEdit [6]
          Left = 60
          Top = 87
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 113
        end
        object edtKPP: TcxTextEdit [7]
          Left = 60
          Top = 111
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 113
        end
        object edtNomer: TcxTextEdit [8]
          Left = 60
          Top = 135
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 113
        end
        object edtFromDate: TcxDateEdit [9]
          Left = 60
          Top = 178
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 113
        end
        object edtToDate: TcxDateEdit [10]
          Left = 60
          Top = 202
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 113
        end
        object edtSumMin: TcxCurrencyEdit [11]
          Left = 60
          Top = 245
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 113
        end
        object edtSumMax: TcxCurrencyEdit [12]
          Left = 60
          Top = 269
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 113
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            CaptionOptions.Layout = clTop
            Control = edtDeclName
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [2]
            Caption = #1048#1053#1053
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [3]
            Caption = #1050#1055#1055
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [4]
            Caption = #1053#1086#1084#1077#1088'     '
            Control = edtNomer
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem5: TdxLayoutItem [5]
            ShowCaption = False
            Control = Label1
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem6: TdxLayoutItem [6]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem7: TdxLayoutItem [7]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [8]
            ShowCaption = False
            Control = Label2
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem9: TdxLayoutItem [9]
            Caption = '>='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem10: TdxLayoutItem [10]
            Caption = '=<'
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMax
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 506
      Height = 345
      inherited grdData: TcxGrid
        Width = 506
        Height = 345
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
          end
          object colDocNumber: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object colDocDate: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object colDeclName: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME'
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    inherited actSwitchSearchCriteria: TAction
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
      'select *'
      '  from fdc_rmanagement_lst dp'
      ' where (:Name is null or upper(NAME) like upper(:Name))'
      '/*$p#decl_name#*/ AND (dp.decl_name         LIKE :DECL_NAME)'
      '/*$p#inn#*/       AND (dp.decl_inn          LIKE :INN)'
      '/*$p#kpp#*/       AND (dp.decl_kpp          LIKE :KPP)'
      '/*$p#doc_no#*/    AND (dp.doc_number            LIKE :DOC_NO)'
      '/*$p#from_date#*/ AND (dp.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (dp.doc_date  <= :TO_DATE)'
      '/*$p#sum_min#*/   AND (dp.summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (dp.summa <= :SUM_MAX)'
      '  and rownum <= :MaxRecordCount')
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
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 20
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataDECL_NAME: TStringField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      DisplayWidth = 50
      FieldName = 'DECL_NAME'
      Size = 4000
    end
    object dsDataDECL_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
end
