inherited PersonForm: TPersonForm
  Left = 529
  Top = 238
  Width = 845
  Height = 597
  Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1086#1077' '#1083#1080#1094#1086
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 829
    Height = 559
    ActivePage = tabChecks
    ClientRectBottom = 535
    ClientRectRight = 829
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 47
          Height = 17
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 829
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 504
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 532
        Width = 829
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 826
        Height = 504
      end
      inherited lcMain: TdxLayoutControl
        Width = 823
        Height = 504
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 105
          Width = 449
        end
        inherited edtOKPO: TcxDBMaskEdit
          Width = 142
        end
        inherited edtINN: TcxDBMaskEdit
          Top = 41
          Width = 141
        end
        inherited edtOGRN: TcxDBMaskEdit
          Width = 63
        end
        inherited edtAddress: TcxDBTextEdit
          Top = 137
          Width = 340
        end
        inherited edtPhone: TcxDBTextEdit
          Top = 169
        end
        inherited edtFax: TcxDBTextEdit
          Top = 169
          Width = 203
        end
        inherited edtTelex: TcxDBTextEdit
          Top = 201
        end
        inherited edtSOATO: TcxDBMaskEdit
          Top = 41
          Width = 104
        end
        inherited edtTeletype: TcxDBTextEdit
          Top = 201
        end
        inherited edtKPP: TcxDBMaskEdit
          Top = 73
        end
        inherited edtTeleGraph: TcxDBTextEdit
          Top = 201
        end
        object edtLastName: TcxDBTextEdit [12]
          Left = 83
          Top = 264
          DataBinding.DataField = 'LAST_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 15
          Width = 570
        end
        object edtFirstName: TcxDBTextEdit [13]
          Left = 83
          Top = 296
          DataBinding.DataField = 'FIRST_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 16
          Width = 257
        end
        object edtMiddleName: TcxDBTextEdit [14]
          Left = 602
          Top = 296
          DataBinding.DataField = 'MIDDLE_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 17
          Width = 200
        end
        object cmbxCountryCode: TfdcObjectLookupEdit [15]
          Left = 83
          Top = 328
          DataBinding.DataField = 'COUNTRY_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsEditList
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = DictData.srcCountryCode
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 18
          Width = 200
        end
        object edtDocType: TcxDBTextEdit [16]
          Left = 83
          Top = 360
          DataBinding.DataField = 'DOC_TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 19
          Width = 580
        end
        object cmbxPassportType: TfdcObjectLookupEdit [17]
          Left = 83
          Top = 392
          DataBinding.DataField = 'DOC_TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsEditList
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'CODE'
          Properties.ListColumns = <
            item
              FieldName = 'CODE'
            end
            item
              FieldName = 'Name'
            end>
          Properties.ListSource = DictData.srcPassportType
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 20
          Width = 169
        end
        object edtSerNo: TcxDBTextEdit [18]
          Left = 319
          Top = 392
          DataBinding.DataField = 'SER_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 21
          Width = 277
        end
        object edtDocNo: TcxDBTextEdit [19]
          Left = 635
          Top = 392
          DataBinding.DataField = 'DOC_NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 22
          Width = 150
        end
        object edtIssuedBy: TcxDBTextEdit [20]
          Left = 83
          Top = 424
          DataBinding.DataField = 'ISSUED_BY'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 23
          Width = 384
        end
        object edtIssuedDate: TcxDBDateEdit [21]
          Left = 543
          Top = 424
          DataBinding.DataField = 'ISSUED_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 24
          Width = 200
        end
        object edtPRIVATEOWNER: TcxDBCheckBox [22]
          Left = 21
          Top = 456
          Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1087#1088#1077#1076#1087#1088#1080#1085#1080#1084#1072#1090#1077#1083#1100
          DataBinding.DataField = 'PRIVATE_OWNER'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 25
          Width = 121
        end
        inherited dxLayoutGroup3s: TdxLayoutGroup
          inherited dxLayoutGroup2s: TdxLayoutGroup
            inherited lcMainGroup1s: TdxLayoutGroup
              inherited lciNames: TdxLayoutItem
                AutoAligns = []
              end
              inherited lcGeneralItem4: TdxLayoutItem
                AutoAligns = []
              end
              object lcMainGroup1: TdxLayoutGroup
                Caption = #1060#1080#1079'. '#1083#1080#1094#1086
                object lcMainItem1: TdxLayoutItem
                  AutoAligns = [aaVertical]
                  AlignHorz = ahClient
                  Caption = #1060#1072#1084#1080#1083#1080#1103
                  Control = edtLastName
                  ControlOptions.ShowBorder = False
                end
                object lcMainGroup3: TdxLayoutGroup
                  ShowCaption = False
                  Hidden = True
                  ShowBorder = False
                  object lcMainGroup2: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    LayoutDirection = ldHorizontal
                    ShowBorder = False
                    object lcMainItem2: TdxLayoutItem
                      AutoAligns = [aaVertical]
                      AlignHorz = ahClient
                      Caption = #1048#1084#1103
                      Control = edtFirstName
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainItem3: TdxLayoutItem
                      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                      Control = edtMiddleName
                      ControlOptions.ShowBorder = False
                    end
                  end
                  object lcMainItem4: TdxLayoutItem
                    AutoAligns = [aaVertical]
                    AlignHorz = ahClient
                    Caption = #1050#1086#1076' '#1089#1090#1088#1072#1085#1099
                    Control = cmbxCountryCode
                    ControlOptions.ShowBorder = False
                  end
                  object lcMainGroup4: TdxLayoutGroup
                    ShowCaption = False
                    Hidden = True
                    ShowBorder = False
                    object lcMainItem5: TdxLayoutItem
                      AutoAligns = [aaVertical]
                      AlignHorz = ahClient
                      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
                      Control = edtDocType
                      ControlOptions.ShowBorder = False
                    end
                    object lcMainGroup5: TdxLayoutGroup
                      ShowCaption = False
                      Hidden = True
                      ShowBorder = False
                      object lcMainGroup6: TdxLayoutGroup
                        ShowCaption = False
                        Hidden = True
                        LayoutDirection = ldHorizontal
                        ShowBorder = False
                        object lcMainItem6: TdxLayoutItem
                          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
                          Control = cmbxPassportType
                          ControlOptions.ShowBorder = False
                        end
                        object lcMainItem7: TdxLayoutItem
                          Caption = #1057#1077#1088#1080#1103
                          Control = edtSerNo
                          ControlOptions.ShowBorder = False
                        end
                        object lcMainItem8: TdxLayoutItem
                          AutoAligns = [aaVertical]
                          AlignHorz = ahClient
                          Caption = #1053#1086#1084#1077#1088
                          Control = edtDocNo
                          ControlOptions.ShowBorder = False
                        end
                      end
                      object lcMainGroup7: TdxLayoutGroup
                        ShowCaption = False
                        Hidden = True
                        ShowBorder = False
                        object lcMainGroup8: TdxLayoutGroup
                          ShowCaption = False
                          Hidden = True
                          LayoutDirection = ldHorizontal
                          ShowBorder = False
                          object lcMainItem9: TdxLayoutItem
                            Caption = #1042#1099#1076#1072#1085
                            Control = edtIssuedBy
                            ControlOptions.ShowBorder = False
                          end
                          object lcMainItem10: TdxLayoutItem
                            AutoAligns = [aaVertical]
                            AlignHorz = ahClient
                            Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
                            Control = edtIssuedDate
                            ControlOptions.ShowBorder = False
                          end
                        end
                        object lcMainItem11: TdxLayoutItem
                          Tag = 13
                          Caption = 'cxDBCheckBox1'
                          ShowCaption = False
                          Control = edtPRIVATEOWNER
                          ControlOptions.ShowBorder = False
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabDocList: TcxTabSheet
      inherited pcDocList: TcxPageControl
        Width = 829
        Height = 535
        ClientRectBottom = 531
        ClientRectRight = 825
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 829
        Height = 535
        ClientRectBottom = 511
        ClientRectRight = 829
      end
    end
    object tabChecks: TcxTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1080
      ImageIndex = 6
      OnShow = tabChecksShow
    end
  end
  inherited ActionList: TActionList
    Left = 252
    Top = 269
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 336
    Top = 269
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 448
    Top = 269
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -15
    Style.IsFontAssigned = True
    Left = 476
    Top = 269
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 392
    Top = 269
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 420
    Top = 269
  end
  inherited imglAction: TImageList
    Left = 280
    Top = 269
  end
  inherited imglLarge: TImageList
    Left = 308
    Top = 269
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
        FloatClientWidth = 136
        FloatClientHeight = 53
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
        Name = #1054#1073#1098#1077#1082#1090
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
    Left = 364
    Top = 269
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
        Name = 'GL_SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = SubjectForm.dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftFloat
        Name = 'SUBJECT_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end>
    Left = 252
    Top = 297
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Person_Lst'
      ' where ID = :ID')
    Left = 280
    Top = 297
    inherited dsDataNAME: TStringField
      Required = False
    end
    inherited dsDataFULL_NAME: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataOKPO: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataINN: TStringField
      Required = False
      OnValidate = nil
    end
    inherited dsDataOGRN: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataSOATO: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataPHONE: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataFAX: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTELEX: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTELEGRAPH: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataTELETYPE: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    inherited dsDataKPP: TStringField
      FieldKind = fkCalculated
      Calculated = True
    end
    object dsDataLAST_NAME: TStringField [24]
      FieldName = 'LAST_NAME'
      Required = True
      Size = 100
    end
    object dsDataFIRST_NAME: TStringField [25]
      FieldName = 'FIRST_NAME'
      Size = 100
    end
    object dsDataMIDDLE_NAME: TStringField [26]
      FieldName = 'MIDDLE_NAME'
      Size = 100
    end
    object dsDataDOC_TYPE: TStringField [27]
      FieldName = 'DOC_TYPE'
      Size = 3
    end
    object dsDataDOC_NO: TStringField [28]
      FieldName = 'DOC_NO'
      Size = 30
    end
    object dsDataSER_NO: TStringField [29]
      FieldName = 'SER_NO'
      Size = 30
    end
    object dsDataCOUNTRY_CODE: TStringField [30]
      FieldName = 'COUNTRY_CODE'
      Size = 3
    end
    object dsDataISSUED_BY: TStringField [31]
      FieldName = 'ISSUED_BY'
      Size = 100
    end
    object dsDataISSUED_DATE: TDateTimeField [32]
      FieldName = 'ISSUED_DATE'
    end
    object dsDataPRIVATE_OWNER: TStringField [33]
      FieldName = 'PRIVATE_OWNER'
      Size = 1
    end
  end
  inherited srcData: TDataSource
    Left = 280
    Top = 325
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_person_Add('
      '    :LAST_NAME,'
      '    :FIRST_NAME,'
      '    :MIDDLE_NAME,'
      '    :COUNTRY_CODE,'
      '    :DOC_TYPE,'
      '    :SER_NO,'
      '    :DOC_NO,'
      '    :ISSUED_BY,'
      '    :ISSUED_DATE,'
      '    :ADDRESS,'
      '    :INN,'
      '    :PRIVATE_OWNER);'
      'end;')
    Left = 308
    Top = 297
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'LAST_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FIRST_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MIDDLE_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'COUNTRY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'SER_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ISSUED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ISSUED_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ADDRESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRIVATE_OWNER'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '    fdc_person_UPD('
      '    :Id,'
      '    :LAST_NAME,'
      '    :FIRST_NAME,'
      '    :MIDDLE_NAME,'
      '    :COUNTRY_CODE,'
      '    :DOC_TYPE,'
      '    :SER_NO,'
      '    :DOC_NO,'
      '    :ISSUED_BY,'
      '    :ISSUED_DATE,'
      '    :ADDRESS,'
      '    :INN,'
      '    :PRIVATE_OWNER);'
      'end;')
    Left = 336
    Top = 297
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LAST_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIRST_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MIDDLE_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COUNTRY_CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_TYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SER_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DOC_NO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ISSUED_BY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ISSUED_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADDRESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PRIVATE_OWNER'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 392
    Top = 325
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Left = 476
    Top = 297
  end
  inherited dsUpdateState: TfdcQuery
    Left = 420
    Top = 297
  end
  inherited srcState: TDataSource
    Left = 364
    Top = 325
  end
  inherited dsTransit: TfdcQuery
    Left = 392
    Top = 297
  end
  inherited dsState: TfdcQuery
    Left = 364
    Top = 297
  end
  inherited srcAccessLevel: TDataSource
    Left = 448
    Top = 325
  end
  inherited dsAccessLevel: TfdcQuery
    Left = 448
    Top = 297
  end
end
