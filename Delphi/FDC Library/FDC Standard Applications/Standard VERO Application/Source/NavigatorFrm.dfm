inherited NavigatorForm: TNavigatorForm
  Left = 379
  Top = 229
  Width = 318
  Caption = #1053#1072#1074#1080#1075#1072#1090#1086#1088
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TdxTreeView [0]
    Left = 0
    Top = 0
    Width = 310
    Height = 314
    ShowNodeHint = True
    OnDragDropTreeNode = TreeViewDragDropTreeNode
    HotTrack = True
    BorderStyle = bsNone
    ShowLines = False
    ReadOnly = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    OnChange = TreeViewChange
    Align = alClient
    ParentColor = False
    Options = []
    SelectedIndex = -1
    TabOrder = 0
    OnStartDrag = TreeViewStartDrag
  end
end
