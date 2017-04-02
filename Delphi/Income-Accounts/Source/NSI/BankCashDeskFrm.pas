
unit BankCashDeskFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjectFrm, DB, FDCCustomDataset, fdcQuery, fdcParamsHolder,
  dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxMemo,
  cxDBEdit, cxTextEdit, cxPC, cxControls;

type
  TBankCashDeskForm = class(TObjectForm)
    procedure dsDataNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BankCashDeskForm: TBankCashDeskForm;

implementation

uses MainDm, fdcCustomObjectFrm;

{$R *.dfm}

procedure TBankCashDeskForm.dsDataNewRecord(DataSet: TDataSet);
begin
  inherited;
 dsDataOWNER_OBJECT_ID.Value := ParamByName('BANKCASH_ID').Value;
 dsDataACCESSLEVEL.Value := 2;
end;

initialization
  RegisterClass(TBankCashDeskForm);

end.
