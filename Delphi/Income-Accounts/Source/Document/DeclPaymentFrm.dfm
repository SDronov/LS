inherited PaymentDeductionForm: TPaymentDeductionForm
  Width = 504
  Height = 388
  Caption = 'PaymentDeductionForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    Width = 496
    Height = 348
    ClientRectBottom = 320
    ClientRectRight = 496
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 490
        Height = 289
        inherited edtName: TcxDBTextEdit
          Left = 0
          Top = 0
          TabOrder = 9
          Visible = False
          Width = 553
        end
        inherited edtDescript: TcxDBMemo
          Left = 0
          Top = 0
          TabOrder = 8
          Visible = False
          Height = 25
          Width = 242
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 109
          Top = 69
          DataBinding.DataField = 'DOC_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAYMENT_ID'
          DataBinding.TypeSysName = 'PaymentOrder'
          DataBinding.SearchFormClass = 'TPaymentOrderGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 114
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [3]
          Left = 109
          Top = 168
          DataBinding.DataField = 'DOC_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 121
        end
        object cxDBTextEdit2: TcxDBTextEdit [4]
          Left = 109
          Top = 135
          DataBinding.DataField = 'CURR_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 175
        end
        object cxDBTextEdit3: TcxDBTextEdit [5]
          Left = 98
          Top = 251
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 376
        end
        object fdcObjectLinkEdit2: TfdcObjectLinkEdit [6]
          Left = 98
          Top = 218
          DataBinding.DataField = 'PAYMENT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAY_TYPE_ID'
          DataBinding.TypeSysName = 'PaymentType'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 6
          Width = 376
        end
        object edtPayer: TfdcObjectLinkEdit [7]
          Left = 109
          Top = 102
          DataBinding.DataField = 'PAYER_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAYER_ID'
          DataBinding.TypeSysName = 'Declarant'
          DataBinding.SearchFormClass = 'TDeclarantGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          Width = 299
        end
        object cxDBMaskEdit2: TcxDBMaskEdit [8]
          Left = 295
          Top = 168
          DataBinding.DataField = 'DOC_REST'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 121
        end
        object edtDeclNo: TfdcObjectLinkEdit [9]
          Left = 98
          Top = -4
          DataBinding.DataField = 'DECL_NO'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DECL_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 0
          Width = 376
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            CaptionOptions.AlignHorz = taLeftJustify
            ShowCaption = False
            Visible = False
            Control = nil
          end
          inherited lciDescriptEdit: TdxLayoutItem
            CaptionOptions.AlignHorz = taLeftJustify
            CaptionOptions.AlignVert = tavCenter
            ShowCaption = False
            Visible = False
            Control = nil
          end
          object lcGeneralItem2: TdxLayoutItem
            Caption = #1043#1058#1044
            Control = edtDeclNo
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup
            Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
            object lcGeneralItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1053#1086#1084#1077#1088
              Control = fdcObjectLinkEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem8: TdxLayoutItem
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
              Control = edtPayer
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem5: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1042#1072#1083#1102#1090#1072
              Control = cxDBTextEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem4: TdxLayoutItem
                Caption = #1057#1091#1084#1084#1072
                Control = cxDBMaskEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem3: TdxLayoutItem
                Caption = #1054#1089#1090#1072#1090#1086#1082
                Control = cxDBMaskEdit2
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralItem7: TdxLayoutItem
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            Control = fdcObjectLinkEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem6: TdxLayoutItem
            Caption = #1057#1091#1084#1084#1072
            Control = cxDBTextEdit3
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 496
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 289
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 317
        Width = 496
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 493
        Height = 289
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 496
        Height = 320
        ClientRectBottom = 292
        ClientRectRight = 496
        ClientRectTop = 0
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
    inherited actSave: TAction
      Visible = False
    end
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_decl_payment_lst'
      ' where ID = :ID')
    OnNewRecord = dsDataNewRecord
    inherited dsDataID: TFloatField
      ReadOnly = True
    end
    inherited dsDataNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataSHORTNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      ReadOnly = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      ReadOnly = True
    end
    inherited dsDataSTATE_ID: TFloatField
      ReadOnly = True
    end
    inherited dsDataSYSNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataDESCRIPT: TStringField
      ReadOnly = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      ReadOnly = True
    end
    inherited dsDataTYPENAME: TStringField
      ReadOnly = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataOBJECTKINDLIST: TStringField
      ReadOnly = True
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      ReadOnly = True
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
      ReadOnly = True
    end
    object dsDataDOC_NO: TStringField
      FieldName = 'DOC_NO'
      ReadOnly = True
      Size = 10
    end
    object dsDataDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      ReadOnly = True
    end
    object dsDataPAYER_INN: TStringField
      FieldName = 'PAYER_INN'
      ReadOnly = True
      Size = 12
    end
    object dsDataPAYER_NAME: TStringField
      FieldName = 'PAYER_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      ReadOnly = True
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      ReadOnly = True
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
      ReadOnly = True
    end
    object dsDataDOC_SUMMA: TFloatField
      FieldName = 'DOC_SUMMA'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataPAYER_ID: TFloatField
      FieldName = 'PAYER_ID'
      ReadOnly = True
    end
    object dsDataDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      ReadOnly = True
      Size = 1500
    end
    object dsDataDOC_REST: TFloatField
      FieldName = 'DOC_REST'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      ReadOnly = True
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= p_doc_charge.addpayment(pdeclid => :decl_id,'
      '                             ppaytypeid => :pay_type_id,'
      '                             ppaymentorderid => :payment_id,'
      '                             psumma => :summa);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'PAY_TYPE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'PAYMENT_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        Size = 8
      end>
  end
end
