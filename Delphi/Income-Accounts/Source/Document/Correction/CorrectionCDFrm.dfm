inherited CorrectionCDForm: TCorrectionCDForm
  Top = 186
  Height = 562
  Caption = 'CorrectionCDForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 535
    ClientRectBottom = 511
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 482
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 344
          TabOrder = 8
          Height = 224
          Width = 185
        end
        object edtReasonCorrect: TcxDBMemo [2]
          Left = 21
          Top = 236
          Align = alClient
          DataBinding.DataField = 'REASON_CORRECT'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ScrollBars = ssVertical
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 7
          Height = 89
          Width = 185
        end
        inherited edtDocumentSource: TfdcObjectLinkEdit
          Width = 724
        end
        inherited edtDocNumber: TcxDBTextEdit
          Width = 121
        end
        inherited edtDocDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited chBIsActive: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited edtActivationDate: TcxDBDateEdit
          Style.IsFontAssigned = True
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Style.IsFontAssigned = True
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcGeneralGroup3: TdxLayoutGroup [3]
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
            LayoutDirection = ldHorizontal
            object lciReasonCorrect: TdxLayoutItem
              AutoAligns = []
              AlignHorz = ahClient
              AlignVert = avClient
              CaptionOptions.AlignHorz = taRightJustify
              Control = edtReasonCorrect
              ControlOptions.ShowBorder = False
            end
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 482
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 508
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 482
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 511
        ClientRectBottom = 487
      end
    end
  end
  inherited ActionList: TActionList
    inherited actDelete: TAction
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
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 370
        FloatTop = 290
        FloatClientWidth = 134
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
            Item = btnPrint
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
      '  from fdc_correction_cd_Lst'
      ' where ID = :ID')
    object dsDataREASON_CORRECT: TStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1082#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1080
      DisplayWidth = 200
      FieldName = 'REASON_CORRECT'
      Size = 1500
    end
  end
end
