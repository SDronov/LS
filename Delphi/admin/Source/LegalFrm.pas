unit LegalFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PersonFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSpinEdit, cxDBEdit, cxMaskEdit, cxCalendar, cxMemo, cxTextEdit, cxPC,
  cxControls;

type
  TLegalForm = class(TPersonForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LegalForm: TLegalForm;

implementation

{$R *.dfm}

initialization
  RegisterClass(TLegalForm);

end.
