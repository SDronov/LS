inherited srDayTotalGridForm: TsrDayTotalGridForm
  Left = 240
  Top = 188
  Width = 943
  Height = 584
  Caption = #1048#1090#1086#1075#1080' '#1076#1085#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 529
    Width = 935
    inherited StatusBarContainer0: TdxStatusBarContainerControl
      Width = 102
      inherited lblRecordCount: TcxLabel
        Width = 102
      end
    end
    inherited StatusBarContainer1: TdxStatusBarContainerControl
      Left = 105
      Width = 102
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 210
      Width = 629
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 629
      end
      inherited pnlProgress: TPanel
        Width = 629
        inherited lblProgress: TcxLabel
          Width = 629
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 842
      Width = 77
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 526
    Width = 935
  end
  inherited pnlWorkspace: TPanel
    Width = 935
    Height = 498
    inherited splSearchCriteria: TSplitter
      Left = 80
      Width = 9
      Height = 498
    end
    inherited pnlSearchCriteria: TPanel
      Width = 80
      Height = 498
      inherited lcSearchCriteria: TdxLayoutControl
        Width = 80
        Height = 478
        inherited btnSearch: TcxButton
          Top = 429
        end
      end
      inherited pnlSearchCriteriaCaption: TPanel
        Width = 80
      end
    end
    inherited pnlGrid: TPanel
      Left = 89
      Width = 846
      Height = 498
      inherited grdData: TcxGrid
        Top = 27
        Width = 846
        Height = 471
        object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView [2]
          PopupMenu = pmnGridDataDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource2
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1REST_SUMMA
            end
            item
              Format = ',0.00'
              Column = cxGrid1DBBandedTableView1REST_SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column1
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column2
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column3
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column4
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column5
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column6
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column7
            end
            item
              Format = ',0.00'
              Column = cxGrid1DBBandedTableView1Column8
            end
            item
              Format = ',0.00'
              Column = cxGrid1DBBandedTableView1Column9
            end
            item
              Format = ',0.00'
              Column = cxGrid1DBBandedTableView1Column10
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column8
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column9
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView1Column10
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1REST_SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column1
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column2
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column3
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column4
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column5
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column6
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column7
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column8
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column9
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView1Column10
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.BandMoving = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.Indicator = True
          OptionsView.FixedBandSeparatorWidth = 1
          Bands = <
            item
              Width = 320
            end
            item
              Caption = #1057#1091#1084#1084#1072' ('#1056#1091#1073#1083#1100')'
              Width = 318
            end
            item
              Caption = #1057#1091#1084#1084#1072' ('#1044#1086#1083#1083#1072#1088')'
              Width = 214
            end
            item
              Caption = #1057#1091#1084#1084#1072' ('#1045#1074#1088#1086')'
              Width = 190
            end
            item
              Caption = #1074' '#1090#1086#1084' '#1095#1080#1089#1083#1077' "'#1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080'"'
              Width = 316
            end>
          object cxGrid1DBBandedTableView1NAME: TcxGridDBBandedColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'NAME'
            Width = 176
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1CUR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUR_CODE'
            Visible = False
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1PAY_TYPE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAY_TYPE'
            Visible = False
            GroupIndex = 0
            SortIndex = 0
            SortOrder = soAscending
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1SUMMA: TcxGridDBBandedColumn
            Caption = #1053#1072#1095'.'
            DataBinding.FieldName = 'S643'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Width = 117
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1REST_SUMMA: TcxGridDBBandedColumn
            Caption = #1053'/'#1055
            DataBinding.FieldName = 'E643'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Width = 87
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn
            Caption = #1053#1072#1095'.'
            DataBinding.FieldName = 'S840'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Visible = False
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn
            Caption = #1074' '#1088#1091#1073#1083'.'
            DataBinding.FieldName = 'PC840'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column3: TcxGridDBBandedColumn
            Caption = #1053#1072#1095'.'
            DataBinding.FieldName = 'S978'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Visible = False
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column4: TcxGridDBBandedColumn
            Caption = #1074' '#1088#1091#1073#1083'.'
            DataBinding.FieldName = 'PC978'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 3
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column5: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1095'.'
            DataBinding.FieldName = 'P643'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Width = 101
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column6: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1095'.'
            DataBinding.FieldName = 'P840'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column7: TcxGridDBBandedColumn
            Caption = #1054#1087#1083#1072#1095'.'
            DataBinding.FieldName = 'P978'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 3
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column8: TcxGridDBBandedColumn
            Caption = #1056#1091#1073#1083#1100
            DataBinding.FieldName = 'MS643'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column9: TcxGridDBBandedColumn
            Caption = #1044#1086#1083#1083#1072#1088
            DataBinding.FieldName = 'MS840'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column10: TcxGridDBBandedColumn
            Caption = #1045#1074#1088#1086
            DataBinding.FieldName = 'MS978'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Post: TcxGridDBBandedColumn
            Caption = #1055#1086#1089#1090
            DataBinding.FieldName = 'CUSTOMS_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1TYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'TYPENAME'
            Width = 129
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object cxGrid1DBBandedTableView2: TcxGridDBBandedTableView [3]
          PopupMenu = pmnGridDataDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource3
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView2SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBBandedTableView2REST_SUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView2SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView2REST_SUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object cxGrid1DBBandedTableView2ITEM_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'ITEM_DATE'
            Visible = False
            GroupIndex = 0
            SortIndex = 0
            SortOrder = soAscending
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView2DECL_ID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView2DECL_NO: TcxGridDBBandedColumn
            Caption = #1043#1058#1044
            DataBinding.FieldName = 'DECL_NO'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView2CUR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CUR_CODE'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView2SUMMA: TcxGridDBBandedColumn
            Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1086
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView2REST_SUMMA: TcxGridDBBandedColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082
            DataBinding.FieldName = 'REST_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 148
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
        object cxGrid1DBBandedTableView3: TcxGridDBBandedTableView [4]
          PopupMenu = pmnGridDataDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource5
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = cxGrid1DBBandedTableView3S643
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Bands = <
            item
              Width = 842
            end>
          object cxGrid1DBBandedTableView3NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'NAME'
            Width = 222
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3TYPENAME: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'TYPENAME'
            Width = 144
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3DOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 108
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3CURR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Width = 45
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3S643: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1074' '#1088#1091#1073#1083#1103#1093
            DataBinding.FieldName = 'S643'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 107
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3Column1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Visible = False
            Hidden = True
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView3INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053'/'#1050#1055#1055
            DataBinding.FieldName = 'payer_text_id'
            Width = 216
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView1: TcxGridDBBandedTableView [5]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource4
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableView1Column2
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView1Column2
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView1Column3
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView1Column4
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.BandHeaders = False
          Bands = <
            item
            end>
          object grdDataDBBandedTableView1Column1: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'DOC_DATE'
            Width = 117
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1Column2: TcxGridDBBandedColumn
            Caption = #1056#1091#1073#1083#1080
            DataBinding.FieldName = 'S643'
            Width = 116
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1Column3: TcxGridDBBandedColumn
            Caption = #1044#1086#1083#1083#1072#1088
            DataBinding.FieldName = 'S840'
            Width = 98
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView1Column4: TcxGridDBBandedColumn
            Caption = #1045#1074#1088#1086
            DataBinding.FieldName = 'S978'
            Width = 117
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView2: TcxGridDBBandedTableView [6]
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
          object grdDataDBBandedTableView2Column1: TcxGridDBBandedColumn
            Caption = #1084#1092#1099#1092
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView2Column2: TcxGridDBBandedColumn
            Caption = #1084#1092#1099#1092
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object grdDataDBBandedTableView3: TcxGridDBBandedTableView [7]
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcOra5
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Position = spFooter
              Column = grdDataDBBandedTableView3SUMMA
            end
            item
              Format = ',0.00'
              Kind = skSum
              Column = grdDataDBBandedTableView3SUMMA
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              FieldName = 'SUMMA'
              Column = grdDataDBBandedTableView3SUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Bands = <
            item
              Width = 674
            end>
          object grdDataDBBandedTableView3RecId: TcxGridDBBandedColumn
            DataBinding.FieldName = 'RecId'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3NAME: TcxGridDBBandedColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3PAYMENT_TYPE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PAYMENT_TYPE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3SUMMA: TcxGridDBBandedColumn
            DataBinding.FieldName = 'SUMMA'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3CURR_CODE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableView3Column1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
        end
        inherited grdDataLevel: TcxGridLevel
          GridView = cxGrid1DBBandedTableView1
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
          #1047#1072#1095#1090#1077#1085#1086)
        OnChange = cxTabControl1Change
        OnDrawTabEx = cxTabControl1DrawTabEx
        ClientRectBottom = 23
        ClientRectLeft = 2
        ClientRectRight = 842
        ClientRectTop = 22
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
      00000000000000000000000000000000000000000000B5B5B500726F7E00BA93
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000749BBC00315FB7006A63
      8E00BA939C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60031B5DE0021AD
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008FCCFF0036A0FE003360
      B7006A638E00BA939C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6009CDEEF0084EF
      FF004AC6E70021ADD60018A5C60018A5C60018A5C60000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400000000000000000000000000000000000000000000000000E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400000000000000000000000000000000000000000082C4FF0039A4
      FE003360B7006A638E00BA939C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE7009CFF
      FF0094FFFF0073DEF70073DEF70073DEF70073DEF7004AC6E70021ADD60018A5
      C600000000000000000000000000000000000000000000000000E3A89400F3F3
      F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2E100DEDEDD00DAD9D800D5D4
      D300D0CFCE00E3A8940000000000000000000000000000000000E3A89400F3F3
      F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2E100DEDEDD00DAD9D800D5D4
      D300D0CFCE00E3A89400000000000000000000000000000000000000000082C4
      FF003AA4FE003264BC006A638E00CEB7BE000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD60052BDE700ADFF
      FF008CF7FF008CEFFF008CEFFF008CEFFF0073DEF70073DEF70073DEF7004AC6
      EF0021ADD6000000000000000000000000000000000000000000E3A89400F6F6
      F500F3F3F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2E100DEDEDD00DAD9
      D800D5D4D300E3A8940000000000000000000000000000000000E3A89400F6F6
      F500F3F3F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2E100DEDEDD00DAD9
      D800D5D4D300E3A8940000000000000000000000000000000000000000000000
      000080C3FF003AA4FE003D73C20097999E00C9A59B00BD876F00BB816800BC83
      6A00C4907A00CAA2980000000000000000000000000029ADD60029ADD600ADDE
      EF0094F7FF0094F7FF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DE
      F7004AC6EF000000000000000000000000000000000000000000E3A89400F8F8
      F700F6F6F500F3F3F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2E100DEDE
      DD00DAD9D800E3A8940000000000000000000000000000000000E3A89400F8F8
      F700F6F6F500F3F3F300F1F1F0000000000000000000E6E6E600E3E2E100DEDE
      DD00DAD9D800E3A8940000000000000000000000000000000000000000000000
      0000000000009BD0FF00BCC3C900A6776800CB967600E7CA9A00F8F0BD00F8F2
      C700E7D1AB00CEA38A00C2958500000000000000000029ADD60073DEF70029AD
      D6009CFFFF008CF7FF008CF7FF008CF7FF008CEFFF008CEFFF008CEFFF0073DE
      F70073DEF70018A5C60000000000000000000000000000000000E3A89400FAFA
      F900F8F8F700F6F6F500F3F3F300F1F1F000EDEDED00EAEAEA00E6E6E600E3E2
      E100DEDEDD00E3A8940000000000000000000000000000000000E3A89400FAFA
      F900F8F8F700F6F6F500F3F3F3000000000000000000EAEAEA00E6E6E600E3E2
      E100DEDEDD00E3A8940000000000000000000000000000000000000000000000
      00000000000000000000D2AEA500CC937400FFF2B400FFF3B200FFFFCE00FFFF
      E200FFFFF600FFFFFF00CEA38900C19990000000000029ADD60094F7FF0029AD
      D600ADDEEF00A5EFF700A5EFF700A5F7FF008CEFFF008CEFFF008CEFFF0073DE
      F7000073080018A5C60000000000000000000000000000000000E3A89400FBFB
      FB00FAFAF900000000000000000000000000000000000000000000000000E6E6
      E600E3E2E100E3A8940000000000000000000000000000000000E3A89400FBFB
      FB00FAFAF900000000000000000000000000000000000000000000000000E6E6
      E600E3E2E100E3A8940000000000000000000000000000000000000000000000
      00000000000000000000C6907900E7C69500FFDD9F00FFF7B600FFFFD100FFFF
      E600FFFFFA00FFFFF300E7D1AB00BB8972000000000029ADD6009CFFFF0073DE
      F70029ADD60018A5C60018A5C60018A5C600ADDEEF008CF7FF0084EFFF000073
      08005AE78C000073080018A5C600000000000000000000000000E3A89400FCFC
      FC00FBFBFB00000000000000000000000000000000000000000000000000EAEA
      EA00E6E6E600E3A8940000000000000000000000000000000000E3A89400FCFC
      FC00FBFBFB00000000000000000000000000000000000000000000000000EAEA
      EA00E6E6E600E3A8940000000000000000000000000000000000000000000000
      00000000000000000000BD826900F8EAB400FFD09200FFEEAD00FFFFCA00FFFF
      DC00FFFFE500FFFFDD00F8F2C400BA8168000000000029ADD6009CFFFF0094F7
      FF0073DEF70073DEF70073DEF7006BDEF70029ADD600ADDEEF000073080052D6
      7B0042D66B0031C64A0000730800000000000000000000000000E3A89400FDFD
      FD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6F500F3F3F300F1F1F000EDED
      ED00EAEAEA00E3A8940000000000000000000000000000000000E3A89400FDFD
      FD00FCFCFC00FBFBFB00FAFAF9000000000000000000F3F3F300F1F1F000EDED
      ED00EAEAEA00E3A8940000000000000000000000000000000000000000000000
      00000000000000000000BD826900F8EAB400FFE0AA00FFEFB000FFFFBF00FFFF
      C700FFFFCA00FFFFC900F8EFBA00BA8167000000000029ADD6009CFFFF0094F7
      FF0094F7FF0094F7FF0094F7FF0073DEF70073DEF70029ADD60018A5C600108C
      210031C64A00109C210018A5C600000000000000000000000000E3A89400FEFE
      FE00FDFDFD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6F500F3F3F300F1F1
      F000EDEDED00E3A8940000000000000000000000000000000000E3A89400FEFE
      FE00FDFDFD00FCFCFC00FBFBFB000000000000000000F6F6F500F3F3F300F1F1
      F000EDEDED00E3A8940000000000000000000000000000000000000000000000
      00000000000000000000C6937D00E7CCA300FFEED000FFD8A600FFEAAB00FFED
      AD00FFF2B200FFF0B000E7C99700BB876F000000000029ADD600C6FFFF0094FF
      FF009CFFFF00D6FFFF00D6FFFF008CEFFF0094EFFF0073DEF70073DEF7000884
      100018AD29000884100000000000000000000000000000000000E3A89400FEFE
      FE00FEFEFE00FDFDFD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6F500F3F3
      F300F1F1F000E3A8940000000000000000000000000000000000E3A89400FEFE
      FE00FEFEFE00FDFDFD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6F500F3F3
      F300F1F1F000E3A8940000000000000000000000000000000000000000000000
      00000000000000000000D7B6AD00CB9C8000FFFFFF00FFF7E900FFEDB800FFCF
      9100FFDEA000FFF2B600CA927100CAA89F000000000021ADD6009CDEEF00C6FF
      FF00C6FFFF009CDEEF0018ADD60018A5C60018A5C60018A5C60018A5C600088C
      100008A518000000000000000000000000000000000000000000E3A89400FFFF
      FF00FEFEFE00FEFEFE00FDFDFD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6
      F500F3F3F300E3A8940000000000000000000000000000000000E3A89400FFFF
      FF00FEFEFE00FEFEFE00FDFDFD00FCFCFC00FBFBFB00FAFAF900F8F8F700F6F6
      F500F3F3F300E3A8940000000000000000000000000000000000000000000000
      0000000000000000000000000000C79B8B00CA9A8300E7CCAD00F8EDBD00F8E7
      B100E7C99900CA907100BF90810000000000000000000000000031B5DE0029AD
      D60018A5C60018A5C60000000000000000000000000000000000088C100008A5
      180008841000000000000000000000000000000000000000000000000000E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400000000000000000000000000000000000000000000000000E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A894000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B7AE00BE8B7600BB826800BD83
      6900C48F7B00D4B3AA0000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000008D8D8F006B67
      7100C1989F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000097989A00455B76004254
      9A007A688A00BF94980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A894000000000000000000000000007F9BAF00319AFF00256C
      D5004052980079688A00BD909700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5D60021A5D60021A5
      D6005AC6E70042BDE70029ADD60021A5D60018A5D60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3A89400E3A89400F3F3F300F3F3
      F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6
      E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9D800D5D4D300D5D4
      D300D0CFCE00D0CFCE00E3A89400E3A89400E3A89400E3A89400F3F3F300F3F3
      F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6
      E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9D800D5D4D300D5D4
      D300D0CFCE00D0CFCE00E3A89400E3A894000000000096CDFF0046AFFF003099
      FE00266BD5004152970079678A00C0969A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018A5D600ADDEF700B5FF
      FF009CFFFF0094F7FF008CEFFF007BE7F7006BD6F70052C6E70042B5DE0029AD
      D60021A5D60018A5D60000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3A89400E3A89400F3F3F300F3F3
      F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6
      E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9D800D5D4D300D5D4
      D300D0CFCE00D0CFCE00E3A89400E3A89400E3A89400E3A89400F3F3F300F3F3
      F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6
      E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9D800D5D4D300D5D4
      D300D0CFCE00D0CFCE00E3A89400E3A89400000000000000000094C9FF0045B0
      FF00319AFF00256BD4003F52990079678900C1969C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000010A5D60063BDE700CEFF
      FF008CF7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CEF
      FF0073DEF7005ACEEF004AC6E70031B5DE0021A5D60018A5D60018A5D6000000
      000000000000000000000000000000000000E3A89400E3A89400F6F6F500F6F6
      F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9
      D800D5D4D300D5D4D300E3A89400E3A89400E3A89400E3A89400F6F6F500F6F6
      F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9
      D800D5D4D300D5D4D300E3A89400E3A8940000000000000000000000000090C8
      FF0045B0FF003099FE00256BD4003F5298007B678800C1999D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5D60042B5DE00BDEF
      F7009CFFFF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CF7
      FF0094F7FF0094F7FF008CEFFF008CEFFF0084E7FF0063D6EF0031ADDE000000
      000000000000000000000000000000000000E3A89400E3A89400F6F6F500F6F6
      F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9
      D800D5D4D300D5D4D300E3A89400E3A89400E3A89400E3A89400F6F6F500F6F6
      F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDEDED00EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDEDD00DAD9D800DAD9
      D800D5D4D300D5D4D300E3A89400E3A894000000000000000000000000000000
      000094CAFF0044AEFF00319AFF00256AD3003F53980079668900C59FA5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6005AC6E70094D6
      EF00B5FFFF008CF7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0084E7FF005ACEEF0021A5
      D60000000000000000000000000000000000E3A89400E3A89400F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDE
      DD00DAD9D800DAD9D800E3A89400E3A89400E3A89400E3A89400F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000000000000000
      00000000000000000000E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDE
      DD00DAD9D800DAD9D800E3A89400E3A894000000000000000000000000000000
      00000000000096CBFF0043AEFF003099FE00246AD4003A529A008A7F94000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029ADD6007BE7F70063C6
      E700C6F7FF008CF7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF007BE7F70073DEF70039BD
      DE0000000000000000000000000000000000E3A89400E3A89400F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDE
      DD00DAD9D800DAD9D800E3A89400E3A89400E3A89400E3A89400F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000000000000000
      00000000000000000000E6E6E600E6E6E600E3E2E100E3E2E100DEDEDD00DEDE
      DD00DAD9D800DAD9D800E3A89400E3A894000000000000000000000000000000
      0000000000000000000096CBFF003EAAFF00339AFF003F73BB00757A83000000
      000000000000B88E8600AB796900AF847300B7918000C29D8A00C1988A00C4A0
      9A00000000000000000000000000000000000000000029ADD60094EFF70052CE
      E700BDE7F7009CFFFF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DEFF0063D6
      EF0018A5D600000000000000000000000000E3A89400E3A89400FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2
      E100DEDEDD00DEDEDD00E3A89400E3A89400E3A89400E3A89400FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300000000000000
      00000000000000000000EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2
      E100DEDEDD00DEDEDD00E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000009BCEFF0082C0F300B1BDC4008A817F009571
      6D00BD877500D7AF8B00EFE0A900F8F6BF00FEFECC00F8F6C900EFE7C000D7C1
      A600BA938900C2A2A00000000000000000000000000029ADD6009CEFFF0063DE
      EF008CCEEF00BDFFFF008CF7FF0094F7FF0094F7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF70073DEF7008CEF
      FF0029ADD600000000000000000000000000E3A89400E3A89400FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2
      E100DEDEDD00DEDEDD00E3A89400E3A89400E3A89400E3A89400FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300000000000000
      00000000000000000000EAEAEA00EAEAEA00E6E6E600E6E6E600E3E2E100E3E2
      E100DEDEDD00DEDEDD00E3A89400E3A894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A7807E00C083
      6F00F0CF9D00FFF8BA00FFFEC000FFFFC400FFFFCE00FFFFD500FFFFD900FFFF
      F000F0E9E200BC9A8F00BE9F9F00000000000000000029ADD60094EFF7008CF7
      FF004ABDDE00CEF7FF00A5FFFF0094F7FF008CF7FF008CF7FF008CF7FF008CEF
      FF008CEFFF008CEFFF008CEFFF008CEFFF008CEFFF0073DEF700087B10001084
      18004AC6E700000000000000000000000000E3A89400E3A89400FBFBFB00FBFB
      FB00FAFAF900FAFAF90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600E6E6
      E600E3E2E100E3E2E100E3A89400E3A89400E3A89400E3A89400FBFBFB00FBFB
      FB00FAFAF900FAFAF90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600E6E6
      E600E3E2E100E3E2E100E3A89400E3A894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0867500F0CB
      9900FFF4B800FFEDAC00FFFAB700FFFFCA00FFFFD800FFFFE300FFFFEF00FFFF
      FF00FFFFFF00F0E9DA00A87D7500000000000000000029ADD60094EFF7009CFF
      FF005AD6EF0063BDE700BDE7F700BDEFF700C6F7FF00C6F7FF00BDFFFF009CF7
      FF0084EFFF008CEFFF008CEFFF008CEFFF008CEFFF000873080039BD63004AD6
      7B001084180018A5D6000000000000000000E3A89400E3A89400FBFBFB00FBFB
      FB00FAFAF900FAFAF90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600E6E6
      E600E3E2E100E3E2E100E3A89400E3A89400E3A89400E3A89400FBFBFB00FBFB
      FB00FAFAF900FAFAF90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E6E6E600E6E6
      E600E3E2E100E3E2E100E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000C4A09A00D7AA8A00FFF3
      B500FFE2A300FFE6A600FFFCBC00FFFFCC00FFFFD900FFFFEA00FFFFFB00FFFF
      FE00FFFFF800FFFFDC00D7C2A300A47D7E000000000029ADD6009CEFFF0094FF
      FF0094F7FF0063D6EF0052CEE7005AC6E70063C6E70063C6E70073C6E700BDE7
      F700B5F7FF0084EFFF008CEFFF008CEFFF00006B000031AD52005AE78C005AE7
      8C0039BD5A00087310000000000000000000E3A89400E3A89400FCFCFC00FCFC
      FC00FBFBFB00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3A89400E3A89400E3A89400E3A89400FCFCFC00FCFC
      FC00FBFBFB00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000C5948700EDD5A400FFEE
      B200FFD59700FFE6A600FFFCBB00FFFFCB00FFFFDA00FFFFEA00FFFFF400FFFF
      F300FFFFE700FFFFCF00EFE7BA009A6E67000000000029ADD6009CEFFF0094FF
      FF0094F7FF009CFFFF0094FFFF0094F7FF008CEFFF0084EFFF0063D6EF0042B5
      DE00ADDEF700C6F7FF0094F7FF000873080029AD4A005AEF940052DE84004AD6
      6B0021AD310021AD39000873080000000000E3A89400E3A89400FCFCFC00FCFC
      FC00FBFBFB00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3A89400E3A89400E3A89400E3A89400FCFCFC00FCFC
      FC00FBFBFB00FBFBFB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EAEAEA00EAEA
      EA00E6E6E600E6E6E600E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000BF8F8400F8F2B500FFE6
      A700FFCE9000FFDE9F00FFFAB700FFFFC900FFFFD500FFFFE100FFFFE600FFFF
      E500FFFFDE00FFFFCC00F7F3BF00A88073000000000029ADD6009CEFFF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF007BE7
      F70042BDE7007BCEE7000873080021AD310031AD520039BD5A0042CE6B0039C6
      5A0029BD4A0021AD310021AD310000730800E3A89400E3A89400FDFDFD00FDFD
      FD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E3A89400E3A89400E3A89400E3A89400FDFDFD00FDFD
      FD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFAF900000000000000
      00000000000000000000F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000BB8E8300FEFCBB00FFE0
      9E00FFCA8C00FFE1A000FFF4B200FFFFBF00FFFFCB00FFFFD300FFFFD500FFFF
      D500FFFFD100FFFFC600FCFBC200AA8071000000000029ADD6009CF7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF0094F7
      FF008CEFFF005AD6EF000873080008730800087308000873100031BD4A0031BD
      4A0008730800087308000873080008730800E3A89400E3A89400FDFDFD00FDFD
      FD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8
      F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E3A89400E3A89400E3A89400E3A89400FDFDFD00FDFD
      FD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFAF900000000000000
      00000000000000000000F3F3F300F3F3F300F1F1F000F1F1F000EDEDED00EDED
      ED00EAEAEA00EAEAEA00E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000BE8F8300F8F0B400FFEF
      B700FFE2AB00FFD99E00FFE6A500FFFAB800FFFFC100FFFFC500FFFFCA00FFFF
      C900FFFFC400FFFFBF00F6E2AC00A27268000000000029ADD600A5F7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF008CF7FF008CF7FF008CF7
      FF008CEFFF0094F7FF008CEFFF007BEFFF0084EFFF000873080021AD390021BD
      390008730800000000000000000000000000E3A89400E3A89400FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00E3A89400E3A89400E3A89400E3A89400FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00000000000000
      00000000000000000000F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000C79C9300E9D1A700FFFB
      CF00FFE9C000FFD59E00FFCF9200FFE7A900FFEDAD00FFF3B400FFFABA00FFFA
      B800FFEFB000FFFEBC00EFCA9700976967000000000029ADD600B5F7FF0094FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CF7FF000873100018AD290010AD
      210008730800000000000000000000000000E3A89400E3A89400FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00FAFAF900FAFA
      F900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00E3A89400E3A89400E3A89400E3A89400FEFEFE00FEFE
      FE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFBFB00000000000000
      00000000000000000000F6F6F500F6F6F500F3F3F300F3F3F300F1F1F000F1F1
      F000EDEDED00EDEDED00E3A89400E3A894000000000000000000000000000000
      00000000000000000000000000000000000000000000C4A09A00D0AC9200FFFF
      E700FFFCFA00FFFAF200FFDAAD00FFDCA000FFDD9E00FFDD9F00FFE0A100FFDE
      A000FFF3B000FFEDB200C6937600000000000000000018A5D6007BCEE700B5FF
      FF0094FFFF0094FFFF0094F7FF0094F7FF0084EFFF0031ADDE0031ADDE0039B5
      DE0042B5DE0042B5DE004ABDDE004ABDDE005ABDE7000884100010AD2100089C
      180008730800000000000000000000000000E3A89400E3A89400FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3
      F300F1F1F000F1F1F000E3A89400E3A89400E3A89400E3A89400FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3
      F300F1F1F000F1F1F000E3A89400E3A894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD928700E7D4
      C100FFFFFF00FFFFFF00FFE3BA00FFE3AD00FFCF9300FFC78A00FFD49600FFF0
      AD00FFEEB600E7AF81009E6C690000000000000000000000000021A5D60084D6
      EF0094E7F70094E7F7009CEFFF00A5F7FF005ACEE70010A5D600000000000000
      00000000000000000000000000000000000008730800089C180010AD21000884
      100008730800000000000000000000000000E3A89400E3A89400FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3
      F300F1F1F000F1F1F000E3A89400E3A89400E3A89400E3A89400FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFCFC00FBFBFB00FBFB
      FB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6F500F3F3F300F3F3
      F300F1F1F000F1F1F000E3A89400E3A894000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B78C
      8600E7D7CB00FFFFFC00FFFFE600FFF4BB00FFEEAC00FFF3B100FFFABC00FFE5
      AB00E9AB7E00A5706900000000000000000000000000000000000000000018A5
      D60021A5D60021A5D60029ADD60029ADD60021A5D60000000000000000000000
      000000000000000000000000000008841000089C180008A51800088C10000873
      080000000000000000000000000000000000E3A89400E3A89400FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFC
      FC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6
      F500F3F3F300F3F3F300E3A89400E3A89400E3A89400E3A89400FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFC
      FC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6
      F500F3F3F300F3F3F300E3A89400E3A894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A97A7800BC917900E7CA9D00F6E2AF00FCEBB500F7DEA900EDC59400C691
      7B00AD7D7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000873
      08000873080010841800089418000894180008941800087B1000087308000000
      000000000000000000000000000000000000E3A89400E3A89400FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFC
      FC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6
      F500F3F3F300F3F3F300E3A89400E3A89400E3A89400E3A89400FFFFFF00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FCFCFC00FCFC
      FC00FBFBFB00FBFBFB00FAFAF900FAFAF900F8F8F700F8F8F700F6F6F500F6F6
      F500F3F3F300F3F3F300E3A89400E3A894000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C4A09A009D71700098686000A6756C00B5817900B6868400C4A0
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000087308000873100008730800087308000873080000000000000000000000
      0000000000000000000000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A8940000000000000000000000000000000000E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A89400E3A8
      9400E3A89400E3A894000000000000000000000000000000000000000000AD7B
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
    object btnExpand: TdxBarButton
      Action = actExpand
      Category = 0
    end
    object btnCollapse: TdxBarButton
      Action = actCollapse
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select * from dual')
  end
  object OracleDataSet1: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := FDC_SR_DAY_GET_CURSOR(:CODE, :DAT1, :DAT2);'
      'end;')
    Variables.Data = {
      0300000004000000050000003A444154310C0000000000000000000000050000
      003A444154320C0000000000000000000000070000003A524553554C54740000
      000000000000000000050000003A434F444505000000090000005041594D454E
      54530000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000005000000040000004E414D45010000000000080000004355525F434F
      4445010000000000080000005041595F54595045010000000000010000005301
      00000000000100000045010000000000}
    Session = MainData.Session
    Left = 288
    Top = 32
  end
  object OracleDataSet3: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := FDC_SR_DAY_GET_CURSOR(:CODE, :DAT1, :DAT2);'
      'end;')
    Variables.Data = {
      0300000004000000050000003A444154310C0000000000000000000000050000
      003A444154320C0000000000000000000000070000003A524553554C54740000
      000000000000000000050000003A434F444505000000090000005041594F5244
      45520000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000090000004954454D5F44415445010000000000040000004E
      414D4501000000000008000000545950454E414D450100000000000900000044
      4F435F53554D4D4101000000000009000000435552525F434F44450100000000
      0004000000533634330100000000000200000049440100000000000500000053
      554D4D410100000000000D00000050415945525F544558545F49440100000000
      00}
    Session = MainData.Session
    Left = 368
    Top = 32
  end
  object OracleDataSet2: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := FDC_SR_DAY_GET_CURSOR(:CODE, :DAT1, :DAT2);'
      'end;')
    Variables.Data = {
      0300000004000000050000003A444154310C0000000000000000000000050000
      003A444154320C0000000000000000000000070000003A524553554C54740000
      000000000000000000050000003A434F44450500000005000000444542540000
      000000}
    QBEDefinition.QBEFieldDefs = {
      0400000006000000080000004355525F434F4445010000000000090000004954
      454D5F44415445010000000000070000004445434C5F49440100000000000700
      00004445434C5F4E4F0100000000000500000053554D4D410100000000000A00
      0000524553545F53554D4D41010000000000}
    Session = MainData.Session
    Left = 440
    Top = 16
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    OnFilterRecord = dxMemData1FilterRecord
    Left = 232
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = OracleDataSet2
    Left = 448
    Top = 216
  end
  object DataSource4: TDataSource
    DataSet = dxMemData2
    Left = 400
    Top = 208
  end
  object DataSource2: TDataSource
    DataSet = dxMemData1
    Left = 336
    Top = 208
  end
  object DataSource1: TDataSource
    DataSet = OracleDataSet4
    Left = 512
    Top = 192
  end
  object OracleDataSet4: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := FDC_SR_DAY_GET_CURSOR(:CODE, :DAT1, :DAT2);'
      'end;')
    Variables.Data = {
      0300000004000000050000003A444154310C0000000000000000000000050000
      003A444154320C0000000000000000000000070000003A524553554C54740000
      000000000000000000050000003A434F44450500000007000000425544474554
      0000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000009000000090000004954454D5F44415445010000000000040000004E
      414D4501000000000008000000545950454E414D450100000000000900000044
      4F435F53554D4D4101000000000009000000435552525F434F44450100000000
      0004000000533634330100000000000200000049440100000000000500000053
      554D4D410100000000000D00000050415945525F544558545F49440100000000
      00}
    Session = MainData.Session
    Left = 408
    Top = 112
  end
  object dxMemData2: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 304
    Top = 256
  end
  object DataSource5: TDataSource
    DataSet = OracleDataSet3
    Left = 556
    Top = 140
  end
  object OracleDataSet5: TOracleDataSet
    SQL.Strings = (
      'begin'
      '  :result := FDC_SR_DAY_GET_CURSOR(:CODE, :DAT1, :DAT2);'
      'end;')
    Variables.Data = {
      0300000004000000050000003A444154310C0000000000000000000000050000
      003A444154320C0000000000000000000000070000003A524553554C54740000
      000000000000000000050000003A434F444505000000090000005A4143485445
      4E4F0000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000050000000500000053554D4D4101000000000009000000435552525F
      434F4445010000000000040000004E414D450100000000000C0000005041594D
      454E545F54595045010000000000020000004944010000000000}
    Session = MainData.Session
    Left = 548
    Top = 318
    object OracleDataSet5SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object OracleDataSet5CURR_CODE: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object OracleDataSet5NAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 400
    end
    object OracleDataSet5PAYMENT_TYPE: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_TYPE'
      Size = 3
    end
    object OracleDataSet5ID: TFloatField
      FieldName = 'ID'
    end
  end
  object srcOra5: TDataSource
    DataSet = OracleDataSet5
    Left = 580
    Top = 318
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
    end
  end
end
