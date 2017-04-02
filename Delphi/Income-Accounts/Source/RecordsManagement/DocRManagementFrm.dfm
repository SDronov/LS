inherited DocRManagementForm: TDocRManagementForm
  Left = 339
  Top = 270
  Width = 663
  Height = 398
  ActiveControl = edtName
  Caption = 'DocRManagementForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 647
    Height = 360
    ClientRectBottom = 336
    ClientRectRight = 647
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 641
        Height = 305
        inherited edtName: TcxDBTextEdit
          Left = 100
        end
        inherited edtDescript: TcxDBMemo
          Left = 100
          Top = 144
          TabOrder = 9
          Height = 146
        end
        object edtDocDate: TcxDBDateEdit [2]
          Left = 349
          Top = 36
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
          Width = 100
        end
        object edtDeclarant: TfdcObjectLinkEdit [3]
          Left = 100
          Top = 117
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person'
          DataBinding.SearchFormClass = 'TSubjectFindGridForm'
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
          TabOrder = 8
          OnBeforeAcceptObject = edtDeclarantBeforeAcceptObject
          Width = 377
        end
        object edtDeclINN: TcxDBMaskEdit [4]
          Left = 100
          Top = 90
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Properties.OnValidate = edtDeclINNPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 200
        end
        object edtDeclKPP: TcxDBMaskEdit [5]
          Left = 374
          Top = 90
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExpr
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Properties.OnValidate = edtDeclKPPPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 220
        end
        object edtDocNUmber: TcxDBTextEdit [6]
          Left = 100
          Top = 36
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 157
        end
        object cxDBIsTS: TcxDBCheckBox [7]
          Left = 522
          Top = 36
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1058#1057
          DataBinding.DataField = 'IS_TS'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 110
        end
        object edtIsActive: TcxDBCheckBox [8]
          Left = 9
          Top = 63
          Caption = #1055#1088#1086#1074#1077#1076#1105#1085
          DataBinding.DataField = 'IS_ACTIVE'
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
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 100
        end
        object edtActivationDate: TcxDBDateEdit [9]
          Left = 195
          Top = 63
          DataBinding.DataField = 'ACTIVATION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 224
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          object lcDoc: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcDocTS: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDocNumber: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocNUmber
                ControlOptions.ShowBorder = False
              end
              object lciDocDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocDate
                ControlOptions.ShowBorder = False
              end
              object lciIsTS: TdxLayoutItem
                CaptionOptions.AlignHorz = taRightJustify
                ShowCaption = False
                Control = cxDBIsTS
                ControlOptions.ShowBorder = False
              end
            end
            object lcActiveDoc: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciIsActive: TdxLayoutItem
                CaptionOptions.AlignHorz = taRightJustify
                ShowCaption = False
                Control = edtIsActive
                ControlOptions.ShowBorder = False
              end
              object lciActivationDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtActivationDate
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcgDeclarant: TdxLayoutGroup [2]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcgDeclarantInnKpp: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDeclInn: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Control = edtDeclINN
                ControlOptions.ShowBorder = False
              end
              object lciDeclKPP: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDeclKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciDeclarant: TdxLayoutItem
              Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
              Control = edtDeclarant
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            CaptionOptions.AlignHorz = taLeftJustify
            Visible = False
          end
          object lcTemp: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 647
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 305
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 333
        Width = 647
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 644
        Height = 305
      end
    end
    object tabPaymentOrder: TcxTabSheet [1]
      Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabPaymentOrderShow
    end
    object tabDecl: TcxTabSheet [2]
      Caption = #1043#1058#1044', '#1058#1056
      ImageIndex = 3
      OnShow = tabDeclShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 647
        Height = 336
        ClientRectBottom = 312
        ClientRectRight = 647
      end
    end
  end
  inherited ActionList: TActionList
    object actPrint: TAction
      Category = 'Object'
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      OnExecute = actPrintExecute
      OnUpdate = actPrintUpdate
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
          end
          item
            Item = btnPrint
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
    object btnPrint: TdxBarButton
      Action = actPrint
      Category = 0
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
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataSUBJECT_ID
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      'from fdc_rmanagement_lst'
      'where id = :id')
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'DOC_NUMBER'
      Required = True
      Size = 100
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 4000
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataDECL_OKPO: TStringField
      FieldName = 'DECL_OKPO'
      Size = 10
    end
    object dsDataDECL_ADDRESS: TStringField
      FieldName = 'DECL_ADDRESS'
      Size = 200
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1086#1074#1077#1076#1105#1085
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
      FieldName = 'ACTIVATION_DATE'
    end
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 24
    Top = 176
    object sqlCheckINN: TsqlOp
      SQL.Strings = (
        'begin'
        '  select id, name, inn, kpp '
        '    into :DECLARANT_ID, :DECL_NAME, :DECL_INN, :DECL_KPP    '
        '   from fdc_subject_lst'
        '    where inn = :INN and '
        '     (:KPP is null or (:KPP is not null and kpp = :KPP));'
        'exception'
        '  when others then'
        '     :DECLARANT_ID := NULL;'
        '     :DECL_NAME := NULL;'
        'end;')
      DataSet = dsData
    end
  end
  object dsPaymentOrderList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select po.name'
      '  from fdc_payment_order_lst po,'
      '       fdc_value_lst v'
      ' where v.owner_object_id = :id'
      '   and po.id = v.ref_object_id'
      '')
    Left = 24
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsPaymentOrderListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsDeclList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select od.name'
      '  from fdc_obligation_doc_lst od,'
      '       fdc_value_lst v'
      ' where v.owner_object_id = :id'
      '   and od.id = v.ref_object_id')
    Left = 56
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
    object dsDeclListNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
  end
  object dsReport: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    Left = 24
    Top = 240
  end
  object dsArticleList: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    Left = 88
    Top = 208
  end
end
