inherited AgreementRegistryForm: TAgreementRegistryForm
  Left = 643
  Top = 554
  Width = 579
  Height = 529
  Caption = #1056#1077#1077#1089#1090#1088' '#1050#1053#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 571
    Height = 502
    ClientRectBottom = 478
    ClientRectRight = 571
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 565
        Height = 449
        inherited edtName: TcxDBTextEdit
          Left = 79
          Width = 303
        end
        inherited edtDescript: TcxDBMemo
          Left = 79
          Top = 421
          TabOrder = 9
          Height = 19
          Width = 346
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [2]
          Left = 335
          Top = 33
          DataBinding.DataField = 'KODT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 79
        end
        object cxDBDateEdit1: TcxDBDateEdit [3]
          Left = 180
          Top = 33
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 103
        end
        object cxDBMaskEdit2: TcxDBMaskEdit [4]
          Left = 79
          Top = 33
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 67
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [5]
          Left = 178
          Top = 57
          DataBinding.DataField = 'SUBJ_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 5
          Width = 230
        end
        object fdcObjectLinkEdit2: TfdcObjectLinkEdit [6]
          Left = 79
          Top = 81
          DataBinding.DataField = 'AGREEMENT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'AGREEMENT_ID'
          DataBinding.TypeSysName = 'BPAgreement'
          DataBinding.SearchFormClass = 'TBPAgreementGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 6
          Width = 247
        end
        object cxDBTextEdit1: TcxDBTextEdit [7]
          Left = 79
          Top = 105
          DataBinding.DataField = 'CRE_MEMO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 93
        end
        object grdSumByKBK: TcxGrid [8]
          Left = 9
          Top = 144
          Width = 389
          Height = 100
          TabOrder = 8
          object grdSumByKBKDBTableView: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcKBKSum
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = ',0.00'
                Kind = skSum
                Column = grdSumByKBKDBTableViewSUMMA
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsBehavior.IncSearchItem = grdSumByKBKDBTableViewCODE
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            object grdSumByKBKDBTableViewCODE: TcxGridDBColumn
              Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
              DataBinding.FieldName = 'V_PL'
              Width = 93
            end
            object grdSumByKBKDBTableViewKBK: TcxGridDBColumn
              Caption = #1050#1041#1050
              DataBinding.FieldName = 'BUD_KOD'
              Width = 239
            end
            object grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUM_PL_REE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00'
              Width = 207
            end
          end
          object grdSumByKBKLevel: TcxGridLevel
            GridView = grdSumByKBKDBTableView
          end
        end
        object cxDBMaskEdit3: TcxDBMaskEdit [9]
          Left = 79
          Top = 57
          DataBinding.DataField = 'INN_KNP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 93
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem3: TdxLayoutItem
              Tag = 14
              AutoAligns = [aaVertical]
              Caption = #1053#1086#1084#1077#1088
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBMaskEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              Tag = 14
              AutoAligns = [aaVertical]
              Caption = #1044#1072#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBDateEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem1: TdxLayoutItem
              Tag = 14
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1058#1072#1084#1086#1078#1085#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBMaskEdit1
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem8: TdxLayoutItem
              Tag = 13
              Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
              Control = cxDBMaskEdit3
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem4: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
              ShowCaption = False
              Control = fdcObjectLinkEdit1
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem5: TdxLayoutItem [3]
            Tag = 14
            Caption = #1057#1086#1075#1083#1072#1096#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem6: TdxLayoutItem [4]
            Tag = 14
            Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
            CaptionOptions.AlignHorz = taRightJustify
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem7: TdxLayoutItem [5]
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1048#1090#1086#1075#1086#1074#1099#1077' '#1089#1091#1084#1084#1099
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
        Width = 571
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 449
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 475
        Width = 571
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 568
        Height = 449
      end
    end
    object tabDocList: TcxTabSheet [1]
      Caption = #1057#1087#1080#1089#1086#1082' '#1043#1058#1044
      ImageIndex = 5
      OnShow = tabDocListShow
    end
    inherited tabObligation: TcxTabSheet
      TabVisible = False
    end
    inherited tabPayment: TcxTabSheet
      TabVisible = False
    end
    inherited tabGoods: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 571
        Height = 478
        ClientRectBottom = 454
        ClientRectRight = 571
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
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
          end>
        Name = #1054#1073#1098#1077#1082#1090'1'
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
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'DECL_NO'
        ParamType = ptUnknown
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*'
      ',s.SysName state_sysname'
      '  from fdc_doc_pack_gtd_knp_lst t'
      '  ,fdc_state_lst s'
      ' where t.ID = :ID'
      'and s.id(+) = t.state_id')
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
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
    object dsDataDATE_SEND: TDateTimeField
      FieldName = 'DATE_SEND'
    end
    object dsDataKODT: TStringField
      FieldName = 'KODT'
      Size = 10
    end
    object dsDataINN_KNP: TStringField
      FieldName = 'INN_KNP'
      Size = 12
    end
    object dsDataCRE_MEMO: TStringField
      FieldName = 'CRE_MEMO'
      Size = 2000
    end
    object dsDataAGREEMENT_ID: TFloatField
      FieldName = 'AGREEMENT_ID'
    end
    object dsDataCUSTOMS_CODE: TStringField
      FieldName = 'CUSTOMS_CODE'
      Size = 8
    end
    object dsDataREG_DATE: TDateTimeField
      FieldName = 'REG_DATE'
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 10
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataSUBJ_NAME: TStringField
      FieldName = 'SUBJ_NAME'
      Size = 1500
    end
    object dsDataSUBJ_INN: TStringField
      FieldName = 'SUBJ_INN'
      Size = 12
    end
    object dsDataSUBJ_KPP: TStringField
      FieldName = 'SUBJ_KPP'
      Size = 10
    end
    object dsDataAGREEMENT_NAME: TStringField
      FieldName = 'AGREEMENT_NAME'
      Size = 1500
    end
    object dsDataSTATE_SYSNAME: TStringField
      FieldName = 'STATE_SYSNAME'
      Size = 1500
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_doc_pack_gtd_knp.modify(pid => :id,'
      '                              pcustomscode => :KODT,'
      '                              pnumree => :DOC_NUMBER,'
      '                              pdateree => :DOC_DATE,'
      '                              pagreemntid => :AGREEMENT_ID,'
      '                              pinspectorname => :CRE_MEMO);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'KODT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGREEMENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CRE_MEMO'
        ParamType = ptUnknown
      end>
  end
  object dsKBKSum: TOracleDataSet
    SQL.Strings = (
      '  select r4.v_pl, r4.bud_kod, r4.sum_pl_ree'
      '    /* into result */'
      '    from fdc_doc_pack_gtd_knp_lst t, dbf_r_sgl4 r4'
      '   where t.id = :ID'
      '     and r4.kodt = t.kodt'
      '     and r4.num_ree = t.num_ree'
      '     and r4.dat_ree = t.dat_ree'
      '     and r4.inn_knp = t.inn_knp'
      '     and r4.v_pl <> '#39'00'#39' and r4.v_pl <> '#39'000'#39
      '     and r4.bud_kod is not null'
      '     and r4.sum_pl_ree <> 0'
      '  order by r4.v_pl   ')
    Variables.Data = {0300000001000000030000003A4944040000000000000000000000}
    BeforeQuery = dsKBKSumBeforeQuery
    Session = MainData.Session
    Left = 83
    Top = 308
  end
  object srcKBKSum: TDataSource
    DataSet = dsKBKSum
    Left = 83
    Top = 268
  end
end
