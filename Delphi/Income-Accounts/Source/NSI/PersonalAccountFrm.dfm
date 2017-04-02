inherited PersonalAccountForm: TPersonalAccountForm
  Left = 522
  Top = 241
  Width = 1030
  Height = 496
  Caption = 'PersonalAccountForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 1022
    Height = 469
    ActivePage = tabPart1
    OnChange = pcMainChange
    ClientRectBottom = 445
    ClientRectRight = 1022
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 1016
        Height = 416
        inherited edtName: TcxDBTextEdit
          Left = 142
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 142
          Top = 117
          TabOrder = 4
          Height = 281
          Width = 185
        end
        object edtSubject: TfdcObjectLinkEdit [2]
          Left = 142
          Top = 36
          DataBinding.DataField = 'SUBJECT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Subject'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 368
        end
        object edtSDate: TcxDBDateEdit [3]
          Left = 142
          Top = 63
          DataBinding.DataField = 'SDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 865
        end
        object edtEDate: TcxDBDateEdit [4]
          Left = 142
          Top = 90
          DataBinding.DataField = 'EDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = edtPropertiesChange
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 865
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1053#1086#1084#1077#1088
          end
          object lciSubject: TdxLayoutItem [1]
            Caption = #1042#1083#1072#1076#1077#1083#1077#1094' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSubject
            ControlOptions.ShowBorder = False
          end
          object lciSDate: TdxLayoutItem [2]
            Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1051#1057
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSDate
            ControlOptions.ShowBorder = False
          end
          object lciEDate: TdxLayoutItem [3]
            Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1051#1057
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtEDate
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 1022
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 416
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 442
        Width = 1022
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 1019
        Height = 416
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 1022
        Height = 445
        ClientRectBottom = 421
        ClientRectRight = 1022
      end
    end
    object tabJoin: TcxTabSheet
      Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1085#1099#1077' '#1089#1095#1077#1090#1072
      ImageIndex = 2
      OnShow = tabJoinShow
    end
    object tabPart1: TcxTabSheet
      Caption = #1056#1072#1079#1076#1077#1083' 1. '#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1076#1077#1085#1077#1078#1085#1099#1084' '#1089#1088#1077#1076#1089#1090#1074#1072#1084
      ImageIndex = 3
      object pPart1: TcxPageControl
        Left = 0
        Top = 57
        Width = 1022
        Height = 388
        ActivePage = tabSvodDataPart1
        Align = alClient
        LookAndFeel.Kind = lfStandard
        Style = 5
        TabOrder = 0
        ClientRectBottom = 388
        ClientRectRight = 1022
        ClientRectTop = 24
        object tabBrokerContractPart1: TcxTabSheet
          Caption = #1059#1095#1077#1090' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
          ImageIndex = 7
          OnShow = tabBrokerContractPart1Show
          object cxGrid18: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView18: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn90
              object cxGridDBColumn86: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn87: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn88: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn89: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn90: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView18: TcxGridDBBandedTableView
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
              DataController.DataSource = dsBrokerContractPart1
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
              Bands = <
                item
                  Width = 93
                end
                item
                  Width = 75
                end
                item
                  Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103
                end
                item
                  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
                end>
              object cxGridDBBandedTableView18CONTRACT_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CONTRACT_NO'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18CONTRACT_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CONTRACT_DATE'
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18BEGIN_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BEGIN_DATE'
                Width = 65
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18END_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'END_DATE'
                Width = 73
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18IS_AUTHORIZE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'IS_AUTHORIZE'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.DisplayChecked = #1044#1072
                Properties.DisplayUnchecked = #1053#1077#1090
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 'Y'
                Properties.ValueUnchecked = 'N'
                Width = 101
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18SUB_TYPE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUB_TYPE'
                Width = 43
                Position.BandIndex = 3
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18SUBJECT_INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUBJECT_INN'
                Position.BandIndex = 3
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18SUBJECT_KPP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUBJECT_KPP'
                Position.BandIndex = 3
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18SUBJECT_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUBJECT_NAME'
                Width = 242
                Position.BandIndex = 3
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18DOC_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NO'
                Width = 114
                Position.BandIndex = 3
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18LAST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'LAST_NAME'
                Width = 200
                Position.BandIndex = 3
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18FIRST_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FIRST_NAME'
                Width = 200
                Position.BandIndex = 3
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView18MIDDLE_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'MIDDLE_NAME'
                Width = 200
                Position.BandIndex = 3
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
            end
            object cxGridLevel18: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView18
            end
          end
        end
        object tabFilialPart1: TcxTabSheet
          Caption = #1060#1080#1083#1080#1072#1083#1099
          ImageIndex = 8
          OnShow = tabFilialPart1Show
          object cxGrid19: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView19: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn95
              object cxGridDBColumn91: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn92: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn93: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn94: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn95: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView19: TcxGridDBBandedTableView
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
              DataController.DataSource = dsFilialPart1
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
                  Width = 949
                end>
              object cxGridDBBandedTableView19NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'NAME'
                Width = 196
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView19INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'INN'
                Width = 144
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView19KPP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KPP'
                Width = 119
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView19SUBJECT_NAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUBJECT_NAME'
                Width = 490
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
            end
            object cxGridLevel19: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView19
            end
          end
        end
        object tabOperationPart1: TcxTabSheet
          Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1081
          ImageIndex = 0
          OnShow = tabOperationPart1Show
          object cxGrid10: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView10: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn50
              object cxGridDBColumn46: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn47: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn48: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn49: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn50: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView10: TcxGridDBBandedTableView
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
              DataController.DataSource = dsOperationPart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DED_DC'
                  Column = cxGridDBBandedTableView10SUM_DED_DC
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DP'
                  Column = cxGridDBBandedTableView10SUM_DP
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DR_IN'
                  Column = cxGridDBBandedTableView10SUM_DR_IN
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DR_OUT'
                  Column = cxGridDBBandedTableView10SUM_DR_OUT
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IN'
                  Column = cxGridDBBandedTableView10SUM_IN
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_PB'
                  Column = cxGridDBBandedTableView10SUM_PB
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_TR'
                  Column = cxGridDBBandedTableView10SUM_TR
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_TR_PG'
                  Column = cxGridDBBandedTableView10SUM_TR_PG
                end>
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
              OptionsView.CellAutoHeight = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.HeaderAutoHeight = True
              OptionsView.HeaderEndEllipsis = True
              OptionsView.Indicator = True
              OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
              OptionsView.BandHeaderEndEllipsis = True
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  FixedKind = fkLeft
                end
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end
                item
                  Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077
                  Width = 171
                end
                item
                  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1079#1072#1095#1077#1090#1077
                  Width = 119
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1079#1072#1095#1077#1090#1072
                  Width = 183
                end
                item
                  Caption = #1058#1056
                  Width = 157
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1079#1072#1083#1086#1075#1072
                  Width = 145
                end
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                end
                item
                  Caption = #1054#1087#1083#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                  Width = 134
                end
                item
                  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
                end
                item
                  Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072' '#1085#1072' '#1089#1095#1077#1090
                  Width = 177
                end>
              object cxGridDBBandedTableView10TYPESYSNAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Position.BandIndex = -1
                Position.ColIndex = -1
                Position.RowIndex = -1
              end
              object cxGridDBBandedTableView10ACTIVATION_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ACTIVATION_DATE'
                Width = 78
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Width = 82
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Width = 86
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10KBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBK'
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10PAYER_INN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'PAYER_INN'
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10PAYER_KPP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'PAYER_KPP'
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SP_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SP_IN'
                Width = 54
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IN'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseDisplayFormatWhenEditing = True
                Properties.UseThousandSeparator = True
                Width = 72
                Position.BandIndex = 2
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10OU_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU_IN'
                Width = 57
                Position.BandIndex = 2
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_DATE_DP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE_DP'
                Width = 54
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NUMBER_DP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER_DP'
                Width = 65
                Position.BandIndex = 3
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_DR_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DR_IN'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 4
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_DP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DP'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 4
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10CUSTOMS_CODE_TR: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CUSTOMS_CODE_TR'
                Width = 74
                Position.BandIndex = 5
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NUMBER_TR: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER_TR'
                Width = 45
                Position.BandIndex = 5
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_DATE_TR: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE_TR'
                Width = 38
                Position.BandIndex = 5
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_TR: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_TR'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 6
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_TR_PG: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_TR_PG'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 6
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10CUSTOMS_CODE_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CUSTOMS_CODE_DC'
                Position.BandIndex = 7
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_DATE_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE_DC'
                Width = 68
                Position.BandIndex = 7
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NUMBER_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER_DC'
                Position.BandIndex = 7
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10KBKCODE_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBKCODE_DC'
                Width = 70
                Position.BandIndex = 7
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_DED_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DED_DC'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 67
                Position.BandIndex = 8
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10OU_DED_DC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU_DED_DC'
                Width = 49
                Position.BandIndex = 8
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_DATE_PB: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE_PB'
                Width = 87
                Position.BandIndex = 9
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10DOC_NUMBER_PB: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER_PB'
                Width = 100
                Position.BandIndex = 9
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_PB: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_PB'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 78
                Position.BandIndex = 10
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView10SUM_DR_OUT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DR_OUT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 10
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
            end
            object cxGridLevel10: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView10
            end
          end
        end
        object tabSvodDataPart1: TcxTabSheet
          Caption = #1057#1074#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          ImageIndex = 1
          OnShow = tabSvodDataPart1Show
          object Splitter2: TSplitter
            Left = 0
            Top = 121
            Width = 1022
            Height = 10
            Cursor = crVSplit
            Align = alTop
            Color = clSkyBlue
            ParentColor = False
          end
          object Splitter1: TSplitter
            Left = 0
            Top = 257
            Width = 1022
            Height = 10
            Cursor = crVSplit
            Align = alTop
            Color = clSkyBlue
            ParentColor = False
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1022
            Height = 121
            Align = alTop
            Caption = 'Panel1'
            TabOrder = 0
            object cxGrid5: TcxGrid
              Left = 1
              Top = 1
              Width = 1020
              Height = 119
              Align = alClient
              BorderStyle = cxcbsNone
              TabOrder = 0
              object cxGridDBTableView5: TcxGridDBTableView
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
                Preview.Column = cxGridDBColumn25
                object cxGridDBColumn21: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  Hidden = True
                end
                object cxGridDBColumn22: TcxGridDBColumn
                  DataBinding.FieldName = 'TYPESYSNAME'
                  Visible = False
                  Hidden = True
                  Width = 64
                end
                object cxGridDBColumn23: TcxGridDBColumn
                  Caption = #1058#1080#1087
                  DataBinding.FieldName = 'TYPENAME'
                  Width = 42
                end
                object cxGridDBColumn24: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  DataBinding.FieldName = 'NAME'
                  Width = 538
                end
                object cxGridDBColumn25: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPT'
                  Width = 314
                end
              end
              object cxGridDBBandedTableView5: TcxGridDBBandedTableView
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
                DataController.DataSource = dsTurnoverPart1
                DataController.Filter.MaxValueListCount = 10
                DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_DED'
                    Column = cxGridDBBandedTableView5SUM_DED
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_IN'
                    Column = cxGridDBBandedTableView5SUM_IN
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_OST_IN'
                    Column = cxGridDBBandedTableView5SUM_OST_IN
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_OUT'
                    Column = cxGridDBBandedTableView5SUM_OUT
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_R'
                    Column = cxGridDBBandedTableView5SUM_R
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_VZ'
                    Column = cxGridDBBandedTableView5SUM_VZ
                  end>
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
                Styles.Footer = cxStyleFooter
                Styles.BandHeader = cxStyleBandHeader
                Bands = <
                  item
                    Caption = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1076#1077#1085#1077#1078#1085#1099#1084' '#1089#1088#1077#1076#1089#1090#1074#1072#1084
                  end>
                object cxGridDBBandedTableView5KBK: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'KBK'
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_OST_IN: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_OST_IN'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_IN: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_IN'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_R: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_R'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_DED: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_DED'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_VZ: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_VZ'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView5SUM_OUT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_OUT'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Position.BandIndex = 0
                  Position.ColIndex = 6
                  Position.RowIndex = 0
                end
              end
              object cxGridLevel5: TcxGridLevel
                Caption = 'grdDataDBTableView'
                GridView = cxGridDBBandedTableView5
              end
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 160
            Width = 1022
            Height = 97
            Align = alTop
            Caption = 'Panel2'
            TabOrder = 1
            object Splitter3: TSplitter
              Left = 537
              Top = 1
              Width = 10
              Height = 95
              Color = clSkyBlue
              ParentColor = False
            end
            object Panel4: TPanel
              Left = 1
              Top = 1
              Width = 536
              Height = 95
              Align = alLeft
              Caption = 'Panel4'
              TabOrder = 0
              object cxGrid6: TcxGrid
                Left = 1
                Top = 1
                Width = 534
                Height = 93
                Align = alClient
                BorderStyle = cxcbsNone
                TabOrder = 0
                object cxGridDBTableView6: TcxGridDBTableView
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
                  Preview.Column = cxGridDBColumn30
                  object cxGridDBColumn26: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Hidden = True
                  end
                  object cxGridDBColumn27: TcxGridDBColumn
                    DataBinding.FieldName = 'TYPESYSNAME'
                    Visible = False
                    Hidden = True
                    Width = 64
                  end
                  object cxGridDBColumn28: TcxGridDBColumn
                    Caption = #1058#1080#1087
                    DataBinding.FieldName = 'TYPENAME'
                    Width = 42
                  end
                  object cxGridDBColumn29: TcxGridDBColumn
                    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                    DataBinding.FieldName = 'NAME'
                    Width = 538
                  end
                  object cxGridDBColumn30: TcxGridDBColumn
                    DataBinding.FieldName = 'DESCRIPT'
                    Width = 314
                  end
                end
                object cxGridDBBandedTableView6: TcxGridDBBandedTableView
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
                  DataController.DataSource = dsSvodOstPart1_SV
                  DataController.Filter.MaxValueListCount = 10
                  DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                  DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '0.00,'
                      Kind = skSum
                      FieldName = 'OST_SUM'
                      Column = cxGridDBBandedTableView6OST_SUM
                    end>
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
                  Styles.Footer = cxStyleFooter
                  Styles.BandHeader = cxStyleBandHeader
                  Bands = <
                    item
                      Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
                    end>
                  object cxGridDBBandedTableView6KBK: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'KBK'
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxGridDBBandedTableView6DOC_SUMMA: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'DOC_SUMMA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                  object cxGridDBBandedTableView6OST_SUM: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'OST_SUM'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 2
                    Position.RowIndex = 0
                  end
                  object cxGridDBBandedTableView6BLOCK_SUMMA: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'BLOCK_SUMMA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 3
                    Position.RowIndex = 0
                  end
                end
                object cxGridLevel6: TcxGridLevel
                  Caption = 'grdDataDBTableView'
                  GridView = cxGridDBBandedTableView6
                end
              end
            end
            object Panel5: TPanel
              Left = 547
              Top = 1
              Width = 474
              Height = 95
              Align = alClient
              Caption = 'Panel5'
              TabOrder = 1
              object cxGrid7: TcxGrid
                Left = 1
                Top = 1
                Width = 472
                Height = 93
                Align = alClient
                BorderStyle = cxcbsNone
                TabOrder = 0
                object cxGridDBTableView7: TcxGridDBTableView
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
                  Preview.Column = cxGridDBColumn35
                  object cxGridDBColumn31: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Hidden = True
                  end
                  object cxGridDBColumn32: TcxGridDBColumn
                    DataBinding.FieldName = 'TYPESYSNAME'
                    Visible = False
                    Hidden = True
                    Width = 64
                  end
                  object cxGridDBColumn33: TcxGridDBColumn
                    Caption = #1058#1080#1087
                    DataBinding.FieldName = 'TYPENAME'
                    Width = 42
                  end
                  object cxGridDBColumn34: TcxGridDBColumn
                    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                    DataBinding.FieldName = 'NAME'
                    Width = 538
                  end
                  object cxGridDBColumn35: TcxGridDBColumn
                    DataBinding.FieldName = 'DESCRIPT'
                    Width = 314
                  end
                end
                object cxGridDBBandedTableView7: TcxGridDBBandedTableView
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
                  DataController.DataSource = dsZalogPart1_SV
                  DataController.Filter.MaxValueListCount = 10
                  DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                  DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '0.0,'
                      Kind = skSum
                      FieldName = 'SUMMA'
                      Column = cxGridDBBandedTableView7SUMMA
                    end>
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
                  Styles.Footer = cxStyleFooter
                  Styles.BandHeader = cxStyleBandHeader
                  Bands = <
                    item
                      Caption = #1044#1077#1085#1077#1078#1085#1099#1081' '#1079#1072#1083#1086#1075
                      Width = 419
                    end>
                  object cxGridDBBandedTableView7KBK: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'KBK'
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxGridDBBandedTableView7SUMMA: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'SUMMA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                end
                object cxGridLevel7: TcxGridLevel
                  Caption = 'grdDataDBTableView'
                  GridView = cxGridDBBandedTableView7
                end
              end
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 267
            Width = 1022
            Height = 97
            Align = alClient
            Caption = 'Panel3'
            TabOrder = 2
            object Splitter5: TSplitter
              Left = 537
              Top = 1
              Width = 10
              Height = 95
              Color = clSkyBlue
              ParentColor = False
            end
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 536
              Height = 95
              Align = alLeft
              Caption = 'Panel6'
              TabOrder = 0
              object cxGrid8: TcxGrid
                Left = 1
                Top = 1
                Width = 534
                Height = 93
                Align = alClient
                BorderStyle = cxcbsNone
                TabOrder = 0
                object cxGridDBTableView8: TcxGridDBTableView
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
                  Preview.Column = cxGridDBColumn40
                  object cxGridDBColumn36: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Hidden = True
                  end
                  object cxGridDBColumn37: TcxGridDBColumn
                    DataBinding.FieldName = 'TYPESYSNAME'
                    Visible = False
                    Hidden = True
                    Width = 64
                  end
                  object cxGridDBColumn38: TcxGridDBColumn
                    Caption = #1058#1080#1087
                    DataBinding.FieldName = 'TYPENAME'
                    Width = 42
                  end
                  object cxGridDBColumn39: TcxGridDBColumn
                    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                    DataBinding.FieldName = 'NAME'
                    Width = 538
                  end
                  object cxGridDBColumn40: TcxGridDBColumn
                    DataBinding.FieldName = 'DESCRIPT'
                    Width = 314
                  end
                end
                object cxGridDBBandedTableView8: TcxGridDBBandedTableView
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
                  DataController.DataSource = dsPayDrivePart1_SV
                  DataController.Filter.MaxValueListCount = 10
                  DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                  DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '0.0,'
                      Kind = skSum
                      FieldName = 'DOC_SUMMA'
                      Column = cxGridDBBandedTableView8DOC_SUMMA
                    end>
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
                  Styles.Footer = cxStyleFooter
                  Styles.BandHeader = cxStyleBandHeader
                  Bands = <
                    item
                      Caption = #1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080
                      Width = 492
                    end>
                  object cxGridDBBandedTableView8KBK: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'KBK'
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                  object cxGridDBBandedTableView8DOC_SUMMA: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'DOC_SUMMA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 1
                    Position.RowIndex = 0
                  end
                end
                object cxGridLevel8: TcxGridLevel
                  Caption = 'grdDataDBTableView'
                  GridView = cxGridDBBandedTableView8
                end
              end
            end
            object Panel7: TPanel
              Left = 547
              Top = 1
              Width = 474
              Height = 95
              Align = alClient
              Caption = 'Panel7'
              TabOrder = 1
              object cxGrid9: TcxGrid
                Left = 1
                Top = 1
                Width = 472
                Height = 93
                Align = alClient
                BorderStyle = cxcbsNone
                TabOrder = 0
                object cxGridDBTableView9: TcxGridDBTableView
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
                  Preview.Column = cxGridDBColumn45
                  object cxGridDBColumn41: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Hidden = True
                  end
                  object cxGridDBColumn42: TcxGridDBColumn
                    DataBinding.FieldName = 'TYPESYSNAME'
                    Visible = False
                    Hidden = True
                    Width = 64
                  end
                  object cxGridDBColumn43: TcxGridDBColumn
                    Caption = #1058#1080#1087
                    DataBinding.FieldName = 'TYPENAME'
                    Width = 42
                  end
                  object cxGridDBColumn44: TcxGridDBColumn
                    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                    DataBinding.FieldName = 'NAME'
                    Width = 538
                  end
                  object cxGridDBColumn45: TcxGridDBColumn
                    DataBinding.FieldName = 'DESCRIPT'
                    Width = 314
                  end
                end
                object cxGridDBBandedTableView9: TcxGridDBBandedTableView
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
                  DataController.DataSource = dsVozvratPart1_SV
                  DataController.Filter.MaxValueListCount = 10
                  DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                  DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '0.0,'
                      Kind = skSum
                      FieldName = 'DOC_SUMMA'
                      Column = cxGridDBBandedTableView9DOC_SUMMA
                    end>
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
                  Styles.Footer = cxStyleFooter
                  Styles.BandHeader = cxStyleBandHeader
                  Bands = <
                    item
                      Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072', '#1085#1077' '#1089#1087#1080#1089#1072#1085#1085#1072#1103' '#1089#1086' '#1089#1095#1077#1090#1072' 40101'
                      Width = 436
                    end>
                  object cxGridDBBandedTableView9DOC_SUMMA: TcxGridDBBandedColumn
                    DataBinding.FieldName = 'DOC_SUMMA'
                    PropertiesClassName = 'TcxCurrencyEditProperties'
                    Properties.DisplayFormat = ',0.00'
                    Properties.UseThousandSeparator = True
                    Position.BandIndex = 0
                    Position.ColIndex = 0
                    Position.RowIndex = 0
                  end
                end
                object cxGridLevel9: TcxGridLevel
                  Caption = 'grdDataDBTableView'
                  GridView = cxGridDBBandedTableView9
                end
              end
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 131
            Width = 1022
            Height = 29
            Align = alTop
            Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072' '#1090#1077#1082#1091#1097#1091#1102' '#1076#1072#1090#1091
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object tabTurnoverPart1: TcxTabSheet
          Caption = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1076#1077#1085#1077#1078#1085#1099#1084' '#1089#1088#1077#1076#1089#1090#1074#1072#1084
          ImageIndex = 2
          OnShow = tabTurnoverPart1Show
          object cxGrid4: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView4: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn20
              object cxGridDBColumn16: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn17: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn18: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn19: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn20: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView4: TcxGridDBBandedTableView
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
              DataController.DataSource = dsTurnoverPart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DED'
                  Column = cxGridDBBandedTableView4SUM_DED
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IN'
                  Column = cxGridDBBandedTableView4SUM_IN
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OST_IN'
                  Column = cxGridDBBandedTableView4SUM_OST_IN
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OUT'
                  Column = cxGridDBBandedTableView4SUM_OUT
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_R'
                  Column = cxGridDBBandedTableView4SUM_R
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_VZ'
                  Column = cxGridDBBandedTableView4SUM_VZ
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end>
              object cxGridDBBandedTableView4KBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBK'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_OST_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OST_IN'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IN'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_R: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_R'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_DED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DED'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_VZ: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_VZ'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView4SUM_OUT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OUT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
            end
            object cxGridLevel4: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView4
            end
          end
        end
        object tabSvodOstPart1: TcxTabSheet
          Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1081' '#1086#1089#1090#1072#1090#1086#1082' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
          ImageIndex = 3
          OnShow = tabSvodOstPart1Show
          object grdData: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
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
              OnCustomDrawCell = grdDataDBBandedTableViewCustomDrawCell
              DataController.DataSource = dsSvodOstPart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'BLOCK_SUMMA'
                  Column = grdDataDBBandedTableViewBLOCK_SUMMA
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'OST_SUM'
                  Column = grdDataDBBandedTableViewOST_SUM
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'DOC_SUMMA'
                  Column = grdDataDBBandedTableViewDOC_SUMMA
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end>
              object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewDOC_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewKBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBK'
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewOST_SUM: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OST_SUM'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewBLOCK_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BLOCK_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object grdDataDBBandedTableViewPO_KBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'PO_KBK'
                Visible = False
                Hidden = True
                Width = 130
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
            end
            object grdDataLevel: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = grdDataDBBandedTableView
            end
          end
        end
        object tabZalogPart1: TcxTabSheet
          Caption = #1044#1077#1085#1077#1078#1085#1099#1081' '#1079#1072#1083#1086#1075
          ImageIndex = 4
          OnShow = tabZalogPart1Show
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
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
                Width = 42
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn5: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView1: TcxGridDBBandedTableView
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
              DataController.DataSource = dsZalogPart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'DOC_SUMMA'
                  Column = cxGridDBBandedTableView1DOC_SUMMA
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUMMA'
                  Column = cxGridDBBandedTableView1SUMMA
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end>
              object cxGridDBBandedTableView1DOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1DOC_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1KBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBK'
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView1SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
            object cxGridLevel1: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView1
            end
          end
        end
        object tabPayDrivePart1: TcxTabSheet
          Caption = #1044#1077#1085#1100#1075#1080' '#1074' '#1087#1091#1090#1080
          ImageIndex = 5
          OnShow = tabPayDrivePart1Show
          object cxGrid2: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView2: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn10
              object cxGridDBColumn6: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn7: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn10: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView2: TcxGridDBBandedTableView
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
              DataController.DataSource = dsPayDrivePart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'DOC_SUMMA'
                  Column = cxGridDBBandedTableView2DOC_SUMMA
                end>
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
              OptionsView.CellAutoHeight = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.HeaderAutoHeight = True
              OptionsView.HeaderEndEllipsis = True
              OptionsView.Indicator = True
              OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
              OptionsView.BandHeaderEndEllipsis = True
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
                end
                item
                end>
              object cxGridDBBandedTableView2DOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView2DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView2DOC_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView2KBK: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBK'
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView2SP: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SP'
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView2OU: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU'
                Width = 150
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
            end
            object cxGridLevel2: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView2
            end
          end
        end
        object tabVozvratPart1: TcxTabSheet
          Caption = #1057#1091#1084#1084#1072' '#1074#1086#1079#1074#1088#1072#1090#1072', '#1085#1077' '#1089#1087#1080#1089#1072#1085#1085#1072#1103' '#1089#1086' '#1089#1095#1077#1090#1072' 40101'
          ImageIndex = 6
          OnShow = tabVozvratPart1Show
          object cxGrid3: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView3: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn15
              object cxGridDBColumn11: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn12: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn13: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn14: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn15: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView3: TcxGridDBBandedTableView
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
              DataController.DataSource = dsVozvratPart1
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'DOC_SUMMA'
                  Column = cxGridDBBandedTableView3DOC_SUMMA
                end>
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
              OptionsView.CellAutoHeight = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.HeaderAutoHeight = True
              OptionsView.HeaderEndEllipsis = True
              OptionsView.Indicator = True
              OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
              OptionsView.BandHeaderEndEllipsis = True
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1086#1079#1074#1088#1072#1090#1077
                end
                item
                end>
              object cxGridDBBandedTableView3DOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView3DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView3DOC_SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView3OU: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU'
                Width = 150
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
            end
            object cxGridLevel3: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView3
            end
          end
        end
      end
      object dxBarDockControlPart1Top: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 1022
        Height = 28
        Align = dalTop
        BarManager = BarManager
      end
      object plCaptionSubjectPart1: TPanel
        Left = 0
        Top = 28
        Width = 1022
        Height = 29
        Align = alTop
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object tabPart2: TcxTabSheet
      Caption = #1056#1072#1079#1076#1077#1083' 2. '#1056#1072#1089#1095#1077#1090#1099' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1080' '#1080#1085#1099#1084' '#1087#1083#1072#1090#1077#1078#1072#1084
      ImageIndex = 4
      object pPart2: TcxPageControl
        Left = 0
        Top = 57
        Width = 1022
        Height = 388
        ActivePage = tabOperationPart2
        Align = alClient
        LookAndFeel.Kind = lfStandard
        Style = 5
        TabOrder = 0
        ClientRectBottom = 388
        ClientRectRight = 1022
        ClientRectTop = 24
        object tabOperationPart2: TcxTabSheet
          Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1081
          ImageIndex = 0
          OnShow = tabOperationPart2Show
          object cxGrid11: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView11: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn55
              object cxGridDBColumn51: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn52: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn53: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn54: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn55: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView11: TcxGridDBBandedTableView
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
              DataController.DataSource = dsOperationPart2
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_CH'
                  Column = cxGridDBBandedTableView11SUM_CH
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DE'
                  Column = cxGridDBBandedTableView11SUM_DE
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IU'
                  Column = cxGridDBBandedTableView11SUM_IU
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OT'
                  Column = cxGridDBBandedTableView11SUM_OT
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_PB'
                  Column = cxGridDBBandedTableView11SUM_PB
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_Z'
                  Column = cxGridDBBandedTableView11SUM_Z
                end>
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
              OptionsView.CellAutoHeight = True
              OptionsView.Footer = True
              OptionsView.GroupByBox = False
              OptionsView.GroupRowStyle = grsOffice11
              OptionsView.HeaderAutoHeight = True
              OptionsView.HeaderEndEllipsis = True
              OptionsView.Indicator = True
              OptionsView.NewItemRowInfoText = #1053#1072#1078#1084#1080#1090#1077' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
              OptionsView.BandHeaderEndEllipsis = True
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  FixedKind = fkLeft
                  Width = 62
                end
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                  Width = 377
                end
                item
                  Width = 130
                end
                item
                  Width = 126
                end
                item
                  Caption = #1054#1087#1083#1072#1090#1072' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
                  Width = 161
                end
                item
                  Width = 127
                end
                item
                  Width = 102
                end
                item
                  Caption = #1057#1085#1103#1090#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1077
                  Width = 264
                end>
              object cxGridDBBandedTableView11TYPESYSNAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11ACTIVATION_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ACTIVATION_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11TYPE_CH: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TYPE_CH'
                Width = 100
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11PROC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'PROC'
                Width = 73
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11CUSTOMS_CODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CUSTOMS_CODE'
                Width = 60
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Width = 44
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11DECL_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DECL_NO'
                Width = 58
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11KBKCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBKCODE'
                Width = 108
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_CH: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_CH'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 2
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_IU: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IU'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 3
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_DE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 94
                Position.BandIndex = 4
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11OU_DE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU_DE'
                Width = 67
                Position.BandIndex = 4
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_Z: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_Z'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 5
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_PB: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_PB'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Position.BandIndex = 6
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11OSN_OT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OSN_OT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 69
                Position.BandIndex = 7
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11SUM_OT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 91
                Position.BandIndex = 7
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView11OU_OT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'OU_OT'
                Width = 104
                Position.BandIndex = 7
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
            end
            object cxGridLevel11: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView11
            end
          end
        end
        object tabSvodDataPart2: TcxTabSheet
          Caption = #1057#1074#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
          ImageIndex = 1
          OnShow = tabSvodDataPart2Show
          object Splitter4: TSplitter
            Left = 0
            Top = 193
            Width = 1022
            Height = 10
            Cursor = crVSplit
            Align = alTop
            Color = clSkyBlue
            ParentColor = False
          end
          object Splitter6: TSplitter
            Left = 521
            Top = 233
            Width = 10
            Height = 131
            Color = clSkyBlue
            ParentColor = False
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 1022
            Height = 193
            Align = alTop
            Caption = 'Panel8'
            TabOrder = 0
            object cxGrid15: TcxGrid
              Left = 1
              Top = 1
              Width = 1020
              Height = 191
              Align = alClient
              BorderStyle = cxcbsNone
              TabOrder = 0
              object cxGridDBTableView15: TcxGridDBTableView
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
                Preview.Column = cxGridDBColumn75
                object cxGridDBColumn71: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  Hidden = True
                end
                object cxGridDBColumn72: TcxGridDBColumn
                  DataBinding.FieldName = 'TYPESYSNAME'
                  Visible = False
                  Hidden = True
                  Width = 64
                end
                object cxGridDBColumn73: TcxGridDBColumn
                  Caption = #1058#1080#1087
                  DataBinding.FieldName = 'TYPENAME'
                  Width = 42
                end
                object cxGridDBColumn74: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  DataBinding.FieldName = 'NAME'
                  Width = 538
                end
                object cxGridDBColumn75: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPT'
                  Width = 314
                end
              end
              object cxGridDBBandedTableView15: TcxGridDBBandedTableView
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
                DataController.DataSource = dsTurnoverPart2
                DataController.Filter.MaxValueListCount = 10
                DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_CH'
                    Column = cxGridDBBandedTableView15SUM_CH
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_DE'
                    Column = cxGridDBBandedTableView15SUM_DE
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_IN'
                    Column = cxGridDBBandedTableView15SUM_IN
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_OT'
                    Column = cxGridDBBandedTableView15SUM_OT
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_OUT'
                    Column = cxGridDBBandedTableView15SUM_OUT
                  end>
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
                Styles.Footer = cxStyleFooter
                Styles.BandHeader = cxStyleBandHeader
                Bands = <
                  item
                    Caption = #1054#1073#1086#1088#1086#1090#1099' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1080' '#1080#1085#1099#1084' '#1087#1083#1072#1090#1077#1078#1072#1084
                    Width = 971
                  end>
                object cxGridDBBandedTableView15KBKCODE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'KBKCODE'
                  Width = 190
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView15SUM_IN: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_IN'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 159
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView15SUM_CH: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_CH'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 140
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView15SUM_DE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_DE'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 136
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView15SUM_OT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_OT'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 155
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView15SUM_OUT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_OUT'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 125
                  Position.BandIndex = 0
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
              end
              object cxGridLevel15: TcxGridLevel
                Caption = 'grdDataDBTableView'
                GridView = cxGridDBBandedTableView15
              end
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 233
            Width = 521
            Height = 131
            Align = alLeft
            Caption = 'Panel9'
            TabOrder = 1
            object cxGrid16: TcxGrid
              Left = 1
              Top = 1
              Width = 519
              Height = 129
              Align = alClient
              BorderStyle = cxcbsNone
              TabOrder = 0
              object cxGridDBTableView16: TcxGridDBTableView
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
                Preview.Column = cxGridDBColumn80
                object cxGridDBColumn76: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  Hidden = True
                end
                object cxGridDBColumn77: TcxGridDBColumn
                  DataBinding.FieldName = 'TYPESYSNAME'
                  Visible = False
                  Hidden = True
                  Width = 64
                end
                object cxGridDBColumn78: TcxGridDBColumn
                  Caption = #1058#1080#1087
                  DataBinding.FieldName = 'TYPENAME'
                  Width = 42
                end
                object cxGridDBColumn79: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  DataBinding.FieldName = 'NAME'
                  Width = 538
                end
                object cxGridDBColumn80: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPT'
                  Width = 314
                end
              end
              object cxGridDBBandedTableView16: TcxGridDBBandedTableView
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
                DataController.DataSource = dsNonPaysPart2_SV
                DataController.Filter.MaxValueListCount = 10
                DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_IU'
                    Column = cxGridDBBandedTableView16SUM_IU
                  end
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUM_OT'
                    Column = cxGridDBBandedTableView16SUM_OT
                  end>
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
                Styles.Footer = cxStyleFooter
                Styles.BandHeader = cxStyleBandHeader
                Bands = <
                  item
                    Caption = #1053#1077#1079#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1088#1072#1089#1095#1077#1090#1099
                    Width = 490
                  end>
                object cxGridDBBandedTableView16KBKCODE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'KBKCODE'
                  Width = 178
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView16SUM_IU: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_IU'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 153
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView16SUM_OT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUM_OT'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 159
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
              end
              object cxGridLevel16: TcxGridLevel
                Caption = 'grdDataDBTableView'
                GridView = cxGridDBBandedTableView16
              end
            end
          end
          object Panel10: TPanel
            Left = 531
            Top = 233
            Width = 491
            Height = 131
            Align = alClient
            Caption = 'Panel10'
            TabOrder = 2
            object cxGrid17: TcxGrid
              Left = 1
              Top = 1
              Width = 489
              Height = 129
              Align = alClient
              BorderStyle = cxcbsNone
              TabOrder = 0
              object cxGridDBTableView17: TcxGridDBTableView
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
                Preview.Column = cxGridDBColumn85
                object cxGridDBColumn81: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  Hidden = True
                end
                object cxGridDBColumn82: TcxGridDBColumn
                  DataBinding.FieldName = 'TYPESYSNAME'
                  Visible = False
                  Hidden = True
                  Width = 64
                end
                object cxGridDBColumn83: TcxGridDBColumn
                  Caption = #1058#1080#1087
                  DataBinding.FieldName = 'TYPENAME'
                  Width = 42
                end
                object cxGridDBColumn84: TcxGridDBColumn
                  Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  DataBinding.FieldName = 'NAME'
                  Width = 538
                end
                object cxGridDBColumn85: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPT'
                  Width = 314
                end
              end
              object cxGridDBBandedTableView17: TcxGridDBBandedTableView
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
                DataController.DataSource = dsNotReestrPart2_SV
                DataController.Filter.MaxValueListCount = 10
                DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
                DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0.0,'
                    Kind = skSum
                    FieldName = 'SUMMA'
                    Column = cxGridDBBandedTableView17SUMMA
                  end>
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
                Styles.Footer = cxStyleFooter
                Styles.BandHeader = cxStyleBandHeader
                Bands = <
                  item
                    Caption = #1053#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1087#1086' '#1091#1090#1086#1095#1085#1077#1085#1080#1102'/'#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
                    Width = 436
                  end>
                object cxGridDBBandedTableView17KBKCODE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'KBKCODE'
                  Width = 213
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxGridDBBandedTableView17SUMMA: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SUMMA'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0.00'
                  Properties.UseThousandSeparator = True
                  Width = 223
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
              end
              object cxGridLevel17: TcxGridLevel
                Caption = 'grdDataDBTableView'
                GridView = cxGridDBBandedTableView17
              end
            end
          end
          object Panel12: TPanel
            Left = 0
            Top = 203
            Width = 1022
            Height = 30
            Align = alTop
            Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072' '#1090#1077#1082#1091#1097#1091#1102' '#1076#1072#1090#1091
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
        object tabTurnoverPart2: TcxTabSheet
          Caption = #1054#1073#1086#1088#1086#1090' '#1087#1086' '#1090#1072#1084#1086#1078#1077#1085#1085#1099#1084' '#1080' '#1080#1085#1099#1084' '#1087#1083#1072#1090#1077#1078#1072#1084
          ImageIndex = 2
          OnShow = tabTurnoverPart2Show
          object cxGrid14: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView14: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn70
              object cxGridDBColumn66: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn67: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn68: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn69: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn70: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView14: TcxGridDBBandedTableView
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
              DataController.DataSource = dsTurnoverPart2
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_CH'
                  Column = cxGridDBBandedTableView14SUM_CH
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_DE'
                  Column = cxGridDBBandedTableView14SUM_DE
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IN'
                  Column = cxGridDBBandedTableView14SUM_IN
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IU'
                  Column = cxGridDBBandedTableView14SUM_IU
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OT'
                  Column = cxGridDBBandedTableView14SUM_OT
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OUT'
                  Column = cxGridDBBandedTableView14SUM_OUT
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                end>
              object cxGridDBBandedTableView14KBKCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBKCODE'
                Width = 187
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_IN: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IN'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 132
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_CH: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_CH'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 92
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_IU: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IU'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 103
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_DE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_DE'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 90
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_OT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 145
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView14SUM_OUT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OUT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 146
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
            end
            object cxGridLevel14: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView14
            end
          end
        end
        object tabNotStopOperationPart2: TcxTabSheet
          Caption = #1053#1077#1079#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077' '#1088#1072#1089#1095#1077#1090#1099
          ImageIndex = 3
          OnShow = tabNotStopOperationPart2Show
          object cxGrid12: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView12: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn60
              object cxGridDBColumn56: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn57: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn58: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn59: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn60: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView12: TcxGridDBBandedTableView
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
              DataController.DataSource = dsNonPaysPart2
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_IU'
                  Column = cxGridDBBandedTableView12SUM_IU
                end
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUM_OT'
                  Column = cxGridDBBandedTableView12SUM_OT
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                end>
              object cxGridDBBandedTableView12TYPESYSNAME: TcxGridDBBandedColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12CUSTOMS_CODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CUSTOMS_CODE'
                Width = 96
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12DECL_NO: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DECL_NO'
                Width = 103
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Width = 128
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12KBKCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBKCODE'
                Width = 166
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12SUM_IU: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_IU'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 118
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView12SUM_OT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUM_OT'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 135
                Position.BandIndex = 0
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
            end
            object cxGridLevel12: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView12
            end
          end
        end
        object tabNotIncludePart2: TcxTabSheet
          Caption = #1053#1077' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1074' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1087#1086' '#1091#1090#1086#1095#1085#1077#1085#1080#1102'/'#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077
          ImageIndex = 4
          OnShow = tabNotIncludePart2Show
          object cxGrid13: TcxGrid
            Left = 0
            Top = 0
            Width = 1022
            Height = 364
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            object cxGridDBTableView13: TcxGridDBTableView
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
              Preview.Column = cxGridDBColumn65
              object cxGridDBColumn61: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                Hidden = True
              end
              object cxGridDBColumn62: TcxGridDBColumn
                DataBinding.FieldName = 'TYPESYSNAME'
                Visible = False
                Hidden = True
                Width = 64
              end
              object cxGridDBColumn63: TcxGridDBColumn
                Caption = #1058#1080#1087
                DataBinding.FieldName = 'TYPENAME'
                Width = 42
              end
              object cxGridDBColumn64: TcxGridDBColumn
                Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                DataBinding.FieldName = 'NAME'
                Width = 538
              end
              object cxGridDBColumn65: TcxGridDBColumn
                DataBinding.FieldName = 'DESCRIPT'
                Width = 314
              end
            end
            object cxGridDBBandedTableView13: TcxGridDBBandedTableView
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
              DataController.DataSource = dsNotReestrPart2
              DataController.Filter.MaxValueListCount = 10
              DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.0,'
                  Kind = skSum
                  FieldName = 'SUMMA'
                  Column = cxGridDBBandedTableView13SUMMA
                end>
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
              Styles.Footer = cxStyleFooter
              Bands = <
                item
                  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
                end>
              object cxGridDBBandedTableView13CUSTOMS_CODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'CUSTOMS_CODE'
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView13DOC_NUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_NUMBER'
                Width = 115
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView13DOC_DATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DOC_DATE'
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView13KBKCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'KBKCODE'
                Width = 100
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGridDBBandedTableView13SUMMA: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SUMMA'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.DisplayFormat = ',0.00'
                Properties.UseThousandSeparator = True
                Width = 220
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
            end
            object cxGridLevel13: TcxGridLevel
              Caption = 'grdDataDBTableView'
              GridView = cxGridDBBandedTableView13
            end
          end
        end
      end
      object dxBarDockControlPart2Top: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 1022
        Height = 28
        Align = dalTop
        BarManager = BarManager
      end
      object plCaptionSubjectPart2: TPanel
        Left = 0
        Top = 28
        Width = 1022
        Height = 29
        Align = alTop
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    object actRefreshPart: TAction
      Category = 'Object'
      Caption = 'actRefreshPart'
      ImageIndex = 0
      OnExecute = actRefreshPartExecute
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
        AllowClose = False
        Caption = #1054#1073#1098#1077#1082#1090
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 421
        FloatTop = 247
        FloatClientWidth = 104
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
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Part1'
        DockControl = dxBarDockControlPart1Top
        DockedDockControl = dxBarDockControlPart1Top
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 242
        FloatTop = 277
        FloatClientWidth = 161
        FloatClientHeight = 64
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            Item = dcBeginDate
            Visible = True
          end
          item
            Item = dcEndDate
            Visible = True
          end
          item
            Item = dxBarCombo1
            Visible = True
          end>
        Name = 'Part1'
        NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
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
    object dcBeginDate: TdxBarDateCombo
      Caption = #1055#1077#1088#1080#1086#1076' '#1089':'
      Category = 0
      Hint = #1055#1077#1088#1080#1086#1076' '#1089':'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
      ShowClearButton = False
    end
    object dcEndDate: TdxBarDateCombo
      Caption = #1087#1086':'
      Category = 0
      Hint = #1087#1086':'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDD00000000000DDDDD0FFFFFFFFF0D00000F0000000F0D0FFF0FFFFFFF
        FF0D0F000FFF11FFFF0D0FFF0FFF11FFFF0D0FF10FFFF11FFF0D0FF10FFFFF11
        FF0D0FF10FF11111FF0D0FF10FFFFFFFFF0D0FF104444444440D0FFF04444444
        440D044400000000000D04444444440DDDDD00000000000DDDDD}
      ShowCaption = True
      Width = 100
      ShowClearButton = False
    end
    object dxBarButton1: TdxBarButton
      Action = actRefreshPart
      Category = 0
    end
    object dxBarCombo1: TdxBarCombo
      Align = iaRight
      Caption = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
      Category = 0
      Hint = #1051#1080#1094#1077#1074#1086#1081' '#1089#1095#1077#1090
      Visible = ivAlways
      Text = #1042#1089#1077
      ShowCaption = True
      Width = 100
      Items.Strings = (
        #1042#1089#1077
        #1055#1086' '#1094#1077#1083#1077#1074#1086#1084#1091' '#1089#1095#1077#1090#1091)
      ItemIndex = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select P.*,'
      
        '       nvl((select '#39'Y'#39' from fdc_subject where parent_id = p.subj' +
        'ect_id and rownum = 1),'#39'N'#39') as is_filial'
      '  from FDC_PERSONAL_ACCOUNT_LST P'
      ' where ID = :ID')
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPARENT_ID: TFloatField
      FieldName = 'PARENT_ID'
    end
    object dsDataSUBJECT_NAME: TStringField
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object dsDataEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
    object dsDataIS_FILIAL: TStringField
      FieldName = 'IS_FILIAL'
      Size = 1
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_personal_account_add(pname      => :name,'
      '                                   psdate     => :sdate,'
      '                                   pedate     => :edate,'
      '                                   psubjectid => :subject_id,'
      '                                   pparentid  => :parent_id,'
      '                                   pDescript  => :descript);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descript'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_personal_account_upd(pid        => :id,'
      '                           pname      => :name,'
      '                           psdate     => :sdate,'
      '                           pedate     => :edate,'
      '                           psubjectid => :subject_id,'
      '                           pparentid  => :parent_id,'
      '                           pDescript  => :descript );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'subject_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'parent_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'descript'
        ParamType = ptUnknown
      end>
  end
  object dsSvodOstPart1: TDataSource
    DataSet = odsSvodOstPart1
    Left = 658
    Top = 270
  end
  object odsSvodOstPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as  (select id'
      '        from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '        start with id = :Id'
      '        connect by prior id = parent_id)'
      'select DOC_NUMBER,DOC_DATE,DOC_SUMMA,kbk,po_kbk,'
      '       ost_sum - nvl(block_summa,0) as ost_sum,'
      '       block_summa'
      'from '
      
        '(select po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,di.code po_kbk,r.' +
        'kbk,'
      '       sum(r.reg_sum) ost_sum,'
      '       (select sum(re.summa) from fdc_reserved_payment_lst re '
      '        where re.payment_id = r.payment_id '
      '          and re.kbkcode = r.kbk '
      '          and re.edate is null) as block_summa'
      'from ls s,'
      '     fdc_po_credit_lst po,'
      '     fdc_dict_lst      di,   '
      '     fdc_rest_reg      r'
      'where'
      '    s.id   = po.personal_account_id'
      'and di.id  = po.KBKCODE_ID   '
      'and po.id  = r.payment_id'
      'and po.TypeSYSNAME <> '#39'PaymentOrderConfirm'#39
      
        'group by po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,di.code,r.kbk,r.' +
        'payment_id'
      'having sum(r.reg_sum)>0)')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 658
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end>
    object odsSvodOstPart1DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 20
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object odsSvodOstPart1DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'DOC_DATE'
    end
    object odsSvodOstPart1DOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
    object odsSvodOstPart1KBK: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
    object odsSvodOstPart1OST_SUM: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'OST_SUM'
    end
    object odsSvodOstPart1BLOCK_SUMMA: TFloatField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
      DisplayWidth = 20
      FieldName = 'BLOCK_SUMMA'
    end
    object odsSvodOstPart1PO_KBK: TStringField
      DisplayLabel = #1050#1041#1050' '#1055#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'PO_KBK'
      Size = 1500
    end
  end
  object GridPopupMenu: TcxGridPopupMenu
    Grid = grdData
    PopupMenus = <
      item
        GridView = grdDataDBBandedTableView
        HitTypes = [gvhtGridNone, gvhtNone, gvhtCell, gvhtRecord, gvhtPreview]
        Index = 0
      end>
    AlwaysFireOnPopup = True
    Left = 584
    Top = 79
  end
  object odsZalogPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id'
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      
        'select po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,po.kbk,sum( d.summ' +
        'a ) summa'
      'from ls s,'
      '     fdc_payment_deduction_lst d,'
      '     fdc_tr_lst tr,'
      '     fdc_po_lst po'
      'where'
      '    s.id           = d.personal_account_id'
      'and d.decl_id      = tr.id'
      'and po.ID          = d.payment_id'
      'group by po.DOC_NUMBER,po.DOC_DATE,po.DOC_SUMMA,po.kbk'
      'having sum( d.summa ) > 0')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 722
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object odsZalogPart1DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 20
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object odsZalogPart1DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'DOC_DATE'
    end
    object odsZalogPart1DOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
    object odsZalogPart1KBK: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
    object odsZalogPart1SUMMA: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'SUMMA'
    end
  end
  object dsZalogPart1: TDataSource
    DataSet = odsZalogPart1
    Left = 722
    Top = 286
  end
  object odsPayDrivePart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      'SELECT distinct'
      '       po.DOC_NUMBER,'
      '       po.DOC_DATE,'
      '       po.DOC_SUMMA,'
      '       po.kbk,'
      '       case when po.TypeSYSNAME = '#39'CashlessPaymentOrder'#39' then'
      '            '#39#1048#1059#39
      '       else case when po.TypeSYSNAME = '#39'CashOrderCustoms'#39' then'
      '                 '#39#1050#1058#39
      '            else case when po.TypeSYSNAME = '#39'CashOrderBank'#39' then'
      '                      '#39#1055#1050#39
      
        '                 else case when po.TypeSYSNAME = '#39'CustomCheque'#39' ' +
        'then'
      '                           '#39#1052#1050#39
      '                      else'
      '                           null'
      '                      end '
      '                 end'
      '            end'
      '       end as sp,          '
      
        '       ( SELECT replace( fdc_str_agg( DISTINCT a.code ), '#39', '#39', c' +
        'hr(13) || chr(10) )'
      '                             FROM fdc_acc_transaction t'
      '                                 ,fdc_acc_light_lst   a'
      '                             WHERE t.doc_id = po.id'
      '                               AND t.account_id = a.id ) AS  ou'
      '            '
      'from ls s,'
      '     fdc_po_lst po'
      'where'
      '      po.personal_account_id = s.id'
      ' and  po.SUMMA       is null  '
      ''
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    AfterOpen = odsPayDrivePart1AfterOpen
    Left = 786
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 20
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'DOC_DATE'
    end
    object FloatField1: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
    object StringField2: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
    object odsPayDrivePart1SP: TStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073
      DisplayWidth = 20
      FieldName = 'SP'
      Size = 2
    end
    object odsPayDrivePart1OU: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      DisplayWidth = 4000
      FieldName = 'OU'
      Size = 4000
    end
  end
  object dsPayDrivePart1: TDataSource
    DataSet = odsPayDrivePart1
    Left = 786
    Top = 270
  end
  object odsVozvratPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      'select d.DOC_NUMBER,'
      '       d.DOC_DATE,'
      '       d.SUMMA DOC_SUMMA,'
      
        '       ( SELECT replace( fdc_str_agg( DISTINCT a.code ), '#39', '#39', c' +
        'hr(13) || chr(10) )'
      '                             FROM fdc_acc_transaction t'
      '                                 ,fdc_acc_light_lst   a'
      '                             WHERE t.doc_id = d.id'
      '                               AND t.account_id = a.id ) as ou'
      'from ls s,'
      '     fdc_decision_payback_lst d'
      'where'
      '      d.personal_account_id = s.id'
      
        '  and exists (select 1 from fdc_payment_order_payback_lst p,fdc_' +
        'state_lst s'
      '              where p.DEC_PAY_ID = d.id'
      '                and p.state_id   = s.id'
      '                and s.NAME       = '#39#1054#1090#1087#1088#1072#1074#1083#1077#1085#39')')
    BeforeOpen = odsOperationPart1BeforeOpen
    AfterOpen = odsVozvratPart1AfterOpen
    Left = 850
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField3: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 20
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 20
      FieldName = 'DOC_DATE'
    end
    object FloatField3: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
    object StringField6: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      DisplayWidth = 4000
      FieldName = 'OU'
      Size = 4000
    end
  end
  object dsVozvratPart1: TDataSource
    DataSet = odsVozvratPart1
    Left = 850
    Top = 254
  end
  object odsTurnoverPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as  (select id,subject_id'
      '        from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '        start with id = :Id'
      '        connect by prior id = parent_id)'
      ''
      'select s.kbk,'
      '       sum(sum_ost_in) as sum_ost_in,'
      '       sum(sum_in)     as sum_in,'
      '       sum(sum_r)      as sum_r,'
      '       sum(sum_ded)    as sum_ded,'
      '       sum(sum_vz)     as sum_vz,'
      
        '       sum(sum_ost_in) +  sum(sum_in) + sum(sum_r) - sum(sum_ded' +
        ') - sum(sum_vz) as sum_out'
      'from fdc_po_lst po,'
      '     (-- '#1074#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      '      select r.kbk,'
      '             po.id     as payment_id,'
      '             r.reg_sum as sum_ost_in,'
      '             0         as sum_in,'
      '             0         as sum_r,'
      '             0         as sum_ded,'
      '             0         as sum_vz'
      '      from   ls        s,'
      '             fdc_po_lst        po,'
      '             fdc_rest_date_reg r'
      '      where  po.personal_account_id = s.id'
      '         and r.payment_id = po.id'
      '         and trunc(r.reg_date)   < :pDateBegin'
      '         and  po.TypeSYSNAME <> '#39'PaymentOrderConfirm'#39
      '      union all'
      '      -- '#1087#1088#1080#1093#1086#1076
      '      select kbk,'
      '             po.id     as payment_id,'
      '             0         as sum_ost_in,'
      '             po.summa  as sum_in,'
      '             0         as sum_r,'
      '             0         as sum_ded,'
      '             0         as sum_vz'
      '      from   fdc_po_credit_lst po,'
      '             ls s'
      '      where'
      '            s.id = po.personal_account_id '
      
        '       and  trunc(po.ACTIVATION_DATE) between :pDateBegin and :p' +
        'DateEnd'
      '       and  po.TypeSYSNAME <> '#39'PaymentOrderConfirm'#39
      '      union all'
      '      -- '#1079#1072#1095#1077#1090
      '      select re.KBKCode as kbk,'
      '             re.payment_id,'
      '             0          as sum_ost_in,'
      '             0          as sum_in,'
      '             re.summa   as sum_r,'
      '             0          as sum_ded,'
      '             0          as sum_vz      '
      '      from ls s,'
      '           fdc_decision_payment_lst  dp,'
      '           fdc_state_lst             st,'
      '           fdc_value_lst             v,'
      '           fdc_reserved_payment_lst  re'
      '      where'
      '            s.id           = dp.personal_account_id'
      '        and st.id          = dp.state_id'
      '        and st.NAME        = '#39#1055#1086#1076#1087#1080#1089#1072#1085#1086#39
      
        '        and trunc(dp.ACTIVATION_DATE) between :pDateBegin and :p' +
        'DateEnd'
      '        and v.OWNER_OBJECT_ID = dp.id'
      '        and v.Ref_Object_ID   = re.id'
      '      union all'
      '      -- '#1089#1087#1080#1089#1072#1085#1080#1103
      '      select de.KBKCode1 as kbk,'
      '             de.payment_id,'
      '             0         as sum_odt_in,'
      '             0         as sum_in,'
      '             0         as sum_r,'
      '             de.summa  as sum_ded,'
      '             0         as sum_vz'
      '      from  fdc_payment_deduction_lst de,'
      '            fdc_po_lst po,'
      '            ls s     '
      '      where'
      '          s.id = po.personal_account_id'
      '      and de.payment_id = po.id'
      
        '      and trunc(de.ACTIVATION_DATE) between :pDateBegin and :pDa' +
        'teEnd'
      '      union all'
      '      -- '#1074#1086#1079#1074#1088#1072#1090
      '      select kbk,'
      '             pb.id    as payment_id,'
      '             0        as sum_odt_in,'
      '             0        as sum_in,'
      '             0        as sum_r,'
      '             0        as sum_ded,'
      '             pb.summa as sum_vz'
      '      from  fdc_payment_order_payback_lst pb,'
      '            ls s     '
      '      where'
      '          s.id = pb.personal_account_id         '
      
        '      and trunc(pb.doc_date) between :pDateBegin and :pDateEnd )' +
        ' s'
      'where po.id = s.payment_id'
      '  and exists (select 1 from ls '
      '              where subject_id = po.PAYER_ID)'
      'group by s.kbk')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 586
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end>
    object odsTurnoverPart1KBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
    object odsTurnoverPart1SUM_OST_IN: TFloatField
      DisplayLabel = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'SUM_OST_IN'
    end
    object odsTurnoverPart1SUM_IN: TFloatField
      DisplayLabel = #1055#1086#1089#1090#1091#1087#1080#1083#1086
      DisplayWidth = 20
      FieldName = 'SUM_IN'
    end
    object odsTurnoverPart1SUM_R: TFloatField
      DisplayLabel = #1047#1072#1095#1090#1077#1085#1086
      DisplayWidth = 20
      FieldName = 'SUM_R'
    end
    object odsTurnoverPart1SUM_DED: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      DisplayWidth = 20
      FieldName = 'SUM_DED'
    end
    object odsTurnoverPart1SUM_VZ: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1097#1077#1085#1086
      DisplayWidth = 20
      FieldName = 'SUM_VZ'
    end
    object odsTurnoverPart1SUM_OUT: TFloatField
      DisplayLabel = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'SUM_OUT'
    end
  end
  object dsTurnoverPart1: TDataSource
    DataSet = odsTurnoverPart1
    Left = 586
    Top = 254
  end
  object dsSvodOstPart1_SV: TDataSource
    DataSet = odsSvodOstPart1_SV
    Left = 50
    Top = 86
  end
  object odsSvodOstPart1_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as  (select id'
      '        from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '        start with id = :Id'
      '        connect by prior id = parent_id)'
      
        'select r.kbk,sum(po.doc_summa)as doc_summa,sum(r.reg_sum) ost_su' +
        'm,sum(re.summa) as block_summa'
      'from ls s,'
      '     fdc_po_credit_lst po,'
      '     fdc_rest_reg r'
      
        'left outer join fdc_reserved_payment_lst re on re.payment_id = r' +
        '.payment_id and re.kbkcode = r.kbk and re.edate is null'
      'where'
      '    s.id = po.personal_account_id'
      'and po.id  = r.payment_id'
      'and po.TypeSYSNAME <> '#39'PaymentOrderConfirm'#39
      'group by r.kbk'
      'having sum(r.reg_sum)>0'
      ''
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 50
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Id'
        ParamType = ptUnknown
      end>
    object StringField5: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
    object odsSvodOstPart1_SVDOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DOC_SUMMA'
    end
    object FloatField4: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'OST_SUM'
    end
    object FloatField5: TFloatField
      DisplayLabel = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085#1086
      DisplayWidth = 20
      FieldName = 'BLOCK_SUMMA'
    end
  end
  object odsZalogPart1_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      'select po.kbk,sum(po.doc_summa) doc_summa,sum( d.summa ) summa'
      'from ls s,'
      '     fdc_payment_deduction_lst d,'
      '     fdc_tr_lst tr,'
      '     fdc_po_lst po'
      'where'
      '    s.id           = d.personal_account_id'
      'and d.decl_id      = tr.id'
      'and po.ID          = d.payment_id'
      'group by po.kbk'
      'having sum( d.summa) >0'
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 50
    Top = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField7: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
    object FloatField6: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      DisplayWidth = 20
      FieldName = 'SUMMA'
    end
  end
  object dsZalogPart1_SV: TDataSource
    DataSet = odsZalogPart1_SV
    Left = 50
    Top = 198
  end
  object odsPayDrivePart1_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      'select sum(po.DOC_SUMMA) as DOC_SUMMA,'
      '       po.kbk'
      'from ls s,'
      '     fdc_po_lst po'
      'where'
      '      po.personal_account_id = s.id'
      ' and  po.SUMMA       is null  '
      'group by po.kbk'
      ''
      ''
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 50
    Top = 246
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
    object StringField8: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 25
      FieldName = 'KBK'
    end
  end
  object dsPayDrivePart1_SV: TDataSource
    DataSet = odsPayDrivePart1_SV
    Left = 50
    Top = 294
  end
  object odsVozvratPart1_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      'select sum(d.SUMMA) DOC_SUMMA'
      'from ls s,'
      '     fdc_decision_payback_lst d'
      'where'
      '      d.personal_account_id = s.id'
      
        '  and exists (select 1 from fdc_payment_order_payback_lst p,fdc_' +
        'state_lst s'
      '              where p.DEC_PAY_ID = d.id'
      '                and p.state_id   = s.id'
      '                and s.NAME       = '#39#1054#1090#1087#1088#1072#1074#1083#1077#1085#39')')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 50
    Top = 342
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object FloatField7: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 20
      FieldName = 'DOC_SUMMA'
    end
  end
  object dsVozvratPart1_SV: TDataSource
    DataSet = odsVozvratPart1_SV
    Left = 50
    Top = 390
  end
  object odsOperationPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id,subject_id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       doc.activation_date,'
      '       po.DOC_NUMBER,'
      '       po.DOC_DATE,'
      '       po.DOC_SUMMA,'
      '       po.kbk,'
      '       po.payer_inn,'
      '       po.payer_kpp,'
      '       -- '#1087#1088#1080#1093#1086#1076
      '       case when doc.TypeSYSNAME = '#39'CashlessPaymentOrder'#39' then'
      '            '#39#1041#1053#39
      '       else case when doc.TypeSYSNAME = '#39'CashOrderCustoms'#39' then'
      '                 '#39#1050#1058#39
      
        '            else case when doc.TypeSYSNAME = '#39'CashOrderBank'#39' the' +
        'n'
      '                      '#39#1055#1050#39
      
        '                 else case when doc.TypeSYSNAME = '#39'CustomCheque'#39 +
        ' then'
      '                           '#39#1052#1050#39
      '                      else'
      '                           null'
      '                      end '
      '                 end'
      '            end'
      '       end as sp_in,          '
      '       pr.sum_in,'
      '       pr.ou_in,'
      '       -- '#1079#1072#1095#1077#1090
      '       dp.doc_date     as doc_date_dp,'
      '       dp.doc_number   as doc_number_dp,'
      '       dp.sum_dr_in,'
      '       dp.sum_dp,'
      '       --'#1047#1072#1083#1086#1075
      '       tr.customs_code as customs_code_tr,'
      '       tr.doc_number   as doc_number_tr,'
      '       tr.doc_date     as doc_date_tr,'
      '       tr.sum_rub      as sum_tr,'
      '       tr.sum_rub_pg   as sum_tr_pg,'
      '       --'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      '       dc.customs_code as customs_code_dc,'
      '       dc.doc_date     as doc_date_dc,'
      '       dc.decl_no      as doc_number_dc,'
      '       dc.kbkcode_code as kbkcode_dc,'
      '       dc.sum_ded      as sum_ded_dc,'
      '       dc.ou           as ou_ded_dc,'
      '       --'#1042#1086#1079#1074#1088#1072#1090#1099
      '       de.doc_date     as doc_date_pb,'
      '       de.doc_number   as doc_number_pb,'
      '       de.sum_de       as sum_pb,'
      '       de.sum_dr_out'
      'from   fdc_po_lst po,'
      '       fdc_document_lst doc'
      '-- '#1087#1088#1080#1093#1086#1076
      'left outer join (select  po.id,'
      '                         po.summa  as sum_in,'
      
        '                         ( SELECT replace( fdc_str_agg( DISTINCT' +
        ' a.code ), '#39', '#39', chr(13) || chr(10) )'
      '                             FROM fdc_acc_transaction t'
      '                                 ,fdc_acc_light_lst   a'
      '                             WHERE t.doc_id = po.id'
      
        '                               AND t.account_id = a.id ) as ou_i' +
        'n'
      '                  from   fdc_po_credit_lst po,'
      '                         ls s'
      '                  where'
      '                        s.id = po.personal_account_id'
      
        '                   and  not po.TypeSYSNAME in ('#39'PaymentOrderReus' +
        'e'#39', '#39'PaymentOrderConfirm'#39')'
      '                  ) pr on pr.id = doc.id'
      '--'#1047#1072#1095#1077#1090
      'left outer join (-- '#1047#1072#1095#1077#1090#1099' c '#1076#1088#1091#1075#1086#1081' '#1090#1072#1084#1086#1078#1085#1080
      
        '                 select dr.id,dr.doc_date,dr.doc_number,d.paymen' +
        't_id,sum(d.summa) sum_dr_in,0 as sum_dp'
      '                  from ls s,'
      '                       fdc_doc_reuse_customs_lst    dr,'
      '                       fdc_deduction_reuse_lst      d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = dr.id'
      '                  and dr.CUSTOMS_CODE_NEW = p_params.CustomCode'
      
        '                 group by dr.id,dr.doc_date,dr.doc_number,d.paym' +
        'ent_id'
      '                 union all '
      '                 -- '#1047#1072#1095#1077#1090#1099' '#1074' '#1089#1095#1077#1090' '#1073#1091#1076#1091#1097#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      
        '                  select dp.id,dp.doc_date,dp.doc_number,re.paym' +
        'ent_id,0 as sum_dr_in,sum(re.summa) as sum_dp'
      '                  from ls s,'
      '                       fdc_decision_payment_lst  dp,'
      '                       fdc_state_lst             st,'
      '                       fdc_value_lst             v,'
      '                       fdc_reserved_payment_lst  re'
      '                  where'
      '                        s.id           = dp.personal_account_id'
      '                    and st.id          = dp.state_id'
      '                    and st.NAME        = '#39#1055#1086#1076#1087#1080#1089#1072#1085#1086#39
      '                    and v.OWNER_OBJECT_ID = dp.id'
      '                    and v.Ref_Object_ID   = re.id'
      
        '                 group by dp.id,dp.doc_date,dp.doc_number,re.pay' +
        'ment_id'
      '                 ) dp on dp.id = doc.id '
      '--'#1047#1072#1083#1086#1075
      
        'left outer join (select tr.id,sum(case when d.summa>0 then d.sum' +
        'ma else 0 end) as sum_rub,'
      
        '                        tr.doc_date,tr.doc_number,d.payment_id,t' +
        'r.customs_code,'
      '                        (select sum(r.summa) '
      '                         from fdc_decl_charge         dc,'
      '                              fdc_value_lst            v,'
      '                              fdc_decision_payment_lst de,'
      '                              fdc_value_lst            vr,'
      '                              fdc_reserved_payment_lst r'
      '                         where  dc.decl_id         = tr.id'
      '                            and v.Ref_Object_ID    = dc.id'
      '                            and v.OWNER_OBJECT_ID  = de.id'
      '                            and vr.OWNER_OBJECT_ID = de.id'
      
        '                            and vr.Ref_Object_ID   = r.id       ' +
        '        '
      
        '                            and d.payment_id       = r.payment_i' +
        'd'
      '                            and r.edate            is not null'
      '                         ) sum_rub_pg'
      '                  from ls s,'
      '                       fdc_payment_deduction_lst d,'
      '                       fdc_tr_lst tr'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = tr.id'
      
        '                 group by tr.id,tr.sum_rub,tr.doc_date,tr.doc_nu' +
        'mber,d.payment_id,tr.customs_code) tr on tr.id = doc.id '
      '--'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      'left outer join (select d.id'
      '                       ,dc.customs_code'
      '                       ,dc.doc_date'
      '                       ,nvl(dc.decl_no,dc.doc_number) decl_no'
      '                       ,d.KBKCode kbkcode_code'
      '                       ,d.payment_id'
      '                       ,sum(d.summa) sum_ded'
      '                       ,fdc_rep_get_doc_account( d.id ) as ou'
      '                  from ls                        s,'
      '                       fdc_doc_charge_lst        dc,'
      '                       fdc_payment_deduction_lst d,'
      '                       fdc_po_lst                po'
      '                  where d.decl_id      = dc.id'
      '                    and dc.typesysname <> '#39'TR'#39
      '                    and po.id          = d.payment_id'
      '                    and po.personal_account_id = s.id'
      '                 group by d.id'
      '                         ,dc.customs_code'
      '                         ,dc.doc_date'
      '                         ,dc.decl_no'
      '                         ,dc.doc_number'
      '                         ,d.KBKCode '
      '                         ,d.payment_id'
      '                         ,fdc_rep_get_doc_account( d.id )'
      '                 ) dc on dc.id = doc.id'
      ''
      'left outer join (--'#1042#1086#1079#1074#1088#1072#1090
      
        '                 select de.id,de.doc_date,de.doc_number,d.paymen' +
        't_id,sum(d.summa) sum_de,0 as sum_dr_out'
      '                  from ls s,'
      '                       fdc_decision_lst          de,'
      '                       fdc_payment_deduction_lst d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = de.id'
      
        '                 group by de.id,de.doc_date,de.doc_number,d.paym' +
        'ent_id'
      '                 union all '
      '                 -- '#1047#1072#1095#1077#1090#1099' '#1085#1072' '#1076#1088#1091#1075#1091#1102' '#1090#1072#1084#1086#1078#1085#1102
      
        '                 select dr.id,dr.doc_date,dr.doc_number,d.paymen' +
        't_id,0 as sum_de,sum(d.summa) sum_dr_out'
      '                  from ls s,'
      '                       fdc_doc_reuse_customs_lst    dr,'
      '                       fdc_deduction_reuse_lst      d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.decl_id      = dr.id'
      '                  and dr.CUSTOMS_CODE_NEW <> p_params.CustomCode'
      
        '                 group by dr.id,dr.doc_date,dr.doc_number,d.paym' +
        'ent_id'
      '                 ) de on de.id = doc.id '
      
        'where (pr.id is not null or tr.id is not null or dc.id is not nu' +
        'll or de.id is not null or dp.id is not null)'
      '  and (po.id = case when pr.id is not null then pr.id '
      
        '               else case when tr.id is not null then tr.payment_' +
        'id '
      
        '               else case when dc.id is not null then dc.payment_' +
        'id '
      
        '               else case when de.id is not null then de.payment_' +
        'id '
      
        '               else case when dp.id is not null then dp.payment_' +
        'id '
      '               else null end'
      '               end'
      '               end'
      '               end'
      '               end)'
      '  and exists (select 1 from ls'
      '              where subject_id = po.PAYER_ID)'
      
        '  and  trunc(doc.activation_date) between :pDateBegin and :pDate' +
        'End'
      'order by doc.activation_date,pr.id,tr.id,dc.id,de.id,dp.id   ')
    BeforeOpen = odsOperationPart1BeforeOpen
    AfterOpen = odsOperationPart1AfterOpen
    Left = 506
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end>
    object odsOperationPart1TYPESYSNAME: TStringField
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object odsOperationPart1ACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'ACTIVATION_DATE'
    end
    object odsOperationPart1DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object odsOperationPart1DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object odsOperationPart1DOC_SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'DOC_SUMMA'
    end
    object odsOperationPart1KBK: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBK'
    end
    object odsOperationPart1PAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object odsOperationPart1PAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object odsOperationPart1SP_IN: TStringField
      DisplayLabel = #1057#1087#1086#1089#1086#1073
      FieldName = 'SP_IN'
      Size = 2
    end
    object odsOperationPart1SUM_IN: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_IN'
    end
    object odsOperationPart1OU_IN: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      FieldName = 'OU_IN'
      Size = 4000
    end
    object odsOperationPart1DOC_DATE_DP: TDateTimeField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_DATE_DP'
    end
    object odsOperationPart1DOC_NUMBER_DP: TStringField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_NUMBER_DP'
      Size = 100
    end
    object odsOperationPart1SUM_DR_IN: TFloatField
      DisplayLabel = #1057' '#1076#1088'. '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'SUM_DR_IN'
    end
    object odsOperationPart1SUM_DP: TFloatField
      DisplayLabel = #1048#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
      FieldName = 'SUM_DP'
    end
    object odsOperationPart1CUSTOMS_CODE_TR: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE_TR'
      Size = 8
    end
    object odsOperationPart1DOC_NUMBER_TR: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER_TR'
      Size = 100
    end
    object odsOperationPart1DOC_DATE_TR: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE_TR'
    end
    object odsOperationPart1SUM_TR: TFloatField
      DisplayLabel = #1054#1092#1086#1088#1084#1083#1077#1085#1086
      FieldName = 'SUM_TR'
    end
    object odsOperationPart1SUM_TR_PG: TFloatField
      DisplayLabel = #1055#1086#1075#1072#1096#1077#1085#1086
      FieldName = 'SUM_TR_PG'
    end
    object odsOperationPart1CUSTOMS_CODE_DC: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE_DC'
      Size = 8
    end
    object odsOperationPart1DOC_DATE_DC: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE_DC'
    end
    object odsOperationPart1DOC_NUMBER_DC: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER_DC'
      Size = 10
    end
    object odsOperationPart1KBKCODE_DC: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBKCODE_DC'
      Size = 1500
    end
    object odsOperationPart1SUM_DED_DC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_DED_DC'
    end
    object odsOperationPart1OU_DED_DC: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      FieldName = 'OU_DED_DC'
      Size = 4000
    end
    object odsOperationPart1DOC_DATE_PB: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE_PB'
    end
    object odsOperationPart1DOC_NUMBER_PB: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER_PB'
      Size = 100
    end
    object odsOperationPart1SUM_PB: TFloatField
      DisplayLabel = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072
      FieldName = 'SUM_PB'
    end
    object odsOperationPart1SUM_DR_OUT: TFloatField
      DisplayLabel = #1044#1088'. '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'SUM_DR_OUT'
    end
  end
  object dsOperationPart1: TDataSource
    DataSet = odsOperationPart1
    Left = 506
    Top = 270
  end
  object odsOperationPart2: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       doc.activation_date,'
      
        '       (case when (fdc_object_get_typesysname(ch.decl_id) in ('#39'C' +
        'ustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39 +
        ') and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and ch.is' +
        '_treb = 1) then '#39#1058#1088#1077#1073' '#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39') and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') the' +
        'n '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TPO'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and ' +
        'ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TPO'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') the' +
        'n '#39#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge.Tr'#39' an' +
        'd ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge.Tr'#39') t' +
        'hen '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39' and c' +
        'h.is_treb = 1) then '#39#1058#1088#1077#1073' '#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'TR'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclCharge'#39') then' +
        ' '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeDebt'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeDebt'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39') then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeFine'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) =' +
        ' '#39'SubjectFeeFine'#39' and fdc_object_get_typesysname(ch.id) = '#39'DeclC' +
        'harge'#39') then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) =' +
        ' '#39'CustomDeclTempAdm'#39' and fdc_object_get_typesysname(ch.id) = '#39'Pa' +
        'yPeriodic'#39') then '#39#1042#1042#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason =  '#39'49'#39 +
        ' and ch.is_treb = 1) then '#39#1058#1088#1077#1073' '#1050#1058#1057#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason =  '#39'49'#39 +
        ') then '#39#1050#1058#1057#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason <> '#39'49'#39 +
        ' and ch.is_treb = 1) then '#39#1050#1055#39
      
        '        else case when (fdc_object_get_typesysname(ch.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'SubjectFeeDebt'#39','#39'SubjectFeeFine'#39') and fdc_object_get_type' +
        'sysname(ch.id) = '#39'DeclCharge.Correct'#39' and ch.code_reason <> '#39'49'#39 +
        ') then '#39#1050#1055#39
      
        '        else case when (fdc_object_get_typesysname(iu.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39') ) t' +
        'hen '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'CustomDecl'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDecl' +
        'Full'#39','#39'CustomDeclTempAdm'#39','#39'CustomDeclTime'#39','#39'CustomDeclFull'#39') ) t' +
        'hen '#39#1044#1058#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'TPO'#39') ) then '#39#1058#1055#1054#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'TR'#39') ) then '#39#1058#1056#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'SubjectFeeDebt'#39') ) then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1047#39
      
        '        else case when (fdc_object_get_typesysname(de.decl_id) i' +
        'n ('#39'SubjectFeeFine'#39') ) then '#39#1055#1088#1086#1095'.'#1057#1087'.-'#1064#39
      '        else'
      '        null'
      '        end'
      '        end'
      '        end '
      '        end'
      '        end '
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '         ) type_ch,'
      
        '       (select g37 from fdc_decl_goods_lst where decl_id = dc.id' +
        ' and rownum = 1) proc,'
      '       dc.customs_code,'
      '       nvl(dc.DECL_NO,dc.doc_number) as decl_no,'
      '       dc.doc_date,'
      '       case when ch.id is not null then ch.kbkcode'
      '        else case when iu.id is not null then iu.kbkcode'
      '        else case when de.id is not null then de.kbkcode'
      '        else case when z.id  is not null then z.kbkcode'
      '        else case when pb.id is not null then pb.kbkcode'
      '        else case when ot.id is not null then ot.kbkcode'
      '        else null'
      '        end'
      '        end'
      '        end'
      '        end'
      '        end'
      '       end kbkcode,'
      '       -- '#1053#1072#1095#1080#1089#1083#1077#1085#1080#1077
      '       ch.sum_ch,'
      '       -- '#1048#1079#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '       iu.sum_iu,'
      '       -- '#1054#1087#1083#1072#1090#1072
      '       de.sum_de,'
      '       de.ou_de,'
      '       -- '#1047#1072#1095#1077#1090
      '       z.sum_z,'
      '       -- '#1042#1086#1079#1074#1088#1072#1090
      '       pb.sum_pb,'
      '       -- '#1054#1090#1084#1077#1085#1072
      '       ot.osn_ot,'
      '       ot.sum_ot,'
      '       ot.ou_ot'
      'from   ls s,'
      '       fdc_doc_charge_lst dc,'
      '       fdc_document_lst   doc'
      '--'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      
        'left outer join (select c.id,di.code kbkcode,c.decl_id,c.code_re' +
        'ason,'
      
        '                        (select 1 from fdc_noticepay_charge_lst ' +
        'n'
      '                         where n.id = c.id) as  is_treb,'
      '                        sum(c.summa) sum_ch'
      '                  from ls s,'
      '                       fdc_decl_charge_hist_lst   c,'
      '                       fdc_document_lst           d,'
      '                       fdc_dict_lst               di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.id           = c.ID'
      '                  and c.kbkcode_id   = di.id'
      
        '                  group by c.id,di.code,c.decl_id,c.code_reason)' +
        ' ch on ch.id = doc.id '
      '--'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      
        'left outer join (select c.advice_id id,di.code kbkcode,c.decl_id' +
        ','
      '                        sum(c.summa) sum_iu'
      '                  from ls s,'
      '                       fdc_advice_charge_lst c,'
      '                       fdc_dict di'
      '                  where'
      '                        s.id           = c.personal_account_id'
      '                   and  di.id          = c.kbkcode_id'
      
        '                 group by c.advice_id,di.code,c.decl_id) iu on i' +
        'u.id = doc.id '
      '--'#1054#1087#1083#1072#1090#1072
      'left outer join (select d.id,d.kbkcode,d.decl_id,'
      '                        sum(d.summa) sum_de,'
      '                        fdc_rep_get_doc_account( d.id ) as ou_de'
      '                  from ls s,'
      '                       fdc_payment_deduction_lst d'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.typesysname  <> '#39'PaymentBack'#39
      '                group by d.id'
      '                        ,d.kbkcode'
      '                        ,d.decl_id'
      '                        ,fdc_rep_get_doc_account( d.id )'
      '                ) de on de.id = doc.id'
      '--'#1047#1072#1095#1077#1090
      
        'left outer join (select de.id,di.code as kbkcode,d.doc_id decl_i' +
        'd,'
      '                        sum(d.summa) sum_z'
      '                  from ls s,'
      '                       fdc_decision_payment_lst de,'
      '                       fdc_value_lst r,'
      '                       fdc_advice_reserve_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id              = de.personal_account_id'
      '                  and r.OWNER_OBJECT_ID = de.id'
      '                  and d.id              = r.REF_OBJECT_ID'
      '                  and di.id             = d.kbkcode_id'
      
        '                group by de.id,di.code,d.doc_id) z on z.id = doc' +
        '.id '
      '--'#1042#1086#1079#1074#1088#1072#1090
      'left outer join (select de.id,p.kbkcode,d.doc_id decl_id,'
      '                        sum(d.summa) sum_pb'
      '                  from ls                            s,'
      '                       fdc_decision_payback_lst      de,'
      '                       fdc_value_lst                 r,'
      '                       fdc_advice_reserve_lst        d,'
      '                       fdc_payment_order_payback_lst p'
      '                  where'
      '                      s.id              = de.personal_account_id'
      '                  and r.OWNER_OBJECT_ID = de.id '
      '                  and d.id              = r.REF_OBJECT_ID'
      '                  and p.DEC_PAY_ID      = de.id'
      
        '                group by de.id,p.kbkcode,d.doc_id) pb on pb.id =' +
        ' doc.id '
      '--'#1054#1090#1084#1077#1085#1072
      
        'left outer join (select d.noticepay_id id,di.code kbkcode,d.decl' +
        '_id,'
      '                        sum(d.summa) sum_ot,'
      '                        '#39'-'#39' ou_ot,'
      '                        to_char(null) as osn_ot'
      '                  from ls s,'
      '                       fdc_noticepay_charge_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and d.summa        < 0'
      '                  and di.id          = d.kbkcode_id    '
      
        '                group by d.noticepay_id,di.code,d.decl_id) ot on' +
        ' ot.id = doc.id '
      'where s.id  = doc.personal_account_id'
      
        '  and (ch.id is not null or iu.id is not null or de.id is not nu' +
        'll or z.id is not null or pb.id is not null or ot.id is not null' +
        ')'
      '  and dc.id = (case when ch.id is not null then ch.decl_id'
      '               else case when iu.id is not null then iu.decl_id'
      '               else case when de.id is not null then de.decl_id'
      '               else case when z.id  is not null then z.decl_id'
      '               else case when pb.id is not null then pb.decl_id'
      '               else case when ot.id is not null then ot.decl_id'
      '               else'
      '               null '
      '               end'
      '               end'
      '               end'
      '               end'
      '               end'
      '               end)'
      
        '  and   trunc(doc.activation_date)  between :pDateBegin and :pDa' +
        'teEnd '
      'order by doc.activation_date,ch.id,iu.id,de.id,z.id,ot.id'
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    AfterOpen = odsOperationPart2AfterOpen
    Left = 482
    Top = 334
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end>
    object odsOperationPart2TYPESYSNAME: TStringField
      DisplayWidth = 100
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object odsOperationPart2ACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'ACTIVATION_DATE'
    end
    object odsOperationPart2TYPE_CH: TStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'TYPE_CH'
      Size = 200
    end
    object odsOperationPart2PROC: TStringField
      DisplayLabel = #1055#1088#1086#1094#1077#1076#1091#1088#1072
      FieldName = 'PROC'
      Size = 7
    end
    object odsOperationPart2CUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object odsOperationPart2DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object odsOperationPart2DECL_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Size = 10
    end
    object odsOperationPart2KBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object odsOperationPart2SUM_CH: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1082' '#1091#1087#1083#1072#1090#1077
      FieldName = 'SUM_CH'
    end
    object odsOperationPart2SUM_IU: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072', '#1080#1079#1083#1080#1096#1085#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1085#1072#1103' '#1082' '#1091#1087#1083#1072#1090#1077
      FieldName = 'SUM_IU'
    end
    object odsOperationPart2SUM_DE: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_DE'
    end
    object odsOperationPart2OU_CH: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      FieldName = 'OU_DE'
      Size = 4000
    end
    object odsOperationPart2SUM_Z: TFloatField
      DisplayLabel = #1047#1072#1095#1077#1090' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
      FieldName = 'SUM_Z'
    end
    object odsOperationPart2SUM_PB: TFloatField
      DisplayLabel = #1042#1086#1079#1074#1088#1072#1090' '#1080#1079#1083#1080#1096#1085#1077#1081' '#1091#1087#1083#1072#1090#1099
      FieldName = 'SUM_PB'
    end
    object odsOperationPart2OSN_OT: TStringField
      DisplayLabel = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '
      FieldName = 'OSN_OT'
      Size = 0
    end
    object odsOperationPart2SUM_OT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM_OT'
    end
    object odsOperationPart2OU_OT: TStringField
      DisplayLabel = #1057#1095#1077#1090' '#1054#1059
      FieldName = 'OU_OT'
      Size = 1
    end
  end
  object dsOperationPart2: TDataSource
    DataSet = odsOperationPart2
    Left = 482
    Top = 382
  end
  object odsNonPaysPart2: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      ''
      'select doc.TypeSysName,'
      '       dc.customs_code,'
      '       nvl(dc.DECL_NO,dc.doc_number) decl_no,'
      '       dc.doc_date,'
      '       case when iu.id is not null then iu.kbkcode'
      '        else case when ot.id is not null then ot.kbkcode'
      '        else null'
      '        end'
      '       end kbkcode,'
      '       -- '#1048#1079#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '       iu.sum_iu,'
      '       -- '#1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      '       ot.sum_ot'
      'from   ls s,'
      '       fdc_doc_charge_lst dc,'
      '       fdc_document_lst   doc'
      '--'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      'left outer join (select a.id,di.code kbkcode,c.doc_id decl_id,'
      '                        sum(c.summa) sum_iu'
      '                  from ls s,'
      '                       fdc_advice_lst a,'
      '                       fdc_advice_reserve_lst c,'
      '                       fdc_dict di'
      '                  where'
      '                       s.id           = a.personal_account_id'
      '                   and c.advice_id    = a.id     '
      '                   and di.id          = c.kbkcode_id'
      '                   and c.edate        is null'
      
        '                 group by a.id,di.code,c.doc_id) iu on iu.id = d' +
        'oc.id '
      '--'#1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      'left outer join (select d.id,di.code kbkcode,d.decl_id,'
      '                        sum(d.summa-d.payed) sum_ot'
      '                  from ls s,'
      '                       fdc_noticepay_charge_lst d,'
      '                       fdc_dict di'
      '                  where'
      '                      s.id           = d.personal_account_id'
      '                  and di.id          = d.kbkcode_id    '
      
        '                group by d.id,di.code,d.decl_id) ot on ot.id = d' +
        'oc.id '
      'where s.id  = doc.personal_account_id'
      '  and (iu.id is not null or ot.id is not null)'
      '  and dc.id = (case when iu.id is not null then iu.decl_id'
      '               else case when ot.id is not null then ot.decl_id'
      '               else'
      '               null '
      '               end'
      '               end)'
      'order by dc.doc_date,iu.id,ot.id'
      '')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 626
    Top = 334
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object odsNonPaysPart2TYPESYSNAME: TStringField
      DisplayWidth = 100
      FieldName = 'TYPESYSNAME'
      Visible = False
      Size = 1500
    end
    object odsNonPaysPart2CUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object odsNonPaysPart2DECL_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DECL_NO'
      Size = 10
    end
    object odsNonPaysPart2DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object odsNonPaysPart2KBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object odsNonPaysPart2SUM_IU: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1087#1083#1072#1090#1099
      FieldName = 'SUM_IU'
    end
    object odsNonPaysPart2SUM_OT: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      FieldName = 'SUM_OT'
    end
  end
  object dsNonPaysPart2: TDataSource
    DataSet = odsNonPaysPart2
    Left = 626
    Top = 382
  end
  object odsNotReestrPart2: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      'select nvl(dc.CUSTOMS_CODE,doc.ext_source) as CUSTOMS_CODE,'
      '       nvl(dc.DECL_NO,doc.doc_number)      as doc_number,'
      '       dc.doc_date,'
      '       pd.KBKCode,'
      '       pd.summa'
      'from ls s,'
      '     fdc_deduction_budget d,'
      '     fdc_payment_deduction_lst pd,'
      '     fdc_document_lst doc'
      'left outer join fdc_doc_charge_lst dc on dc.id = doc.id      '
      'where'
      '     d.id = pd.id'
      'and  pd.personal_account_id =  s.id    '
      'and  doc.id                 = pd.decl_id'
      'and  doc.typesysname <> '#39'TR'#39
      'and  not exists (select 1'
      '                 from fdc_rel_skindpay_deduct rsd'
      '                     ,fdc_object_relation r'
      '                 where r.id = rsd.id'
      '                   and r.Rel_Object_Id = pd.id)')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 698
    Top = 318
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object odsNotReestrPart2CUSTOMS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object odsNotReestrPart2DOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object odsNotReestrPart2DOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object odsNotReestrPart2KBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object odsNotReestrPart2SUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
    end
  end
  object dsNotReestrPart2: TDataSource
    DataSet = odsNotReestrPart2
    Left = 698
    Top = 366
  end
  object odsTurnoverPart2: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      ''
      'select       kbkcode,'
      '             sum(sum_in_a)   as sum_in,'
      '             sum(sum_ch)     as sum_ch,'
      '             sum(sum_iu)     as sum_iu,'
      '             sum(sum_de)     as sum_de,'
      '             sum(sum_ot)     as sum_ot,'
      
        '             sum(sum_in_a) + sum(sum_ch)+ sum(sum_iu) - sum(sum_' +
        'de) - sum(sum_ot) as sum_out'
      ''
      'from (--'#1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      '      select dc.kbkcode_code    as kbkcode,'
      '             sum(dc.summa)      as sum_in_a,'
      '             0                  as sum_ch,'
      '             0                  as sum_iu,'
      '             0                  as sum_de,'
      '             0                  as sum_ot'
      '      from ls s,'
      '           fdc_decl_charge_lst   dc'
      '      where'
      '          s.id           = dc.personal_account_id'
      '      and trunc(dc.ACTIVATION_DATE) < :pDateBegin'
      '      group by dc.kbkcode_code'
      '      union all'
      '      --'#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      '      select dc.kbkcode_code    as kbkcode,'
      '             0                  as sum_in_a,'
      '             sum(dc.summa)      as sum_ch,'
      '             0                  as sum_iu,'
      '             0                  as sum_de,'
      '             0                  as sum_ot'
      '      from ls s,'
      '           fdc_decl_charge_lst   dc'
      '      where'
      '          s.id           = dc.personal_account_id'
      
        '      and trunc(dc.ACTIVATION_DATE) between :pDateBegin and :pDa' +
        'teEnd'
      '      group by dc.kbkcode_code '
      '      union all'
      '      -- '#1080#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '      select di.code                     as kbkcode,'
      '             0                           as sum_in_a,'
      '             0                           as sum_ch,'
      '             -sum(r.summa)               as sum_iu,'
      '             0                           as sum_de,'
      '             0                           as sum_ot'
      '      from ls s,'
      '           fdc_advice_lst           a,'
      '           fdc_advice_charge_lst    r,'
      '           fdc_dict                 di'
      '      where'
      '            s.id           = a.personal_account_id'
      '       and  r.advice_id    = a.id'
      '       and  di.id          = r.kbkcode_id'
      
        '       and trunc(a.ACTIVATION_DATE) between :pDateBegin and :pDa' +
        'teEnd'
      '      group by di.code '
      '      union all'
      '      -- '#1040#1085#1091#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1058#1055#1054
      '      select d.kbkcode                   as kbkcode,'
      '             0                           as sum_in_a,'
      '             0                           as sum_ch,'
      '             -sum(d.summa)               as sum_iu,'
      '             0                           as sum_de,'
      '             0                           as sum_ot'
      '      from ls s,'
      '           fdc_payment_deduction_lst d,'
      '           fdc_value_lst v,'
      '           fdc_annulment_tpo_lst a'
      '      where'
      '            s.id              = d.personal_account_id'
      '        and v.Ref_Object_ID   = d.id'
      '        and a.id              = v.OWNER_OBJECT_ID'
      
        '        and trunc(a.ACTIVATION_DATE) between :pDateBegin and :pD' +
        'ateEnd'
      '      group by d.kbkcode '
      '      union all'
      '      -- '#1054#1090#1084#1077#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1087#1086' '#1044#1058
      '      select d.kbkcode                   as kbkcode,'
      '             0                           as sum_in_a,'
      '             0                           as sum_ch,'
      '             -sum(d.summa)               as sum_iu,'
      '             0                           as sum_de,'
      '             0                           as sum_ot'
      '      from ls s,'
      '           fdc_payment_deduction_lst d,'
      '           fdc_value_lst v,'
      '           Fdc_Correction_Gtd_Lst a'
      '      where'
      '            s.id              = d.personal_account_id'
      '        and v.Ref_Object_ID   = d.id'
      '        and a.id              = v.OWNER_OBJECT_ID'
      
        '        and trunc(a.ACTIVATION_DATE) between :pDateBegin and :pD' +
        'ateEnd'
      '      group by d.kbkcode '
      '      -- '#1054#1090#1084#1077#1085#1072' '#1089#1087#1080#1089#1072#1085#1080#1081' '#1087#1086' '#1058#1055#1054
      '      union all'
      '      select d.kbkcode                   as kbkcode,'
      '             0                           as sum_in_a,'
      '             0                           as sum_ch,'
      '             -sum(d.summa)               as sum_iu,'
      '             0                           as sum_de,'
      '             0                           as sum_ot'
      '      from ls s,'
      '           fdc_payment_deduction_lst d,'
      '           fdc_value_lst v,'
      '           Fdc_Correction_Tpo_Lst a'
      '      where'
      '            s.id              = d.personal_account_id'
      '        and v.Ref_Object_ID   = d.id'
      '        and a.id              = v.OWNER_OBJECT_ID'
      
        '        and trunc(a.ACTIVATION_DATE) between :pDateBegin and :pD' +
        'ateEnd'
      '      group by d.kbkcode '
      '      union all'
      '      --'#1054#1087#1083#1072#1090#1072
      '      select d.KBKCode          as kbkcode,'
      '             0                  as sum_in_a,'
      '             0                  as sum_ch,'
      '             0                  as sum_iu,'
      '             sum(d.summa)       as sum_de,'
      '             0                  as sum_ot'
      '      from ls s,'
      '           fdc_payment_deduction_lst   d'
      '      where'
      '          s.id           = d.personal_account_id'
      
        '      and trunc(d.ACTIVATION_DATE) between :pDateBegin and :pDat' +
        'eEnd'
      '      group by d.KBKCode'
      '      union all'
      '      --'#1054#1090#1084#1077#1085#1072
      '      select di.code            as kbkcode,'
      '             0                  as sum_in_a,'
      '             0                  as sum_ch,'
      '             0                  as sum_iu,'
      '             0                  as sum_de,'
      '             sum(d.summa)       as sum_ot'
      '      from ls s,'
      '           fdc_noticepay_charge_lst d,'
      '           fdc_dict di,'
      '           fdc_noticepay_lst n'
      '      where'
      '          s.id           = d.personal_account_id'
      '      and d.summa        < 0'
      '      and di.id          = d.kbkcode_id  '
      '      and n.id           = d.noticepay_id  '
      
        '      and trunc(n.ACTIVATION_DATE) between :pDateBegin and :pDat' +
        'eEnd'
      '      group by di.code'
      '  )'
      'group by  kbkcode  ')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 554
    Top = 318
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateBegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'pDateEnd'
        ParamType = ptUnknown
      end>
    object odsTurnoverPart2KBKCODE: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object odsTurnoverPart2SUM_IN: TFloatField
      DisplayLabel = #1042#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'SUM_IN'
    end
    object odsTurnoverPart2SUM_CH: TFloatField
      DisplayLabel = #1053#1072#1095#1080#1089#1083#1077#1085#1086
      FieldName = 'SUM_CH'
    end
    object odsTurnoverPart2SUM_IU: TFloatField
      DisplayLabel = #1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      FieldName = 'SUM_IU'
    end
    object odsTurnoverPart2SUM_DE: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1095#1077#1085#1086
      FieldName = 'SUM_DE'
    end
    object odsTurnoverPart2SUM_OT: TFloatField
      DisplayLabel = #1057#1085#1103#1090#1086' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099
      FieldName = 'SUM_OT'
    end
    object odsTurnoverPart2SUM_OUT: TFloatField
      DisplayLabel = #1048#1089#1093#1086#1076#1103#1097#1080#1081' '#1086#1089#1090#1072#1090#1086#1082
      FieldName = 'SUM_OUT'
    end
  end
  object dsTurnoverPart2: TDataSource
    DataSet = odsTurnoverPart2
    Left = 554
    Top = 366
  end
  object odsNonPaysPart2_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      ''
      'select kbkcode,'
      '       sum(sum_iu) as sum_iu,'
      '       sum(sum_ot) as sum_ot'
      'from  --'#1048#1079#1083#1080#1096#1085#1103#1103' '#1091#1087#1083#1072#1090#1072
      '      (select di.code kbkcode,'
      '              sum(c.summa) sum_iu,'
      '              0 sum_ot'
      '        from ls s,'
      '             fdc_advice_lst         a,'
      '             fdc_advice_reserve_lst c,'
      '             fdc_dict di'
      '        where'
      '              s.id           = a.personal_account_id'
      '         and  c.advice_id    = a.id     '
      '         and  di.id          = c.kbkcode_id'
      '         and  c.edate        is null'
      '       group by di.code'
      '      union all'
      '      --'#1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
      '      select  di.code kbkcode,'
      '              0 as sum_iu,'
      '              sum(d.summa-d.payed) sum_ot'
      '        from ls s,'
      '             fdc_noticepay_charge_lst d,'
      '             fdc_dict di'
      '        where'
      '            s.id           = d.personal_account_id'
      '        and di.id          = d.kbkcode_id    '
      '      group by di.code'
      '    )'
      'group by kbkcode'
      '         ')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 218
    Top = 214
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField11: TStringField
      DisplayLabel = #1050#1041#1050
      DisplayWidth = 100
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object FloatField8: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1077#1088#1077#1087#1083#1072#1090#1099
      FieldName = 'SUM_IU'
    end
    object FloatField9: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      FieldName = 'SUM_OT'
    end
  end
  object dsNonPaysPart2_SV: TDataSource
    DataSet = odsNonPaysPart2_SV
    Left = 218
    Top = 270
  end
  object odsNotReestrPart2_SV: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID '
      '      connect by prior id = parent_id)'
      'select pd.KBKCode,'
      '       sum(pd.summa) as summa'
      'from ls s,'
      '     fdc_deduction_budget d,'
      '     fdc_payment_deduction_lst pd'
      'where'
      '     d.id = pd.id'
      'and  pd.personal_account_id =  s.id    '
      'and  not exists (select 1'
      '                 from fdc_rel_skindpay_deduct rsd'
      '                     ,fdc_object_relation r'
      '                 where r.id = rsd.id'
      '                   and r.Rel_Object_Id = pd.id)'
      
        'AND ( select t.typesysname from fdc_doc_charge_lst t where t.id=' +
        ' pd.decl_id ) != '#39'TR'#39
      'AND pd.is_active != '#39'A'#39
      'group by pd.KBKCode')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 218
    Top = 326
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object StringField10: TStringField
      DisplayLabel = #1050#1041#1050
      FieldName = 'KBKCODE'
      Size = 1500
    end
    object FloatField10: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
      FieldName = 'SUMMA'
    end
  end
  object dsNotReestrPart2_SV: TDataSource
    DataSet = odsNotReestrPart2_SV
    Left = 218
    Top = 374
  end
  object QueryList: TQueryList
    Session = MainData.Session
    Left = 144
    Top = 192
    object sqlGetTypeSysname: TsqlOp
      SQL.Strings = (
        'begin'
        ' :result := fdc_object_get_typesysname(pID => :id);'
        'end;')
    end
  end
  object odsBrokerContractPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'with'
      'ls as(select subject_id'
      '      from fdc_personal_account'
      '--_for_replace_0*/ where id = :id '
      '      start with id = :ID'
      '      connect by prior id = parent_id)'
      ''
      'select b.contract_no'
      '      ,b.contract_date'
      '      ,b.begin_date'
      '      ,b.end_date'
      '      ,b.is_authorize'
      
        '      ,case when b.subject_typename = '#39#1060#1051#39' then '#39#1060#39' else '#39#1070#39' end' +
        ' sub_type'
      '      ,b.subject_inn'
      
        '      ,case when b.subject_typename <> '#39#1060#1051#39' then b.subject_kpp e' +
        'lse null end subject_kpp '
      
        '      ,case when b.subject_typename <> '#39#1060#1051#39' then b.subject_name ' +
        'else null end subject_name'
      '      ,p.doc_no'
      '      ,p.last_name'
      '      ,p.first_name'
      '      ,p.middle_name'
      'from  ls s,'
      '      fdc_Broker_Contract_Lst b'
      
        'left outer join fdc_person_lst p on p.id = b.subject_id and b.su' +
        'bject_typename = '#39#1060#1051#39
      'where '
      '    b.broker_id =  s.subject_id')
    BeforeOpen = odsOperationPart1BeforeOpen
    Left = 434
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object odsBrokerContractPart1CONTRACT_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'CONTRACT_NO'
      Size = 150
    end
    object odsBrokerContractPart1CONTRACT_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'CONTRACT_DATE'
    end
    object odsBrokerContractPart1BEGIN_DATE: TDateTimeField
      DisplayLabel = #1057
      FieldName = 'BEGIN_DATE'
    end
    object odsBrokerContractPart1END_DATE: TDateTimeField
      DisplayLabel = #1055#1054
      FieldName = 'END_DATE'
    end
    object odsBrokerContractPart1IS_AUTHORIZE: TStringField
      DisplayLabel = #1059#1087#1086#1083#1085'/'#1053#1077' '#1091#1087#1086#1083#1085
      FieldName = 'IS_AUTHORIZE'
      Size = 1
    end
    object odsBrokerContractPart1SUB_TYPE: TStringField
      DisplayLabel = #1070'/'#1060
      FieldName = 'SUB_TYPE'
      Size = 1
    end
    object odsBrokerContractPart1SUBJECT_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'SUBJECT_INN'
      Size = 12
    end
    object odsBrokerContractPart1SUBJECT_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'SUBJECT_KPP'
      Size = 10
    end
    object odsBrokerContractPart1SUBJECT_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SUBJECT_NAME'
      Size = 1500
    end
    object odsBrokerContractPart1DOC_NO: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DOC_NO'
      Size = 30
    end
    object odsBrokerContractPart1LAST_NAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LAST_NAME'
      Size = 100
    end
    object odsBrokerContractPart1FIRST_NAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object odsBrokerContractPart1MIDDLE_NAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
  end
  object dsBrokerContractPart1: TDataSource
    DataSet = odsBrokerContractPart1
    Left = 432
    Top = 256
  end
  object odsFilialPart1: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select p.Name,f.inn,f.kpp,f.name as subject_name'
      'from'
      ' (select s.id,s.INN,s.KPP,s.Name'
      '  from fdc_subject_lst s'
      '  where parent_id = :ID) f,'
      '  fdc_personal_account_lst p'
      'where '
      '  p.subject_id = f.id ')
    Left = 362
    Top = 222
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Id'
        ParamType = ptUnknown
      end>
    object odsFilialPart1NAME: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1083#1080#1094#1077#1074#1086#1075#1086' '#1089#1095#1077#1090#1072
      FieldName = 'NAME'
      Size = 200
    end
    object odsFilialPart1INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object odsFilialPart1KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object odsFilialPart1SUBJECT_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'SUBJECT_NAME'
      Size = 200
    end
  end
  object dsFilialPart1: TDataSource
    DataSet = odsFilialPart1
    Left = 360
    Top = 268
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 656
    Top = 96
    object cxStyleFooter: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyleBandHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end
