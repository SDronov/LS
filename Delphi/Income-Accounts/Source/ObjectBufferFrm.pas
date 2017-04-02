{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: ObjectBufferFrm.pas $
  $Revision: 6 $
  $Author: alexvolo $
  $Date: 2005-07-18 17:48:53 +0400 (Пн, 18 июл 2005) $
}
unit ObjectBufferFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomFrm, ComCtrls, dxtree, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, fdcObjectCore, fdcObjectServices,
  ActnList;

type
  { TObjectBufferForm }
  TObjectBufferForm = class(TfdcCustomForm)
    TreeView: TdxTreeView;
    procedure TreeViewStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeViewDragDropTreeNode(Destination, Source: TTreeNode;
      var Accept: Boolean);
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { IfdcObjectServices interface reference }
    FObjectServices: IfdcObjectServices;
    { internal drag object }
    InternalDragObject: TfdcDragObject;

    function GetCurObject: TfdcObject;
    function FindObjectNode(AObject: TfdcObject): TTreeNode;
    function GetObjects(i: integer): TfdcObject;
    function GetObjectsCount: integer;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AutoSaveLayout: boolean; override;

    function AddObject(AObject: TfdcObject): TTreeNode;
    procedure AddObjects(AObjects: TfdcObjectList);
    function GetDragObject(ASender: TObject): TfdcDragObject;
    procedure RemoveCurObject;
    procedure Clear;

    property CurObject: TfdcObject read GetCurObject;
    property ObjectsCount: integer read GetObjectsCount;
    property Objects[i: integer]: TfdcObject read GetObjects;
    property ObjectServices: IfdcObjectServices read FObjectServices write FObjectServices;
  end;

var
  ObjectBufferForm: TObjectBufferForm;

implementation

{$R *.dfm}

{ TObjectBufferForm }

constructor TObjectBufferForm.Create(AOwner: TComponent);
begin
  inherited;
  InternalDragObject := TfdcDragObject.Create;
end;

destructor TObjectBufferForm.Destroy;
begin
  InternalDragObject.Free;
  inherited;
end;

function TObjectBufferForm.AutoSaveLayout: boolean;
begin
  Result := False;
end;

function TObjectBufferForm.GetCurObject: TfdcObject;
begin
  if Assigned(TreeView.Selected) and
     (TObject(TreeView.Selected.Data) is TfdcObject) then
    Result := TObject(TreeView.Selected.Data) as TfdcObject
  else
    Result := nil;
end;

function TObjectBufferForm.FindObjectNode(AObject: TfdcObject): TTreeNode;
var
  i: integer;
begin
  Result := nil;
  if Assigned(TreeView) and
     Assigned(TreeView.Items) then
    for i:=0 to TreeView.Items.Count-1 do
      if TObject(TreeView.Items[i].Data) = AObject then
      begin
        Result := TreeView.Items[i];
        Break;
      end;
end;

function TObjectBufferForm.GetObjects(i: integer): TfdcObject;
begin
  if TObject(TreeView.Items[i].Data) is TfdcObject then
    Result := TObject(TreeView.Items[i].Data) as TfdcObject
  else
    Result := nil;  
end;

function TObjectBufferForm.GetObjectsCount: integer;
begin
  Result := TreeView.Items.Count;
end;

procedure TObjectBufferForm.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  ObjectNode: TTreeNode;
begin
  inherited;
  if (Operation = opRemove) and
     (AComponent is TfdcObject) and
     (not (csDestroying in ComponentState)) then
  begin
    { remove object node }
    ObjectNode := FindObjectNode(AComponent as TfdcObject);
    if Assigned(ObjectNode) then
      ObjectNode.Delete;
  end;
end;

function TObjectBufferForm.AddObject(AObject: TfdcObject): TTreeNode;
begin
  Result := nil;
  if not Assigned(AObject) then Exit;

  { find object node }
  Result := FindObjectNode(AObject);

  { add object node }
  if not Assigned(Result) then
  begin
    Result := TreeView.Items.AddObject(nil, AObject.Caption, AObject);
    //if not Result.IsFirstNode then
    //  Result.MoveTo(TreeView.Items[0], naInsert);
    AObject.FreeNotification(Self);
  end;

  { update object node }
  Result.Text := AObject.Caption;
  Result.ImageIndex := AObject.ObjectType.ImageIndex;
  Result.SelectedIndex := Result.ImageIndex;

  { select object node }
  if (Visible) and
     (TreeView.Selected <> Result) then
    TreeView.Selected := Result;
end;

procedure TObjectBufferForm.AddObjects(AObjects: TfdcObjectList);
var
  i: integer;
begin
  for i:=0 to AObjects.Count-1 do
    AddObject(AObjects[i]);
end;

function TObjectBufferForm.GetDragObject(ASender: TObject): TfdcDragObject;
begin
  if Assigned(CurObject) and
     (not CurObject.IsNew) then
  begin
    InternalDragObject.Objects.Clear;
    InternalDragObject.Sender := ASender;
    InternalDragObject.Objects.Add(CurObject);
    Result := InternalDragObject;
  end else
    Result := nil;
end;

procedure TObjectBufferForm.RemoveCurObject;
begin
  if Assigned(TreeView.Selected) then
    TreeView.Selected.Delete;
end;

procedure TObjectBufferForm.Clear;
begin
  TreeView.Items.Clear;
end;

procedure TObjectBufferForm.TreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  DragObject := GetDragObject(Sender);
end;

procedure TObjectBufferForm.TreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept :=
    (Source is TfdcDragObject) and
    ((Source as TfdcDragObject).Sender <> Sender) and
    ((Source as TfdcDragObject).HasMultipleObjectsOfType('Object'));
end;

procedure TObjectBufferForm.TreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  AddObjects((Source as TfdcDragObject).Objects);
end;

procedure TObjectBufferForm.TreeViewDragDropTreeNode(Destination,
  Source: TTreeNode; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

procedure TObjectBufferForm.TreeViewDblClick(Sender: TObject);
begin
  inherited;
  if Assigned(ObjectServices) and
     Assigned(CurObject) then
    ObjectServices.OpenObject(CurObject.ID, nil);
end;

procedure TObjectBufferForm.TreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  inherited;
  if mbRight = Button then
  begin
    Node := TreeView.GetNodeAt(X, Y);
    if Assigned(Node) then
      TreeView.Selected := Node;
  end;    
end;

end.
