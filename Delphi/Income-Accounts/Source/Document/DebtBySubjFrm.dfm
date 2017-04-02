inherited DebtBySubjForm: TDebtBySubjForm
  Left = 317
  Top = 214
  Width = 544
  Height = 446
  ActiveControl = edtName
  Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' '#1089#1091#1073#1098#1077#1082#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 528
    Height = 408
    ClientRectBottom = 384
    ClientRectRight = 528
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 522
        Height = 353
        inherited edtName: TcxDBTextEdit
          Style.Color = clSilver
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 330
          TabOrder = 7
          Height = 11
          Width = 185
        end
        object edtINN: TcxDBMaskEdit [2]
          Left = 60
          Top = 33
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 92
        end
        object edtKPP: TcxDBMaskEdit [3]
          Left = 313
          Top = 33
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 93
        end
        object grdSumByKBK: TcxGrid [4]
          Left = 9
          Top = 197
          Width = 389
          Height = 100
          TabOrder = 6
          object grdSumByKBKDBTableView: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = srcSumm
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.IncSearch = True
            OptionsCustomize.ColumnFiltering = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object grdSumByKBKDBTableViewCURRENCY_ID: TcxGridDBColumn
              DataBinding.FieldName = 'CURRENCY_ID'
              Visible = False
            end
            object grdSumByKBKDBTableViewCUR_CODE: TcxGridDBColumn
              DataBinding.FieldName = 'CUR_CODE'
            end
            object grdSumByKBKDBTableViewSUMMA: TcxGridDBColumn
              DataBinding.FieldName = 'SUMMA'
            end
          end
          object grdSumByKBKLevel: TcxGridLevel
            GridView = grdSumByKBKDBTableView
          end
        end
        object edtDebtSum: TcxDBCurrencyEdit [5]
          Left = 184
          Top = 88
          DataBinding.DataField = 'DEBTSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 3
          Width = 325
        end
        object edtLockSum: TcxDBCurrencyEdit [6]
          Left = 184
          Top = 115
          DataBinding.DataField = 'LOCKSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 325
        end
        object edtAvailSum: TcxDBCurrencyEdit [7]
          Left = 184
          Top = 142
          DataBinding.DataField = 'AVAILSUM'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 325
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            LookAndFeel = LayoutWebLookAndFeel
          end
          object lcGeneralGroup1: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1053#1053
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtINN
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              LookAndFeel = LayoutWebLookAndFeel
              Control = edtKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcReuseSum: TdxLayoutGroup [2]
            Caption = #1055#1086#1075#1072#1096#1077#1085#1080#1077
            object lcGeneralItem4: TdxLayoutItem
              Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1083#1075#1072
              Control = edtDebtSum
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem5: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072' '#1085#1077#1087#1086#1076#1087#1080#1089#1072#1085#1085#1099#1093' '#1088#1077#1096#1077#1085#1080#1081
              Control = edtLockSum
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem6: TdxLayoutItem
              Caption = #1054#1089#1090#1072#1090#1086#1082
              Control = edtAvailSum
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem3: TdxLayoutItem [3]
            AutoAligns = [aaHorizontal]
            AlignVert = avClient
            Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
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
        Width = 528
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 353
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 381
        Width = 528
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 525
        Height = 353
      end
    end
    object tabDeclDebt: TcxTabSheet [1]
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086#1089#1090#1080
      ImageIndex = 2
      OnShow = tabDeclDebtShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 528
        Height = 384
        ClientRectBottom = 360
        ClientRectRight = 528
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
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
        FloatLeft = 328
        FloatTop = 245
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
        SourceField = dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    ReadOnly = True
    SQL.Strings = (
      'WITH rs AS '
      '  (SELECT FDC_GetAmountDebt_Rights(:ID) AS DebtSum,'
      '          FDC_GetLockedAmount_Rights(:ID) AS LockSum '
      '   FROM dual )'
      ''
      
        'select s.* ,  rs.DebtSum , rs.LockSum , rs.DebtSum - rs.LockSum ' +
        'AS AvailSum'
      '  from fdc_Subject_Lst s, rs'
      ' where s.ID = :ID')
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
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataADDRESS: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataOKPO: TStringField
      DisplayLabel = #1054#1050#1055#1054
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      DisplayLabel = #1048#1053#1053
      FieldName = 'INN'
      Size = 12
    end
    object dsDataOGRN: TStringField
      DisplayLabel = #1054#1043#1056#1053
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      DisplayLabel = #1057#1054#1040#1058#1054
      FieldName = 'SOATO'
      Size = 8
    end
    object dsDataKPP: TStringField
      DisplayLabel = #1050#1055#1055
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataPHONE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'PHONE'
      Size = 30
    end
    object dsDataFAX: TStringField
      DisplayLabel = #1060#1072#1082#1089
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      DisplayLabel = #1058#1077#1083#1077#1082#1089
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      DisplayLabel = #1058#1077#1083#1077#1075#1088#1072#1092
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      DisplayLabel = #1058#1077#1083#1077#1090#1072#1081#1087
      FieldName = 'TELETYPE'
      Size = 100
    end
    object dsDataDEBTSUM: TFloatField
      FieldName = 'DEBTSUM'
    end
    object dsDataLOCKSUM: TFloatField
      FieldName = 'LOCKSUM'
    end
    object dsDataAVAILSUM: TFloatField
      FieldName = 'AVAILSUM'
    end
  end
  object dsSumm: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = True
    SQL.Strings = (
      'select dc.currency_id,'
      '       c.code AS cur_code,'
      '       nvl(SUM(p_noticepay.GetCharge(n.id, dc.id) -'
      '               p_noticepay.GetChargePay(n.id, dc.id)),'
      '           0) AS summa'
      '  from fdc_SubjectByLs_lst  s,'
      '       fdc_noticepay        n,'
      '       fdc_value            v,'
      '       fdc_object           o,'
      '       fdc_decl_charge      dc,'
      '       fdc_nsi_currency_lst c'
      ' where s.parent_id ='
      
        '       (SELECT NVL(p_personal_account.GetParentIDBySubjectId(:ID' +
        '), :ID)'
      '          FROM dual)'
      '   and s.id = n.subject_id'
      '   and n.id = o.owner_object_id'
      '   and o.id = v.id'
      '   and v.ref_object_id = dc.id'
      '   and c.id(+) = dc.currency_id'
      ' group by dc.currency_id, c.code')
    SourceServerObject = 'FDC_OBJECT_LST'
    Left = 44
    Top = 167
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
    object dsSummCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsSummCUR_CODE: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CUR_CODE'
      Size = 3
    end
    object dsSummSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
  end
  object srcSumm: TDataSource
    DataSet = dsSumm
    Left = 43
    Top = 204
  end
end
