unit ContactFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls, cxMaskEdit, cxButtonEdit,
  fdcObjectLinkEdit;

type
  TContactForm = class(TObjectForm)
    edtOwnerObjectID: TfdcObjectLinkEdit;
    lcGeneralItem1: TdxLayoutItem;
    dsDataOWNERNAME: TStringField;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContactForm: TContactForm;

implementation

{$R *.dfm}

procedure TContactForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if IsNew then
  begin
    dsDataOWNER_OBJECT_ID.AsFloat := ParamByName('OMasterID').AsFloat;
    dsDataOWNERNAME.AsString := ParamByName('OMasterName').AsString;
  end;
end;

initialization
  RegisterClass(TContactForm);

end.

