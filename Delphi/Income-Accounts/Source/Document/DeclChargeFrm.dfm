inherited DeclChargeForm: TDeclChargeForm
  ActiveControl = edtDeclNo
  Caption = 'DeclChargeForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    ClientRectBottom = 280
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 0
          Top = 0
          TabOrder = 4
          Width = 462
        end
        inherited edtDescript: TcxDBMemo
          Left = 0
          Top = 0
          TabOrder = 5
          Height = 12
          Width = 462
        end
        object edtPaymentName: TfdcObjectLinkEdit [2]
          Left = 98
          Top = 52
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
          TabOrder = 1
          Width = 376
        end
        object edtSumma: TcxDBMaskEdit [3]
          Left = 98
          Top = 85
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 88
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [4]
          Left = 364
          Top = 85
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
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 110
        end
        object edtDeclNo: TfdcObjectLinkEdit [5]
          Left = 98
          Top = 19
          DataBinding.DataField = 'DECL_NO'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'DECL_ID'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
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
            Caption = ''
            Visible = False
            Control = nil
          end
          object lcGeneralItem4: TdxLayoutItem [1]
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtDeclNo
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem1: TdxLayoutItem [2]
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtPaymentName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem3: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahRight
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cmbxedtCurrID
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Caption = ''
            Visible = False
            Control = nil
          end
        end
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 252
        ClientRectRight = 492
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    Top = 43
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
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 268
    Top = 67
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Left = 396
    Top = 67
  end
  inherited WebEditStyleController: TcxEditStyleController
    Left = 424
    Top = 59
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 340
    Top = 67
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Left = 368
    Top = 67
  end
  inherited imglAction: TImageList
    Top = 51
  end
  inherited imglLarge: TImageList
    Top = 59
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
    Top = 67
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_decl_charge_hist_lst'
      ' where '
      'ID = :ID')
    OnNewRecord = dsDataNewRecord
    inherited dsDataNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSHORTNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOBJECT_TYPE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataACCESSLEVEL: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSTATE_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSYSNAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataDESCRIPT: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPENAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTYPESYSNAME: TStringField
      Size = 14
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
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
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
      Size = 1500
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= p_doc_charge.AddCharge(pdeclid => :decl_id,'
      '                                     ppaytypeid => :pay_type_id,'
      '                                     psumma => :summa,'
      
        '                                     pcurrencyid => :currency_id' +
        ');'
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
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  p_doc_charge.modifycharge(pid => :id,'
      '                             psumma => :summa,'
      '                             pcurrencyid => :currency_id);'
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
