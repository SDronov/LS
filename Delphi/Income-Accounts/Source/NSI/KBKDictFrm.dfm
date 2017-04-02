inherited KBKDictForm: TKBKDictForm
  Left = 454
  Caption = 'KBKDictForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 418
        end
        inherited edtDescript: TcxDBMemo
          Top = 357
          TabOrder = 12
          Height = 223
          Width = 418
        end
        object edtPayType: TcxDBTextEdit [2]
          Left = 145
          Top = 63
          DataBinding.DataField = 'CODE2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.StyleController = WebEditStyleController
          TabOrder = 2
          Width = 228
        end
        inherited cxDBTextEdit1: TcxDBTextEdit
          Top = 297
          TabOrder = 10
          Width = 122
        end
        inherited cxDBTextEdit2: TcxDBTextEdit
          Top = 204
          TabOrder = 7
          Width = 122
        end
        inherited cxDBDateEdit1: TcxDBDateEdit
          Top = 264
          TabOrder = 9
          Width = 122
        end
        object chBIsForReport: TcxDBCheckBox [6]
          Left = 9
          Top = 330
          Caption = #1055#1088#1080#1079#1085#1072#1082' '#1086#1090#1088#1072#1078#1077#1085#1080#1103' '#1074' '#1086#1090#1095#1077#1090#1077
          DataBinding.DataField = 'IS_FOR_REPORT'
          DataBinding.DataSource = srcData
          ParentColor = False
          ParentFont = False
          Properties.DisplayChecked = #1044#1072
          Properties.DisplayUnchecked = #1053#1077#1090
          Properties.ValueChecked = 'Y'
          Properties.ValueUnchecked = 'N'
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 11
          Width = 121
        end
        inherited cxDBDateEdit2: TcxDBDateEdit
          Top = 237
          TabOrder = 8
          Width = 122
        end
        inherited edtDatBegDoc: TcxDBDateEdit
          Top = 171
          TabOrder = 6
          Width = 122
        end
        inherited edtSDate: TcxDBDateEdit
          Top = 144
          TabOrder = 5
          Width = 122
        end
        inherited edtCode: TcxDBTextEdit
          Top = 36
          Width = 303
        end
        inherited edtFullCode: TcxDBTextEdit
          Top = 90
          TabOrder = 3
          Width = 303
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Top = 117
          TabOrder = 4
          Width = 303
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciCode: TdxLayoutItem
            Caption = #1050#1041#1050
          end
          object lcGeneralItem7: TdxLayoutItem [2]
            Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtPayType
            ControlOptions.ShowBorder = False
          end
          object lciIsForReport: TdxLayoutItem [11]
            Caption = 'cxDBCheckBox1'
            CaptionOptions.AlignHorz = taRightJustify
            ShowCaption = False
            Control = chBIsForReport
            ControlOptions.ShowBorder = False
          end
        end
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
  end
  inherited OfficeEditStyleController: TcxEditStyleController
    Style.IsFontAssigned = True
  end
  inherited WebEditStyleController: TcxEditStyleController
    Style.Font.Height = -11
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
        FloatLeft = 558
        FloatTop = 311
        FloatClientWidth = 127
        FloatClientHeight = 55
        ItemLinks = <
          item
            Item = btnRefresh
            Visible = True
          end
          item
            Item = btnSave
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
      '  from FDC_KBK_DICT_LST'
      ' where ID = :ID')
    inherited dsDataCODE: TStringField
      DisplayLabel = #1050#1041#1050
    end
    inherited dsDataCODE2: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
    end
    object dsDataIS_PREPAYMENTKBK: TStringField
      FieldName = 'IS_PREPAYMENTKBK'
      Size = 1
    end
    object dsDataIS_FOR_REPORT: TStringField
      FieldName = 'IS_FOR_REPORT'
      Size = 1
    end
  end
  inherited dsUpdate: TfdcQuery
    Session = MainData.Session
    SQL.Strings = (
      'begin'
      '  fdc_KBKDict_Upd('
      '    :ID,'
      '    :NAME,'
      '    :CODE,'
      '    :SDate,'
      '    :EDate,'
      '    :DatBegDoc,'
      '    :NumBegDoc,'
      '    :DatEndDoc,'
      '    :NumEndDoc,'
      '    :CODE2,'
      '    :IS_PREPAYMENTKBK,'
      '    :IS_FOR_REPORT'
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
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'SDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'EDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumBegDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DatEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NumEndDoc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IS_PREPAYMENTKBK'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IS_FOR_REPORT'
        ParamType = ptUnknown
      end>
  end
end
