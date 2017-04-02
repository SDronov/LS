inherited TaskListForm: TTaskListForm
  Left = 538
  Top = 420
  Caption = 'TaskListForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object barNavigator: TdxNavBar [0]
    Left = 0
    Top = 0
    Width = 432
    Height = 310
    Align = alClient
    ActiveGroupIndex = -1
    DragCopyCursor = -1119
    DragCursor = -1120
    DragDropFlags = []
    HotTrackedGroupCursor = crDefault
    HotTrackedLinkCursor = -1118
    View = 11
    OnLinkClick = barNavigatorLinkClick
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
  object dsTaskList: TfdcQuery
    ReadOnly = False
    SQL.Strings = (
      'select /*+  FIRST_ROWS NO_CONNECT_BY_COST_BASED */ level, t.*'
      '  from fdc_task_group_lst t'
      '         where  code2 is not null'
      'connect by OWNER_object_ID = prior ID'
      ' start with OWNER_object_ID is null'
      'order siblings by code2')
    Left = 208
    Top = 16
  end
end
