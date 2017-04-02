inherited NSIDeclarantELSForm: TNSIDeclarantELSForm
  Left = 520
  Top = 330
  Width = 700
  Height = 509
  HelpContext = 32
  Caption = #1059#1095#1072#1089#1090#1085#1080#1082' '#1042#1069#1044' '#1089' '#1045#1051#1057
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 692
    Height = 482
    ClientRectBottom = 458
    ClientRectRight = 692
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 686
        Height = 429
        inherited edtName: TcxDBTextEdit
          Left = 107
          Top = 36
          TabOrder = 1
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 107
          Top = 280
          TabOrder = 6
          Height = 89
          Width = 185
        end
        object cxDBDateBegin: TcxDBDateEdit [2]
          Left = 107
          Top = 158
          DataBinding.DataField = 'DATE_BEGIN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 3
          Width = 138
        end
        object cxDBDateEnd: TcxDBDateEdit [3]
          Left = 294
          Top = 158
          DataBinding.DataField = 'DATE_END'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 138
        end
        object cxDBMemoNote: TcxDBMemo [4]
          Left = 107
          Top = 185
          DataBinding.DataField = 'NOTE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 5
          Height = 89
          Width = 185
        end
        object cxDBTextEditINN: TcxDBMaskEdit [5]
          Left = 107
          Top = 9
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d{0,12}'
          Properties.MaxLength = 0
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
        end
        object cxDBDeclarantName: TcxDBMemo [6]
          Left = 107
          Top = 63
          DataBinding.DataField = 'DECLARANT_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 2
          Height = 89
          Width = 185
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem5: TdxLayoutItem [0]
            Caption = #1048#1053#1053
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBTextEditINN
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'_old'
            CaptionOptions.AlignVert = tavTop
            Visible = False
          end
          object lciDeclarantNameEdit: TdxLayoutItem [2]
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBDeclarantName
            ControlOptions.ShowBorder = False
          end
          object lcGeneralGroup1: TdxLayoutGroup [3]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1044#1072#1090#1072' '#1089
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cxDBDateBegin
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem3: TdxLayoutItem
              AutoAligns = [aaVertical]
              Caption = #1044#1072#1090#1072' '#1087#1086
              CaptionOptions.AlignHorz = taRightJustify
              CaptionOptions.AlignVert = tavTop
              Control = cxDBDateEnd
              ControlOptions.ShowBorder = False
            end
          end
          object lcGeneralItem4: TdxLayoutItem [4]
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = cxDBMemoNote
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 692
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 429
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 455
        Width = 692
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 689
        Height = 429
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 692
        Height = 458
        ClientRectBottom = 434
        ClientRectRight = 692
        inherited tabFake: TcxTabSheet
          inherited lblFake: TLabel
            Width = 115
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 280
    Top = 243
  end
  inherited LayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 300
    Top = 171
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
  inherited imglAction: TImageList
    Top = 139
  end
  inherited imglLarge: TImageList
    Top = 155
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
    Left = 328
    Top = 183
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from FDC_NSI_DECLARANT_ELS_lst'
      ' where ID = :ID')
    Left = 228
    Top = 183
    object dsDataINN: TStringField
      FieldName = 'INN'
    end
    object dsDataDECLARANT_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'DECLARANT_NAME'
      Size = 4000
    end
    object dsDataDATE_BEGIN: TDateTimeField
      FieldName = 'DATE_BEGIN'
    end
    object dsDataDATE_END: TDateTimeField
      FieldName = 'DATE_END'
    end
    object dsDataNOTE: TStringField
      FieldName = 'NOTE'
      Size = 4000
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= P_NSI_DECLARANT_ELS.Add('
      '                pINN =>  :INN,'
      '                pNAME => :DECLARANT_NAME,'
      '                pDATE_BEGIN => :DATE_BEGIN,'
      '                pDATE_END => :DATE_END,'
      '                pNOTE => :NOTE'
      '  );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DECLARANT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATE_BEGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOTE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  P_NSI_DECLARANT_ELS.Modify(pID => :ID,'
      '                pINN =>  :INN,'
      '                pNAME => :DECLARANT_NAME,'
      '                pDATE_BEGIN => :DATE_BEGIN,'
      '                pDATE_END => :DATE_END,'
      '                pNOTE => :NOTE'
      '  );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DECLARANT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATE_BEGIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOTE'
        ParamType = ptUnknown
      end>
  end
end
