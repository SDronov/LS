inherited PayOrderInPackGridForm: TPayOrderInPackGridForm
  Left = 472
  Top = 163
  Width = 1011
  Height = 631
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1083#1072#1090#1077#1078#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 579
    Width = 1003
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Width = 698
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 698
      end
      inherited pnlProgress: TPanel
        Width = 698
        inherited lblProgress: TcxLabel
          Width = 698
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 911
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 576
    Width = 1003
  end
  inherited pnlWorkspace: TPanel
    Width = 1003
    Height = 550
    inherited splSearchCriteria: TSplitter
      Height = 550
    end
    inherited pnlSearchCriteria: TPanel
      Height = 550
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 530
        inherited btnSearch: TcxButton
          Top = 499
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 470
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 798
      Height = 550
      object Splitter1: TSplitter [0]
        Left = 0
        Top = 344
        Width = 798
        Height = 6
        Cursor = crVSplit
        Align = alBottom
      end
      inherited grdData: TcxGrid
        Width = 798
        Height = 344
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
          DataController.Summary.DefaultGroupSummaryItems = <
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
              Column = grdDataDBBandedTableViewDOC_SUMMA
            end
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
              Column = grdDataDBBandedTableViewLOCKED_SUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewDOC_SUMMA
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
            end>
          inherited grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Visible = False
          end
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Visible = False
            Width = 118
          end
          object grdDataDBBandedTableViewSHORTNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SHORTNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECT_TYPE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECT_TYPE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACCESSLEVEL: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACCESSLEVEL'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SYSNAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOWNER_OBJECT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OWNER_OBJECT_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOBJECTKINDLIST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'OBJECTKINDLIST'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'EXEC_DATE'
            Width = 116
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 134
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURRENCY_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURRENCY_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 153
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_INN'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_NAME'
            Width = 70
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
            DataBinding.FieldName = 'CURR_CODE'
            Width = 56
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1086' '#1073#1072#1085#1082#1091
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewREST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 95
            Position.BandIndex = 0
            Position.ColIndex = 26
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NO2'
            Width = 124
            Position.BandIndex = 0
            Position.ColIndex = 27
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE2'
            Width = 97
            Position.BandIndex = 0
            Position.ColIndex = 28
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_KPP: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_KPP'
            Width = 157
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewLOCKED_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'LOCKED_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 128
            Position.BandIndex = 0
            Position.ColIndex = 29
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewASSURE_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ASSURE_DATE'
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 30
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAY_TYPE_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAY_TYPE_CODE'
            Width = 110
            Position.BandIndex = 0
            Position.ColIndex = 31
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'INCOME_DATE'
            Width = 147
            Position.BandIndex = 0
            Position.ColIndex = 32
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ACTIVATION_DATE'
            Width = 145
            Position.BandIndex = 0
            Position.ColIndex = 33
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IS_ACTIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 131
            Position.BandIndex = 0
            Position.ColIndex = 34
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_SYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_SYSNAME'
            Visible = False
            Hidden = True
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 35
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSTATE_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'STATE_NAME'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 36
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_ARCHIVE: TcxGridDBBandedColumn
            Caption = #1040#1088#1093#1080#1074#1085#1099#1081
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 37
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DESTCUSTOMSCODE'
            Width = 106
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
            DataBinding.FieldName = 'KBK'
            Width = 177
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
            Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'NOTE'
            PropertiesClassName = 'TcxMemoProperties'
            Width = 250
            Position.BandIndex = 0
            Position.ColIndex = 38
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
            Position.BandIndex = 0
            Position.ColIndex = 39
            Position.RowIndex = 0
          end
        end
      end
      object SelGridPanel: TPanel
        Left = 0
        Top = 350
        Width = 798
        Height = 200
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'SelGridPanel'
        Constraints.MinHeight = 200
        TabOrder = 1
        object grdDataSel: TcxGrid
          Left = 1
          Top = 27
          Width = 796
          Height = 172
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          OnLayoutChanged = grdDataLayoutChanged
          object cxGridDBTableView1: TcxGridDBTableView
            DragMode = dmAutomatic
            OnStartDrag = grdDataTableViewStartDrag
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.First.Hint = #1042' '#1085#1072#1095#1072#1083#1086
            NavigatorButtons.First.Visible = True
            NavigatorButtons.PriorPage.Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Prior.Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            NavigatorButtons.Prior.Visible = True
            NavigatorButtons.Next.Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            NavigatorButtons.Next.Visible = True
            NavigatorButtons.NextPage.Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
            NavigatorButtons.NextPage.Visible = True
            NavigatorButtons.Last.Hint = #1042' '#1082#1086#1085#1077#1094
            NavigatorButtons.Last.Visible = True
            NavigatorButtons.Insert.Hint = #1042#1089#1090#1072#1074#1080#1090#1100
            NavigatorButtons.Insert.Visible = True
            NavigatorButtons.Delete.Hint = #1059#1076#1072#1083#1080#1090#1100
            NavigatorButtons.Delete.Visible = True
            NavigatorButtons.Edit.Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            NavigatorButtons.Edit.Visible = True
            NavigatorButtons.Post.Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            NavigatorButtons.Post.Visible = True
            NavigatorButtons.Cancel.Hint = #1054#1090#1084#1077#1085#1072
            NavigatorButtons.Cancel.Visible = True
            NavigatorButtons.Refresh.Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            NavigatorButtons.Refresh.ImageIndex = 0
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
            NavigatorButtons.GotoBookmark.Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1079#1072#1082#1083#1072#1076#1082#1077
            NavigatorButtons.Filter.Hint = #1060#1080#1083#1100#1090#1088
            DataController.DataSource = srcData
            DataController.Filter.MaxValueListCount = 10
            DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
            DataController.KeyFieldNames = 'ID'
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = #1101#1083#1077#1084#1077#1085#1090#1086#1074': #'
                Kind = skCount
                FieldName = 'ID'
              end>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.IncSearch = True
            OptionsBehavior.NavigatorHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.CellEndEllipsis = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.GroupRowStyle = grsOffice11
            OptionsView.HeaderAutoHeight = True
            OptionsView.HeaderEndEllipsis = True
            OptionsView.Indicator = True
            OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
            Preview.Column = cxGridDBColumn5
            object cxGridDBColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Hidden = True
            end
            object cxGridDBColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'TYPESYSNAME'
              Visible = False
              Hidden = True
              Width = 64
            end
            object cxGridDBColumn3: TcxGridDBColumn
              Caption = #1058#1080#1087
              DataBinding.FieldName = 'TYPENAME'
              OnCustomDrawCell = grdDataDBBandedTableViewTYPENAMECustomDrawCell
              Width = 42
            end
            object cxGridDBColumn4: TcxGridDBColumn
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'NAME'
              Width = 538
            end
            object cxGridDBColumn5: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'DESCRIPT'
              Width = 314
            end
          end
          object grdSelDataDBBandedTableView: TcxGridDBBandedTableView
            DragMode = dmAutomatic
            OnDblClick = grdDataDBBandedTableViewDblClick
            OnStartDrag = grdDataTableViewStartDrag
            NavigatorButtons.ConfirmDelete = False
            NavigatorButtons.First.Hint = #1042' '#1085#1072#1095#1072#1083#1086
            NavigatorButtons.First.Visible = True
            NavigatorButtons.PriorPage.Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
            NavigatorButtons.PriorPage.Visible = True
            NavigatorButtons.Prior.Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            NavigatorButtons.Prior.Visible = True
            NavigatorButtons.Next.Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
            NavigatorButtons.Next.Visible = True
            NavigatorButtons.NextPage.Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
            NavigatorButtons.NextPage.Visible = True
            NavigatorButtons.Last.Hint = #1042' '#1082#1086#1085#1077#1094
            NavigatorButtons.Last.Visible = True
            NavigatorButtons.Insert.Hint = #1042#1089#1090#1072#1074#1080#1090#1100
            NavigatorButtons.Insert.Visible = True
            NavigatorButtons.Delete.Hint = #1059#1076#1072#1083#1080#1090#1100
            NavigatorButtons.Delete.Visible = True
            NavigatorButtons.Edit.Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            NavigatorButtons.Edit.Visible = True
            NavigatorButtons.Post.Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
            NavigatorButtons.Post.Visible = True
            NavigatorButtons.Cancel.Hint = #1054#1090#1084#1077#1085#1072
            NavigatorButtons.Cancel.Visible = True
            NavigatorButtons.Refresh.Hint = #1054#1073#1085#1086#1074#1080#1090#1100
            NavigatorButtons.Refresh.Visible = True
            NavigatorButtons.SaveBookmark.Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1091
            NavigatorButtons.SaveBookmark.Visible = True
            NavigatorButtons.GotoBookmark.Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1079#1072#1082#1083#1072#1076#1082#1077
            NavigatorButtons.GotoBookmark.Visible = True
            NavigatorButtons.Filter.Hint = #1060#1080#1083#1100#1090#1088
            NavigatorButtons.Filter.Visible = True
            DataController.DataSource = srcSelData
            DataController.Filter.MaxValueListCount = 10
            DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.IncSearch = True
            OptionsBehavior.NavigatorHints = True
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.ColumnVertSizing = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.CellEndEllipsis = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.GroupRowStyle = grsOffice11
            OptionsView.HeaderAutoHeight = True
            OptionsView.HeaderEndEllipsis = True
            OptionsView.Indicator = True
            OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
            OptionsView.BandHeaderEndEllipsis = True
            OptionsView.BandHeaders = False
            Bands = <
              item
                Caption = #1054#1073#1098#1077#1082#1090
              end>
            object grdSelDataDBBandedTableViewNAME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NAME'
              Visible = False
              Width = 82
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              DataBinding.FieldName = 'DESCRIPT'
              Visible = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
              Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087
              DataBinding.FieldName = 'DOC_NUMBER'
              Width = 74
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1087'/'#1087
              DataBinding.FieldName = 'DOC_DATE'
              Width = 89
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewIS_ACTIVE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IS_ACTIVE'
              Visible = False
              Width = 101
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewACTIVATION_DATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ACTIVATION_DATE'
              Visible = False
              Width = 83
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
              Caption = #1055#1086#1089#1090#1091#1087'. '#1089#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMMA'
              Width = 120
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewEXEC_DATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'EXEC_DATE'
              Width = 98
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewNAME_P: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NAME_P'
              Width = 103
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewINN_P: TcxGridDBBandedColumn
              DataBinding.FieldName = 'INN_P'
              Width = 130
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewKPP_P: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KPP_P'
              Width = 117
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DOC_SUMMA'
              Width = 123
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDOC_NO2: TcxGridDBBandedColumn
              Caption = #1053#1086#1084#1077#1088' '#1080#1079' '#1073#1072#1085#1082#1072
              DataBinding.FieldName = 'DOC_NO2'
              Width = 98
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDOC_DATE2: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1073#1072#1085#1082#1072
              DataBinding.FieldName = 'DOC_DATE2'
              Position.BandIndex = 0
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewNAME_K: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NAME_K'
              Width = 65
              Position.BandIndex = 0
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewINN_K: TcxGridDBBandedColumn
              DataBinding.FieldName = 'INN_K'
              Width = 108
              Position.BandIndex = 0
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewKPP_K: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KPP_K'
              Width = 107
              Position.BandIndex = 0
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewNOTE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NOTE'
              Width = 124
              Position.BandIndex = 0
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewINCOME_DATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'INCOME_DATE'
              Width = 99
              Position.BandIndex = 0
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewVAL_PAYMENT_REASON: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VAL_PAYMENT_REASON'
              Width = 107
              Position.BandIndex = 0
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewVAL_DOC_NUMBER: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VAL_DOC_NUMBER'
              Width = 123
              Position.BandIndex = 0
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewVAL_DOC_DATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VAL_DOC_DATE'
              Width = 115
              Position.BandIndex = 0
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewVAL_PAYMENT_TYPE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'VAL_PAYMENT_TYPE'
              Width = 103
              Position.BandIndex = 0
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewDESTCUSTOMSCODE: TcxGridDBBandedColumn
              Caption = #1050#1086#1076' '#1058#1054' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
              DataBinding.FieldName = 'DESTCUSTOMSCODE'
              Width = 103
              Position.BandIndex = 0
              Position.ColIndex = 24
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewKBK: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KBK'
              Width = 146
              Position.BandIndex = 0
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object grdSelDataDBBandedTableViewID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Position.BandIndex = -1
              Position.ColIndex = -1
              Position.RowIndex = -1
            end
          end
          object cxGridLevel1: TcxGridLevel
            Caption = 'grdDataDBTableView'
            GridView = grdSelDataDBBandedTableView
          end
        end
        object dxBarDockControl2: TdxBarDockControl
          Left = 1
          Top = 1
          Width = 796
          Height = 26
          Align = dalTop
          BarManager = BarManager
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
    inherited actSwitchSearchCriteria: TAction
      Visible = False
    end
    object actInclude: TAction
      Category = 'Object'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1087#1083#1072#1090#1105#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077' '#1074' '#1088#1077#1077#1089#1090#1088
      ImageIndex = 8
      OnExecute = actIncludeExecute
      OnUpdate = MovePanelButtonEnable
    end
    object actIncludeAll: TAction
      Category = 'Object'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1105
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077' '#1087#1083#1072#1090#1105#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103' '#1074' '#1088#1077#1077#1089#1090#1088
      ImageIndex = 9
      OnExecute = actIncludeAllExecute
    end
    object actRemove: TAction
      Category = 'Object'
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1087#1083#1072#1090#1105#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      ImageIndex = 10
      OnExecute = actRemoveExecute
    end
    object actRemoveAll: TAction
      Category = 'Object'
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1105
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1074#1089#1077' '#1087#1083#1072#1090#1105#1078#1085#1099#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1103' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      ImageIndex = 11
      OnExecute = actRemoveAllExecute
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
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00CFD7
      E500000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00CFD7
      E500000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00CFD7
      E500000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00CFD7
      E500000000000000000000000000000000000000000000000000AFBDD400103A
      7F00117BEE002E94FF00399AFF002C93FF002C93FF00399AFF002E94FF00117B
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F00117BEE002E94FF00399AFF002C93FF002C93FF00399AFF002E94FF00117B
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F00117BEE002E94FF00399AFF002C93FF002C93FF00399AFF002E94FF00117B
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F00117BEE002E94FF00399AFF002C93FF002C93FF00399AFF002E94FF00117B
      EE00103A7F00AFBDD400000000000000000000000000AFBDD400002D7700005E
      CC003296FF00208CFF000A81FF00007CFF00007CFF000A81FF00208CFF003296
      FF00005ECC00002D7700AFBDD4000000000000000000AFBDD400002D7700005E
      CC003296FF00208CFF000A81FF00007CFF00007CFF000A81FF00208CFF003296
      FF00005ECC00002D7700AFBDD4000000000000000000AFBDD400002D7700005E
      CC003296FF00208CFF000A81FF00007CFF00007CFF000A81FF00208CFF003296
      FF00005ECC00002D7700AFBDD4000000000000000000AFBDD400002D7700005E
      CC003296FF00208CFF000A81FF00007CFF00007CFF000A81FF00208CFF003296
      FF00005ECC00002D7700AFBDD4000000000000000000103A7F000460CC002991
      FF00067FFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF000980
      FF001B8AFF00005ECC00103A7F000000000000000000103A7F000460CC002991
      FF00067FFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF000980
      FF001B8AFF00005ECC00103A7F000000000000000000103A7F000460CC002991
      FF00067FFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF000980
      FF001B8AFF00005ECC00103A7F000000000000000000103A7F000460CC002991
      FF00067FFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF000980
      FF001B8AFF00005ECC00103A7F0000000000BFCADC00187FEE003698FF00027D
      FF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF00007C
      FF00027DFF001989FF000273EE00CFD7E500BFCADC00187FEE003698FF00B1D7
      FF00000000000000000000000000000000000000000000000000000000000000
      0000B1D7FF001989FF000273EE00CFD7E500BFCADC00187FEE003698FF00027D
      FF00007CFF00007CFF003095FF0000000000000000009FCEFF00007CFF00007C
      FF00027DFF001989FF000273EE00CFD7E500BFCADC00187FEE003698FF00D1E7
      FF00000000000000000000000000000000000000000000000000000000000000
      0000E1F0FF001989FF000273EE00CFD7E500607CAA0053A7FF000E83FF00007C
      FF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF00007CFF00007C
      FF00007CFF000980FF000880FF00607CAA00607CAA0053A7FF000E83FF00AFD6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000AFD6FF000980FF000880FF00607CAA00607CAA0053A7FF000E83FF00007C
      FF00007CFF003095FF00EFF7FF000000000000000000000000009FCEFF00007C
      FF00007CFF000980FF000880FF00607CAA00607CAA0053A7FF000E83FF00AFD6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000AFD6FF000980FF000880FF00607CAA00204788005FADFF00208CFF00EFF7
      FF00000000000000000000000000000000000000000000000000000000000000
      00009FCEFF00007CFF000880FF0020478800204788005FADFF00007CFF001084
      FF00000000000000000000000000000000000000000000000000000000000000
      00003095FF00007CFF000880FF0020478800204788005FADFF00007CFF00007C
      FF003095FF00EFF7FF0000000000000000000000000000000000000000009FCE
      FF00007CFF00007CFF000880FF0020478800204788005FADFF00007CFF001084
      FF0080BEFF0080BEFF00AFD6FF000000000000000000AFD6FF0080BEFF0080BE
      FF001084FF00007CFF000880FF0020478800002D770063AFFF0052A6FF00F3F9
      FF00000000000000000000000000000000000000000000000000000000000000
      0000F3F9FF002F94FF001788FF00002D7700002D770063AFFF003999FF003999
      FF005FADFF00F3F9FF0000000000000000000000000000000000F3F9FF005FAD
      FF003999FF002F94FF001788FF00002D7700002D770063AFFF003999FF0082BF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000B3D8FF002F94FF001788FF00002D7700002D770063AFFF003999FF003999
      FF005DACFF00F2F8FF0000000000000000000000000000000000F2F8FF005DAC
      FF003999FF002F94FF001788FF00002D7700002D77008BC3FF0047A0FF0075B8
      FF00000000000000000000000000000000000000000000000000000000000000
      00006AB2FF0047A0FF0047A0FF00002D7700002D77008BC3FF0047A0FF0047A0
      FF0047A0FF006AB2FF00F4F9FF000000000000000000E9F4FF006AB2FF0047A0
      FF0047A0FF0047A0FF0047A0FF00002D7700002D77008BC3FF0047A0FF00F3F9
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007FBDFF0047A0FF00002D7700002D77008BC3FF0047A0FF0047A0
      FF00F3F9FF00000000000000000000000000000000000000000000000000F3F9
      FF0047A0FF0047A0FF0047A0FF00002D770020478800C3E0FF009FCEFF0087C2
      FF00B5D9FF000000000000000000000000000000000000000000F6FAFF0080BE
      FF0062AFFF0062AFFF004AA2FF002047880020478800C3E0FF009FCEFF00BBDC
      FF00000000000000000000000000000000000000000000000000000000000000
      0000A7D2FF0062AFFF004AA2FF002047880020478800C3E0FF009FCEFF00B5D9
      FF00000000000000000000000000000000000000000000000000000000000000
      0000D9EBFF006CB4FF004AA2FF002047880020478800C3E0FF009FCEFF00F7FB
      FF00000000000000000000000000000000000000000000000000000000000000
      0000EBF5FF0062AFFF004AA2FF0020478800607CAA0091C6FF00CAE4FF0093C7
      FF0093C7FF00B4D8FF00000000000000000000000000E5F2FF0083BFFF0070B6
      FF0070B6FF0070B6FF003195FF00607CAA00607CAA0091C6FF00CAE4FF00C9E3
      FF00000000000000000000000000000000000000000000000000000000000000
      0000B8DAFF0070B6FF003195FF00607CAA00607CAA0091C6FF00CAE4FF0093C7
      FF0093C7FF007DBCFF0070B6FF0070B6FF0070B6FF0070B6FF0070B6FF0070B6
      FF0070B6FF0070B6FF003195FF00607CAA00607CAA0091C6FF00CAE4FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000070B6FF003195FF00607CAA00BFCADC00308BEE00D6EAFF00C0DF
      FF009FCEFF009CCCFF00B5D9FF00000000000000000086C1FF007EBDFF007EBD
      FF007EBDFF007ABBFF000877EE00CFD7E500BFCADC00308BEE00D6EAFF00C6E2
      FF00E8F3FF00E8F3FF00E4F1FF00E0EFFF00E0EFFF00E0EFFF00E0EFFF00E0EF
      FF0086C1FF007ABBFF000877EE00BFCADC00BFCADC00308BEE00D6EAFF00C0DF
      FF009FCEFF009CCCFF0084C0FF007EBDFF007EBDFF007EBDFF007EBDFF007EBD
      FF007EBDFF007ABBFF000877EE00CFD7E500BFCADC00308BEE00D6EAFF00EDF6
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C8E3FF007ABBFF000877EE00BFCADC0000000000103A7F000C65CC00A7D2
      FF00D1E7FF00B7DAFF00A7D2FF0099CBFF0099CBFF0099CBFF0099CBFF009CCD
      FF0074B7FF000260CC00103A7F000000000000000000103A7F000C65CC00A7D2
      FF00D1E7FF00B7DAFF00A7D2FF0099CBFF0099CBFF0099CBFF0099CBFF009CCD
      FF0074B7FF000260CC00103A7F000000000000000000103A7F000C65CC00A7D2
      FF00D1E7FF00B7DAFF00A7D2FF0099CBFF0099CBFF0099CBFF0099CBFF009CCD
      FF0074B7FF000260CC00103A7F000000000000000000103A7F000C65CC00A7D2
      FF00D1E7FF00B7DAFF00A7D2FF0099CBFF0099CBFF0099CBFF0099CBFF009CCD
      FF0074B7FF000260CC00103A7F000000000000000000AFBDD400002D77000C65
      CC00E4F1FF00DFEFFF00C6E2FF00AAD3FF00A7D2FF00B2D8FF00BBDCFF00BCDD
      FF000460CC00002D7700AFBDD4000000000000000000AFBDD400002D77000C65
      CC00E4F1FF00DFEFFF00C6E2FF00AAD3FF00A7D2FF00B2D8FF00BBDCFF00BCDD
      FF000460CC00002D7700AFBDD4000000000000000000AFBDD400002D77000C65
      CC00E4F1FF00DFEFFF00C6E2FF00AAD3FF00A7D2FF00B2D8FF00BBDCFF00BCDD
      FF000460CC00002D7700AFBDD4000000000000000000AFBDD400002D77000C65
      CC00E4F1FF00DFEFFF00C6E2FF00AAD3FF00A7D2FF00B2D8FF00BBDCFF00BCDD
      FF000460CC00002D7700AFBDD400000000000000000000000000AFBDD400103A
      7F003090F7009CCCFF00DDEDFF00E0EFFF00DDEDFF00CAE4FF008AC3FF002585
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F003090F7009CCCFF00DDEDFF00E0EFFF00DDEDFF00CAE4FF008AC3FF002585
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F003090F7009CCCFF00DDEDFF00E0EFFF00DDEDFF00CAE4FF008AC3FF002585
      EE00103A7F00AFBDD40000000000000000000000000000000000AFBDD400103A
      7F003090F7009CCCFF00DDEDFF00E0EFFF00DDEDFF00CAE4FF008AC3FF002585
      EE00103A7F00AFBDD40000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00BFCA
      DC00000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00BFCA
      DC00000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00BFCA
      DC00000000000000000000000000000000000000000000000000000000000000
      0000BFCADC00607CAA0020478800002D7700002D770020478800607CAA00BFCA
      DC000000000000000000000000000000000000000000B5B5B500726F7E00BA93
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
      00000000000000000000000000000000F00FF00FF00FF00FC003C003C003C003
      8001800180018001800180018001800100000FF001800FF000000FF001C00FF0
      0FF00FF003E001800FF003C00FF003C00FF001800FF807E007C00FF00FF00FF0
      03800FF000001FF80180000000000FF080018001800180018001800180018001
      C003C003C003C003F00FF00FF00FF00F8FFFFFFFFFFFFFFC87FFE0018FFF9FF9
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
          end>
        Name = 'barTools'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1086#1074
        DockControl = dxBarDockControl2
        DockedDockControl = dxBarDockControl2
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 757
        FloatTop = 620
        FloatClientWidth = 52
        FloatClientHeight = 66
        ItemLinks = <
          item
            Item = btnInclude
            Visible = True
          end
          item
            Item = btnIncludeAll
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnRemove
            Visible = True
          end
          item
            Item = btnRemoveAll
            Visible = True
          end>
        Name = 'barMoves'
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
    object btnInclude: TdxBarButton
      Action = actInclude
      Category = 0
    end
    object btnIncludeAll: TdxBarButton
      Action = actIncludeAll
      Category = 0
    end
    object btnRemove: TdxBarButton
      Action = actRemove
      Category = 0
    end
    object btnRemoveAll: TdxBarButton
      Action = actRemoveAll
      Category = 0
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'pf_subject_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'SELECT po.id'
      '      ,po.NAME'
      '      ,po.shortname'
      '      ,po.object_Type_id'
      '      ,po.state_id'
      '      ,po.accesslevel'
      '      ,po.sysname'
      '      ,po.descript'
      '      ,po.note'
      '      ,po.owner_object_id'
      '      ,po.typename'
      '      ,po.typesysname'
      '      ,po.objectkindlist'
      '      ,po.Doc_Number AS doc_no'
      '      ,po.doc_date'
      '      ,po.exec_date'
      '      ,po.payer_id'
      '      ,po.summa'
      #9#9#9',po.kbk'
      '      ,po.currency_id'
      '      ,po.payer_name'
      '      ,po.payer_inn'
      '      ,po.payer_kpp'
      '      ,po.curr_name'
      '      ,po.curr_code'
      '      ,po.doc_summa'
      '      ,p_payment_order.getrestsumma(po.id) AS rest_summa'
      '      ,po.doc_no2'
      '      ,po.doc_date2'
      '      ,po.DestCustomsCode'
      #9#9#9',p_payment_order.GetLockedSumma(po.id) AS Locked_Summa'
      '      ,(SELECT datetimevalue'
      '          FROM fdc_value_lst v1, fdc_object_lst o1'
      '         WHERE o1.owner_object_id = po.id'
      '           AND o1.sysname || '#39#39' = '#39'ASSURE_DATE'#39
      '           AND v1.id = o1.id + 0) assure_date'
      '      ,po.pay_type_code'
      '      ,po.income_date'
      '      ,po.activation_date'
      '      ,decode(po.is_active, '#39'A'#39', '#39'N'#39', po.is_active) is_active'
      '      ,s.SYSNAME AS state_sysname'
      '      ,s.NAME AS state_name'
      '      , CASE'
      '          WHEN po.is_active = '#39'A'#39' THEN'
      '           '#39'Y'#39
      '          ELSE'
      '           '#39'N'#39
      '        END is_archive'
      '       ,po.is_ts'
      '  FROM Fdc_PO_Lst              po'
      '      ,fdc_object_relation_lst rr'
      '      ,fdc_object_lst          s'
      ' WHERE po.id = rr.rel_object_id'
      '   AND rr.object_id = :DOCPACK_ID'
      '   AND s.ID(+) = po.STATE_ID'
      '   AND rownum <= :MaxRecordCount'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'DOCPACK_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'MaxRecordCount'
        ParamType = ptInput
      end>
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
    end
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1091#1087#1080#1074'. '#1089#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
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
    object dsDataLOCKED_SUMMA: TFloatField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074'.'
      FieldName = 'LOCKED_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataASSURE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1077#1085#1080#1103
      FieldName = 'ASSURE_DATE'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      DisplayLabel = #1042#1080#1076
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103' '#1074' '#1073#1072#1079#1091
      FieldName = 'INCOME_DATE'
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
    object dsDataSTATE_NAME: TStringField
      FieldName = 'STATE_NAME'
      Size = 1500
    end
    object dsDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      Size = 1
    end
    object dsDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      DisplayWidth = 30
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsDataKBK: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 80
      FieldName = 'KBK'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057' '
      DisplayWidth = 20
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  inherited pmnGridDataDBBandedTableView: TdxBarPopupMenu
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
        Item = btnRemove
        Visible = True
      end
      item
        Item = btnRemoveAll
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
        BeginGroup = True
        Item = btnView
        Visible = True
      end
      item
        Item = btnFilter
        Visible = True
      end
      item
        Item = btnSwitchSearchCriteria
        Visible = True
      end
      item
        Item = btnCopySelection
        Visible = True
      end
      item
        Item = btnCopyAll
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnDelete
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnSaveToFile
        Visible = True
      end>
  end
  object dsSelData: TOracleDataSet
    SQL.Strings = (
      'SELECT po.*'
      '  FROM fdc_po_cashless_lst_all po'
      ' WHERE po.in_reg = '#39'N'#39
      '   AND po.is_active <> '#39'A'#39
      '   AND po.DestCustomsCode = :CustomsCode'
      ''
      '')
    Variables.Data = {
      03000000010000000C0000003A435553544F4D53434F44450500000000000000
      00000000}
    QBEDefinition.QBEFieldDefs = {
      0400000032000000020000004944010000000000040000004E414D4501000000
      00000900000053484F52544E414D450100000000000E0000004F424A4543545F
      545950455F49440100000000000800000053544154455F49440100000000000B
      0000004143434553534C4556454C010000000000070000005359534E414D4501
      00000000000800000044455343524950540100000000000F0000004F574E4552
      5F4F424A4543545F494401000000000008000000545950454E414D4501000000
      00000B000000545950455359534E414D450100000000000E0000004F424A4543
      544B494E444C4953540100000000000A000000444F435F4E554D424552010000
      00000008000000444F435F444154450100000000000900000049535F41435449
      56450100000000000F00000041435449564154494F4E5F444154450100000000
      000A0000004558545F534F555243450100000000000F0000004558545F545950
      455359534E414D45010000000000060000004558545F49440100000000000900
      0000455845435F444154450100000000000800000050415945525F4944010000
      000000060000004E414D455F5001000000000005000000494E4E5F5001000000
      0000050000004B50505F500100000000000500000042494B5F50010000000000
      090000004143434F554E545F500100000000000500000053554D4D4101000000
      00000B00000043555252454E43595F494401000000000009000000444F435F53
      554D4D4101000000000007000000444F435F4E4F320100000000000900000044
      4F435F4441544532010000000000040000004E5245460100000000000C000000
      524543495049454E545F4944010000000000060000004E414D455F4B01000000
      000005000000494E4E5F4B010000000000050000004B50505F4B010000000000
      050000004249435F4B010000000000090000004143434F554E545F4B01000000
      00000B0000005041595F545950455F4944010000000000040000004E4F544501
      00000000000B000000494E434F4D455F44415445010000000000030000004E4C
      530100000000000A0000004B424B434F44455F49440100000000001200000056
      414C5F5041594D454E545F524541534F4E0100000000000E00000056414C5F44
      4F435F4E554D4245520100000000000C00000056414C5F444F435F4441544501
      00000000001000000056414C5F5041594D454E545F5459504501000000000006
      000000494E5F5245470100000000000F00000044455354435553544F4D53434F
      4445010000000000030000004B424B010000000000}
    Session = MainData.Session
    Left = 384
    Top = 126
    object dsSelDataID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object dsSelDataNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object dsSelDataSHORTNAME: TStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsSelDataOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
      Visible = False
    end
    object dsSelDataSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
      Visible = False
    end
    object dsSelDataSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsSelDataDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsSelDataOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
      Visible = False
    end
    object dsSelDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Visible = False
      Size = 1500
    end
    object dsSelDataTYPESYSNAME: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object dsSelDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsSelDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsSelDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsSelDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsSelDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
    object dsSelDataEXEC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1080#1089#1082#1080
      FieldName = 'EXEC_DATE'
    end
    object dsSelDataNAME_P: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
      FieldName = 'NAME_P'
      Size = 80
    end
    object dsSelDataINN_P: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'INN_P'
      Size = 12
    end
    object dsSelDataKPP_P: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsSelDataDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_SUMMA'
      Required = True
    end
    object dsSelDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Visible = False
      Size = 50
    end
    object dsSelDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
      Visible = False
    end
    object dsSelDataNAME_K: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'NAME_K'
      Size = 80
    end
    object dsSelDataINN_K: TStringField
      DisplayLabel = #1048#1053#1053' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'INN_K'
      Size = 12
    end
    object dsSelDataKPP_K: TStringField
      DisplayLabel = #1050#1055#1055' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'KPP_K'
      Size = 9
    end
    object dsSelDataNOTE: TStringField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'NOTE'
      Size = 400
    end
    object dsSelDataINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'INCOME_DATE'
    end
    object dsSelDataVAL_PAYMENT_REASON: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1086#1089#1085#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'VAL_PAYMENT_REASON'
      Size = 2
    end
    object dsSelDataVAL_DOC_NUMBER: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1085#1086#1084#1077#1088#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VAL_DOC_NUMBER'
      Size = 15
    end
    object dsSelDataVAL_DOC_DATE: TDateTimeField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1076#1072#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'VAL_DOC_DATE'
    end
    object dsSelDataVAL_PAYMENT_TYPE: TStringField
      DisplayLabel = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100' '#1090#1080#1087#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'VAL_PAYMENT_TYPE'
      Size = 2
    end
    object dsSelDataDESTCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
      FieldName = 'DESTCUSTOMSCODE'
      Size = 8
    end
    object dsSelDataKBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
  end
  object srcSelData: TDataSource
    DataSet = dsSelData
    Left = 445
    Top = 130
  end
  object pmnSelDataDBBandedTableView: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = btnInclude
        Visible = True
      end
      item
        BeginGroup = True
        Item = btnIncludeAll
        Visible = True
      end>
    UseOwnFont = False
    Left = 333
    Top = 472
  end
  object SelGridPopupMenu: TcxGridPopupMenu
    Grid = grdDataSel
    PopupMenus = <
      item
        GridView = grdSelDataDBBandedTableView
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
        PopupMenu = pmnSelDataDBBandedTableView
      end>
    AlwaysFireOnPopup = True
    Left = 501
    Top = 472
  end
end
