inherited GoodsChargeCorrectForm: TGoodsChargeCorrectForm
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 234
  PixelsPerInch = 96
  TextHeight = 13
  inherited dxLayoutControl1: TdxLayoutControl
    Height = 234
    inherited Bevel1: TBevel
      Top = 194
      Width = 482
    end
    inherited btnCancel: TcxButton
      Top = 202
      TabOrder = 5
    end
    inherited btnOk: TcxButton
      Top = 202
      TabOrder = 4
    end
    object edtDate: TcxDateEdit [3]
      Left = 90
      Top = 9
      ParentFont = False
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 0
      Width = 341
    end
    object edtDesc: TcxMemo [4]
      Left = 90
      Top = 90
      ParentFont = False
      Properties.ScrollBars = ssVertical
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 3
      Height = 89
      Width = 185
    end
    object edtDelta: TcxDBCurrencyEdit [5]
      Left = 90
      Top = 63
      DataBinding.DataField = 'DELTA'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.MinValue = -920000000000000.000000000000000000
      Properties.OnChange = edtDeltaPropertiesChange
      Properties.OnValidate = edtDeltaPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 2
      Width = 328
    end
    object edtSumma: TcxDBCurrencyEdit [6]
      Left = 90
      Top = 36
      DataBinding.DataField = 'SUMMA'
      DataBinding.DataSource = srcData
      ParentFont = False
      Properties.OnChange = edtSummaPropertiesChange
      Properties.OnValidate = edtSummaPropertiesValidate
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.StyleController = OfficeEditStyleController
      TabOrder = 1
      Width = 328
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      object dxLayoutControl1Item1: TdxLayoutItem [0]
        Caption = #1044#1072#1090#1072
        Control = edtDate
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item4: TdxLayoutItem [1]
        Caption = #1057#1091#1084#1084#1072
        Control = edtSumma
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item3: TdxLayoutItem [2]
        Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
        Control = edtDelta
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item5: TdxLayoutItem [3]
        Caption = #1055#1088#1080#1095#1080#1085#1072
        Control = edtDesc
        ControlOptions.ShowBorder = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 240
    Top = 95
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 268
    Top = 95
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 352
    Top = 95
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 380
    Top = 95
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 296
    Top = 95
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 324
    Top = 95
  end
  object dsData: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select gc.*, 0.0 as delta, summa as old_summa'
      'from fdc_goods_charge_lst gc'
      'where id = :ID')
    Left = 240
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataSUMMA: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUMMA'
      Required = True
    end
    object dsDataDELTA: TFloatField
      FieldName = 'DELTA'
    end
    object dsDataOLD_SUMMA: TFloatField
      FieldName = 'OLD_SUMMA'
    end
    object dsDataDECL_GOODS_ID: TFloatField
      FieldName = 'DECL_GOODS_ID'
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
    end
    object dsDataPAY_MODE_ID: TFloatField
      FieldName = 'PAY_MODE_ID'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
  end
  object srcData: TDataSource
    DataSet = dsData
    Left = 272
    Top = 136
  end
  object QueryList1: TQueryList
    Session = MainData.Session
    Left = 304
    Top = 136
    object sqlModifyCharge: TsqlOp
      SQL.Strings = (
        'begin'
        '  fdc_modify_goods_charge(pDeclGoodsId => :decl_goods_id,'
        '                          pPayTypeId   => :pay_type_id,'
        '                          pPayModeId   => :pay_mode_id,'
        '                          pCurrencyId  => :currency_id,'
        '                          pSumma       => :delta,'
        '                          pChangeDesc  => :change_desc,'
        '                          pChangeDate  => :change_date);'
        'end;')
      DataSet = dsData
    end
  end
end
