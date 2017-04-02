unit ValueNumberFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, cxSpinEdit, cxDBEdit, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC, cxControls;

type
  TValueNumberForm = class(TValueForm)
    edtNumValue: TcxDBSpinEdit;
    lciNumValue: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueNumberForm: TValueNumberForm;

implementation

{$R *.dfm}

procedure TValueNumberForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataNUMVALUE.AsFloat := 0;
end;

initialization
  RegisterClass(TValueNumberForm);

end.
