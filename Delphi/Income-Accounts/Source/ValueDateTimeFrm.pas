unit ValueDateTimeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, cxCalendar, Oracle;

type
  TValueDateTimeForm = class(TValueForm)
    edtDateTimeValue: TcxDBDateEdit;
    lciDateTimeValue: TdxLayoutItem;
    procedure dsDataAfterOpen(DataSet: TDataSet);
    procedure actSaveExecute(Sender: TObject);
  private
    lType : string;
    lIdent : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValueDateTimeForm: TValueDateTimeForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TValueDateTimeForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataDATETIMEVALUE.AsDateTime := Now
  else if (dsDataLOCALITY.Value > 0) then
  begin
    if (dsDataLOCALITY.Value = 1) then
      begin
        lType := 'Cust';
        lIdent := LocValues.CallStringFunction('GetUserCust', [MainData.Session.LogonUsername]);
      end
    else if (dsDataLOCALITY.Value = 2) then
      begin
        lType := 'User';
        lIdent := MainData.Session.LogonUsername;
      end;
    dsDataDATETIMEVALUE.Value := LocValues.CallDateFunction('GetValueDate',
    [dsDataSYSNAME.Value, null, lType, lIdent, null]);
  end;
end;

procedure TValueDateTimeForm.actSaveExecute(Sender: TObject);
begin
  if (dsDataLOCALITY.Value > 0) then
    begin
      LocValues.CallProcedure('SetValueDate',
      [dsDataSYSNAME.Value, null, lType, lIdent, StrToDate(edtDateTimeValue.EditingValue)]);
      Modified := False;
    end
  else
    inherited;
end;

initialization
  RegisterClass(TValueDateTimeForm);

end.
