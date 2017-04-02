inherited SubjectFeeForm: TSubjectFeeForm
  Left = 415
  Top = 190
  Width = 749
  Height = 498
  HelpContext = 45
  ActiveControl = edtPayerINN
  Caption = 'SubjectFeeForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 733
    Height = 460
    ClientRectBottom = 436
    ClientRectRight = 733
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 727
        Height = 405
        inherited edtName: TcxDBTextEdit
          Left = 72
          Top = 129
          TabOrder = 6
          Width = 291
        end
        inherited edtDescript: TcxDBMemo
          Left = 72
          Top = 159
          TabOrder = 7
          Height = 87
          Width = 186
        end
        object edtPayerINN: TcxDBMaskEdit [2]
          Left = 72
          Top = 9
          DataBinding.DataField = 'DECL_INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = edtPayerINNPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 141
        end
        object edtKPP: TcxDBMaskEdit [3]
          Left = 448
          Top = 9
          DataBinding.DataField = 'DECL_KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,9}'
          Properties.MaxLength = 0
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Properties.OnValidate = edtKPPPropertiesValidate
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clWindow
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 123
        end
        object edtPayerName: TfdcObjectLinkEdit [4]
          Left = 72
          Top = 39
          DataBinding.DataField = 'DECL_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SUBJECT_ID'
          DataBinding.TypeSysName = 'Declarant;Person;Subject;Bank'
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
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          OnBeforeAcceptObject = edtPayerNameBeforeAcceptObject
          Width = 291
        end
        object DocNumber: TcxDBMaskEdit [5]
          Left = 72
          Top = 69
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 134
        end
        object edtDocDate: TcxDBDateEdit [6]
          Left = 593
          Top = 69
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 125
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [7]
          Left = 72
          Top = 99
          DataBinding.DataField = 'CURRENCY_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = DictData.srcCurrency
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 929
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [0]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1053#1053
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtPayerINN
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              Tag = 13
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtKPP
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem3: TdxLayoutItem [1]
            Tag = 13
            Caption = #1057#1091#1073#1098#1077#1082#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtPayerName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup2: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lciDocNumber: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1086#1084#1077#1088
              CaptionOptions.AlignHorz = taRightJustify
              Control = DocNumber
              ControlOptions.ShowBorder = False
            end
            object lciDocDate: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1044#1072#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDocDate
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem4: TdxLayoutItem [3]
            Tag = 13
            Caption = #1042#1072#1083#1102#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxedtCurrID
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 733
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 405
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 433
        Width = 733
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 730
        Height = 405
      end
    end
    object tabCharge: TcxTabSheet [1]
      Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
      ImageIndex = 2
      OnShow = tabChargeShow
    end
    object tabPayments: TcxTabSheet [2]
      Caption = #1054#1087#1083#1072#1090#1072
      ImageIndex = 3
      OnShow = tabPaymentsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 733
        Height = 436
        ClientRectBottom = 412
        ClientRectRight = 733
      end
    end
    object tabErrors: TcxTabSheet
      Caption = #1054#1096#1080#1073#1082#1080
      ImageIndex = 4
      OnShow = tabErrorsShow
    end
  end
  inherited ActionList: TActionList
    object actGroundsRemoveFines: TAction
      Caption = #1057#1085#1103#1090#1080#1077' '#1089' '#1091#1095#1077#1090#1072' '#1096#1090#1088#1072#1092#1086#1074
      Hint = #1057#1085#1103#1090#1080#1077' '#1089' '#1091#1095#1077#1090#1072' '#1096#1090#1088#1072#1092#1086#1074
      OnExecute = actGroundsRemoveFinesExecute
      OnUpdate = actGroundsRemoveFinesUpdate
    end
    object actActivate: TAction
      Category = 'Object'
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actActivateExecute
      OnUpdate = actActivateUpdate
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Top = 75
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -13
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
          end
          item
            Item = dxBarSubItem1
            Visible = True
          end
          item
            Item = barBtnActivate
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
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton2
          Visible = True
        end>
    end
    object dxBarButton2: TdxBarButton
      Action = actGroundsRemoveFines
      Category = 0
    end
    object barBtnActivate: TdxBarButton
      Action = actActivate
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
        Name = 'DECL_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
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
      '  from fdc_Subject_Fee_Lst'
      ' where ID = :ID')
    AfterRefresh = dsDataAfterRefresh
    object dsDataMODIFY_DATE: TDateTimeField
      DefaultExpression = '$$DATE$$'
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'MODIFY_DATE'
    end
    object dsDataSUBJECT_ID: TFloatField
      DisplayLabel = #1057#1091#1073#1098#1077#1082#1090
      FieldName = 'SUBJECT_ID'
      Required = True
    end
    object dsDataACT_NO: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'ACT_NO'
      Size = 0
    end
    object dsDataDECL_KPP: TStringField
      FieldName = 'DECL_KPP'
      Size = 10
    end
    object dsDataDECL_INN: TStringField
      FieldName = 'DECL_INN'
      Size = 12
    end
    object dsDataDECL_NAME: TStringField
      FieldName = 'DECL_NAME'
      Size = 1500
    end
    object dsDataDOC_DATE: TDateTimeField
      DefaultExpression = '$$DATE$$'
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'DOC_NUMBER'
      Required = True
      Size = 100
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataerr_count: TIntegerField
      FieldName = 'ERR_COUNT'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_subject_fee.add('
      '      pfeetype    => :TYPESYSNAME'
      '     ,psubjectid  => :SUBJECT_ID'
      '     ,pCurrencyID => :CURRENCY_ID'
      '     ,pno         => :DOC_NUMBER'
      '     ,pdate       => :DOC_DATE'
      '     ,pdescript   => :descript'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURRENCY_ID'
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
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_subject_fee.modify(pid => :id,'
      '                       pno => :DOC_NUMBER,'
      '                       pdate => :DOC_DATE,'
      '                       pdescript => :descript);'
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
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 27
    Top = 68
    object sqlCheckINN: TsqlOp
      SQL.Strings = (
        'begin'
        '  select id, name, inn, kpp '
        '    into :SUBJECT_ID, :DECL_NAME, :DECL_INN, :DECL_KPP    '
        '   from fdc_subject_lst'
        '    where inn = :INN and '
        '     (:KPP is null or (:KPP is not null and kpp = :KPP));'
        'exception'
        '  when others then'
        '     :SUBJECT_ID := NULL;'
        '     :DECL_NAME := NULL;'
        'end;')
      DataSet = dsData
    end
    object sqlCheckActivate: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT DECODE(COUNT(*),0,1,0)'
        '    INTO :result'
        '    FROM ( SELECT 0'
        '             FROM fdc_decl_charge_hist_lst dc'
        '             WHERE dc.decl_id = :ID'
        '               AND dc.is_active = '#39'N'#39
        
          '--               AND dc.object_type_id = fdc_object_type_get_bys' +
          'ysname('#39'DeclCharge'#39')'
        ''
        '/*  SELECT COUNT(*)'
        '    INTO :result'
        '    FROM ( SELECT 0'
        '             FROM fdc_decl_charge_hist_lst dc'
        '             WHERE dc.decl_id = :ID'
        '               AND dc.is_active = '#39'Y'#39'*/'
        
          '          -- '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1076#1086#1083#1078#1077#1085' '#1087#1088#1086#1074#1077#1088#1103#1090#1100#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1074' '#1095#1072#1089 +
          #1090#1080' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081'  '
        '          /* UNION ALL  '
        '           SELECT 0'
        '             FROM fdc_payment_deduction_lst pd'
        '             WHERE pd.decl_id = :ID'
        '               AND pd.is_active = '#39'Y'#39' */  '
        ''
        '         );'
        'END;')
      DataSet = dsData
    end
    object sqlActivate: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  FOR r IN ( SELECT dc.id'
        '               FROM fdc_decl_charge_hist_lst dc'
        '              WHERE dc.decl_id = :ID'
        '                    AND dc.is_active = '#39'N'#39
        '             UNION ALL'
        '             SELECT pd.id'
        '               FROM fdc_payment_deduction_lst pd'
        '              WHERE pd.decl_id = :ID'
        '                    AND pd.is_active = '#39'N'#39
        '             UNION ALL'
        '             SELECT cp.id'
        '               FROM fdc_payment_deduction_lst pd'
        '                   ,fdc_cross_pay cp'
        '                   ,fdc_document d'
        '              WHERE pd.decl_id = :ID'
        '                    AND pd.id = cp.deduction_id'
        '                    AND cp.id = d.id'
        '                    AND d.is_active = '#39'N'#39' '
        '             UNION ALL'
        '             SELECT  dl.id     '
        '               FROM fdc_payment_deduction_lst pdl'
        '                   ,fdc_document_lst          dl'
        '              WHERE pdl.decl_id =  :ID'
        '                    AND pdl.id = dl.owner_object_id'
        '                    AND dl.typesysname = '#39'PaymentFor'#39') '
        '  LOOP'
        '    p_document.DoActivate( r.id );'
        '  END LOOP;'
        'END;')
      DataSet = dsData
    end
  end
end
