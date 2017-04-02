inherited CustomDeclTempAdmForm: TCustomDeclTempAdmForm
  Left = 221
  Top = 192
  Width = 909
  Height = 519
  HelpContext = 49
  Caption = 'CustomDeclTempAdmForm'
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 901
    Height = 492
    ClientRectBottom = 468
    ClientRectRight = 901
    inherited tabGeneral: TcxTabSheet
      OnShow = tabGeneralShow
      inherited lcGeneral: TdxLayoutControl
        Width = 895
        Height = 439
        inherited edtName: TcxDBTextEdit
          Left = 47
          Top = 119
          Style.IsFontAssigned = True
          TabOrder = 11
          Width = 839
        end
        inherited edtDescript: TcxDBMemo
          Left = 81
          Top = 583
          Style.IsFontAssigned = True
          TabOrder = 28
          Height = 25
          Width = 333
        end
        object cxDBCheckBox1: TcxDBCheckBox [2]
          Left = 613
          Top = 9
          Caption = #1055#1086#1083#1085#1086#1077' '#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077
          DataBinding.DataField = 'TAX_EXEMPTION'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.Alignment = taLeftJustify
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Width = 200
        end
        inherited edtDeclName: TfdcObjectLinkEdit
          Left = 113
          Top = 210
          Style.IsFontAssigned = True
          TabOrder = 14
          Width = 758
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Left = 59
          Top = 480
          Style.IsFontAssigned = True
          TabOrder = 22
          Width = 302
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Left = 59
          Top = 510
          Style.IsFontAssigned = True
          TabOrder = 23
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Left = 427
          Top = 510
          Style.IsFontAssigned = True
          TabOrder = 25
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Left = 427
          Top = 480
          Style.IsFontAssigned = True
          TabOrder = 24
          Width = 430
        end
        inherited edtFIO: TcxDBTextEdit
          Left = 382
          Top = 553
          Style.IsFontAssigned = True
          TabOrder = 27
          Width = 440
        end
        inherited cmbxG011: TfdcObjectLookupEdit
          Left = 81
          Top = 77
          Style.IsFontAssigned = True
          TabOrder = 6
        end
        inherited cmbxCustomMode: TfdcObjectLookupEdit
          Left = 231
          Top = 77
          DataBinding.DataField = 'CUSTOM_MODE_CODE'
          Properties.KeyFieldNames = 'CODE'
          Style.IsFontAssigned = True
          TabOrder = 7
        end
        inherited edtCustomsCode: TcxDBMaskEdit
          Left = 81
          Top = 47
          Style.IsFontAssigned = True
          TabOrder = 3
        end
        inherited edtRegDate: TcxDBDateEdit
          Left = 174
          Top = 47
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 89
        end
        inherited edtDeclNo: TcxDBMaskEdit
          Left = 269
          Top = 47
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 598
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 113
          Top = 180
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 418
        end
        inherited DeclKPP: TcxDBMaskEdit
          Left = 554
          Top = 180
          Style.IsFontAssigned = True
          TabOrder = 13
          Width = 309
        end
        inherited edtGD1: TcxDBDateEdit
          Top = 553
          Style.IsFontAssigned = True
          TabOrder = 26
          Width = 283
        end
        inherited fdcObjectLookupEdit1: TfdcObjectLookupEdit
          Left = 362
          Top = 77
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 63
        end
        inherited edtGTDName: TcxDBMaskEdit
          Left = 81
          Style.IsFontAssigned = True
        end
        inherited cmbxDecision: TfdcObjectLookupEdit
          Left = 478
          Top = 77
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              Width = 52
              FieldName = 'CODE'
            end
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 350
              FieldName = 'Name'
            end>
          Style.IsFontAssigned = True
          TabOrder = 9
        end
        inherited edtPredDecl: TcxDBTextEdit
          Left = 397
        end
        inherited editDeclBrINN: TcxDBMaskEdit
          Left = 113
          Top = 284
          TabOrder = 15
        end
        inherited editDeclBrKpp: TcxDBMaskEdit
          Left = 536
          Top = 284
          TabOrder = 16
        end
        inherited editDeclBrSvDate: TcxDBDateEdit
          Left = 518
          Top = 360
          TabOrder = 19
        end
        inherited editDeclBrSvNum: TcxDBTextEdit
          Left = 113
          Top = 360
          TabOrder = 18
        end
        inherited editDeclBrDgNum: TcxDBTextEdit
          Left = 113
          Top = 398
          TabOrder = 20
        end
        inherited editDeclBrDgDate: TcxDBDateEdit
          Left = 518
          Top = 398
          TabOrder = 21
        end
        inherited editDeclBrName: TfdcObjectLinkEdit
          Left = 113
          Top = 322
          TabOrder = 17
        end
        inherited edtDecisionDate: TcxDBDateEdit
          Left = 662
          Top = 77
          TabOrder = 10
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGeneralGroup10: TdxLayoutGroup
            inherited lciTempGTDNo: TdxLayoutItem
              Visible = False
            end
            object lcGeneralItem21: TdxLayoutItem
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = cxDBCheckBox1
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcGeneralGroup5: TdxLayoutGroup
            inherited lcGeneralItem17: TdxLayoutItem
              Tag = 0
              Visible = False
            end
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 901
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 439
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 465
        Width = 901
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 898
        Height = 439
      end
    end
    object tabImport31: TcxTabSheet [1]
      Caption = #1042#1088#1077#1084#1077#1085#1085#1099#1081' '#1074#1074#1086#1079
      ImageIndex = 5
      OnShow = tabImport31Show
      object pnlImport31: TPanel
        Left = 0
        Top = 0
        Width = 901
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object dxBarDockControl31Top: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 901
          Height = 3
          Align = dalTop
          BarManager = BarManager
        end
        object dxBarDockControl31Left: TdxBarDockControl
          Left = 0
          Top = 3
          Width = 3
          Height = 91
          Align = dalLeft
        end
        object dxBarDockControl31Bottom: TdxBarDockControl
          Left = 0
          Top = 94
          Width = 901
          Height = 3
          Align = dalBottom
        end
        object dxBarDockControl31Right: TdxBarDockControl
          Left = 898
          Top = 3
          Width = 3
          Height = 91
          Align = dalRight
        end
        object lcImport31: TdxLayoutControl
          Left = 3
          Top = 3
          Width = 895
          Height = 91
          Align = alClient
          TabOrder = 4
          AutoContentSizes = [acsWidth, acsHeight]
          LookAndFeel = LayoutWebLookAndFeel
          object cxDBDateEdit4: TcxDBDateEdit
            Left = 132
            Top = 9
            DataBinding.DataField = 'EXPORT_DATE'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.ReadOnly = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = Modify
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.ButtonStyle = btsHotFlat
            Style.PopupBorderStyle = epbsSingle
            Style.IsFontAssigned = True
            TabOrder = 0
            Width = 355
          end
          object cxDBMaskEdit1: TcxDBMaskEdit
            Left = 637
            Top = 9
            DataBinding.DataField = 'PAYED_MONTHS'
            DataBinding.DataSource = srcData
            ParentFont = False
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '[0-9]?[0-9]'
            Properties.MaxLength = 0
            Properties.OnChange = Modify
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = RUSSIAN_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = False
            Style.StyleController = WebEditStyleController
            Style.IsFontAssigned = True
            TabOrder = 1
            Width = 249
          end
          object lcImport31Group_Root: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcImport31Item1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1088#1086#1082' '#1086#1073#1088#1072#1090#1085#1086#1075#1086' '#1074#1099#1074#1086#1079#1072
              Control = cxDBDateEdit4
              ControlOptions.ShowBorder = False
            end
            object lcImport31Item2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1063#1080#1089#1083#1086' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
              Control = cxDBMaskEdit1
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      object pnlPeriodicCharges: TPanel
        Left = 0
        Top = 121
        Width = 901
        Height = 347
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlPeriodicCharges'
        DockSite = True
        TabOrder = 1
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 97
        Width = 901
        Height = 2
        AlignSplitter = salTop
        Control = pnlImport31
      end
      object Panel1: TPanel
        Left = 0
        Top = 99
        Width = 901
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1087#1083#1072#1090#1077#1078#1080
        TabOrder = 3
      end
    end
    inherited tabControlDoc: TcxTabSheet
      inherited pcControlDoc: TcxPageControl
        Width = 901
        Height = 468
        ClientRectBottom = 444
        ClientRectRight = 901
        inherited tabKTS: TcxTabSheet
          inherited pcKTS: TcxPageControl
            Width = 901
            Height = 444
            ClientRectBottom = 420
            ClientRectRight = 901
          end
        end
      end
    end
    inherited tabErrors: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 901
        Height = 468
        ClientRectBottom = 444
        ClientRectRight = 901
        inherited tabFake: TcxTabSheet
          inherited lblFake: TLabel
            Width = 115
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 392
    Top = 387
    inherited actCorrectSubject: TAction
      Visible = False
    end
    object actStop: TAction
      Category = 'Object'
      Caption = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1055#1088#1080#1086#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1074#1088#1077#1084#1077#1085#1085#1086#1075#1086' '#1074#1074#1086#1079#1072
      OnExecute = actStopExecute
      OnUpdate = actStopUpdate
    end
    object actProlong: TAction
      Category = 'Object'
      Caption = #1055#1088#1086#1076#1083#1080#1090#1100
      Hint = #1055#1088#1086#1076#1083#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1074#1088#1077#1084#1077#1085#1085#1086#1075#1086' '#1074#1074#1086#1079#1072
      OnExecute = actProlongExecute
      OnUpdate = actProlongUpdate
    end
    object actStopHistory: TAction
      Category = 'Object'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1087#1088#1080#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1081
      OnExecute = actStopHistoryExecute
    end
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 476
    Top = 387
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 588
    Top = 387
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -20
    Style.IsFontAssigned = True
    Left = 616
    Top = 387
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 532
    Top = 387
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 560
    Top = 387
  end
  inherited imglAction: TImageList
    Left = 420
    Top = 387
  end
  inherited imglLarge: TImageList
    Left = 448
    Top = 387
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
        FloatClientWidth = 103
        FloatClientHeight = 50
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
            Item = dxBarButton1
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
    Left = 504
    Top = 387
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
        SourceField = CustomDeclForm.dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'DECL_NO'
        ParamType = ptUnknown
        SourceField = CustomDeclForm.dsDataNAME
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'pDocId'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Tax_Exemption'
        ParamType = ptUnknown
      end>
    Left = 392
    Top = 415
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select t.*, decode(last_payed_month, null, payed_months, '
      
        '  ceil(months_between(last_payed_month, nvl(gd1, reg_date)) + 1)' +
        ') as really_payed_months'
      ',null pred_decl'
      'from fdc_Custom_Decl_Temp_Adm_Lst t'
      'where ID = :ID')
    Left = 420
    Top = 415
    inherited dsDataCUSTOM_MODE_ID: TFloatField
      Required = False
    end
    inherited dsDataGD1: TDateTimeField
      Visible = False
    end
    inherited dsDataPRED_DECL: TStringField
      Size = 0
    end
    object dsDataEXPORT_DATE: TDateTimeField
      DisplayLabel = #1057#1088#1086#1082' '#1086#1073#1088#1072#1090#1085#1086#1075#1086' '#1074#1099#1074#1086#1079#1072
      FieldName = 'EXPORT_DATE'
    end
    object dsDataPAYED_MONTHS: TIntegerField
      DisplayLabel = #1063#1080#1089#1083#1086' '#1086#1087#1083#1072#1095#1077#1085#1085#1099#1093' '#1084#1077#1089#1103#1094#1077#1074
      FieldName = 'PAYED_MONTHS'
    end
    object dsDataTAX_EXEMPTION: TIntegerField
      DefaultExpression = '0'
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1077
      FieldName = 'TAX_EXEMPTION'
    end
    object dsDataREALLY_PAYED_MONTHS: TFloatField
      FieldName = 'REALLY_PAYED_MONTHS'
    end
    object dsDataNEXT_PAY_MONTH: TDateTimeField
      FieldName = 'NEXT_PAY_MONTH'
    end
  end
  inherited srcData: TDataSource
    Left = 420
    Top = 443
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      
        '  :ID ::= fdc_custom_decl_tempadm_add(pcustomscode => :customs_c' +
        'ode,'
      '                               pregdate => :reg_date,'
      '                               pdeclno => :decl_no,'
      '                               pDescript => :DESCRIPT,'
      '                               pmodifydate => :modify_date,'
      '                               psubjectid => :subject_id,'
      '                               pg12 => :g12,'
      '                               pcurrencyid => :currency_id,'
      '                               pg444a => :g444a,'
      '                               pg444b => :g444b,'
      '                               pg447a => :g447a,'
      '                               pg447b => :g447b,'
      '                               pk115 => :k115,'
      '                               pg40 => :g40,'
      '                               pgd1  => :gd1,'
      '                               pG0131 =>  :G0131,'
      '                               pDecision_Code => :Decision_Code,'
      
        '                               pCustomsMode => :CUSTOM_MODE_CODE' +
        ','
      '                               pG011 => :G011,'
      '                               pAggrementId  => :AGGREMENT_ID);'
      'end;')
    Left = 448
    Top = 415
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'MODIFY_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'G12'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G444A'
        ParamType = ptUnknown
        Size = 81
      end
      item
        DataType = ftDateTime
        Name = 'G444B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G447A'
        ParamType = ptUnknown
        Size = 51
      end
      item
        DataType = ftDateTime
        Name = 'G447B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'K115'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'G40'
        ParamType = ptUnknown
        Size = 24
      end
      item
        DataType = ftDate
        Name = 'gd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'G0131'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CUSTOM_MODE_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'G011'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGGREMENT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_custom_decl_tempadm_upd(pid => :id,'
      '                              pcustomscode => :customs_code,'
      '                               pregdate => :reg_date,'
      '                               pdeclno => :decl_no,'
      '                               pDescript => :DESCRIPT ,'
      '                               pmodifydate => :modify_date,'
      '                               psubjectid => :subject_id,'
      '                               pg12 => :g12,'
      '                               pcurrencyid => :currency_id,'
      '                               pg444a => :g444a,'
      '                               pg444b => :g444b,'
      '                               pg447a => :g447a,'
      '                               pg447b => :g447b,'
      '                               pk115 => :k115,'
      '                               pg40 => :g40,'
      '                               pgd1  => :gd1,'
      '                               pG0131 => null,'
      '                               pDecision_Code => :Decision_Code,'
      '                               pDecision_Date => :Decision_Date,'
      '                               pExportDate => :Export_Date,'
      '                               pTaxExemption => :Tax_Exemption,'
      '                               pPayedMonths => :Payed_Months,'
      '                               pNextPayMonth => :NEXT_PAY_MONTH,'
      '                               pAggrementId  => :AGGREMENT_ID);'
      'end;')
    Left = 480
    Top = 415
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'customs_code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reg_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'MODIFY_DATE'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'G12'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G444A'
        ParamType = ptUnknown
        Size = 81
      end
      item
        DataType = ftDateTime
        Name = 'G444B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G447A'
        ParamType = ptUnknown
        Size = 51
      end
      item
        DataType = ftDateTime
        Name = 'G447B'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'K115'
        ParamType = ptUnknown
        Size = 21
      end
      item
        DataType = ftString
        Name = 'G40'
        ParamType = ptUnknown
        Size = 24
      end
      item
        DataType = ftUnknown
        Name = 'gd1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Decision_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Export_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Tax_Exemption'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Payed_Months'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NEXT_PAY_MONTH'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGGREMENT_ID'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 524
    Top = 459
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 616
    Top = 415
  end
  inherited dsUpdateState: TfdcQuery
    Left = 560
    Top = 415
  end
  inherited srcState: TDataSource
    Left = 472
    Top = 459
  end
  inherited dsTransit: TfdcQuery
    Left = 532
    Top = 415
  end
  inherited dsState: TfdcQuery
    Left = 504
    Top = 415
  end
  inherited srcAccessLevel: TDataSource
    Left = 588
    Top = 443
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 588
    Top = 415
  end
  inherited QueryList1: TQueryList
    Top = 92
    object sqlAddAdvice: TsqlOp
      SQL.Strings = (
        'begin'
        '  -- Call the procedure'
        '  p_custom_decl_temp.addadvice(pdeclid => :pdeclid);'
        'end;')
    end
  end
  inherited dsDeduction: TOracleDataSet
    QBEDefinition.QBEFieldDefs = {040000000100000003000000434E54010000000000}
  end
end
