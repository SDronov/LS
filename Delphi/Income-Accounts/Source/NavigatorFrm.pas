{
  Copyright � Fors Development Center.
  All rights reserved.

  $Workfile: NavigatorFrm.pas $
  $Revision: 178 $
  $Author: alexvolo $
  $Date: 2005-08-25 16:05:59 +0400 (Чт, 25 авг 2005) $
}
unit NavigatorFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomFrm, ComCtrls, dxtree, cxEdit, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, fdcObjectCore, fdcObjectServices,
  ActnList;

type
  { TNavigatorForm }
  TNavigatorForm = class(TfdcCustomForm)
    TreeView: TdxTreeView;
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure TreeViewDragDropTreeNode(Destination, Source: TTreeNode;
      var Accept: Boolean);
  private
    { list of IfdcNavigableForm interfaces }
    FormInterfaces: IInterfaceList;
    { internal drag object }
    InternalDragObject: TfdcDragObject;

    function GetItem(ANode: TTreeNode): TControl;
    function GetFormNode(ANode: TTreeNode): TTreeNode;
    function AddItemNode(ANode: TTreeNode; AItem: TControl; AForm: IfdcNavigableForm;
      AUpdateChilds: boolean = True): TTreeNode;
    function FindItemNode(AItem: TControl): TTreeNode;
    function FindFormInterface(AItem: TControl): IfdcNavigableForm;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function AutoSaveLayout: boolean; override;

    function GetDragObject(ASender: TObject): TfdcDragObject;
    procedure Navigate(AForm: IfdcNavigableForm; AUpdateChilds: boolean = True);
  end;

var
  NavigatorForm: TNavigatorForm;

implementation

{$R *.dfm}

{ TNavigatorForm }

function TNavigatorForm.GetItem(ANode: TTreeNode): TControl;
begin
  if (Assigned(ANode.Data)) and
     (TObject(ANode.Data) is TControl) then
    Result := TObject(ANode.Data) as TControl
  else
    Result := nil;
end;

function TNavigatorForm.GetFormNode(ANode: TTreeNode): TTreeNode;
var
  Node: TTreeNode;
begin
  Result := nil;
  Node := ANode;
  while Assigned(Node) do
  begin
    if Assigned(Node.Data) and
      (TObject(Node.Data) is TControl) then begin
      if Assigned(FindFormInterface(TObject(Node.Data) as TControl)) then
      begin
        Result := Node;
        Break;
      end
    end;
    Node := Node.Parent;
  end;
end;

function TNavigatorForm.AddItemNode(ANode: TTreeNode; AItem: TControl;
  AForm: IfdcNavigableForm; AUpdateChilds: boolean = True): TTreeNode;
var
  i: integer;
begin
  Result := nil;
  if (not Assigned(AItem)) or
     (not Assigned(AForm)) then Exit;

  { set free notification for the root item }
  AForm.GetRootItem.FreeNotification(Self);

  { add form to interface list }
  if FormInterfaces.IndexOf(AForm) = -1 then
    FormInterfaces.Add(AForm);

  { find item node }
  Result := FindItemNode(AItem);

  { add item node if it does not exists }
  if not Assigned(Result) then
    if not Assigned(ANode) then
      Result := TreeView.Items.AddObject(ANode, AForm.GetItemCaption(AItem), AItem)
    else
      Result := TreeView.Items.AddChildObject(ANode, AForm.GetItemCaption(AItem), AItem);

  { update item node }
  Result.Text := AForm.GetItemCaption(AItem);
  Result.ImageIndex := AForm.GetItemImageIndex(AItem);
  Result.SelectedIndex := Result.ImageIndex;

  { add child nodes }
  if AUpdateChilds then
    for i:=0 to AForm.GetSubItemCount(AItem)-1 do
      AddItemNode(Result, AForm.GetSubItem(AItem, i), AForm);
end;

function TNavigatorForm.FindItemNode(AItem: TControl): TTreeNode;
var
  i: integer;
begin
  Result := nil;
  if Assigned(TreeView) and
     Assigned(TreeView.Items) then
    for i:=0 to TreeView.Items.Count-1 do
      if TreeView.Items[i].Data = AItem then
      begin
        Result := TreeView.Items[i];
        Break;
      end;
end;

function TNavigatorForm.FindFormInterface(AItem: TControl):
  IfdcNavigableForm;
var
  i: integer;
begin
  Result := nil;
  if Assigned(FormInterfaces) and
     Assigned(AItem) then
    for i:=0 to FormInterfaces.Count-1 do
      if ((IfdcNavigableForm(FormInterfaces[i])).GetRootItem = AItem) then
      begin
        Result := IfdcNavigableForm(FormInterfaces[i]);
        Break;
      end;
end;

procedure TNavigatorForm.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  Node: TTreeNode;
  Form: IfdcNavigableForm;
begin
  inherited;
  if (Operation = opRemove) and
     (AComponent is TControl) and
     (not (csDestroying in ComponentState)) then
  begin
    { remove node }
    Node := FindItemNode(AComponent as TControl);
    if Assigned(Node) then
      Node.Delete;
    { remove interface }
    Form := FindFormInterface(AComponent as TControl);
    if Assigned(Form) then
      FormInterfaces.Remove(Form);
  end;
end;

constructor TNavigatorForm.Create(AOwner: TComponent);
begin
  inherited;
  FormInterfaces := TInterfaceList.Create;
  InternalDragObject := TfdcDragObject.Create;
end;

destructor TNavigatorForm.Destroy;
begin
  FormInterfaces := nil;
  InternalDragObject.Free;
  inherited;
end;

function TNavigatorForm.AutoSaveLayout: boolean;
begin
  Result := False;
end;

function TNavigatorForm.GetDragObject(ASender: TObject): TfdcDragObject;
var
  CurForm: IfdcNavigableForm;
  CurObject: TfdcObject;
begin
  { get cur object }
  CurForm := FindFormInterface(GetItem(GetFormNode(TreeView.Selected)));
  if Assigned(CurForm) then
    CurObject := CurForm.GetObject
  else
    CurObject := nil;  

  { prepare drag object }
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

procedure TNavigatorForm.Navigate(AForm: IfdcNavigableForm;
  AUpdateChilds: boolean = True);
var
  NewFormNode, OldFormNode: TTreeNode;
begin
  NewFormNode := GetFormNode(AddItemNode(nil, AForm.GetRootItem, AForm, AUpdateChilds));
  OldFormNode := GetFormNode(TreeView.Selected);
  if CanFocus and(Visible) and
     (NewFormNode <> OldFormNode) then
    TreeView.Selected := NewFormNode;
end;

procedure TNavigatorForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
var
  Form: IfdcNavigableForm;
  Item: TControl;
begin
  inherited;
  Form := FindFormInterface(GetItem(GetFormNode(Node)));
  Item := GetItem(Node);
  if Assigned(Form) and
     Assigned(Item) and CanFocus then
  begin
    Form.ActivateItem(Item);
    TreeView.SetFocus;
  end;
end;

procedure TNavigatorForm.TreeViewStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  DragObject := GetDragObject(Sender);
end;

procedure TNavigatorForm.TreeViewDragDropTreeNode(Destination,
  Source: TTreeNode; var Accept: Boolean);
begin
  inherited;
  Accept := False;
end;

end.
