unit ObjectGridTreeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ObjectGridFrm, cxGraphics, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, fdcQuery,
  FDCCustomDataset, fdcParamsHolder, ImgList, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, dxLayoutControl, cxTextEdit, cxButtons, ExtCtrls, ComCtrls,
  cxProgressBar, cxMaskEdit, cxSpinEdit, cxLabel, dxStatusBar, dxtree,
  dxdbtree, fdcDBTreeView, dxDockControl, dxDockPanel, Menus;

type
  TObjectGridTreeForm = class(TObjectGridForm)
    dxBarDockControl2: TdxBarDockControl;
    actOpenType: TAction;
    actAddType: TAction;
    actDelType: TAction;
    actRefreshTree: TAction;
    dsDataROOT_TYPE_ID: TFloatField;
    dsDataROOT_SYSNAME: TStringField;
    actChangeSysName: TAction;
    btnChangeSysName: TdxBarButton;
    dsChangeSysName: TfdcQuery;
    actHighlightLat: TAction;
    miHighlightLat: TdxBarButton;
    pmnTypeTree: TdxBarPopupMenu;
    btnOpenType: TdxBarButton;
    btnAddType: TdxBarButton;
    btnDelType: TdxBarButton;
    btnRefreshTree: TdxBarButton;
    pnlTypeTree: TdxDockPanel;
    LeftDockSite: TdxDockSite;
    tvTypeTree: TfdcDBTreeView;
    RightDockSite: TdxDockSite;
    DockingManager: TdxDockingManager;
    dxLayoutDockSite1: TdxLayoutDockSite;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvTypeTreeGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvTypeTreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actRefreshTreeUpdate(Sender: TObject);
    procedure actRefreshTreeExecute(Sender: TObject);
    procedure tvTypeTreeChange(Sender: TObject; Node: TTreeNode);
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actOpenTypeUpdate(Sender: TObject);
    procedure actOpenTypeExecute(Sender: TObject);
    procedure actAddTypeUpdate(Sender: TObject);
    procedure actAddTypeExecute(Sender: TObject);
    procedure actDelTypeUpdate(Sender: TObject);
    procedure actDelTypeExecute(Sender: TObject);
    procedure actChangeSysNameExecute(Sender: TObject);
    procedure grdDataDBBandedTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure actHighlightLatExecute(Sender: TObject);
    procedure tvTypeTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ObjectGridTreeForm: TObjectGridTreeForm;

implementation

uses MainDm, fdcUtils, fdcCustomObjectFrm, fdcMessages, Oracle;

{$R *.dfm}

procedure TObjectGridTreeForm.FormShow(Sender: TObject);
begin
  inherited;
  tvTypeTree.Images := ObjectServices.GetObjectTypeFactory.ImageList;

  with tvTypeTree do
  begin
    Open;
    if (Count > 0) then
    begin
      Selected := Node[0].TreeNode;
      Selected.Expand(false);
    end;
  end;
end;

procedure TObjectGridTreeForm.FormCreate(Sender: TObject);
begin
  inherited;

  tvTypeTree.Session := MainData.Session;
end;

procedure TObjectGridTreeForm.tvTypeTreeGetImageIndex(Sender: TObject;
  Node: TTreeNode);
var
  n: TfdcDBNode;
begin
  inherited;

  if not Assigned(Node.Data) then
    exit;
  n := TfdcDBNode(Node.Data);
  Node.ImageIndex := ObjectServices.GetObjectTypeFactory.GetImageIndex(n.ID);
  Node.SelectedIndex := ObjectServices.GetObjectTypeFactory.GetImageIndex(n.ID);
end;

procedure TObjectGridTreeForm.tvTypeTreeExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;

  if (Node <> tvTypeTree.Selected) then
    tvTypeTree.Selected := Node;
end;

procedure TObjectGridTreeForm.actRefreshTreeUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
    Assigned(tvTypeTree.Session) and
    tvTypeTree.Session.Connected;
end;

procedure TObjectGridTreeForm.actRefreshTreeExecute(Sender: TObject);
begin
  inherited;
  tvTypeTree.Selected := nil;
  tvTypeTree.Clear;
  tvTypeTree.ReloadChildren(nil);
end;

procedure TObjectGridTreeForm.tvTypeTreeChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;

  if not Assigned(tvTypeTree.CurNode) then
  begin
    dsData.Close;
    exit;
  end;

  dsData.ParamByName('ID').asFloat := tvTypeTree.CurNode.ID;
  dsData.ReQuery;

  if (tvTypeTree.CurNode.Params.ParamByName('ObjectTableInstance').asInteger = 0)
    then
  begin
    //       lblProgress.Style.TextColor := clRed;
    ShowProgress('Не инстанцирован в объектах!');
  end
  else
  begin
    //       lblProgress.Style.TextColor := clWindowText;
    HideProgress;
  end;
