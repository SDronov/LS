inherited GoodsChargeForm: TGoodsChargeForm
  Height = 284
  Caption = 'GoodsChargeForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    Height = 244
    ClientRectBottom = 216
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 185
        inherited edtName: TcxDBTextEdit
          Left = 122
        end
        inherited edtDescript: TcxDBMemo
          Left = 122
          Height = 29
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 122
          Top = 81
          Width = 352
          Height = 26
          DataBinding.DataField = 'PAY_TYPE_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAY_TYPE_ID'
          DataBinding.TypeSysName = 'PaymentType'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        object fdcObjectLinkEdit2: TfdcObjectLinkEdit [3]
          Left = 122
          Top = 114
          Width = 352
          Height = 26
          DataBinding.DataField = 'PAY_MODE_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAY_MODE_ID'
          DataBinding.TypeSysName = 'PaymentMode'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object cxDBMaskEdit1: TcxDBMaskEdit [4]
          Left = 122
          Top = 147
          Width = 121
          Height = 26
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 4
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [5]
          Left = 364
          Top = 147
          Width = 110
          Height = 26
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
          Style.StyleController = WebEditStyleController
          TabOrder = 5
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
          object lcGeneralItem1: TdxLayoutItem
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem
            Caption = #1057#1087#1086#1089#1086#1073' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem3: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBMaskEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem4: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxedtCurrID
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 185
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 213
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 185
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 216
        ClientRectBottom = 188
        ClientRectRight = 492
        ClientRectTop = 0
      end
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
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      '  from fdc_Goods_Charge_Lst'
      ' where ID = :ID')
    OnNewRecord = dsDataNewRecord
    object dsDataDECL_GOODS_ID: TFloatField
      FieldName = 'DECL_GOODS_ID'
      Visible = False
    end
    object dsDataPAY_TYPE_ID: TFloatField
      FieldName = 'PAY_TYPE_ID'
      Visible = False
    end
    object dsDataPAY_TYPE_NAME: TStringField
      FieldName = 'PAY_TYPE_NAME'
      Size = 1500
    end
    object dsDataPAY_TYPE_CODE: TStringField
      FieldName = 'PAY_TYPE_CODE'
      Size = 1500
    end
    object dsDataPAY_MODE_ID: TFloatField
      FieldName = 'PAY_MODE_ID'
      Visible = False
    end
    object dsDataPAY_MODE_NAME: TStringField
      FieldName = 'PAY_MODE_NAME'
      Size = 1500
    end
    object dsDataPAY_MODE_CODE: TStringField
      FieldName = 'PAY_MODE_CODE'
      Size = 1500
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      Visible = False
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
      Visible = False
    end
    object dsDataCURRENCY_NAME: TStringField
      FieldName = 'CURRENCY_NAME'
      Size = 1500
    end
    object dsDataCURRENCY_CODE: TStringField
      FieldName = 'CURRENCY_CODE'
      Size = 3
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      
        '    :ID ::= p_doc_charge.addgoodscharge(pdeclgoodsid => :DECL_G' +
        'OODS_ID,'
      
        '                                          ppaytypeid => :pay_typ' +
        'e_id,'
      
        '                                          ppaymodeid => :pay_mod' +
        'e_id,'
      '                                          psumma => :summa,'
      
        '                                          pcurrencyid => :curren' +
        'cy_id);'
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
        Name = 'DECL_GOODS_ID'
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
        Name = 'PAY_MODE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '   p_doc_charge.modifygoodscharge(pid => :ID,'
      
        '                                          ppaytypeid => :pay_typ' +
        'e_id,'
      
        '                                          ppaymodeid => :pay_mod' +
        'e_id,'
      '                                          psumma => :summa,'
      
        '                                          pcurrencyid => :curren' +
        'cy_id);'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
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
        Name = 'PAY_MODE_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'SUMMA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftFloat
        Name = 'CURRENCY_ID'
        ParamType = ptUnknown
        Size = 8
      end>
  end
end
