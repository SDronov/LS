inherited BankforCashForm: TBankforCashForm
  Left = 357
  Top = 236
  Width = 525
  Height = 390
  HelpContext = 34
  ActiveControl = cxTabSheet1
  Caption = 'BankforCashForm'
  PixelsPerInch = 115
  TextHeight = 16
  inherited pcMain: TcxPageControl
    Width = 517
    Height = 356
    ActivePage = cxTabSheet1
    ClientRectBottom = 330
    ClientRectRight = 517
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 511
        Height = 298
        inherited edtName: TcxDBTextEdit
          Left = 233
          Width = 521
        end
        inherited edtDescript: TcxDBMemo
          Left = 233
          Top = 143
          Height = 144
          TabOrder = 4
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit [2]
          Left = 233
          Top = 44
          Width = 149
          Height = 26
          DataBinding.DataField = 'BANK_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'BANK_ID'
          DataBinding.TypeSysName = 'Bank'
          DataBinding.SearchFormClass = 'TBankGridForm'
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
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object cxDBTextEdit1: TcxDBTextEdit [3]
          Left = 233
          Top = 110
          Width = 149
          Height = 26
          DataBinding.DataField = 'FILE_FORMAT_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object fdcObjectLookupEdit1: TfdcObjectLookupEdit [4]
          Left = 233
          Top = 77
          Width = 444
          Height = 26
          DataBinding.DataField = 'PAYMENT_TO_ORDER_RATIO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = DataSource1
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          StyleDisabled.StyleController = WebEditStyleController
          StyleFocused.StyleController = WebEditStyleController
          StyleHot.StyleController = WebEditStyleController
          TabOrder = 2
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            ShowBorder = False
            object lcGeneralItem2: TdxLayoutItem
              Caption = #1041#1072#1085#1082
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcObjectLinkEdit1
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem4: TdxLayoutItem
              Caption = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' "'#1087#1083#1072#1090#1077#1078#1080' - '#1082#1074#1080#1090#1072#1085#1094#1080#1080'"'
              CaptionOptions.AlignHorz = taRightJustify
              Control = fdcObjectLookupEdit1
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem3: TdxLayoutItem [2]
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1086#1088#1084#1072#1090#1072' '#1092#1072#1081#1083#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 517
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 298
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 327
        Width = 517
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 514
        Height = 298
      end
    end
    object cxTabSheet1: TcxTabSheet [1]
      Caption = #1050#1072#1089#1089#1099
      ImageIndex = 2
      OnShow = cxTabSheet1Show
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 517
        Height = 330
        ClientRectBottom = 304
        ClientRectRight = 517
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
        DataType = ftUnknown
        Name = 'BANKCASH_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'select *'
      '  from fdc_BankforCash_Lst'
      ' where ID = :ID')
    object dsDataBANK_NAME: TStringField
      DisplayLabel = #1041#1072#1085#1082
      FieldName = 'BANK_NAME'
      Required = True
      Size = 1500
    end
    object dsDataBIC: TStringField
      FieldName = 'BIC'
      Size = 10
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataBANK_ID: TFloatField
      FieldName = 'BANK_ID'
    end
    object dsDataPAYMENT_TO_ORDER_RATIO: TStringField
      DisplayLabel = #1057#1086#1086#1090#1085#1086#1096#1077#1085#1080#1077' "'#1087#1083#1072#1090#1077#1078#1080' - '#1082#1074#1080#1090#1072#1085#1094#1080#1080'"'
      FieldName = 'PAYMENT_TO_ORDER_RATIO'
      Required = True
      Size = 10
    end
    object dsDataFILE_FORMAT_CODE: TStringField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1092#1086#1088#1084#1072#1090#1072' '#1092#1072#1081#1083#1072
      FieldName = 'FILE_FORMAT_CODE'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_BankForCash_add('
      '    :BANK_ID,'
      '    :PAYMENT_TO_ORDER_RATIO,'
      '    :FILE_FORMAT_CODE);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYMENT_TO_ORDER_RATIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILE_FORMAT_CODE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_BankForCash_Upd('
      '    :ID,'
      '  :BANK_ID,'
      '  :PAYMENT_TO_ORDER_RATIO,'
      '  :FILE_FORMAT_CODE);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BANK_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PAYMENT_TO_ORDER_RATIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FILE_FORMAT_CODE'
        ParamType = ptUnknown
      end>
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F020000000B00000001000500434F44450033000000
      010005004E414D4500040000003154310024000000CEE4EDE020EFEBE0F2E5E6
      EAE0202D20EEE4E8ED20EAE0F1F1EEE2FBE920EEF0E4E5F0000400000031544E
      0027000000CEE4EDE020EFEBE0F2E5E6EAE0202D20ECEDEEE3EE20EAE0F1F1EE
      E2FBF520EEF0E4E5F0EEE200}
    SortOptions = []
    Left = 27
    Top = 202
    object dxMemData1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object dxMemData1NAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = dxMemData1
    Left = 27
    Top = 170
  end
end
