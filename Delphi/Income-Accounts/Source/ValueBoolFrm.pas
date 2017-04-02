unit ValueBoolFrm;

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
  TValueBoolForm = class(TValueForm)
    chbxNumValue: TcxDBCheckBox;
    lciNumValue: TdxLayoutItem;
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
  ValueBoolForm: TValueBoolForm;

implementation

uses MainDm;

{$R *.dfm}

procedure TValueBoolForm.dsDataAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if IsNew then
    dsDataNUMVALUE.AsFloat := 0
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
    dsDataNUMVALUE.Value := LocValues.CallIntegerFunction('GetValueNum',
    [dsDataSYSNAME.Value, null, lType, lIdent, null]);
  end;
end;

procedure TValueBoolForm.actSaveExecute(Sender: TObject);
begin
  if (dsDataLOCALITY.Value > 0) then
    begin
      LocValues.CallProcedure('SetValueNum',
      [dsDataSYSNAME.Value, null, lType, lIdent, StrToInt(chbxNumValue.EditingValue)]);
      Modified := False;
    end
  else
    inherited;
end;

initialization
  RegisterClass(TValueBoolForm);

end.
