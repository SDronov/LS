inherited SelectDecGridForm: TSelectDecGridForm
  Left = 273
  Width = 784
  Caption = #1042#1099#1073#1086#1088' '#1088#1077#1096#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 201
    Top = 28
    Height = 251
  end
  inherited StatusBar: TdxStatusBar
    Width = 768
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
      Left = 104
      Top = 2
      Width = 102
      Height = 23
    end
    inherited StatusBarContainer2: TdxStatusBarContainerControl
      Left = 208
      Top = 2
      Width = 465
      Height = 23
      inherited pnlMaxRecordCoundExceeded: TPanel
        Width = 465
        Height = 23
        inherited imgMaxRecordCoundExceeded: TImage
          Height = 23
        end
      end
      inherited pnlProgress: TPanel
        Width = 465
        Height = 23
        inherited lblProgress: TcxLabel
          Height = 23
          Width = 465
        end
      end
    end
    inherited StatusBarContainer3: TdxStatusBarContainerControl
      Left = 675
      Top = 2
      Width = 77
      Height = 23
    end
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Width = 768
  end
  inherited pnlWorkspace: TPanel
    Left = 204
    Width = 564
    inherited pnlSearchCriteria: TPanel
      inherited lcSearchCriteria: TdxLayoutControl
        inherited edtName: TcxTextEdit
          Width = 182
        end
      end
    end
    inherited pnlGrid: TPanel
      Width = 359
      inherited grdData: TcxGrid
        Width = 359
        inherited grdDataDBBandedTableView: TcxGridDBBandedTableView
          inherited grdDataDBBandedTableViewNAME: TcxGridDBBandedColumn
            Width = 200
          end
          object grdDataDBBandedTableViewDOC_NUMBER: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_NUMBER'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDOC_DATE: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DOC_DATE'
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_NAME_DEST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_NAME_DEST'
            Width = 300
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_INN_DEST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_INN_DEST'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object grdDataDBBandedTableViewDECL_KPP_DEST: TcxGridDBBandedColumn
            DataBinding.FieldName = 'DECL_KPP_DEST'
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
        end
      end
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 28
    Width = 201
    Height = 251
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 7
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 199
      Height = 249
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
      object cxGridDBBandedTableView1: TcxGridDBBandedTableView
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
        OnCanSelectRecord = cxGridDBBandedTableView1CanSelectRecord
        DataController.DataSource = srcSubject
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
          end>
        object cxGridDBBandedTableView1PAYER_ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PAYER_ID'
          Visible = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGridDBBandedTableView1PAYER_NAME: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PAYER_NAME'
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGridDBBandedTableView1PAYER_INN: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PAYER_INN'
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGridDBBandedTableView1PAYER_KPP: TcxGridDBBandedColumn
          DataBinding.FieldName = 'PAYER_KPP'
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
      end
      object cxGridLevel1: TcxGridLevel
        Caption = 'grdDataDBTableView'
        GridView = cxGridDBBandedTableView1
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
      'WITH ot AS ( SELECT t.name'
      '                   ,t.id'
      '               FROM fdc_object_type_lst t '
      '              WHERE t.sysname = :pDecSysName )'
      'SELECT -1 AS ID'
      '      ,'#39#1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1086#1077' '#1088#1077#1096#1077#1085#1080#1077#39' AS NAME'
      '      ,NULL SHORTNAME'
      '      ,ot.id AS OBJECT_TYPE_ID'
      '      ,( SELECT s.id'
      '           FROM fdc_state_lst s'
      '          WHERE s.SysName = CASE'
      
        '                              WHEN Fdc_Object_Type_Is_Subtype(:p' +
        'DecSysName, '#39'DecisionPayback'#39') = 1 THEN '#39'DecisionPaybackCreated'#39
      
        '                              WHEN Fdc_Object_Type_Is_Subtype(:p' +
        'DecSysName, '#39'DecisionPayment'#39') = 1 THEN '#39'State.DecisionPayment.C' +
        'reated'#39
      
        '                              WHEN Fdc_Object_Type_Is_Subtype(:p' +
        'DecSysName, '#39'DecisionDebts'#39') = 1 THEN '#39'State.DecisionDebts.Creat' +
        'ed'#39
      
        '                              WHEN Fdc_Object_Type_Is_Subtype(:p' +
        'DecSysName ,'#39'DecOffsetObligation'#39') = 1 THEN '#39'State.DecOffsetObli' +
        'gation.Create'#39
      '                              ELSE NULL'
      '                            END ) AS STATE_ID'
      '      ,2 AS ACCESSLEVEL'
      '      ,NULL SYSNAME'
      '      ,NULL DESCRIPT'
      '      ,NULL OWNER_OBJECT_ID'
      '      ,ot.name AS TYPENAME'
      '      ,:pDecSysName TYPESYSNAME'
      '      ,NULL OBJECTKINDLIST'
      '      ,NULL DOC_DATE'
      '      ,NULL DOC_NUMBER'
      '      ,NULL decl_name_dest'
      '      ,NULL decl_inn_dest'
      '      ,NULL decl_kpp_dest'
      '  FROM ot'
      'UNION ALL'
      'SELECT d.id'
      '      ,d.name'
      '      ,d.shortname'
      '      ,d.object_type_id'
      '      ,d.state_id'
      '      ,d.accesslevel'
      '      ,d.sysname'
      '      ,d.descript'
      '      ,d.owner_object_id'
      '      ,d.typename'
      '      ,d.typesysname'
      '      ,d.objectkindlist'
      '      ,d.doc_date'
      '      ,d.doc_number'
      '      ,d.decl_name_dest'
      '      ,d.decl_inn_dest'
      '      ,d.decl_kpp_dest'
      '  FROM fdc_decision_payback_lst d'
      '      ,fdc_state_lst o'
      '      ,ot'
      ' WHERE o.id = d.STATE_ID'
      '       AND o.name NOT IN ( '#39#1055#1086#1076#1087#1080#1089#1072#1085#39', '#39#1054#1090#1082#1072#1079#1072#1085#1086#39' )'
      '       AND d.object_type_id = ot.id'
      '       AND d.subject_id = :pSubjectId'
      '       AND d.is_ts = :pIsTS'
      '       AND (:NAME IS NULL OR upper(d.NAME) LIKE upper(:NAME))'
      'UNION ALL'
      'SELECT d.id'
      '      ,d.name'
      '      ,d.shortname'
      '      ,d.object_type_id'
      '      ,d.state_id'
      '      ,d.accesslevel'
      '      ,d.sysname'
      '      ,d.descript'
      '      ,d.owner_object_id'
      '      ,d.typename'
      '      ,d.typesysname'
      '      ,d.objectkindlist'
      '      ,d.doc_date'
      '      ,d.doc_number'
      '      ,NULL decl_name_dest'
      '      ,NULL decl_inn_dest'
      '      ,NULL decl_kpp_dest'
      '  FROM fdc_decision_payment_lst d'
      '      ,fdc_state_lst o'
      '      ,ot'
      ' WHERE o.id = d.STATE_ID'
      '       AND o.name NOT IN ( '#39#1055#1086#1076#1087#1080#1089#1072#1085#1086#39', '#39#1054#1090#1082#1072#1079#1072#1085#1086#39' )'
      '       AND d.object_type_id = ot.id'
      '       AND d.subject_id = :pSubjectId'
      '       AND d.is_ts = :pIsTS'
      '       AND (:NAME IS NULL OR upper(d.NAME) LIKE upper(:NAME))'
      'UNION ALL'
      'SELECT d.id'
      '      ,d.name'
      '      ,d.shortname'
      '      ,d.object_type_id'
      '      ,d.state_id'
      '      ,d.accesslevel'
      '      ,d.sysname'
      '      ,d.descript'
      '      ,d.owner_object_id'
      '      ,d.typename'
      '      ,d.typesysname'
      '      ,d.objectkindlist'
      '      ,d.doc_date'
      '      ,d.doc_number'
      '      ,NULL decl_name_dest'
      '      ,NULL decl_inn_dest'
      '      ,NULL decl_kpp_dest'
      '  FROM fdc_dec_offset_obligation_lst d'
      '      ,fdc_state_lst o'
      '      ,ot'
      ' WHERE o.id = d.STATE_ID'
      '       AND o.sysname IN ('#39'State.DecOffsetObligation.Create'#39')'
      '       AND d.object_type_id = ot.id'
      '       AND d.subject_id = :pSubjectId'
      '       AND d.is_ts = :pIsTS'
      '       AND (:NAME IS NULL OR upper(d.NAME) LIKE upper(:NAME))'
      '       '
      '')
    ParamData = <
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pDecSysName'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSubjectId'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIsTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSubjectId'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIsTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSubjectId'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pIsTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end>
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataDECL_NAME_DEST: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'DECL_NAME_DEST'
      Size = 1500
    end
    object dsDataDECL_INN_DEST: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'DECL_INN_DEST'
      Size = 12
    end
    object dsDataDECL_KPP_DEST: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'DECL_KPP_DEST'
      Size = 10
    end
  end
  object dsSubject: TOracleDataSet
    SQL.Strings = (
      'select distinct  PAYER_ID,payer_name,payer_inn,payer_kpp'
      'from'
      '('
      'select po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'from fdc_po_lst po, '
      '     fdc_payment_deduction_lst d'
      'where '
      '    d.decl_id    = :pDeclId'
      'and d.payment_id = po.ID'
      'and d.is_ts      = :pIsTS'
      'group by po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'having sum(d.summa)>0'
      'union all'
      'select po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'from fdc_po_lst po, '
      '     fdc_advice_deduction_lst d'
      'where '
      '    d.advice_id  = :pDeclId'
      'and d.payment_id = po.ID'
      'and d.is_ts      = :pIsTS'
      'group by po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'having sum(abs(d.summa))>0'
      'union all'
      'select po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'from fdc_po_lst po,'
      '     fdc_advice_reserve_lst d'
      'where'
      '    d.advice_id  = :pDeclId'
      'and d.payment_id = po.ID'
      'and d.is_ts      = :pIsTS'
      
        'and trunc(sysdate) between d.bdate and nvl(d.edate,trunc(sysdate' +
        ')+1)'
      'group by po.PAYER_ID,po.payer_name,po.payer_inn,po.payer_kpp'
      'having sum(abs(d.summa))>0'
      ')')
    Variables.Data = {
      0300000002000000080000003A504445434C4944030000000000000000000000
      060000003A5049535453050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000040000000800000050415945525F49440100000000000A0000005041
      5945525F4E414D450100000000000900000050415945525F494E4E0100000000
      000900000050415945525F4B5050010000000000}
    Session = MainData.Session
    Left = 24
    Top = 68
    object dsSubjectPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
      Visible = False
    end
    object dsSubjectPAYER_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 200
      FieldName = 'PAYER_NAME'
      Size = 4000
    end
    object dsSubjectPAYER_INN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsSubjectPAYER_KPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'PAYER_KPP'
      Size = 10
    end
  end
  object srcSubject: TDataSource
    DataSet = dsSubject
    Left = 24
    Top = 124
  end
end
