inherited DeclGoodsForm: TDeclGoodsForm
  Left = 345
  Top = 261
  ActiveControl = nil
  Caption = 'DeclGoodsForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    ClientRectBottom = 280
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 0
        Align = alNone
        Visible = False
        inherited edtName: TcxDBTextEdit
          Width = 553
        end
        inherited edtDescript: TcxDBMemo
          Width = 242
          Height = 131
        end
      end
      object lcMain: TdxLayoutControl
        Left = 3
        Top = 28
        Width = 486
        Height = 249
        Align = alClient
        DragMode = dmAutomatic
        ParentBackground = True
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnStartDrag = tabGeneralStartDrag
        AutoContentSizes = [acsWidth, acsHeight]
        LookAndFeel = LayoutWebLookAndFeel
        object cxDBMemo1: TcxDBMemo
          Left = 10000
          Top = 10000
          Width = 242
          Height = 131
          DataBinding.DataField = 'DESCRIPT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = False
          Properties.ScrollBars = ssVertical
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 4
          Visible = False
        end
        object cxDBMaskEdit1: TcxDBMaskEdit
          Left = 169
          Top = 12
          Width = 344
          Height = 26
          DataBinding.DataField = 'NO'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 0
        end
        object fdcObjectLinkEdit1: TfdcObjectLinkEdit
          Left = 169
          Top = 45
          Width = 344
          Height = 26
          DataBinding.DataField = 'GOODS_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'GOODS_ID'
          DataBinding.TypeSysName = 'GoodsItem'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 1
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 169
          Top = 78
          Width = 344
          Height = 26
          DataBinding.DataField = 'G36'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 2
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 169
          Top = 111
          Width = 344
          Height = 26
          DataBinding.DataField = 'G37'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.StyleController = WebEditStyleController
          TabOrder = 3
        end
        object dxLayoutGroup2: TdxLayoutGroup
          ShowCaption = False
          Hidden = True
          ShowBorder = False
          object lcMainItem1: TdxLayoutItem
            Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087
            Control = cxDBMaskEdit1
            ControlOptions.ShowBorder = False
          end
          object lcMainItem2: TdxLayoutItem
            Caption = #1058#1086#1074#1072#1088
            Control = fdcObjectLinkEdit1
            ControlOptions.ShowBorder = False
          end
          object lcMainItem3: TdxLayoutItem
            Caption = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
            Control = cxDBTextEdit1
            ControlOptions.ShowBorder = False
          end
          object lcMainItem4: TdxLayoutItem
            Caption = #1056#1077#1078#1080#1084' '#1087#1083#1072#1090#1077#1078#1077#1081
            Control = cxDBTextEdit2
            ControlOptions.ShowBorder = False
          end
        end
        object dxLayoutItem2: TdxLayoutItem
          AutoAligns = [aaHorizontal]
          AlignVert = avClient
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          CaptionOptions.AlignHorz = taRightJustify
          CaptionOptions.AlignVert = tavTop
          Control = cxDBMemo1
          ControlOptions.ShowBorder = False
        end
      end
    end
    object tabCharge: TcxTabSheet [1]
      Caption = #1048#1089#1095#1080#1089#1083#1077#1085#1080#1103
      ImageIndex = 2
      OnShow = tabChargeShow
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
        Name = 'DECL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DECL_GOODS_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Decl_Goods_Lst'
      ' where ID = :ID')
    OnNewRecord = dsDataNewRecord
    object dsDataDECL_ID: TFloatField
      FieldName = 'DECL_ID'
    end
    object dsDataNO: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087'/'#1087
      FieldName = 'NO'
    end
    object dsDataGOODS_ID: TFloatField
      FieldName = 'GOODS_ID'
      Visible = False
    end
    object dsDataGOODS_CODE: TStringField
      FieldName = 'GOODS_CODE'
      Size = 1500
    end
    object dsDataGOODS_NAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'GOODS_NAME'
      Size = 1500
    end
    object dsDataG36: TStringField
      DisplayLabel = #1054#1089#1086#1073#1077#1085#1085#1086#1089#1090#1080' '#1091#1087#1083#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
      FieldName = 'G36'
      Size = 5
    end
    object dsDataG37: TStringField
      DisplayLabel = #1056#1077#1078#1080#1084' '#1091#1087#1083#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
      FieldName = 'G37'
      Size = 5
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_doc_charge.addgoods(pdeclid => :decl_id,'
      '                                    pno => :no,'
      '                                    pgoodsid => :goods_id,'
      '                                    pg36 => :g36,'
      '                                    pg37 => :g37);'
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
        Name = 'DECL_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'NO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFloat
        Name = 'GOODS_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G36'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftString
        Name = 'G37'
        ParamType = ptUnknown
        Size = 6
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      'p_doc_charge.ModifyGoods(pid => :id,'
      '                                    pno => :no,'
      '                                    pgoodsid => :goods_id,'
      '                                    pg36 => :g36,'
      '                                    pg37 => :g37);'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'NO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftFloat
        Name = 'GOODS_ID'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'G36'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftString
        Name = 'G37'
        ParamType = ptUnknown
        Size = 6
      end>
  end
end
