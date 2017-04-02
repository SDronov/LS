inherited PaymentOrderGridForm: TPaymentOrderGridForm
  Left = 335
  Top = 293
  Width = 922
  Height = 729
  HelpContext = 4102
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 666
    Width = 906
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 603
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 603
      end
      inherited pnlProgress: TPanel
        Width = 603
        inherited lblProgress: TcxLabel
          Width = 603
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 813
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 663
    Width = 906
  end
  inherited pnlWorkspace: TPanel
    Width = 906
    Height = 635
    inherited splSearchCriteria: TSplitter
      Left = 196
      Height = 635
    end
    inherited pnlSearchCriteria: TPanel
      Width = 196
      Height = 635
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 196
        Height = 615
        object Label1: TLabel [0]
          Left = 9
          Top = 153
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072' '
          Color = 16311512
          ParentColor = False
        end
        object Label2: TLabel [1]
          Left = 9
          Top = 220
          Width = 80
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
          Color = 16311512
          ParentColor = False
        end
        object lblActiveDate: TLabel [2]
          Left = 9
          Top = 287
          Width = 77
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
          Color = 16311512
          ParentColor = False
        end
        inherited btnSearch: TcxButton
          Left = 112
          Top = 584
          TabOrder = 14
        end
        inherited edtName: TcxTextEdit
          Left = 78
          Top = 9
          Width = 105
        end
        object edtINN: TcxTextEdit [5]
          Left = 78
          Top = 33
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 105
        end
        object edtNomer: TcxTextEdit [6]
          Left = 78
          Top = 81
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 105
        end
        object edtCurrency: TcxTextEdit [7]
          Left = 78
          Top = 105
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 105
        end
        object edtFromDate: TcxDateEdit [8]
          Left = 78
          Top = 172
          OnFocusChanged = edtFromDateFocusChanged
          ParentFont = False
          Properties.OnChange = edtFromDatePropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 6
          Width = 105
        end
        object edtToDate: TcxDateEdit [9]
          Left = 78
          Top = 196
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 105
        end
        object edtSumMin: TcxCurrencyEdit [10]
          Left = 78
          Top = 239
          OnFocusChanged = edtSumMinFocusChanged
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Properties.OnChange = edtSumMinPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 8
          Width = 105
        end
        object edtSumMax: TcxCurrencyEdit [11]
          Left = 78
          Top = 263
          ParentFont = False
          Properties.DisplayFormat = ',0.00'
          Properties.EditFormat = ',0.00'
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 105
        end
        object edtKPP: TcxTextEdit [12]
          Left = 78
          Top = 57
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 105
        end
        object edtPayCode: TcxTextEdit [13]
          Left = 78
          Top = 129
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 109
        end
        object edtDescript: TcxMemo [14]
          Left = 9
          Top = 369
          ParentFont = False
          Properties.WantReturns = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Height = 50
          Width = 83
        end
        inherited btnSearchClear: TcxButton
          Left = 112
          Top = 555
          TabOrder = 13
        end
        object edtActiveFrom: TcxDateEdit [16]
          Left = 78
          Top = 306
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
        object edtActiveTo: TcxDateEdit [17]
          Left = 78
          Top = 330
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 132
        end
        inherited lcSearchCriteriaGroup_Root: TdxLayoutGroup
          inherited lciName: TdxLayoutItem
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082':'
            CaptionOptions.Layout = clLeft
          end
          object lcSearchCriteriaItem1: TdxLayoutItem [1]
            Caption = #1048#1053#1053':'
            Control = edtINN
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem10: TdxLayoutItem [2]
            Caption = #1050#1055#1055':'
            Control = edtKPP
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem2: TdxLayoutItem [3]
            Caption = #1053#1086#1084#1077#1088':'
            Control = edtNomer
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem3: TdxLayoutItem [4]
            Caption = #1042#1072#1083#1102#1090#1072':'
            Control = edtCurrency
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem11: TdxLayoutItem [5]
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            Control = edtPayCode
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem6: TdxLayoutItem [6]
            ShowCaption = False
            Control = Label1
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem4: TdxLayoutItem [7]
            Caption = #1089
            CaptionOptions.AlignHorz = taCenter
            Control = edtFromDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem5: TdxLayoutItem [8]
            Caption = #1087#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtToDate
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem7: TdxLayoutItem [9]
            ShowCaption = False
            Control = Label2
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem8: TdxLayoutItem [10]
            Caption = '>='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMin
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem9: TdxLayoutItem [11]
            Caption = '<='
            CaptionOptions.AlignHorz = taCenter
            Control = edtSumMax
            ControlOptions.ShowBorder = False
          end
          object lciActiveDate: TdxLayoutItem [12]
            ShowCaption = False
            Control = lblActiveDate
            ControlOptions.AutoColor = True
            ControlOptions.ShowBorder = False
          end
          object lciActiveFrom: TdxLayoutItem [13]
            Caption = #1057
            CaptionOptions.AlignHorz = taCenter
            Control = edtActiveFrom
            ControlOptions.ShowBorder = False
          end
          object lciActiveTo: TdxLayoutItem [14]
            Caption = #1055#1086
            CaptionOptions.AlignHorz = taCenter
            Control = edtActiveTo
            ControlOptions.ShowBorder = False
          end
          object lcSearchCriteriaItem12: TdxLayoutItem [15]
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '
            CaptionOptions.Layout = clTop
            Control = edtDescript
            ControlOptions.ShowBorder = False
          end
        end
        object lcSearchCriteriaGroup1: TdxLayoutGroup
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 196
      end
    end
    inherited pnlGrid: TPanel
      Left = 200
      Width = 706
      Height = 635
      inherited grdData: TcxGrid
        Width = 706
        Height = 635
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          DataController.DataModeController.DetailInSQLMode = True
          DataController.DetailKeyFieldNames = 'ACC_CODE;ACC_OPER_DATE;ACC_CURRENCY_ID'
          DataController.KeyFieldNames = 'AK;ID'
          DataController.MasterKeyFieldNames = 'ACC_CODE;ACC_OPER_DATE;ACC_CURRENCY_ID'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewLOCKED_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableViewAIL_SUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewREST_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewLOCKED_SUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewAIL_SUMMA
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Hidden = True
            Width = 112
          end
          object grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO'
            Width = 74
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Width = 68
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Width = 113
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            Width = 83
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDestCustomsCode: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBK'
            Width = 153
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 122
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 82
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOCKED_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Width = 69
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Visible = False
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 58
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_SYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_NAME'
            Visible = False
            Width = 241
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASSURE_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCOMING_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'COMING_DATE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 64
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewAIL_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AVAIL_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINCOMDE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object columnIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object columnACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object columnIS_ARCHIVE: TcxGridDBBandedColumn
            Caption = #1040#1088#1093#1080#1074#1085#1099#1081
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewUIN: TcxGridDBBandedColumn
            Caption = #1059#1048#1053
            DataBinding.FieldName = 'UIN'
            MinWidth = 25
            Width = 154
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
        end
        object vwAccData: TcxGridDBBandedTableView [2]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataModeController.DetailInSQLMode = True
          DataController.DataSource = srcAccData
          DataController.KeyFieldNames = 'ACC_CODE;ACC_OPER_DATE;ACC_CURRENCY_ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object vwAccDataACC_OPER_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACC_OPER_DATE'
            Width = 182
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object vwAccDataSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DAYSUM'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 202
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object lvlAccData: TcxGridLevel
          GridView = vwAccData
          object lvlAccDataDetails: TcxGridLevel
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object actAssure: TAction
      Category = 'Object'
      Caption = #1047#1072#1074#1077#1088#1080#1090#1100' ...'
      Hint = #1047#1072#1074#1077#1088#1080#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 9
      OnExecute = actAssureExecute
      OnUpdate = actAssureUpdate
    end
    object actCorrect: TAction
      Category = 'Object'
      Caption = #1048#1089#1087#1088#1072#1074#1080#1090#1100
      Enabled = False
      Visible = False
      OnExecute = actCorrectExecute
      OnUpdate = actCorrectUpdate
    end
    object actIdentify: TAction
      Category = 'Object'
      Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1090#1100
      Hint = #1048#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1087#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      OnExecute = actIdentifyExecute
      OnUpdate = actIdentifyUpdate
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
  inherited imglAction: TImageList
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000292F200008DEB000089
      E5000088E2000087E1000087E1000087E1000087E1000087E1000087E1000087
      E1000085DE000083DA00007DD0000062A4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A9AFA000496F8000093F5000091
      F2000091F1000090F0000090F0000090F0000090F0000090F0000090F0000090
      F000008FEF00008EED000083DB00007DD0000000000000000000000000000000
      000000000000000000004C964C0013731300227A22007CAF7C00000000000000
      000000000000000000000000000000000000FFFFFF0052ADFF0018529400185A
      9C00185A9C00185A9C00185AA500185AA500185A9C00185A9C00185294001852
      940018528C00184A84004AADFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000F9FFF00079CFF000099FF000099
      FF000099FF000099FF004CBFFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF00008EED000083DB000000000000000000000000000000
      000006770100128B00000E890000198100002F7100002F6F0000266E00003A8F
      3A0000000000000000000000000000000000FFFFFF00185AA500186BBD001873
      CE001873CE001873CE001873CE001873CE001873CE001873CE001873CE00186B
      C600186BBD00185AA500104A7B00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013A1FF00099DFF000099FF000099
      FF000099FF004CBFFF00CCFFFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF00008FEF000086DF000000000000000000000000000295
      0400029C0600029B04000099000000970000009500000093000032700000336C
      0000086C0800000000000000000000000000FFFFFF001863AD001873CE00187B
      DE00187BDE00187BE700187BE700188CFF00188CFF00188CFF00188CFF00187B
      DE00186BC6001863AD0018528C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000016A2FF000A9DFF000099FF000099
      FF003FB9FF00CCFFFF00CCFFFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF000091F1000088E20000000000000000000A930F0009A3
      120009A213001DBF4900AAE7C10014B53500029B050000970000009200001E7B
      0000336C00003A8E3A000000000000000000FFFFFF00186BC600187BDE001884
      EF001884EF00FFFFFF00188CFF00ADDEFF00ADDEFF00ADDEFF00188CFF001884
      EF001873CE00186BBD0018529400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF000B9DFF000099FF0026AC
      FF00BFF9FF00CCFFFF00CCFFFF007FD9FF0066CCFF0066CCFF0066CCFF0066CC
      FF004CBFFF000099FF000091F1000088E2000000000050AB50001EAE2E000FA8
      1F000BAF2800FBF2F800F5F5F500FFFFFF0015B63700049D0900009901000093
      0000366D0000276E00000000000000000000FFFFFF001873CE00187BE700188C
      FF00188CFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADDEFF001884
      EF001873D600186BC600185A9C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF000B9DFF0026ACFF00BFF9
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFF
      FF0099E5FF000099FF000091F1000088E2000000000013981B0012AD2900009F
      0600F3EBF200EEEEEE00F4F4F400FAFAFA00FFFFFF0016B73800049D0A000099
      010000950000317000007AAF7A0000000000FFFFFF00187BDE00188CFF00188C
      FF00188CFF00FFFFFF00FFFFFF00188CFF00188CFF00188CFF00FFFFFF00187B
      E7001873D6001873CE00185AA500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF002FAFFF00BFF9FF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFF
      FF0099E5FF000099FF000091F1000088E200000000003BB94E0004A21500F1E5
      F100E5E5E500FBF0F90041BC5300FFFBFF00FEFEFE00FFFFFF0015B63800039C
      080000980000337100001E7B1E0000000000FFFFFF00187BE700188CFF00188C
      FF00188CFF00FFFFFF00FFFFFF00FFFFFF00188CFF00188CFF001884EF00187B
      DE001873CE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF009CE6FF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFF
      FF008CDFFF000099FF000091F1000088E200000000004DC463002CC04F006DB5
      6A00F9EAF80007A91B0020B9400007AB1F00FFFCFF00FDFCFC00FFFFFF0014B5
      3600019A0400277D00000E740E0000000000FFFFFF001884EF00188CFF00188C
      FF00188CFF00188CFF00188CFF00188CFF00188CFF001884EF00187BE7001873
      D6001873CE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF0017A3FF00A6ECFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFF
      FF004CBFFF000099FF000091F1000088E2000000000039B64D005AD079002CC5
      580024BE4C0027C0500024BD4A0021BA420006A91D00FFFAFF00F8F8F800FFFD
      FF0013B432001E8500004997490000000000FFFFFF00188CFF002194FF002194
      FF00188CFF00188CFF00188CFF001884F700FFFFFF00FFFFFF00FFFFFF001873
      CE001873CE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017A2FF000B9DFF000D9FFF00A6EC
      FF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00CCFFFF00BFF9FF005AC6
      FF000099FF000099FF000091F1000088E200000000000B910B0076DA93002CC8
      5E0030C960002DC65C0029C2530024BD49001EB83F0004A81B00FDF5FB00F3F3
      F300AAE3BB001E8700000000000000000000FFFFFF00188CFF0039A5FF0039A5
      FF002194FF00FFFFFF00188CFF00188CFF001884EF00FFFFFF00FFFFFF001873
      D6001873CE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018A3FF000B9DFF000099FF000D9F
      FF00A6ECFF00CCFFFF00CCFFFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF000091F2000088E300000000000000000074E09A0072DD
      970033CC660033CC66002DC65B0027C04F0020B943001AB3360005A71900B3DD
      BC000CAC2200077B01000000000000000000FFFFFF002194FF0052ADFF004AAD
      FF00299CFF00ADDEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00187B
      DE001873CE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001CA4FF000D9EFF000099FF000099
      FF000D9FFF00A6ECFF00CCFFFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF000092F300008AE600000000000000000039A4390079E0
      9E006EDB910031CC65002FC85E0028C1530021BA45001BB4380014AD2B000EA7
      1D00079A0E00000000000000000000000000FFFFFF0039A5FF006BBDFF0052AD
      FF0039A5FF00319CFF00ADDEFF00ADDEFF00ADDEFF00188CFF00FFFFFF001884
      EF00187BDE001873CE001863AD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000022A7FF0011A0FF000099FF000099
      FF000099FF000D9FFF00A6ECFF0032B2FF000099FF000099FF000099FF000099
      FF000099FF000099FF000094F600008EEC0000000000000000000000000039A4
      390076E19C0079DE9B004DCF750024C14E001FBA420018B3360015AD2B000997
      120000000000000000000000000000000000FFFFFF004AADFF0084C6FF006BBD
      FF0052ADFF004AADFF0039A5FF00319CFF00299CFF002194FF001894FF00188C
      FF001884EF001873CE00185A9C00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002DABFF0022A7FF0011A0FF000E9F
      FF000C9EFF000B9DFF0017A3FF002FAFFF000B9DFF000B9DFF000B9DFF000B9D
      FF000A9DFF00089CFF000597F9000393F3000000000000000000000000000000
      0000000000000D960D0042BE5A0055CD740045C15D00199E240050AF50000000
      000000000000000000000000000000000000FFFFFF00ADDEFF004AADFF00319C
      FF002194FF00188CFF00188CFF00188CFF00188CFF001884EF00187BE700187B
      DE001873CE00186BBD0063B5FF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000059BDFF002DABFF0023A7FF001CA4
      FF0018A3FF0017A2FF0017A2FF0017A2FF0017A2FF0017A2FF0017A2FF0016A2
      FF0014A1FF00109FFF000B9BFB000E95EE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5B5B500726F7E00BA93
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000031DE000031DE0000000000749BBC00315FB7006A63
      8E00BA939C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031DE000031DE0000000000000000008FCCFF0036A0FE003360
      B7006A638E00BA939C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      000000000000000000000000000000000000000000000031DE000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      00000031DE000031DE000000000000000000000000000000000082C4FF0039A4
      FE003360B7006A638E00BA939C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C60000000000000000000000000000000000000000000031DE000031DE000031
      DE000031DE000000000000000000000000000000000000000000000000000031
      DE000031DE0000000000000000000000000000000000000000000000000082C4
      FF003AA4FE003264BC006A638E00CEB7BE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD60000000000000000000000000000000000000000000031EF000031
      DE000031DE000031DE00000000000000000000000000000000000031DE000031
      DE00000000000000000000000000000000000000000000000000000000000000
      000080C3FF003AA4FE003D73C20097999E00C9A59B00BD876F00BB816800BC83
      6A00C4907A00CAA298000000000000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF000000000000000000000000000000000000000000000000000000
      00000031DE000031DE000031DE00000000000031DE000031DE000031DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009BD0FF00BCC3C900A6776800CB967600E7CA9A00F8F0BD00F8F2
      C700E7D1AB00CEA38A00C295850000000000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C60000000000000000000000000000000000000000000000
      0000000000000031DE000031E7000031E7000031E7000031DE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D2AEA500CC937400FFF2B400FFF3B200FFFFCE00FFFF
      E200FFFFF600FFFFFF00CEA38900C1999000000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C60000000000000000000000000000000000000000000000
      000000000000000000000031E7000031E7000031EF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6907900E7C69500FFDD9F00FFF7B600FFFFD100FFFF
      E600FFFFFA00FFFFF300E7D1AB00BB897200000000000000000000000000AD73
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5848400000000000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C600000000000000000000000000000000000000
      0000000000000031DE000031EF000031E7000031EF000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD826900F8EAB400FFD09200FFEEAD00FFFFCA00FFFF
      DC00FFFFE500FFFFDD00F8F2C400BA81680000000000000000003184FF003184
      FF003184FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700B5848400000000000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000000000000000000000000000000000
      00000031F7000031EF000031E70000000000000000000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD826900F8EAB400FFE0AA00FFEFB000FFFFBF00FFFF
      C700FFFFCA00FFFFC900F8EFBA00BA81670000000000000000003184FF0042B5
      F7003184FF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00B5848400000000000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000000000000000000000000000000031
      FF000031EF000031F700000000000000000000000000000000000031FF000031
      F700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6937D00E7CCA300FFEED000FFD8A600FFEAAB00FFED
      AD00FFF2B200FFF0B000E7C99700BB876F003184FF003184FF003184FF0042B5
      F7003184FF003184FF003184FF00E7E7E700E7E7E700E7E7E700E7E7E700B584
      7300B5948C00B58C8400B5848400000000000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD290008841000000000000000000000000000000000000031F7000031
      F7000031FF000000000000000000000000000000000000000000000000000031
      F7000031F7000000000000000000000000000000000000000000000000000000
      00000000000000000000D7B6AD00CB9C8000FFFFFF00FFF7E900FFEDB800FFCF
      9100FFDEA000FFF2B600CA927100CAA89F003184FF008CD6F700B5DEF700B5DE
      F700B5DEF7008CD6F7003184FF00DEDEDE00DEDEDE00DEDEDE00C6C6C600B584
      7300FFFFFF00FFFFFF00B5848400000000000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A51800000000000000000000000000000000000031F7000031F7000031
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000031F70000000000000000000000000000000000000000000000
      0000000000000000000000000000C79B8B00CA9A8300E7CCAD00F8EDBD00F8E7
      B100E7C99900CA907100BF908100000000003184FF003184FF003184FF00B5DE
      F7003184FF003184FF003184FF00D6D6D600D6D6D600D6D6D600C6C6C600B584
      7300FFFFFF00B58484000000000000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      1800088410000000000000000000000000000031F7000031F7000031F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B7AE00BE8B7600BB826800BD83
      6900C48F7B00D4B3AA00000000000000000000000000000000003184FF00B5DE
      F7003184FF00CECECE00CECECE00CECECE00CECECE00CECECE00C6C6C600B584
      7300B58484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      0800000000000000000000000000000000000031F7000031F700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003184FF003184
      FF003184FF00EFD6C600EFD6C600EFD6C600EFD6C600EFD6C600D6BDB500B584
      7300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      00000000000000000000000000000000000000000000A3787500A3787500A378
      7500A3787500A3787500A3787500A3787500A3787500A3787500A3787500A378
      7500A378750090615E0000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000A67C7600F2E2D300F2E2
      D300FFE8D100EFDFBB00FFE3C500FFDEBD00FFDDBA00FFD8B200FFD6AE00FFD2
      A500FFD2A3009364600000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      00000000000000000000000000000000000000000000AB807800F3E7DA00F3E7
      DA0001990100AFD8A00071C5700041AA300081BB5E00EFD4A600FFD6AE00FFD2
      A300FFD2A3009667630000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A000000000000000000B5948C00B5848400B584
      8400B5848400B5848400B5848400B5848400B5948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000B0837A00F4E9DD00F4E9
      DD00019901000199010001990100019901000199010041AA2F00FFD8B200FFD4
      A900FFD4A9009A6A6500000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B63000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000B6897D00F5EDE400F5ED
      E4000199010001990100119E0E00CFD6A300FFE4C80021A21A00FFD8B200FFD7
      B000FFD7B0009E6D6700000000000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400C6A59C00B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BC8E7F00F7EFE800F7EF
      E80001990100019901000199010001990100FFE4C800EFDEBA00FFD8B200FFD7
      B000FFD9B400A2706900000000000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B73000000000000000000B5948C00D6BDB500D6BD
      B500D6BDB500D6BDB500D6BDB500D6BDB500B5848400C6A59C00C6A59C00B584
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000C3958100F8F3EF00F8F3
      EF00F8F3EF00FFF4E800FFF4E800FFF4E800EFE3C400EFE3C400FFE4C800FFDE
      BD00FFDDBB00A5746B00000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B7300000000000000000000000000B5948C00E7C6
      B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A59C00C6A5
      9C00B58484000000000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000CA9B8400F9F5F200FBFB
      FB00FFF4E800FFF4E800FFF4E800019901000199010001990100FFE8D100FFE3
      C500FFE1C200A8776D00000000000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B584730000000000000000000000000000000000B594
      8C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A5
      9C00C6A59C00B584840000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      00000000000000000000000000000000000000000000D2A18700F9F9F900FBFB
      FB00119F1000AFD8A000FFF4E800AFD8A0000199010001990100FFE8D100FFE4
      C800FFE3C600AC7A6F00000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000000000000000000000000
      0000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B584
      8400C6A59C00C6A59C00B5848400000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B000000000000000000000000000000000000000000D9A88A00FBFBFB00FFFF
      FF0071C570000199010001990100019901000199010001990100FFE8D100FFE8
      D100FFE6CE00AE7C7200000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B0000000000000000000000000000000000000000000000
      000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500B5848400C6A59C00B584840000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B0000000000000000000000000000000000DFAE8C00FCFCFC00FFFF
      FF00FFFFFF0071C570000199010001990100AFD8A00001990100FFE8D100FFC8
      C200FFB0B000B07E7300000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD8484000000000000000000000000000000000000000000000000000000
      00000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500B5848400B5848400000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000E5B38F00FDFDFD00FDFD
      FD00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300FFF5EA00F4DECE00B280
      7400B2807400B2807400000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500B58484000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B000000000000000000EAB89100FEFEFE00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFAF600FFF9F300F5E1D200B280
      7400EDA75500D2A99500000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5948C00B5848400B5848400B584
      8400B5848400B5848400B5948C0000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B0000000000EFBC9200FFFFFF00FFFF
      FF00FCFCFC00FAFAFA00F7F7F700F5F5F500F2F1F100F0EDEA00E9DAD000B280
      7400D9B0980000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2BF9400DCA98700DCA9
      8700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700DCA98700B280
      74000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008000FFFF800100000000FC3F00000000
      0000F00F000000000000E007000000000000C003000000000000800300000000
      0000800100000000000080010000000000008001000000000000800100000000
      00008003000000000000C003000000000000C007000000000000E00F00000000
      0000F81F000000000000FFFF800100008FFFFFFFFFFFFFFC87FFE0018FFF9FF9
      83FFE001807F8FF3C1FFE001800F87E7E0FFE0018007C3CFF003E0018007F11F
      F801E0018003F83FFC00E0018003FC7FFC00E0018001F83FFC00C0018001F19F
      FC00C0018001E3CFFC0000018003C7E7FC00000180078FFBFE010003C3C71FFF
      FF03C007FE0F3FFFFFFFC00FFFFFFFFFFFFFF801FFFFFF3F8003F801FFFFFE3F
      8003F801FFFFFC3F8003F801807FFC3F80038001803FFC3F80038001801FFC3F
      80038001800FFC3F80038001C007FC3F80038001E003F81F80038001F001F00F
      80038003F801E00780038007FC01C0038003801FFE0180018003801FFF010000
      8007803FFFFFFFFF800F807FFFFFFFFF00000000000000000000000000000000
      000000000000}
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
            Item = btnDelete
            UserDefine = [udPaintStyle]
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnSwitchSearchCriteria
            Visible = True
          end
          item
            Item = btnAutoFilter
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxbbAssure
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = btnIdentifyAll
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = cmbxViewMode
            UserDefine = [udWidth]
            UserWidth = 151
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
    object cmbxViewMode: TdxBarCombo
      Align = iaRight
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      Category = 2
      Hint = #1054#1090#1073#1086#1088' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1093' '#1079#1072#1087#1080#1089#1077#1081
      Visible = ivAlways
      Text = #1042#1089#1077' '#1087#1086' '#1089#1091#1073#1089#1095#1105#1090#1091' '#1058#1054
      OnChange = cmbxViewModeChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        #1042#1089#1077' '#1087#1086' '#1089#1091#1073#1089#1095#1105#1090#1091' '#1058#1054
        #1042#1089#1077
        #1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077
        #1053#1072' '#1082#1086#1085#1090#1088#1086#1083#1077
        '3 '#1075#1086#1076#1072' '#1089' '#1091#1087#1083#1072#1090#1099
        #1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1087#1086' '#1082#1086#1076#1091' '#1058#1054
        #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1085#1099#1077' '#1089#1091#1084#1084#1099)
      ItemIndex = 0
    end
    object dxbbAssure: TdxBarButton
      Action = actAssure
      Category = 0
    end
    object dxBarButton1: TdxBarButton
      Action = actCorrect
      Category = 0
    end
    object btnIdentifyAll: TdxBarButton
      Action = actIdentify
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end
      item
        DataType = ftFloat
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT /*+ FIRST_ROWS(500)*/ *'
      '   FROM ('
      ''
      'SELECT'
      't.id'
      ',t.name'
      ',t.shortname'
      ',t.object_Type_id'
      ',t.state_id'
      ',t.accesslevel'
      ',t.sysname'
      ',t.descript'
      ',t.note'
      ',t.owner_object_id'
      ',t.typename'
      ',t.typesysname'
      ',t.objectkindlist'
      ',t.doc_number AS doc_no'
      ',t.doc_date'
      ',t.exec_date'
      ',t.payer_id'
      ',t.summa'
      ',t.KBK'
      ',t.currency_id'
      ',t.payer_name'
      ',t.payer_inn'
      ',t.curr_name'
      ',t.curr_code'
      ',t.doc_summa'
      ',t.rest_summa'
      ',t.doc_no2'
      ',t.doc_date2'
      ',t.DestCustomsCode'
      ',t.payer_kpp'
      ',t.coming_date'
      ',t.assure_date'
      ',t.pay_type_code'
      ',t.locked_summa'
      ',t.income_date'
      ',0 AS subject_id'
      ',t.activation_date'
      ',decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '     ,(SELECT s.sysname FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_sysname'
      
        '     ,(SELECT s.name    FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_name'
      '     ,rest_summa - locked_summa AS AVAIL_SUMMA'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      '     ,0                         AS ak'
      '     ,t.is_ts'
      ' ,t.uin AS uin'
      '  FROM fdc_po_credit_lst t'
      '  WHERE t.payer_id IS NULL'
      '    AND t.TypeSysName != '#39'PaymentOrderConfirm'#39
      
        '--  AND t.object_type_id != ( SELECT ot.id FROM fdc_object_type_' +
        'lst ot WHERE ot.sysname = '#39'PaymentOrderConfirm'#39' )'
      ''
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1053#1072#1095#1072#1083#1086
      
        '    AND NVL(:acc_id, -1)                                        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_reg_id, -1)                                    ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_bdate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_edate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_currency_id, 0)                                ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_from, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_to,   to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      '--$s#viewmode#0*/ AND NOT EXISTS ( SELECT 0'
      
        '--$s#viewmode#0*/                    FROM fdc_rel_pack_docs_lst ' +
        'r'
      
        '--$s#viewmode#0*/                    WHERE r.rel_object_id = t.i' +
        'd )'
      '--$s#viewmode#0*/ AND EXISTS ( SELECT 0'
      '--$s#viewmode#0*/                FROM fdc_acc_transaction act'
      '--$s#viewmode#0*/                WHERE (   act.doc_id = t.id'
      
        '--$s#viewmode#0*/                       OR (SELECT np.payment_or' +
        'der_id FROM fdc_payment_order_non_id_lst np WHERE np.id = act.do' +
        'c_id) = t.id)'
      '--$s#viewmode#0*/                  AND act.account_id  = :acc_id'
      
        '--$s#viewmode#0*/                  AND act.currency_id = :acc_cu' +
        'rrency_id'
      
        '--$s#viewmode#0*/                  AND act.operation_date BETWEE' +
        'N :acc_bdate AND :acc_edate )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_from IS NULL OR t.doc_date' +
        ' >= :acc_doc_date_from )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_to   IS NULL OR t.doc_date' +
        ' <= :acc_doc_date_to   )'
      '--$s#viewmode#1*/ AND (   (    EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                         FROM fdc_rel_pack_docs' +
        '_lst r'
      
        '--$s#viewmode#1*/                         WHERE r.object_id = :a' +
        'cc_reg_id'
      
        '--$s#viewmode#1*/                           AND r.rel_object_id ' +
        '= t.id )'
      '--$s#viewmode#1*/          AND EXISTS ( SELECT  0'
      
        '--$s#viewmode#1*/                         FROM fdc_acc_transacti' +
        'on act'
      '--$s#viewmode#1*/                        WHERE act.doc_id = t.id'
      
        '--$s#viewmode#1*/                          AND act.account_id  =' +
        ' :acc_id'
      
        '--$s#viewmode#1*/                          AND act.currency_id =' +
        ' :acc_currency_id ) )'
      ''
      
        '--$s#viewmode#1*/      OR ( t.id IN ( SELECT poc.confirmed_pay_i' +
        'd'
      
        '--$s#viewmode#1*/                       FROM fdc_payment_order_c' +
        'nfrm_lst poc'
      '--$s#viewmode#1*/                       WHERE EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_rel_pack_docs_lst r'
      
        '--$s#viewmode#1*/                                        WHERE r' +
        '.object_id = :acc_reg_id'
      
        '--$s#viewmode#1*/                                          AND r' +
        '.rel_object_id = poc.id )'
      '--$s#viewmode#1*/                         AND EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_acc_transaction act'
      
        '--$s#viewmode#1*/                                       WHERE ac' +
        't.doc_id = poc.id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.account_id  = :acc_id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.currency_id = :acc_currency_id )'
      '--$s#viewmode#1*/  ) ) )'
      '--  $s#viewmode#1*/ AND t.is_active = '#39'Y'#39
      '--$s#viewmode#6*/ and t.locked_summa > 0'
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1050#1086#1085#1077#1094
      
        '--'#1040' '#1074#1086#1090' '#1101#1090#1086' '#1085#1072' '#1089#1072#1084#1086#1084' '#1076#1077#1083#1077' '#1092#1080#1083#1100#1090#1088#1099'. '#1052#1077#1093#1072#1085#1080#1079#1084' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1042#1045#1056#1054' '#1090#1091#1090' ' +
        #1085#1077' '#1088#1072#1073#1086#1090#1072#1077#1090'.'
      '                  AND (   (:NA IS NULL)'
      '                       OR (:NA = 1 AND t.payer_id IS     NULL)'
      '                       OR (:NA = 2 AND t.summa    IS     NULL)'
      '                       OR (:NA = 3 AND t.summa    IS NOT NULL)'
      
        '                       OR (:NA = 4 AND t.exec_date <= add_months' +
        '(current_date, -36) AND t.rest_summa > 0)'
      
        '                       OR (:NA = 5 AND t.exec_date <= add_months' +
        '(current_date, -36) AND t.rest_summa > 0)'
      
        '                       OR (:NA = 5 AND t.id IN (SELECT rr.rel_ob' +
        'ject_id FROM fdc_rel_pack_docs_lst rr WHERE rr.object_id = :DOCP' +
        'ACK_ID) )'
      
        '                       OR (:NA = 6 AND t.payment_order_id IS NUL' +
        'L )'
      
        '--                       OR (:NA = 6 AND NOT EXISTS ( SELECT 0 F' +
        'ROM fdc_payment_order_non_id n WHERE t.ID = n.ID AND n.payment_o' +
        'rder_id IS NOT NULL ) )'
      
        '                       OR (:NA = 7 AND EXISTS ( SELECT 0 FROM fd' +
        'c_payment_order_non_id n, fdc_payment_order_nonid_dest nd WHERE ' +
        't.ID = n.ID AND n.payment_order_id IS NULL AND n.id = nd.id ) )'
      '                       or (:NA = 8 and t.locked_summa >0)'
      '                      )'
      '/*$p#name#*/      AND (upper(t.payer_name) LIKE upper(:Name) )'
      '/*$p#inn#*/       AND (t.payer_inn         LIKE :INN         )'
      '/*$p#inn_e#*/     AND (t.payer_inn         = :INN_E          )'
      '/*$p#kpp#*/       AND (t.payer_kpp         LIKE :KPP         )'
      '/*$p#kpp_e#*/     AND (t.payer_kpp         = :KPP_E          )'
      
        '/*$p#doc_no#*/    AND (t.doc_number        LIKE :DOC_NO OR t.doc' +
        '_no2 LIKE :DOC_NO)'
      '/*$p#curr#*/      AND (t.curr_code         LIKE :CURR)'
      '/*$p#from_date#*/ AND (t.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (t.doc_date  <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#sum_min#*/   AND (t.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (t.doc_summa <= :SUM_MAX)'
      
        '                  AND (:CURRENCY_ID IS NULL OR t.currency_id = :' +
        'CURRENCY_ID)'
      '/*$p#DESCRIPT#*/  AND (t.note like :DESCRIPT)'
      
        '                  AND (:REST_SUMMA IS NULL OR t.rest_summa >= :R' +
        'EST_SUMMA)'
      
        '                  AND (1=1 OR t.rest_summa - t.locked_summa >= N' +
        'VL(:AVAIL_SUMMA, 0))'
      '/*$p#PAY_CODE#*/  AND ((t.pay_type_code LIKE :PAY_CODE))'
      '                  AND :GL_SUBJECT_ID IS NULL'
      ''
      'UNION ALL'
      ''
      'SELECT /* + FIRST_ROWS */'
      't.id'
      ',t.name'
      ',t.shortname'
      ',t.object_Type_id'
      ',t.state_id'
      ',t.accesslevel'
      ',t.sysname'
      ',t.descript'
      ',t.note'
      ',t.owner_object_id'
      ',t.typename'
      ',t.typesysname'
      ',t.objectkindlist'
      ',t.doc_number AS doc_no'
      ',t.doc_date'
      ',t.exec_date'
      ',t.payer_id'
      ',t.summa'
      ',t.KBK'
      ',t.currency_id'
      ',t.payer_name'
      ',t.payer_inn'
      ',t.curr_name'
      ',t.curr_code'
      ',t.doc_summa'
      ',t.rest_summa'
      ',t.doc_no2'
      ',t.doc_date2'
      ',t.DestCustomsCode'
      ',t.payer_kpp'
      ',t.coming_date'
      ',t.assure_date'
      ',t.pay_type_code'
      ',t.locked_summa'
      ',t.income_date'
      ',0 AS subject_id'
      ',t.activation_date'
      ',decode(t.is_active, '#39'A'#39','#39'N'#39', t.is_active) is_active'
      
        '     ,(SELECT s.sysname FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_sysname'
      
        '     ,(SELECT s.name    FROM fdc_state_lst s WHERE s.ID = t.stat' +
        'e_id) AS state_name'
      '     ,rest_summa - locked_summa AS AVAIL_SUMMA'
      
        '     ,CASE WHEN t.is_active = '#39'A'#39' THEN '#39'Y'#39' ELSE '#39'N'#39' END is_archi' +
        've'
      '     ,0                         AS ak'
      '     ,t.is_ts'
      ' ,t.uin AS uin  FROM fdc_po_credit_lst t'
      '  WHERE t.payer_id IS NOT NULL'
      '    AND t.TypeSysName != '#39'PaymentOrderConfirm'#39
      
        '--    AND t.object_type_id != ( SELECT ot.id FROM fdc_object_typ' +
        'e_lst ot WHERE ot.sysname = '#39'PaymentOrderConfirm'#39' )'
      ''
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1053#1072#1095#1072#1083#1086
      
        '    AND NVL(:acc_id, -1)                                        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_reg_id, -1)                                    ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_bdate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_edate, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))        ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_currency_id, 0)                                ' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_from, to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      
        '    AND NVL(:acc_doc_date_to,   to_date('#39'01011800'#39', '#39'DDMMYYYY'#39'))' +
        ' IS NOT NULL'
      '--$s#viewmode#0*/ AND NOT EXISTS ( SELECT 0'
      
        '--$s#viewmode#0*/                    FROM fdc_rel_pack_docs_lst ' +
        'r'
      
        '--$s#viewmode#0*/                    WHERE r.rel_object_id = t.i' +
        'd )'
      '--$s#viewmode#0*/ AND EXISTS ( SELECT 0'
      '--$s#viewmode#0*/                FROM fdc_acc_transaction act'
      '--$s#viewmode#0*/                WHERE (   act.doc_id = t.id'
      
        '--$s#viewmode#0*/                       OR (SELECT np.payment_or' +
        'der_id FROM fdc_payment_order_non_id_lst np WHERE np.id = act.do' +
        'c_id) = t.id)'
      '--$s#viewmode#0*/                  AND act.account_id  = :acc_id'
      
        '--$s#viewmode#0*/                  AND act.currency_id = :acc_cu' +
        'rrency_id'
      
        '--$s#viewmode#0*/                  AND act.operation_date BETWEE' +
        'N :acc_bdate AND :acc_edate )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_from IS NULL OR t.doc_date' +
        ' >= :acc_doc_date_from )'
      
        '--$s#viewmode#0*/ AND ( :acc_doc_date_to   IS NULL OR t.doc_date' +
        ' <= :acc_doc_date_to   )'
      '--$s#viewmode#1*/ AND (   (    EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                         FROM fdc_rel_pack_docs' +
        '_lst r'
      
        '--$s#viewmode#1*/                         WHERE r.object_id = :a' +
        'cc_reg_id'
      
        '--$s#viewmode#1*/                           AND r.rel_object_id ' +
        '= t.id )'
      '--$s#viewmode#1*/          AND (   EXISTS ( SELECT  0'
      
        '--$s#viewmode#1*/                            FROM fdc_acc_transa' +
        'ction act'
      
        '--$s#viewmode#1*/                            WHERE act.doc_id = ' +
        't.id'
      
        '--$s#viewmode#1*/                              AND act.account_i' +
        'd  = :acc_id'
      
        '--$s#viewmode#1*/                              AND act.currency_' +
        'id = :acc_currency_id )'
      ''
      '--$s#viewmode#1*/               OR EXISTS ( SELECT  0'
      
        '--$s#viewmode#1*/                             FROM fdc_payment_o' +
        'rder_non_id_lst ni'
      
        '--$s#viewmode#1*/                             WHERE ni.payment_o' +
        'rder_id = t.id'
      
        '--$s#viewmode#1*/                               AND EXISTS ( SEL' +
        'ECT  0'
      
        '--$s#viewmode#1*/                                              F' +
        'ROM fdc_acc_transaction act'
      
        '--$s#viewmode#1*/                                             WH' +
        'ERE act.doc_id = ni.id'
      
        '--$s#viewmode#1*/                                               ' +
        'AND act.account_id  = :acc_id'
      
        '--$s#viewmode#1*/                                               ' +
        'AND act.currency_id = :acc_currency_id ) ) ) )'
      ''
      
        '--$s#viewmode#1*/      OR ( t.id IN ( SELECT poc.confirmed_pay_i' +
        'd'
      
        '--$s#viewmode#1*/                       FROM fdc_payment_order_c' +
        'nfrm_lst poc'
      '--$s#viewmode#1*/                       WHERE EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_rel_pack_docs_lst r'
      
        '--$s#viewmode#1*/                                        WHERE r' +
        '.object_id = :acc_reg_id'
      
        '--$s#viewmode#1*/                                          AND r' +
        '.rel_object_id = poc.id )'
      '--$s#viewmode#1*/                         AND EXISTS ( SELECT 0'
      
        '--$s#viewmode#1*/                                        FROM fd' +
        'c_acc_transaction act'
      
        '--$s#viewmode#1*/                                       WHERE ac' +
        't.doc_id = poc.id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.account_id  = :acc_id'
      
        '--$s#viewmode#1*/                                         AND ac' +
        't.currency_id = :acc_currency_id )'
      '--$s#viewmode#1*/  ) ) )'
      '--  $s#viewmode#1*/ AND t.is_active = '#39'Y'#39
      '--$s#viewmode#6*/ and t.locked_summa > 0'
      '-- '#1057#1077#1082#1094#1080#1103' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1087#1086' '#1074#1099#1087#1080#1089#1082#1077'. '#1050#1086#1085#1077#1094
      ''
      
        '--'#1040' '#1074#1086#1090' '#1101#1090#1086' '#1085#1072' '#1089#1072#1084#1086#1084' '#1076#1077#1083#1077' '#1092#1080#1083#1100#1090#1088#1099'. '#1052#1077#1093#1072#1085#1080#1079#1084' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1042#1045#1056#1054' '#1090#1091#1090' ' +
        #1085#1077' '#1088#1072#1073#1086#1090#1072#1077#1090'.'
      '                  AND (   (:NA IS NULL)'
      '                       OR (:NA = 1 AND t.payer_id IS     NULL)'
      '                       OR (:NA = 2 AND t.summa    IS     NULL)'
      '                       OR (:NA = 3 AND t.summa    IS NOT NULL)'
      
        '                       OR (:NA = 4 AND t.exec_date <= add_months' +
        '(current_date, -36) AND t.rest_summa > 0)'
      
        '                       OR (:NA = 5 AND t.id IN (SELECT rr.rel_ob' +
        'ject_id FROM fdc_rel_pack_docs_lst rr WHERE rr.object_id = :DOCP' +
        'ACK_ID) )'
      
        '                       OR (:NA = 6 AND t.payment_order_id IS NUL' +
        'L )'
      
        '--                       OR (:NA = 6 AND NOT EXISTS ( SELECT 0 F' +
        'ROM fdc_payment_order_non_id n WHERE t.ID = n.ID AND n.payment_o' +
        'rder_id IS NOT NULL ) )'
      
        '                       OR (:NA = 7 AND EXISTS ( SELECT 0 FROM fd' +
        'c_payment_order_non_id n, fdc_payment_order_nonid_dest nd WHERE ' +
        't.ID = n.ID AND n.payment_order_id IS NULL AND n.id = nd.id ) )'
      '                       or (:NA = 8 and t.locked_summa > 0)'
      '                      )'
      '/*$p#name#*/      AND (upper(t.payer_name) LIKE upper(:Name) )'
      '/*$p#inn#*/       AND (t.payer_inn         LIKE :INN         )'
      '/*$p#inn_e#*/     AND (t.payer_inn         = :INN_E          )'
      '/*$p#kpp#*/       AND (t.payer_kpp         LIKE :KPP         )'
      '/*$p#kpp_e#*/     AND (t.payer_kpp         = :KPP_E          )'
      
        '/*$p#doc_no#*/    AND (t.doc_number        LIKE :DOC_NO OR t.doc' +
        '_no2 LIKE :DOC_NO)'
      '/*$p#curr#*/      AND (t.curr_code         LIKE :CURR)'
      '/*$p#from_date#*/ AND (t.doc_date  >= :FROM_DATE)'
      '/*$p#to_date#*/   AND (t.doc_date  <= :TO_DATE)'
      '/*$p#active_from#*/ AND (t.activation_date  >= :ACTIVE_FROM)'
      '/*$p#active_to#*/   AND (t.activation_date  <= :ACTIVE_TO)'
      '/*$p#sum_min#*/   AND (t.doc_summa >= :SUM_MIN)'
      '/*$p#sum_max#*/   AND (t.doc_summa <= :SUM_MAX)'
      
        '                  AND (:CURRENCY_ID IS NULL OR t.currency_id = :' +
        'CURRENCY_ID)'
      '/*$p#DESCRIPT#*/  AND (t.note like :DESCRIPT)'
      
        '                  AND (:REST_SUMMA IS NULL OR t.rest_summa >= :R' +
        'EST_SUMMA)'
      
        '                  AND (1=1 OR t.rest_summa - t.locked_summa >= N' +
        'VL(:AVAIL_SUMMA, 0))'
      '/*$p#PAY_CODE#*/  AND ((t.pay_type_code LIKE :PAY_CODE))'
      
        '                  AND (:GL_SUBJECT_ID IS NULL OR t.PAYER_ID = :G' +
        'L_SUBJECT_ID)'
      ''
      '  )'
      '  WHERE rownum <= :MaxRecordCount')
    OnCalcFields = dsDataCalcFields
    ParamData = <
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DOCPACK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
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
        Name = 'INN_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
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
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'acc_bdate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_edate'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_from'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'acc_doc_date_to'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'acc_reg_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'acc_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'acc_currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DOCPACK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NA'
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
        Name = 'INN_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'KPP_E'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CURR'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FROM_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'TO_DATE'
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
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REST_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'AVAIL_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PAY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MaxRecordCount'
        ParamType = ptUnknown
      end>
    inherited dsDataDESCRIPT: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1072#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
    end
    object dsDataDOC_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087'/'#1087
      FieldName = 'DOC_NO'
      Size = 50
    end
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087'/'#1087
      FieldName = 'DOC_DATE'
    end
    object dsDataEXEC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
      Visible = False
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1091#1087#1080#1074'. '#1089#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataPAYER_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataCURR_NAME: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataREST_SUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'REST_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDOC_NO2: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1080#1079' '#1073#1072#1085#1082#1072
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1073#1072#1085#1082#1072
      FieldName = 'DOC_DATE2'
    end
    object dsDataPAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Visible = False
      Size = 1500
    end
    object dsDataSTATE_NAME: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataCOMING_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072
      FieldName = 'COMING_DATE'
    end
    object dsDataASSURE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1077#1085#1080#1103
      FieldName = 'ASSURE_DATE'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 20
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataLOCKED_SUMMA: TFloatField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074'.'
      FieldName = 'LOCKED_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataAVAIL_SUMMA: TFloatField
      DisplayLabel = #1044#1086#1089#1090'. '#1089#1091#1084#1084#1072
      FieldName = 'AVAIL_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103' '#1074' '#1073#1072#1079#1091
      FieldName = 'INCOME_DATE'
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataACC_CODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'ACC_CODE'
      Size = 10
      Calculated = True
    end
    object dsDataACC_OPER_DATE: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'ACC_OPER_DATE'
      Calculated = True
    end
    object dsDataACC_CURRENCY_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ACC_CURRENCY_ID'
      Calculated = True
    end
    object dsDataAK: TFloatField
      FieldName = 'AK'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      ReadOnly = True
      Size = 1
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataKBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
    object dsDataNOTE: TStringField
      DisplayLabel = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataUIN: TStringField
      FieldName = 'UIN'
      Size = 25
    end
  end
  object qlPOG: TQueryList
    Session = MainData.Session
    Left = 64
    Top = 148
    object sqlAssure: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_payment_order_assure(pid => :id,'
        '                            pdate => :pdate,'
        '                            pdoraise => 0);'
        'end;')
      DataSet = dsData
    end
    object sqlPOIdent: TsqlOp
      SQL.Strings = (
        'DECLARE'
        '  vPayerId NUMBER;'
        'BEGIN'
        '  vPayerId := p_pays_loader.FindPayer(:payer_inn, :payer_kpp);'
        '  IF vPayerId IS NOT NULL THEN'
        '    IF fdc_object_is(:ID, '#39'PaymentOrderNonID'#39') = 0 THEN'
        '      p_payment_order.setpayer(:id, vPayerId);'
        '    ELSE'
        '      fdc_PO_Non_id_Identify(:id, vPayerId);'
        '    END IF;'
        '  END IF;'
        'END;'
        '')
      DataSet = dsData
    end
  end
  object srcAccData: TDataSource
    DataSet = dsAccData
    Left = 270
    Top = 404
  end
  object dsAccData: TfdcQuery
    ReadOnly = True
    SQL.Strings = (
      'select ad.Code acc_code'
      '      ,at.OPERATION_DATE ACC_OPER_DATE'
      '      ,at.CURRENCY_ID ACC_CURRENCY_ID'
      '      ,abs(sum(at.OPERATION_SUM)) DAYSUM'
      '  from fdc_acc_transaction_lst at'
      '      ,fdc_dict_lst            ad'
      ' where at.account_id = ad.id'
      '   and ad.Code = :gl_acc_code'
      '   and at.OPERATION_DATE between :gl_bdate and :gl_edate'
      '   and at.CURRENCY_ID = :gl_currency_id'
      ' group by ad.Code'
      '       ,at.CURRENCY_ID'
      '       ,OPERATION_DATE')
    BeforeOpen = dsAccDataBeforeOpen
    Left = 262
    Top = 372
    ParamData = <
      item
        DataType = ftString
        Name = 'gl_acc_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'gl_bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'gl_edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'gl_currency_id'
        ParamType = ptUnknown
      end>
    object dsAccDataACC_CODE: TStringField
      DisplayLabel = #1057#1095#1077#1090
      FieldName = 'ACC_CODE'
    end
    object dsAccDataACC_OPER_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'ACC_OPER_DATE'
    end
    object dsAccDataDAYSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DAYSUM'
      DisplayFormat = ',0.00'
    end
    object dsAccDataACC_CURRENCY_ID: TFloatField
      FieldName = 'ACC_CURRENCY_ID'
      Visible = False
    end
  end
end
