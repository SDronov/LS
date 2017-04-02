inherited DocPackReuseYForm: TDocPackReuseYForm
  Left = 349
  Top = 203
  Caption = #1056#1077#1077#1089#1090#1088' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1085#1099#1093' '#1087#1077#1088#1077#1079#1072#1095#1105#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Height = 91
        end
        inherited fdcSrcAppName: TfdcObjectLinkEdit
          Width = 586
        end
        inherited fdcDstAppName: TfdcObjectLinkEdit
          Width = 573
        end
        inherited cxDBIsTS: TcxDBCheckBox
          Caption = #1055#1088#1080#1079#1085#1072#1082' '#1058#1057
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lcGrpActivation: TdxLayoutGroup
            inherited lciIsTS: TdxLayoutItem
              Visible = True
            end
          end
        end
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
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 104
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
        AcceptedSources = [asField]
      end>
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_doc_pack_reuse_y_lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_DOC_PACK_REUSE_Y_LST'
    AfterInsert = dsDataAfterInsert
    object dsDataDATE_INCOMING: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
      FieldName = 'DATE_INCOMING'
    end
    object dsDataDESTINATION: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'DESTINATION'
      Size = 8
    end
  end
  inherited srcData: TDataSource
    Left = 332
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= fdc_docpack_reusey_add('
      '    pdocnumber => NULL,'
      '    pdocdate => :DOC_DATE,'
      '    pdestination => :DESTINATION,'
      '    pname => :NAME,'
      '    pdescript => :DESCRIPT,'
      '    preceiversoftcodeid => :RECEIVER_SOFT_CODE_ID,'
      '    pIsTS                       => :IS_TS);'
      'end;')
    SourceServerObject = 'FDC_DOCPACK_REUSEY_ADD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DOC_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESTINATION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RECEIVER_SOFT_CODE_ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IS_TS'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  fdc_docpack_reusey_upd('
      '    pdocid => :ID,'
      '    pdocnumber => :DOC_NUMBER,'
      '    pdocdate => :DOC_DATE,'
      '    pdestination => :DESTINATION,'
      '    pname => :NAME,'
      '    pdescript => :DESCRIPT,'
      '    preceiversoftcodeid => :RECEIVER_SOFT_CODE_ID);'
      'end;')
    SourceServerObject = 'FDC_DOCPACK_REUSEY_UPD'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptInput
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
        Name = 'DESTINATION'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'RECEIVER_SOFT_CODE_ID'
        ParamType = ptInput
      end>
  end
  inherited dsTransit: TfdcQuery
    SQL.Strings = (
      'select ID,'
      '       NAME,'
      '       DESCRIPT'
      '  from fdc_State_Transit_Lst'
      ' where State_Scheme_ID = :STATE_SCHEME_ID and'
      '       ('
      '         (SRC_STATE_ID is null and :ID is null) or'
      '         (SRC_STATE_ID = :ID)'
      '       )'
      '   AND 0 = 1')
  end
  inherited dsState: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_State_Lst_By_Object'
      ' where Object_ID = :ID'
      '    ')
  end
end
