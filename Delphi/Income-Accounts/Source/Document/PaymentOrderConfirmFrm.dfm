inherited PaymentOrderConfirmForm: TPaymentOrderConfirmForm
  Left = 257
  Top = 217
  Width = 794
  Height = 534
  Caption = 'PaymentOrderConfirmForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 786
    Height = 507
    ClientRectBottom = 483
    ClientRectRight = 786
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 780
        Height = 454
        inherited edtName: TcxDBTextEdit
          Enabled = False
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 357
          DataBinding.DataField = 'NOTE'
          Enabled = False
          TabOrder = 13
          Height = 91
          Width = 185
        end
        object edtPayerINN: TcxDBTextEdit [2]
          Left = 150
          Top = 165
          DataBinding.DataField = 'PAYER_INN'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 121
        end
        object edtPayerKPP: TcxDBTextEdit [3]
          Left = 593
          Top = 165
          DataBinding.DataField = 'PAYER_KPP'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Width = 166
        end
        object edtPayerName: TcxDBTextEdit [4]
          Left = 150
          Top = 192
          DataBinding.DataField = 'PAYER_NAME'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 7
          Width = 121
        end
        object edtExecDate: TcxDBDateEdit [5]
          Left = 150
          Top = 263
          DataBinding.DataField = 'EXEC_DATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 163
        end
        object edtDocSumma: TcxDBCurrencyEdit [6]
          Left = 150
          Top = 317
          DataBinding.DataField = 'DOC_SUMMA'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 12
          Width = 121
        end
        object edtCurrencyCode: TcxDBTextEdit [7]
          Left = 150
          Top = 290
          DataBinding.DataField = 'CURR_CODE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 10
          Width = 51
        end
        object edtCurrencyName: TcxDBTextEdit [8]
          Left = 207
          Top = 290
          DataBinding.DataField = 'CURR_NAME'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 121
        end
        object edtIncomeDate: TcxDBTextEdit [9]
          Left = 415
          Top = 263
          DataBinding.DataField = 'INCOME_DATE'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 9
          Width = 154
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 150
          Enabled = False
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 638
          Enabled = False
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Enabled = False
          end
          inherited lcgDocument: TdxLayoutGroup
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090' - '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1072#1102#1097#1077#1077' '#1087'/'#1087
            inherited lciDocNumber: TdxLayoutItem
              Enabled = False
            end
            inherited lciDocDate: TdxLayoutItem
              Enabled = False
            end
          end
          object lcgPayer: TdxLayoutGroup [2]
            Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' - '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082
            object lcGeneralGroup4: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciPayerINN: TdxLayoutItem
                AutoAligns = [aaVertical]
                AlignHorz = ahClient
                Caption = #1048#1053#1053
                Enabled = False
                Control = edtPayerINN
                ControlOptions.ShowBorder = False
              end
              object lciPayerKPP: TdxLayoutItem
                Caption = #1050#1055#1055
                Enabled = False
                Control = edtPayerKPP
                ControlOptions.ShowBorder = False
              end
            end
            object lciPayerName: TdxLayoutItem
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
              Enabled = False
              Control = edtPayerName
              ControlOptions.ShowBorder = False
            end
          end
          object lcgConfirmation: TdxLayoutGroup [3]
            Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
            object lcGeneralGroup5: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciExecDate: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103' '#1073#1072#1085#1082#1086#1084
                Enabled = False
                Control = edtExecDate
                ControlOptions.ShowBorder = False
              end
              object lciIncomeDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
                Enabled = False
                Control = edtIncomeDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              ShowBorder = False
              object lcGeneralGroup6: TdxLayoutGroup
                ShowCaption = False
                Hidden = True
                LayoutDirection = ldHorizontal
                ShowBorder = False
                object lciCurrencyCode: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  Caption = #1042#1072#1083#1102#1090#1072
                  Enabled = False
                  Control = edtCurrencyCode
                  ControlOptions.ShowBorder = False
                end
                object lciCurrencyName: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = 'cxDBTextEdit1'
                  Enabled = False
                  ShowCaption = False
                  Control = edtCurrencyName
                  ControlOptions.ShowBorder = False
                end
              end
              object lciDocSumma: TdxLayoutItem
                Caption = #1057#1091#1084#1084#1072
                Enabled = False
                Control = edtDocSumma
                ControlOptions.ShowBorder = False
              end
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Enabled = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 786
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 454
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 480
        Width = 786
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 783
        Height = 454
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 786
        Height = 483
        ClientRectBottom = 459
        ClientRectRight = 786
      end
    end
  end
  inherited ActionList: TActionList
    object actOpenConfirmed: TAction
      Category = 'Object'
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1081
      OnExecute = actOpenConfirmedExecute
      OnUpdate = actOpenConfirmedUpdate
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
        FloatLeft = 341
        FloatTop = 319
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
            Item = barBtnOpenConfirmed
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
    object barBtnOpenConfirmed: TdxBarButton
      Action = actOpenConfirmed
      Category = 0
    end
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_payment_order_cnfrm_lst'
      ' where confirmed_pay_id = :ID'
      '    OR id = :ID')
    SourceServerObject = 'FDC_PAYMENT_ORDER_CNFRM_LST'
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
    object dsDataOPERATE_DATE: TDateTimeField
      FieldName = 'OPERATE_DATE'
    end
    object dsDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      Size = 50
    end
    object dsDataDOC_NO2: TStringField
      FieldName = 'DOC_NO2'
      Size = 50
    end
    object dsDataDOC_DATE2: TDateTimeField
      FieldName = 'DOC_DATE2'
    end
    object dsDataEXEC_DATE: TDateTimeField
      FieldName = 'EXEC_DATE'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
    end
    object dsDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataCASHDESK_ID: TFloatField
      FieldName = 'CASHDESK_ID'
    end
    object dsDataCARDNUM: TStringField
      FieldName = 'CARDNUM'
      Size = 19
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataAGREEMENT_ID: TFloatField
      FieldName = 'AGREEMENT_ID'
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataINCOME_DATE: TDateTimeField
      FieldName = 'INCOME_DATE'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 400
    end
    object dsDataNREF: TStringField
      FieldName = 'NREF'
      Size = 25
    end
    object dsDataPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      Size = 1500
    end
    object dsDataPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      Size = 12
    end
    object dsDataPAYER_KPP: TStringField
      FieldName = 'PAYER_KPP'
      Size = 10
    end
    object dsDataCASHDESK_NAME: TStringField
      FieldName = 'CASHDESK_NAME'
      Size = 1500
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataREST_SUMMA: TFloatField
      FieldName = 'REST_SUMMA'
    end
    object dsDataLOCKED_SUMMA: TFloatField
      FieldName = 'LOCKED_SUMMA'
    end
    object dsDataCOMING_DATE: TDateTimeField
      FieldName = 'COMING_DATE'
    end
    object dsDataASSURE_DATE: TDateTimeField
      FieldName = 'ASSURE_DATE'
    end
    object dsDataDESCRIPT2: TStringField
      FieldName = 'DESCRIPT2'
      Size = 280
    end
    object dsDataSUBJECT_ID: TFloatField
      FieldName = 'SUBJECT_ID'
    end
    object dsDataPO_NAME: TStringField
      FieldName = 'PO_NAME'
      Size = 80
    end
    object dsDataPO_INN: TStringField
      FieldName = 'PO_INN'
      Size = 12
    end
    object dsDataPO_KPP: TStringField
      FieldName = 'PO_KPP'
      Size = 9
    end
    object dsDataS_NAME: TStringField
      FieldName = 'S_NAME'
      Size = 1500
    end
    object dsDataS_INN: TStringField
      FieldName = 'S_INN'
      Size = 12
    end
    object dsDataS_KPP: TStringField
      FieldName = 'S_KPP'
      Size = 10
    end
    object dsDataCONFIRMED_PAY_ID: TFloatField
      FieldName = 'CONFIRMED_PAY_ID'
    end
  end
end
