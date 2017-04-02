inherited RoleForm: TRoleForm
  Left = 407
  Top = 272
  Height = 382
  ActiveControl = nil
  Caption = #1056#1086#1083#1100' '#1076#1086#1089#1090#1091#1087#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcMain: TcxPageControl
    Height = 355
    ClientRectBottom = 331
    inherited tabGeneral: TcxTabSheet
      inherited lcGeneral: TdxLayoutControl
        Height = 302
        inherited edtName: TcxDBTextEdit
          Left = 78
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.Color = clSilver
          Style.IsFontAssigned = True
          Width = 296
        end
        inherited edtDescript: TcxDBMemo
          Left = 78
          Top = 63
          TabOrder = 2
          Height = 130
          Width = 186
        end
        object cmbxROLE_NAME: TcxDBLookupComboBox [2]
          Left = 78
          Top = 36
          DataBinding.DataField = 'ROLE_NAME'
          DataBinding.DataSource = srcData
          ParentFont = False
          Properties.ClearKey = 46
          Properties.KeyFieldNames = 'ROLE_NAME'
          Properties.ListColumns = <
            item
              FieldName = 'ROLE_NAME'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.CaseInsensitive = True
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = srcOraRole
          Properties.OnChange = Modify
          Properties.OnInitPopup = cmbxROLE_NAMEPropertiesInitPopup
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
          TabOrder = 1
          Width = 232
        end
        inherited dxLayoutGroup1: TdxLayoutGroup
          object lciRole_NameEdit: TdxLayoutItem [1]
            Caption = #1056#1086#1083#1100' Oracle *'
            CaptionOptions.AlignHorz = taRightJustify
            Control = cmbxROLE_NAME
            ControlOptions.ShowBorder = False
          end
          inherited lciDescriptEdit: TdxLayoutItem
            CaptionOptions.AlignVert = tavCenter
          end
        end
      end
      inherited dxBarDockControlLeft: TdxBarDockControl
        Height = 302
      end
      inherited dxBarDockControlBottom: TdxBarDockControl
        Top = 328
      end
      inherited dxBarDockControlRight: TdxBarDockControl
        Height = 302
      end
    end
    inherited tabService: TcxTabSheet
      inherited pcService: TcxPageControl
        Height = 331
        ClientRectBottom = 307
      end
    end
    object tabRoleUser: TcxTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1088#1086#1083#1080
      ImageIndex = 2
      OnShow = tabRoleUserShow
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
        DockControl = dxBarDockControlTop
        DockedDockControl = dxBarDockControlTop
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 322
        FloatTop = 261
        FloatClientWidth = 129
        FloatClientHeight = 51
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
      '  from fdc_role_Lst'
      ' where ID = :ID')
    SourceServerObject = 'FDC_ROLE_LST'
    object dsDataROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Size = 32
    end
  end
  inherited dsInsert: TfdcQuery
    SQL.Strings = (
      'begin'
      '  :ID ::= p_role.Add'
      '  ('
      '    prole_name => :ROLE_NAME'
      '  ,pobjecttypesysname => :TYPESYSNAME '
      '  ,pdescript => :DESCRIPT'
      '  );'
      'end;')
    SourceServerObject = 'p_role'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ROLE_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TYPESYSNAME'
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
      ' p_role.update_object'
      '  ('
      '    pobjectid  => :ID'
      '   ,pdescript  => :DESCRIPT'
      '  );'
      'end;')
    SourceServerObject = 'p_role'
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DESCRIPT'
        ParamType = ptUnknown
      end>
  end
  object dsOraRole: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select role role_name'
      'from dba_roles'
      'order by 1')
    SourceServerObject = 'dba_roles'
    Left = 147
    Top = 219
    object dsOraRoleROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Size = 64
    end
  end
  object srcOraRole: TDataSource
    DataSet = dsOraRole
    Left = 227
    Top = 219
  end
end
