inherited DocPackActChangeOstKBKForm: TDocPackActChangeOstKBKForm
  Caption = #1056#1077#1077#1089#1090#1088' '#1072#1082#1090#1086#1074' '#1086' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1083#1089#1090#1072#1090#1082#1086#1074' '#1089' '#1079#1072#1082#1088#1099#1090#1099#1093' '#1050#1041#1050
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 409
        end
        inherited edtDescript: TcxDBMemo
          Height = 91
          Width = 608
        end
        inherited fdcSrcAppName: TfdcObjectLinkEdit
          Width = 586
        end
        inherited fdcDstAppName: TfdcObjectLinkEdit
          Properties.Buttons = <
            item
              Default = True
              Enabled = False
              Kind = bkEllipsis
            end>
          Width = 573
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGrpActivation: TdxLayoutGroup
            Visible = False
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
        FloatClientWidth = 113
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
    inherited dsDataNAME: TStringField
      ReadOnly = True
    end
    inherited dsDataRECEIVER_SOFT_CODE_ID: TFloatField
      ReadOnly = True
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_DP_Act_ChangeOstKBK_Add('
      '    NULL,             -- DOC_NUMBER'
      '    :DOC_DATE,'
      '    :NAME,'
      '    :DESCRIPT);'
      'end;')
    SourceServerObject = 'FDC_DP_ACT_CHANGEOSTKBK_ADD'
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_DocPack_Upd('
      '    :ID,'
      '    :DOC_NUMBER,'
      '    :DOC_DATE,'
      '    :NAME,'
      '    :DESCRIPT);'
      'end;')
  end
end
