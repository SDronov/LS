inherited ActChangeOstKBKForm: TActChangeOstKBKForm
  Left = 305
  Top = 179
  Height = 587
  ActiveControl = edtName
  Caption = #1040#1082#1090' '#1086' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1089' '#1079#1072#1082#1088#1099#1090#1099#1093' '#1050#1041#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 549
    ClientRectBottom = 525
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 494
        inherited edtName: TcxDBTextEdit
          Style.StyleController = OfficeEditStyleController
          Width = 409
        end
        inherited edtDescript: TcxDBMemo
          Top = 449
          Style.StyleController = OfficeEditStyleController
          TabOrder = 12
          Height = 36
          Width = 409
        end
        object edtSignByChief: TcxDBLookupComboBox [2]
          Left = 142
          Top = 355
          DataBinding.DataField = 'SIGNED_BY_CHIEF'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'NAME'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = dsGetBoss
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 9
          Width = 737
        end
        object edtSignBy: TcxDBTextEdit [3]
          Left = 142
          Top = 382
          DataBinding.DataField = 'SIGNED_BY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 10
          Width = 737
        end
        object edtSignDate: TcxDBDateEdit [4]
          Left = 142
          Top = 409
          DataBinding.DataField = 'SIGN_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 11
          Width = 737
        end
        object edtCurrency: TcxDBMaskEdit [5]
          Left = 60
          Top = 134
          DataBinding.DataField = 'CURRENCY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 6
          Width = 136
        end
        object edtSumma: TcxDBCurrencyEdit [6]
          Left = 235
          Top = 134
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = OfficeEditStyleController
          TabOrder = 7
          Width = 394
        end
        object grdKBKList: TcxGrid [7]
          Left = 21
          Top = 192
          Width = 696
          Height = 113
          Align = alClient
          TabOrder = 8
          object grdKBKListDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcKBKList
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.CopyCaptionsToClipboard = False
            OptionsBehavior.ImmediateEditor = False
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdKBKListDBTableView1ID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
            end
            object grdKBKListDBTableView1DATE_BEGIN: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_BEGIN'
              Visible = False
            end
            object grdKBKListDBTableView1DATE_END: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_END'
              Visible = False
            end
            object grdKBKListDBTableView1FROM_KBKCODE: TcxGridDBColumn
              Caption = #1050#1041#1050' '#1089
              DataBinding.FieldName = 'FROM_KBKCODE'
            end
            object grdKBKListDBTableView1TO_KBKCODE: TcxGridDBColumn
              Caption = #1050#1041#1050' '#1085#1072
              DataBinding.FieldName = 'TO_KBKCODE'
            end
            object grdKBKListDBTableView1SUM_KBK: TcxGridDBColumn
              Caption = #1057#1091#1084#1084#1072
              DataBinding.FieldName = 'SUM_KBK'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DisplayFormat = ',0.00;-,0.00'
            end
          end
          object grdKBKListLevel1: TcxGridLevel
            GridView = grdKBKListDBTableView1
          end
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 142
          Style.StyleController = OfficeEditStyleController
          Width = 417
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.StyleController = OfficeEditStyleController
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [2]
            Caption = 'qw'
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciCurrency: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtCurrency
              ControlOptions.ShowBorder = False
            end
            object lciSumma: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralGroup2: TdxLayoutGroup [3]
            Caption = #1050#1041#1050
            object lciKBKList: TdxLayoutItem
              CaptionOptions.AlignHorz = taRightJustify
              Control = grdKBKList
              ControlOptions.ShowBorder = False
            end
          end
          object lcgSign: TdxLayoutGroup [4]
            Caption = #1055#1086#1076#1087#1080#1089#1100
            object lciSignByChief: TdxLayoutItem
              Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082' '#1086#1090#1076#1077#1083#1072' '#1054#1058#1055
              Control = edtSignByChief
              ControlOptions.ShowBorder = False
            end
            object lciSignBy: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
              Control = edtSignBy
              ControlOptions.ShowBorder = False
            end
            object lciSignDate: TdxLayoutItem
              Caption = #1044#1072#1090#1072
              Control = edtSignDate
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 494
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 522
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 494
      end
    end
    object tabDocs: TcxTabSheet [1]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabDocsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 525
        ClientRectBottom = 501
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
        FloatClientWidth = 113
        FloatClientHeight = 82
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
            Item = btnPrint
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
    inherited btnStateTransit: TdxBarSubItem
      Enabled = False
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select a.*'
      '      ,c.CODE||'#39' - '#39'||c.ACODE AS CURRENCY  '
      '  from fdc_act_change_ost_kbk_Lst a, fdc_currency_usable_lst c'
      ' where a.ID = :ID'
      '   AND c.id(+) = a.CURRENCY_ID')
    SourceServerObject = 'FDC_ACT_CHANGE_OST_KBK_LST'
    inherited dsDataDOC_DATE: TDateTimeField
      ReadOnly = True
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
    object dsDataPERSONAL_ACCOUNT_ID: TFloatField
      FieldName = 'PERSONAL_ACCOUNT_ID'
    end
    object dsDataSIGNED_BY: TStringField
      FieldName = 'SIGNED_BY'
      Size = 50
    end
    object dsDataSIGNED_BY_CHIEF: TStringField
      FieldName = 'SIGNED_BY_CHIEF'
      Size = 50
    end
    object dsDataSIGN_DATE: TDateTimeField
      FieldName = 'SIGN_DATE'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      ReadOnly = True
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      ReadOnly = True
    end
    object dsDataCURRENCY: TStringField
      FieldName = 'CURRENCY'
      Size = 9
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  P_ACT_CHANGE_OST_KBK.Modify('
      '    :ID,'
      '    :DOC_NUMBER,'
      '    :DOC_DATE,'
      '    :NAME,'
      '    :SIGNED_BY,'
      '    :SIGNED_BY_CHIEF,'
      '    :SIGN_DATE);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
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
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGNED_BY_CHIEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIGN_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Session = MainData.Session
  end
  inherited dsUpdateState: TfdcQuery
    Session = MainData.Session
  end
  inherited dsTransit: TfdcQuery
    Session = MainData.Session
  end
  inherited dsState: TfdcQuery
    Session = MainData.Session
  end
  inherited dsAccessLevel: TfdcQuery
    Session = MainData.Session
  end
  object odsGetBoss: TOracleDataSet
    SQL.Strings = (
      'select v.id,v.STRINGVALUE as name from fdc_value_lst_sys v'
      ' where '
      '    v.sysname in ('#39'BossName'#39','#39'PayBossName'#39')'
      ' union all'
      ' select 0 as id,:pName as name from dual'
      ' where '
      '     :pName is not null'
      ' and not exists (select 0 from fdc_value_lst_sys '
      '                  where '
      '                      sysname in ('#39'BossName'#39','#39'PayBossName'#39')'
      '                  and STRINGVALUE = nvl(:pName,'#39#39'))'
      'order by id')
    Variables.Data = {0300000001000000060000003A504E414D45050000000000000000000000}
    QBEDefinition.QBEFieldDefs = {
      0400000002000000020000004944010000000000040000004E414D4501000000
      0000}
    Session = MainData.Session
    Left = 635
    Top = 210
    object odsGetBossID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object odsGetBossNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsGetBoss: TDataSource
    DataSet = odsGetBoss
    Left = 636
    Top = 259
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'SELECT  ( SELECT v.STRINGVALUE '
      '            FROM fdc_value_lst_sys v '
      '            WHERE v.SYSNAME = '#39'CustomsName'#39') AS CustomsName, '
      '        ( SELECT v.STRINGVALUE from fdc_value_lst_sys v'
      '            WHERE v.sysname = '#39'BossName'#39' ) AS BOSSNAME,'
      '        ( SELECT v.STRINGVALUE from fdc_value_lst_sys v'
      '            WHERE v.sysname = '#39'PayBossName'#39' ) AS PAYBOSS'
      ''
      'FROM dual')
    Left = 83
    Top = 314
  end
  object dsDetailPays: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select ROWNUM'
      '     , po.TYPENAME'
      '     , po.inn_p'
      '     , PO.kpp_p'
      '     , po.name_p'
      '     , po.ID'
      '     , po.DOC_NUMBER'
      '     , po.DOC_DATE'
      '     , po.summa summa_all'
      '     , PO.KBK'
      '     , c.to_kbkcode   '
      '     , r.summa summa_ded'
      ' from fdc_po_lst po,'
      '      fdc_reserved_payment_lst r,'
      '      fdc_change_kbk_ded_lst c'
      'where r.doc_id = :ID'
      '      and po.id = r.payment_id'
      '      and c.doc_id = r.doc_id '
      '      and c.from_kbkcode = po.kbk')
    Left = 187
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDetailPaysROWNUM: TFloatField
      FieldName = 'ROWNUM'
    end
    object dsDetailPaysTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Size = 1500
    end
    object dsDetailPaysINN_P: TStringField
      FieldName = 'INN_P'
      Size = 12
    end
    object dsDetailPaysKPP_P: TStringField
      FieldName = 'KPP_P'
      Size = 9
    end
    object dsDetailPaysNAME_P: TStringField
      FieldName = 'NAME_P'
      Size = 160
    end
    object dsDetailPaysID: TFloatField
      FieldName = 'ID'
    end
    object dsDetailPaysDOC_NUMBER: TStringField
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDetailPaysDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDetailPaysSUMMA_ALL: TFloatField
      FieldName = 'SUMMA_ALL'
    end
    object dsDetailPaysKBK: TStringField
      FieldName = 'KBK'
    end
    object dsDetailPaysTO_KBKCODE: TStringField
      FieldName = 'TO_KBKCODE'
      Size = 1500
    end
    object dsDetailPaysSUMMA_DED: TFloatField
      FieldName = 'SUMMA_DED'
    end
  end
  object dsKBKList: TfdcQuery
    Session = MainData.Session
    AutoCommit = False
    AutoRollback = False
    DataSource = srcData
    Filtered = True
    ReadOnly = True
    SQL.Strings = (
      'select c.id,'
      '           c.date_begin,'
      '           c.date_end, '
      '           c.from_kbkcode,'
      '          c.to_kbkcode,'
      '          c.summa sum_kbk'
      'from fdc_change_kbk_ded_lst c'
      'where c.doc_id = :ID')
    Left = 456
    Top = 336
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsKBKListID: TFloatField
      FieldName = 'ID'
    end
    object dsKBKListDATE_BEGIN: TDateTimeField
      FieldName = 'DATE_BEGIN'
    end
    object dsKBKListDATE_END: TDateTimeField
      FieldName = 'DATE_END'
    end
    object dsKBKListFROM_KBKCODE: TStringField
      FieldName = 'FROM_KBKCODE'
    end
    object dsKBKListTO_KBKCODE: TStringField
      FieldName = 'TO_KBKCODE'
    end
    object dsKBKListSUM_KBK: TFloatField
      FieldName = 'SUM_KBK'
    end
  end
  object srcKBKList: TDataSource
    DataSet = dsKBKList
    Left = 456
    Top = 384
  end
end
