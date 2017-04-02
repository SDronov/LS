{
  Copyright © Fors Development Center.
  All rights reserved.

  $Workfile: ObjectFrm.pas $
  $Revision: 3 $
  $Author: alexvolo $
  $Date: 2005-07-18 16:23:50 +0400 (РџРЅ, 18 РёСЋР» 2005) $
}
unit ObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, fdcCustomObjectFrm, DB, FDCCustomDataset, FDCQuery,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer, cxDropDownEdit,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMemo, cxDBEdit,
  cxTextEdit, cxPC, cxControls, fdcParamsHolder, cxButtonEdit;

type
  TObjectForm = class(TfdcCustomObjectForm)
    lblFake: TLabel;
    pcService: TcxPageControl;
    tabService: TcxTabSheet;
    tabHistory: TcxTabSheet;
    tabAccess: TcxTabSheet;
    tabFake: TcxTabSheet;
    tabValues: TcxTabSheet;
    tabChildObjects: TcxTabSheet;
    tabRelations: TcxTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tabServiceShow(Sender: TObject);
    procedure tabAccessShow(Sender: TObject);
    procedure tabValuesShow(Sender: TObject);
    procedure tabChildObjectsShow(Sender: TObject);
    procedure tabHistoryShow(Sender: TObject);
    procedure tabRelationsShow(Sender: TObject);
  private
    { ссылки на дочерние формы списков }
    FGrantGridForm: TForm;
    FValueGridForm: TForm;
    FChildObjectGridForm: TForm;
    FEventGridForm: TForm;
    FRelationGridForm: TForm;
  protected
    function GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass; override;
  public
    { Public declarations }
  end;

var
  ObjectForm: TObjectForm;

implementation

uses MainDm;

{$R *.dfm}

type

  { TfdcNavigableObjectFormAdapter }
  TfdcNavigableObjectFormAdapter = class(TfdcNavigableCustomObjectFormAdapter)
  private
    function GetOwnerForm: TObjectForm;
  public
    function GetSubItemCount(AItem: TControl): integer; override;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl; override;
    //function GetActiveItem: TControl; override;
    procedure ActivateItem(AItem: TControl); override;

    property OwnerForm: TObjectForm read GetOwnerForm;
  end;

{ TfdcNavigableObjectFormAdapter }

function TfdcNavigableObjectFormAdapter.GetOwnerForm: TObjectForm;
begin
  Result := (inherited OwnerForm) as TObjectForm;
end;

function TfdcNavigableObjectFormAdapter.GetSubItemCount(
  AItem: TControl): integer;
begin
  if AItem = OwnerForm.tabService then
    Result := OwnerForm.pcService.TabCount
  else
    Result := inherited GetSubItemCount(AItem);
end;

function TfdcNavigableObjectFormAdapter.GetSubItem(
  AItem: TControl; AItemIndex: integer): TControl;
begin
  if AItem = OwnerForm.tabService then
    Result := OwnerForm.pcService.Pages[OwnerForm.pcService.Tabs[AItemIndex].Index]
  else
    Result := inherited GetSubItem(AItem, AItemIndex);
end;

{function TfdcNavigableObjectFormAdapter.GetActiveItem: TControl;
begin
  if Assigned(OwnerForm.pcService.ActivePage) and
     OwnerForm.pcService.ActivePage.TabShowing then
    Result := OwnerForm.pcService.ActivePage
  else
  if Assigned(OwnerForm.pcMain.ActivePage) and
     OwnerForm.pcMain.ActivePage.TabShowing then
    Result := OwnerForm.pcMain.ActivePage
  else
    Result := inherited GetActiveItem;
end;}

procedure TfdcNavigableObjectFormAdapter.ActivateItem(AItem: TControl);
begin
  inherited ActivateItem(AItem);

  if (AItem is TcxTabSheet) and
     ((AItem as TcxTabSheet).PageControl = OwnerForm.pcService) then
    OwnerForm.pcMain.ActivePage := OwnerForm.tabService;
end;

{ TObjectForm }

function TObjectForm.GetNavigableFormAdapterClass: TfdcNavigableFormAdapterClass;
begin
  Result := TfdcNavigableObjectFormAdapter;
end;

procedure TObjectForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetSession(MainData.Session);
end;

procedure TObjectForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if Assigned(FValueGridForm) and
     Assigned(FValueGridForm.OnCloseQuery) then
    FValueGridForm.OnCloseQuery(Self, CanClose);
end;

procedure TObjectForm.tabServiceShow(Sender: TObject);
var
  ActivePage: TcxTabSheet;
begin
  inherited;
  { force to show active page }
  ActivePage := pcService.ActivePage;
  pcService.ActivePage := tabFake;
  pcService.ActivePage := ActivePage;
end;

procedure TObjectForm.tabAccessShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FGrantGridForm) then
    FGrantGridForm := ShowForm('TObjectGrantGridForm', Params, tabAccess);
end;                            

procedure TObjectForm.tabValuesShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FValueGridForm) then
     FValueGridForm := ShowForm('TValueGridByObjectForm', Params, tabValues);
end;

procedure TObjectForm.tabChildObjectsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FChildObjectGridForm) then
     FChildObjectGridForm := ShowForm('TObjectGridByOwnerForm', Params, tabChildObjects);
end;

procedure TObjectForm.tabHistoryShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FEventGridForm) then
    FEventGridForm := ShowForm('TEventGridByObjectForm', Params, tabHistory);
end;

procedure TObjectForm.tabRelationsShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FRelationGridForm) then
     FRelationGridForm := ShowForm('TObjectRelationGridByObjectForm', Params, tabRelations);
end;

initialization
  RegisterClass(TObjectForm);

end.
