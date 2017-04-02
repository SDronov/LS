{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: fdcDBTreeView.pas $
  $Revision: 4057 $
  $Author: dnovokshonov $
  $Date: 2007-12-20 16:46:32 +0400 (Чт, 20 дек 2007) $
}
unit fdcDBTreeView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DB, Oracle, FDCQuery;

{$WARN HIDDEN_VIRTUAL OFF}
  
type
  TfdcDBTreeView = class;

  TfdcDBNodeMapEntry = class;
  TfdcDBNodeMap = class;

  TfdcDBNode = class(TComponent)
  private
    fID: double;
    fText: string;

    fParams: TParams;
    fTreeNode: TTreeNode;

    fHasChildren: boolean;
    fChildrenLoaded: boolean;
    fChildren: TComponent;
    fParent: TfdcDBNode;
    fTree: TfdcDBTreeView;

    function GetChild(i: integer): TfdcDBNode;
    function GetChildCount: integer;
    function GetParent: TfdcDBNode;
    procedure SetTreeNode(const Value: TTreeNode);

  public
    constructor Create(anOwner: TComponent; aTree: TfdcDBTreeView);
    destructor Destroy; override;

    property ID: double read fID;
    property Text: string read fText;

    property Params: TParams read fParams;
    function ParamByName(ParamName: string): TParam;

    property Tree: TfdcDBTreeView read fTree;
    property TreeNode: TTreeNode read fTreeNode write SetTreeNode;

    property Parent: TfdcDBNode read GetParent;
    property HasChildren: boolean read fHasChildren;
    property ChildrenLoaded: boolean read fChildrenLoaded;
    property Children: TComponent read fChildren;
    property Child[i: integer]: TfdcDBNode read GetChild; default;
    property ChildCount: integer read GetChildCount;
    procedure LoadChildren;
    procedure ClearChildren;
    procedure ReLoadChildren;
    procedure FullLoad;

    procedure LoadFrom(q: TFDCQuery);

    procedure Expand;
    procedure FindInMap(m: TfdcDBNodeMap; me: TfdcDBNodeMapEntry);
  end;

  TfdcDBNodeMapEntry = class(TComponent)
  private
    fID: double;
    fExpanded: boolean;
    fSelected: boolean;
    function GetChild(i: integer): TfdcDBNodeMapEntry;
    function GetChildCount: integer;
    function GetTotalChildCount: integer;
  public
    property ID: double read fID;
    property Expanded: boolean read fExpanded;
    property Selected: boolean read fSelected;

    property Child[i: integer]: TfdcDBNodeMapEntry read GetChild; default;
    property ChildCount: integer read GetChildCount;
    property TotalChildCount: integer read GetTotalChildCount;

    procedure AddChildren(ipn: TfdcDBNode);

  end;

  TfdcDBNodeMap = class(TComponent)
  private
    function GetChild(i: integer): TfdcDBNodeMapEntry;
    function GetChildCount: integer;
    function GetTotalChildCount: integer;
  public
    property Child[i: integer]: TfdcDBNodeMapEntry read GetChild; default;
    property ChildCount: integer read GetChildCount;
    property TotalChildCount: integer read GetTotalChildCount;

    procedure Add(ipn: TfdcDBNode);
    procedure AddChildren(ipn: TfdcDBNode);
  end;

  TGetQueryStringEvent = procedure(Sender: TObject; fdcDBNode: TfdcDBNode; var
    QueryString: string) of object;
  TQueryBeforeOpenEvent = procedure(Sender: TObject; fdcDBNode: TfdcDBNode;
    Query: TFDCQuery) of object;

  TfdcDBTreeView = class(TTreeView)
  private
    fSession: TOracleSession;
    fNodes: TComponent;
    fDefaultSQL: TStringList;
    fDefaultParams: TParams;
    fIDField: string;
    fTextField: string;
    fHasChildrenField: string;

    fOnGetQueryString: TGetQueryStringEvent;
    fQueryBeforeOpen: TQueryBeforeOpenEvent;

    function GetCurNode: TfdcDBNode;
    function GetCount: integer;
    function GetNode(i: integer): TfdcDBNode;
    function GetDefaultSQL: TStrings;
    procedure SetDefaultSQL(const Value: TStrings);
    procedure SetDefaultParams(const Value: TParams);

  protected
    procedure FillRoots;
    function OpenQuery(aNode: TfdcDBNode): TFDCQuery;
    function CanExpand(Node: TTreeNode): Boolean; override;
  public
    property Node[i: integer]: TfdcDBNode read GetNode;
    property Count: integer read GetCount;

    procedure Open;
    property CurNode: TfdcDBNode read GetCurNode;
    procedure Clear;
    procedure ReloadChildren(ipn: TfdcDBNode);
    procedure FullLoad(DoFullExpand: boolean = false);

  published
    constructor Create(anOwner: TComponent); override;
    destructor Destroy; override;
    property Session: TOracleSession read fSession write fSession;
    property DefaultSQL: TStrings read GetDefaultSQL write SetDefaultSQL;
    property DefaultParams: TParams read fDefaultParams write SetDefaultParams;
    property IDField: string read fIDField write fIDField;
    property TextField: string read fTextField write fTextField;
    property HasChildrenField: string read fHasChildrenField write
      fHasChildrenField;

    property OnGetQueryString: TGetQueryStringEvent read fOnGetQueryString write
      fOnGetQueryString;
    property QueryBeforeOpen: TQueryBeforeOpenEvent read fQueryBeforeOpen write
      fQueryBeforeOpen;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FDC', [TfdcDBTreeView]);
