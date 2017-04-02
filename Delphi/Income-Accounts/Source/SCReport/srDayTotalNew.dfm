inherited srDayTotalNewGridForm: TsrDayTotalNewGridForm
  Left = 235
  Top = 140
  Width = 943
  Height = 584
  Caption = #1048#1090#1086#1075#1080' '#1076#1085#1103' ('#1085#1086#1074#1099#1077')'
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 532
    Width = 935
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Left = 1
      Top = 3
      Width = 100
      Height = 21
      inherited lblRecordCount: TcxLabel
        Height = 21
        Width = 100
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Top = 3
      Width = 100
      Height = 21
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 209
      Top = 3
      Width = 630
      Height = 21
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 630
        Height = 21
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 21
        end
      end
      inherited pnlProgress: TPanel
        Width = 630
        Height = 21
        inherited lblProgress: TcxLabel
          Height = 21
          Width = 630
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 843
      Top = 3
      Width = 75
      Height = 21
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 529
    Width = 935
  end
  inherited pnlWorkspace: TPanel
    Width = 935
    Height = 503
    inherited splSearchCriteria: TSplitter
      Left = 80
      Width = 9
      Height = 503
    end
    inherited pnlSearchCriteria: TPanel
      Width = 80
      Height = 503
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 80
        Height = 483
        inherited btnSearch: TcxButton
          Top = 435
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 80
      end
    end
    inherited pnlGrid: TPanel
      Left = 89
      Width = 846
      Height = 503
      inherited grdData: TcxGrid
        Top = 27
        Width = 846
        Height = 476
        inherited grdDataDBTableView: TcxGridDBTableView
          object grdDataDBTableViewPAYMENT_CODE: TcxGridDBColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            GroupIndex = 0
          end
          object grdDataDBTableViewTYPENAME: TcxGridDBColumn
            DataBinding.FieldName = 'TYPENAME'
          end
          object grdDataDBTableViewNAME: TcxGridDBColumn
            DataBinding.FieldName = 'NAME'
          end
          object grdDataDBTableViewSUM_CHARGE: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_CHARGE'
          end
          object grdDataDBTableViewSUM_CONFIRM: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_CONFIRM'
          end
          object grdDataDBTableViewSUM_NO_CONFIRM: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_NO_CONFIRM'
          end
          object grdDataDBTableViewSUMMA_DEPT: TcxGridDBColumn
            DataBinding.FieldName = 'SUMMA_DEPT'
          end
          object grdDataDBTableViewSUM_CHARGE_PERIOD: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_CHARGE_PERIOD'
          end
          object grdDataDBTableViewSUM_CONFIRM_PERIOD: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_CONFIRM_PERIOD'
          end
          object grdDataDBTableViewSUM_NO_CONFIRM_PERIOD: TcxGridDBColumn
            DataBinding.FieldName = 'SUM_NO_CONFIRM_PERIOD'
          end
        end
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_CHARGE'
              Column = grdDataDBBandedTableViewSUM_CHARGE
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_CHARGE_PERIOD'
              Column = grdDataDBBandedTableViewSUM_CHARGE_PERIOD
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_CONFIRM'
              Column = grdDataDBBandedTableViewSUM_CONFIRM
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_CONFIRM_PERIOD'
              Column = grdDataDBBandedTableViewSUM_CONFIRM_PERIOD
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_NO_CONFIRM'
              Column = grdDataDBBandedTableViewSUM_NO_CONFIRM
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUM_NO_CONFIRM_PERIOD'
              Column = grdDataDBBandedTableViewSUM_NO_CONFIRM_PERIOD
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUMMA_DEPT'
              Column = grdDataDBBandedTableViewSUMMA_DEPT
            end
            item
              Kind = skSum
              Position = spFooter
              FieldName = 'SUMMA_DEPT_PERIOD'
              Column = grdDataDBBandedTableViewSUMMA_DEPT_PERIOD
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'SUM_CHARGE'
              Column = grdDataDBBandedTableViewSUM_CHARGE
            end
            item
              Kind = skSum
              FieldName = 'SUM_CONFIRM'
              Column = grdDataDBBandedTableViewSUM_CONFIRM
            end
            item
              Kind = skSum
              FieldName = 'SUM_NO_CONFIRM'
              Column = grdDataDBBandedTableViewSUM_NO_CONFIRM
            end
            item
              Kind = skSum
              FieldName = 'SUMMA_DEPT'
              Column = grdDataDBBandedTableViewSUMMA_DEPT
            end
            item
              Kind = skSum
              FieldName = 'SUM_CHARGE_PERIOD'
              Column = grdDataDBBandedTableViewSUM_CHARGE_PERIOD
            end
            item
              Kind = skSum
              FieldName = 'SUM_CONFIRM_PERIOD'
              Column = grdDataDBBandedTableViewSUM_CONFIRM_PERIOD
            end
            item
              Kind = skSum
              FieldName = 'SUM_NO_CONFIRM_PERIOD'
              Column = grdDataDBBandedTableViewSUM_NO_CONFIRM_PERIOD
            end
            item
              Kind = skSum
              FieldName = 'SUMMA_DEPT_PERIOD'
              Column = grdDataDBBandedTableViewSUMMA_DEPT_PERIOD
            end>
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.BandHeaders = True
          Bands = <
            item
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090
              Width = 498
            end
            item
              Caption = #1057#1091#1084#1084#1072' ('#1056#1091#1073'.)'
            end
            item
              Caption = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077' "'#1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080'" ('#1056#1091#1073'.)'
            end>
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            GroupIndex = 1
            Width = 175
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Width = 123
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            GroupIndex = 0
            Width = 106
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Visible = False
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_CHARGE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_CHARGE'
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_CONFIRM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_CONFIRM'
            Width = 70
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_NO_CONFIRM: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_NO_CONFIRM'
            Width = 60
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_DEPT: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_DEPT'
            Width = 60
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_CHARGE_PERIOD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_CHARGE_PERIOD'
            Width = 70
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_CONFIRM_PERIOD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_CONFIRM_PERIOD'
            Width = 70
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUM_NO_CONFIRM_PERIOD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUM_NO_CONFIRM_PERIOD'
            Width = 60
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA_DEPT_PERIOD: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA_DEPT_PERIOD'
            Width = 117
            Position.BandIndex = 2
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView1: TcxGridDBBandedTableView [2]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsPaymentsReal
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object grdDataDBBandedTableView1NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1PAYER_TEXT_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYER_TEXT_ID'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1TYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Width = 200
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1CURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1DOC_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_SUMMA'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView2: TcxGridDBBandedTableView [3]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsZachteno
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object grdDataDBBandedTableView2ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2TYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2CURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 60
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2PAYMENT_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_TYPE'
            Width = 150
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView3: TcxGridDBBandedTableView [4]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDebts
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object grdDataDBBandedTableView3NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3ITEM_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ITEM_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3DECL_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3DECL_NO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NO'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3CUR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUR_CODE'
            Width = 50
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3REST_SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REST_SUMMA'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView4: TcxGridDBBandedTableView [5]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsBudget
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.GroupRowStyle = grsOffice11
          Bands = <
            item
              Options.Moving = False
            end>
          object grdDataDBBandedTableView4REESTR_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'REESTR_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4TYPENAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPENAME'
            Visible = False
            GroupIndex = 0
            SortIndex = 1
            SortOrder = soAscending
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object grdDataDBBandedTableView4DOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Visible = False
            GroupIndex = 1
            SortIndex = 0
            SortOrder = soAscending
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object grdDataDBBandedTableView4DOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object grdDataDBBandedTableView4DATE_SEND: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080
            DataBinding.FieldName = 'DATE_SEND'
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4DATE_LOAD: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
            DataBinding.FieldName = 'DATE_LOAD'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4UVED_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'UVED_ID'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4KBK_CODE_S: TcxGridDBBandedColumn
            Caption = #1050#1041#1050' '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBK_CODE_S'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4KBK_CODE_T: TcxGridDBBandedColumn
            Caption = #1050#1041#1050' '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBK_CODE_T'
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView4SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' ('#1056#1091#1073'.)'
            DataBinding.FieldName = 'SUMMA'
            Width = 140
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView5: TcxGridDBBandedTableView [6]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsSendBudget
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object grdDataDBBandedTableView5CUSTOMS_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView5PAYMENT_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_CODE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView5DOC_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_TYPE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView5DOC_NAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NAME'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView5PERECHISLENO: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PERECHISLENO'
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
      end
      object cxTabControl1: TcxTabControl
        Left = 0
        Top = 0
        Width = 846
        Height = 27
        Align = alTop
        TabIndex = 0
        TabOrder = 1
        Tabs.Strings = (
          #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1087#1086' '#1074#1080#1076#1091')'
          #1053#1072#1095#1080#1089#1083#1077#1085#1086' '#1087#1086' '#1074#1080#1076#1091' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1058#1056
          #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1087#1086' '#1076#1086#1082')'
          #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1087#1086' '#1087#1086#1089#1090#1072#1084')'
          #1055#1083#1072#1090#1077#1078#1080' ('#1087#1086#1076#1090#1074')'
          #1055#1083#1072#1090#1077#1078#1080' ('#1085#1077' '#1087#1086#1076#1090#1074')'
          #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
          #1041#1102#1076#1078#1077#1090' '#1087#1086' '#1076#1085#1103#1084
          #1047#1072#1095#1090#1077#1085#1086
          #1055#1077#1088#1077#1095#1080#1089#1083#1077#1085#1086' ('#1087#1086' '#1087#1086#1089#1090#1072#1084')')
        OnChange = cxTabControl1Change
        OnDrawTabEx = cxTabControl1DrawTabEx
        ClientRectBottom = 26
        ClientRectLeft = 1
        ClientRectRight = 845
        ClientRectTop = 21
      end
    end
  end
  inherited ActionList: TActionList
    inherited actAutoFilter: TAction
      Enabled = False
    end
    inherited actRefresh: TAction
      Enabled = False
    end
    inherited actSaveToFile: TAction
      Enabled = False
    end
    inherited actCopySelection: TAction
      Enabled = False
    end
    inherited actCopyAll: TAction
      Enabled = False
    end
    inherited actFilterByCell: TAction
      Enabled = False
    end
    inherited actFilterExcludeCell: TAction
      Enabled = False
    end
    inherited actClearFilter: TAction
      Enabled = False
    end
    inherited actCancelFilter: TAction
      Enabled = False
    end
    inherited actFilterDialog: TAction
      Enabled = False
    end
    inherited actAutoPreview: TAction
      Enabled = False
    end
    inherited actSwitchSearchCriteria: TAction
      Enabled = False
    end
    inherited actViewToolBar: TAction
      Enabled = False
    end
    inherited actViewStatusBar: TAction
      Enabled = False
    end
    inherited actSearchOk: TAction
      Enabled = False
    end
    inherited actSearchCancel: TAction
      Enabled = False
    end
    inherited actResetLayout: TAction
      Enabled = False
    end
    inherited actAutoWidth: TAction
      Enabled = False
    end
    object actCollapse: TAction
      Category = 'View'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1088#1072#1079#1076#1077#1083#1099
      ImageIndex = 6
      OnExecute = actCollapseExecute
    end
    object actExpand: TAction
      Category = 'View'
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100
      Hint = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077' '#1088#1072#1079#1076#1077#1083#1099
      ImageIndex = 7
      OnExecute = actExpandExecute
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
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      00000000000000000000000000000000000000000000B5B5B500736B7B00BD94
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000739CBD00315AB5006B63
      8C00BD949C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CCEFF0031A5FF003163
      B5006B638C00BD949C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400000000000000000000000000000000000000000000000000E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400000000000000000000000000000000000000000084C6FF0039A5
      FF003163B5006B638C00BD949C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C600000000000000000000000000000000000000000000000000E7AD9400F7F7
      F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6
      D600D6CECE00E7AD940000000000000000000000000000000000E7AD9400F7F7
      F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDEDE00D6D6
      D600D6CECE00E7AD9400000000000000000000000000000000000000000084C6
      FF0039A5FF003163BD006B638C00CEB5BD000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD6000000000000000000000000000000000000000000E7AD9400F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDE
      DE00D6D6D600E7AD940000000000000000000000000000000000E7AD9400F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDEDE00DEDE
      DE00D6D6D600E7AD940000000000000000000000000000000000000000000000
      000084C6FF0039A5FF003973C600949C9C00CEA59C00BD846B00BD846B00BD84
      6B00C6947B00CEA59C0000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF000000000000000000000000000000000000000000E7AD9400FFFF
      F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7E700DEDE
      DE00DEDEDE00E7AD940000000000000000000000000000000000E7AD9400FFFF
      F700F7F7F700F7F7F700F7F7F7000000000000000000E7E7E700E7E7E700DEDE
      DE00DEDEDE00E7AD940000000000000000000000000000000000000000000000
      0000000000009CD6FF00BDC6CE00A5736B00CE947300E7CE9C00FFF7BD00FFF7
      C600E7D6AD00CEA58C00C6948400000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C60000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFF700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00E7E7E700E7E7
      E700DEDEDE00E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFF700F7F7F700F7F7F7000000000000000000EFEFEF00E7E7E700E7E7
      E700DEDEDE00E7AD940000000000000000000000000000000000000000000000
      00000000000000000000D6ADA500CE947300FFF7B500FFF7B500FFFFCE00FFFF
      E700FFFFF700FFFFFF00CEA58C00C69C94000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C60000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000E7E7
      E700E7E7E700E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000E7E7
      E700E7E7E700E7AD940000000000000000000000000000000000000000000000
      00000000000000000000C6947B00E7C69400FFDE9C00FFF7B500FFFFD600FFFF
      E700FFFFFF00FFFFF700E7D6AD00BD8C73000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C600000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000EFEF
      EF00E7E7E700E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000EFEF
      EF00E7E7E700E7AD940000000000000000000000000000000000000000000000
      00000000000000000000BD846B00FFEFB500FFD69400FFEFAD00FFFFCE00FFFF
      DE00FFFFE700FFFFDE00FFF7C600BD846B000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7F700F7F7F700F7F7F700EFEF
      EF00EFEFEF00E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000F7F7F700F7F7F700EFEF
      EF00EFEFEF00E7AD940000000000000000000000000000000000000000000000
      00000000000000000000BD846B00FFEFB500FFE7AD00FFEFB500FFFFBD00FFFF
      C600FFFFCE00FFFFCE00FFEFBD00BD8463000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7F700F7F7F700F7F7
      F700EFEFEF00E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000F7F7F700F7F7F700F7F7
      F700EFEFEF00E7AD940000000000000000000000000000000000000000000000
      00000000000000000000C6947B00E7CEA500FFEFD600FFDEA500FFEFAD00FFEF
      AD00FFF7B500FFF7B500E7CE9400BD846B000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD29000884100000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7F700F7F7
      F700F7F7F700E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7F700F7F7
      F700F7F7F700E7AD940000000000000000000000000000000000000000000000
      00000000000000000000D6B5AD00CE9C8400FFFFFF00FFF7EF00FFEFBD00FFCE
      9400FFDEA500FFF7B500CE947300CEAD9C000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A518000000000000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7
      F700F7F7F700E7AD940000000000000000000000000000000000E7AD9400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700F7F7
      F700F7F7F700E7AD940000000000000000000000000000000000000000000000
      0000000000000000000000000000C69C8C00CE9C8400E7CEAD00FFEFBD00FFE7
      B500E7CE9C00CE947300BD94840000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      180008841000000000000000000000000000000000000000000000000000E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400000000000000000000000000000000000000000000000000E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD94000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B5AD00BD8C7300BD846B00BD84
      6B00C68C7B00D6B5AD0000000000000000000000000000000000000000000000
      000000000000000000000000000000730800087B0800088C1000088C1000087B
      0800000000000000000000000000000000000000000000000000000000000000
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
      000000000000B58C8C008C5A5A008C5A5A008C5A5A008C5A5A008C5A5A008C5A
      5A008C5A5A008C5A5A008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5636B00A5636B00000000000000
      00000000000000000000000000000000000000000000A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B730094635A0000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700F7EFDE00F7EFDE00F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00F7E7CE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5636B0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000A57B7300F7E7D600F7E7
      D600FFEFD600EFDEBD00FFE7C600FFDEBD00FFDEBD00FFDEB500FFD6AD00FFD6
      A500FFD6A5009463630000000000000000000000000000000000000000000000
      000000000000B58C8C00F7EFDE00F7DECE00F7DEC600F7DEC600F7DEC600F7DE
      C600EFDECE00EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00CECED60084848400A5636B00000000000000
      00000000000000000000000000000000000000000000AD847B00F7E7DE00F7E7
      DE00009C0000ADDEA50073C6730042AD310084BD5A00EFD6A500FFD6AD00FFD6
      A500FFD6A5009463630000000000000000000000000000000000000000000000
      000000000000B58C8C00FFF7E700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFDECE008C5A5A000000000000000000B5948C00B5848400B584
      8400B5848400B5848400B5848400B5848400B5948C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000B5847B00F7EFDE00F7EF
      DE00009C0000009C0000009C0000009C0000009C000042AD2900FFDEB500FFD6
      AD00FFD6AD009C6B6300000000000000000000000000B58C8C008C5A5A008C5A
      5A008C5A5A00B58C8C00FFF7EF00F7DEC600F7DEC600F7DEC600F7DEC600F7DE
      BD00F7E7CE00EFDECE009C6B63000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400B5848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5636B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000B58C7B00F7EFE700F7EF
      E700009C0000009C0000109C0800CED6A500FFE7CE0021A51800FFDEB500FFD6
      B500FFD6B5009C6B6300000000000000000000000000B58C8C00FFF7E700F7EF
      DE00F7EFDE00B58C8C00FFF7EF00F7E7CE00F7DEC600F7DEC600F7DEC600F7DE
      C600F7E7D600EFDECE009C6B6B000000000000000000B5848400E7CECE00E7CE
      CE00E7CECE00E7CECE00E7CECE00E7CECE00B5848400C6A59C00B58484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5736B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000BD8C7B00F7EFEF00F7EF
      EF00009C0000009C0000009C0000009C0000FFE7CE00EFDEBD00FFDEB500FFD6
      B500FFDEB500A5736B00000000000000000000000000B58C8C00F7EFDE00F7DE
      CE00F7DEC600B58C8C00FFFFF700FFD6A500FFD6A500FFD6A500FFD6A500FFD6
      A500FFD6A500EFE7D600A57B73000000000000000000B5948C00D6BDB500D6BD
      B500D6BDB500D6BDB500D6BDB500D6BDB500B5848400C6A59C00C6A59C00B584
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BD846B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000C6948400FFF7EF00FFF7
      EF00FFF7EF00FFF7EF00FFF7EF00FFF7EF00EFE7C600EFE7C600FFE7CE00FFDE
      BD00FFDEBD00A5736B00000000000000000000000000B58C8C00FFF7E700FFD6
      A500FFD6A500B58C8C00FFFFF700FFE7D600FFE7D600F7E7D600F7E7CE00FFE7
      D600FFF7E700EFDEDE00A57B7300000000000000000000000000B5948C00E7C6
      B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A59C00C6A5
      9C00B58484000000000000000000000000000000000000000000000000000000
      00000000000000000000D6946B00EFEFEF0084848400A5636B00000000000000
      00000000000000000000000000000000000000000000CE9C8400FFF7F700FFFF
      FF00FFF7EF00FFF7EF00FFF7EF00009C0000009C0000009C0000FFEFD600FFE7
      C600FFE7C600AD736B00000000000000000000000000B58C8C00FFF7EF00F7DE
      C600F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700EFDE
      DE00D6C6C600BDADAD00B584730000000000000000000000000000000000B594
      8C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B5848400C6A5
      9C00C6A59C00B584840000000000000000000000000000000000000000000000
      000000000000BD7B5A00EFEFEF00CECED6008484840042424200A5636B000000
      00000000000000000000000000000000000000000000D6A58400FFFFFF00FFFF
      FF00109C1000ADDEA500FFF7EF00ADDEA500009C0000009C0000FFEFD600FFE7
      CE00FFE7C600AD7B6B00000000000000000000000000B58C8C00FFF7EF00F7E7
      CE00F7DEC600B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700B58C
      8C00B58C8C00B58C8C00B58C8C00000000000000000000000000000000000000
      0000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500B584
      8400C6A59C00C6A59C00B5848400000000000000000000000000000000000000
      0000BD7B5A00EFEFEF00CECED600BDBDBD008C8C8C005A5A5A0042424200A563
      6B000000000000000000000000000000000000000000DEAD8C00FFFFFF00FFFF
      FF0073C67300009C0000009C0000009C0000009C0000009C0000FFEFD600FFEF
      D600FFE7CE00AD7B7300000000000000000000000000B58C8C00FFFFF700FFD6
      A500FFD6A500B58C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B58C
      8C00EFB56B00C68C7B0000000000000000000000000000000000000000000000
      000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500B5848400C6A59C00B584840000000000000000000000000000000000BD7B
      5A00EFEFEF00EFEFEF00C6C6C600ADADAD008C8C8C00737373005A5A5A004242
      4200A5636B0000000000000000000000000000000000DEAD8C00FFFFFF00FFFF
      FF00FFFFFF0073C67300009C0000009C0000ADDEA500009C0000FFEFD600FFCE
      C600FFB5B500B57B7300000000000000000000000000B58C8C00FFFFF700FFE7
      D600FFE7D600B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C8C00B58C
      8C00BD8484000000000000000000000000000000000000000000000000000000
      00000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500B5848400B5848400000000000000000000000000BD7B5A00EFEF
      EF00EFEFEF00CECED600BDBDBD009C9C9C008484840084848400737373005A5A
      5A0042424200A5636B00000000000000000000000000E7B58C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7EF00F7DECE00B584
      7300B5847300B5847300000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700EFDEDE00D6C6C600BDADAD00B58473000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5948C00E7C6B500E7C6B500E7C6B500E7C6
      B500E7C6B500E7C6B500B58484000000000000000000BD7B5A00EFEFEF00EFEF
      EF00CECED600C6C6C600C6C6C600848484008484840084848400848484007373
      73005A5A5A0042424200A5636B000000000000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7E7D600B584
      7300EFA55200D6AD9400000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFFFF700B58C8C00B58C8C00B58C8C00B58C8C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5948C00B5848400B5848400B584
      8400B5848400B5848400B5948C0000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B0000000000EFBD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F700F7F7F700F7F7F700F7EFEF00EFDED600B584
      7300DEB59C0000000000000000000000000000000000B58C8C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B58C8C00EFB56B00C68C7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7BD9400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B584
      73000000000000000000000000000000000000000000B58C8C00B58C8C00B58C
      8C00B58C8C00B58C8C00B58C8C00B58C8C00BD84840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008FFFFFFFFFFFFFFF87FF8FFFFFFFFFFF
      83FF807FE007E007C1FF800FC003C003E0FF8007C003C003F0038007C003C003
      F8018003C003C003FC008003C003C003FC008001C003C003FC008001C003C003
      FC008001C003C003FC008003C003C003FC008007C003C003FE01C3C7E007E007
      FF03FE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF801FFFFFF3F8003F801FFFFFE3F
      8003F801FFFFFC3F8003F801807FFC3F80038001803FFC3F80038001801FFC3F
      80038001800FFC3F80038001C007FC3F80038001E003F81F80038001F001F00F
      80038003F801E00780038007FC01C0038003801FFE0180018003801FFF010000
      8007803FFFFFFFFF800F807FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited imglLarge: TImageList
    Bitmap = {
      494C010108000900040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
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
      00000000000000000000000000000000000000000000000000008C8C8C006B63
      7300C69C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD940000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400000000000000000000000000949C9C00425A73004252
      9C007B6B8C00BD949C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD940000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD94000000000000000000000000007B9CAD00319CFF00216B
      D60042529C007B6B8C00BD949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5D60021A5D60021A5
      D6005AC6E70042BDE70029ADD60021A5D60018A5D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6CECE00D6CECE00E7AD9400E7AD9400E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6CECE00D6CECE00E7AD9400E7AD94000000000094CEFF0042ADFF00319C
      FF00216BD600425294007B638C00C6949C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018A5D600ADDEF700B5FF
      FF009CFFFF0094F7FF008CEFFF007BE7F7006BD6F70052C6E70042B5DE0029AD
      D60021A5D60018A5D60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6CECE00D6CECE00E7AD9400E7AD9400E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7
      E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDEDE00D6D6D600D6D6
      D600D6CECE00D6CECE00E7AD9400E7AD9400000000000000000094CEFF0042B5
      FF00319CFF00216BD60039529C007B638C00C6949C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A5D60063BDE700CEFF
      FF008CF7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CEF
      FF0073DEF7005ACEEF004AC6E70031B5DE0021A5D60018A5D60018A5D6000000
      000000000000000000000000000000000000E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600E7AD9400E7AD9400E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600E7AD9400E7AD940000000000000000000000000094CE
      FF0042B5FF00319CFF00216BD60039529C007B638C00C69C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5D60042B5DE00BDEF
      F7009CFFFF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CF7
      FF0094F7FF0094F7FF008CEFFF008CEFFF0084E7FF0063D6EF0031ADDE000000
      000000000000000000000000000000000000E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600E7AD9400E7AD9400E7AD9400E7AD9400F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D600E7AD9400E7AD94000000000000000000000000000000
      000094CEFF0042ADFF00319CFF00216BD60039529C007B638C00C69CA5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6005AC6E70094D6
      EF00B5FFFF008CF7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0084E7FF005ACEEF0021A5
      D60000000000000000000000000000000000E7AD9400E7AD9400FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7AD9400E7AD9400E7AD9400E7AD9400FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700000000000000
      00000000000000000000E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7AD9400E7AD94000000000000000000000000000000
      00000000000094CEFF0042ADFF00319CFF00216BD60039529C008C7B94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6007BE7F70063C6
      E700C6F7FF008CF7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF007BE7F70073DEF70039BD
      DE0000000000000000000000000000000000E7AD9400E7AD9400FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7AD9400E7AD9400E7AD9400E7AD9400FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700000000000000
      00000000000000000000E7E7E700E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000094CEFF0039ADFF00319CFF003973BD00737B84000000
      000000000000BD8C8400AD7B6B00AD847300B5948400C69C8C00C69C8C00C6A5
      9C00000000000000000000000000000000000000000029ADD60094EFF70052CE
      E700BDE7F7009CFFFF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DEFF0063D6
      EF0018A5D600000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE00DEDEDE00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700000000000000
      00000000000000000000EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE00DEDEDE00E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000009CCEFF0084C6F700B5BDC6008C847B009473
      6B00BD847300D6AD8C00EFE7AD00FFF7BD00FFFFCE00FFF7CE00EFE7C600D6C6
      A500BD948C00C6A5A50000000000000000000000000029ADD6009CEFFF0063DE
      EF008CCEEF00BDFFFF008CF7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DEF7008CEF
      FF0029ADD600000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE00DEDEDE00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700000000000000
      00000000000000000000EFEFEF00EFEFEF00E7E7E700E7E7E700E7E7E700E7E7
      E700DEDEDE00DEDEDE00E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5847B00C684
      6B00F7CE9C00FFFFBD00FFFFC600FFFFC600FFFFCE00FFFFD600FFFFDE00FFFF
      F700F7EFE700BD9C8C00BD9C9C00000000000000000029ADD60094EFF7008CF7
      FF004ABDDE00CEF7FF00A5FFFF0094F7FF008CF7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF700087B10001084
      18004AC6E700000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700E7E7
      E700E7E7E700E7E7E700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700E7E7
      E700E7E7E700E7E7E700E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6847300F7CE
      9C00FFF7BD00FFEFAD00FFFFB500FFFFCE00FFFFDE00FFFFE700FFFFEF00FFFF
      FF00FFFFFF00F7EFDE00AD7B7300000000000000000029ADD60094EFF7009CFF
      FF005AD6EF0063BDE700BDE7F700BDEFF700C6F7FF00C6F7FF00BDFFFF009CF7
      FF0084EFFF008CEFFF008CEFFF008CEFFF008CEFFF000873080039BD63004AD6
      7B001084180018A5D6000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700E7E7
      E700E7E7E700E7E7E700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700E7E7
      E700E7E7E700E7E7E700E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000C6A59C00D6AD8C00FFF7
      B500FFE7A500FFE7A500FFFFBD00FFFFCE00FFFFDE00FFFFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFDE00D6C6A500A57B7B000000000029ADD6009CEFFF0094FF
      FF0094F7FF0063D6EF0052CEE7005AC6E70063C6E70063C6E70073C6E700BDE7
      F700B5F7FF0084EFFF008CEFFF008CEFFF00006B000031AD52005AE78C005AE7
      8C0039BD5A00087310000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000C6948400EFD6A500FFEF
      B500FFD69400FFE7A500FFFFBD00FFFFCE00FFFFDE00FFFFEF00FFFFF700FFFF
      F700FFFFE700FFFFCE00EFE7BD009C6B63000000000029ADD6009CEFFF0094FF
      FF0094F7FF009CFFFF0094FFFF0094F7FF008CEFFF0084EFFF0063D6EF0042B5
      DE00ADDEF700C6F7FF0094F7FF000873080029AD4A005AEF940052DE84004AD6
      6B0021AD310021AD39000873080000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00E7E7E700E7E7E700E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C8400FFF7B500FFE7
      A500FFCE9400FFDE9C00FFFFB500FFFFCE00FFFFD600FFFFE700FFFFE700FFFF
      E700FFFFDE00FFFFCE00F7F7BD00AD8473000000000029ADD6009CEFFF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF007BE7
      F70042BDE7007BCEE7000873080021AD310031AD520039BD5A0042CE6B0039C6
      5A0029BD4A0021AD310021AD310000730800E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C8400FFFFBD00FFE7
      9C00FFCE8C00FFE7A500FFF7B500FFFFBD00FFFFCE00FFFFD600FFFFD600FFFF
      D600FFFFD600FFFFC600FFFFC600AD8473000000000029ADD6009CF7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7
      FF008CEFFF005AD6EF000873080008730800087308000873100031BD4A0031BD
      4A0008730800087308000873080008730800E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000F7F7F700F7F7F700F7F7F700F7F7F700EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000BD8C8400FFF7B500FFEF
      B500FFE7AD00FFDE9C00FFE7A500FFFFBD00FFFFC600FFFFC600FFFFCE00FFFF
      CE00FFFFC600FFFFBD00F7E7AD00A5736B000000000029ADD600A5F7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CF7
      FF008CEFFF0094F7FF008CEFFF007BEFFF0084EFFF000873080021AD390021BD
      390008730800000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000C69C9400EFD6A500FFFF
      CE00FFEFC600FFD69C00FFCE9400FFE7AD00FFEFAD00FFF7B500FFFFBD00FFFF
      BD00FFEFB500FFFFBD00EFCE9400946B63000000000029ADD600B5F7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CF7FF000873100018AD290010AD
      210008730800000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700EFEFEF00EFEFEF00E7AD9400E7AD94000000000000000000000000000000
      00000000000000000000000000000000000000000000C6A59C00D6AD9400FFFF
      E700FFFFFF00FFFFF700FFDEAD00FFDEA500FFDE9C00FFDE9C00FFE7A500FFDE
      A500FFF7B500FFEFB500C6947300000000000000000018A5D6007BCEE700B5FF
      FF0094FFFF0094FFFF0094F7FF0094F7FF0084EFFF0031ADDE0031ADDE0039B5
      DE0042B5DE0042B5DE004ABDDE004ABDDE005ABDE7000884100010AD2100089C
      180008730800000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD948400E7D6
      C600FFFFFF00FFFFFF00FFE7BD00FFE7AD00FFCE9400FFC68C00FFD69400FFF7
      AD00FFEFB500E7AD84009C6B6B0000000000000000000000000021A5D60084D6
      EF0094E7F70094E7F7009CEFFF00A5F7FF005ACEE70010A5D600000000000000
      00000000000000000000000000000000000008730800089C180010AD21000884
      100008730800000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD94000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8400E7D6CE00FFFFFF00FFFFE700FFF7BD00FFEFAD00FFF7B500FFFFBD00FFE7
      AD00EFAD7B00A5736B00000000000000000000000000000000000000000018A5
      D60021A5D60021A5D60029ADD60029ADD60021A5D60000000000000000000000
      000000000000000000000000000008841000089C180008A51800088C10000873
      080000000000000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD7B7B00BD947B00E7CE9C00F7E7AD00FFEFB500F7DEAD00EFC69400C694
      7B00AD7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000873
      08000873080010841800089418000894180008941800087B1000087308000000
      000000000000000000000000000000000000E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD9400E7AD9400E7AD9400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700F7F7F700F7F7
      F700F7F7F700F7F7F700E7AD9400E7AD94000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6A59C009C7373009C6B6300A5736B00B5847B00B5848400C6A5
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087308000873100008730800087308000873080000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD940000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD940000000000000000000000000000000000E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD9400E7AD
      9400E7AD9400E7AD94000000000000000000000000000000000000000000AD7B
      7B00B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B5848400B5848400B5848400B5848400B5848400B5848400B584
      8400B5848400B584840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000636363009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00EFDEC600F7E7C600F7DEBD00F7DEB500F7D6B500EFD6AD00F7D6A500EFCE
      9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300EFDECE00F7EFDE00F7E7
      D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600F7E7
      D600F7EFD600EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200FF8400006363
      6300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00EFDEC600F7E7C600F7DEC600F7DEBD00BDCE8C00E7D6A500E7D6A500EFCE
      A500EFCE9C00EFCE9C00EFCE9400EFCE9400EFCE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300EFDECE00F7EFDE00EFE7
      D600EFE7D600EFE7D600EFE7D600EFDECE00EFDECE00EFDECE00EFDECE00EFDE
      CE00EFE7D600EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000052525200E7A55A003131
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00F7DECE00F7E7CE00F7DEC600F7DEC600CED69C00009C0000E7D6A5006BB5
      4A0039A5290039A529006BB54A00C6C67B00E7CE9400EFCE9400EFCE9400EFCE
      9400EFCE9400B58C7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B7300EFDED600F7EFE700EFE7
      DE00EFE7DE00EFE7D600EFE7D600EFE7D600EFE7D600EFDECE00EFDECE00EFDE
      CE00EFE7D600EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00DE944A00DE944A00FF84
      00009C9C9C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00EFE7CE00F7E7D600F7E7CE00F7DEC600EFDEB500009C0000109C1000009C
      0000009C0000009C0000009C0000009C000094BD5A00E7CE9400EFCE9400EFCE
      9400EFCE9400B58C7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300EFDED600F7EFE700F7DE
      C600FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00FFD6AD00F7DE
      BD00EFE7D600EFDECE008C5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C009C9C9C00FFE7CE00E7A55A00DE94
      4A00FF8400009C9C9C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      7B00F7E7D600F7EFDE00F7E7D600F7E7CE00EFDEBD00009C0000009C0000009C
      0000009C0000009C0000009C0000009C0000009C0000C6C67B00EFCE9400EFCE
      9400EFCE9400B58C7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5847300EFDED600F7EFE700FFE7
      CE00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DEBD00F7DE
      C600EFE7D600EFDECE008C5A5A0000000000000000009C5A29009C5A29009C5A
      29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A29009C5A
      29009C5A29009C5A290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00DE944A00FFE7CE00FFD6A500FFD6A500E7A5
      5A00DE944A00525252009C9C9C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD84
      7B00F7E7DE00F7EFDE00F7E7D600F7E7CE00E7DEC600009C0000009C0000009C
      000039AD3100C6CE8C00C6CE8C006BB54A00009C000039A52900EFCE9400EFCE
      9400EFCE9400B58C7B00000000000000000000000000A57B7300A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300B5847300EFE7DE00FFF7EF00F7EF
      DE00F7E7DE00F7E7DE00F7E7D600F7E7D600F7E7D600F7E7D600EFE7D600EFE7
      D600F7E7D600EFDECE009C6B630000000000000000009C5A2900E7CEB500B573
      2900B5732900B5732900B5732900B5732900B5732900B5732900B5732900F7E7
      D6009C5A2900B57329009C5A2900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00FFF7EF00FFE7CE00FFE7CE00FFD6A500E7A5
      5A00EFBD8400DE944A00FF8400009C9C9C000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD84
      7B00F7EFE700F7EFE700F7EFDE00F7E7D600EFE7C600009C0000009C0000009C
      000031A52100E7D6AD00E7D6A500E7D6A500A5C67300109C0800EFCE9C00EFCE
      9400EFCE9400B58C7B00000000000000000000000000A57B7300EFDECE00F7EF
      DE00F7E7D600F7E7D600F7E7D600F7E7D600BD8C8400EFE7DE00FFF7EF00F7DE
      BD00FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7DE
      BD00F7E7DE00EFDECE009C6B630000000000000000009C5A2900E7CEB500BD7B
      4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00F7E7
      D6009C5A2900B5732900B57329009C5A29000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00DE944A00FFF7EF00FFF7EF00FFE7CE00FFD6A500E7A55A00EFBD
      8400EFBD8400EFBD8400DE944A00525252009C9C9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      7B00F7EFE700FFF7EF00F7EFE700F7EFDE00EFE7CE00009C0000009C0000009C
      0000009C0000009C0000E7D6AD00EFD6AD00EFD6AD00EFCEA5007BCE7B00EFCE
      9C00EFCE9400B58C7B00000000000000000000000000A57B7300EFDECE00F7EF
      DE00EFE7D600EFE7D600EFE7D600EFE7D600BD8C8400EFE7DE00FFF7F700F7EF
      E700F7EFDE00F7E7DE00F7E7DE00F7E7D600F7E7D600F7E7D600F7E7D600F7E7
      D600F7E7DE00EFDECE009C6B630000000000000000009C5A2900E7CEB500BD7B
      4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00BD7B4A00F7E7
      D6009C5A2900B5732900B5732900B57329009C5A290000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00DE944A00FFF7EF00E7A55A00FF840000FF84000063636300FF840000FF84
      00005252520052525200FF840000FF840000FF8400009C9C9C00000000000000
      000000000000000000000000000000000000000000000000000000000000B58C
      8400F7EFEF00FFF7EF00F7EFE700F7EFE700EFE7CE00EFE7CE00E7DEC600E7DE
      C600EFDEBD00EFDEB500E7D6AD00F7D6B500EFD6AD00EFD6AD007BCE7B00EFCE
      9C00EFCE9400B58C7B00000000000000000000000000A57B7300EFDED600F7EF
      E700EFE7DE00EFE7DE00EFE7D600EFE7D600CE9C8400EFE7E700FFFFF700F7EF
      DE00F7E7D600F7E7D600F7E7D600F7E7D600F7E7D600FFE7CE00F7DEC600F7E7
      D600F7EFDE00EFDED600A57B730000000000000000009C5A290094949400E7CE
      B500DE9C7300DE9C7300DE9C7300DE9C7300DE9C7300DE9C7300DE9C7300F7E7
      D600949494009C5A2900B5732900B5732900B5732900394A9400000000000000
      00000000000000000000000000000000000000000000000000009C9C9C005252
      520052525200525252006363630063636300C6C6C600EFEFEF00EFEFEF00EFEF
      EF00C6A5A50063636300525252005252520052525200525252009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000BD8C
      8400FFF7F700FFFFF700FFF7EF007BCE7B00F7EFE700F7EFDE00F7E7D600EFE7
      C600E7DEC600EFDEBD00EFDEB500E7D6AD00E7D6AD00E7D6A500EFD6AD00EFCE
      A500EFCE9C00B58C7B00000000000000000000000000B5847300EFDED600F7EF
      E700F7DEC600FFD6AD00FFD6AD00FFD6AD00CE9C8400F7EFE700FFFFFF00FFDE
      C600FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500FFD6A500F7DE
      C600F7EFE700EFE7D600A57B73000000000000000000000000009C5A2900E7CE
      B500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500F7E7D600F7E7D600E7E7
      E700E7CEB5009C5A2900B5732900B5732900B57329004A6B9C00394A94000000
      000000000000000000000000000000000000000000009C9C9C0052525200FF84
      0000FF84000063636300EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00C6A5A50063636300FF840000FF840000FF840000FF840000525252009C9C
      9C0000000000000000000000000000000000000000000000000000000000BD94
      8400FFF7F700FFFFFF00FFF7F7007BCE7B00F7EFE700F7EFE700F7EFDE00EFE7
      CE00009C0000009C0000009C0000009C0000009C0000E7D6AD00EFD6AD00EFD6
      AD00EFCEA500B58C7B00000000000000000000000000B5847300EFDED600F7EF
      E700FFE7CE00F7DEBD00F7DEBD00F7DEBD00DEAD8400F7EFEF00FFFFFF00FFF7
      F700FFF7EF00FFF7EF00F7EFEF00F7EFE700F7EFE700F7EFE700F7EFE700F7EF
      E700F7EFE700DED6CE00A57B7300000000000000000000000000000000009C5A
      2900E7A57300E7A57300E7A57300E7A57300E7A57300E7A57300E7A57300E7A5
      7300E7A57300E7A573009C5A2900B5732900B57329007B94C6004A6B9C00394A
      9400000000000000000000000000000000009C9C9C0052525200FF840000FF84
      000052525200EFEFEF00EFEFEF00EFEFEF00EFEFEF009C9C9C009C9C9C00EFEF
      EF00C6A5A5009C9C9C006363630052525200FF840000FF840000FF8400005252
      52009C9C9C00000000000000000000000000000000000000000000000000C694
      8400FFF7F700FFFFFF00FFFFFF00FFF7F700109C1000ADD6A500EFEFD600EFE7
      CE00EFE7CE0031AD2900009C0000009C0000009C0000E7D6AD00F7D6B500EFD6
      AD00EFCEA500B58C7B00000000000000000000000000B5847300EFE7DE00FFF7
      EF00F7EFDE00F7E7DE00F7E7DE00F7E7D600DEAD8400F7EFEF00FFFFFF00FFFF
      FF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7F700EFE7
      E700D6D6D600BDBDBD00B5847300000000000000000000000000000000000000
      00009C5A2900E7A57300E7A57300E7A57300E7A57300E7A57300E7A57300E7A5
      7300E7A57300E7A57300E7A573009C5A2900B57329007B94C6007B94C6004A6B
      9C00394A94000000000000000000000000009C9C9C0052525200FF840000FF84
      0000FF8400009C9C9C009C9C9C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00C6A5A500DEDEDE009C9C9C0052525200FF840000FF840000FF8400005252
      52009C9C9C00000000000000000000000000000000000000000000000000C69C
      8400FFF7F700FFFFFF00FFFFFF00FFFFFF0039AD3900009C000073C66B00CEDE
      B500CEDEB50039AD3900009C0000009C0000009C0000EFDEB500F7DEBD00F7D6
      B500EFD6AD00B58C7B00000000000000000000000000BD8C8400EFE7DE00FFF7
      EF00F7DEBD00FFD6A500FFD6A500FFD6A500E7B58C00F7EFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7F700F7EFE700B5847300B584
      7300B5847300B5847300B5847300000000000000000000000000000000000000
      0000000000009C5A2900E7A57300E7A57300E7A57300E7A57300E7A57300E7A5
      7300E7A57300E7A57300E7A57300E7A573009C5A29004A6B9C007B94C6007B94
      C6004A6B9C00394A940000000000000000009C9C9C0052525200FF8400005252
      52009C9C9C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00C6A5A500E7E7E700CECECE009C9C9C0052525200FF840000FF8400005252
      52009C9C9C00000000000000000000000000000000000000000000000000C69C
      8400FFF7F700FFFFFF00FFFFFF00FFFFFF00CEEFCE00009C0000009C0000009C
      0000009C0000009C0000009C0000009C0000009C0000EFDEBD00F7DEBD00EFDE
      BD00DEC6A5009C847B00000000000000000000000000BD8C8400EFE7DE00FFF7
      F700F7EFE700F7EFDE00F7E7DE00F7E7DE00E7B58C00F7EFEF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFFF00EFE7DE00B5847300E7AD
      7300EFAD5A00E79C4200BD848400000000000000000000000000000000000000
      000000000000000000009C5A2900E7A57300E7A57300E7A57300E7A57300E7A5
      7300E7A57300E7A57300E7A57300E7A57300E7A57300394A94004A6B9C007B94
      C6007B94C6004A6B9C00394A940000000000000000009C9C9C0052525200B584
      8400EFEFEF00EFEFEF00EFEFEF009C9C9C009C9C9C009C9C9C00EFEFEF00C6A5
      A500E7E7E700E7E7E700DEDEDE00CECECE005252520052525200525252009C9C
      9C0000000000000000000000000000000000000000000000000000000000CE9C
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00F7FFF7009CDE9C00009C0000009C
      0000009C0000009C0000009C0000109C1000009C0000E7DEC600EFDEBD00CEBD
      AD00B5AD94009C847B00000000000000000000000000CE9C8400EFE7E700FFFF
      F700F7EFDE00F7E7D600F7E7D600F7E7D600EFBD9400FFF7EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7E700B5847300F7C6
      7B00EFAD5A00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000394A9400ADCEE700ADCEE700ADCEE700ADCE
      E700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700394A94004A6B
      9C007B94C6007B94C600394A9400000000000000000000000000B58484009C9C
      9C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C6A5
      A500E7E7E700E7E7E700E7E7E700DEDEDE006363630063636300000000000000
      000000000000000000000000000000000000000000000000000000000000CEA5
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FFF700CEEFCE0073C6
      6B0039AD390039AD390073C66300EFE7CE00009C0000C6D6AD00CEBDAD00BDB5
      A500B5AD9C009C847B00000000000000000000000000CE9C8400F7EFE700FFFF
      FF00FFDEC600FFD6A500FFD6A500FFD6A500EFBD9400FFF7EF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7E700B5847300E7B5
      7B00BD8484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000394A9400ADCEE700ADCEE700ADCE
      E700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700394A
      94004A6B9C007B94C600394A9400000000000000000000000000B58484009C9C
      9C00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00C6A5A5009C9C
      9C00E7E7E700E7E7E700E7E7E700E7E7E700C6A5A50063636300000000000000
      000000000000000000000000000000000000000000000000000000000000D6A5
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F700FFF7EF00FFF7E700E7DEC600AD84730084845A00AD7B7300AD7B
      7300AD7B7300AD847300000000000000000000000000DEAD8400F7EFEF00FFFF
      FF00FFF7F700FFF7EF00FFF7EF00F7EFEF00EFBD9400DEAD8400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B5847300BD84
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000394A9400ADCEE700ADCE
      E700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCE
      E700394A94004A6B9C00394A94000000000000000000C6A5A500EFEFEF00EFEF
      EF00EFEFEF009C9C9C009C9C9C00C6A5A500C6A5A500C6A5A50063636300CECE
      CE00E7E7E700E7E7E700E7E7E7009C9C9C009C9C9C00525252009C9C9C000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFF700FFF7F700FFF7EF00E7CEC600B5847300E7B58400E7AD6B00EFA5
      5200EFA53900B5848400000000000000000000000000DEAD8400F7EFEF00FFFF
      FF00FFFFFF00FFFFFF00FFF7F700FFF7F700FFF7F700FFF7F700FFF7EF00FFF7
      F700EFE7E700D6D6D600BDBDBD00B58473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000394A9400ADCE
      E700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCE
      E700ADCEE700394A9400394A94000000000000000000C6A5A500C6A5A500C6A5
      A500C6A5A500C6A5A500C6A5A500CECECE00C6A5A500CECECE00FFFFFF00FFFF
      FF00C6A5A500C6A5A500C6A5A5009C9C9C009C9C9C00C6A5A500525252000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700E7CEC600B5847300EFC68C00F7BD6B00FFB5
      5200B584840000000000000000000000000000000000E7B58C00F7EFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFF700FFF7F700FFF7F700FFF7F700F7EFE700B584
      7300B5847300B5847300B5847300B58473000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000394A
      9400ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCEE700ADCE
      E700ADCEE700ADCEE700394A9400000000009C9C9C00C6A5A500636363009C9C
      9C009C9C9C009C9C9C00C6C6C600CECECE0063636300C6A5A500C6A5A500C6A5
      A500EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6A5A5000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00B5847300EFC68C00F7BD6B00B584
      84000000000000000000000000000000000000000000E7B58C00F7EFEF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFFF00EFE7DE00B584
      7300E7AD7300EFAD5A00E79C4200BD8484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A6B9C00394A9400394A9400394A9400394A9400394A9400394A9400394A
      9400394A94004A6B9C0000000000000000009C9C9C0052525200C6A5A5009C9C
      9C009C9C9C00C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00D6D6
      D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00C6A5A5000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6D600B5847300EFC68C00B58484000000
      00000000000000000000000000000000000000000000EFBD9400FFF7EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7E700B584
      7300F7C67B00EFAD5A00BD848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C00C6A5
      A5009C9C9C00C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00EFEF
      EF00FFFFFF00CECECE00CECECE009C9C9C00C6A5A50063636300000000000000
      000000000000000000000000000000000000000000000000000000000000DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400B5847300B5848400000000000000
      00000000000000000000000000000000000000000000EFBD9400FFF7EF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7E700B584
      7300E7B57B00BD84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6A5A500C6A5A500636363009C9C9C009C9C9C00636363009C9C9C009C9C
      9C0063636300C6A5A500C6A5A5009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFBD9400DEAD8400DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B584
      7300BD8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6A5A500C6A5A500C6A5A500C6A5A500C6A5A500C6A5
      A500C6A5A5000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000C7FFFFFFFFFFC00003C0000383FFFFFF
      FFFFC00003C0000381FFFF807FFF00000000000080FFFF8003FF000000000000
      C07FFF80001F000000000000E03FFF80001F000000000000F01FFF80000F0000
      00000000F81FFF80000F000000000000FC180F800007000000000000FE000380
      0007000000000000FFC001800007000000000000FFC001800003000000000000
      FF8000800003000000000000FF8000800001000000000000FF80008000000000
      00000000FF8000800000000000000000FF8000800007000000000000FF800080
      0007000000000000FF8001800007000000000000FFC001C03F07000000000000
      FFE003E07E0F000000000000FFF007FFE01F000000000000FFF80FFFF07FC000
      03C00003FFFFFFFFFFFFC00003C00003E00003FF0001FFFFFFFF9FFFE00003FF
      0001FFFFFFFF8FFFE00003FF0001FFFFFFFF8FFFE00003FF0001FFFFFFFF07FF
      E00003FF0001FFFFFFFE03FFE00003FF00018003FFFC01FFE000038000018001
      FFF800FFE000038000018000FFF0007FE0000380000180007FE0003FE0000380
      000180003FC0001FE00003800001C0001F80000FE00003800001E0000F000007
      E00003800001F00007000007E00003800001F80003000007E00003800001FC00
      0180000FE00003800003FE0001C0003FE00003800007FF0001C0003FE0000380
      000FFF800180001FE000038000FFFFC00180001FE000078000FFFFE00100001F
      E0000F8000FFFFF00300001FE0001F8001FFFFFFFF80003FE0003F8003FFFFFF
      FFF000FFFFFFFF8007FFFFFFFFFC07FF00000000000000000000000000000000
      000000000000}
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        Caption = #1058#1072#1073#1083#1080#1094#1072
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 595
        FloatTop = 373
        FloatClientWidth = 58
        FloatClientHeight = 127
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
            Item = btnExpand
            Visible = True
          end
          item
            Item = btnCollapse
            Visible = True
          end
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = edtFrom
            Visible = True
          end
          item
            Item = edtTo
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
            Item = lkpDocType
            UserDefine = [udWidth]
            UserWidth = 193
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
    object btnExpand: TdxBarButton
      Action = actExpand
      Category = 0
    end
    object btnCollapse: TdxBarButton
      Action = actCollapse
      Category = 0
    end
    object lkpDocType: TdxBarLookupCombo
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Category = 0
      Hint = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDD000000000000000D0FFFF0FFFFFFFF0D0F77F0F777777F0D0CCCC0CCCCCC
        CC0D0C77C0C777777C0D0CCCC0CCCCCCCC0D0F77F0F777777F0D0FFFF0FFFFFF
        FF0D0F77F0F777777F0D0FFFF0FFFFFFFF0D000000000000000D0FFFCCCCFFF0
        DDDD0F777777FFF0DDDD0FFFCCCCFFF0DDDD000000000000DDDD}
      ShowCaption = True
      Width = 100
      AllowResizing = False
      KeyField = 'id'
      ListField = 'name'
      ListSource = srDocType
      RowCount = 7
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select '
      '       dc.id,'
      '       ch.payment_code,'
      '       dc.typename,'
      
        '       dc.NAME || CASE WHEN dc.custom_mode_id IS NULL THEN '#39#39' EL' +
        'SE '#39'  ('#39' || cd.g011 || ( SELECT cm.code FROM fdc_dict_lst cm WHE' +
        'RE cm.id = dc.custom_mode_id ) || '#39')'#39' END AS name,'
      '       dc.CUSTOMS_CODE,'
      '       ch.sum_charge, '
      '       ch.sum_confirm,'
      '       ch.sum_no_confirm,'
      '       ch.summa_dept,'
      
        '       CASE WHEN dc.TypeSysName = '#39'CustomDeclTempAdm'#39' AND fdc_pa' +
        'y_type_is_registration( ch.payment_code ) = 0 THEN ch.sum_charge' +
        '     ELSE 0 END AS sum_charge_period'
      
        '      ,CASE WHEN dc.TypeSysName = '#39'CustomDeclTempAdm'#39' AND fdc_pa' +
        'y_type_is_registration( ch.payment_code ) = 0 THEN ch.sum_confir' +
        'm    ELSE 0 END AS sum_confirm_period'
      
        '      ,CASE WHEN dc.TypeSysName = '#39'CustomDeclTempAdm'#39' AND fdc_pa' +
        'y_type_is_registration( ch.payment_code ) = 0 THEN ch.sum_no_con' +
        'firm ELSE 0 END AS sum_no_confirm_period'
      
        '      ,CASE WHEN dc.TypeSysName = '#39'CustomDeclTempAdm'#39' AND fdc_pa' +
        'y_type_is_registration( ch.payment_code ) = 0 THEN ch.summa_dept' +
        '     ELSE 0 END AS summa_dept_period'
      'from fdc_doc_charge_lst        dc,'
      '     fdc_custom_decl           cd,'
      '     ( SELECT decl_id'
      '             ,pay_type_code         AS payment_code'
      '             ,SUM( sum_charge )     AS sum_charge'
      '             ,SUM( sum_confirm )    AS sum_confirm'
      '             ,SUM( sum_no_confirm ) AS sum_no_confirm'
      '             ,SUM( summa_dept )     AS summa_dept'
      '         FROM ('
      '           SELECT h.decl_id'
      '                 ,h.pay_type_code'
      '                 ,h.summa AS sum_charge'
      '                 ,0       AS sum_confirm'
      '                 ,0       AS sum_no_confirm'
      
        '                 ,CASE WHEN n.id IS NOT NULL THEN h.summa ELSE 0' +
        ' END AS summa_dept'
      '             FROM fdc_decl_charge_hist_lst h'
      '                 ,fdc_noticepay_charge_lst nc'
      '                 ,fdc_noticepay_lst        n'
      '             WHERE h.activation_date BETWEEN :bdate AND :edate'
      '               AND h.id = nc.id(+)'
      '               AND nc.noticepay_is_active(+) = '#39'Y'#39
      '               AND nc.noticepay_id = n.id(+)'
      
        '               AND n.activation_date(+) BETWEEN :bdate AND :edat' +
        'e'
      '           UNION ALL'
      '           SELECT h.decl_id'
      '                 ,h.pay_type_code'
      '                 ,h.summa AS sum_charge'
      '                 ,0       AS sum_confirm'
      '                 ,0       AS sum_no_confirm'
      '                 ,0       AS summa_dept'
      '             FROM fdc_decl_charge_hist_lst h'
      '                 ,fdc_tr_lst               tr'
      '             WHERE h.decl_id = tr.id'
      '               AND EXISTS (SELECT 0'
      '                             FROM fdc_event_lst e'
      '                             WHERE e.object_id = tr.id'
      
        '                               AND trunc( e.moment ) BETWEEN :bd' +
        'ate AND :edate )'
      '           UNION ALL'
      '           SELECT pd.decl_id'
      '                 ,pt.code'
      '                 ,0 AS sum_charge'
      
        '                 ,CASE WHEN po.SUMMA IS NOT NULL THEN pd.summa E' +
        'LSE 0 END AS sum_confirm'
      
        '                 ,CASE WHEN po.SUMMA IS NULL     THEN pd.summa E' +
        'LSE 0 END AS sum_no_confirm'
      '                 ,0 AS summa_dept'
      '             FROM fdc_payment_deduction_lst pd'
      '                 ,fdc_dict_lst              pt'
      '                 ,fdc_po_lst                po'
      '             WHERE pd.activation_date BETWEEN :bdate AND :edate'
      '               AND pd.pay_type_id = pt.id'
      '               AND pd.payment_id  = po.id'
      '          )'
      '         GROUP BY decl_id, pay_type_code'
      '       ) ch'
      'WHERE dc.id    = ch.decl_id'
      '  AND cd.id(+) = dc.id'
      '  AND (:objecttypeid = 0 OR dc.object_type_id = :objecttypeid)'
      'ORDER BY 2,3,4')
    OnFilterRecord = dsDataFilterRecord
    ParamData = <
      item
        DataType = ftDate
        Name = 'bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'bdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'edate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'objecttypeid'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'objecttypeid'
        ParamType = ptUnknown
      end>
    object dsDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDataPAYMENT_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      DisplayWidth = 100
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 150
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDataNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 300
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDataCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataSUM_CHARGE: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      DisplayWidth = 70
      FieldName = 'SUM_CHARGE'
    end
    object dsDataSUM_CONFIRM: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 70
      FieldName = 'SUM_CONFIRM'
    end
    object dsDataSUM_NO_CONFIRM: TFloatField
      DisplayLabel = #1053'/'#1055
      DisplayWidth = 70
      FieldName = 'SUM_NO_CONFIRM'
    end
    object dsDataSUMMA_DEPT: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1074#1077#1076'. '#1074' '#1079#1072#1076#1086#1083#1078'.'
      DisplayWidth = 70
      FieldName = 'SUMMA_DEPT'
    end
    object dsDataSUM_CHARGE_PERIOD: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      DisplayWidth = 70
      FieldName = 'SUM_CHARGE_PERIOD'
    end
    object dsDataSUM_CONFIRM_PERIOD: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      DisplayWidth = 70
      FieldName = 'SUM_CONFIRM_PERIOD'
    end
    object dsDataSUM_NO_CONFIRM_PERIOD: TFloatField
      DisplayLabel = #1053'/'#1055
      DisplayWidth = 70
      FieldName = 'SUM_NO_CONFIRM_PERIOD'
    end
    object dsDataSUMMA_DEPT_PERIOD: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1074#1077#1076'. '#1074' '#1079#1072#1076#1086#1083#1078'.'
      DisplayWidth = 60
      FieldName = 'SUMMA_DEPT_PERIOD'
    end
  end
  object dsetPaymentsReal: TOracleDataSet
    SQL.Strings = (
      'SELECT'
      '   po.id'
      '  ,po.name'
      '  ,po.payer_inn || '#39'/'#39' || po.payer_kpp AS payer_text_id'
      '  ,po.typename'
      '  ,po.curr_code'
      '  ,doc_summa'
      '  ,summa'
      'FROM'
      '   fdc_po_credit_lst_all  po,'
      '   fdc_event_lst e,'
      '   fdc_document_lst d'
      'WHERE po.id = e.Object_ID'
      '  AND trunc(e.Moment) between :bdate and :edate'
      '  AND po.summa > 0'
      '  AND e.object_type_id = 35'
      '  AND po.is_active <> '#39'A'#39
      '  AND (po.doc_date2 is not null and doc_no2 is not null)'
      '  and po.id = d.id'
      '  AND (d.typesysname != '#39'PaymentOrderConfirm'#39')'
      'ORDER BY po.DOC_DATE,po.DOC_NUMBER')
    Variables.Data = {
      0300000002000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000040000004E414D4501000000000008000000545950454E41
      4D4501000000000009000000444F435F53554D4D410100000000000900000043
      5552525F434F44450100000000000200000049440100000000000D0000005041
      5945525F544558545F49440100000000000500000053554D4D41010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetPaymentsRealBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 224
    object dsetPaymentsRealID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetPaymentsRealNAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
      DisplayWidth = 300
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetPaymentsRealPAYER_TEXT_ID: TStringField
      DisplayLabel = #1048#1053#1053'/'#1050#1055#1055
      FieldName = 'PAYER_TEXT_ID'
      Size = 23
    end
    object dsetPaymentsRealTYPENAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsetPaymentsRealCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsetPaymentsRealDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DOC_SUMMA'
    end
    object dsetPaymentsRealSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
      FieldName = 'SUMMA'
    end
  end
  object dsetDebts: TOracleDataSet
    SQL.Strings = (
      'select n.name'
      '      ,n.activation_date AS item_date'
      '      ,nc.decl_id'
      '      ,fdc_object_get_name( nc.decl_id ) AS DECL_NO'
      '      ,c.code AS cur_code'
      '      ,sum(nc.summa) summa'
      '      ,sum(nc.summa - nc.payed) rest_summa'
      '      ,nc.decl_id id'
      '  FROM fdc_noticepay_charge_lst nc'
      '      ,fdc_noticepay_lst        n'
      '      ,fdc_nsi_currency_lst     c'
      ' where nc.noticepay_id = n.id'
      '   AND nc.currency_id  = c.id(+)'
      
        '   and n.activation_date between trunc( :bdate ) and trunc( :eda' +
        'te )'
      ' group by n.name'
      '         ,n.activation_date'
      '         ,nc.decl_id'
      '         ,c.code'
      'having sum(nc.summa - nc.payed) <> 0')
    Variables.Data = {
      0300000002000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000008000000080000004355525F434F4445010000000000090000004954
      454D5F44415445010000000000070000004445434C5F49440100000000000700
      00004445434C5F4E4F0100000000000500000053554D4D410100000000000A00
      0000524553545F53554D4D410100000000000200000049440100000000000400
      00004E414D45010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetPaymentsRealBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 320
    object dsetDebtsNAME: TStringField
      DisplayLabel = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetDebtsITEM_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'ITEM_DATE'
    end
    object dsetDebtsDECL_ID: TFloatField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'DECL_ID'
      Required = True
    end
    object dsetDebtsDECL_NO: TStringField
      DisplayLabel = #1044#1086#1082'. '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
      FieldName = 'DECL_NO'
      Size = 1500
    end
    object dsetDebtsCUR_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1074#1072#1083#1102#1090#1099
      FieldName = 'CUR_CODE'
      Size = 3
    end
    object dsetDebtsSUMMA: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SUMMA'
    end
    object dsetDebtsREST_SUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'REST_SUMMA'
    end
    object dsetDebtsID: TFloatField
      FieldName = 'ID'
      Required = True
    end
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    OnFilterRecord = dxMemData1FilterRecord
    Left = 736
    Top = 232
  end
  object dsDebts: TDataSource
    AutoEdit = False
    DataSet = dsetDebts
    Left = 232
    Top = 320
  end
  object dsBudget: TDataSource
    AutoEdit = False
    DataSet = dsetBudget
    Left = 232
    Top = 368
  end
  object DataSource2: TDataSource
    DataSet = dxMemData1
    Left = 608
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = dsetBudget
    Left = 512
    Top = 192
  end
  object dsetBudget: TOracleDataSet
    SQL.Strings = (
      'select *'
      'from ('
      '      select '
      '             reestr_id'
      '            ,'#39#1058#1080#1087': '#39' || typename typename'
      
        '            ,(case when (reestr_id is null and doc_number is nul' +
        'l and doc_date is null) '
      '                   then '#39#1048#1090#1086#1075#1086' '#1087#1086' '#39'||typename||'#39' ('#1087#1086' '#1050#1041#1050'):'#39
      
        '                   else ('#39#1056#1077#1077#1089#1090#1088': '#39' || doc_number || '#39' '#1086#1090' '#39' || t' +
        'o_char(doc_date, '#39'dd.mm.yyyy'#39')) end) doc_number'
      '            ,doc_date'
      '            ,date_send'
      '            ,date_load'
      '            ,uved_id'
      
        '            ,(case when (kbk_code_s is null and kbk_code_t is nu' +
        'll) then '#39#1080#1090#1086#1075#1086':'#39' else kbk_code_s end) kbk_code_s'
      '            ,kbk_code_t'
      '            ,sum(summa) summa'
      '      from ('
      '            select rs.id reestr_id'
      '                  ,rs.typename typename'
      '                  ,rs.doc_number'
      '                  ,rs.doc_date'
      '                  ,rs.date_send'
      
        '                  ,(case when (rs.ext_source != p_params.softcus' +
        'tomscode) then trunc(rs.recieve_date) else null end) date_load'
      '                  ,u.id uved_id'
      '                  ,u.kbk_code_s'
      '                  ,u.kbk_code_t'
      '                  ,summa'
      '            from fdc_reestr_specify_kindpay_lst rs'
      '                ,fdc_rel_reestr_skindpay_lst    rel'
      '                ,fdc_bud_specify_kindpay_lst    u'
      
        '            where (rs.doc_date between trunc( :bdate ) and trunc' +
        '( :edate ))'
      '              and rs.id = rel.object_id(+)'
      '              and rel.rel_object_id = u.id(+)'
      '           )'
      '      group by grouping sets(('
      '               reestr_id'
      '              ,typename'
      '              ,doc_number'
      '              ,doc_date'
      '              ,date_send'
      '              ,date_load'
      '              ,uved_id'
      '              ,kbk_code_s'
      '              ,kbk_code_t)'
      
        '              ,(reestr_id,typename,doc_number,doc_date,date_send' +
        ',date_load)'
      '              ,(typename,kbk_code_s,kbk_code_t)'
      '              ,(typename))'
      '     )'
      'order by typename'
      '        ,(case when (reestr_id is null) then 1 else 0 end)'
      '        ,doc_number'
      '        ,(case when (kbk_code_t is null) then 1 else 0 end)'
      '        ,kbk_code_s'
      '        ,kbk_code_t')
    Variables.Data = {
      0300000002000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      040000000A00000008000000545950454E414D45010000000000050000005355
      4D4D41010000000000090000005245455354525F49440100000000000A000000
      444F435F4E554D42455201000000000008000000444F435F4441544501000000
      000009000000444154455F53454E4401000000000009000000444154455F4C4F
      414401000000000007000000555645445F49440100000000000A0000004B424B
      5F434F44455F530100000000000A0000004B424B5F434F44455F540100000000
      00}
    Cursor = crSQLWait
    ReadOnly = True
    BeforeQuery = dsetPaymentsRealBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 368
    object dsetBudgetREESTR_ID: TFloatField
      FieldName = 'REESTR_ID'
      Required = True
    end
    object dsetBudgetTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1504
    end
    object dsetBudgetDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 122
    end
    object dsetBudgetDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsetBudgetDATE_SEND: TDateTimeField
      FieldName = 'DATE_SEND'
    end
    object dsetBudgetDATE_LOAD: TDateTimeField
      FieldName = 'DATE_LOAD'
    end
    object dsetBudgetUVED_ID: TFloatField
      FieldName = 'UVED_ID'
    end
    object dsetBudgetKBK_CODE_S: TStringField
      FieldName = 'KBK_CODE_S'
      Size = 1500
    end
    object dsetBudgetKBK_CODE_T: TStringField
      FieldName = 'KBK_CODE_T'
      Size = 1500
    end
    object dsetBudgetSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dxMemData2: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 680
    Top = 184
  end
  object dsPaymentsReal: TDataSource
    AutoEdit = False
    DataSet = dsetPaymentsReal
    Left = 232
    Top = 224
  end
  object dsetZachteno: TOracleDataSet
    SQL.Strings = (
      'SELECT SUM( pd.summa ) AS summa'
      '      ,po.curr_code'
      '      ,d.name as name'
      '      ,d.typename as typename'
      
        '      ,( SELECT pt.code FROM fdc_payment_type_lst pt WHERE pt.id' +
        ' = pd.pay_type_id )  AS payment_type'
      '      ,pd.decl_id AS id'
      '  FROM fdc_payment_deduction_lst    pd'
      '      ,fdc_po_credit_lst            po'
      '      ,fdc_object_lst               o'
      '      ,fdc_doc_charge_lst           d'
      '  WHERE pd.activation_date BETWEEN :bdate AND :edate'
      '    AND po.id                    = pd.payment_id'
      '    AND po.SUMMA                 is not null'
      '    AND o.id                     = pd.decl_id'
      '    AND o.TYPESYSNAME            <> '#39'TR'#39
      '    AND d.id                     = pd.decl_id'
      '    AND (   :objecttypeid = 0'
      '         OR o.object_type_id = :objecttypeid'
      '        )'
      
        '  GROUP BY d.name, d.typename, po.curr_code, pd.pay_type_id, pd.' +
        'decl_id/*SELECT SUM( pd.summa ) AS summa'
      '      ,po.curr_code'
      '      ,pd.name'
      
        '      ,( SELECT pt.code FROM fdc_payment_type_lst pt WHERE pt.id' +
        ' = c.pay_type_id )  AS payment_type'
      '      ,c.decl_id AS id'
      '  FROM fdc_payment_deduct_cnfrm_lst c'
      '      ,fdc_payment_deduction_lst    pd'
      '      ,fdc_po_credit_lst            po'
      '      ,fdc_object_lst               o'
      '  WHERE pd.activation_date BETWEEN :bdate AND :edate'
      '    AND c.confirmed_deduction_id = pd.id'
      '    AND po.id                    = c.payment_id'
      '    AND o.id                     = c.decl_id'
      '    AND o.TYPESYSNAME            <> '#39'TR'#39
      '    AND (   :objecttypeid = 0'
      '         OR o.object_type_id = :objecttypeid'
      '        )'
      '  GROUP BY pd.name, po.curr_code, c.pay_type_id, c.decl_id */')
    Variables.Data = {
      0300000003000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C00000000000000000000000D0000003A4F424A45435454
      5950454944040000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000060000000500000053554D4D4101000000000009000000435552525F
      434F4445010000000000040000004E414D450100000000000C0000005041594D
      454E545F54595045010000000000020000004944010000000000080000005459
      50454E414D45010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetZachtenoBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 416
    object dsetZachtenoID: TFloatField
      FieldName = 'ID'
    end
    object dsetZachtenoNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 400
    end
    object dsetZachtenoTYPENAME: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 200
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsetZachtenoCURR_CODE: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsetZachtenoPAYMENT_TYPE: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_TYPE'
      Size = 3
    end
    object dsetZachtenoSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object dsZachteno: TDataSource
    AutoEdit = False
    DataSet = dsetZachteno
    Left = 232
    Top = 416
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
    end
  end
  object dsetPaymentsNonReal: TOracleDataSet
    SQL.Strings = (
      '  SELECT'
      '   po.id'
      '  ,po.name'
      '  ,po.payer_inn || '#39'/'#39' || po.payer_kpp AS payer_text_id'
      '  ,po.typename'
      '  ,po.curr_code'
      '  ,doc_summa'
      '  ,summa '
      'FROM'
      '   fdc_po_credit_lst_all po,'
      '   fdc_document d'
      'WHERE po.id = d.id'
      '  AND trunc( d.activation_date ) between :bdate and :edate'
      '  AND NVL(po.summa,0) = 0'
      'ORDER BY po.DOC_DATE,po.DOC_NUMBER  ')
    Variables.Data = {
      0300000002000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000007000000020000004944010000000000040000004E414D4501000000
      00000D00000050415945525F544558545F494401000000000008000000545950
      454E414D4501000000000009000000435552525F434F44450100000000000900
      0000444F435F53554D4D410100000000000500000053554D4D41010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetPaymentsRealBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 272
    object dsetPaymentsNonRealID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object dsetPaymentsNonRealNAME: TStringField
      DisplayLabel = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'NAME'
      Size = 1500
    end
    object dsetPaymentsNonRealPAYER_TEXT_ID: TStringField
      DisplayLabel = #1048#1053#1053'/'#1050#1055#1055
      FieldName = 'PAYER_TEXT_ID'
      Size = 23
    end
    object dsetPaymentsNonRealTYPENAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsetPaymentsNonRealCURR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsetPaymentsNonRealDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DOC_SUMMA'
      Required = True
    end
    object dsetPaymentsNonRealSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
      FieldName = 'SUMMA'
    end
  end
  object dsPaymentsNonReal: TDataSource
    AutoEdit = False
    DataSet = dsetPaymentsNonReal
    Left = 232
    Top = 272
  end
  object mdDocType: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 881
    Top = 108
    object mdDocTypeid: TFloatField
      FieldName = 'id'
    end
    object mdDocTypename: TStringField
      FieldName = 'name'
      Size = 1500
    end
  end
  object srDocType: TDataSource
    DataSet = mdDocType
    Left = 865
    Top = 124
  end
  object dsDocType: TOracleDataSet
    SQL.Strings = (
      'select           id,name from ('
      'select           t.id'
      '                   ,t.name'
      '  from           fdc_object_type_lst t,'
      '                    fdc_object_type_lst p'
      'where          t.parent_object_type_id = p.id'
      '    and          p.sysname = '#39'DeductionDocument'#39
      'union all'
      'select          0 id'
      '                  ,'#39#1042#1089#1077' '#1090#1080#1087#1099#39
      ' from          dual'
      ') order by id')
    Session = MainData.Session
    Left = 849
    Top = 140
    object dsDocTypeid: TFloatField
      FieldName = 'id'
    end
    object dsDocTypename: TStringField
      FieldName = 'name'
      Size = 1500
    end
  end
  object dsetSendBudget: TOracleDataSet
    SQL.Strings = (
      'select NULL CUSTOMS_CODE '
      '       ,1 AS A'
      '       ,payment_code'
      '       ,B'
      '       ,DOC_TYPE'
      '       ,C'
      '       ,DOC_NAME'
      '       ,D'
      '       ,PERECHISLENO '
      ' from ( SELECT rsdl.payment_code'
      '              ,GROUPING (rsdl.payment_code) AS B'
      '              ,doc.TypeName AS DOC_TYPE'
      '              ,GROUPING (doc.TypeName) AS C'
      
        '              ,nvl(dch.decl_no,doc.doc_number)||'#39' '#39'||rsdl.direct' +
        'ion||'#39' '#39'||dch.custom_mode_code AS DOC_NAME'
      
        '              ,GROUPING (nvl(dch.decl_no,doc.doc_number)||'#39' '#39'||r' +
        'sdl.direction||'#39' '#39'||dch.custom_mode_code) AS D'
      '              ,SUM ( rsdl.summa ) AS PERECHISLENO'
      '         FROM fdc_doc_pack_transfer_lst dpt'
      '              JOIN fdc_state_lst s ON ( s.id = dpt.state_id )'
      '                AND dpt.send_date IS NOT NULL'
      
        '                AND TRUNC(dpt.send_date) BETWEEN :bdate AND :eda' +
        'te'
      
        '                AND s.SYSNAME = '#39'State.DocPackTransferOUT.Sended' +
        #39
      
        '              JOIN fdc_rel_pack_docs_lst r ON ( r.object_id = dp' +
        't.id )'
      
        '                AND ( r.robjtypesysname IN ( '#39'ReestrNoticeSpecif' +
        'yKindPayCorr'#39
      
        '                                            ,'#39'ReestrNoticeSpecif' +
        'yKindPay'#39
      
        '                                            ,'#39'ReestrConfirmSpeci' +
        'fyKindPay'#39' )'
      '                    )'
      
        '              JOIN fdc_reestr_skindpay_deduct_lst rsdl ON ( rsdl' +
        '.reestr_id = r.rel_object_id )'
      
        '              JOIN fdc_document_lst doc ON ( doc.id=rsdl.decl_id' +
        ' )'
      
        '              LEFT OUTER JOIN fdc_doc_charge_lst dch ON (doc.id=' +
        'dch.id)'
      
        '         GROUP BY GROUPING SETS ( ( rsdl.payment_code, doc.TypeN' +
        'ame, nvl(dch.decl_no,doc.doc_number)||'#39' '#39'||rsdl.direction||'#39' '#39'||' +
        'dch.custom_mode_code )'
      '                                 ,rsdl.payment_code'
      '                                )'
      '      ) qr'
      'UNION ALL'
      'SELECT nvl(dch.CUSTOMS_CODE,p_params.CustomCode) CUSTOMS_CODE'
      '      ,GROUPING (nvl(dch.CUSTOMS_CODE,p_params.CustomCode)) AS A'
      '      ,rsdl.payment_code'
      '      ,GROUPING (rsdl.payment_code) AS B'
      '      ,doc.TypeName AS DOC_TYPE'
      '      ,GROUPING (doc.TypeName) AS C'
      
        '      ,nvl(dch.decl_no,doc.doc_number)||'#39' '#39'||rsdl.direction||'#39' '#39 +
        '||dch.custom_mode_code AS DOC_NAME'
      
        '      ,GROUPING (nvl(dch.decl_no,doc.doc_number)||'#39' '#39'||rsdl.dire' +
        'ction||'#39' '#39'||dch.custom_mode_code) AS D'
      '      ,SUM ( rsdl.summa ) AS PERECHISLENO'
      ' FROM fdc_doc_pack_transfer_lst dpt'
      '      JOIN fdc_state_lst s ON ( s.id = dpt.state_id )'
      '        AND dpt.send_date IS NOT NULL'
      '        AND TRUNC(dpt.send_date) BETWEEN :bdate AND :edate'
      '        AND s.SYSNAME = '#39'State.DocPackTransferOUT.Sended'#39
      '      JOIN fdc_rel_pack_docs_lst r ON ( r.object_id = dpt.id)'
      
        '        AND ( r.robjtypesysname IN ( '#39'ReestrNoticeSpecifyKindPay' +
        'Corr'#39
      
        '                                    ,'#39'ReestrNoticeSpecifyKindPay' +
        #39
      
        '                                    ,'#39'ReestrConfirmSpecifyKindPa' +
        'y'#39' )'
      '            )'
      
        '      JOIN fdc_reestr_skindpay_deduct_lst rsdl ON ( rsdl.reestr_' +
        'id = r.rel_object_id )'
      '      JOIN fdc_document_lst doc ON ( doc.id=rsdl.decl_id )'
      '      LEFT OUTER JOIN fdc_doc_charge_lst dch ON (doc.id=dch.id)'
      ' GROUP BY ROLLUP ( nvl(dch.CUSTOMS_CODE,p_params.CustomCode)'
      
        '                  ,(  doc.TypeName, nvl(dch.decl_no,doc.doc_numb' +
        'er)||'#39' '#39'||rsdl.direction||'#39' '#39'||dch.custom_mode_code )'
      '                  ,rsdl.payment_code'
      '                 ) '
      'order by A, C, D, B'
      ''
      ''
      '/*'
      'SELECT'
      'dch.CUSTOMS_CODE '
      ',GROUPING (dch.CUSTOMS_CODE) AS A'
      ', rsdl.payment_code'
      ',GROUPING (rsdl.payment_code) AS B'
      ',dch.TypeName AS DOC_TYPE'
      ',GROUPING (dch.TypeName) AS C'
      
        ', dch.decl_no||'#39' '#39'||rsdl.direction||'#39' '#39'||dch.custom_mode_code AS' +
        ' DOC_NAME'
      
        ',GROUPING (dch.decl_no||'#39' '#39'||rsdl.direction||'#39' '#39'||dch.custom_mod' +
        'e_code) AS D'
      '--, dch.name'
      '--,dch.decl_no'
      '--,rsdl.direction'
      '--,dch.custom_mode_code'
      '--,dch.custom_mode_name'
      '--, P_PARAMS.CustomCode AS KOD_TO'
      ',SUM ( rsdl.summa ) AS PERECHISLENO'
      '--,rsdl.*'
      '--,r.rel_object_id'
      '--, r.*'
      '--,dpt.*'
      '--, s.*'
      ' from fdc_doc_pack_transfer_lst dpt'
      '   JOIN fdc_state_lst       s'
      '   ON ( s.id = dpt.state_id )   '
      '   AND dpt.send_date IS NOT NULL'
      '   AND TRUNC(dpt.send_date) BETWEEN :bdate AND :edate'
      '   AND s.SYSNAME = '#39'State.DocPackTransferOUT.Sended'#39
      '   JOIN fdc_rel_pack_docs_lst r'
      '   ON ( r.object_id = dpt.id)'
      '   AND ( r.robjtypesysname IN ( '#39'ReestrNoticeSpecifyKindPayCorr'#39
      '   ,'#39'ReestrNoticeSpecifyKindPay'#39
      '   ,'#39'ReestrConfirmSpecifyKindPay'#39' ) )'
      '   JOIN fdc_reestr_skindpay_deduct_lst rsdl'
      '    ON ( rsdl.reestr_id = r.rel_object_id)'
      '    JOIN fdc_doc_charge_lst dch'
      '    ON ( dch.id=rsdl.decl_id)'
      ' GROUP BY GROUPING SETS ('
      ' ROLLUP (rsdl.payment_code'
      ' , ( dch.TypeName'
      
        ' ,dch.decl_no||'#39' '#39'||rsdl.direction||'#39' '#39'||dch.custom_mode_code ) ' +
        '),'
      ' ROLLUP (dch.CUSTOMS_CODE'
      ' , (  dch.TypeName'
      ' ,dch.decl_no||'#39' '#39'||rsdl.direction||'#39' '#39'||dch.custom_mode_code )'
      ' ,rsdl.payment_code ) '
      ' )   '
      'order by A, C, D, B'
      '*/')
    Variables.Data = {
      0300000002000000060000003A42444154450C00000000000000000000000600
      00003A45444154450C0000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000090000000C000000435553544F4D535F434F44450100000000000100
      0000410100000000000C0000005041594D454E545F434F444501000000000001
      0000004201000000000008000000444F435F5459504501000000000001000000
      4301000000000008000000444F435F4E414D4501000000000001000000440100
      000000000C00000050455245434849534C454E4F010000000000}
    Cursor = crSQLWait
    BeforeQuery = dsetPaymentsRealBeforeQuery
    Session = MainData.Session
    Left = 128
    Top = 464
    object dsetSendBudgetCUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsetSendBudgetA: TFloatField
      FieldName = 'A'
    end
    object dsetSendBudgetPAYMENT_CODE: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsetSendBudgetB: TFloatField
      FieldName = 'B'
    end
    object dsetSendBudgetDOC_TYPE: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'DOC_TYPE'
      Size = 1500
    end
    object dsetSendBudgetC: TFloatField
      FieldName = 'C'
    end
    object dsetSendBudgetDOC_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'DOC_NAME'
      Size = 1514
    end
    object dsetSendBudgetD: TFloatField
      FieldName = 'D'
    end
    object dsetSendBudgetPERECHISLENO: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'PERECHISLENO'
      DisplayFormat = ',0.00'
    end
  end
  object dsSendBudget: TDataSource
    AutoEdit = False
    DataSet = dsetSendBudget
    Left = 232
    Top = 464
  end
end
