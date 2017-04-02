inherited RepayGroupBySubjForm: TRepayGroupBySubjForm
  Left = 438
  Top = 201
  ActiveControl = edtName
  Caption = 'RepayGroupBySubjForm'
  PixelsPerInch = 120
  TextHeight = 17
  inherited pcMain: TcxPageControl
    ClientRectBottom = 280
    ClientRectRight = 492
    ClientRectTop = 0
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Style.Color = clSilver
          Width = 396
        end
        inherited edtDescript: TcxDBMemo
          Top = 78
          TabOrder = 3
          Height = 130
          Width = 242
        end
        object DBEdit1: TcxDBTextEdit [2]
          Left = 291
          Top = 45
          DataBinding.DataField = 'KPP'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 181
        end
        object DBEdit2: TcxDBTextEdit [3]
          Left = 78
          Top = 45
          DataBinding.DataField = 'INN'
          DataBinding.DataSource = srcData
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Color = clSilver
          Style.StyleController = WebEditStyleController
          TabOrder = 1
          Width = 175
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup2: TdxLayoutGroup [1]
            ShowCaption = False
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            object lcGeneralItem4: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1048#1053#1053
              CaptionOptions.AlignHorz = taRightJustify
              Control = DBEdit2
              ControlOptions.ShowBorder = False
            end
            object lcGeneralItem2: TdxLayoutItem
              AutoAligns = [aaVertical]
              AlignHorz = ahClient
              Caption = #1050#1055#1055
              CaptionOptions.AlignHorz = taRightJustify
              Control = DBEdit1
              ControlOptions.ShowBorder = False
            end
          end
          inherited lciDescriptEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavCenter
            Visible = False
          end
        end
      end
    end
    object cxTabSheet1: TcxTabSheet [1]
      Caption = #1056#1072#1089#1089#1088#1086#1095#1082#1080
      ImageIndex = 2
      OnShow = cxTabSheet1Show
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        ClientRectBottom = 252
        ClientRectRight = 492
        ClientRectTop = 0
      end
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actDelete: TAction
      Visible = False
    end
    inherited actSave: TAction
      Visible = False
    end
    inherited actChangeState: TAction
      Visible = False
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
        FloatLeft = 341
        FloatTop = 270
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
        SourceField = dsDataID
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    ReadOnly = True
    SQL.Strings = (
      'select *'
      '  from fdc_Subject_Lst'
      ' where ID = :ID')
    object dsDataADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object dsDataFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 4000
    end
    object dsDataOKPO: TStringField
      FieldName = 'OKPO'
      Size = 10
    end
    object dsDataINN: TStringField
      FieldName = 'INN'
      Size = 12
    end
    object dsDataOGRN: TStringField
      FieldName = 'OGRN'
      Size = 30
    end
    object dsDataSOATO: TStringField
      FieldName = 'SOATO'
      Size = 8
    end
    object dsDataKPP: TStringField
      FieldName = 'KPP'
      Size = 10
    end
    object dsDataPHONE: TStringField
      FieldName = 'PHONE'
      Size = 40
    end
    object dsDataFAX: TStringField
      FieldName = 'FAX'
      Size = 30
    end
    object dsDataTELEX: TStringField
      FieldName = 'TELEX'
      Size = 30
    end
    object dsDataTELEGRAPH: TStringField
      FieldName = 'TELEGRAPH'
      Size = 100
    end
    object dsDataTELETYPE: TStringField
      FieldName = 'TELETYPE'
      Size = 100
    end
  end
end
