inherited DeclChargeTRGridForm: TDeclChargeTRGridForm
  Left = 211
  Top = 205
  Height = 517
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 454
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 28
    Width = 3
    Align = dalNone
  end
  inherited pnlWorkspace: TPanel
    Height = 426
    inherited splSearchCriteria: TSplitter
      Height = 426
    end
    inherited pnlSearchCriteria: TPanel
      Height = 426
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 406
        inherited btnSearch: TcxButton
          Top = 375
        end
        inherited edtName: TcxTextEdit
          Width = 182
        end
        inherited btnSearchClear: TcxButton
          Top = 346
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 426
      object JvNetscapeSplitter1: TJvNetscapeSplitter [0]
        Left = 0
        Top = 242
        Width = 791
        Height = 10
        Cursor = crVSplit
        Align = alBottom
        MinSize = 1
        Maximized = False
        Minimized = False
        ButtonCursor = crDefault
      end
      inherited grdData: TcxGrid
        Height = 242
      end
      object pnlDetailData: TPanel
        Left = 0
        Top = 252
        Width = 791
        Height = 174
        Align = alBottom
        Caption = 'pnlDetailData'
        TabOrder = 1
        object grdDetailData: TcxGrid
          Left = 1
          Top = 1
          Width = 789
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
          object grdDetailDataDBBandedTableView: TcxGridDBBandedTableView
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
            DataController.DataSource = srcDetailData
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
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.GroupRowStyle = grsOffice11
            OptionsView.HeaderAutoHeight = True
            OptionsView.HeaderEndEllipsis = True
            OptionsView.Indicator = True
            OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
            OptionsView.BandHeaderEndEllipsis = True
            OptionsView.BandHeaders = False
            Preview.Column = cxGridDBBandedColumn5
            Bands = <
              item
                Caption = #1054#1073#1098#1077#1082#1090
              end>
            object cxGridDBBandedColumn1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Hidden = True
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TYPESYSNAME'
              Visible = False
              Hidden = True
              Width = 64
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn3: TcxGridDBBandedColumn
              Caption = #1058#1080#1087
              DataBinding.FieldName = 'TYPENAME'
              Visible = False
              OnCustomDrawCell = grdDataDBBandedTableViewTYPENAMECustomDrawCell
              BestFitMaxWidth = 50
              HeaderGlyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE2EAEDDAE5E9FF00FFFF
                00FFE5ECED9FC6A53A8C3C187B1997C19CFF00FFFF00FFFF00FFFF00FFFF00FF
                D4E3EA75AFCC1577A50976A976AED487C48B1F8820007E00008700078F0C006E
                0068A86BE4EBECFF00FFFF00FF83BDD6087BAE0082B50091C30D84B30064AC00
                8110008F00019701049E0819AC27007200006E0067A26AFF00FFFF00FF2C9AC1
                009BCE00A0D400AADD1B90BA0065AE0594170CA81512AB2618B13230C7520075
                00007600418F43FF00FFFF00FF22A0CE00AFE300B3E609C3F4249BC2006BB212
                9C3720BB3D25BE4A28C25644DE75007700007B00308932FF00FFFF00FF18AADA
                00C2F800C9FD0DE5FF29A0C70070B614A24F32DB6C3FDB7652EB886AFFA30993
                0C007B00208421FF00FFFF00FF0EC2E501F9FF27FFFF36FFFF29E2FF007ABA47
                6A2B8195425FFF9855FF9251F07E53EE7D26B93A128012FF00FFFF00FF31C6DA
                12DCFD00D6FF3D979C9B591CCB4600CC5100BA4100A827007672232CC5431BB5
                2E42BE4C88C88EFF00FFFF00FFE5ECEEB1D7E660BCE2C36607DC6800D56D00D9
                7200BE6118A94000AA3300A33F17DEE9E5FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFE3D2C8DF6F00E17900E07A00E67F00CB7024AD4600A94200B7450FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1D1C3E78000EC8600ED8700F3
                8B00D47F30B24B00AE4800B44505E6ECEEFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFE2CFC0F58C00FD9300FD9400FF9B00DE8D3BB84D00B44E00AB4300E3E4
                E6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE3CFBEFFB654FFC776FFCA86FF
                CF95F6BB7FD47F2EBF5C08B34A00E2DEDCFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFE6EAEADCB28BDBA776D8965BD2853DCF803BCE8546CE8E5CD0956FFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              MinWidth = 44
              Options.HorzSizing = False
              Width = 44
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn4: TcxGridDBBandedColumn
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'NAME'
              Visible = False
              Width = 20
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn5: TcxGridDBBandedColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'DESCRIPT'
              Width = 314
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn6: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PAYMENT_CODE'
              Width = 101
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn16: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PAYMENT_CODE_IN'
              Width = 101
              Position.BandIndex = 0
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn7: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PAYMENT_NAME'
              Visible = False
              Width = 300
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn8: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SUMMA'
              PropertiesClassName = 'TcxCalcEditProperties'
              Width = 190
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn9: TcxGridDBBandedColumn
              DataBinding.FieldName = 'CURR_CODE'
              Width = 131
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn10: TcxGridDBBandedColumn
              DataBinding.FieldName = 'CURR_NAME'
              Visible = False
              Width = 150
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn12: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KBKCODE_CODE'
              Width = 161
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn15: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KBKCODE_CODE_IN'
              Width = 161
              Position.BandIndex = 0
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn13: TcxGridDBBandedColumn
              DataBinding.FieldName = 'CHARGE_MONTH'
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn14: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IS_TS'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayChecked = #1044#1072' '
              Properties.DisplayUnchecked = #1053#1077#1090
              Properties.ValueChecked = 'Y'
              Properties.ValueUnchecked = 'N'
              Width = 110
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object cxGridDBBandedColumn17: TcxGridDBBandedColumn
              DataBinding.FieldName = 'CHARGE_REST'
              Position.BandIndex = 0
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
          end
          object grdDetailDataLevel: TcxGridLevel
            Caption = 'grdDataDBTableView'
            GridView = grdDetailDataDBBandedTableView
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
    AfterRefresh = dsDataAfterRefresh
  end
  object dsDetailData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = False
    SQL.Strings = (
      'select *'
      '  from fdc_charge_tr_lst'
      ' where '
      '(:Name is null )'
      'and DECL_ID = :DECL_ID')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 324
    Top = 363
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object StringField2: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object FloatField2: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object FloatField3: TFloatField
      FieldName = 'STATE_ID'
    end
    object FloatField4: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object StringField3: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object StringField4: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object FloatField5: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object StringField5: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object StringField6: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object StringField7: TStringField
      FieldName = 'OBJECTKINDLIST'
      Visible = False
      Size = 4000
    end
    object FloatField6: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object FloatField7: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object FloatField8: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
      DisplayFormat = ',0.00'
    end
    object FloatField9: TFloatField
      FieldName = 'DECL_ID'
      Visible = False
    end
    object StringField8: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDetailDataPAYMENT_CODE_IN: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072' ('#1074#1093#1086#1076#1103#1097#1080#1081')'
      DisplayWidth = 100
      FieldName = 'PAYMENT_CODE_IN'
      Size = 1500
    end
    object StringField9: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072' ('#1085#1072#1080#1084'.)'
      DisplayWidth = 300
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object StringField10: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object StringField11: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' ('#1085#1072#1080#1084'.)'
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object StringField12: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE_CODE'
      Size = 1500
    end
    object dsDetailDataKBKCODE_CODE_IN: TStringField
      DisplayLabel = #1050#1041#1050' ('#1074#1093#1086#1076#1103#1097#1080#1081')'
      DisplayWidth = 100
      FieldName = 'KBKCODE_CODE_IN'
      Size = 1500
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1077' '#1079#1072' '#1084#1077#1089#1103#1094
      FieldName = 'CHARGE_MONTH'
      DisplayFormat = 'mmm yyyy'
    end
    object FloatField11: TFloatField
      FieldName = 'KBKCODE_ID'
    end
    object StringField13: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDetailDataCHARGE_REST: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'CHARGE_REST'
    end
  end
  object srcDetailData: TDataSource
    DataSet = dsDetailData
    OnDataChange = srcDataDataChange
    Left = 404
    Top = 367
  end
  object DetailGridPopupMenu: TcxGridPopupMenu
    Grid = grdDetailData
    PopupMenus = <
      item
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
        PopupMenu = pmnGridDataDBBandedTableView
      end>
    AlwaysFireOnPopup = True
    Left = 320
    Top = 315
  end
end
