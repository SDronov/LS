inherited AddressForm: TAddressForm
  Left = 319
  Top = 204
  Width = 530
  Height = 251
  Caption = #1040#1076#1088#1077#1089
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 522
    Height = 217
    ClientRectBottom = 194
    ClientRectRight = 522
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 516
        Height = 163
        inherited edtName: TcxDBTextEdit
          Left = 81
          Width = 21
          Enabled = False
        end
        inherited edtDescript: TcxDBMemo
          Left = 81
          Top = 128
          Height = 26
          TabOrder = 4
        end
        object edtOwnerObjectID: TfdcObjectLinkEdit [2]
          Left = 81
          Top = 36
          Width = 121
          Height = 21
          DataBinding.DataField = 'OWNERNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'OWNER_OBJECT_ID'
          DataBinding.TypeSysName = 'Object'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
              Visible = False
            end>
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          AcceptObjects = False
        end
        object edtAddress: TcxDBMemo [3]
          Left = 81
          Top = 90
          Width = 447
          Height = 32
          DataBinding.DataField = 'NAME'
          DataBinding.DataSource = srcData
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object cmbxCountryDictID: TcxDBLookupComboBox [4]
          Left = 81
          Top = 63
          Width = 145
          Height = 21
          DataBinding.DataField = 'COUNTRY_DICT_ID'
          DataBinding.DataSource = srcData
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1050#1086#1076
              Width = 50
              FieldName = 'CODE'
            end
            item
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 250
              FieldName = 'NAME'
            end>
          Properties.ListFieldIndex = 1
          Properties.ListSource = srcDictCnt
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Enabled = False
            Visible = False
          end
          object lcGeneralItem1: TdxLayoutItem [1]
            Caption = #1055#1088#1080#1085#1072#1076#1083#1077#1078#1080#1090
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtOwnerObjectID
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [2]
            Caption = #1057#1090#1088#1072#1085#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxCountryDictID
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem3: TdxLayoutItem [3]
            Caption = #1040#1076#1088#1077#1089' *'
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtAddress
            ControlOptions.ShowBorder = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 522
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 163
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 191
        Width = 522
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 519
        Height = 163
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 522
        Height = 194
        ClientRectBottom = 171
        ClientRectRight = 522
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
        DataType = ftFloat
        Name = 'OMasterID'
        ParamType = ptUnknown
        SourceField = dsDataOWNER_OBJECT_ID
      end
      item
        DataType = ftString
        Name = 'OMasterName'
        ParamType = ptUnknown
        SourceField = dsDataOWNERNAME
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Address_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_ADDRESS_LST'
    object dsDataOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDataCOUNTRY_DICT_ID: TFloatField
      FieldName = 'COUNTRY_DICT_ID'
    end
    object dsDataCOUNTRYCODE: TStringField
      FieldName = 'COUNTRYCODE'
      Size = 1500
    end
    object dsDataCOUNTRYNAME: TStringField
      FieldName = 'COUNTRYNAME'
      Size = 1500
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_Address_Add('
      '    :TYPESYSNAME,'
      '    :NAME,'
      '    :OWNER_OBJECT_ID,'
      '    :COUNTRY_DICT_ID,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_ADDRESS_ADD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'OWNER_OBJECT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COUNTRY_DICT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_Address_Upd('
      '    :ID,'
      '    :NAME,'
      '    :COUNTRY_DICT_ID,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_ADDRESS_UPD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COUNTRY_DICT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object dsDictCnt: TfdcQuery
    Session = MainData.Session
    DataSource = srcData
    ReadOnly = False
    SQL.Strings = (
      'select D.ID,'
      '          D.OwnerName,'
      '          D.Name,'
      '          D.Code,'
      '          D.Code2          '
      '  from  fdc_Dict_Lst D '
      ' where D.TypeSysName = '#39'DictCountry'#39
      '   order by D.Name'
      '   ')
    SourceServerObject = 'FDC_DICT_LST'
    Left = 444
    Top = 127
    object dsDictCntID: TFloatField
      FieldName = 'ID'
    end
    object dsDictCntName: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDictCntOWNERNAME: TStringField
      FieldName = 'OWNERNAME'
      Size = 1500
    end
    object dsDictCntCODE: TStringField
      FieldName = 'CODE'
      Size = 1500
    end
    object dsDictCntCODE2: TStringField
      FieldName = 'CODE2'
      Size = 1500
    end
  end
  object srcDictCnt: TDataSource
    DataSet = dsDictCnt
    Left = 444
    Top = 155
  end
end
