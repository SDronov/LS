inherited DictPathDocpackForm: TDictPathDocpackForm
  Left = 732
  Width = 578
  Height = 418
  ActiveControl = nil
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Width = 562
    Height = 380
    ClientRectBottom = 356
    ClientRectRight = 562
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Top = 3
        Width = 556
        Height = 350
        inherited edtName: TcxDBTextEdit
          Left = 145
          Width = 424
        end
        inherited edtDescript: TcxDBMemo
          Left = 145
          Top = 217
          TabOrder = 8
          Height = 135
          Width = 185
        end
        object editCustoms: TfdcObjectLinkEdit [2]
          Left = 145
          Top = 34
          DataBinding.DataField = 'CUSTOM_NAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'CUSTOMS_ID'
          DataBinding.TypeSysName = 'Customs'
          DataBinding.SearchFormClass = 'TTargetCustomsGridForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 1
          Width = 423
        end
        object editSoft: TfdcObjectLinkEdit [3]
          Left = 145
          Top = 61
          DataBinding.DataField = 'SOFTNAME'
          DataBinding.DataSource = srcData
          DataBinding.DataKeyField = 'SOFT_ID'
          DataBinding.TypeSysName = 'Dict.SoftCode'
          DataBinding.SearchFormClass = 'TDictGridExForm'
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 2
          Width = 423
        end
        object editPathOut: TcxDBButtonEdit [4]
          Left = 145
          Top = 88
          DataBinding.DataField = 'CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = editPathPropertiesButtonClick
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 3
          Width = 121
        end
        object editPathIn: TcxDBButtonEdit [5]
          Left = 145
          Top = 115
          DataBinding.DataField = 'CODE2'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.OnButtonClick = editPathInPropertiesButtonClick
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          TabOrder = 4
          Width = 121
        end
        inherited edtCode: TcxDBTextEdit
          Left = 145
          Top = 142
          DataBinding.DataField = ''
          DataBinding.DataSource = nil
          TabOrder = 5
          Width = 121
        end
        inherited edtFullCode: TcxDBTextEdit
          Left = 145
          Top = 167
          TabOrder = 6
          Width = 121
        end
        inherited edtOwnerID: TfdcObjectLinkEdit
          Left = 145
          Top = 192
          TabOrder = 7
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          inherited lciNameEdit: TdxLayoutItem
            Tag = 22
          end
          object lciCustoms: TdxLayoutItem [1]
            Tag = 13
            Caption = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
            CaptionOptions.AlignHorz = taRightJustify
            Control = editCustoms
            ControlOptions.ShowBorder = False
          end
          object lciSoft: TdxLayoutItem [2]
            Tag = 13
            Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = editSoft
            ControlOptions.ShowBorder = False
          end
          object lciPathOut: TdxLayoutItem [3]
            Caption = #1048#1089#1093#1086#1076#1103#1097#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = editPathOut
            ControlOptions.ShowBorder = False
          end
          object lciPathIn: TdxLayoutItem [4]
            Caption = #1042#1093#1086#1076#1103#1097#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = editPathIn
            ControlOptions.ShowBorder = False
          end
          inherited lciCode: TdxLayoutItem
            Tag = 22
          end
          inherited lciFullCode: TdxLayoutItem
            Tag = 22
          end
          inherited lciOwnerID: TdxLayoutItem
            Tag = 22
          end
        end
      end
      inherited dxBarDockControlTop: TdxBarDockControl
        Width = 562
        Height = 3
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Top = 3
        Height = 350
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 353
        Width = 562
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Left = 559
        Top = 3
        Height = 350
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Width = 562
        Height = 356
        ClientRectBottom = 332
        ClientRectRight = 562
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
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsNone
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
    SQL.Strings = (
      'select *'
      '  from fdc_dict_path_docpack_lst'
      ' where ID = :ID')
    inherited dsDataNAME: TStringField
      Required = False
    end
    inherited dsDataCODE: TStringField
      DisplayLabel = #1055#1091#1090#1100
    end
    object dsDataEXT_SOURCE: TStringField
      FieldName = 'EXT_SOURCE'
      Size = 8
    end
    object dsDataEXT_TYPESYSNAME: TStringField
      FieldName = 'EXT_TYPESYSNAME'
      Size = 1500
    end
    object dsDataEXT_ID: TFloatField
      FieldName = 'EXT_ID'
    end
    object dsDataCUSTOMS_ID: TFloatField
      DisplayLabel = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
      FieldName = 'CUSTOMS_ID'
      Required = True
    end
    object dsDataSOFT_ID: TFloatField
      DisplayLabel = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      FieldName = 'SOFT_ID'
      Required = True
    end
    object dsDataSOFTNAME: TStringField
      DisplayLabel = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1086#1077' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1077
      FieldName = 'SOFTNAME'
      Required = True
      Size = 1500
    end
    object dsDataSOFTCODE: TStringField
      FieldName = 'SOFTCODE'
      Size = 1500
    end
    object dsDataCUSTOM_NAME: TStringField
      DisplayLabel = #1058#1072#1084#1086#1078#1077#1085#1085#1099#1081' '#1086#1088#1075#1072#1085
      FieldName = 'CUSTOM_NAME'
      Required = True
      Size = 1500
    end
    object dsDataCUSTOMS_CODE_8: TStringField
      FieldName = 'CUSTOMS_CODE_8'
      Size = 8
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_dict_path_docpack.add'
      '    ('
      '      pcustoms_id => :customs_id'
      '     ,psoft_id    => :soft_id'
      '     ,pcode       => :code'
      '     ,pcode2      => :code2'
      '     ,pdescript   => :descript'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUSTOMS_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'soft_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'code2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_dict_path_docpack.modify'
      '    ('
      '      pobjid      => :id'
      '     ,pcode       => :code'
      '     ,pcode2      => :code2'
      '     ,pname       => :name'
      '     ,pdescript   => :descript'
      '     ,psysname    => :sysname'
      '    );'
      'end;')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'code2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sysname'
        ParamType = ptUnknown
      end>
  end
end
