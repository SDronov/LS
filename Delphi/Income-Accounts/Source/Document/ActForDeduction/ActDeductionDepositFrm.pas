unit ActDeductionDepositFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActDeductionFrm, cxGraphics, DB, FDCCustomDataset, fdcQuery,
  fdcParamsHolder, dxBar, ImgList, cxEdit, cxLookAndFeels, cxContainer,
  dxLayoutLookAndFeels, ActnList, StdCtrls, dxLayoutControl, cxCheckBox,
  cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxButtonEdit, fdcObjectLinkEdit,
  cxMaskEdit, cxMemo, cxTextEdit, cxPC, cxControls, OracleData,
  cxCurrencyEdit, xlcClasses, xlEngine, xlReport;

type
  TActDeductionDepositForm = class(TActDeductionForm)
    procedure dsDetailDepositBeforeOpen(DataSet: TDataSet);
  private
  protected
    function GetDocsFormClassName : string; override;
  public
    { Public declarations }
  end;

implementation

uses fdcCustomCardFrm;

{$R *.dfm}

{ TActDeductionDepositForm }

function TActDeductionDepositForm.GetDocsFormClassName: string;
begin
  Result := 'TActDeductionDocsDepositGridForm';
end;

procedure TActDeductionDepositForm.dsDetailDepositBeforeOpen(
  DataSet: TDataSet);
begin
  dsDetailDeposit.ParamByName('ACT_ID').AsInteger := dsDataID.AsInteger;
end;

initialization
  RegisterClass(TActDeductionDepositForm);
end.
