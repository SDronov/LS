inherited AddLChargeForm: TAddLChargeForm
  Left = 475
  Top = 506
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' "'#1089#1090#1072#1088#1086#1075#1086'" '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 195
  ClientWidth = 457
  OnActivate = FormActivate
  PixelsPerInch = 120
  TextHeight = 17
  inherited dxLayoutControl1: TdxLayoutControl
    Width = 457
    Height = 195
    inherited btnCancel: TcxButton
      Left = 350
      Top = 156
      TabOrder = 6
    end
    inherited btnOk: TcxButton
      Left = 245
      Top = 156
      ModalResult = 0
      TabOrder = 5
    end
    object cmbxPayType: TfdcObjectLookupEdit [2]
      Left = 139
      Top = 37
      DataBinding.DataField = 'PAYTYPE_ID'
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
      Properties.ListSource = DictData.srcPayTypes
      Properties.ReadOnly = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 1
      Width = 110
    end
    object cmbxedtCurrID: TfdcObjectLookupEdit [3]
      Left = 139
      Top = 65
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
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      Width = 110
    end
    object edtSumma: TcxDBCurrencyEdit [4]
      Left = 139
      Top = 121
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.UseLeftAlignmentOnEditing = False
      Properties.UseThousandSeparator = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 4
      Width = 305
    end
    object edtPaymentOrder: TfdcObjectLinkEdit [5]
      Left = 139
      Top = 93
      DataBinding.DataField = 'PO_NAME'
      DataBinding.DataSource = srcData
      DataBinding.DataKeyField = 'PO_ID'
      DataBinding.TypeSysName = 'PaymentOrder'
      DataBinding.SearchFormClass = 'TPaymentOrderGridForm'
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      Style.ButtonStyle = btsFlat
      TabOrder = 3
      Width = 286
    end
    object cxDBMaskEdit1: TcxDBMaskEdit [6]
      Left = 139
      Top = 9
      DataBinding.DataField = 'GOODS_CODE'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = WebEditStyleController
      TabOrder = 0
      Width = 309
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item5: TdxLayoutItem [0]
        Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
        Control = cxDBMaskEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item1: TdxLayoutItem [1]
        Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Control = cmbxPayType
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem [2]
        Caption = #1042#1072#1083#1102#1090#1072
        Control = cmbxedtCurrID
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [3]
        Caption = #1055#1083#1072#1090#1077#1078'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
        Control = edtPaymentOrder
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [4]
        Caption = #1057#1091#1084#1084#1072
        Control = edtSumma
        ControlOptions.ShowBorder = False
      end
    end
  end
  object dsData: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 48
    Top = 152
    object dsDataCURRENCY_ID: TFloatField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_ID'
      Required = True
      OnValidate = dsDataCURRENCY_IDValidate
    end
    object dsDataPO_NAME: TStringField
      DisplayLabel = #1055#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      FieldName = 'PO_NAME'
      Size = 300
    end
    object dsDataPAYTYPE_ID: TFloatField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYTYPE_ID'
      Required = True
    end
    object dsDataPO_ID: TFloatField
      DisplayLabel = #1055#1083#1072#1090#1077#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      FieldName = 'PO_ID'
      Required = True
    end
    object dsDataSUMMA: TCurrencyField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataGOODS_CODE: TStringField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'GOODS_CODE'
      Required = True
      Size = 30
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 104
    Top = 152
  end
  object Params: TfdcParamsHolder
    Params = <
      item
        DataType = ftFloat
        Name = 'PAYER_ID'
        ParamType = ptInput
        SourceField = dsDataCURRENCY_ID
      end>
    Left = 88
    Top = 88
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 8
    Top = 160
    object sqlAddLPay: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_add_legacy_deduction(pDeclId => :decl_id,'
        '           pGoodsCode => :goods_code,'
        '           pPayTypeId => :paytype_id,'
        '           pPOId => :po_id, pSumma => :summa);'
        '  commit;'
        'end;')
      DataSet = dsData
    end
  end
end
