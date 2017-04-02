unit ValueStringFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ValueFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, cxMaskEdit,
  cxButtonEdit, cxDBEdit, fdcObjectLinkEdit, cxMemo, cxTextEdit, cxPC,
  cxControls, cxCheckBox, Oracle;

type
  TValueStringForm = class(TValueForm)
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
  ValueStringForm: TValueStringForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TValueStringForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if (dsDataLOCALITY.Value > 0) then
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
    dsDataSTRINGVALUE.Value := LocValues.CallStringFunction('GetValueStr',
    [dsDataSYSNAME.Value, null, lType, lIdent, null]);
  end;
end;

procedure TValueStringForm.actSaveExecute(Sender: TObject);
begin
  if (dsDataLOCALITY.Value > 0) then
    begin
      LocValues.CallProcedure('SetValueStr',
      [dsDataSYSNAME.Value, null, lType, lIdent, edtStringValue.EditingValue]);
      Modified := False;
    end
  else
    inherited;
end;

initialization
  RegisterClass(TValueStringForm);

end.
