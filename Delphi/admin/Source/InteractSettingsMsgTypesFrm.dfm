inherited InteractSettingsMsgTypesForm: TInteractSettingsMsgTypesForm
  Left = 701
  Top = 332
  ActiveControl = edtCode
  Caption = #1050#1086#1076#1099' '#1074#1079#1072#1080#1084#1086#1076#1077#1081#1089#1090#1074#1080#1103' ('#1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077')'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        inherited edtName: TcxDBTextEdit
          Left = 140
          Top = 60
          TabOrder = 2
          Width = 337
        end
        inherited edtDescript: TcxDBMemo
          Left = 140
          Top = 141
          TabOrder = 5
          Height = 89
          Width = 185
        end
        object edtDirection: TcxDBComboBox [2]
          Left = 140
          Top = 87
          DataBinding.DataField = 'DIRECTION'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1042#1093#1086#1076#1103#1097#1077#1077
            #1048#1089#1093#1086#1076#1103#1097#1077#1077)
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
          TabOrder = 3
          Width = 337
        end
        object edtExecProc: TcxDBTextEdit [3]
          Left = 140
          Top = 114
          DataBinding.DataField = 'EXECPROC'
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
          TabOrder = 4
          Width = 337
        end
        object edtCode: TcxDBTextEdit [4]
          Left = 140
          Top = 33
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
          Width = 337
        end
        object viewOwner: TcxDBTextEdit [5]
          Left = 140
          Top = 9
          DataBinding.DataField = 'OWNER_OBJECT_ID'
          DataBinding.DataSource = srcData
          Enabled = False
          ParentFont = False
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebsSingle
          Style.HotTrack = False
          TabOrder = 0
          Width = 121
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lcOwnerView: TdxLayoutItem [0]
            Caption = 'owner_object_id'
            CaptionOptions.AlignHorz = taRightJustify
            Visible = False
            Control = viewOwner
            ControlOptions.ShowBorder = False
          end
          object lciCodeEdit: TdxLayoutItem [1]
            Caption = #1050#1086#1076
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtCode
            ControlOptions.ShowBorder = False
          end
          inherited lciNameEdit: TdxLayoutItem
            Visible = False
          end
          object lciDirectionEdit: TdxLayoutItem [3]
            Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtDirection
            ControlOptions.ShowBorder = False
          end
          object lciExecProcEdit: TdxLayoutItem [4]
            Caption = #1056#1077#1072#1083#1080#1079#1091#1102#1097#1072#1103' '#1087#1088#1086#1094#1077#1076#1091#1088#1072
            CaptionOptions.AlignHorz = taRightJustify
            Control = edtExecProc
            ControlOptions.ShowBorder = False
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
      '  from ASBC_INTERACTMSGTYPES_LST'
      ' where ID = :ID')
    SourceServerObject = 'ASBC_INTERACTMSGTYPES_LST'
    inherited dsDataDESCRIPT: TStringField
      LookupDataSet = dsAccessLevel
      Required = True
    end
    inherited dsDataOWNER_OBJECT_ID: TFloatField
      Required = True
    end
    object dsDataCODE: TStringField
      FieldName = 'CODE'
      Required = True
    end
    object dsDataDIRECTION: TStringField
      FieldName = 'DIRECTION'
      Required = True
    end
    object dsDataNDIRECTION: TIntegerField
      FieldName = 'NDIRECTION'
    end
    object dsDataEXECPROC: TStringField
      FieldName = 'EXECPROC'
      Size = 100
    end
    object dsDataowner_name: TStringField
      FieldName = 'owner_name'
      Size = 1000
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_asbc_interactmsgtypes.add(pname      => :name,'
      
        '                                     pOwner_Object_ID     => :Ow' +
        'ner_object_id,'
      '                                     pcode      => :code,'
      '                                     pdirection => :ndirection,'
      '                                     pexecproc  => :execproc,'
      '                                     pdescript  => :descript);'
      'end;')
    SourceServerObject = 'p_asbc_interactmsgtypes'
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
        DataType = ftFloat
        Name = 'Owner_object_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ndirection'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'execproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  inherited dsUpdate: TfdcQuery
    SQL.Strings = (
      'begin'
      '  p_asbc_interactmsgtypes.modify(pdocid     => :ID,'
      '                                 pname      => :name,'
      '                                 pcode      => :code,'
      '                                 pdirection => :ndirection,'
      '                                 pexecproc  => :execproc,'
      '                                 pdescript  => :descript);'
      'end;')
    SourceServerObject = 'p_asbc_interactmsgtypes'
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
        Name = 'ndirection'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'execproc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
end
