inherited PeriodicChargeForm: TPeriodicChargeForm
  Left = 353
  Top = 262
  Width = 469
  Height = 333
  Caption = 'PeriodicChargeForm'
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 461
    Height = 306
    ClientRectBottom = 282
    ClientRectRight = 461
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 455
        Height = 253
        inherited edtName: TcxDBTextEdit
          Left = 0
          Top = 0
          Anchors = [akRight, akBottom]
          TabOrder = 5
          Visible = False
          Width = 68
        end
        inherited edtDescript: TcxDBMemo
          Left = 0
          Top = 0
          Anchors = [akRight, akBottom]
          TabOrder = 6
          Visible = False
          Height = 17
          Width = 97
        end
        object edtSumma: TcxDBCurrencyEdit [2]
          Left = 143
          Top = 90
          DataBinding.DataField = 'MONTH_SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 3
          Width = 170
        end
        object edtPaymentName: TfdcObjectLinkEdit [3]
          Left = 143
          Top = 36
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
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 145
        end
        object cmbxedtCurrID: TfdcObjectLookupEdit [4]
          Left = 143
          Top = 117
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
          TabOrder = 4
          Width = 84
        end
        object cmbxPayType: TfdcObjectLookupEdit [5]
          Left = 143
          Top = 9
          DataBinding.DataField = 'PAY_TYPE_ID'
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
          Properties.OnChange = Modify
          Properties.OnEditValueChanged = cmbxPayTypePropertiesEditValueChanged
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 0
          Width = 178
        end
        object cmbxKBK: TfdcObjectLookupEdit [6]
          Left = 143
          Top = 63
          DataBinding.DataField = 'KBK_CODE_ID'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              Width = 160
              FieldName = 'code'
            end
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 350
              FieldName = 'name'
            end>
          Properties.ListSource = srcKBK
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 2
          Width = 178
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem4: TdxLayoutItem [0]
            AutoAligns = [aaVertical]
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cmbxPayType
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem [1]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Visible = False
            Control = edtPaymentName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [2]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lciKBK: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1050#1041#1050
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cmbxKBK
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem1: TdxLayoutItem
              Caption = #1052#1077#1089#1103#1095#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = edtSumma
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cmbxedtCurrID
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            AutoAligns = [aaVertical]
            AlignHorz = ahRight
            CaptionOptions.AlignVert = tavTop
            Visible = False
            Control = nil
          end
          inherited lciDescriptEdit: TdxLayoutItem
            AutoAligns = []
            AlignHorz = ahRight
            Visible = False
            Control = nil
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 461
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 253
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 279
        Width = 461
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 458
        Height = 253
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 461
        Height = 282
        ClientRectBottom = 258
        ClientRectRight = 461
        inherited tabFake: TcxTabSheet
          inherited lblFake: TLabel
            Width = 115
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 187
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 108
    Top = 187
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 220
    Top = 187
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 248
    Top = 187
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 164
    Top = 187
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 192
    Top = 187
  end
  inherited imglAction: TImageList
    Left = 52
    Top = 187
  end
  inherited imglLarge: TImageList
    Left = 80
    Top = 187
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
        FloatLeft = 281
        FloatTop = 289
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
    Left = 136
    Top = 187
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 24
    Top = 215
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_periodic_charge_Lst'
      ' where ID = :ID')
    OnNewRecord = dsDataNewRecord
    Left = 52
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object dsDataPAYMENT_NAME: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAYMENT_NAME'
      Size = 200
    end
    object dsDataMONTH_SUMMA: TFloatField
      DisplayLabel = #1052#1077#1089#1103#1095#1085#1072#1103' '#1089#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'MONTH_SUMMA'
      Required = True
    end
    object dsDataCURRENCY_ID: TIntegerField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CURRENCY_ID'
      Required = True
    end
    object dsDataDECL_ID: TIntegerField
      FieldName = 'DECL_ID'
    end
    object dsDataDECL_NO: TStringField
      FieldName = 'DECL_NO'
    end
    object dsDataPAY_TYPE_ID: TIntegerField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PAY_TYPE_ID'
      Required = True
    end
    object dsDataKBK_CODE_ID: TFloatField
      FieldName = 'KBK_CODE_ID'
    end
  end
  inherited srcData: TDataSource
    Left = 52
    Top = 243
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= p_custom_decl.AddPeriodicCharge(pdeclid => :decl_id,'
      '                                     ppaytypeid => :pay_type_id,'
      
        '                                     pmonthsumma => :month_summa' +
        ','
      
        '                                     pcurrencyid => :currency_id' +
        ','
      
        '                                     pkbkcodeid => :kbk_code_id)' +
        ';'
      'end;'
      '')
    Left = 80
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'month_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kbk_code_id'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  p_custom_decl.modifyperiodiccharge(pid => :id,'
      '                             ppaytypeid => :pay_type_id,'
      '                             pmonthsumma => :month_summa,'
      '                             pcurrencyid => :currency_id,'
      '                             pkbkcodeid => :kbk_code_id);'
      'end;')
    Left = 108
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pay_type_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'month_summa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'currency_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kbk_code_id'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 164
    Top = 243
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Session = MainData.Session
    Left = 248
    Top = 215
  end
  inherited dsUpdateState: TfdcQuery
    Session = MainData.Session
    Left = 192
    Top = 215
  end
  inherited srcState: TDataSource
    Left = 136
    Top = 243
  end
  inherited dsTransit: TfdcQuery
    Session = MainData.Session
    Left = 164
    Top = 215
  end
  inherited dsState: TfdcQuery
    Session = MainData.Session
    Left = 136
    Top = 215
  end
  inherited srcAccessLevel: TDataSource
    Left = 220
    Top = 243
  end
  inherited dsAccessLevel: TfdcQuery
    Session = MainData.Session
    Left = 220
    Top = 215
  end
  object dsCheckCurrency: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      
        'select max(currency_id) as INIT_CURRENCY_ID from fdc_periodic_ch' +
        'arge_lst where decl_id = :decl_id')
    Left = 299
    Top = 242
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'decl_id'
        ParamType = ptUnknown
      end>
    object dsCheckCurrencyINIT_CURRENCY_ID: TIntegerField
      FieldName = 'INIT_CURRENCY_ID'
    end
  end
  object dsKBK: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select'
      '  min(id) id, code, min(name) name'
      'from'
      '  fdc_kbk_dict_lst'
      'where'
      '  code in'
      '  (select t1.code'
      '     from fdc_kbk_dict_lst t1,'
      '            fdc_nsi_dict_lst t2'
      '  where t2.id = :PAY_TYPE_ID'
      '      and t1.code2 = t2.code)'
      'group by code')
    Left = 352
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PAY_TYPE_ID'
        ParamType = ptUnknown
      end>
  end
  object srcKBK: TDataSource
    DataSet = dsKBK
    Left = 352
    Top = 248
  end
end
