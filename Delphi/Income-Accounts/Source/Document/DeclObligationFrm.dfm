inherited DeclObligationForm: TDeclObligationForm
  Caption = 'DeclObligationForm'
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
          Top = -16
          Width = 462
          TabOrder = 3
        end
        inherited edtDescript: TcxDBMemo
          Left = 0
          Top = -8
          Width = 462
          Height = 12
          TabOrder = 4
        end
        object edtPaymentName: TfdcObjectLinkEdit [2]
          Left = 98
          Top = 19
          Width = 376
          Height = 21
          DataBinding.DataField = 'PAYMENT_NAME'
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
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 0
        end
        object edtSumma: TcxDBMaskEdit [3]
          Left = 98
          Top = 47
          Width = 376
          Height = 21
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object edtCurrName: TfdcObjectLinkEdit [4]
          Left = 98
          Top = 82
          Width = 376
          Height = 21
          DataBinding.DataField = 'CURR_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CURRENCY_ID'
          DataBinding.TypeSysName = 'NSICurrency'
          DataBinding.SearchFormClass = 'TNSICurrencyGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Caption = ''
            Visible = False
            Control = nil
          end
          object lcGeneralItem1: TdxLayoutItem [1]
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtPaymentName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [2]
            Caption = #1057#1091#1084#1084#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSumma
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Caption = ''
            Visible = False
            Control = nil
          end
          object lcGeneralItem3: TdxLayoutItem
            Caption = #1042#1072#1083#1102#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCurrName
            ControlOptions.ShowBorder = False
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
      '  from fdc_cdecl_obligation_lst'
      ' where '
      'ID = :ID')
    OnNewRecord = dsDataNewRecord
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
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
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      DisplayFormat = '0.00'
    end
    object dsDataCURRENCY_ID: TFloatField
      FieldName = 'CURRENCY_ID'
    end
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataPAYMENT_CODE: TStringField
      FieldName = 'PAYMENT_CODE'
      Size = 1500
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 3
    end
    object dsDataCURR_NAME: TStringField
      FieldName = 'CURR_NAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '/*'
      '  ::ID ::= fdc_Object_Add('
      '    ::TYPESYSNAME,'
      '    ::NAME,'
      '    ::ACCESSLEVEL,'
      '    ::OWNER_OBJECT_ID,'
      '    ::SYSNAME,'
      '    ::SHORTNAME,'
      '    ::DESCRIPT);'
      '*/'
      'select fdc_object_key_sq.nextval into :id from dual;'
      'insert into fdc_decl_obligation'
      '  (id, pay_type_id, summa, currency_id, decl_id)'
      'values'
      '  (:id, :pay_type_id, :summa, :currency_id, :decl_id);'
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
        Name = 'id'
        ParamType = ptUnknown
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
      end
      item
        DataType = ftFloat
        Name = 'DECL_ID'
        ParamType = ptUnknown
        Size = 8
      end>
  end
end
