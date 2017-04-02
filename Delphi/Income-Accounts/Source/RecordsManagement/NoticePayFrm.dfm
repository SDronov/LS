inherited NoticePayForm: TNoticePayForm
  Left = 292
  Top = 119
  Width = 841
  Height = 651
  ActiveControl = nil
  Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1091#1095#1077#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 825
    Height = 613
    ClientRectBottom = 589
    ClientRectRight = 825
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 819
        Height = 558
        inherited edtName: TcxDBTextEdit
          Left = 174
          Width = 522
        end
        inherited edtDescript: TcxDBMemo
          Left = 174
          Top = 563
          TabOrder = 22
          Height = 219
          Width = 406
        end
        object cmbxDebtsReason: TfdcObjectLookupEdit [2]
          Left = 168
          Top = 290
          DataBinding.DataField = 'DEBTS_REASON_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DictData.srcDebtReason
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 10
          Width = 486
        end
        object edtDutySumma: TcxDBCurrencyEdit [3]
          Left = 168
          Top = 344
          DataBinding.DataField = 'DUTY_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 12
          Width = 486
        end
        object edtExcise: TcxDBCurrencyEdit [4]
          Left = 168
          Top = 371
          DataBinding.DataField = 'EXCISE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 13
          Width = 486
        end
        object edtPenaltySumma: TcxDBCurrencyEdit [5]
          Left = 168
          Top = 496
          DataBinding.DataField = 'PENALTY_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 20
          Width = 486
        end
        object edtPercent: TcxDBCurrencyEdit [6]
          Left = 519
          Top = 371
          DataBinding.DataField = 'PERCENT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 16
          Width = 486
        end
        object edtCustomsFees: TcxDBCurrencyEdit [7]
          Left = 519
          Top = 344
          DataBinding.DataField = 'CUSTOMS_FEES'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 486
        end
        object edtNds: TcxDBCurrencyEdit [8]
          Left = 168
          Top = 398
          DataBinding.DataField = 'NDS'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 14
          Width = 486
        end
        object edtExecutionDate: TcxDBDateEdit [9]
          Left = 174
          Top = 536
          DataBinding.DataField = 'EXECUTION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 21
          Width = 100
        end
        object edtPenaltyEDate: TcxDBDateEdit [10]
          Left = 540
          Top = 469
          DataBinding.DataField = 'PENALTY_EDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 19
          Width = 486
        end
        object edtPenaltySDate: TcxDBDateEdit [11]
          Left = 168
          Top = 469
          DataBinding.DataField = 'PENALTY_SDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 18
          Width = 486
        end
        object edtPaymentDate: TcxDBDateEdit [12]
          Left = 519
          Top = 398
          DataBinding.DataField = 'PAYMENT_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 17
          Width = 486
        end
        object edtSumma: TcxDBCurrencyEdit [13]
          Left = 168
          Top = 317
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 621
        end
        object edtRegDocNumber: TcxDBTextEdit [14]
          Left = 174
          Top = 63
          DataBinding.DataField = 'ASD_DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 4
          Width = 652
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 446
          Width = 100
        end
        inherited edtDeclarant: TfdcObjectLinkEdit
          Left = 168
          Top = 219
          Properties.OnButtonClick = edtDeclarantPropertiesButtonClick
          TabOrder = 9
          Width = 479
        end
        inherited edtDeclINN: TcxDBMaskEdit
          Left = 168
          Top = 192
          TabOrder = 7
          Width = 205
        end
        inherited edtDeclKPP: TcxDBMaskEdit
          Left = 500
          Top = 192
          TabOrder = 8
          Width = 215
        end
        inherited edtDocNUmber: TcxDBTextEdit
          Left = 174
          Width = 180
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Left = 683
          Style.IsFontAssigned = True
        end
        inherited edtIsActive: TcxDBCheckBox
          Left = 21
          Top = 121
          Style.IsFontAssigned = True
          TabOrder = 5
        end
        inherited edtActivationDate: TcxDBDateEdit
          Left = 207
          Top = 121
          TabOrder = 6
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcDoc: TdxLayoutGroup
            inherited lcDocTS: TdxLayoutGroup
              inherited lciDocDate: TdxLayoutItem
                Tag = 13
              end
              inherited lciIsTS: TdxLayoutItem
                Tag = 33
                Visible = False
              end
            end
            object lciRegDocNumber: TdxLayoutItem [1]
              Tag = 33
              Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtRegDocNumber
              ControlOptions.ShowBorder = False
            end
            inherited lcActiveDoc: TdxLayoutGroup
              Caption = #1055#1088#1086#1074#1086#1076#1082#1072
              ShowCaption = True
              Hidden = False
              ShowBorder = True
              inherited lciIsActive: TdxLayoutItem
                Tag = 33
              end
              inherited lciActivationDate: TdxLayoutItem
                Tag = 33
              end
            end
          end
          inherited lcgDeclarant: TdxLayoutGroup
            ShowCaption = True
            Hidden = False
            ShowBorder = True
            inherited lcgDeclarantInnKpp: TdxLayoutGroup
              inherited lciDeclInn: TdxLayoutItem
                Tag = 33
              end
              inherited lciDeclKPP: TdxLayoutItem
                Tag = 33
              end
            end
            inherited lciDeclarant: TdxLayoutItem
              Tag = 33
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            end
          end
          object lcgDebts: TdxLayoutGroup [3]
            Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
            object lciDebtsReason: TdxLayoutItem
              Caption = #1055#1088#1080#1095#1080#1085#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxDebtsReason
              ControlOptions.ShowBorder = False
            end
            object lciSumma: TdxLayoutItem
              Tag = 33
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lcgDebts1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcgDebts3: TdxLayoutGroup
                AutoAligns = []
                AlignHorz = ahClient
                ShowCaption = False
                Hidden = True
                ShowBorder = False
                object lciDutySumma: TdxLayoutItem
                  Tag = 33
                  AutoAligns = []
                  AlignHorz = ahClient
                  Caption = #1057#1091#1084#1084#1072' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1087#1086#1096#1083#1080#1085#1099
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtDutySumma
                  ControlOptions.ShowBorder = False
                end
                object lciExcise: TdxLayoutItem
                  Tag = 33
                  AutoAligns = []
                  AlignHorz = ahClient
                  Caption = #1040#1082#1094#1080#1079
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtExcise
                  ControlOptions.ShowBorder = False
                end
                object lciNds: TdxLayoutItem
                  Tag = 33
                  Caption = #1053#1044#1057
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtNds
                  ControlOptions.ShowBorder = False
                end
              end
              object lcgDebts2: TdxLayoutGroup
                AutoAligns = []
                AlignHorz = ahClient
                ShowCaption = False
                Hidden = True
                ShowBorder = False
                object lciCustomsFees: TdxLayoutItem
                  Tag = 33
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1077' '#1089#1073#1086#1088#1099
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtCustomsFees
                  ControlOptions.ShowBorder = False
                end
                object lciPercent: TdxLayoutItem
                  Tag = 33
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1055#1088#1086#1094#1077#1085#1090#1099
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtPercent
                  ControlOptions.ShowBorder = False
                end
                object lciPaymentDate: TdxLayoutItem
                  Caption = #1057#1088#1086#1082' '#1091#1087#1083#1072#1090#1099
                  CaptionOptions.AlignHorz = taRightJustify
                  Control = edtPaymentDate
                  ControlOptions.ShowBorder = False
                end
              end
            end
          end
          object lcgPenalty: TdxLayoutGroup [4]
            Caption = #1055#1077#1085#1080
            object lcgPenaltyDate: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciPenaltySDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1087#1077#1088#1080#1086#1076#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtPenaltySDate
                ControlOptions.ShowBorder = False
              end
              object lciPenaltyEDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1077#1088#1080#1086#1076#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtPenaltyEDate
                ControlOptions.ShowBorder = False
              end
            end
            object lciPenaltySumma: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtPenaltySumma
              ControlOptions.ShowBorder = False
            end
          end
          object lciExecutionDate: TdxLayoutItem [5]
            AutoAligns = [aaVertical]
            Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtExecutionDate
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 825
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 558
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 586
        Width = 825
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 822
        Height = 558
      end
    end
    inherited tabPaymentOrder: TcxTabSheet
      TabVisible = False
    end
    inherited tabDecl: TcxTabSheet
      Caption = #1044#1058', '#1058#1055#1054
    end
    object tabMeasures: TcxTabSheet [3]
      Caption = #1055#1088#1080#1085#1103#1090#1099#1077' '#1084#1077#1088#1099
      ImageIndex = 3
      OnShow = tabMeasuresShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 825
        Height = 589
        ClientRectBottom = 565
        ClientRectRight = 825
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actPrint: TAction
      Visible = False
    end
    object actActivate: TAction
      Category = 'Object'
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080
      OnExecute = actActivateExecute
      OnUpdate = actActivateUpdate
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
        FloatClientHeight = 79
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
          end
          item
            Item = barBtnActivate
            Visible = True
          end
          item
            Item = btnCreateActCorrOB
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
        Name = 'RMAN_ID'
        ParamType = ptUnknown
        SourceField = DocRManagementForm.dsDataID
        AcceptedSources = []
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select n.*'
      
        '      ,duty_summa + excise + nds + customs_fees + percent as sum' +
        'ma'
      '      ,nd.name as debts_reason_name'
      '  from fdc_noticepay_lst n'
      '      ,fdc_nsi_dict_lst nd'
      ' where n.id = :id'
      '   and nd.id(+) = n.debts_reason_id'
      '')
    AfterInsert = dsDataAfterInsert
    AfterPost = dsDataAfterPost
    inherited dsDataDOC_NUMBER: TStringField
      Required = False
    end
    object dsDataDEBTS_REASON_ID: TFloatField
      FieldName = 'DEBTS_REASON_ID'
    end
    object dsDataDUTY_SUMMA: TFloatField
      FieldName = 'DUTY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataEXCISE: TFloatField
      FieldName = 'EXCISE'
      DisplayFormat = ',0.00'
    end
    object dsDataNDS: TFloatField
      FieldName = 'NDS'
      DisplayFormat = ',0.00'
    end
    object dsDataCUSTOMS_FEES: TFloatField
      FieldName = 'CUSTOMS_FEES'
      DisplayFormat = ',0.00'
    end
    object dsDataPERCENT: TFloatField
      FieldName = 'PERCENT'
      DisplayFormat = ',0.00'
    end
    object dsDataPAYMENT_DATE: TDateTimeField
      FieldName = 'PAYMENT_DATE'
    end
    object dsDataPENALTY_SDATE: TDateTimeField
      FieldName = 'PENALTY_SDATE'
    end
    object dsDataPENALTY_EDATE: TDateTimeField
      FieldName = 'PENALTY_EDATE'
    end
    object dsDataEXECUTION_DATE: TDateTimeField
      FieldName = 'EXECUTION_DATE'
    end
    object dsDataPENALTY_SUMMA: TFloatField
      FieldName = 'PENALTY_SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataDEBTS_REASON_NAME: TStringField
      FieldName = 'DEBTS_REASON_NAME'
      Size = 1500
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = ',0.00'
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataCUSTOM_NAME: TStringField
      FieldName = 'CUSTOM_NAME'
      Size = 1500
    end
    object dsDataASD_DOC_NUMBER: TStringField
      DisplayLabel = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      FieldName = 'ASD_DOC_NUMBER'
      Size = 100
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_noticepay_add(pDocDate        =>  :DOC_DATE,'
      '                            pSubjectId      =>  :SUBJECT_ID,'
      
        '                            pDebtsReasonId  =>  :DEBTS_REASON_ID' +
        ','
      '                            pDutySumma      =>  :DUTY_SUMMA,'
      '                            pExcise         =>  :EXCISE,'
      '                            pNds            =>  :NDS,'
      '                            pCustomsFees    =>  :CUSTOMS_FEES,'
      '                            pPercent        =>  :PERCENT,'
      '                            pPaymentDate    =>  :PAYMENT_DATE,'
      '                            pPenaltySDate   =>  :PENALTY_SDATE,'
      '                            pPenaltyEDate   =>  :PENALTY_EDATE,'
      '                            pPenaltySumma   =>  :PENALTY_SUMMA,'
      
        '                            pExecutionDate  =>  :EXECUTION_DATE ' +
        ');'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEBTS_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DUTY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'EXCISE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NDS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CUSTOMS_FEES'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PERCENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PAYMENT_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PENALTY_SDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PENALTY_EDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PENALTY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'EXECUTION_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_noticepay_upd('
      '      pId              => :ID'
      '     ,pDocNumber       => :DOC_NUMBER'
      '     ,pDocDate         => :DOC_DATE'
      '     ,pDebtsReasonId   => :DEBTS_REASON_ID'
      '     ,pPaymentDate     => :PAYMENT_DATE'
      '     ,pPenaltySDate    => :PENALTY_SDATE'
      '     ,pPenaltyEDate    => :PENALTY_EDATE'
      '     ,pPenaltySumma    => :PENALTY_SUMMA'
      '     ,pExecutionDate   => :EXECUTION_DATE'
      '    );'
      'end;'
      '')
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
        DataType = ftUnknown
        Name = 'DEBTS_REASON_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYMENT_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENALTY_SDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENALTY_EDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PENALTY_SUMMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EXECUTION_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited QueryList1: TQueryList
    object sqlActivate: TsqlOp
      SQL.Strings = (
        'declare'
        '  lv_packId NUMBER;'
        '  lv_Count NUMBER;'
        'begin'
        ''
        '  select count(*) '
        '    into lv_Count'
        '    from fdc_value_lst v'
        '        ,fdc_decl_charge dch'
        '        ,fdc_document_lst dc'
        '        ,fdc_document_lst d'
        '   where v.owner_object_id = :id'
        '     and v.ref_object_id = dch.id'
        '     and dch.id = dc.id'
        '     and dch.decl_id = d.id'
        
          '     and d.typesysname in ('#39'CustomDecl'#39', '#39'CustomDeclTime'#39', '#39'Cust' +
          'omDeclTempAdm'#39', '#39'CustomDeclFull'#39','#39'TPO'#39', '#39'SubjectFeeDebt'#39')'
        '     and dc.is_active <> '#39'A'#39';'
        ''
        '  if lv_Count = 0 then'
        '    p_document.DoArchive( :id );'
        '  else'
        '    p_document.DoActivate( :id );'
        '  end if; '
        ''
        
          '  lv_packId := p_Docpack_Interactdebt.Create_Debts_Message(pNoti' +
          'ceID => :id);'
        '  if lv_packId is not null Then'
        '     p_docpack_interact.Send(pPackId => lv_PackId);'
        '  end if;'
        ''
        'end;')
      DataSet = dsData
    end
    object sqlCheckChargeNoActive: TsqlOp
      SQL.Strings = (
        'BEGIN'
        '  SELECT COUNT(0)'
        '    INTO :result'
        '    FROM fdc_noticepay_charge_lst c'
        '        ,fdc_document_lst         d'
        '    WHERE c.noticepay_id = :ID'
        '      AND c.id = d.id'
        '      AND d.is_active = '#39'N'#39';'
        'END;')
      DataSet = dsData
    end
  end
  inherited dsDeclList: TfdcQuery
    SQL.Strings = (
      'select distinct od.name'
      '  from fdc_obligation_doc_lst od,'
      '       fdc_noticepay_charge_lst nc'
      ' where nc.noticepay_id = :id'
      '   and od.id = nc.decl_id')
  end
  inherited dsReport: TfdcQuery
    SQL.Strings = (
      'select rm.doc_date,'
      '       rm.ASD_DOC_NUMBER as doc_number,'
      '       rm.custom_name,'
      '       rm.custom_code,'
      
        '       decode(rm.decl_name, null, null, rm.decl_name || '#39' '#39') as ' +
        'decl_name,'
      
        '       decode(rm.decl_inn, null, null, '#39#1048#1053#1053'/'#1050#1055#1055' '#39' || rm.decl_inn' +
        ' || '#39'/'#39' || rm.decl_kpp || '#39', '#39') as decl_inn,'
      
        '       decode(rm.decl_address, null, null, rm.decl_address) as d' +
        'ecl_address,'
      '       decode(p.doc_no, null, null,'
      
        '                        pt.shortname || '#39' '#39' || p.ser_no || '#39' '#39' |' +
        '| p.doc_no || decode(p.issued_date, null, null,'
      
        '                                                                ' +
        '                     '#39', '#1074#1099#1076'. '#39' || p.issued_date || '#39' '#39' || p.issu' +
        'ed_by) || '#39', '#39') as passport_data,'
      
        '       nvl(rm.duty_summa,0) + nvl(rm.excise,0) + nvl(rm.nds,0) +' +
        ' nvl(rm.customs_fees,0) + nvl(rm.percent,0) as summa,'
      
        '       nvl(rm.duty_summa,0) + nvl(rm.excise,0) + nvl(rm.nds,0) +' +
        ' nvl(rm.customs_fees,0) as CUSTOMS_PAYS,'
      '       nvl(rm.duty_summa,0) as duty_summa,'
      '       nvl(rm.excise,0) as excise,'
      '       nvl(rm.nds,0) as nds,'
      '       nvl(rm.customs_fees,0) as customs_fees,'
      '       nvl(rm.percent, 0) as "percent",'
      '       rm.payment_date,'
      '       rm.penalty_sdate,'
      '       rm.penalty_edate,'
      '       nvl(rm.penalty_summa, 0) as penalty_summa,'
      '       rm.execution_date,'
      '       nd.name as debts_reason_name,'
      
        '       (SELECT StringValue FROM fdc_value_lst_sys WHERE SysName ' +
        '= '#39'BossName'#39') AS boss_name'
      '  from fdc_noticepay_lst rm'
      '      ,fdc_person_lst p'
      '      ,fdc_passport_type_lst pt'
      '      ,fdc_nsi_dict_lst nd'
      ' where rm.id = :id'
      '   and rm.subject_id = p.id(+)'
      '   and p.doc_type = pt.code(+)'
      '   and nd.id(+) = rm.debts_reason_id'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object dsKBKList: TOracleDataSet
    SQL.Strings = (
      'SELECT fdc_str_agg( code ) AS kbk_list'
      'FROM ('
      'SELECT distinct k.code '
      '  FROM fdc_noticepay_charge_lst t'
      '      ,fdc_payment_type_lst     pt'
      '      ,fdc_kbk_dict_lst         k'
      '  WHERE t.noticepay_id = :id'
      '    AND pt.id          = t.pay_type_id'
      '    AND k.id           = t.kbkcode_id'
      '    AND SUBSTR( pt.code, 1, 2 ) IN ( :pay_type_list ))')
    Variables.Data = {
      0300000002000000030000003A49440400000000000000000000000E0000003A
      5041595F545950455F4C495354010000000000000000000000}
    Cursor = crSQLWait
    Session = MainData.Session
    Left = 83
    Top = 258
  end
end
