inherited DictGridByPositionForm: TDictGridByPositionForm
  Left = 303
  Top = 184
  Height = 390
  Caption = #1055#1086#1079#1080#1094#1080#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 343
  end
  inherited dxBarDockControl1: TdxBarDockControl
    Top = 340
  end
  inherited pnlWorkspace: TPanel
    Top = 67
    Height = 273
    inherited splSearchCriteria: TSplitter
      Height = 273
    end
    inherited pnlSearchCriteria: TPanel
      Height = 273
      inherited lcSearchCriteria: TdxLayoutControl
        Height = 253
        inherited btnSearch: TcxButton
          Top = 221
        end
        inherited edtName: TcxTextEdit
          Width = 184
        end
      end
    end
    inherited pnlGrid: TPanel
      Height = 273
      inherited grdData: TcxGrid
        Height = 273
      end
    end
  end
  object pnlDictSelect: TPanel [3]
    Left = 0
    Top = 26
    Width = 586
    Height = 41
    Align = alTop
    TabOrder = 7
    object lcDictSelect: TdxLayoutControl
      Left = 1
      Top = 1
      Width = 584
      Height = 39
      Align = alClient
      TabOrder = 0
      AutoContentSizes = [acsWidth, acsHeight]
      LookAndFeel = LayoutOfficeLookAndFeel
      object ltvDictItem: TdxLookupTreeView
        Left = 74
        Top = 9
        Width = 145
        Height = 21
        CanSelectParents = True
        DropDownRows = 12
        ParentColor = False
        TabOrder = 0
        TabStop = True
        Text = '<'#1053#1077' '#1074#1099#1073#1088#1072#1085'>'
        TreeViewColor = clWindow
        TreeViewCursor = crDefault
        TreeViewFont.Charset = DEFAULT_CHARSET
        TreeViewFont.Color = clWindowText
        TreeViewFont.Height = -11
        TreeViewFont.Name = 'MS Sans Serif'
        TreeViewFont.Style = []
        TreeViewIndent = 19
        TreeViewReadOnly = True
        TreeViewShowButtons = True
        TreeViewShowHint = False
        TreeViewShowLines = True
        TreeViewShowRoot = True
        TreeViewSortType = stText
        OnCloseUp = ltvDictItemCloseUp
        OnGetSelectedIndex = ltvDictItemGetSelectedIndex
        OnKeyUp = ltvDictItemKeyUp
        DisplayField = 'NAME'
        DividedChar = '.'
        ImageIndexField = 'IMAGEINDEX'
        ListSource = srcDictItem
        KeyField = 'ID'
        ListField = 'NAME'
        Options = [trCheckHasChildren]
        ParentField = 'PARENT_OBJECT_TYPE_ID'
        RootValue = Null
        TextStyle = tvtsShort
        Alignment = taLeftJustify
      end
      object lcDictSelectGroup_Root: TdxLayoutGroup
        ShowCaption = False
        Hidden = True
        ShowBorder = False
        object lciDictItem: TdxLayoutItem
          Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082':'
          Control = ltvDictItem
          ControlOptions.ShowBorder = False
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited dsData: TfdcQuery
    SQL.Strings = (
      'select *'
      '  from fdc_Dict_Lst'
      ' where Object_Type_ID = :Type_ID and'
      '     (:Name is null or upper(NAME) like upper(:Name))')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Type_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object dsDictItem: TfdcQuery
    Session = MainData.Session
    ReadOnly = False
    SQL.Strings = (
      'select /*+first_rows*/'
      '          T.ID,'
      '          T.Name,'
      '          T.ShortName,'
      '          T.SysName,'
      '          T.TableName,          '
      '          T.Parent_Object_Type_ID             '
      '  from fdc_Object_Type_Lst T'
      'where fdc_Object_Type_Is_Subtype(T.SysName, '#39'Dict'#39') <> 0'
      '    and T.SysName <> '#39'Dict'#39
      'order by T.Parent_Object_Type_ID')
    SourceServerObject = 'FDC_OBJECT_TYPE_LST'
    OnCalcFields = dsDictItemCalcFields
    Left = 396
    Top = 89
    object dsDictItemID: TFloatField
      FieldName = 'ID'
    end
    object dsDictItemNAME: TStringField
      FieldName = 'NAME'
      Size = 1500
    end
    object dsDictItemSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 1500
    end
    object dsDictItemSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Size = 1500
    end
    object dsDictItemTABLENAME: TStringField
      FieldName = 'TABLENAME'
      Size = 1500
    end
    object dsDictItemPARENT_OBJECT_TYPE_ID: TFloatField
      FieldName = 'PARENT_OBJECT_TYPE_ID'
    end
    object dsDictItemIMAGEINDEX: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'IMAGEINDEX'
      Calculated = True
    end
  end
  object srcDictItem: TDataSource
    DataSet = dsDictItem
    Left = 364
    Top = 88
  end
end
