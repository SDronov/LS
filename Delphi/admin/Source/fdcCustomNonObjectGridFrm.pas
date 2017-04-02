unit fdcCustomNonObjectGridFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fdcCustomGridFrm, cxGraphics, Menus, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxBar, cxGridCustomPopupMenu, cxGridPopupMenu,
  FDCCustomDataset, fdcQuery, fdcParamsHolder, ImgList, cxLookAndFeels,
  cxContainer, dxLayoutLookAndFeels, ActnList, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, dxLayoutControl, cxButtons,
  ExtCtrls, cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, cxLabel,
  dxStatusBar, fdcObjectCore, fdcObjectServices;

type
  TfdcCustomNonObjectGridForm = class(TfdcCustomGridForm,IfdcNavigableForm)
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

  TfdcNavigableCustomGridFormAdapter = class(TfdcNavigableFormAdapter)
  private
    function GetOwnerForm: TfdcCustomNonObjectGridForm;
  public
    function GetItemImageIndex(AItem: TControl): integer; override;
    property OwnerForm: TfdcCustomNonObjectGridForm read GetOwnerForm;
  end;

{ *** TfdcNavigableCustomGridFormAdapter *** }  

function TfdcNavigableCustomGridFormAdapter.GetOwnerForm: TfdcCustomNonObjectGridForm;
begin
  Result := (inherited OwnerForm) as TfdcCustomNonObjectGridForm;
end;

function TfdcNavigableCustomGridFormAdapter.GetItemImageIndex(AItem: TControl): integer;
begin
//  Result := -1;
  if AItem = OwnerForm then
    Result := OwnerForm.ObjectServices.GetObjectTypeFactory.
      GetImageIndex(OwnerForm.SupportedTypeSysName)
  else
    Result := inherited GetItemImageIndex(AItem);
end;


{ *** TfdcCustomNonObjectGridForm *** }

procedure TfdcCustomNonObjectGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  FNavigableFormAdapter := TfdcNavigableCustomGridFormAdapter.Create(Self);
end;


procedure TfdcCustomNonObjectGridForm.FormDestroy(Sender: TObject);
begin
  inherited;
  FNavigableFormAdapter := nil;
end;

procedure TfdcCustomNonObjectGridForm.FormActivate(Sender: TObject);
begin
  inherited;
  Navigate;
end;


procedure TfdcCustomNonObjectGridForm.Navigate;
begin
  if Visible and
     Assigned(ObjectServices) and
     (FormStyle = fsMDIChild) then
    ObjectServices.NavigateForm(Self, False);
end;


function  TfdcCustomNonObjectGridForm.SupportedTypeSysName: string;
begin
  Result := 'DataChange';
end;



end.
 