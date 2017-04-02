inherited NSICurrencyForm: TNSICurrencyForm
  Width = 618
  Height = 362
  HelpContext = 32
  ActiveControl = edtCode
  Caption = 'NSICurrencyForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 602
    Height = 324
    ClientRectBottom = 300
    ClientRectRight = 602
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 596
        Height = 269
        inherited edtName: TcxDBTextEdit
          Left = 104
          Top = 34
          TabOrder = 3
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 104
          Top = 59
          TabOrder = 4
          Height = 69
          Width = 353
        end
        object edtCode: TcxDBTextEdit [2]
          Left = 104
          Top = 9
          DataBinding.DataField = 'CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 0
          Width = 89
        end
        object edtACode: TcxDBTextEdit [3]
          Left = 287
          Top = 9
          DataBinding.DataField = 'ACODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 77
        end
        object edtOldCode: TcxDBTextEdit [4]
          Left = 445
          Top = 9
          DataBinding.DataField = 'OLD_CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 98
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup1: TdxLayoutGroup [0]
            AutoAligns = [aaVertical]
            AlignHorz = ahClient
            Caption = 'New Group'
            ShowCaption = False
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem1: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1086#1076
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtCode
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1041#1091#1082#1074'.'
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtACode
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem3: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1057#1090#1072#1088#1099#1081
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtOldCode
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            CaptionOptions.AlignVert = tavTop
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 602
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 269
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 297
        Width = 602
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 599
        Height = 269
      end
    end
    object tabRate: TcxTabSheet [1]
      Caption = #1050#1091#1088#1089
      ImageIndex = 1
      OnShow = tabRateShow
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 602
        Height = 300
        ClientRectBottom = 276
        ClientRectRight = 602
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
        DataType = ftUnknown
        Name = 'CURR_ID'
        ParamType = ptUnknown
        SourceField = dsDataID
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'CURR_NAME'
        ParamType = ptUnknown
        SourceField = dsDataNAME
        AcceptedSources = [asField]
      end
      item
        DataType = ftString
        Name = 'CURR_CODE'
        ParamType = ptUnknown
        SourceField = dsDataCODE
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_NSI_Currency_Lst'
      ' where ID = :ID')
    inherited dsDataNAME: TStringField
      DisplayLabel = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
      Required = True
    end
    object dsDataCODE: TStringField
      DisplayLabel = #1050#1086#1076
      FieldName = 'CODE'
      Required = True
      Size = 3
    end
    object dsDataACODE: TStringField
      DisplayLabel = #1041#1091#1082#1074'. '#1082#1086#1076
      FieldName = 'ACODE'
      Size = 3
    end
    object dsDataOLD_CODE: TStringField
      DisplayLabel = #1057#1090#1072#1088#1099#1081' '#1082#1086#1076
      FieldName = 'OLD_CODE'
      Size = 3
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_nsicurrency_add('
      '    :NAME,'
      '   :DESCRIPT,'
      '   :CODE,'
      '   :ACODE,'
      '   :OLD_CODE'
      ' );'
      'end;')
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
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '   fdc_nsicurrency_upd('
      '   :ID,'
      '    :NAME,'
      '   :DESCRIPT,'
      '   :CODE,'
      '   :ACODE,'
      '   :OLD_CODE'
      ' );'
      'end;'
      '')
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
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ACODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_CODE'
        ParamType = ptUnknown
      end>
  end
end
