inherited InteractSettingsForm: TInteractSettingsForm
  Left = 583
  Top = 214
  ActiveControl = edtName
  Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103': '#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Width = 423
        end
        inherited edtDescript: TcxDBMemo
          Top = 117
          TabOrder = 4
          Height = 142
          Width = 185
        end
        object edtCode: TcxDBTextEdit [2]
          Left = 60
          Top = 36
          DataBinding.DataField = 'CODE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 417
        end
        object edtType: TcxDBComboBox [3]
          Left = 60
          Top = 63
          DataBinding.DataField = 'TYPE'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077
            #1042#1085#1077#1096#1085#1077#1077)
          Properties.OnChange = Modify
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.PopupBorderStyle = epbsSingle
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 417
        end
        object edtSoft: TfdcObjectLinkEdit [4]
          Left = 60
          Top = 90
          DataBinding.DataField = 'SOFT_NAME'
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
          Style.Font.Charset = RUSSIAN_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.ButtonStyle = btsHotFlat
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 417
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciCodeEdit: TdxLayoutItem [1]
            AutoAligns = []
            AlignHorz = ahClient
            Caption = #1050#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
          object lciTypeEdit: TdxLayoutItem [2]
            Caption = #1058#1080#1087
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtType
            ControlOptions.ShowBorder = False
          end
          object lciSoftEdit: TdxLayoutItem [3]
            Caption = #1055#1054
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtSoft
            ControlOptions.ShowBorder = False
          end
        end
      end
    end
    object tabMsgTypes: TcxTabSheet
      Caption = #1050#1086#1076#1099' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
      ImageIndex = 2
      OnShow = tabMsgTypesShow
    end
    object tabQueues: TcxTabSheet
      Caption = #1054#1095#1077#1088#1077#1076#1080
      ImageIndex = 3
      OnShow = tabQueuesShow
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
        FloatLeft = 436
        FloatTop = 334
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
      '  from ASBC_INTERACT_lst'
      ' where ID = :ID')
    SourceServerObject = 'ASBC_INTERACT_lst'
    inherited dsDataNAME: TStringField
      Required = True
    end
    object dsDataCODE: TStringField
      FieldName = 'CODE'
      Required = True
    end
    object dsDataNTYPE: TIntegerField
      FieldName = 'NTYPE'
    end
    object dsDataTYPE: TStringField
      FieldName = 'TYPE'
      Required = True
    end
    object dsDataSOFT_ID: TIntegerField
      FieldName = 'SOFT_ID'
      Required = True
    end
    object dsDataSOFT_NAME: TStringField
      FieldName = 'SOFT_NAME'
      Size = 1000
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= P_ASBC_INTERACT.add(pname     => :NAME,'
      '                              pSOFT_ID  => :SOFT_ID,'
      '                              pcode     => :CODE,'
      '                              ptype     => :NTYPE,'
      '                              pdescript => :DESCRIPT);'
      'end;')
    SourceServerObject = 'P_ASBC_INTERACT'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SOFT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptInput
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_asbc_interact.modify(pdocid    => :id,'
      '                         pname     => :name,'
      '                         pcode     => :code,'
      '                         ptype     => :NTYPE,'
      '                         pSOFT_ID  => :SOFT_ID,'
      '                         pdescript => :descript);'
      'end;')
    SourceServerObject = 'P_ASBC_INTERACT'
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
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOFT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
