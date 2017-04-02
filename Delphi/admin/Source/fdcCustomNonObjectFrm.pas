unit fdcCustomNonObjectFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomCardFrm, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, dxLayoutControl, cxPC, cxControls,
  fdcObjectCore, fdcObjectServices;

type
  TfdcCustomNonObjectForm = class(TfdcCustomCardForm,IfdcNavigableForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
  protected
    FObjectServices: IfdcObjectServices;
    FNavigableFormAdapter: IfdcNavigableForm;
  public
    procedure Navigate;
    function  SupportedTypeSysName: string; virtual;
  published
    property NavigableFormAdapter: IfdcNavigableForm read FNavigableFormAdapter implements IfdcNavigableForm;
    property ObjectServices: IfdcObjectServices read FObjectServices write FObjectServices;
  end;

implementation

{$R *.dfm}


type

  TfdcNavigableCustomFormAdapter = class(TfdcNavigableFormAdapter)
  private
    function GetOwnerForm: TfdcCustomNonObjectForm;
  public
    function GetSubItemCount(AItem: TControl): integer; override;
    function GetSubItem(AItem: TControl; AItemIndex: integer): TControl; override;
    procedure ActivateItem(AItem: TControl); override;

    function GetItemImageIndex(AItem: TControl): integer; override;
    property OwnerForm: TfdcCustomNonObjectForm read GetOwnerForm;
  end;


{ *** TfdcNavigableCustomFormAdapter *** }  

function TfdcNavigableCustomFormAdapter.GetOwnerForm: TfdcCustomNonObjectForm;
begin
  Result := (inherited OwnerForm) as TfdcCustomNonObjectForm;
end;

function TfdcNavigableCustomFormAdapter.GetItemImageIndex(AItem: TControl): integer;
begin
//  Result := -1;
  if AItem = OwnerForm then
    Result := OwnerForm.ObjectServices.GetObjectTypeFactory.
      GetImageIndex(OwnerForm.SupportedTypeSysName)
  else
    Result := inherited GetItemImageIndex(AItem);
end;

function TfdcNavigableCustomFormAdapter.GetSubItemCount(AItem: TControl): integer;
begin
  Result := 1;
end;

function TfdcNavigableCustomFormAdapter.GetSubItem(AItem: TControl; AItemIndex: integer): TControl;
begin
  Result := OwnerForm.tabGeneral;
end;

procedure TfdcNavigableCustomFormAdapter.ActivateItem(AItem: TControl);
begin
  inherited ActivateItem(AItem);
end;



{ *** TfdcCustomNonObjectForm *** }

procedure TfdcCustomNonObjectForm.FormCreate(Sender: TObject);
begin
  inherited;
  FNavigableFormAdapter := TfdcNavigableCustomFormAdapter.Create(Self);
end;


procedure TfdcCustomNonObjectForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FNavigableFormAdapter := nil;
end;


procedure TfdcCustomNonObjectForm.FormActivate(Sender: TObject);
begin
  inherited;
  Navigate;
end;


procedure TfdcCustomNonObjectForm.Navigate;
begin
  if Visible and
     Assigned(ObjectServices) and
     (FormStyle = fsMDIChild) then
    ObjectServices.NavigateForm(Self, False);
end;


function  TfdcCustomNonObjectForm.SupportedTypeSysName: string;
begin
  Result := 'DataChange';
end;


end.
