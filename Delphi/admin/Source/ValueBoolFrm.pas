unit ValueBoolFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, cxCheckBox;

type
  TValueBoolForm = class(TValueForm)
    chbxNumValue: TcxDBCheckBox;
    lciNumValue: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueBoolForm: TValueBoolForm;

implementation

{$R *.dfm}

procedure TValueBoolForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataNUMVALUE.AsFloat := 0;
end;

initialization
  RegisterClass(TValueBoolForm);

end.