end;

{ TfdcDBNode }

procedure TfdcDBNode.ClearChildren;
var
  i: integer;
  l: TList;
begin
  if not ChildrenLoaded then
    exit;
  l := TList.create;
  Tree.Items.BeginUpdate;
  try
    for i := 0 to ChildCount - 1 do
      l.add(Child[i]);

    for i := 0 to l.Count - 1 do
    begin

      if TfdcDBNode(l[i]).TreeNode <> nil then
      begin
        TfdcDBNode(l[i]).TreeNode.free;
        TfdcDBNode(l[i]).TreeNode := nil;
      end;
    end;
    fChildren.DestroyComponents;
  finally
    Tree.Items.EndUpdate;
    l.free;
  end;
  fChildrenLoaded := false;
end;

constructor TfdcDBNode.Create(anOwner: TComponent; aTree: TfdcDBTreeView);
begin
  inherited Create(anOwner);
  fTree := aTree;
  fChildren := TComponent.create(self);
  fParams := TParams.create(self);
end;

destructor TfdcDBNode.Destroy;
begin
  fParams.free;
  inherited;
end;

procedure TfdcDBNode.Expand;
begin
  if (TreeNode <> nil) and (not TreeNode.Expanded) then
    TreeNode.Expand(false);
end;

procedure TfdcDBNode.FindInMap(m: TfdcDBNodeMap; me: TfdcDBNodeMapEntry);
var
  i: integer;
  sme: TfdcDBNodeMapEntry;
begin
  sme := nil;
  if me <> nil then
  begin
    for i := 0 to me.ChildCount - 1 do
    begin
      if (me[i].ID = ID) then
      begin
        sme := me[i];
        break;
      end;
    end;
  end
  else
  begin
    for i := 0 to m.ChildCount - 1 do
    begin
      if (m[i].ID = ID) then
      begin
        sme := m[i];
        break;
      end;
    end;
  end;

  if sme = nil then
    exit;

  if sme.Expanded and HasChildren then
  begin
    LoadChildren;
    Expand;
    for i := 0 to ChildCount - 1 do
    begin
      Child[i].FindInMap(nil, sme);
    end;
  end;

  if sme.fSelected and (Tree <> nil) and (TreeNode <> nil) then
    Tree.Selected := TreeNode;
  sme.free;
end;

procedure TfdcDBNode.FullLoad;
var
  i: integer;
begin
  LoadChildren;
  for i := 0 to ChildCount - 1 do
    Child[i].FullLoad;
end;

function TfdcDBNode.GetChild(i: integer): TfdcDBNode;
begin
  if not fChildrenLoaded then
    LoadChildren;
  if (i < 0) or (i > (ChildCount - 1)) then
    result := nil
  else
    result := fChildren.Components[i] as TfdcDBNode;
end;

function TfdcDBNode.GetChildCount: integer;
begin
  if not fChildrenLoaded then
    LoadChildren;
  result := fChildren.componentCount;
end;

function TfdcDBNode.GetParent: TfdcDBNode;
begin
  if owner is TfdcDBNode then
    result := owner as TfdcDBNode
  else
    result := nil;
end;

procedure TfdcDBNode.LoadChildren;
var
  q: TFDCQuery;
  n: TfdcDBNode;
begin
  if fChildrenLoaded then
    exit;
  q := Tree.OpenQuery(self);
  Tree.Items.BeginUpdate;
  try
    while not q.EOF do
    begin
      n := TfdcDBNode.create(fChildren, Tree);
      n.LoadFrom(q);
      n.TreeNode := Tree.Items.AddChildObject(self.TreeNode, '', nil);
      n.fParent := self;
      q.Next;
    end;
  finally
    Tree.Items.EndUpdate;
    q.free;
  end;
  fChildrenLoaded := true;
end;

procedure TfdcDBNode.LoadFrom(q: TFDCQuery);
var
  i: integer;
