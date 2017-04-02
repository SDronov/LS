inherited NSIRefinancingRateForm: TNSIRefinancingRateForm
  Width = 472
  Height = 246
  HelpContext = 32
  Caption = #1057#1090#1072#1074#1082#1072' '#1062#1041
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 464
    Height = 219
    ClientRectBottom = 195
    ClientRectRight = 464
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Width = 458
        Height = 166
        inherited edtName: TcxDBTextEdit
          Left = 61
          Top = 63
          TabOrder = 2
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Left = 61
          Top = 90
          TabOrder = 3
          Height = 89
          Width = 185
        end
        object edtRateDate: TcxDBDateEdit [2]
          Left = 61
          Top = 9
          DataBinding.DataField = 'RATE_DATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          TabOrder = 0
          Width = 379
        end
        object edtRefinancingRate: TcxDBMaskEdit [3]
          Left = 61
          Top = 36
          DataBinding.DataField = 'REFINANCING_RATE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.MaxLength = 6
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 379
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralItem1: TdxLayoutItem [0]
            Caption = #1044#1072#1090#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtRateDate
            ControlOptions.ShowBorder = False
          end
          object lcGeneralItem2: TdxLayoutItem [1]
            Caption = #1057#1090#1072#1074#1082#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtRefinancingRate
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            Visible = False
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 464
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 166
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 192
        Width = 464
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 461
        Height = 166
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 464
        Height = 195
        ClientRectBottom = 171
        ClientRectRight = 464
        inherited tabFake: TcxTabSheet
          inherited lblFake: TLabel
            Width = 115
          end
        end
      end
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
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_nsi_refinancing_rate_lst'
      ' where ID = :ID')
    object dsDataRATE_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'RATE_DATE'
      Required = True
    end
    object dsDataREFINANCING_RATE: TFloatField
      DisplayLabel = #1057#1090#1072#1074#1082#1072
      FieldName = 'REFINANCING_RATE'
      Required = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_nsi_Refinancing_Rate.AddRate('
      '                pRefinancingRate  =>  :REFINANCING_RATE,'
      '                pRateDate         =>  :RATE_DATE'
      '  );'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFINANCING_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_nsi_Refinancing_Rate.ModifyRate('
      '                pId               =>  :ID,'
      '                pRefinancingRate  =>  :REFINANCING_RATE,'
      '                pRateDate         =>  :RATE_DATE'
      '  );'
      'end;'
      '')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REFINANCING_RATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RATE_DATE'
        ParamType = ptUnknown
      end>
  end
end
