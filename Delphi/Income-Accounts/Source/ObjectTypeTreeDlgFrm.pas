unit ObjectTypeTreeDlgFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomSimpleDlgFrm, cxLookAndFeelPainters, cxEdit,
  cxLookAndFeels, cxContainer, dxLayoutLookAndFeels, ActnList,
  dxLayoutControl, StdCtrls, cxButtons, ExtCtrls, cxControls, ComCtrls,
  Menus, fdcQuery, fdcObjectCore, fdcStringsHolder, fdcDBTreeView, ImgList,
  fdcObjectServices;

type
  TObjectTypeTreeDlgForm = class(TfdcCustomSimpleDlgForm)
    dsRootQuery: TfdcStringsHolder;
    dxLayoutControl1Item1: TdxLayoutItem;
    fdcDBTree: TfdcDBTreeView;
    pmTree: TPopupMenu;
    ReLoadItm: TMenuItem;
    imglAction: TImageList;
    actReload: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fdcDBTreeQueryBeforeOpen(Sender: TObject; fdcDBNode: TfdcDBNode;
      Query: TfdcQuery);
    procedure fdcDBTreeGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure fdcDBTreeDblClick(Sender: TObject);
    procedure actReloadExecute(Sender: TObject);
    procedure actOkUpdate(Sender: TObject);
  private
    { Private declarations }

    FObjectServices: IfdcObjectServices;
    procedure UpdateNodesStatus;
  public
    { Public declarations }

    property ObjectServices: IfdcObjectServices read FObjectServices write FObjectServices;
  end;

var
  ObjectTypeTreeDlgForm: TObjectTypeTreeDlgForm;

function ExecObjectTypeDlg(ARootType: TfdcObjectType; AObjectServices: IfdcObjectServices; ADlgCaption: string = ''): TfdcObjectType;

implementation

uses MainDm;
{$R *.dfm}

function ExecObjectTypeDlg(ARootType: TfdcObjectType; AObjectServices: IfdcObjectServices; ADlgCaption: string = ''): TfdcObjectType;
var f: TObjectTypeTreeDlgForm;
begin
  result := nil;

  if not Assigned(ARootType) then
	   raise Exception.create(' ласс не задан');

  Application.CreateForm(TObjectTypeTreeDlgForm, f);

  try
	  if trim(ADlgCaption) = '' then
		   f.Caption := '”кажите тип'
     else
	     f.Caption := ADlgCaption;

    f.ObjectServices := AObjectServices;
	  f.fdcDBTree.DefaultParams.ParamByName('ID').asFloat := ARootType.ID;
	  if (f.ShowModal <> mrOK) or (not Assigned(f.fdcDBTree.CurNode)) then exit;

	  result := f.ObjectServices.GetObjectTypeFactory.Find(f.fdcDBTree.CurNode.ID);
  finally
    f.free;
  end;
end;

procedure TObjectTypeTreeDlgForm.FormCreate(Sender: TObject);
begin
  inherited;

  fdcDBTree.Session := MainData.Session;
end;

procedure TObjectTypeTreeDlgForm.FormShow(Sender: TObject);
begin
  inherited;

  fdcDBTree.Images := ObjectServices.GetObjectTypeFactory.ImageList;
  fdcDBTree.Open;
  fdcDBTree.FullLoad(TRUE);
  UpdateNodesStatus;
  if (fdcDBTree.Count > 0) then
     fdcDBTree.Selected := fdcDBTree.Node[0].TreeNode;
end;

procedure TObjectTypeTreeDlgForm.UpdateNodesStatus;
var
  K: Integer;

  procedure IterateNode(Node : TfdcDBNode);
  var
    I: Integer;
    ObjType: TfdcObjectType;
  begin
   ObjType := ObjectServices.GetObjectTypeFactory.Find(Node.ID);
   if ObjType <> nil then
       Node.TreeNode.Cut := ObjType.IsAbstract;
   for I := Node.ChildCount - 1 downto 0 do    // Iterate
      IterateNode(Node.Child[i]);
   if not Node.HasChildren and Node.TreeNode.Cut then
        Node.TreeNode.Free;
  end;
begin
    for K := 0 to fdcDBTree.Count - 1 do    // Iterate
      IterateNode(fdcDBTree.Node[K]);
end;

procedure TObjectTypeTreeDlgForm.fdcDBTreeQueryBeforeOpen(Sender: TObject;
  fdcDBNode: TfdcDBNode; Query: TfdcQuery);
begin
  inherited;

  if (fdcDBTree.Count = 0) then
	   Query.SQL.text := dsRootQuery.Text;
end;

procedure TObjectTypeTreeDlgForm.fdcDBTreeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
var n : TfdcDBNode;
begin
  inherited;

  if not Assigned(Node.Data) then exit;
  n := TfdcDBNode(Node.Data);
  Node.ImageIndex := ObjectServices.GetObjectTypeFactory.GetImageIndex(n.ID);
  Node.SelectedIndex := ObjectServices.GetObjectTypeFactory.GetImageIndex(n.ID);
end;

procedure TObjectTypeTreeDlgForm.fdcDBTreeDblClick(Sender: TObject);
begin
  inherited;

  if Assigned(fdcDBTree.CurNode) and (not fdcDBTree.Selected.Cut) then
     ModalResult := mrOk;
end;

procedure TObjectTypeTreeDlgForm.actReloadExecute(Sender: TObject);
begin
  inherited;

  if Assigned(fdcDBTree.CurNode) then
     fdcDBTree.CurNode.ReLoadChildren;
end;

procedure TObjectTypeTreeDlgForm.actOkUpdate(Sender: TObject);

begin
  inherited;
  TAction(Sender).Enabled := (fdcDBTree.Selected <> nil) and (not fdcDBTree.Selected.Cut)
end;

initialization
  RegisterClass(TObjectTypeTreeDlgForm);

end.