begin
  for i := 0 to q.FieldCount - 1 do
  begin
    Params.CreateParam(q.fields[i].DataType, q.fields[i].FieldName,
      ptUnknown).Value := q.fields[i].Value;

    if (UpperCase(q.Fields[i].FieldName) = UpperCase(Tree.IDField)) and
      (q.Fields[i] is TNumericField) then
      fID := q.Fields[i].Value;
    if (UpperCase(q.Fields[i].FieldName) = UpperCase(Tree.TextField)) and
      (q.Fields[i] is TStringField) then
      fText := q.Fields[i].Value;
    if (UpperCase(q.Fields[i].FieldName) = UpperCase(Tree.HasChildrenField)) and
      (q.Fields[i] is TNumericField) then
      fHasChildren := (q.Fields[i].Value > 0);
  end;
end;

function TfdcDBNode.ParamByName(ParamName: string): TParam;
begin
  result := Params.ParamByName(ParamName);
end;

procedure TfdcDBNode.ReLoadChildren;
var
  map: TfdcDBNodeMap;
  i: integer;
begin

  map := TfdcDBNodeMap.create(self);
  Tree.Items.BeginUpdate;
  try
    map.AddChildren(self);
    ClearChildren;
    LoadChildren;
    for i := 0 to ChildCount - 1 do
    begin
      Child[i].FindInMap(map, nil);
    end;

  finally
    Tree.Items.EndUpdate;
    map.free;
  end;
end;

procedure TfdcDBNode.SetTreeNode(const Value: TTreeNode);
begin
  fTreeNode := Value;
  if fTreeNode = nil then
    exit;
  TreeNode.Text := Text;
  TreeNode.HasChildren := HasChildren;
  TreeNode.Data := self;
end;

{ TfdcDBTreeView }

constructor TfdcDBTreeView.Create(anOwner: TComponent);
begin
  inherited;
  fNodes := TComponent.create(self);
  fDefaultSQL := TStringList.create;
  fDefaultParams := TParams.create(self);
  fIDField := 'ID';
  fTextField := 'Name';
  fHasChildrenField := 'HasChildren';
end;

function TfdcDBTreeView.OpenQuery(aNode: TfdcDBNode): TFDCQuery;
var
  q: TFDCQuery;
  sql: string;
  i: integer;
  p: TParam;
begin
  q := TFDCQuery.create(self);
  try
    q.Session := Session;
    q.AutoCommit := False;
    sql := DefaultSQL.text;
    if Assigned(fOnGetQueryString) then
      OnGetQueryString(self, aNode, sql);
    q.SQL.Text := sql;

    for i := 0 to q.Params.Count - 1 do
    begin
      p := nil;

      if aNode <> nil then // try to find param in parent node
        p := aNode.Params.FindParam(q.Params[i].Name);

      if p = nil then // try to find param in default params
        p := fDefaultParams.FindParam(q.Params[i].Name);

      if p <> nil then
      begin
        if q.Params[i].DataType = ftUnknown then
          q.Params[i].DataType := p.DataType;
        q.Params[i].Value := p.Value;
      end
      else
        q.Params[i].Clear;
    end;

    if Assigned(fQueryBeforeOpen) then
      QueryBeforeOpen(self, aNode, q);

    q.open;
  except
    begin
      q.free;
      raise;
    end;
  end;
  result := q;
end;

procedure TfdcDBTreeView.FillRoots;
var
  q: TFDCQuery;
  n: TfdcDBNode;
begin
  q := OpenQuery(nil);
  Items.BeginUpdate;
  try
    while not q.EOF do
    begin
      n := TfdcDBNode.create(fNodes, self);
      n.LoadFrom(q);
      n.TreeNode := Items.AddObject(nil, '', nil);
      q.Next;
    end;
  finally
    q.free;
    Items.EndUpdate;
  end;
end;

function TfdcDBTreeView.GetCurNode: TfdcDBNode;
begin
  result := nil;
  if (self.Selected <> nil) and (self.Selected.Data <> nil) and
    (TObject(self.Selected.Data) is TfdcDBNode) then
    result := TObject(self.Selected.Data) as TfdcDBNode;
end;

procedure TfdcDBTreeView.Open;
begin
  FillRoots;
end;

function TfdcDBTreeView.CanExpand(Node: TTreeNode): Boolean;
begin
  Result := False;
  if (csDesigning in ComponentState) then
    Exit;
  Result := inherited CanExpand(Node);
  if (CurNode = nil) or (not Result) then
    exit;
  CurNode.LoadChildren;
  Result := True;
end;

procedure TfdcDBTreeView.Clear;
begin
  if not (csDestroying in ComponentState) then
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      fNodes.DestroyComponents;
    finally Items.EndUpdate;
    end;
  end;
end;

