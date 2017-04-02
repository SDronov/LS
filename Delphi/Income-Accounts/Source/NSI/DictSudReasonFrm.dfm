inherited DictSudReasonForm: TDictSudReasonForm
  Left = 420
  Top = 275
  Width = 665
  Height = 540
  Caption = 'DictSudReasonForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 657
    Height = 513
    ClientRectBottom = 489
    ClientRectRight = 657
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Width = 651
        Height = 483
        inherited edtName: TcxDBTextEdit
          Left = 145
          Width = 424
        end
        inherited edtDescript: TcxDBMemo
          Left = 145
          Top = 291
          TabOrder = 10
          Height = 68
          Width = 185
        end
        inherited edtCode: TcxDBTextEdit
          Left = 145
          Width = 121
        end
        inherited edtFullCode: TcxDBTextEdit
          Left = 145
          Width = 121
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Left = 145
          Width = 121
        end
        object edtDatBegDoc: TcxDBDateEdit [5]
          Left = 145
          Top = 134
          DataBinding.DataField = 'DATBEGDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 5
          Width = 765
        end
        object edtEDate: TcxDBDateEdit [6]
          Left = 145
          Top = 200
          DataBinding.DataField = 'EDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 7
          Width = 765
        end
        object edtDatEndDoc: TcxDBDateEdit [7]
          Left = 145
          Top = 225
          DataBinding.DataField = 'DATENDDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 8
          Width = 765
        end
        object edtNumEndDoc: TcxDBTextEdit [8]
          Left = 145
          Top = 258
          DataBinding.DataField = 'NUMENDDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 9
          Width = 765
        end
        object edtNumBegDoc: TcxDBTextEdit [9]
          Left = 145
          Top = 167
          DataBinding.DataField = 'NUMBEGDOC'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 6
          Width = 765
        end
        object edtSDate: TcxDBDateEdit [10]
          Left = 145
          Top = 109
          DataBinding.DataField = 'SDATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ReadOnly = True
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 4
          Width = 765
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Tag = 33
            CaptionOptions.AlignVert = tavTop
          end
          inherited lciCode: TdxLayoutItem
            Tag = 33
            CaptionOptions.AlignVert = tavTop
          end
          inherited lciFullCode: TdxLayoutItem
            CaptionOptions.AlignVert = tavTop
          end
          inherited lciOwnerID: TdxLayoutItem
            CaptionOptions.AlignVert = tavTop
          end
          object lciSDate: TdxLayoutItem [4]
            Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtSDate
            ControlOptions.ShowBorder = False
          end
          object lciDatBegDoc: TdxLayoutItem [5]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Width = 120
            Control = edtDatBegDoc
            ControlOptions.ShowBorder = False
          end
          object lciNumBegDoc: TdxLayoutItem [6]
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Width = 120
            Control = edtNumBegDoc
            ControlOptions.ShowBorder = False
          end
          object lciEDate: TdxLayoutItem [7]
            Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            Control = edtEDate
            ControlOptions.ShowBorder = False
          end
          object lciDatEndDoc: TdxLayoutItem [8]
            Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Width = 120
            Control = edtDatEndDoc
            ControlOptions.ShowBorder = False
          end
          object lciNumEndDoc: TdxLayoutItem [9]
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1076#1077#1081#1089#1090#1074#1080#1103
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Width = 120
            Control = edtNumEndDoc
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Tag = 22
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 657
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 483
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 486
        Width = 657
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 654
        Top = 3
        Height = 483
      end
    end
    inherited tabPositions: TcxTabSheet
      TabVisible = False
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 657
        Height = 489
        ClientRectBottom = 465
        ClientRectRight = 657
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Enabled = False
      Visible = False
    end
    inherited actDelete: TAction
      Enabled = False
      Visible = False
    end
    inherited actSave: TAction
      Enabled = False
      Visible = False
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
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
        FloatLeft = 308
        FloatTop = 211
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select d.*'
      '      ,sr.SDATE'
      '      ,sr.EDATE'
      '      ,sr.numbegdoc'
      '      ,sr.datbegdoc'
      '      ,sr.EDATE AS datend'
      '      ,sr.numenddoc'
      '      ,sr.datenddoc'
      '  from fdc_Dict_Lst d'
      '      ,fdc_dict_sud_reason_lst sr'
      '  WHERE sr.id = d.id'
      '    AND d.id = :ID')
    object dsDataSDATE: TDateTimeField
      FieldName = 'SDATE'
    end
    object dsDataEDATE: TDateTimeField
      FieldName = 'EDATE'
    end
    object dsDataNUMBEGDOC: TStringField
      FieldName = 'NUMBEGDOC'
      Size = 100
    end
    object dsDataDATBEGDOC: TDateTimeField
      FieldName = 'DATBEGDOC'
    end
    object dsDataNUMENDDOC: TStringField
      FieldName = 'NUMENDDOC'
      Size = 100
    end
    object dsDataDATENDDOC: TDateTimeField
      FieldName = 'DATENDDOC'
    end
  end
end
