inherited NsiCurrRateForm: TNsiCurrRateForm
  Left = 601
  Top = 380
  Height = 386
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 348
    ClientRectBottom = 324
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 293
        inherited edtName: TcxDBTextEdit
          Left = 98
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 98
          Top = 34
          Height = 6
          Width = 267
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 98
          Top = 115
          DataBinding.DataField = 'CURRENCYCODE'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
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
          TabOrder = 2
          Width = 248
        end
        object fdcObjectLinkEdit2: TfdcObjectLinkEdit [3]
          Left = 98
          Top = 140
          DataBinding.DataField = 'CURRENCYNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
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
          TabOrder = 3
          Width = 248
        end
        object edtMult: TcxDBMaskEdit [4]
          Left = 98
          Top = 190
          DataBinding.DataField = 'MULT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 5
          Width = 248
        end
        object edtChangeRate: TcxDBCurrencyEdit [5]
          Left = 98
          Top = 215
          DataBinding.DataField = 'CHANGE_RATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DecimalPlaces = 4
          Properties.DisplayFormat = ',0.0000;-,0.0000'
          Properties.EditFormat = ',0.0000;-,0.0000'
          Properties.MaxValue = 9999999.999900000000000000
          Properties.MinValue = 0.010000000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 248
        end
        object edtBackRate: TcxDBCurrencyEdit [6]
          Left = 98
          Top = 240
          DataBinding.DataField = 'BACK_RATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.AssignedValues.MinValue = True
          Properties.DecimalPlaces = 4
          Properties.DisplayFormat = ',0.0000;-,0.0000'
          Properties.EditFormat = ',0.0000;-,0.0000'
          Properties.MaxValue = 9999999.999900000000000000
          Properties.UseDisplayFormatWhenEditing = True
          Properties.UseThousandSeparator = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Width = 248
        end
        object edtRateDate: TcxDBDateEdit [7]
          Left = 98
          Top = 265
          DataBinding.DataField = 'RATE_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 248
        end
        object cxDBTextEdit1: TcxDBTextEdit [8]
          Left = 98
          Top = 165
          DataBinding.DataField = 'BUK'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 248
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
          object lcGeneralItem1: TdxLayoutItem
            Caption = #1050#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = fdcObjectLinkEdit2
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem7: TdxLayoutItem
            Caption = #1041#1091#1082#1074'. '#1082#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem
            Caption = #1050#1088#1072#1090#1085#1086#1089#1090#1100' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtMult
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem4: TdxLayoutItem
            Caption = #1050#1091#1088#1089' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtChangeRate
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem5: TdxLayoutItem
            Caption = #1054#1073#1088#1072#1090#1085#1099#1081' '#1082#1091#1088#1089' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtBackRate
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem6: TdxLayoutItem
            Caption = #1044#1072#1090#1072' *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtRateDate
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 293
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 321
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 293
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 324
        ClientRectBottom = 300
      end
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -9
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
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CURR_ID'
        ParamType = ptUnknown
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_nsi_curr_rate_lst'
      ' where ID = :ID')
    AfterInsert = dsDataAfterInsert
    OnNewRecord = dsDataNewRecord
    object dsDataMULT: TIntegerField
      DefaultExpression = '1'
      DisplayLabel = #1050#1088#1072#1090#1085#1086#1089#1090#1100
      FieldName = 'MULT'
      Required = True
    end
    object dsDataCHANGE_RATE: TFloatField
      DisplayLabel = #1050#1091#1088#1089
      FieldName = 'CHANGE_RATE'
      Required = True
      DisplayFormat = '0.0000'
    end
    object dsDataBACK_RATE: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #1054#1073#1088#1072#1090#1085#1099#1081' '#1082#1091#1088#1089
      FieldName = 'BACK_RATE'
      Required = True
      DisplayFormat = '0.0000'
    end
    object dsDataRATE_DATE: TDateTimeField
      DefaultExpression = '$$DATE$$'
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'RATE_DATE'
      Required = True
    end
    object dsDataCURRENCYNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'CURRENCYNAME'
      Required = True
      Size = 1500
    end
    object dsDataCURRENCYCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CURRENCYCODE'
      Required = True
      Size = 3
    end
    object dsDataBUK: TStringField
      FieldName = 'BUK'
      Size = 3
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_nsicurrency_rate_add('
      '  :OWNER_OBJECT_ID,'
      '  :MULT,'
      '  :CHANGE_RATE,'
      '  :BACK_RATE,'
      '  :RATE_DATE,'
      '  :BUK'
      ');'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CHANGE_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BACK_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BUK'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_nsicurrency_rate_upd(:ID,'
      '  :MULT,'
      '  :CHANGE_RATE,'
      '  :BACK_RATE,'
      '  :RATE_DATE,'
      ' :BUK'
      ');'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'MULT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CHANGE_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'BACK_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BUK'
        ParamType = ptUnknown
      end>
  end
end
