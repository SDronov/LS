unit StateSchemeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  cxMemo, cxDBEdit, cxTextEdit, cxPC, cxControls, cxButtonEdit;

type
  TStateSchemeForm = class(TObjectForm)
    tabState: TcxTabSheet;
    tabStateTransit: TcxTabSheet;
    procedure tabStateShow(Sender: TObject);
    procedure tabStateTransitShow(Sender: TObject);
  private
    { Private declarations }

    { ссылки на дочерние формы списков }
    FStateGridForm: TForm;
    FStateTransitGridForm: TForm;
  public
    { Public declarations }
  end;

var
  StateSchemeForm: TStateSchemeForm;

implementation

{$R *.dfm}

procedure TStateSchemeForm.tabStateShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FStateGridForm) then
     FStateGridForm := ShowForm('TStateGridBySchemeForm', Params, tabState);
end;

procedure TStateSchemeForm.tabStateTransitShow(Sender: TObject);
begin
  inherited;
  if not Assigned(FStateTransitGridForm) then
     FStateTransitGridForm := ShowForm('TStateTransitGridBySchemeForm', Params, tabStateTransit);
end;

initialization
  RegisterClass(TStateSchemeForm);

end.