procedure TfdcDBTreeView.ReloadChildren(ipn: TfdcDBNode);
var
  map: TfdcDBNodeMap;
  i: integer;
begin

  if ipn <> nil then
  begin
    ipn.ReLoadChildren;
    exit;
  end;

  map := TfdcDBNodeMap.create(self);
  Items.BeginUpdate;
  try
    for i := 0 to Count - 1 do
      map.Add(Node[i]);

    Clear;
    Open;
    for i := 0 to Count - 1 do
      Node[i].FindInMap(map, nil);

  finally
    Items.EndUpdate;
    map.free;
  end;
end;

function TfdcDBTreeView.GetCount: integer;
begin
  result := fNodes.ComponentCount;
end;

function TfdcDBTreeView.GetNode(i: integer): TfdcDBNode;
begin
  result := (fNodes.Components[i] as TfdcDBNode);
end;

destructor TfdcDBTreeView.Destroy;
begin
  fDefaultSQL.free;
  fDefaultSQL := nil;
  fDefaultParams.free;
  fDefaultParams := nil;
  inherited;
end;

function TfdcDBTreeView.GetDefaultSQL: TStrings;
begin
  result := fDefaultSQL;
end;

procedure TfdcDBTreeView.SetDefaultSQL(const Value: TStrings);
begin
  fDefaultSQL.Assign(Value);
end;

procedure TfdcDBTreeView.SetDefaultParams(const Value: TParams);
begin
  fDefaultParams.AssignValues(Value);
end;

procedure TfdcDBTreeView.FullLoad(DoFullExpand: boolean = false);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Node[i].FullLoad;
  if DoFullExpand then
    FullExpand;
end;

{ TfdcDBNodeMap }

procedure TfdcDBNodeMap.Add(ipn: TfdcDBNode);
var
  e: TfdcDBNodeMapEntry;
begin
  if not ipn.ChildrenLoaded then
    exit;

  e := TfdcDBNodeMapEntry.create(self);
  e.fID := ipn.ID;
  e.fExpanded := (ipn.TreeNode <> nil) and (ipn.TreeNode.Expanded);
  e.AddChildren(ipn);
  e.fSelected := (ipn.Tree <> nil) and (ipn.Tree.CurNode = ipn);
end;

procedure TfdcDBNodeMap.AddChildren(ipn: TfdcDBNode);
var
  i: integer;
  e: TfdcDBNodeMapEntry;
begin
  if not ipn.ChildrenLoaded then
    exit;
  for i := 0 to ipn.ChildCount - 1 do
  begin
    e := TfdcDBNodeMapEntry.create(self);
    e.fID := ipn[i].ID;
    e.fExpanded := (ipn[i].TreeNode <> nil) and (ipn[i].TreeNode.Expanded);
    e.AddChildren(ipn[i]);
    e.fSelected := (ipn[i].Tree <> nil) and (ipn.Tree.CurNode = ipn[i]);
  end;
end;

function TfdcDBNodeMap.GetChild(i: integer): TfdcDBNodeMapEntry;
begin
  result := components[i] as TfdcDBNodeMapEntry;
end;

function TfdcDBNodeMap.GetChildCount: integer;
begin
  result := ComponentCount;
end;

function TfdcDBNodeMap.GetTotalChildCount: integer;
var
  i: integer;
begin
  result := ChildCount;
  for i := 0 to ChildCount - 1 do
  begin
    result := result + Child[i].TotalChildCount;
  end;
end;

{ TfdcDBNodeMapEntry }

procedure TfdcDBNodeMapEntry.AddChildren(ipn: TfdcDBNode);
var
  i: integer;
  e: TfdcDBNodeMapEntry;
begin
  if (ipn = nil) or (not ipn.ChildrenLoaded) then
    exit;
  for i := 0 to ipn.ChildCount - 1 do
  begin
    e := TfdcDBNodeMapEntry.create(self);
    e.fID := ipn[i].ID;
    e.fExpanded := (ipn[i].TreeNode <> nil) and (ipn[i].TreeNode.Expanded);
    e.AddChildren(ipn[i]);
    e.fSelected := (ipn[i].Tree <> nil) and (ipn.Tree.CurNode = ipn[i]);
  end;
end;

function TfdcDBNodeMapEntry.GetChild(i: integer): TfdcDBNodeMapEntry;
begin
  result := components[i] as TfdcDBNodeMapEntry;
end;

function TfdcDBNodeMapEntry.GetChildCount: integer;
begin
  result := ComponentCount;
end;

function TfdcDBNodeMapEntry.GetTotalChildCount: integer;
var
  i: integer;
begin
  result := ChildCount;
  for i := 0 to ChildCount - 1 do
  begin
    result := result + Child[i].TotalChildCount;
  end;
end;

end.

