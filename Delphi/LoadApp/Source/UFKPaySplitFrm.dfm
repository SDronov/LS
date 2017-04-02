inherited UFKPaySplitForm: TUFKPaySplitForm
  Left = 302
  Top = 175
  Caption = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1055#1055' '#1059#1060#1050
  ClientHeight = 551
  ClientWidth = 855
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 855
    Height = 551
    inherited Bevel1: TBevel
      Top = 511
    end
    inherited btnCancel: TcxButton
      Left = 771
      Top = 519
      TabOrder = 4
    end
    inherited btnOk: TcxButton
      Left = 690
      Top = 519
      TabOrder = 3
    end
    object edtAmount: TcxCurrencyEdit [3]
      Left = 144
      Top = 9
      TabStop = False
      EditValue = 0c
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.BorderStyle = ebsNone
      StyleDisabled.Color = clWindow
      StyleDisabled.TextColor = clWindowText
      TabOrder = 0
      Width = 389
    end
    object edtRest: TcxCurrencyEdit [4]
      Left = 144
      Top = 41
      TabStop = False
      EditValue = '-5'
      Enabled = False
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.AutoSelect = False
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.Nullable = False
      Properties.ReadOnly = True
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Color = clWindow
      Style.Font.Charset = RUSSIAN_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.IsFontAssigned = True
      StyleDisabled.BorderColor = clWindowFrame
      StyleDisabled.BorderStyle = ebsNone
      StyleDisabled.Color = clWindow
      StyleDisabled.TextColor = clWindowText
      TabOrder = 1
      Width = 389
    end
    object grdData: TcxGrid [5]
      Left = 9
      Top = 93
      Width = 506
      Height = 267
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      object grdDataDBTableView: TcxGridDBTableView
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
      end
      object grdDataDBBandedTableView: TcxGridDBBandedTableView
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
        DataController.DataSource = dsSumByCustoms
        DataController.Filter.MaxValueListCount = 10
        DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare]
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = grdDataDBBandedTableViewRESTUFKSUMMA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            Column = grdDataDBBandedTableViewRESTCUSTOMSUMMA
          end
          item
            Format = ',0.00;-,0.00'
            Kind = skSum
            FieldName = 'EDITSUMMA'
            Column = grdDataDBBandedTableViewEDITSUMMA
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.Summary.OnAfterSummary = grdDataDBBandedTableViewDataControllerSummaryAfterSummary
        OptionsBehavior.CellHints = True
        OptionsBehavior.NavigatorHints = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHiding = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.ColumnVertSizing = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
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
            Caption = #1054#1089#1085#1086#1074#1085#1086#1077
            Options.HoldOwnColumnsOnly = True
          end>
        object grdDataDBBandedTableViewCUSTOMSCODE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'CUSTOMSCODE'
          Options.Editing = False
          Width = 123
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
          DataBinding.FieldName = 'NAME'
          Options.Editing = False
          Width = 260
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object grdDataDBBandedTableViewFULL_NAME: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FULL_NAME'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object grdDataDBBandedTableViewRESTUFKSUMMA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RESTUFKSUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Options.Editing = False
          Width = 135
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object grdDataDBBandedTableViewRESTCUSTOMSUMMA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'RESTCUSTOMSUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Options.Editing = False
          Width = 154
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object grdDataDBBandedTableViewEDITSUMMA: TcxGridDBBandedColumn
          DataBinding.FieldName = 'EDITSUMMA'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.Nullable = False
          Width = 137
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
      end
      object grdDataLevel: TcxGridLevel
        Caption = 'grdDataDBTableView'
        GridView = grdDataDBBandedTableView
      end
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object liAmount: TdxLayoutItem [0]
        Caption = #1057#1091#1084#1084#1072' '#1082' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1102': '
        Control = edtAmount
        ControlOptions.ShowBorder = False
      end
      object liRetSum: TdxLayoutItem [1]
        Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100':  '
        Control = edtRest
        ControlOptions.ShowBorder = False
      end
      object liGrid: TdxLayoutItem [2]
        AutoAligns = [aaHorizontal]
        AlignVert = avClient
        Offsets.Top = 20
        Control = grdData
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 184
    inherited actOk: TAction
      OnUpdate = actOkUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 212
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 296
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 324
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 240
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 268
  end
  object dsetSumByCust: TOracleDataSet
    SQL.Strings = (
      'SELECT c.customs_code_8 AS CustomsCode, c.NAME, c.FULL_NAME, '
      '      nvl(po_rc.Summa, 0) AS RestCustomSumma,'
      '      nvl(po_rf.Summa, 0) AS RestUFKSumma,'
      '      0 AS EditSumma      '
      'FROM fdc_customs_lst c, '
      
        '     ( SELECT substr(p.DestCustomsCode , 1, 5)||'#39'000'#39' AS DestCus' +
        'tomsCode, SUM(p.SUMMA) AS Summa'
      '        FROM  fdc_po_lst p'
      '        WHERE p.ext_typesysname = '#39'PaymentOrderRestCustoms'#39
      '        GROUP BY substr(p.DestCustomsCode , 1, 5)  '
      '      ) po_rc,'
      
        '      ( SELECT substr(pl.DestCustomsCode , 1, 5)||'#39'000'#39' AS DestC' +
        'ustomsCode, SUM(pl.SUMMA) AS Summa'
      '        FROM fdc_payment_order_rest_ufk rf, fdc_po_lst pl'
      '        WHERE pl.ID = rf.id'
      '        GROUP BY substr(pl.DestCustomsCode , 1, 5) '
      '      ) po_rf'
      
        'WHERE c.customs_code_8 LIKE substr(p_params.CustomCode, 1, 3)|| ' +
        #39'__000'#39
      '  AND nvl(c.dt_end, SYSDATE +1 ) > SYSDATE'
      '  AND po_rc.DestCustomsCode(+) = c.customs_code_8'
      '  AND po_rf.DestCustomsCode(+) = c.customs_code_8'
      'ORDER BY c.customs_code_8  ')
    QBEDefinition.QBEFieldDefs = {
      04000000060000000B000000435553544F4D53434F4445010000000000040000
      004E414D450100000000000900000046554C4C5F4E414D450100000000000F00
      000052455354435553544F4D53554D4D410100000000000C0000005245535455
      464B53554D4D41010000000000090000004544495453554D4D41010000000000}
    Cursor = crSQLWait
    OnApplyRecord = dsetSumByCustApplyRecord
    Session = MainData.Session
    Left = 160
    Top = 176
    object dsetSumByCustCUSTOMSCODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1058#1054
      DisplayWidth = 25
      FieldName = 'CUSTOMSCODE'
      ReadOnly = True
      Size = 8
    end
    object dsetSumByCustNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      DisplayWidth = 120
      FieldName = 'NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsetSumByCustFULL_NAME: TStringField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1054
      DisplayWidth = 120
      FieldName = 'FULL_NAME'
      ReadOnly = True
      Size = 4000
    end
    object dsetSumByCustRESTCUSTOMSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1090#1072#1084#1086#1078#1085#1080
      FieldName = 'RESTCUSTOMSUMMA'
      ReadOnly = True
    end
    object dsetSumByCustRESTUFKSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1059#1060#1050
      FieldName = 'RESTUFKSUMMA'
      ReadOnly = True
    end
    object dsetSumByCustEDITSUMMA: TFloatField
      DisplayLabel = #1056#1072#1089#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1089#1091#1084#1084#1091
      FieldName = 'EDITSUMMA'
    end
  end
  object dsSumByCustoms: TDataSource
    DataSet = dsetSumByCust
    Left = 160
    Top = 128
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = grdData
    PopupMenus = <>
    Left = 560
    Top = 264
  end
end
