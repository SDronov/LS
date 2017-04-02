inherited ReestrSpecifyKindPayForm: TReestrSpecifyKindPayForm
  Left = 261
  Top = 168
  Width = 828
  Height = 518
  HelpContext = 48
  Caption = 'ReestrSpecifyKindPayForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 820
    Height = 480
    ClientRectBottom = 456
    ClientRectRight = 820
    inherited tabGeneral: TcxTabSheet
      Caption = #1056#1077#1077#1089#1090#1088
      inherited lcGeneral: TdxLayoutControl
        Width = 814
        Height = 425
        inherited edtName: TcxDBTextEdit
          Left = 122
          DataBinding.DataField = 'DOC_NUMBER'
          Style.Color = clSilver
          Width = 422
        end
        inherited edtDescript: TcxDBMemo
          Left = 122
          Top = 402
          TabOrder = 7
          Height = 13
          Width = 185
        end
        object edtCurrCode: TcxDBTextEdit [2]
          Left = 641
          Top = 59
          DataBinding.DataField = 'CURRENCY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 66
        end
        object edtSUMMA: TcxDBTextEdit [3]
          Left = 122
          Top = 59
          DataBinding.DataField = 'TOTAL_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 192
        end
        object edtDOC_DATE: TcxDBDateEdit [4]
          Left = 122
          Top = 34
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 303
        end
        object grdSumByKBK: TcxGrid [5]
          Left = 9
          Top = 151
          Width = 323
          Height = 99
          TabOrder = 6
          object grdSumByKBKDBTableView: TcxGridDBTableView
            PopupMenu = pmnGrid
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcSumByKBK
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsBehavior.IncSearchItem = grdSumByKBKDBTableViewCODE_S
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdSumByKBKDBTableViewCODE_S: TcxGridDBColumn
              Caption = #1050#1041#1050', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBK_SOURCE'
              Width = 120
            end
            object grdSumByKBKDBTableViewCODE_T: TcxGridDBColumn
              Caption = #1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBK_TARGET'
              Width = 120
            end
            object grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMMA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Width = 120
            end
          end
          object grdSumByKBKLevel: TcxGridLevel
            GridView = grdSumByKBKDBTableView
          end
        end
        object edtDATE_CONFIRM: TcxDBDateEdit [6]
          Left = 122
          Top = 84
          DataBinding.DataField = 'DATE_CONFIRM'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 401
        end
        object cxDBIsTS: TcxDBCheckBox [7]
          Left = 9
          Top = 109
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1058#1057
          DataBinding.DataField = 'IS_TS'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 796
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1053#1086#1084#1077#1088
          end
          object lcGeneralItem3: TdxLayoutItem [1]
            Caption = #1044#1072#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtDOC_DATE
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSUMMA
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtCurrCode
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem5: TdxLayoutItem [3]
            Caption = #1044#1072#1090#1072' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            Enabled = False
            Control = edtDATE_CONFIRM
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem [4]
            ShowCaption = False
            Control = cxDBIsTS
            ControlOptions.ShowBorder = False
          end
          object lcItemKBKSum: TdxLayoutItem [5]
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1057#1091#1084#1084#1099' '#1087#1086' '#1050#1041#1050
            CaptionOptions.Layout = clTop
            Control = grdSumByKBK
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AlignVert = avBottom
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 820
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 425
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 453
        Width = 820
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 817
        Height = 425
      end
    end
    object tabPayments: TcxTabSheet [1]
      Caption = #1057#1087#1080#1089#1072#1085#1080#1103
      ImageIndex = 2
      OnShow = tabPaymentsShow
      object grdData: TcxGrid
        Left = 0
        Top = 0
        Width = 820
        Height = 256
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        object grdDataDBTableView: TcxGridDBTableView
          DragMode = dmAutomatic
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
          DataController.DataSource = srcDeductionData
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
          Preview.Column = grdDataDBTableViewDESCRIPT
          object grdDataDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
          end
          object grdDataDBTableViewTYPESYSNAME: TcxGridDBColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Hidden = True
            Width = 64
          end
          object grdDataDBTableViewTYPENAME: TcxGridDBColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'TYPENAME'
            Width = 42
          end
          object grdDataDBTableViewNAME: TcxGridDBColumn
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'NAME'
            Width = 538
          end
          object grdDataDBTableViewDESCRIPT: TcxGridDBColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Width = 314
          end
        end
        object grdDataDBBandedTableView: TcxGridDBBandedTableView
          DragMode = dmAutomatic
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
          DataController.DataSource = srcDeductionData
          DataController.Filter.MaxValueListCount = 10
          DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;-,0.00'
              Kind = skSum
              Column = grdDataDBBandedTableViewSUMMA
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.CellHints = True
          OptionsBehavior.ImmediateEditor = False
          OptionsBehavior.IncSearch = True
          OptionsBehavior.NavigatorHints = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnVertSizing = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
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
          Preview.Column = grdDataDBBandedTableViewDESCRIPT
          Bands = <
            item
              Caption = #1054#1073#1098#1077#1082#1090
            end>
          object grdDataDBBandedTableViewID: TcxGridDBBandedColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
            DataBinding.FieldName = 'TYPESYSNAME'
            Visible = False
            Hidden = True
            Options.Editing = False
            Width = 64
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
            Caption = #1058#1080#1087
            DataBinding.FieldName = 'TYPENAME'
            Visible = False
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
            Hidden = True
            MinWidth = 44
            Options.Editing = False
            Options.HorzSizing = False
            Width = 44
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            DataBinding.FieldName = 'NAME'
            Options.Editing = False
            Width = 160
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDESCRIPT: TcxGridDBBandedColumn
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            DataBinding.FieldName = 'DESCRIPT'
            Options.Editing = False
            Width = 314
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_CODE: TcxGridDBBandedColumn
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            DataBinding.FieldName = 'PAYMENT_CODE'
            Options.Editing = False
            Width = 142
            Position.BandIndex = 0
            Position.ColIndex = 22
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Options.Editing = False
            Width = 89
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewCURR_CODE: TcxGridDBBandedColumn
            Caption = #1042#1072#1083#1102#1090#1072
            DataBinding.FieldName = 'CURR_CODE'
            Visible = False
            Options.Editing = False
            Width = 91
            Position.BandIndex = 0
            Position.ColIndex = 11
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            DataBinding.FieldName = 'DOC_NAME'
            Options.Editing = False
            Width = 158
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053
            DataBinding.FieldName = 'PAYER_INN'
            Visible = False
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'PAYMENT_DATE'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 13
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYMENT_MONTH: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1078' '#1079#1072' '#1084#1077#1089#1103#1094
            DataBinding.FieldName = 'PAYMENT_MONTH'
            Visible = False
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 14
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewACC_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'ACC_DATE'
            Visible = False
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 15
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE_SOURCE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBKCODE_SOURCE'
            Options.Editing = False
            Width = 164
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewKBKCODE: TcxGridDBBandedColumn
            Caption = #1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
            DataBinding.FieldName = 'KBKCODE'
            Options.Editing = False
            Width = 164
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewOPERATION_DATE: TcxGridDBBandedColumn
            Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
            DataBinding.FieldName = 'OPERATION_DATE'
            Options.Editing = False
            Position.BandIndex = 0
            Position.ColIndex = 16
            Position.RowIndex = 0
          end
          object columnIS_ARCHIVE: TcxGridDBBandedColumn
            Caption = #1040#1088#1093#1080#1074#1085#1099#1081
            DataBinding.FieldName = 'IS_ARCHIVE'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ImmediatePost = True
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 17
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_GOODS: TcxGridDBBandedColumn
            Caption = #1050#1086#1076#1099' '#1058#1086#1074#1072#1088#1086#1074
            DataBinding.FieldName = 'DECL_GOODS'
            Width = 400
            Position.BandIndex = 0
            Position.ColIndex = 12
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
            Caption = #1057#1091#1084#1084#1072' '#1087'/'#1087
            DataBinding.FieldName = 'DOC_SUMMA'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;-,0.00'
            Width = 80
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewPAYER_NAME: TcxGridDBBandedColumn
            Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
            DataBinding.FieldName = 'PAYER_NAME'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 23
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_REST: TcxGridDBBandedColumn
            Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1087
            DataBinding.FieldName = 'DOC_REST'
            Visible = False
            Width = 85
            Position.BandIndex = 0
            Position.ColIndex = 18
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME: TcxGridDBBandedColumn
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            DataBinding.FieldName = 'DECL_NAME'
            Visible = False
            Width = 289
            Position.BandIndex = 0
            Position.ColIndex = 19
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN: TcxGridDBBandedColumn
            Caption = #1048#1053#1053' '#1059#1042#1069#1044
            DataBinding.FieldName = 'DECL_INN'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 20
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP: TcxGridDBBandedColumn
            Caption = #1050#1055#1055' '#1059#1042#1069#1044
            DataBinding.FieldName = 'DECL_KPP'
            Visible = False
            Position.BandIndex = 0
            Position.ColIndex = 21
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDIRECTION: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DIRECTION'
            Width = 90
            Position.BandIndex = 0
            Position.ColIndex = 24
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
            Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1057#1086#1102#1079#1072
            DataBinding.FieldName = 'IS_TS'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayChecked = #1044#1072
            Properties.DisplayUnchecked = #1053#1077#1090
            Properties.ValueChecked = 'Y'
            Properties.ValueUnchecked = 'N'
            Width = 120
            Position.BandIndex = 0
            Position.ColIndex = 25
            Position.RowIndex = 0
          end
        end
        object grdDataDBTableShortView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = srcDeductionData
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object grdDataDBTableShortViewColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'DOC_NAME'
            Width = 346
          end
          object grdDataDBTableShortViewColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'AGG_SUMMA'
            Width = 168
          end
          object grdDataDBTableShortViewColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'CURR_CODE'
            Width = 168
          end
        end
        object grdDataLevel: TcxGridLevel
          Caption = 'grdDataDBTableView'
          GridView = grdDataDBBandedTableView
        end
      end
      object cxGroupBoxPaymentOldKBK: TcxGroupBox
        Left = 0
        Top = 256
        Align = alBottom
        Caption = 
          #1057#1087#1080#1089#1072#1085#1080#1103' '#1089' '#1085#1077#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1086#1084#1077#1085#1090' '#1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085 +
          #1103#1102#1090':'
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Visible = False
        Height = 200
        Width = 820
        object grdDataPaymentOldKBK: TcxGrid
          Left = 2
          Top = 44
          Width = 816
          Height = 154
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            DragMode = dmAutomatic
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
            DataController.DataSource = srcDeductionData
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
          object cxGridDBBandedTableViewOldKbk: TcxGridDBBandedTableView
            DragMode = dmAutomatic
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
            DataController.DataSource = srcDeductionDataOldKBK
            DataController.Filter.MaxValueListCount = 10
            DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                Column = cxGridDBBanded_SUMMA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.IncSearch = True
            OptionsBehavior.NavigatorHints = True
            OptionsCustomize.ColumnHiding = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.ColumnVertSizing = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
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
            Preview.Column = cxGridDBBanded_DESCRIPT
            Bands = <
              item
                Caption = #1054#1073#1098#1077#1082#1090
              end>
            object cxGridDBBanded_ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Hidden = True
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGridDBBanded_TYPESYSNAME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TYPESYSNAME'
              Visible = False
              Hidden = True
              Options.Editing = False
              Width = 64
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGridDBBanded_TYPENAME: TcxGridDBBandedColumn
              Caption = #1058#1080#1087
              DataBinding.FieldName = 'TYPENAME'
              Visible = False
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
              Hidden = True
              MinWidth = 44
              Options.Editing = False
              Options.HorzSizing = False
              Width = 44
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGridDBBanded_NAME: TcxGridDBBandedColumn
              Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
              DataBinding.FieldName = 'NAME'
              Options.Editing = False
              Width = 160
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DESCRIPT: TcxGridDBBandedColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'DESCRIPT'
              Options.Editing = False
              Width = 314
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGridDBBanded_PAYMENT_CODE: TcxGridDBBandedColumn
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              DataBinding.FieldName = 'PAYMENT_CODE'
              Options.Editing = False
              Width = 142
              Position.BandIndex = 0
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object cxGridDBBanded_SUMMA: TcxGridDBBandedColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMMA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Width = 89
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object cxGridDBBanded_CURR_CODE: TcxGridDBBandedColumn
              Caption = #1042#1072#1083#1102#1090#1072
              DataBinding.FieldName = 'CURR_CODE'
              Visible = False
              Options.Editing = False
              Width = 91
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DOC_NAME: TcxGridDBBandedColumn
              Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
              DataBinding.FieldName = 'DOC_NAME'
              Options.Editing = False
              Width = 158
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGridDBBanded_PAYER_INN: TcxGridDBBandedColumn
              Caption = #1048#1053#1053
              DataBinding.FieldName = 'PAYER_INN'
              Visible = False
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object cxGridDBBanded_PAYMENT_DATE: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
              DataBinding.FieldName = 'PAYMENT_DATE'
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object cxGridDBBanded_PAYMENT_MONTH: TcxGridDBBandedColumn
              Caption = #1055#1083#1072#1090#1077#1078' '#1079#1072' '#1084#1077#1089#1103#1094
              DataBinding.FieldName = 'PAYMENT_MONTH'
              Visible = False
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object cxGridDBBanded_ACC_DATE: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
              DataBinding.FieldName = 'ACC_DATE'
              Visible = False
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object cxGridDBBanded_KBKCODE_SOURCE: TcxGridDBBandedColumn
              Caption = #1050#1041#1050', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBKCODE_SOURCE'
              Options.Editing = False
              Width = 164
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object cxGridDBBanded_KBKCODE: TcxGridDBBandedColumn
              Caption = #1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBKCODE'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = cxGridDBBanded_KBKCODEPropertiesButtonClick
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Width = 164
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object cxGridDBBanded_OPERATION_DATE: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
              DataBinding.FieldName = 'OPERATION_DATE'
              Options.Editing = False
              Position.BandIndex = 0
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object cxGridDBBanded_IS_ARCHIVE: TcxGridDBBandedColumn
              Caption = #1040#1088#1093#1080#1074#1085#1099#1081
              DataBinding.FieldName = 'IS_ARCHIVE'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.DisplayChecked = #1044#1072
              Properties.DisplayUnchecked = #1053#1077#1090
              Properties.ImmediatePost = True
              Properties.ValueChecked = 'Y'
              Properties.ValueUnchecked = 'N'
              Width = 100
              Position.BandIndex = 0
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DECL_GOODS: TcxGridDBBandedColumn
              Caption = #1050#1086#1076#1099' '#1058#1086#1074#1072#1088#1086#1074
              DataBinding.FieldName = 'DECL_GOODS'
              Width = 400
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DOC_SUMMA: TcxGridDBBandedColumn
              Caption = #1057#1091#1084#1084#1072' '#1087'/'#1087
              DataBinding.FieldName = 'DOC_SUMMA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Width = 80
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object cxGridDBBanded_PAYER_NAME: TcxGridDBBandedColumn
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
              DataBinding.FieldName = 'PAYER_NAME'
              Width = 300
              Position.BandIndex = 0
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DOC_REST: TcxGridDBBandedColumn
              Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1087
              DataBinding.FieldName = 'DOC_REST'
              Visible = False
              Width = 85
              Position.BandIndex = 0
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DECL_NAME: TcxGridDBBandedColumn
              Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
              DataBinding.FieldName = 'DECL_NAME'
              Visible = False
              Width = 289
              Position.BandIndex = 0
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DECL_INN: TcxGridDBBandedColumn
              Caption = #1048#1053#1053' '#1059#1042#1069#1044
              DataBinding.FieldName = 'DECL_INN'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object cxGridDBBanded_DECL_KPP: TcxGridDBBandedColumn
              Caption = #1050#1055#1055' '#1059#1042#1069#1044
              DataBinding.FieldName = 'DECL_KPP'
              Visible = False
              Position.BandIndex = 0
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object cxGridDBBandedDIRECTION: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DIRECTION'
              Width = 90
              Position.BandIndex = 0
              Position.ColIndex = 24
              Position.RowIndex = 0
            end
          end
          object cxGridDBTableView2: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcDeductionData
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGridDBColumn6: TcxGridDBColumn
              DataBinding.FieldName = 'DOC_NAME'
              Width = 346
            end
            object cxGridDBColumn7: TcxGridDBColumn
              DataBinding.FieldName = 'AGG_SUMMA'
              Width = 168
            end
            object cxGridDBColumn8: TcxGridDBColumn
              DataBinding.FieldName = 'CURR_CODE'
              Width = 168
            end
          end
          object cxGridLevelOldKbk: TcxGridLevel
            Caption = 'grdDataDBTableView'
            GridView = cxGridDBBandedTableViewOldKbk
          end
        end
        object dxBarDockControloldkbk: TdxBarDockControl
          Left = 2
          Top = 16
          Width = 816
          Height = 28
          Align = dalTop
          BarManager = BarManager
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 820
        Height = 456
        ClientRectBottom = 432
        ClientRectRight = 820
      end
    end
    object tabNotice: TcxTabSheet
      Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      ImageIndex = 3
      OnShow = tabNoticeShow
      object tcNotice: TcxTabControl
        Left = 0
        Top = 0
        Width = 820
        Height = 456
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        Tabs.Strings = (
          #1048#1084#1087#1086#1088#1090
          #1069#1082#1089#1087#1086#1088#1090
          #1041#1077#1079' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103)
        OnChange = tcNoticeChange
        ClientRectBottom = 452
        ClientRectLeft = 2
        ClientRectRight = 816
        ClientRectTop = 22
        object grdNoticeData: TcxGrid
          Left = 2
          Top = 22
          Width = 814
          Height = 430
          Align = alClient
          BorderStyle = cxcbsNone
          PopupMenu = pmnGrid
          TabOrder = 0
          object grdNoticeDataDBTableView: TcxGridDBTableView
            DragMode = dmAutomatic
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
            DataController.DataSource = srcNoticeData
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
            Preview.Column = grdNoticeDataDBTableViewDESCRIPT
            object grdNoticeDataDBTableViewID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Hidden = True
            end
            object grdNoticeDataDBTableViewTYPESYSNAME: TcxGridDBColumn
              DataBinding.FieldName = 'TYPESYSNAME'
              Visible = False
              Hidden = True
              Width = 64
            end
            object grdNoticeDataDBTableViewTYPENAME: TcxGridDBColumn
              Caption = #1058#1080#1087
              DataBinding.FieldName = 'TYPENAME'
              Width = 42
            end
            object grdNoticeDataDBTableViewNAME: TcxGridDBColumn
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'NAME'
              Width = 538
            end
            object grdNoticeDataDBTableViewDESCRIPT: TcxGridDBColumn
              Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              DataBinding.FieldName = 'DESCRIPT'
              Width = 314
            end
          end
          object grdNoticeDataDBBandedTableView: TcxGridDBBandedTableView
            DragMode = dmAutomatic
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
            FilterBox.CustomizeDialog = False
            OnCustomDrawCell = grdNoticeDataDBBandedTableViewCustomDrawCell
            DataController.DataSource = srcNoticeData
            DataController.Filter.MaxValueListCount = 10
            DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00;-,0.00'
                Kind = skSum
                FieldName = 'SUMMA'
                Column = grdNoticeDataDBBandedTableViewSUMMA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CellHints = True
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.IncSearch = True
            OptionsBehavior.NavigatorHints = True
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
            object grdNoticeDataDBBandedTableViewID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              Hidden = True
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewTYPESYSNAME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TYPESYSNAME'
              Visible = False
              Hidden = True
              Width = 64
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewTYPENAME: TcxGridDBBandedColumn
              Caption = #1058#1080#1087
              DataBinding.FieldName = 'TYPENAME'
              OnCustomDrawCell = grdNoticeDataDBBandedTableViewTYPENAMECustomDrawCell
              BestFitMaxWidth = 60
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
              MinWidth = 60
              Options.Editing = False
              Options.HorzSizing = False
              Width = 60
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewKBK_SOURCE: TcxGridDBBandedColumn
              Caption = #1050#1041#1050', '#1089' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBK_CODE_S'
              Options.Editing = False
              Options.Filtering = False
              Width = 163
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewKBK_TARGET: TcxGridDBBandedColumn
              Caption = #1050#1041#1050', '#1085#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1091#1090#1086#1095#1085#1103#1102#1090
              DataBinding.FieldName = 'KBK_CODE_T'
              Options.Editing = False
              Options.Filtering = False
              Width = 178
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewSUMMA: TcxGridDBBandedColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUMMA'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
              Options.Editing = False
              Options.Filtering = False
              Width = 87
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewDirection: TcxGridDBBandedColumn
              Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
              DataBinding.FieldName = 'DIRECTION'
              Options.Editing = False
              Options.Filtering = False
              Width = 89
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewCURRENCY: TcxGridDBBandedColumn
              Caption = #1042#1072#1083#1102#1090#1072
              DataBinding.FieldName = 'CURRENCY_CODE'
              Options.Editing = False
              Options.Filtering = False
              Width = 85
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewDoc_number: TcxGridDBBandedColumn
              Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              DataBinding.FieldName = 'DOC_NUMBER'
              Width = 90
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewDoc_date: TcxGridDBBandedColumn
              Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              DataBinding.FieldName = 'DOC_DATE'
              Width = 80
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object grdNoticeDataDBBandedTableViewIS_TS: TcxGridDBBandedColumn
              Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1072#1084#1086#1078#1077#1085#1085#1086#1075#1086' '#1057#1086#1102#1079#1072
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
          object grdNoticeDataLevel: TcxGridLevel
            Caption = 'grdDataDBTableView'
            GridView = grdNoticeDataDBBandedTableView
          end
        end
      end
    end
    object tabReestrs: TcxTabSheet
      Caption = #1056#1077#1077#1089#1090#1088#1099
      ImageIndex = 4
      OnShow = tabReestrsShow
    end
    object tabEnvelops: TcxTabSheet
      Caption = #1050#1086#1085#1074#1077#1088#1090#1099
      ImageIndex = 5
      OnShow = tabEnvelopsShow
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    object actSaveToFile: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083'...'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1074' '#1092#1072#1081#1083
      OnExecute = actSaveToFileExecute
      OnUpdate = actSaveToFileUpdate
    end
    object actChangeKBK: TAction
      Category = 'Do'
      Caption = 'actChangeKBK'
      OnExecute = actChangeKBKExecute
    end
    object actExcludeDeduct_old_kbk: TAction
      Category = 'Do'
      Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      OnExecute = actExcludeDeduct_old_kbkExecute
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
    Style.IsFontAssigned = True
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
  end
  inherited imglAction: TImageList
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001001000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FAA7E4349634D634D634D6351
      6351634D634D4349434943452341A97EFF7F0000000000000000F5001401B100
      00000000000014011401B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F6351A35DC365C365C365C365
      C365C365C365C365A361A35D6351223DFF7F0000000000007801140114011401
      B10000001401F5001401F500B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F8355C365E36DE36DE3710372
      237A237A237A237AE36DA36183554345FF7F000000000000F500000000000000
      B1000000F500000000000000B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA361E36D0376FF7F107F237A
      237A237A237A107FFF7FC365A35D4349FF7F000000000000F500B10000000000
      B1000000F500000000007801B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FC3650372237A237EFF7F107F
      237A237A107FFF7F0372C369A361634DFF7F0000000000007801F5001401F500
      F5000000F500F5001401F500B100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE36D237A237E237A237AFF7F
      107F107FFF7F237A0372C369C3656351FF7F0000000000000000780114011401
      330D9125F50014011401B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F0372237E237A237A237A237A
      FF7F107F237A0376E36DC365C3658355FF7F0000000000000000000000000000
      D13508214C210000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F0376237E237E237A237A107F
      FF7FFF7F107F0372C369C365C3658355FF7F000000000000000000000000D135
      133E133E133E4C21000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F237E447E447E237E107FFF7F
      037A0376FF7F107FC365C365C3658355FF7F00000000000000000000D135133E
      964E0000964E133E4C2100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F237E877E877E107FFF7F237E
      237E03760372FF7F107FC365C3658355FF7F0000000000000000D135133E964E
      000000000000964E133E4C210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F447EAA7EA97EFF7F447E447E
      437E237A03760372FF7FC365C3658355FF7F000000000000D135133E964E0000
      0000000000000000964E133E4C21000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F877EED7EAA7E877E667E657E
      657E447E237E037A0376E36DC3658355FF7F000000000000133E964E00000000
      00000000000000000000964E133E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA97E107FED7EAA7EA97E877E
      667E657E447E437E237A0376C365634DFF7F000000000000964E000000000000
      000000000000000000000000964E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F757FA97E667E447E237E237E
      237A237A03760372E36DC365A35DCC7EFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C07CC07C0000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000EB32610A820A820E820E810A
      000000005B6B564A7325F1181A63000000000000000000000000000000000000
      0000000000000000000000000000000000000000C07CC07C0000000000000000
      000000000000000000000000C07CC07C0000FF7FAA7E4349634D634D634D6351
      6351634D634D4349434943452341A97EFF7F00000000C92A6937EC4FEE5B820E
      00007619F9259D3A1F471A2E6F081A6700000000554A554A554A554A35463546
      354614421442F43DF43DF43DD439B33500000000C07CC07CC07C794E794E794E
      794E1042104210429331C07CC07C93310000FF7F6351A35DC365C365C365C365
      C365C365C365C365A361A35D6351223DFF7F0000565BA316AA3FCA43ED53820A
      000097193F4FDE3E9D363B329104D43500000000B856BF779F737F6F7F6F7F6F
      7F6F7F6F7F6F5F6B5F6B5F6B7F6FF43D00000000C07CC07CC07CC07C3F673F67
      3F673F673F673F67C07CC07C3F6793310000FF7F8355C365E36DE36DE3710372
      237A237A237A237AE36DA36183554345FF7F0000461E672F883768338212820A
      00009715BE3E7C365C2E5B32D308732900000000B856BF77BF779F739F739F73
      9F73F95ED95AD85A7F6F5F6B7F6FD339000000001863C07CC07CC07CC07CFF6F
      FF6F18631863C07CC07C3F673F6793310000FF7FA361E36D037603760376107F
      237A237A237A237A0372C365A35D4349FF7F0000220E46270523CB2E78676312
      0000B8155C325C367C3ADD46771D331900000000D85ADF7BBF779F739F739F73
      9F73F95ED95AB856B75697527F6FF43D000000001863FF7FFF6FC07CC07CC07C
      FF6FC07CC07CC07C794E794E3F6793310000FF7FC3650372237A237E107FFF7F
      107F237A237A237A0372C369A361634DFF7F0000261A25238926000000009A6F
      00005B26BD361F4FBE3E5C32FA25F21000000000D85ADF7BBF77BF77BF779F73
      9F73F95ED95AD85AB75697527F6FF43D000000001863FF7FFF6FFF6FC07CC07C
      C07CC07CC07C1863794E794E3F6793310000FF7FE36D237A237E107FFF7F107F
      FF7F107F237A237A0372C369C3656351FF7F0000B056E0052349C460A4546B59
      176F0000FC4ED819D7211736984A3A6700000000F95EDF7BBF77BF77BF77BF77
      9F733B673B671B63FA5EFA5E9F73F43D000000001863FF7FFF6FFF6FFF6FC07C
      C07CC07C18631863186318633F6793310000FF7F0372237E107FFF7F107F237A
      237AFF7F107F0376E36DC365C3658355FF7F000024790E530F678C7EA57DC07C
      8450000000000000000000000000000000000000F95EDF7BBF77BF77BF77BF77
      9F739F739F737F6F7F6F7F6F9F73F43D000000001863FF7FFF7FFF6FC07CC07C
      C07CC07CC07C3F673F673F673F6710420000FF7F0376237E237E107F237A237A
      237A237AFF7F107FC369C365C3658355FF7F00000E76F07E527F4B7E437D8070
      CD5D0000000000000000000000000000000000001963FF7FDF7BDF7BBF77BF77
      BF779F739F7332474002230A9F73F43D000000001863FF7FFF7FC07CC07CC07C
      FF6FFF6FC07CC07C600200023F6710420000FF7F237E447E447E237E237E237A
      037A03760376FF7F107FC365C3658355FF7F00009B772575B57F4A7E017D4254
      7B770000000000000000000000000000000000003967FF7F5A6B19630000BF77
      BF779F739F73324B6006630E9F731442000000001863FF7FC07CC07CC07CFF6F
      FF6FFF6FFF6FC07CC07C6002FF6F10420000FF7F237E877E877E447E437E237E
      237E03760372E36DFF7F107FC3658355FF7F000000000F76CF7A4B7E8070EF65
      00000000000000000000000000000000000000003967FF7F5A6B19630000BF77
      BF77BF779F73324BC522C7229F731442000000001863C07CC07CC07C1863FF6F
      FF6FFF6FFF6F1863C07CC07CFF6F10420000FF7F447EAA7EA97E657E447E447E
      437E237A03760372E36DFF7FC3658355FF7F000000009B77256D6B7E42589B77
      00000000000000000000000000000000000000005A6BFF7FFF7FFF7FFF7FDF7B
      DF7BDF7BBF77BF77BF779F73BF77144200000000C07CC07CC07CFF7FFF7FFF7F
      FF7FFF7FFF6FFF6FFF6FFF6FC07C10420000FF7F877EED7EAA7E877E667E657E
      657E447E237E037A0376E36DC3658355FF7F0000000000000F72E368306A0000
      0000000000000000000000000000000000000000396739671963F85EF85ED85A
      B756B7569752764E564A564A564AF43D0000C07CC07CC07C1863186318631863
      1863794E794E794E794E794E794E10420000FF7FA97E107FED7EAA7EA97E877E
      667E657E447E437E237A0376C365634DFF7F0000000000009B77075D9C770000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C07CC07C00000000000000000000
      000000000000000000000000000000000000FF7F757FA97E667E447E237E237E
      237A237A03760372E36DC365A35DCC7EFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      00000000000000000000000000000000000000000000752D55293425554A3863
      3963396338633863764E13211321542900000000000016421642164216421642
      1642164216421642164216421642164200000000000000000000000000000000
      0000000000000000000000000000C06CC06C0000F439F439F439F439F439F439
      F439F439F439F439F439F439922D000000000000F7399931B935762D13429752
      3C67DF7BFF7BDE7BD95AB214D318782D752D00000000984EBF6B9E637E5F7E5B
      5E575E533D4F3D4B3D4B3D4B5E4F164200000000C06CC06C0000000000000000
      000000000000000000000000C06CC06C00000000F4399E6B9E6BBF6B7D5F9F63
      7F5F7F5F7F5B5F575F535F539231000000000000F73999319931762DF33D1321
      D6397C6FDF7BFF7FDA5AD218D318772D752D00000000984EBF6B9E677E637E5F
      5E5B5E533D4F3D4F3D4B3D4B3D4F164200000000C06CC06CC06C000000000000
      00000000000000000000C06CC06C000000000000153E9E6F9E6F600275530E3B
      A81AF02E5D535F575F535F539231000000000000F73999319931762D1542F31C
      F31CF95EBD77FF7F1C63B214D218772D752D00000000B852BF739E6B9E677E63
      7E5F5E5B5E573D4F3D4F3D4B3D4F164200000000C06CC06CC06CC06C00000000
      0000000000000000C06CC06C0000000000000000163EBE6FBE6F600260026002
      60026002A8167F5B5F575F57B331000000000000F73999319931762D36463325
      D218744E5A6BFF7F1C63B214D218772D752D00000000B852DF739E6B9E679E63
      7E637E5B5E5B5E573D4F3D4F3D4B1642000000000000C074C06CC06CC06C0000
      000000000000C06CC06C00000000000000000000363EBE73BE73600260026206
      59539F67840E7F5B5F5B5F5BB331000000000000F73999319931772D5846584A
      1642354697521C63BB56F41CF41C782D752D00000000D956FF7BBF739E6B9E6B
      9E677E637E5F5E5B5E573D4F3D4F164200000000000000000000C06CC06CC06C
      0000C06CC06CC06C000000000000000000000000373EBE77BE77600260026002
      60029F677D5F7F5B5F5B7F5BD435000000000000F73999319931993199319931
      99319931782D782D993199319931B935552D00000000DA56FF7FDF77BF739E6B
      9E679E637E637E5F5E575E535E531642000000000000000000000000C06CC070
      C070C070C06C00000000000000000000000000005842DF77DF77DF77DF77DF77
      DF779D639D639F677F5F7F5FD435000000000000F7395629762D18429A52BA56
      BA52BA569A529A52BA52BA567A4E9931552900000000FA5AFF7FDF7BDF77BF6F
      9E6B9E679E637E637E5F5E5B5E5716420000000000000000000000000000C070
      C070C074000000000000000000000000000000007942DF7BFF7FDF77DF77DF77
      600260026002BF6B9F639F63D535000000000000F73955253C67DE7BDE77DE7B
      DE7BDE7BDE7BDE7BDE7BDE7BFB5E782D552D00000000FA5AFF7FFF7FDF7BDF77
      BF739E6B9E677E637E5F7E5B7E5B1642000000000000000000000000C06CC074
      C070C074C07800000000000000000000000000009A42FF7FFF7F620A7553DF77
      755360026002BF6B9F679F63F535000000000000F73956255D6BDF7BBE77BE77
      BE77BE77BE77BE77BE77DE7BFB5E782D552D00000000FB5AFF7FFF7FFF7FDF7B
      BF73BF6F9E6B9E677E637E635E5B164200000000000000000000C078C074C070
      00000000C078C078000000000000000000000000BB46FF7FFF7F0E3B60026002
      600260026002BF6BBF6B9F67F539000000000000F73956255D6BBD775A6B5A6B
      5A6B5A6B5A6B5A6B5A6BBD77FB5E782D552D000000001B5BFF7FFF7FFF7FFF7F
      DF7BBF73BF6FBF6FBF6B7C63F85616420000000000000000C07CC074C0780000
      000000000000C07CC07800000000000000000000BB46FF7FFF7FFF7F0E3B6002
      600275536002BF6B3F63DF5AF639000000000000F73956255D6BBD775B6B7B6F
      7B6F7B6F7B6F7B6F5B6BBD77FB5E782D552D000000001C5BFF7FFF7FFF7FFF7F
      FF7FDF77DF779E6B984A564636421642000000000000C078C078C07C00000000
      0000000000000000C078C0780000000000000000DC46FF7FFF7FFF7FFF7FFF7F
      FF7BFF7BDF777E67163A163A163A000000000000F73956255D6BDE777C6F7C6F
      7C6F7C6F7C6F7C6F7C6FBD77FB5E782D552D000000001C5BFF7FFF7FFF7FFF7F
      FF7FFF7FFF7B3C67373ADD3A9D26183600000000C078C078C078000000000000
      000000000000000000000000C078000000000000FD4AFF7FFF7FFF7FFF7FFF7F
      FF7FFF7BFF7B9E6B163A9D2ABA4A000000000000F73956255D6BBD775A6B5A6B
      5A6B5A6B5A6B5A6B5A6BBD77FB5E782D552D000000003D5FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F5C67583E1F3B593A00000000C078C078C0780000000000000000
      0000000000000000000000000000000000000000FD4AFF7FFF7FFF7FFF7FDE7B
      DE7BDE7BBE777D6B163ADB4E0000000000000000F73956255C67DF7BBE77BE77
      BE77BE77BE77BE77BE77DF7BFB5E782D552D000000001C5BDF7BDF77DF77DF77
      DF77DF77DF773C67583E7942000000000000C078C07800000000000000000000
      0000000000000000000000000000000000000000FE4ABB42BB42BB42BB42BB42
      BB42BB42BB42BB42163A0000000000000000000000005525D95A5A6B39673967
      396739673967396739675A6BB95634250000000000001C5B3D5B3D5B3D5B3D5B
      1C5B1C5B3D5BFA5A173E00000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000008001FFFF000000000000F1C700000000
      0000E083000000000000EEBB000000000000E6B3000000000000E08300000000
      0000F007000000000000FE3F000000000000FC1F000000000000F88F00000000
      0000F1C7000000000000E3E3000000000000E7F3000000000000EFFB00000000
      0000FFFF000000008001FFFF00000000FFFFFFFFFFFC80018183FFFF9FF90000
      C101800180010000810180018001000081018001800100008101800180010000
      8D01800180010000808180018001000080FF80018001000080FF800180010000
      80FF840180010000C1FF840180010000C1FF800180010000E3FF800100010000
      E3FFFFFF3FFF0000FFFFFFFFFFFF8001FFFFC001C001FFFC80038000C0019FF9
      80038000C0018FF380038000C00187E780038000C001C3CF80038000C001F11F
      80038000C001F83F80038000C001FC7F80038000C001F83F80038000C001F19F
      80038000C001E3CF80038000C001C7E780038000C0018FFB80038000C0031FFF
      80078000C0073FFF800FC001C00FFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited imglLarge: TImageList
    Bitmap = {
      494C01010A000E00040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001001000000000000048
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FAA7EAA7E4349634D634D634D
      634D634D635163516351634D634D634D434943494349434523412341A97EFF7F
      FF7F000000000000000000000000F50014011401B10000000000000000000000
      140114011401B100000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F63516351A35DC365C365C365
      C365C365C365C365C365C365C365C365C365A361A361A35D63516351223DFF7F
      FF7F0000000000000000780178011401140114011401B100B100000014011401
      F50014011401F500B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F63516351A35DC365C365C365
      C365C365C365C365C365C365C365C365C365A361A361A35D63516351223DFF7F
      FF7F0000000000000000780178011401140114011401B100B100000014011401
      F50014011401F500B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F83558355C365E36DE36DE36D
      E371E3710372237A237A237A237A237A237AE36DE36DA361835583554345FF7F
      FF7F0000000000000000F500F5000000000000000000B100B1000000F500F500
      0000000000000000B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA361A361E36D03760376FF7F
      107F107F237A237A237A237A237A237A107FFF7FFF7FC365A35DA35D4349FF7F
      FF7F0000000000000000F500F500B100000000000000B100B1000000F500F500
      0000000000007801B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA361A361E36D03760376FF7F
      107F107F237A237A237A237A237A237A107FFF7FFF7FC365A35DA35D4349FF7F
      FF7F0000000000000000F500F500B100000000000000B100B1000000F500F500
      0000000000007801B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FC365C3650372237A237A237E
      FF7FFF7F107F237A237A237A107F107FFF7F03720372C369A361A361634DFF7F
      FF7F000000000000000078017801F50014011401F500F500F5000000F500F500
      F50014011401F500B100B1000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE36DE36D237A237E237E237A
      237A237AFF7F107F107F107FFF7FFF7F237A03720372C369C365C3656351FF7F
      FF7F0000000000000000000000007801140114011401330D330D9125F500F500
      140114011401B100000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FE36DE36D237A237E237E237A
      237A237AFF7F107F107F107FFF7FFF7F237A03720372C369C365C3656351FF7F
      FF7F0000000000000000000000007801140114011401330D330D9125F500F500
      140114011401B100000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F03720372237E237A237A237A
      237A237A237AFF7FFF7F107F237A237A0376E36DE36DC365C365C3658355FF7F
      FF7F0000000000000000000000000000000000000000D135D13508214C214C21
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F03760376237E237E237E237A
      237A237A107FFF7FFF7FFF7F107F107F0372C369C369C365C365C3658355FF7F
      FF7F000000000000000000000000000000000000D135133E133E133E133E133E
      4C21000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F03760376237E237E237E237A
      237A237A107FFF7FFF7FFF7F107F107F0372C369C369C365C365C3658355FF7F
      FF7F000000000000000000000000000000000000D135133E133E133E133E133E
      4C21000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F237E237E447E447E447E237E
      107F107FFF7F037A037A0376FF7FFF7F107FC365C365C365C365C3658355FF7F
      FF7F0000000000000000000000000000D135D135133E964E964E0000964E964E
      133E4C214C210000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F237E237E877E877E877E107F
      FF7FFF7F237E237E237E037603720372FF7F107F107FC365C365C3658355FF7F
      FF7F000000000000000000000000D135133E133E964E00000000000000000000
      964E133E133E4C21000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F237E237E877E877E877E107F
      FF7FFF7F237E237E237E037603720372FF7F107F107FC365C365C3658355FF7F
      FF7F000000000000000000000000D135133E133E964E00000000000000000000
      964E133E133E4C21000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F447E447EAA7EA97EA97EFF7F
      447E447E447E437E437E237A037603760372FF7FFF7FC365C365C3658355FF7F
      FF7F0000000000000000D135D135133E964E964E000000000000000000000000
      0000964E964E133E4C214C210000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F877E877EED7EAA7EAA7E877E
      667E667E657E657E657E447E237E237E037A03760376E36DC365C3658355FF7F
      FF7F0000000000000000133E133E964E00000000000000000000000000000000
      000000000000964E133E133E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F877E877EED7EAA7EAA7E877E
      667E667E657E657E657E447E237E237E037A03760376E36DC365C3658355FF7F
      FF7F0000000000000000133E133E964E00000000000000000000000000000000
      000000000000964E133E133E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FA97EA97E107FED7EED7EAA7E
      A97EA97E877E667E667E657E447E447E437E237A237A0376C365C365634DFF7F
      FF7F0000000000000000964E964E000000000000000000000000000000000000
      0000000000000000964E964E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F757F757FA97E667E667E447E
      237E237E237E237A237A237A037603760372E36DE36DC365A35DA35DCC7EFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7F757F757FA97E667E667E447E
      237E237E237E237A237A237A037603760372E36DE36DC365A35DA35DCC7EFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      00000000000000000000000000000000BC77F95ED439AF14B539000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      000000000000000000009C739952952D90081411F929DF3E4F00164200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FAA7EAA7E4349634D634D634D634D634D635163516351634D634D634D
      434943494349434523412341A97EFF7FFF7F0000000000000000000000000000
      0000000000000000DA52D204B7219C3A3F4B1F47DE3EBE3AD2102E00584A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F63516351A35DC365C365C365C365C365C365C365C365C365C365C365
      C365A361A361A35D63516351223DFF7FFF7F0000000000000000810A810A810A
      810A810A810A810A994A3A2E5F531F47DE42BD3E9D369D36351970044F003A67
      00000000554AFA5EFA5EFA5EFA5EFA5EFA5EFA5EFA5EFA5EFA5EFA5EFA5EDA5A
      DA5ADA5ADA5ADA5ADA5ADA5ADB5A995200000000794E794E794E794E794E1042
      1042104210421042104210421042104210429331933193319331933193319331
      0000FF7F63516351A35DC365C365C365C365C365C365C365C365C365C365C365
      C365A361A361A35D63516351223DFF7FFF7F00000000000000001043A41AED4F
      ED53EE57EF5F820ABA4EF9211F47DE3EBD3E9D3A7C367D32962192087004B856
      00000000544ABF77BF77BF77BF77BF779F739F739F739F739F739F739F737F6F
      7F6F7F6F7F6F7F6F7F6F5F6B7F6FBA5600000000FF6FFF6FFF6FFF6FFF6FFF6F
      FF6FFF6FFF6FFF6FFF6F3F673F673F673F67C07CC07C3F673F673F673F679331
      0000FF7F83558355C365E36DE36DE36DE371E3710372237A237A237A237A237A
      237AE36DE36DA361835583554345FF7FFF7F0000000000000000565F0106893B
      CB43EC4BEE57820ADA52D91DDE42BD3A9D3A7C365C325C2EF829B2089104574A
      00000000554A9F739F739F739F739F739F739F739F739F737F6F7F6FB656744E
      534A534A5F6B5F6B5F6B5F6B5F6BBA5600000000FF6FC07CC07CFF6FFF6FFF6F
      FF6F3F673F673F673F673F67794E794EC07CC07C3F673F673F673F673F679331
      0000FF7FA361A361E36D03760376037603760376107F237A237A237A237A237A
      237A03720372C365A35DA35D4349FF7FFF7F0000000000009A6F220A6833893B
      AA3FCB47ED53820AFB52D919BD3E7D367C365C323B2E1B2A3A32D308B208F539
      00000000754EBF77BF779F739F739F739F739F739F739F739F737F6F7F6F7F6F
      7F6F7F6F7F6F5F6B5F6B5F6B7F6FBA5600000000FF6FC07CC07CC07CFF6FFF6F
      FF6FFF6FFF6F3F673F673F67C07CC07CC07C10423F673F673F673F673F679331
      0000FF7FA361A361E36D03760376037603760376107F237A237A237A237A237A
      237A03720372C365A35DA35D4349FF7FFF7F0000000000008C32E51E67336833
      AA3F0523CB43820A1B57B9157D365C325C2E3B2A1B261B269B42F408F30CB42D
      00000000754EBF77BF77BF77BF779F739F739F739F739F739F739F73B656744E
      534A534A3246114212425F6B7F6FBA5600000000FF6FFF6FC07CC07CC07CC07C
      FF6FFF6FFF6FFF6F3F67C07CC07CC07C10421042104210423F673F673F679331
      0000FF7FC365C3650372237A237A237E107F107FFF7F107F107F237A237A237A
      237A03720372C369A361A361634DFF7FFF7F000000000000E30D4627462B8833
      A312AA2E630E820A3C5BB9113C2E3B2E9C3EDD46FE4EFD4ABD42F92D150D5321
      00000000754EBF77BF77BF77BF77BF77BF779F739F739F739F739F73B656534A
      524A32461142104211425F6B7F6FBA5600000000FF6FFF6FFF6FC07CC07CC07C
      FF6FFF6FFF6FFF6FC07CC07CC07C104210421042104210423F673F673F679331
      0000FF7FE36DE36D237A237E237E107FFF7FFF7F107FFF7FFF7F107F237A237A
      237A03720372C369C365C3656351FF7FFF7F000000000000E1092523462B620E
      0F3F0000996B84125C6399051F4F5F53FE42BD3A7C365C2E3C2A3C2EFA29F114
      000000009652BF77BF77BF77BF77BF77BF77BF779F739F739F739F73B656744E
      534A534A3246114211425F6B7F6FDA5A00000000FF7FFF6FFF6FFF6FC07CC07C
      C07CFF6FFF6FC07CC07CC07C3F673F673F673F673F673F673F673F673F679331
      0000FF7FE36DE36D237A237E237E107FFF7FFF7F107FFF7FFF7F107F237A237A
      237A03720372C369C365C3656351FF7FFF7F000000009B77C41D041BA316A429
      6B61EF65D56E996B00001D53B90D7C2EFF46BE3E9D3A3B2EB91D5611D3043419
      000000009652DF7BBF77BF77BF77BF77BF77BF77BF779F739F739F73B656534A
      524A324611421042F03D5F6B7F6FDA5A00000000FF7FFF7FFF6FFF6FFF6FFF6F
      C07CC07CC07CC07CC07CFF6F794E1042104210421042104210423F673F679331
      0000FF7F03720372237E107F107FFF7F107F107F237A237A237AFF7F107F107F
      0376E36DE36DC365C365C3658355FF7FFF7F0000707AE178C551210A210A286E
      8675C26C405C6350D67200009C6F5A2EB909970D5505B721383ADA527C6B0000
      000000009652DF7BDF7BBF77BF77BF77BF77BF77BF77BF779F739F739F739F73
      9F737F6F7F6F7F6F7F6F5F6B7F6FDA5A00000000FF7FFF7FFF7FFF7FFF6FFF6F
      C07CC07CC07CC07CFF6FFF6FFF6F3F673F673F673F673F673F673F673F679331
      0000FF7F03760376237E237E237E107F237A237A237A237A237A237AFF7FFF7F
      107FC369C369C365C365C3658355FF7FFF7F0000047DB57FB57F6732E0054B7E
      C77D437DC07C8070295D0000000000005C5F5C67BC7700000000000000000000
      000000009652DF7BDF7BDF7BDF7BBF77BF77BF77BF77BF77BF779F739F739F73
      9F739F737F6F7F6F7F6F7F6F7F6FDA5A00000000FF7FFF7FFF7FFF7FFF7FFF6F
      C07CC07CC07CC07CC07CFF6FFF6FFF6F3F673F673F673F673F673F673F679331
      0000FF7F03760376237E237E237E107F237A237A237A237A237A237AFF7FFF7F
      107FC369C369C365C365C3658355FF7FFF7F0000717AE879B57F327F673E4A7E
      A67D017DA07C2054B46E00000000000000000000000000000000000000000000
      000000009652DF7BDF7BDF7BDF7BDF7BBF77BF77BF77BF77BF779F739F739F73
      9F739F7360022002000205167F6FDA5A00000000FF7FFF7FFF7FFF7FC07CC07C
      C07CC07CFF6FC07CC07CC07CFF6FFF6FFF6F3F6760026002000200023F679331
      0000FF7F237E237E447E447E447E237E237E237E237A037A037A037603760376
      FF7F107F107FC365C365C3658355FF7FFF7F0000BC77E474737F737FCE7E2A7E
      857DE07C80700759000000000000000000000000000000000000000000000000
      0000000096525A6B1963F85EDF7BDF7BDF7BBF77BF77BF77BF77BF779F739F73
      9F739F7360064002200245167F6FDA5A00000000FF7F18631863C07CC07CC07C
      C07CFF6FFF6FFF6FC07CC07CC07CFF6FFF6F3F6760026002000260023F679331
      0000FF7F237E237E877E877E877E447E437E437E237E237E237E037603720372
      E36DFF7FFF7F107FC365C3658355FF7FFF7F00000000B37A8675B57FCF7E2A7E
      647DC07C00501773000000000000000000000000000000000000000000000000
      0000000096525A6B39670000DF7BDF7BDF7BBF77BF77BF77BF77BF779F739F73
      9F739F73A212810A600685167F6FDA5A00000000FF7FFF7FFF7FC07CC07CC07C
      FF7FFF7FFF6FFF6FFF6FFF6FC07CC07CFF6F3F6760026002600260023F679331
      0000FF7F237E237E877E877E877E447E437E437E237E237E237E037603720372
      E36DFF7FFF7F107FC365C3658355FF7FFF7F00000000BC77E670527F107F2A7E
      227D606C6A5D0000000000000000000000000000000000000000000000000000
      000000009652FF7FFF7FFF7FDF7BDF7BDF7BDF7BBF77BF77BF77BF779F739F73
      9F739F73C31AA216A10EA61E7F6FDA5A00000000FF7FC07CC07CC07CC07CFF7F
      FF7FFF7FFF6FFF6FFF6FFF6FFF6FFF6FC07C3F6726336002600226333F679331
      0000FF7F447E447EAA7EA97EA97E657E447E447E447E437E437E237A03760376
      0372E36DE36DFF7FC365C3658355FF7FFF7F000000000000D57A2571737F097E
      E07C215059770000000000000000000000000000000000000000000000000000
      0000000096525A6B39670000D65AD65ADF7BDF7BDF7BBF77BF77BF77BF779F73
      9F739F730833E82EE72AEB327F6FDA5A00000000C07CC07CC07CC07C18631863
      FF7FFF7FFF7FFF6FFF6FFF6FFF6FFF6FFF6FFF6F26332633263326333F679331
      0000FF7F877E877EED7EAA7EAA7E877E667E667E657E657E657E447E237E237E
      037A03760376E36DC365C3658355FF7FFF7F00000000000000000771CF7A097E
      6068CE6100000000000000000000000000000000000000000000000000000000
      000000009652965296529652965296529652965296529652754E754E754E554A
      544A3446344614421442F33DF33DF33D00000000C07CC07CC07CFF7FFF7FFF7F
      FF7FFF7FFF7FFF6FFF6FFF6FFF6FFF6FFF6FFF6F3F673F673F673F673F679331
      0000FF7F877E877EED7EAA7EAA7E877E667E667E657E657E657E447E237E237E
      037A03760376E36DC365C3658355FF7FFF7F00000000000000001777E368087E
      42549B7700000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7FA97EA97E107FED7EED7EAA7EA97EA97E877E667E667E657E447E447E
      437E237A237A0376C365C365634DFF7FFF7F00000000000000000000696D8160
      316A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F757F757FA97E667E667E447E237E237E237E237A237A237A03760376
      0372E36DE36DC365A35DA35DCC7EFF7FFF7F000000000000000000003877E660
      BC77000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF7F757F757FA97E667E667E447E237E237E237E237A237A237A03760376
      0372E36DE36DC365A35DA35DCC7EFF7FFF7F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000F53D164216421642
      1642164216421642164216421642164216421642164216421642164216420000
      000000000000D5355329332553293325D439D65AD65AD65AD75AD75AD65AD65A
      D65AD65AD439122133253325332533250000000000000000F53D164216421642
      1642164216421642164216421642164216421642164216421642164216420000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000F53D7D639E637E5F
      7E5B5E5B5D575E533D4F3D4F3D4B3D4B3D4B3D4B3D4B3D4B3D4B3D4B363E0000
      00000000163AB8359831983199315629B335D65A39679C6FBD77DE77DE779D73
      7C6F7B6FD639B214D218F31C772D98313325000000000000D5417D639E637E5F
      7E5B5E5B5E575E533D4F3D4F3D4B3D4B3D4B3D4B3D4B3D4B3D4B3D4B16420000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000C06CC06C0000000000000000F53D7D639E637E63
      7E5F37475C535C533D533D4F3D4F3D4B3D4B3D4B3D4B3D4B3D4B3D4B363E0000
      00000000163AB835993199319931772DB33534461642B9563B67DE77FF7BDE7B
      BD739C73D639B214D218F31C782D98313325000000000000D5417D639E637E63
      7E5F5E5B5E575E573D533D4F3D4F3D4B3D4B3D4B3D4B3D4B3D4B3D4B16420000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C06CC06CC06C0000000000000000F53D7E679E677E63
      7E63594F60025C53CD2687168716CD26183F3C4B3D4B3D4B3D4B3D4B363E0000
      00000000163AB835993199319931772DD339F43DF31CD635784E9D73DE7BDF7B
      DE77BD77F73DB214D218F31C782D98313325000000000000D5417E679E677E63
      7E637E5F5E5B5E575E573D533D4F3D4F3D4B3D4B3D4B3D4B3D4B3D4B16420000
      000000000000C06CC06CC06C0000000000000000000000000000000000000000
      0000000000000000C06CC06CC06C00000000000000000000F53D9D679E6B9E67
      7E637D5B6002620A60026002600260026002F22E3C4B3D4B3D4B3D4B363E0000
      00000000163AB835993199319931772DD4391442D2181321D6397B6BBD77DE7B
      DF7BDE7BF73DB214D218F31C782D98313325000000000000D5419E679E6B9E67
      7E637E5F7E5F5E5B5E575E573D533D4F3D4F3D4B3D4B3D4B3D4B3D4B16420000
      000000000000C06CC06CC06CC06C000000000000000000000000000000000000
      00000000C06CC06CC06CC06C000000000000000000000000F53D9E6BBE6F9E6B
      9E677D5F60026002600260026002600260026002183F3D4B3D4B3D4B363E0000
      00000000163AB835993199319931772DD4393546D218D218332518639C6FBD77
      DF7BFF7FF83DB214D218F31C782D98313325000000000000D5419E6BBE6F9E6B
      9E677E637E637E5F5E5B5E575E573D533D4F3D4F3D4B3D4B3D4B3D4B16420000
      000000000000C06CC06CC06CC06CC06C00000000000000000000000000000000
      0000C06CC06CC06CC06C0000000000000000000000000000153E9E6FBE6F9E6B
      9E677C63600260026002A71A38473847CD26600287163D4B3D4B3D4B363E0000
      00000000163AB8359931993199315629F53D3646B214B214D218955239679C6F
      BE77FF7F1842B214D218F31C782D98313325000000000000F5419E6FBE6F9E6B
      9E679E677E637E637E5F5E5B5E575E573D533D4F3D4F3D4B3D4B3D4B16420000
      0000000000000000C06CC06CC06CC06CC06C0000000000000000000000000000
      C06CC06CC06CC06C00000000000000000000000000000000153EBE73BE73BE6F
      9E6B9D6360026002600286125C575C535C53143B62063D4F3D4B3D4B363E0000
      00000000163AB8359931993199315629F53DB856943194319331734ED65A5A6B
      BD77FF7F1842B214D218F31C772D98313325000000000000F641BE73BE73BE6F
      9E6B9E679E677E637E5F7E5F5E5B5E575E573D533D4F3D4F3D4B3D4B16420000
      00000000000000000000C07CC06CC06CC06CC06C00000000000000000000C06C
      C06CC06CC06C000000000000000000000000000000000000363EBE73DF77BE73
      BE6F9D67600260026002600260025C575D575D573D532F3F3D4F3D4B363E0000
      00000000163AB835993199319931772DD6399A52784E774E574A35463546784E
      BA561C63D8391421152135259831983133250000000000001642BE73DF77BE73
      BE6F9E6B9E6B9E677E637E5F7E5F5E5B5E575E573D533D4F3D4F3D4B16420000
      0000000000000000000000000000C06CC06CC06CC06C00000000C06CC06CC06C
      C06CC06C00000000000000000000000000000000000000003642BE77DF77BE73
      BE739D679D677C637C637D5F7D5B5C575E5B5D575D572F3F3D4F3D4B363E0000
      00000000163AB835993199319931993199319931993199319931993199319831
      9831983199319931993199319931983133250000000000001742BE77DF77BE73
      BE73BE6F9E6B9E679E677E637E5F7E5F5E5B5E575E573D533D4F3D4B16420000
      00000000000000000000000000000000C06CC06CC06CC06CC06CC06CC06CC06C
      C06C000000000000000000000000000000000000000000003742DF7BFF7BDF77
      2F3FBE73BE6F9E6B9D637C637D5F7D5B5C575C575C535D573D533D4F363E0000
      00000000163AB8359831772D9831B835D939D939D939D939D939D939D939D939
      D939D939D939D939F93DB9359931983133250000000000001746DF7BFF7BDF77
      BE73BE73BE6F9E6B9E679E677E637E637E5F5E5B5E575E573D533D4F16420000
      000000000000000000000000000000000000C06CC06CC07CC06CC07CC06CC06C
      0000000000000000000000000000000000000000000000005742DF7BFF7FDF7B
      2F3FBE73BE73BE6F9D67600260026002600260025C575D575D573D53363E0000
      00000000163AB83535253421B6353846B956FA5EFA5EFA5EFA5EFA5EFA5EFA5E
      FA5EFA5EFA5EFA5E1B6339469931983133250000000000003846DF7BFF7FDF7B
      DF77BE73BE73BE6F9E6B9E679E677E637E5F7E5F5E5B5E575E573D5316420000
      0000000000000000000000000000000000000000C06CC06CC06CC07CC06C0000
      0000000000000000000000000000000000000000000000005842DF7BFF7FFF7F
      DF7B620A5553BD6B9D679D67A6166002600260025C575E5B5D573D53363E0000
      00000000163AB8351521794EDE77BE77BE77BE77BE77BE77BE77BE77BE77BE77
      BE77BE77BE77BE779D733946782D983133250000000000003846DF7BFF7FFF7F
      DF7BDF77BE73BE73BE6F9E6B9E679E677E637E5F7E5F5E5B5E573D5316420000
      000000000000000000000000000000000000C06CC06CC07CC06CC06CC07CC07C
      0000000000000000000000000000000000000000000000007842DF7BFF7FFF7F
      FF7FA71E60020E37795B795BA71E6002600260027D5B7E5F5E5B5D57363E0000
      00000000163AB83515219952FF7FDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7BDE7B
      DE7BDE7BDE7BDF7B9D733946772D983133250000000000003846DF7BFF7FFF7F
      FF7FDF7BDF77BE73BE73BE6F9E6B9E679E677E637E5F7E5F5E5B5E5716420000
      00000000000000000000000000000000C06CC06CC07CC06CC07CC07CC07CC06C
      C07C000000000000000000000000000000000000000000007842DF7BFF7FFF7F
      FF7FB967600260026002600260026002600260027D5F7E5F7D5F1B53133E0000
      00000000163AB83515219952FF7FBE77BE77BE77BE77BE77BE77BE77BE77BE77
      BE77BE77BE77DE7B9D733946772D983133250000000000005946DF7BFF7FFF7F
      FF7FFF7FDF7BDF77BE73BE73BE6F9E6B9E679E677E637E5F7E5F1B53F4410000
      0000000000000000000000000000C07CC07CC07CC06CC07C00000000C07CC07C
      C07CC07C00000000000000000000000000000000000000007946DF7BFF7FFF7F
      FF7FFE7B734F60026002600260026002620A60027C637D5FF956B64A133E0000
      00000000163AB83515219952FF7F9C7319633967396739673967396739673967
      3967396718637C6F9D733946772D983133250000000000005946DF7BFF7FFF7F
      FF7FFF7FFF7FDF7BDF77BE73BE73BE6F9E6B9E679E675D5FF956B64AF3410000
      000000000000000000000000C07CC07CC06CC07CC07C0000000000000000C07C
      C07CC07CC07C0000000000000000000000000000000000009946DF7BFF7FFF7F
      FF7FFF7FFE7BB9670E37A71EA71E0E339D6760025857F956D752B64E133E0000
      00000000163AB83515219952FF7FBE779D739D739D739D739D739D739D739D73
      9D739D739D73BE779D733946772D983133250000000000007A4ADF7BFF7FFF7F
      FF7FFF7FFF7FFF7FDF7BDF77BE73BE6FBE6FBE6F7C67F956D752B64EF3410000
      00000000000000000000C07CC07CC07CC07CC07C000000000000000000000000
      0000C07CC07CC07C000000000000000000000000000000009A46DF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FDF7BDF77DF737C63153A102EF539F539F539153A0000
      00000000163AB83515219952FF7F9D733A673A673A673A673A673A673A673A67
      3A673A6739679C739D733946772D983133250000000000007A4ADF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FDF7BDF77DF737D6B163A153AF539F539F539F5390000
      0000000000000000C07CC07CC07CC07CC07C0000000000000000000000000000
      00000000C07CC07CC07C0000000000000000000000000000BB46DF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7BDF7BDF773C63163ADC42BC369D2A9D1E16420000
      00000000163AB83515219952FF7FBD737C6F7C6F7C6F7C6F7C6F7C6F7C6F7C6F
      7C6F7C6F7C6FBD779D733946772D983133250000000000009B4ADF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7BDF7BDF773C63163ADC42BC369D2A9D1E16420000
      000000000000C07CC07CC07CC07CC07C00000000000000000000000000000000
      0000000000000000C07C0000000000000000000000000000BB46DF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7B3C63163A1D47FE36DF2A164200000000
      00000000163AB83515219952FF7FBD737C6F7C6F7C6F7C6F7C6F7C6F7C6F7C6F
      7C6F7C6F7C6FBD779D733946772D983133250000000000009B4ADF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7B3C63163A1D47FE36DF2A164200000000
      00000000C07CC07CC07CC07CC07C000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BB46DF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5C67163A1D47FE361642000000000000
      00000000163AB83515219952FF7F9C7339673A673A673A673A673A673A673A67
      3A673A6739679C739D733946772D983133250000000000009B4ADF7BFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5C67163A1D47FE361642000000000000
      00000000C07CC07CC07CC07C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000BB46FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5C6B163A1D4716420000000000000000
      00000000163AB83515219952FF7FDF7BDF7BDF7BDF7BDF7BDF7BDF7BDF7BDF7B
      DF7BDF7BDF7BDF7B9D733946782D983133250000000000009B4AFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5C6B163A1D4716420000000000000000
      00000000C07CC07CC07C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009B429B429B429B42
      9B429B429B429B429B429B429B429B429B42163A164200000000000000000000
      00000000163AB7351521794EBD779D739D739D739D739D739D739D739D739D73
      9D739D739D73BD737C6F38465629772D33250000000000009B463C5F5D5F5D5F
      3D633C5F3C5F3C5F3C5F1B5F1B5F1B5FB952163A164200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D535142136423867186318631863186318631863186318631863
      1863186318631863196316421221332500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000800003FFFFFF000000000000800003FF
      FFFF000000000000000000FC3E1F000000000000000000F00807000000000000
      000000F00807000000000000000000F3C9E7000000000000000000F1C9C70000
      00000000000000F1C9C7000000000000000000F00807000000000000000000FC
      001F000000000000000000FC001F000000000000000000FFC1FF000000000000
      000000FF80FF000000000000000000FF80FF000000000000000000FE083F0000
      00000000000000FC3E1F000000000000000000FC3E1F000000000000000000F0
      7F07000000000000000000F1FFC7000000000000000000F1FFC7000000000000
      000000F3FFE7000000000000000000FFFFFF000000000000000000FFFFFF0000
      00000000800003FFFFFF000000000000FFFFFFFFFFFFFFFFFF800003FFFE0FFF
      FFFFFFFFFF800003FFF007FFFFFFFFFFFF000000FFE003FFFFFFFFFFFF000000
      F00001800001800001000000F00001800001800001000000F000018000018000
      01000000E00001800001800001000000E00001800001800001000000E0000180
      0001800001000000E08001800001800001000000C01001800001800001000000
      800803800001800001000000800E3F800001800001000000800FFF8000018000
      01000000801FFF800001800001000000C01FFF880001800001000000C03FFF80
      0001800001000000E03FFF880001800001000000F07FFF800001800001000000
      F07FFFFFFFFFFFFFFF000000F8FFFFFFFFFFFFFFFF000000F8FFFFFFFFFFFFFF
      FF000000FFFFFFFFFFFFFFFFFF800003E00003C00001E00003FFFFFFE0000380
      0000E00003FFFFF9E00003800000E00003FFFFF1E00003800000E00003C7FFE3
      E00003800000E00003C3FF87E00003800000E00003C1FF0FE00003800000E000
      03E0FE1FE00003800000E00003F07C3FE00003800000E00003FC307FE0000380
      0000E00003FE00FFE00003800000E00003FF01FFE00003800000E00003FF83FF
      E00003800000E00003FF01FFE00003800000E00003FE00FFE00003800000E000
      03FC187FE00003800000E00003F83C3FE00003800000E00003F07F1FE0000380
      0000E00003E0FF8FE00003800000E00003C1FFEFE00007800000E0000783FFFF
      E0000F800000E0000F87FFFFE0001F800000E0001F8FFFFFE0003F800000E000
      3FFFFFFFFFFFFFC00001FFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 127
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = btnNew
            Visible = True
          end
          item
            Item = btnSave
            Visible = True
          end
          item
            Item = btnRefresh
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnDelete
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnStateTransit
            Visible = True
          end
          item
            Item = dxBarPrint
            Visible = True
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        Caption = #1057#1087#1080#1089#1072#1085#1080#1103' '#1089' '#1085#1077' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084#1080' '#1050#1041#1050
        DockControl = dxBarDockControloldkbk
        DockedDockControl = dxBarDockControloldkbk
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 127
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = dxBarButtonExcludeDeduct_OldKBK
            Visible = True
          end>
        Name = 'oldkbk'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarButton1: TdxBarButton
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Category = 0
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1089#1077' '#1087#1083#1072#1090#1077#1078#1080
      Visible = ivAlways
    end
    object dxBarPrint: TdxBarButton
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Category = 0
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      Visible = ivAlways
      OnClick = dxBarPrintClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSubItemExcludeDeduct_oldkbk: TdxBarSubItem
      Caption = #1048#1089#1082#1083#1102#1089#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButtonExcludeDeduct_OldKBK: TdxBarButton
      Action = actExcludeDeduct_old_kbk
      Category = 0
      Description = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1080#1079' '#1088#1077#1077#1089#1090#1088#1072
    end
  end
  inherited ParamsHolder: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        AcceptedSources = []
      end
      item
        DataType = ftUnknown
        Name = 'DECL_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end
      item
        DataType = ftBoolean
        Name = 'OWN_PACK'
        ParamType = ptUnknown
        AcceptedSources = [asParam]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      '         ,fdc_skindpay_get_total_summa(t.id) total_summa'
      '         ,sl.sysname state_sysname'
      'from fdc_reestr_specify_kindpay_lst t'
      '      ,fdc_state_lst sl'
      'where t.ID = :ID'
      '  and t.state_id = sl.id'
      '  and fdc_gr_select_budget = 1')
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      ReadOnly = True
    end
    object dsDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      FieldName = 'ACTIVATION_DATE'
    end
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
    object dsDataDATE_INPUT: TDateTimeField
      FieldName = 'DATE_INPUT'
      ReadOnly = True
    end
    object dsDataDATE_SEND: TDateTimeField
      FieldName = 'DATE_SEND'
      ReadOnly = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
    end
    object dsDataCURRENCY: TStringField
      FieldName = 'CURRENCY'
      ReadOnly = True
      Size = 1500
    end
    object dsDataDATE_CONFIRM: TDateTimeField
      FieldName = 'DATE_CONFIRM'
      ReadOnly = True
    end
    object dsDataTOTAL_SUMMA: TFloatField
      FieldName = 'TOTAL_SUMMA'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataSENDER_SOFT_CODE_ID: TFloatField
      FieldName = 'SENDER_SOFT_CODE_ID'
    end
    object dsDataSENDER_SOFT_NAME: TStringField
      FieldName = 'SENDER_SOFT_NAME'
      Size = 1500
    end
    object dsDataSENDER_SOFT_CODE: TStringField
      FieldName = 'SENDER_SOFT_CODE'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE_ID: TFloatField
      FieldName = 'RECEIVER_SOFT_CODE_ID'
    end
    object dsDataRECEIVER_SOFT_NAME: TStringField
      FieldName = 'RECEIVER_SOFT_NAME'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE: TStringField
      FieldName = 'RECEIVER_SOFT_CODE'
      Size = 1500
    end
    object dsDataIS_RECIEVED: TStringField
      FieldName = 'IS_RECIEVED'
      Size = 1
    end
    object dsDataRECIEVE_DATE: TDateTimeField
      FieldName = 'RECIEVE_DATE'
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
    object dsDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 2
    end
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  p_document.Modify'
      '   ('
      '                     pDocID     => :ID'
      '                    ,pDocNumber => :DOC_NUMBER'
      '                    ,pDocDate   => :DOC_DATE'
      '                    ,pName      => null'
      '                    ,pDescript  => :DESCRIPT'
      '   );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select stl.ID,'
      '       stl.NAME,'
      '       stl.DESCRIPT'
      '  from fdc_State_Transit_Lst stl'
      '      ,fdc_object_lst ol'
      'where stl.id = ol.id'
      '  and stl.State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (stl.SRC_STATE_ID is null and :ID is null) or'
      '         (stl.SRC_STATE_ID = :ID)'
      '       )'
      '  and ol.sysname in ('
      
        '                     '#39'StateTransit.PackSpecifyKindPay.Create->Fo' +
        'rmed'#39
      
        '                    ,'#39'StateTransit.PackSpecifyKindPay.Formed->Cr' +
        'eate'#39
      
        '                    ,'#39'StateTransit.PackSpecifyKindPay.Formed->Ge' +
        'nerated'#39
      
        '                    ,'#39'StateTransit.PackSpecifyKindPay.Generated-' +
        '>Formed'#39
      '                    )')
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 43
    Top = 20
    object sqlRemove_deduct_from_reestr: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_reestr_specifykindpay.remove_deduct_from_reestr'
        '   ('
        '     preestrid    => :preestrid'
        '    ,pdeductionid => :pdeductionid'
        '   );'
        'end;')
    end
    object sqlChangeKBKinDeduction: TsqlOp
      SQL.Strings = (
        'begin'
        '  p_reestr_specifykindpay.change_deduct_kbk_target'
        '   ('
        '     preestrid    => :preestrid'
        '    ,pdeductionid => :pdeductionid'
        '    ,pkbkid       => :pkbkid'
        '   );'
        'end;')
    end
  end
  object srcSumByKBK: TDataSource
    AutoEdit = False
    DataSet = dsSumByKBK
    Left = 19
    Top = 188
  end
  object dlgExportData: TSaveDialog
    DefaultExt = 'html'
    Filter = 
      #1044#1086#1082#1091#1084#1077#1085#1090' HTML|*.html|'#1044#1086#1082#1091#1084#1077#1085#1090' XML|*.xml|'#1050#1085#1080#1075#1072' Excel|*.xls|'#1058#1077#1082#1089#1090#1086 +
      #1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|*.txt'
    FilterIndex = 0
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1057#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1076#1072#1085#1085#1099#1093
    Left = 168
    Top = 99
  end
  object pmnGrid: TPopupMenu
    Left = 163
    Top = 196
    object N1: TMenuItem
      Action = actSaveToFile
    end
  end
  object srcNoticeData: TDataSource
    DataSet = dsNoticeData
    Left = 8
    Top = 80
  end
  object dsNoticeData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select '
      '       nkl.id'
      '      ,nkl.typename'
      '      ,nkl.typesysname'
      '      ,nkl.object_type_id'
      '      ,nkl.name'
      '      ,nkl.descript'
      '      ,nkl.doc_date'
      '      ,nkl.doc_number'
      '      ,nkl.kbk_code_s'
      '      ,nkl.kbk_code_t'
      '      ,nkl.currency_code'
      '      ,nkl.summa'
      '      ,nkl.direction'
      '      ,nkl.ext_source'
      '      ,nkl.ext_typesysname'
      '      ,nkl.ext_id'
      '      ,nkl.is_ts'
      'from fdc_rel_reestr_skindpay_lst rnl'
      '    ,fdc_bud_specify_kindpay_lst   nkl'
      'where rnl.object_id = :pid'
      '  and rnl.rel_object_id = nkl.id'
      '  and nvl(nkl.direction,'#39' '#39')=nvl(:pdirection,'#39' '#39')')
    Left = 8
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pid'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pdirection'
        ParamType = ptUnknown
        Size = 2
      end>
    object dsNoticeDataID: TFloatField
      FieldName = 'ID'
    end
    object dsNoticeDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsNoticeDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsNoticeDataOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsNoticeDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsNoticeDataDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsNoticeDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsNoticeDataDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsNoticeDataKBK_CODE_S: TStringField
      FieldName = 'KBK_CODE_S'
      Size = 1500
    end
    object dsNoticeDataKBK_CODE_T: TStringField
      FieldName = 'KBK_CODE_T'
      Size = 1500
    end
    object dsNoticeDataCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
    object dsNoticeDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsNoticeDataDIRECTION: TStringField
      FieldName = 'DIRECTION'
      Size = 2
    end
    object dsNoticeDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsNoticeDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsNoticeDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsNoticeDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 2
    end
  end
  object dsDeductionData: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select x.id'
      '      ,x.name'
      '      ,x.shortname'
      '      ,x.object_type_id'
      '      ,x.state_id'
      '      ,x.accesslevel'
      '      ,x.sysname'
      '      ,x.descript'
      '      ,x.owner_object_id'
      '      ,x.typename'
      '      ,x.typesysname'
      '      ,x.objectkindlist'
      '      ,x.payment_id'
      '      ,x.pay_type_id'
      '      ,x.summa'
      '      ,x.decl_id'
      '      ,x.payer_id'
      '      ,x.doc_name'
      '      ,x.doc_no'
      '      ,x.doc_date'
      '      ,x.doc_summa'
      '      ,x.payer_inn'
      '      ,x.payer_name'
      '      ,x.payment_code'
      '      ,x.payment_name'
      '      ,x.curr_code'
      '      ,x.curr_name'
      '      ,x.payment_date'
      '      ,x.payment_month'
      '      ,x.charge_curr_id'
      '      ,x.charge_summa'
      '      ,x.acc_date'
      '      ,x.kbkcode'
      '      ,x.kbkcode_source'
      '      ,x.operation_date'
      '      ,x.is_active'
      '      ,x.budget_id'
      '      ,x.decl_goods'
      '      ,x.doc_rest'
      '      ,x.decl_name'
      '      ,x.decl_inn'
      '      ,x.decl_kpp'
      '      ,x.is_archive'
      
        '      ,sum(x.summa) over(partition by x.payment_id, x.decl_id) a' +
        'gg_summa'
      '      ,min(x.id) over(partition by x.payment_id) - x.id key_p'
      '      ,x.direction'
      '      ,x.is_ts'
      '  from (select rsdl.*'
      '          from fdc_reestr_skindpay_deduct_lst rsdl'
      '         where rsdl.reestr_id = :pid'
      '       ) x'
      '')
    Left = 104
    Top = 48
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pid'
        ParamType = ptInput
      end>
    object dsDeductionDataID: TFloatField
      FieldName = 'ID'
    end
    object dsDeductionDataNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDeductionDataSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsDeductionDataOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsDeductionDataSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsDeductionDataACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsDeductionDataSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsDeductionDataDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsDeductionDataOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsDeductionDataTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDeductionDataTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDeductionDataOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object dsDeductionDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDeductionDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDeductionDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDeductionDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDeductionDataDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 1500
    end
    object dsDeductionDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 100
    end
    object dsDeductionDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDeductionDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDeductionDataPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDeductionDataPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDeductionDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDeductionDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDeductionDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDeductionDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDeductionDataPAYMENT_MONTH: TDateTimeField
      FieldName = 'PAYMENT_MONTH'
    end
    object dsDeductionDataCHARGE_CURR_ID: TFloatField
      FieldName = 'CHARGE_CURR_ID'
    end
    object dsDeductionDataCHARGE_SUMMA: TFloatField
      FieldName = 'CHARGE_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataACC_DATE: TDateTimeField
      FieldName = 'ACC_DATE'
    end
    object dsDeductionDataKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDeductionDataKBKCODE_SOURCE: TStringField
      FieldName = 'KBKCODE_SOURCE'
      Size = 1500
    end
    object dsDeductionDataOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
    object dsDeductionDataIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDeductionDataBUDGET_ID: TFloatField
      FieldName = 'BUDGET_ID'
    end
    object dsDeductionDataDECL_GOODS: TStringField
      FieldName = 'DECL_GOODS'
      Size = 4000
    end
    object dsDeductionDataDOC_REST: TFloatField
      FieldName = 'DOC_REST'
    end
    object dsDeductionDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDeductionDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDeductionDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDeductionDataIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      Size = 1
    end
    object dsDeductionDataAGG_SUMMA: TFloatField
      FieldName = 'AGG_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataKEY_P: TFloatField
      FieldName = 'KEY_P'
    end
    object dsDeductionDataDIRECTION: TStringField
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'DIRECTION'
      Size = 2
    end
    object dsDeductionDataIS_TS: TStringField
      FieldName = 'IS_TS'
      Size = 2
    end
  end
  object srcDeductionData: TDataSource
    DataSet = dsDeductionData
    Left = 152
    Top = 48
  end
  object dsSumByKBK: TfdcQuery
    Session = MainData.Session
    ReadOnly = True
    SQL.Strings = (
      'with kbk_sum as ('
      'select '
      '      sum(summa) summa'
      '     ,kbk_source'
      '     ,kbk_target'
      '     ,currency'
      'from (    '
      '     select '
      '            nkl.kbk_code_s kbk_source'
      '           ,nkl.kbk_code_t kbk_target'
      '           ,nkl.currency_code currency'
      '           ,nkl.summa'
      '     from fdc_rel_reestr_skindpay_lst rnl'
      '         ,fdc_bud_specify_kindpay_lst   nkl'
      '     where rnl.object_id = :pid'
      '       and rnl.rel_object_id = nkl.id'
      '     )'
      'group by kbk_source, kbk_target, currency'
      ') '
      
        'select (case when (kbk_source = kbk_target) then summa else abs(' +
        'summa) end) summa'
      
        '      ,(case when (summa < 0) then kbk_target else kbk_source en' +
        'd) kbk_source'
      
        '      ,(case when (summa < 0) then kbk_source else kbk_target en' +
        'd) kbk_target'
      '      ,currency'
      'from (select'
      '              k1.summa '
      '             ,k1.kbk_source'
      '             ,k1.kbk_target'
      '             ,k1.currency      '
      
        '       from (select * from kbk_sum k where not exists(select 1 f' +
        'rom kbk_sum kr where k.kbk_target = kr.kbk_source and k.kbk_sour' +
        'ce = kr.kbk_target and kr.kbk_source!=kr.kbk_source)) k1'
      '           ,kbk_sum k2'
      '       where k1.kbk_source=k2.kbk_target(+)'
      '         and k1.kbk_target=k2.kbk_source(+)'
      '      )'
      'where (summa > 0)'
      '   or (summa < 0)')
    Left = 80
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptUnknown
      end>
  end
  object cxNoticeGridPopupMenu: TcxGridPopupMenu
    Grid = grdNoticeData
    PopupMenus = <>
    Left = 424
    Top = 160
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = grdData
    PopupMenus = <
      item
        GridView = grdDataDBBandedTableView
        HitTypes = [gvhtCell, gvhtRecord]
        Index = 0
        PopupMenu = pmnGrid
      end>
    Left = 456
    Top = 160
  end
  object xlrNoticeKindPay: TxlReport
    DataExportMode = xdmDDE
    Options = [xroDisplayAlerts, xroAutoOpen, xroRefreshParams]
    DataSources = <
      item
        DataSet = dsHeader
        Alias = 'aHeader'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end
      item
        DataSet = dsBody
        Alias = 'aBody'
        Range = 'rngBody'
        Options = [xrgoAutoOpen, xrgoPreserveRowHeight]
        Tag = 0
      end>
    Preview = False
    Params = <>
    Left = 472
    Top = 14
  end
  object dsBody: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select bskl.doc_number'
      '      ,bskl.doc_date'
      '      ,bskl.kbk_code_s'
      '      ,bskl.summa      summa_s'
      '      ,bskl.kbk_code_t'
      '      ,bskl.summa      summa_t'
      'from fdc_reestr_specify_kindpay_lst rskl'
      '    ,fdc_rel_reestr_skindpay_lst    rel'
      '    ,fdc_bud_specify_kindpay_lst    bskl'
      'where rskl.id = :reestr_id'
      '  and rskl.id = rel.object_id'
      '  and rel.rel_object_id = bskl.id'
      'order by 1')
    Left = 424
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'reestr_id'
        ParamType = ptUnknown
      end>
  end
  object dsHeader: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  (case :reestr_type'
      
        '    when '#39'ReestrNoticeSpecifyKindPayCorr'#39' then '#39#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076 +
        #1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1088#1080' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1077#39
      
        '    when '#39'ReestrConfirmSpecifyKindPay'#39' then '#39#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1090#1077 +
        #1078#1072#39
      
        '    else '#39#1086#1073' '#1091#1090#1086#1095#1085#1077#1085#1080#1080' '#1074#1080#1076#1072' '#1080' '#1087#1088#1080#1085#1072#1076#1083#1077#1078#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1072#39' --'#39'ReestrN' +
        'oticeSpecifyKindPay'#39
      '  end) reestr_name'
      ' ,'#39#1056#1045#1045#1057#1058#1056' '#39' ||'
      ' (case :reestr_type'
      '    when '#39'ReestrConfirmSpecifyKindPay'#39' then '#39#1055#1054#1044#1058#1042#1045#1056#1046#1044#1045#1053#1048#1049#39
      
        '    else '#39#1059#1042#1045#1044#1054#1052#1051#1045#1053#1048#1049#39' --'#39'ReestrNoticeSpecifyKindPay'#39','#39'ReestrNot' +
        'iceSpecifyKindPayCorr'#39
      '  end) ||'
      '  '#39' '#8470' '#39'|| :reestr_number reestr_number'
      
        ' ,'#39'"'#39' || to_char(:begin_date,'#39'dd'#39') || '#39'" '#39' || to_char(:begin_dat' +
        'e,'#39'monthyyyy'#39','
      #39'NLS_DATE_LANGUAGE=RUSSIAN'#39') || '#39' '#1075'.'#39' as date_from'
      
        ' ,(select name from fdc_customs_lst where customs_code_8 = :cust' +
        'om_code and rownum = 1) as custom_name'
      'from dual')
    Left = 368
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reestr_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reestr_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'begin_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'custom_code'
        ParamType = ptUnknown
      end>
  end
  object dsDeductionDataOldKBK: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    ReadOnly = True
    SQL.Strings = (
      'select res.*'
      'from '
      '('
      'select x.*'
      
        '      ,sum(x.summa) over(partition by x.payment_id, x.decl_id) a' +
        'gg_summa'
      '      ,min(x.id) over(partition by x.payment_id) - x.id key_p'
      
        '      ,(case when (p_nsi_kbk.getidbycode(kbkcode) is null) then ' +
        '1 else 0 end) old_kbk_sign'
      '  from (select rsdl.id'
      '              ,rsdl.name'
      '              ,rsdl.shortname'
      '              ,rsdl.object_type_id'
      '              ,rsdl.state_id'
      '              ,rsdl.accesslevel'
      '              ,rsdl.sysname'
      '              ,rsdl.descript'
      '              ,rsdl.owner_object_id'
      '              ,rsdl.typename'
      '              ,rsdl.typesysname'
      '              ,rsdl.objectkindlist'
      '              ,rsdl.payment_id'
      '              ,rsdl.pay_type_id'
      '              ,rsdl.summa'
      '              ,rsdl.decl_id'
      '              ,rsdl.payer_id'
      '              ,rsdl.doc_name'
      '              ,rsdl.doc_no'
      '              ,rsdl.doc_date'
      '              ,rsdl.doc_summa'
      '              ,rsdl.payer_inn'
      '              ,rsdl.payer_name'
      '              ,rsdl.payment_code'
      '              ,rsdl.payment_name'
      '              ,rsdl.curr_code'
      '              ,rsdl.curr_name'
      '              ,rsdl.payment_date'
      '              ,rsdl.payment_month'
      '              ,rsdl.charge_curr_id'
      '              ,rsdl.charge_summa'
      '              ,rsdl.acc_date'
      '              ,rsdl.kbkcode'
      '              ,rsdl.kbkcode_source'
      '              ,rsdl.operation_date'
      '              ,rsdl.is_active'
      '              ,rsdl. budget_id'
      '              ,rsdl.decl_goods'
      '              ,rsdl.doc_rest'
      '              ,rsdl.decl_name'
      '              ,rsdl.decl_inn'
      '              ,rsdl.decl_kpp'
      '              ,rsdl.is_archive'
      '              ,rsdl.direction'
      '          from fdc_reestr_skindpay_deduct_lst rsdl'
      '         where rsdl.reestr_id = :pid'
      '       ) x'
      ') res'
      'where old_kbk_sign = 1')
    AfterOpen = dsDeductionDataOldKBKAfterOpen
    AfterClose = dsDeductionDataOldKBKAfterClose
    Left = 88
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pid'
        ParamType = ptInput
      end>
    object dsDeductionDataOldKBKID: TFloatField
      FieldName = 'ID'
    end
    object dsDeductionDataOldKBKNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKOBJECT_TYPE_ID: TFloatField
      FieldName = 'OBJECT_TYPE_ID'
    end
    object dsDeductionDataOldKBKSTATE_ID: TFloatField
      FieldName = 'STATE_ID'
    end
    object dsDeductionDataOldKBKACCESSLEVEL: TFloatField
      FieldName = 'ACCESSLEVEL'
    end
    object dsDeductionDataOldKBKSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 1500
    end
    object dsDeductionDataOldKBKOWNER_OBJECT_ID: TFloatField
      FieldName = 'OWNER_OBJECT_ID'
    end
    object dsDeductionDataOldKBKTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKTYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKOBJECTKINDLIST: TStringField
      FieldName = 'OBJECTKINDLIST'
      Size = 4000
    end
    object dsDeductionDataOldKBKPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDeductionDataOldKBKPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDeductionDataOldKBKSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataOldKBKDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDeductionDataOldKBKPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDeductionDataOldKBKDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 100
    end
    object dsDeductionDataOldKBKDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDeductionDataOldKBKDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataOldKBKPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDeductionDataOldKBKPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDeductionDataOldKBKPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDeductionDataOldKBKCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDeductionDataOldKBKPAYMENT_MONTH: TDateTimeField
      FieldName = 'PAYMENT_MONTH'
    end
    object dsDeductionDataOldKBKCHARGE_CURR_ID: TFloatField
      FieldName = 'CHARGE_CURR_ID'
    end
    object dsDeductionDataOldKBKCHARGE_SUMMA: TFloatField
      FieldName = 'CHARGE_SUMMA'
    end
    object dsDeductionDataOldKBKACC_DATE: TDateTimeField
      FieldName = 'ACC_DATE'
    end
    object dsDeductionDataOldKBKKBKCODE: TStringField
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object dsDeductionDataOldKBKKBKCODE_SOURCE: TStringField
      FieldName = 'KBKCODE_SOURCE'
      Size = 1500
    end
    object dsDeductionDataOldKBKOPERATION_DATE: TDateTimeField
      FieldName = 'OPERATION_DATE'
    end
    object dsDeductionDataOldKBKIS_ACTIVE: TStringField
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDeductionDataOldKBKBUDGET_ID: TFloatField
      FieldName = 'BUDGET_ID'
    end
    object dsDeductionDataOldKBKDECL_GOODS: TStringField
      FieldName = 'DECL_GOODS'
      Size = 4000
    end
    object dsDeductionDataOldKBKDOC_REST: TFloatField
      FieldName = 'DOC_REST'
    end
    object dsDeductionDataOldKBKDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDeductionDataOldKBKDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDeductionDataOldKBKDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDeductionDataOldKBKIS_ARCHIVE: TStringField
      FieldName = 'IS_ARCHIVE'
      Size = 1
    end
    object dsDeductionDataOldKBKAGG_SUMMA: TFloatField
      FieldName = 'AGG_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDeductionDataOldKBKKEY_P: TFloatField
      FieldName = 'KEY_P'
    end
    object dsDeductionDataOldKBKOLD_KBK_SIGN: TFloatField
      FieldName = 'OLD_KBK_SIGN'
    end
    object dsDeductionDataOldKBKDIRECTION: TStringField
      DisplayLabel = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'DIRECTION'
      Size = 2
    end
  end
  object srcDeductionDataOldKBK: TDataSource
    DataSet = dsDeductionDataOldKBK
    Left = 16
    Top = 240
  end
end
