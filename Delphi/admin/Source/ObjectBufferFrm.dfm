inherited ObjectBufferForm: TObjectBufferForm
  Left = 408
  Top = 244
  Width = 316
  Caption = #1041#1091#1092#1077#1088' '#1086#1073#1098#1077#1082#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TdxTreeView [0]
    Left = 0
    Top = 0
    Width = 308
    Height = 314
    ShowNodeHint = True
    OnDragDropTreeNode = TreeViewDragDropTreeNode
    BorderStyle = bsNone
    ShowLines = False
    ShowRoot = False
    ReadOnly = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    Align = alClient
    ParentColor = False
    Options = []
    SelectedIndex = -1
    TabOrder = 0
    OnDragDrop = TreeViewDragDrop
    OnDragOver = TreeViewDragOver
    OnStartDrag = TreeViewStartDrag
    OnMouseDown = TreeViewMouseDown
    OnDblClick = TreeViewDblClick
  end
end
