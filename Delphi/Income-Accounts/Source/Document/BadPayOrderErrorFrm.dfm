inherited BadPayOrderErrorForm: TBadPayOrderErrorForm
  Left = 412
  Top = 344
  Width = 517
  Height = 342
  Caption = 'BadPayOrderErrorForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 509
    Height = 308
    ClientRectBottom = 284
    ClientRectRight = 509
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 503
        Height = 253
        inherited edtName: TcxDBTextEdit
          Left = 97
          Width = 422
        end
        inherited edtDescript: TcxDBMemo
          Left = 97
          Top = 33
          DataBinding.DataField = 'NAME'
          Style.Color = clSilver
          Height = 8
          Width = 185
        end
        object cxDBTextEdit1: TcxDBTextEdit [2]
          Left = 97
          Top = 154
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 92
        end
        object cxDBTextEdit2: TcxDBTextEdit [3]
          Left = 236
          Top = 154
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 93
        end
        object cxDBTextEdit3: TcxDBTextEdit [4]
          Left = 97
          Top = 130
          DataBinding.DataField = 'K92'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 92
        end
        object cxDBDateEdit1: TcxDBDateEdit [5]
          Left = 236
          Top = 130
          DataBinding.DataField = 'K93'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 93
        end
        object cxDBMaskEdit1: TcxDBCurrencyEdit [6]
          Left = 97
          Top = 178
          RepositoryItem = DictData.repCurrencyItem
          DataBinding.DataField = 'K95'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 92
        end
        object cxDBTextEdit4: TcxDBTextEdit [7]
          Left = 236
          Top = 178
          DataBinding.DataField = 'K_VAL'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 93
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [8]
          Left = 97
          Top = 202
          DataBinding.DataField = 'PAYMENT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'PAYMENT_ID'
          DataBinding.TypeSysName = 'PaymentOrder'
          DataBinding.SearchFormClass = 'TPaymentOrderGridByDKForm'
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
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          TabOrder = 8
          OnBeforeAcceptObject = fdcObjectLinkEdit1BeforeAcceptObject
          Width = 279
        end
        object cxDBMaskEdit2: TcxDBCurrencyEdit [9]
          Left = 97
          Top = 226
          RepositoryItem = DictData.repCurrencyItem
          DataBinding.DataField = 'SUMMA'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 279
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavCenter
          end
          object lcGeneralGroup2: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralGroup3: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem3: TdxLayoutItem
                Caption = #1053#1086#1084#1077#1088
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBTextEdit3
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem4: TdxLayoutItem
                Caption = #1044#1072#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBDateEdit1
                ControlOptions.ShowBorder = False
              end
            end
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lcGeneralItem1: TdxLayoutItem
                Caption = #1048#1053#1053
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBTextEdit1
                ControlOptions.ShowBorder = False
              end
              object lcGeneralItem2: TdxLayoutItem
                Caption = #1050#1055#1055
                CaptionOptions.AlignHorz = taRightJustify
                Control = cxDBTextEdit2
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGeneralGroup4: TdxLayoutGroup
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem5: TdxLayoutItem
              Caption = #1057#1091#1084#1084#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBMaskEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem6: TdxLayoutItem
              Caption = #1042#1072#1083#1102#1090#1072
              CaptionOptions.AlignHorz = taRightJustify
              Control = cxDBTextEdit4
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem7: TdxLayoutItem
            Caption = #1055#1083#1072#1090'. '#1087#1086#1088#1091#1095#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem8: TdxLayoutItem
            Caption = #1057#1091#1084#1084#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = cxDBMaskEdit2
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 509
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 253
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 281
        Width = 509
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 506
        Height = 253
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 509
        Height = 284
        ClientRectBottom = 260
        ClientRectRight = 509
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
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -8
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
        Name = 'DK_PP_ID1'
        ParamType = ptUnknown
        AcceptedSources = []
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select o.*'
      '     ,d.ID as DK_PP_ID'
      '      ,INN'
      '      ,KPP'
      '      ,K92'
      '      ,K93'
      '      ,K94 summa'
      '      ,K95'
      '      ,K_VAL'
      '      ,p.name as payment_name'
      '      ,p.id as payment_id'
      '  from dbf_pp_plt_lst    d'
      '      ,fdc_Object_Lst o'
      '      ,fdc_payment_order_lst p'
      ' where o.id = :ID'
      '   and d.id = o.sysname'
      '   and p.id(+) = o.id  ')
    inherited dsDataNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataSHORTNAME: TStringField
      ReadOnly = True
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      ReadOnly = True
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      ReadOnly = True
      Size = 9
    end
    object dsDataK92: TStringField
      FieldName = 'K92'
      ReadOnly = True
      Size = 19
    end
    object dsDataK93: TDateTimeField
      FieldName = 'K93'
      ReadOnly = True
    end
    object dsDataSUMMA: TFloatField
      FieldName = 'SUMMA'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataK95: TFloatField
      FieldName = 'K95'
      ReadOnly = True
      DisplayFormat = ',0.00'
    end
    object dsDataK_VAL: TStringField
      FieldName = 'K_VAL'
      ReadOnly = True
      Size = 3
    end
    object dsDataPAYMENT_NAME: TStringField
      FieldName = 'PAYMENT_NAME'
      Size = 1500
    end
    object dsDataPAYMENT_ID: TFloatField
      FieldName = 'PAYMENT_ID'
    end
    object dsDataDK_PP_ID: TFloatField
      FieldName = 'DK_PP_ID'
      Required = True
    end
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  p_cdecl_loader_ex.executepayment(pdeclid => :decl_id,'
      '                                   pid => :dk_pp_id,'
      '                                   ppayorderid => :payment_id);'
      'end;')
    BeforeOpen = dsUpdateBeforeOpen
    ParamData = <
      item
        DataType = ftFloat
        Name = 'decl_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'dk_pp_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'payment_id'
        ParamType = ptUnknown
      end>
  end
end