end;

procedure TObjectGridTreeForm.actAddUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(tvTypeTree.CurNode);
end;

procedure TObjectGridTreeForm.actAddExecute(Sender: TObject);
begin
  RegisterAsWaiterFor(ObjectServices.CreateObject(tvTypeTree.CurNode.
    Params.ParamByName('SysName').asString, True, Params));
end;

procedure TObjectGridTreeForm.actOpenTypeUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(tvTypeTree.CurNode);
end;

procedure TObjectGridTreeForm.actOpenTypeExecute(Sender: TObject);
begin
  inherited;
  ObjectServices.OpenObject(tvTypeTree.CurNode.ID, nil);
end;

procedure TObjectGridTreeForm.actAddTypeUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(tvTypeTree.CurNode);
end;

procedure TObjectGridTreeForm.actAddTypeExecute(Sender: TObject);
var
  F: TfdcCustomObjectForm;
begin
  inherited;

  F := ObjectServices.CreateObject('ObjectType', TRUE, nil) as
    TfdcCustomObjectForm;
  if not Assigned(F) then
    exit;

  F.dsData.FieldByName('Parent_Object_Type_ID').asFloat := tvTypeTree.CurNode.ID;
  F.dsData.FieldByName('ParentTypeName').asString := tvTypeTree.CurNode.Text;
end;

procedure TObjectGridTreeForm.actDelTypeUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := (Sender as TAction).Visible and
     Assigned(tvTypeTree.CurNode);
end;

procedure TObjectGridTreeForm.actDelTypeExecute(Sender: TObject);
begin
  inherited;

  if WarningDlg('Удалить тип ' + tvTypeTree.CurNode.Text,
    'Если Вы уверены что хотите удалить выбранный тип нажмите "Да", иначе нажмите "Нет"',
    '') = mrYes then
  begin
    ObjectServices.FreeObject(tvTypeTree.CurNode.ID);

    if Assigned(tvTypeTree.CurNode.Parent) then
      tvTypeTree.CurNode.Parent.ReLoadChildren;
  end;
end;

procedure TObjectGridTreeForm.actChangeSysNameExecute(Sender: TObject);
var
  s: string;
begin
  inherited;

  if (dsDataID.asFloat < 1) then
    exit;

  s := dsDataSysName.asString;
  if not InputQuery('Изменение системного имени объекта ' +
    dsDataTypeName.asString + ' ' +
    dsDataName.asString,
    'Системное имя', s) then
    exit;

  if WarningDlg(
    'Изменение системного имени. Продолжить?',
    'Изменение системного имени объекта ' +
    dsDataTypeName.asString + ' ' + dsDataName.asString + ' ' +
    'может привести с нестабильности в работе системы. ' +
    'Если Вы уверены в корректности данного действия нажмите "Да", иначе нажмите "Нет".',
    'Для изменения системных имен объектов пользователь должен иметь привилегии администратора'
    ) = mrYes then
  begin
    dsChangeSysName.ParamByName('ID').asFloat := dsDataID.asFloat;
    dsChangeSysName.ParamByName('SysName').asString := s;
    dsChangeSysName.execSQL;
    dsData.ReQuery;
  end;
end;

procedure TObjectGridTreeForm.grdDataDBBandedTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if actHighlightLat.Checked then
    if (AViewInfo.Item = grdDataDBBandedTableViewNAME) then
    begin
      ADone := FALSE;
      try
        HighlightEAlpha(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[AViewInfo.Item.Index]),
          ACanvas.Canvas, AViewInfo.Bounds, clRed, [fsBold]);
      finally
        ADone := TRUE;
      end;
    end;
end;

procedure TObjectGridTreeForm.actHighlightLatExecute(Sender: TObject);
begin
  inherited;
  actHighlightLat.Checked := not actHighlightLat.Checked;
  grdDataDBBandedTableView.ViewChanged;
end;

procedure TObjectGridTreeForm.tvTypeTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
  inherited;
  if mbRight = Button then
  begin
    Node := tvTypeTree.GetNodeAt(X, Y);
    if Assigned(Node) then
      tvTypeTree.Selected := Node;
    pmnTypeTree.PopupFromCursorPos;
  end;
end;

initialization
  RegisterClass(TObjectGridTreeForm);

end.

