unit fdcObjectServices;

interface

uses Windows, Classes, Controls, Forms, DB, Graphics, fdcObjectCore;

type

  { IfdcNavigableForm }
  IfdcNavigableForm = interface(IUnknown)
  ['{E379D6C2-E91C-46CA-923B-56F40554205C}']
    function GetRootItem: TControl;
    function GetSubItemCount(AItem: TControl): integer;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl;
    function GetItemCaption(AItem: TControl): string;
    function GetItemImageIndex(AItem: TControl): integer;
    //function GetActiveItem: TControl;
    procedure ActivateItem(AItem: TControl);

    function GetObject: TfdcObject;
  end;

  { TfdcNavigableFormAdapter }
  TfdcNavigableFormAdapter = class(TInterfacedObject, IfdcNavigableForm)
  private
    FOwnerForm: TForm;
  public
    constructor Create(AOwnerForm: TForm);

    function GetRootItem: TControl; virtual;
    function GetSubItemCount(AItem: TControl): integer; virtual;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl; virtual;
    function GetItemCaption(AItem: TControl): string; virtual;
    function GetItemImageIndex(AItem: TControl): integer; virtual;
    //function GetActiveItem: TControl; virtual;
    procedure ActivateItem(AItem: TControl); virtual;
    function GetObject: TfdcObject; virtual;

    property OwnerForm: TForm read FOwnerForm;
  end;

  { IfdcObjectServices }
  IfdcObjectServices = interface(IUnknown)
  ['{56C58975-85E9-4404-AED9-3AC66BF2C8A3}']
    function GetObjectFactory: TfdcObjectFactory;
    function GetObjectTypeFactory: TfdcObjectTypeFactory;
    function GetFileFactory: TfdcFileFactory;

    { objects suport }
    function CreateObject(ATypeSysName: string; ACheckChilds: boolean;
      AParams: TParams): TForm;
    function FindObject(AID: double): TForm;
    function OpenObject(AID: double; AParams: TParams): TForm;
    function SearchObject(ASearchFormClassName, ASearchTypeSysName: string;
      ASelectedObjectID: double; AParams: TParams; ASourceComponent: TComponent;
      ASearchMultiple: boolean; AOnSearchFinished: TOnSearchFinishedEvent): TForm;
    procedure FreeObject(AID: double);

    { forms suport }
    function ShowForm(AClassName: string; AParams: TParams; ADockSite: TWinControl): TForm;

    { navigator support }
    procedure NavigateForm(AForm: IfdcNavigableForm; AUpdateChilds: boolean);
  end;


  function GetObjectServices(RaiseError: Boolean = True): IfdcObjectServices;
  procedure SetObjectServices(Service: IfdcObjectServices);

implementation

uses
  SysUtils;

var
  FObjectService: IfdcObjectServices;

function GetObjectServices(RaiseError: Boolean = True): IfdcObjectServices;
begin
  Result := FObjectService;
  if (Result = nil) and RaiseError then
     raise Exception.Create('fdcObjectService не задана');
end;

procedure SetObjectServices(Service: IfdcObjectServices);
begin
  FObjectService := Service;
end;

{ TfdcNavigableFormAdapter }

constructor TfdcNavigableFormAdapter.Create(AOwnerForm: TForm);
begin
  inherited Create;
  FOwnerForm := AOwnerForm;
end;

function TfdcNavigableFormAdapter.GetRootItem: TControl;
begin
  Result := OwnerForm;
end;

function TfdcNavigableFormAdapter.GetSubItemCount(AItem: TControl): integer;
begin
  Result := 0;
end;

function TfdcNavigableFormAdapter.GetSubItem(AItem: TControl;
  AItemIndex: integer): TControl;
begin
  Result := nil;
end;

function TfdcNavigableFormAdapter.GetItemCaption(AItem: TControl): string;
begin
  if AItem = OwnerForm then
    Result := OwnerForm.Caption
  else
    Result := '';
end;

function TfdcNavigableFormAdapter.GetItemImageIndex(AItem: TControl): integer;
begin
  Result := -1;
end;

{function TfdcNavigableFormAdapter.GetActiveItem: TControl;
begin
  if OwnerForm.Active then
    Result := OwnerForm
  else
    Result := nil;
end;}

procedure TfdcNavigableFormAdapter.ActivateItem(AItem: TControl);
begin
  if (AItem = OwnerForm) and not (fsShowing	in OwnerForm.FormState) then
    OwnerForm.Show;
end;

function TfdcNavigableFormAdapter.GetObject: TfdcObject;
begin
  Result := nil;
end;

end.
