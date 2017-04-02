inherited DocPackForm: TDocPackForm
  Left = 281
  Top = 247
  Width = 703
  Height = 488
  ActiveControl = edtDocNumber
  Caption = #1055#1072#1082#1077#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 687
    Height = 450
    ClientRectBottom = 426
    ClientRectRight = 687
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 681
        Height = 395
        inherited edtName: TcxDBTextEdit
          Left = 72
          Top = 276
          TabOrder = 9
        end
        inherited edtDescript: TcxDBMemo
          Left = 72
          Top = 303
          TabOrder = 10
          Height = 91
          Width = 608
        end
        object edtDocNumber: TcxDBTextEdit [2]
          Left = 108
          Top = 40
          DataBinding.DataField = 'DOC_NUMBER'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 129
        end
        object edtDocDate: TcxDBDateEdit [3]
          Left = 271
          Top = 40
          DataBinding.DataField = 'DOC_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 1
          Width = 121
        end
        object chBIsActive: TcxDBCheckBox [4]
          Left = 21
          Top = 138
          Caption = #1055#1088#1086#1074#1077#1076#1105#1085'  '
          DataBinding.DataField = 'IS_ACTIVE'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Width = 90
        end
        object edtActivationDate: TcxDBDateEdit [5]
          Left = 270
          Top = 138
          DataBinding.DataField = 'ACTIVATION_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 121
        end
        object fdcSrcAppName: TfdcObjectLinkEdit [6]
          Left = 108
          Top = 209
          DataBinding.DataField = 'SENDER_SOFT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SENDER_SOFT_CODE_ID'
          DataBinding.TypeSysName = 'Dict.SoftCode'
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
          Style.Color = clWindow
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 7
          Width = 586
        end
        object fdcDstAppName: TfdcObjectLinkEdit [7]
          Left = 108
          Top = 236
          DataBinding.DataField = 'RECEIVER_SOFT_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'RECEIVER_SOFT_CODE_ID'
          DataBinding.TypeSysName = 'Dict.SoftCode'
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
          Style.Color = clWindow
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 8
          Width = 573
        end
        object chBIsReceived: TcxDBCheckBox [8]
          Left = 21
          Top = 67
          Caption = #1055#1086#1083#1091#1095#1077#1085
          DataBinding.DataField = 'IS_RECIEVED'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = True
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 121
        end
        object edtReceiveDate: TcxDBDateEdit [9]
          Left = 271
          Top = 67
          DataBinding.DataField = 'RECIEVE_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 121
        end
        object cxDBIsTS: TcxDBCheckBox [10]
          Left = 397
          Top = 138
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1058#1057
          DataBinding.DataField = 'IS_TS'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 6
          Width = 100
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGrpPackage: TdxLayoutGroup [0]
            Caption = #1055#1072#1082#1077#1090' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
            object lciGrpDocAttr: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object itemDocNumber: TdxLayoutItem
                AutoAligns = [aaVertical]
                Caption = #1053#1086#1084#1077#1088
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocNumber
                ControlOptions.ShowBorder = False
              end
              object itemDocDate: TdxLayoutItem
                Caption = #1044#1072#1090#1072
                CaptionOptions.AlignHorz = taRightJustify
                Control = edtDocDate
                ControlOptions.ShowBorder = False
              end
            end
            object lcGrpReceiveAttr: TdxLayoutGroup
              ShowCaption = False
              Hidden = True
              LayoutDirection = ldHorizontal
              ShowBorder = False
              object itemIsReiceved: TdxLayoutItem
                Tag = 33
                AutoAligns = [aaVertical]
                Caption = #1055#1086#1083#1091#1095#1077#1085
                CaptionOptions.AlignHorz = taRightJustify
                ShowCaption = False
                Control = chBIsReceived
                ControlOptions.ShowBorder = False
              end
              object itemReceiveDate: TdxLayoutItem
                Tag = 33
                Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
                Offsets.Left = 38
                Control = edtReceiveDate
                ControlOptions.ShowBorder = False
              end
            end
          end
          object lcGrpActivation: TdxLayoutGroup [1]
            Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1080#1077
            LayoutDirection = ldHorizontal
            object itemIsActive: TdxLayoutItem
              Tag = 33
              AutoAligns = [aaVertical]
              Caption = 'cxDBCheckBox1'
              ShowCaption = False
              Control = chBIsActive
              ControlOptions.ShowBorder = False
            end
            object itemActivationDate: TdxLayoutItem
              Tag = 33
              Caption = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
              Offsets.Left = 73
              Control = edtActivationDate
              ControlOptions.ShowBorder = False
            end
            object lciIsTS: TdxLayoutItem
              Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
              ShowCaption = False
              Visible = False
              Control = cxDBIsTS
              ControlOptions.ShowBorder = False
            end
          end
          object lcGrpRouting: TdxLayoutGroup [2]
            Caption = #1052#1072#1088#1096#1088#1091#1090#1080#1079#1072#1094#1080#1103
            object itemSrcAppName: TdxLayoutItem
              Tag = 33
              Caption = #1055#1054'-'#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = fdcSrcAppName
              ControlOptions.ShowBorder = False
            end
            object itemDstAppName: TdxLayoutItem
              Caption = #1055#1054'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = fdcDstAppName
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavTop
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 687
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 395
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 423
        Width = 687
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 684
        Height = 395
      end
    end
    object tabDocs: TcxTabSheet [1]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      ImageIndex = 2
      OnShow = tabDocsShow
    end
    object tabEnvelops: TcxTabSheet [2]
      Caption = #1050#1086#1085#1074#1077#1088#1090#1099
      ImageIndex = 3
      OnShow = tabEnvelopsShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 687
        Height = 426
        ClientRectBottom = 402
        ClientRectRight = 687
      end
    end
  end
  inherited ActionList: TActionList
    Left = 336
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 436
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 548
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
    Left = 576
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 492
  end
  inherited DefaultEditStyleController: TcxDefaultEditStyleController
    Style.IsFontAssigned = True
    Left = 520
  end
  inherited imglAction: TImageList
    Left = 372
  end
  inherited imglLarge: TImageList
    Left = 408
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
    Left = 464
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited ParamsHolder: TfdcParamsHolder
    Left = 336
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_doc_pack_lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_DOC_PACK_LST'
    Left = 372
    object dsDataDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DOC_DATE'
    end
    object dsDataDOC_NUMBER: TStringField
      DisplayLabel = #8470' '#1088#1077#1077#1089#1090#1088#1072
      FieldName = 'DOC_NUMBER'
      Size = 100
    end
    object dsDataIS_ACTIVE: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'IS_ACTIVE'
      Size = 1
    end
    object dsDataACTIVATION_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      FieldName = 'ACTIVATION_DATE'
    end
    object dsDataSENDER_SOFT_CODE_ID: TFloatField
      FieldName = 'SENDER_SOFT_CODE_ID'
    end
    object dsDataSENDER_SOFT_NAME: TStringField
      FieldName = 'SENDER_SOFT_NAME'
      Size = 1500
    end
    object dsDataSENDER_SOFT_CODE: TStringField
      FieldName = 'SENDER_SOFT_CODE'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE_ID: TFloatField
      FieldName = 'RECEIVER_SOFT_CODE_ID'
    end
    object dsDataRECEIVER_SOFT_NAME: TStringField
      FieldName = 'RECEIVER_SOFT_NAME'
      Size = 1500
    end
    object dsDataRECEIVER_SOFT_CODE: TStringField
      FieldName = 'RECEIVER_SOFT_CODE'
      Size = 1500
    end
    object dsDataIS_RECIEVED: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1077#1085
      FieldName = 'IS_RECIEVED'
      Size = 1
    end
    object dsDataRECIEVE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      FieldName = 'RECIEVE_DATE'
    end
    object dsDataIS_TS: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
      FieldName = 'IS_TS'
      Size = 1
    end
  end
  inherited srcData: TDataSource
    Left = 372
    Top = 163
  end
  inherited dsInsert: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_DocPack_Add('
      '    NULL,             -- DOC_NUMBER'
      '    :DOC_DATE,'
      '    :NAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_DOCPACK_ADD'
    Left = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
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
      end>
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_DocPackReturns_Upd('
      '    :ID,'
      '    :DOC_NUMBER,'
      '    :DOC_DATE,'
      '    :NAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_DOCPACK_UPD'
    Left = 436
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DOC_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited srcTransit: TDataSource
    Left = 492
  end
  inherited dsAccessLevelUpdate: TfdcQuery
    Session = MainData.Session
    Left = 576
  end
  inherited dsUpdateState: TfdcQuery
    Session = MainData.Session
    Left = 520
  end
  inherited srcState: TDataSource
    Left = 464
  end
  inherited dsTransit: TfdcQuery
    Session = MainData.Session
    Left = 492
  end
  inherited dsState: TfdcQuery
    Session = MainData.Session
    Left = 464
  end
  inherited srcAccessLevel: TDataSource
    Left = 548
  end
  inherited dsAccessLevel: TfdcQuery
    Session = MainData.Session
    Left = 548
  end
end
