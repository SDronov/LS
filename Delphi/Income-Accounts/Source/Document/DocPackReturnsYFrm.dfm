inherited DocPackReturnsYForm: TDocPackReturnsYForm
  Left = 283
  Top = 214
  ActiveControl = nil
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1105#1085#1085#1099#1093' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Top = 401
          TabOrder = 13
          Width = 417
        end
        inherited edtDescript: TcxDBMemo
          Top = 428
          TabOrder = 14
          Height = 51
          Width = 417
        end
        object edtDateIncoming: TcxDBDateEdit [2]
          Left = 117
          Top = 94
          DataBinding.DataField = 'DATE_INCOMING'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 156
        end
        object fdcCustomNameIN: TfdcObjectLinkEdit [3]
          Left = 117
          Top = 192
          DataBinding.DataField = 'CUSTOMS_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CUSTOMS_ID'
          DataBinding.TypeSysName = 'Customs'
          DataBinding.SearchFormClass = 'TCustomsGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = fdcCustomNameINPropertiesButtonClick
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 7
          Width = 607
        end
        object edtDocCount: TcxDBTextEdit [4]
          Left = 117
          Top = 121
          DataBinding.DataField = 'CLAIMED_DOC_COUNT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Width = 121
        end
        object edtDocSumma: TcxDBCurrencyEdit [5]
          Left = 290
          Top = 121
          DataBinding.DataField = 'CLAIMED_SPENDING'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DisplayFormat = ',0.00;-,0.00'
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Width = 167
        end
        inherited edtDocNumber: TcxDBTextEdit
          Left = 117
        end
        inherited edtDocDate: TcxDBDateEdit
          Left = 280
          Width = 145
        end
        inherited chBIsActive: TcxDBCheckBox
          Top = 263
          TabOrder = 8
        end
        inherited edtActivationDate: TcxDBDateEdit
          Top = 263
          TabOrder = 9
        end
        inherited fdcSrcAppName: TfdcObjectLinkEdit
          Left = 117
          Top = 334
          Properties.OnButtonClick = fdcSrcAppNamePropertiesButtonClick
          TabOrder = 11
          Width = 586
        end
        inherited fdcDstAppName: TfdcObjectLinkEdit
          Left = 117
          Top = 361
          Properties.OnButtonClick = fdcCustomNameINPropertiesButtonClick
          TabOrder = 12
          Width = 573
        end
        inherited edtReceiveDate: TcxDBDateEdit
          Width = 146
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Top = 263
          TabOrder = 10
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGrpPackage: TdxLayoutGroup
            Caption = #1056#1077#1077#1089#1090#1088
            inherited lciGrpDocAttr: TdxLayoutGroup
              inherited itemDocNumber: TdxLayoutItem
                Tag = 33
              end
              inherited itemDocDate: TdxLayoutItem
                Tag = 33
              end
            end
            object lcGeneralItem1: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtDateIncoming
              ControlOptions.ShowBorder = False
            end
            object lcGeneralGroup1: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object lciDocCount: TdxLayoutItem
                Tag = 33
                Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1086#1074
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocCount
                ControlOptions.ShowBorder = False
              end
              object lciDocSumma: TdxLayoutItem
                Tag = 33
                Caption = #1085#1072' '#1089#1091#1084#1084#1091
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocSumma
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGrpAdress: TdxLayoutGroup [1]
            Caption = #1040#1076#1088#1077#1089
            object itemAdress: TdxLayoutItem
              Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = fdcCustomNameIN
              ControlOptions.ShowBorder = False
            end
          end
          inherited lcGrpActivation: TdxLayoutGroup
            inherited lciIsTS: TdxLayoutItem
              Visible = True
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
    end
    object tabNDocs: TcxTabSheet [2]
      Caption = #1053#1077#1080#1076#1077#1085#1090#1080#1092#1080#1094#1080#1088#1086#1074#1072#1085#1085#1099#1077
      ImageIndex = 3
      OnShow = tabNDocsShow
    end
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
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
        FloatLeft = 317
        FloatTop = 385
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
          end
          item
            Item = btnCreateActCorrOB
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
    SQL.Strings = (
      'select dp.*'
      '  from fdc_doc_pack_returns_y_lst dp'
      ' where dp.ID = :ID')
    SourceServerObject = 'FDC_DOC_PACK_RETURNS_Y_LST'
    object dsDataDATE_INCOMING: TDateTimeField
      FieldName = 'DATE_INCOMING'
    end
    object dsDataDESTINATION: TStringField
      FieldName = 'DESTINATION'
      Size = 8
    end
    object dsDataCUSTOMS_ID: TFloatField
      FieldName = 'CUSTOMS_ID'
    end
    object dsDataCUSTOMS_NAME: TStringField
      FieldName = 'CUSTOMS_NAME'
      Size = 1500
    end
    object dsDataCLAIMED_DOC_COUNT: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      FieldName = 'CLAIMED_DOC_COUNT'
    end
    object dsDataCLAIMED_SPENDING: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'CLAIMED_SPENDING'
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '      :ID ::=  FDC_DOCPACKRETURNSY_ADD('
      '                                        pdocnumber => NULL,'
      
        '                                        pdocdate => nvl(:DOC_DAT' +
        'A,sysdate),'
      '                                        pname => :NAME,'
      '                                        pdescript => :DESCRIPT,'
      
        '                                        pdateincoming => nvl(:DA' +
        'TE_INCOMING,sysdate),'
      '                                        pvector => 1,'
      
        '                                        pdestcustom => :CUSTOMS_' +
        'ID,'
      
        '                                        psendersoftcodeid => :SE' +
        'NDER_SOFT_CODE_ID,'
      
        '                                        preceiversoftcodeid => :' +
        'RECEIVER_SOFT_CODE_ID,'
      '                                        pIsTS => :IS_TS);'
      'end;')
    SourceServerObject = ''
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftDate
        Name = 'DOC_DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftDateTime
        Name = 'DATE_INCOMING'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SENDER_SOFT_CODE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RECEIVER_SOFT_CODE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IS_TS'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_docpackreturnsy_upd(pdocid              => :ID,'
      '                          pdocnumber          => :DOC_NUMBER,'
      '                          pdocdate            => :DOC_DATE,'
      '                          pname               => :NAME,'
      '                          pdescript           => :DESCRIPT,'
      '                          pdestcustom         => :CUSTOMS_ID,'
      
        '                          preceiversoftcodeid => :RECEIVER_SOFT_' +
        'CODE_ID);'
      'end;')
    SourceServerObject = ''
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptInput
        Size = 101
      end
      item
        DataType = ftDateTime
        Name = 'DOC_DATE'
        ParamType = ptInput
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
        Size = 1501
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'RECEIVER_SOFT_CODE_ID'
        ParamType = ptInput
      end>
  end
end
