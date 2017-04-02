unit ValueDateTimeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, cxCalendar;

type
  TValueDateTimeForm = class(TValueForm)
    edtDateTimeValue: TcxDBDateEdit;
    lciDateTimeValue: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueDateTimeForm: TValueDateTimeForm;

implementation

{$R *.dfm}

procedure TValueDateTimeForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataDATETIMEVALUE.AsDateTime := Now;
end;

initialization
  RegisterClass(TValueDateTimeForm);

end.
